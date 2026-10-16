#!/usr/bin/env python3
"""Stdlib regression checks. Run: python3 scripts/test-tooling.py"""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

REPO = Path(__file__).resolve().parents[1]
SKILL = "creative-frontend-director"


class ToolingTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="cfd-tooling-")
        self.root = Path(self.temp.name).resolve()
        self.addCleanup(self.temp.cleanup)

    def run_script(self, script, *args, env=None):
        return subprocess.run(["bash", str(script), *map(str, args)], text=True,
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                              env=env, timeout=20)

    def check(self, text, *args, filename="view with spaces.css"):
        path = self.root / filename
        path.write_text(text)
        return self.run_script(REPO / "scripts/check-tokens.sh", self.root, *args)

    def fixture(self):
        source = self.root / "source" / SKILL
        (source / "scripts").mkdir(parents=True)
        (source / "hooks").mkdir()
        shutil.copy2(REPO / "scripts/install.sh", source / "scripts/install.sh")
        (source / "hooks/frontend-intent-hook.sh").write_text("#!/bin/sh\n")
        (source / "SKILL.md").write_text("new skill")
        return source

    def test_self_install_rejected_without_destroying_source(self):
        source = self.fixture()
        result = self.run_script(source / "scripts/install.sh", source.parent)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertEqual((source / "SKILL.md").read_text(), "new skill")

    def test_nested_and_symlink_destinations_rejected(self):
        source = self.fixture()
        for root in (source / "nested", self.root / "alias"):
            if root.name == "alias":
                root.symlink_to(source.parent, target_is_directory=True)
            result = self.run_script(source / "scripts/install.sh", root)
            self.assertNotEqual(result.returncode, 0, result.stdout)
            self.assertEqual((source / "SKILL.md").read_text(), "new skill")
        outside = self.root / "outside"
        outside.mkdir()
        (outside / SKILL).symlink_to(source, target_is_directory=True)
        self.assertEqual(self.run_script(source / "scripts/install.sh", outside).returncode, 0)
        self.assertEqual((source / "SKILL.md").read_text(), "new skill")

    def test_copy_failure_preserves_old_install(self):
        source = self.fixture()
        # Dangling source link deterministically fails copy without permissions tricks.
        (source / "broken").symlink_to(source / "missing")
        target = self.root / "installed" / SKILL
        target.mkdir(parents=True)
        (target / "sentinel").write_text("old install")
        result = self.run_script(source / "scripts/install.sh", target.parent)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertEqual((target / "sentinel").read_text(), "old install")

    def test_publish_failure_rolls_back_old_install(self):
        source = self.fixture()
        target = self.root / "installed" / SKILL
        target.mkdir(parents=True)
        (target / "sentinel").write_text("old install")
        inject = self.root / "inject"
        inject.mkdir()
        (inject / "sitecustomize.py").write_text(
            "from pathlib import Path\n"
            "original = Path.rename\n"
            "def rename(self, target):\n"
            "    if self.name == 'new': raise OSError('injected publish failure')\n"
            "    return original(self, target)\n"
            "Path.rename = rename\n")
        result = self.run_script(source / "scripts/install.sh", target.parent,
                                 env={**os.environ, "PYTHONPATH": str(inject)})
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn("injected publish failure", result.stdout)
        self.assertEqual((target / "sentinel").read_text(), "old install")

    def test_failed_rollback_retains_backup_with_partial_target(self):
        source = self.fixture()
        target = self.root / "installed" / SKILL
        target.mkdir(parents=True)
        (target / "sentinel").write_text("old install")
        inject = self.root / "inject"
        inject.mkdir()
        (inject / "sitecustomize.py").write_text(
            "from pathlib import Path\n"
            "original = Path.rename\n"
            "def rename(self, target):\n"
            "    if self.name == 'new':\n"
            "        Path(target).mkdir()\n"
            "        raise OSError('partial publish failure')\n"
            "    if self.name == 'old': raise OSError('rollback failure')\n"
            "    return original(self, target)\n"
            "Path.rename = rename\n")
        result = self.run_script(source / "scripts/install.sh", target.parent,
                                 env={**os.environ, "PYTHONPATH": str(inject)})
        self.assertNotEqual(result.returncode, 0, result.stdout)
        backups = list(target.parent.glob(f".{SKILL}-stage-*/old/sentinel"))
        self.assertEqual(len(backups), 1, result.stdout)
        self.assertEqual(backups[0].read_text(), "old install")
        self.assertIn("rollback retained", result.stdout)

    def test_successful_replacement_and_link(self):
        source = self.fixture()
        target = self.root / "install with spaces" / SKILL
        target.mkdir(parents=True)
        (target / "old").write_text("old")
        result = self.run_script(source / "scripts/install.sh", target.parent)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertEqual((target / "SKILL.md").read_text(), "new skill")
        self.assertFalse((target / "old").exists())
        result = self.run_script(source / "scripts/install.sh", "--link", target.parent)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertTrue(target.is_symlink())
        self.assertEqual(target.resolve(), source)
        result = self.run_script(source / "scripts/install.sh", "--link", target.parent)
        self.assertEqual(result.returncode, 0, result.stdout)
        result = self.run_script(source / "scripts/install.sh", target.parent)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertFalse(target.is_symlink())
        self.assertEqual((source / "SKILL.md").read_text(), "new skill")

    def test_ancestor_destination_rejected(self):
        parent = self.root / SKILL
        source = parent / "source"
        (source / "scripts").mkdir(parents=True)
        shutil.copy2(REPO / "scripts/install.sh", source / "scripts/install.sh")
        result = self.run_script(source / "scripts/install.sh", self.root)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertTrue((source / "scripts/install.sh").exists())

    def test_filename_spaces_and_mixed_color_line(self):
        result = self.check(".x { color: var(--ink); background: #123456; }")
        self.assertEqual(result.returncode, 1, result.stdout)
        self.assertIn("raw-color", result.stdout)
        self.assertIn("view with spaces.css", result.stdout)

    def test_custom_property_does_not_hide_following_html_attributes(self):
        result = self.check('<div style="--custom: 1" class="bg-[#abc] p-[13px]"></div>', filename="view.html")
        self.assertEqual(result.returncode, 1, result.stdout)
        self.assertIn("raw-color", result.stdout)
        self.assertIn("arbitrary-utility", result.stdout)

    def test_multi_value_spacing_and_negative_values(self):
        result = self.check(".x { padding: 8px 13px; margin: -3px 0; }")
        self.assertEqual(result.returncode, 1, result.stdout)
        self.assertIn("13px", result.stdout)
        self.assertIn("-3px", result.stdout)

    def test_valid_spacing_and_token_utilities(self):
        result = self.check('<div class="p-[var(--space)] text-[color:var(--ink)] gap-(--space)"></div>\n.x { padding: 8px 16px; margin: -4px auto; color: var(--ink); }', filename="view with spaces.html")
        self.assertEqual(result.returncode, 0, result.stdout)

    def test_token_utility_fallback_does_not_hide_raw_color(self):
        result = self.check('<div class="text-[var(--ink,#abc)]"></div>', filename="view.html")
        self.assertEqual(result.returncode, 1, result.stdout)

    def test_tokens_glob_not_filename_substring(self):
        result = self.check(".x {color:#abc;}", filename="application.css")
        self.assertEqual(result.returncode, 1, result.stdout)
        result = self.run_script(REPO / "scripts/check-tokens.sh", self.root, "--tokens", "application.css")
        self.assertEqual(result.returncode, 0, result.stdout)

    def test_reasoned_exception_only_named_rule_next_line(self):
        result = self.check("/* token-check-allow raw-color: third-party logo requires exact brand color */\n.x { color: #abc; padding: 13px; }")
        self.assertEqual(result.returncode, 1, result.stdout)
        self.assertIn("off-scale-spacing", result.stdout)
        self.assertNotIn(":2: raw-color:", result.stdout)
        self.assertIn("EXCEPTION", result.stdout)

    def test_reasoned_exception_passes_but_does_not_spread(self):
        path = self.root / "view.css"
        path.write_text("/* token-check-allow raw-color: third-party logo requires exact brand color */\n.x {color:#abc;}\n")
        result = self.run_script(REPO / "scripts/check-tokens.sh", self.root)
        self.assertEqual(result.returncode, 0, result.stdout)
        path.write_text(path.read_text() + ".y {color:#def;}\n")
        self.assertEqual(self.run_script(REPO / "scripts/check-tokens.sh", self.root).returncode, 1)

    def test_invalid_exception_fails(self):
        for marker in ("raw-color:", "all: convenient", "raw-color: ok"):
            result = self.check(f"/* token-check-allow {marker} */\n.x {{color:#abc;}}")
            self.assertEqual(result.returncode, 1, result.stdout)
            self.assertIn("invalid-exception", result.stdout)

    def test_invalid_arguments(self):
        script = REPO / "scripts/check-tokens.sh"
        for args in (("--unknown",), ("--tokens",), ("--scale", "eight"), ("missing-directory",)):
            result = self.run_script(script, *args)
            self.assertEqual(result.returncode, 2, (args, result.stdout))


if __name__ == "__main__":
    unittest.main(verbosity=2)
