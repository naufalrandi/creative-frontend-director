# Stage 1: Project Discovery

Build the brief from repository evidence before any visual decision. Write it to `.design/brief.md`. Every field carries an evidence tag.

## Evidence Tags

| Tag | Meaning |
|---|---|
| observed | read directly from code, docs, assets, or screenshots in the repo |
| provided | stated by the user in this task or in a previous answer |
| inferred | your best guess; must appear in the defaults report at ship time |

## Sources To Read

Documents: `AGENTS.md`, `CLAUDE.md`, `PROJECT_CONTEXT.md`, `PRD.md`, `BRD.md`, `DESIGN.md`, `DESIGN_SYSTEM.md`, README, architecture docs.

Implementation: routes, layouts, existing pages, shared components, style tokens and theme files, fonts, assets, `package.json`, framework config, screenshots, existing responsive behavior.

If `DESIGN.md` exists, it is authoritative for Stages 3 and 4. Record it as observed and skip direction questions in Stage 2.

## Brief Template

```markdown
# Design Brief

| Field | Value | Evidence |
|---|---|---|
| Product | what it is and its promise | observed / provided / inferred |
| Users | who, expertise level, device priority | |
| Jobs | the top 3 things users come to do | |
| Dominant workflows | repeated multi-step tasks | |
| High-consequence actions | destructive, financial, irreversible | |
| Data and content types | tables, documents, media, metrics, conversations | |
| Public vs private surfaces | which routes are indexable | |
| Existing identity | fonts, palette, shape language, tone found in repo | |
| Constraints | framework, component library, browser support, i18n | |
| Opportunities | where a product-specific decision would matter most | |
| Risks | what a generic treatment would get wrong here | |
```

## Public Content Map

For public-facing content pages only, map the argument in the brief before layout. Reuse supplied copy and evidence; do not impose this on operational app screens.

| Audience question / section | Claim | Proof and source | Action |
|---|---|---|---|
| <what the reader needs to know> | <specific, supportable statement> | <supplied fact, artifact, or source; otherwise missing> | <useful next step, if any> |

Remove sections with no useful purpose. Missing proof is a gap, not permission to invent customers, testimonials, ratings, or metrics; qualify or omit unsupported claims. Carry this map into Stage 4 rather than choosing stock sections first.

## State Evidence

For implemented surfaces, add a small matrix to the brief: `surface | state | safe fixture/reproduction | expected result | screenshot/check`. Cover applicable loading, empty, error, populated, long content, missing values, zero/one/many, and keyboard/focus states. Explain non-applicable states. Error cases retain input and expose recovery; async announcements use an existing live region. Add RTL/localization cases when supported. Stage 8 records results against this matrix, including the primary action's end result.

## Rules

- Do not ask the user for anything the repository answers.
- Mark a field inferred rather than leaving it blank. Blank fields hide assumptions.
- The brief is the input to Stage 2. Only inferred fields are candidates for a question.
