# README editorial review

Reviewed 2026-10-16 against the working README, including its existing uncommitted additions, and the skill's implementation and saved evidence.

## Audience and purpose

The primary reader is a developer deciding whether to install an agent skill. The README should let them answer four questions quickly: what changes in my agent's work, what does the result look like, how do I invoke it, and what evidence supports the claims? Maintainers also need access to the workflow, integration boundaries, verification commands, and evaluation history.

## What was already working

- The product-specific premise is supported by three visually different examples rather than a list of aesthetic adjectives.
- Briefs, directions, `DESIGN.md` files, and reviews let readers inspect the reasoning behind each screenshot.
- The historical baseline comparison documents both visible output and written artifacts.
- Installation options, host adapters, optional motion integrations, and evidence limits already give experienced users useful detail.

The revision keeps those strengths and preserves the existing installation, capability, animation, and verification additions.

## Findings and changes

| Priority | Finding | Reader impact | Change |
|---|---|---|---|
| High | The opening described a philosophy before explaining the concrete output. | A visitor had to infer what installing the skill would do. | Lead with product context → written direction → implemented UI → screenshot review, followed by a real output image. |
| High | The long eight-host badge competed with the introduction. | Host names crowded the first screen and duplicated the host table. | Use a compact eight-adapter badge linked to the detailed table. |
| High | Starter requests were short and did not show explicit activation. | A new user could copy a request without knowing how the host loads the skill. | Add the repo-documented Codex invocation and task prompts for building, improving, reviewing, and extracting. |
| High | The image caption said every image was unretouched and not a mockup. | It obscured the distinction between captured UI and its presentation treatment. | Describe the wide images as framed compositions, link the underlying captures, and disclose the recorded DepotDesk phone crop. |
| High | DepotDesk's linked implementer review says PASS while the later judge record says REFINE. | Readers could mistake a self-score for the final recorded outcome. | Put REFINE beside the showcase, label the implementer self-review, and link the judge findings in the baseline log. |
| Medium | Phone screenshots were unevenly exposed across the examples. | Comparing how the three directions adapt to a phone required digging through files. | Add a three-product 390 px gallery and direct desktop/phone links for every example. |
| Medium | Example descriptions did not consistently explain what to look for. | Readers could see attractive screenshots without understanding the design decision. | Use a short index and describe the running margin, shared forecast axis, and departure-driven queue. |
| Medium | The artifact tree could imply every request produces every file. | A small review could appear to require a full greenfield ceremony. | Explain that outputs depend on the workflow and link the stage matrix and templates. |
| Medium | Project-local installation depended on the current working directory. | Running the command from the skill checkout could target the wrong repo or create source/destination overlap. | Explain running the installer by absolute path from the target project and retain the replacement/overlap warning. |
| Medium | General host support language could read as a fresh compatibility test. | Readers could assume every host capability had been verified in this edit. | Describe the shipped adapters and state that activation, rendering, and subagents depend on host configuration. |

## Evidence checked

- [`SKILL.md`](../SKILL.md): mission, authority, intent router, stage outputs, and completion rules.
- [Installer](../scripts/install.sh): presets, current-directory project installs, replacement behavior, and optional hook settings changes.
- [Host adapters](../reference/harness-adapters.md): the documented host paths and invocation syntax.
- [Workflow matrix](../workflows/workflows.md): stage reuse, report-only reviews, and design-system extraction.
- [Taste rubric](../gates/taste-rubric.md): six dimensions; PASS requires no dimension below 4/5.
- [Baseline log](../evals/baseline.md): the S1 comparison, S12 judge verdict, and the limitations of the two showcase runs.
- [Marginalia review](showcase/marginalia-review.md), [Meridian review](showcase/meridian-review.md), and [DepotDesk self-review](evals/s12-review.md): recorded scores and capture provenance.
- The three hero compositions and the linked PNG files: visual content, image dimensions, and full-size screenshot targets.

## Screenshot choices

Reuse the existing renders. They show actual recorded output and already have briefs and review artifacts. Generating decorative replacement images would weaken that connection. Desktop compositions explain the product direction; the phone gallery makes the three responsive treatments easy to compare. The S1 pair remains separate and explicitly historical, with its v4.0 label intact.

The phone gallery uses linked images, descriptive alt text, and HTML table markup supported by GitHub Markdown. Width labels refer to CSS viewports; some PNG dimensions are twice as large because of device scaling. The images demonstrate appearance; the recorded reviews document the interactions and checks.

## Validation scope

This is an editorial documentation change. No skill stages, scripts, host configuration, historical scores, or screenshot pixels were changed. Validation covers local links and heading anchors, image readability and dimensions, Markdown structure, and whitespace errors. It does not constitute a new skill evaluation, browser interaction test of the example products, external-link availability check, or live compatibility test across the eight hosts.

The supplied navigation instruction references `docs/CODEX-NAVIGATION-GUIDE.md`; that file is absent from this checkout. Repository paths and ownership were established directly from the files present.
