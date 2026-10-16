# Stage 6: Assets

Decide whether a visual asset is needed, then climb the cheapest ladder that does the job. The decision is the design work; generation is mechanical.

## Source And Purpose

Reuse approved project or user assets first; confirm they fit the intended use. Distinguish factual assets (a named person, actual product, room, place, or cover) from illustrative assets (mood, metaphor, or atmosphere). A factual asset must depict the correct referent; never substitute a generated look-alike or present an archive image as the client's actual property.

When needed, acquire the correct factual asset or a suitable open-license illustration before generating. Public availability is not permission: check the original source's license or supplied permission for the intended use, including attribution and modification terms. Download permitted assets locally; keep required credits in the delivered page or accompanying attribution file. No provider credentials are needed for permitted public downloads.

If the correct asset, permission, or network access is unavailable, use an explicitly labeled placeholder and report the gap. An illustrative substitute is allowed only when its role is clear and it makes no factual claim.

## Ladder

These rungs cover authored or generated illustration after approved and permitted source assets have been considered.

| Rung | Use when | How |
|---|---|---|
| 0. Nothing | the element passes the removal test in `core/anti-slop.md` | delete the asset request |
| 1. CSS and typography | dividers, textures, emphasis, empty states | tokens from `DESIGN.md` |
| 2. Authored SVG | logo marks, icons, illustrations, patterns, favicons, charts | write the SVG file directly, using `DESIGN.md` colors as `currentColor` or CSS variables |
| 3. Fetched icon set | standard UI icons | one Iconify family per project, fetched from `https://api.iconify.design/<prefix>/<name>.svg` |
| 4. Raster provider | photography, hero imagery, textures, renders | only when a provider skill is configured and has credentials |
| 5. Honest placeholder | rung 4 needed but no provider | a labeled neutral block or a quiet authored SVG, listed in the ship report |

## Authored SVG Rules

- Derive shapes from the product signature and shape language in `DESIGN.md`, not from a generic icon vocabulary.
- Use `viewBox`, no fixed width or height, `fill="currentColor"` or CSS variables so theme changes propagate.
- One stroke weight and one corner treatment per set.
- Keep files under 4 KB for icons. Simplify paths before shipping.
- Rasterize only when a format demands it: OG image, app icon, favicon `.ico`. Use `npx @resvg/resvg-js` or a headless browser screenshot. Do not assume ImageMagick is installed.

## Raster Provider Rules

- For generation, check for a configured provider skill and its credentials. If none, use rung 5 and say so; this does not block permitted asset downloads.
- The generation prompt must include: the visual theme paragraph, the palette, the mood words, and the anti-patterns from `DESIGN.md`. A prompt without the direction produces the generic look this skill exists to prevent.
- Generate at the final display size and aspect ratio. Request no text inside images.
- Reference-image skills such as `imagegen-frontend-web` and `brandkit` produce design references for Stage 4 exploration, not shipping assets. Do not confuse the two.

## Every Asset

- Written to the project's asset directory with a descriptive name.
- Has meaningful alt text or is marked decorative.
- Has explicit width and height to prevent layout shift.
- Uses a modern format, `svg` or `webp` or `avif`, with lazy loading below the fold and priority loading for the LCP image.
- Listed in the ship report with its source or rung. For sourced assets, record factual/illustrative role, subject, original source URL or project path, creator, license/permission evidence, required credit, local path, intrinsic dimensions, and crop in `.design/brand-spec.md`. For authored/generated assets, record origin and illustrative role; never infer permission from a search result.
