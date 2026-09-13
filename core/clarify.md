# Stage 2: Clarify

Ask the user only when an unresolved answer would materially change the design direction, the information architecture, or the scope. Otherwise pick a default, tag it inferred, and continue.

## Materiality Test

For each field tagged inferred in the brief, ask: if this guess is wrong, would I build a different structure, a different direction, or a different amount of work?

- Yes for at least one field: ask, once.
- No for every field: skip and proceed to Stage 3.

## Skip Conditions

Skip the question entirely when any of these hold:

- the request is a local tweak or a polish of an existing surface
- the user said "just build", "go ahead", or equivalent
- `DESIGN.md` already exists in the repo
- the user already answered a clarification in this task

## Question Candidates

Choose from these, in priority order. Drop any the brief already answers.

| Field | Ask when | Options |
|---|---|---|
| Brand context | no `DESIGN.md`, no tokens, no brand assets found | Derive it for me (Recommended) / I have a brand spec / Match a reference site or screenshot |
| Target users | user type is inferred and changes density or tone | Expert operators / General consumers / Internal team / Mixed |
| Density | greenfield app where workflow is unclear | Dense and operational / Balanced / Spacious and editorial |
| Surface type | routing between public and private is unclear | Public marketing / Authenticated app / Both |
| Scope | the request could mean one page or the whole app | This page only / This flow / Whole frontend |

## How To Ask

Use the host's structured question tool when it has one: `AskUserQuestion` in Claude Code, `ask_user` in Gemini CLI. One call. At most 4 questions. Put your recommended option first and label it "(Recommended)". Write options in the user's words and in the user's language.

On hosts without a question tool (Codex, OpenCode, Antigravity CLI, Cursor, Copilot CLI, Hermes, and any other), write one short line of context followed by a numbered list of the same questions with the recommended default marked, then stop the turn. Do not write code or run tools until the user answers. See `reference/harness-adapters.md`.

## After The Answer

- Record each answer in the brief as provided.
- Do not ask again in this task unless a new blocking ambiguity appears that no default can cover safely.
- If the brand answer is "I have a brand spec" or "Match a reference" and no source was attached, ask for the source once and stop. Never guess brand tokens.

## Defaults Report

Every inferred field that remains after this stage is listed in the ship report in this form:

```
Defaults applied:
- density: dense (rule: expert operators + tabular data in routes)
- surface: private (rule: all routes behind auth middleware)
```
