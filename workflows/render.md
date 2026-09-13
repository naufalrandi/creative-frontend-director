# Stage 8: Render

The taste gate judges pixels. Produce screenshots before scoring. Save them under `.design/screens/` named `<route>-<width>.png`.

## Viewports

| Name | Width | Why |
|---|---|---|
| phone | 390 | dominant mobile width, catches shrunken-desktop layouts |
| tablet | 768 | the breakpoint where most navigation models change |
| desktop | 1440 | common laptop-external monitor width |

Capture full-page height for marketing routes and the first viewport plus one scrolled position for app routes.

## Procedure

1. Start the app. Read `package.json` scripts and use the dev script, for example `npm run dev`, in the background. Wait for the port to answer.
2. Capture with whichever is available, in this order:
   - Claude-in-Chrome: open the route, resize the window to each width, take a screenshot, save it.
   - Playwright: `npx playwright screenshot --viewport-size=390,844 --full-page http://localhost:3000/<route> .design/screens/<route>-390.png`, repeated per width.
   - A headless Chrome binary: `chrome --headless --screenshot=<file> --window-size=<w>,<h> <url>`.
3. Read each screenshot back with the file reader so it is actually inspected, not only saved.
4. Check for horizontal scroll at each width and for overlapping or clipped text.

## Fallback

If no browser path works, say so in the ship report, list the exact error, and score the rubric with the code as evidence while marking the score provisional. A provisional score cannot PASS. The task stays open until a render exists.

## Component Workflow

Render the component inside a real page that uses it. If none exists yet, create a temporary route or story that places it in realistic context and delete the route afterwards.
