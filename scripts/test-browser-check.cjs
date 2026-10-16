// Run: node scripts/test-browser-check.cjs (no browser dependency).
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const source = fs.readFileSync(`${__dirname}/browser-check.js`, 'utf8');
function check({ overflow = false, pending = false, image = false, clipped = false } = {}) {
  const element = { tagName: 'P', id: 'long', textContent: 'Long content', clientWidth: 100, scrollWidth: clipped ? 140 : 100, clientHeight: 20, scrollHeight: 20, getBoundingClientRect: () => ({ width: 100, height: 20 }) };
  const document = {
    documentElement: { clientWidth: 390, scrollWidth: overflow ? 450 : 390 },
    fonts: { status: pending ? 'loading' : 'loaded', [Symbol.iterator]: function* () { yield { family: 'Missing', status: 'unloaded' }; } },
    images: image ? [{ complete: true, naturalWidth: 0, naturalHeight: 0, currentSrc: 'broken.png', getAttribute: () => null }] : [],
    querySelectorAll: () => clipped ? [element] : [],
  };
  return vm.runInNewContext(source, { document, location: { href: 'https://example.test/' }, innerWidth: 390, innerHeight: 844, scrollY: 0, getComputedStyle: () => ({ overflowX: 'hidden', overflowY: 'visible', textOverflow: 'clip' }) });
}
let result = check();
assert.equal(result.viewport.width, 390);
assert.equal(result.fonts.faces[0].status, 'unloaded');
assert.equal(result.fonts.actualRenderedFonts, 'not measured');
assert.equal(result.findings.length, 0);
assert(check({ overflow: true }).findings.some(f => f.id === 'horizontal-overflow' && f.severity === 'error'));
assert(check({ pending: true }).findings.some(f => f.id === 'fonts-pending'));
assert(check({ image: true }).findings.some(f => f.id === 'broken-image'));
assert(check({ clipped: true }).findings.some(f => f.id === 'clipping-candidate' && f.severity === 'review'));
console.log('browser-check: 8 assertions PASS (mock DOM; not real-browser validation)');
