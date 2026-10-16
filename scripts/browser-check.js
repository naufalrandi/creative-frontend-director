// Read this entire expression into the host browser's evaluate operation.
// No page mutation, network, scrolling, console interception, or dependencies.
(() => {
  const findings = [];
  const add = (id, severity, evidence, fix) => findings.push({ id, severity, evidence, fix });
  const root = document.documentElement;
  if (root.scrollWidth > root.clientWidth + 1) {
    add('horizontal-overflow', 'error', { width: root.clientWidth, scrollWidth: root.scrollWidth }, 'Find the overflowing region; keep tables/code scroll inside their container.');
  }
  if (document.fonts?.status === 'loading') {
    add('fonts-pending', 'review', 'Font loading has not settled.', 'Wait for document.fonts.ready, then capture again.');
  }
  const images = Array.from(document.images, image => {
    const entry = { src: image.currentSrc || image.src, complete: image.complete, width: image.naturalWidth, height: image.naturalHeight, explicitDimensions: image.getAttribute('width') !== null && image.getAttribute('height') !== null };
    if (entry.complete && !entry.width) add('broken-image', 'error', entry, 'Fix source or use an explicitly labeled fallback.');
    return entry;
  });
  // ponytail: overflow-based clipping candidates only; inspect screenshots for overlap and intentional truncation.
  for (const element of document.querySelectorAll('h1,h2,h3,h4,p,a,button,label,td,th')) {
    const bounds = element.getBoundingClientRect();
    if (!bounds.width || !bounds.height || !element.textContent.trim()) continue;
    const style = getComputedStyle(element);
    const clippedX = ['hidden', 'clip'].includes(style.overflowX) && element.scrollWidth > element.clientWidth + 1;
    const clippedY = ['hidden', 'clip'].includes(style.overflowY) && element.scrollHeight > element.clientHeight + 1;
    if (clippedX || clippedY) add('clipping-candidate', 'review', { tag: element.tagName, id: element.id, text: element.textContent.trim().slice(0, 120), ellipsis: style.textOverflow === 'ellipsis' }, 'Inspect this region at current viewport; confirm intentional truncation remains accessible.');
  }
  return {
    url: location.href,
    viewport: { width: innerWidth, height: innerHeight, scrollY },
    fonts: { status: document.fonts?.status || 'unavailable', faces: document.fonts ? Array.from(document.fonts, face => ({ family: face.family, status: face.status })) : [], actualRenderedFonts: 'not measured' },
    images,
    findings,
    notMeasured: ['actual rendered glyph fonts', 'contrast', 'past console errors', 'overlap', 'primary-action result', 'offscreen scroll states'],
  };
})()
