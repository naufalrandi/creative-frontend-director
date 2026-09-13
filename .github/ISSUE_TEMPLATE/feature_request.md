---
name: Feature Request
about: Suggest an improvement or new capability for creative-frontend-director
title: "[FEAT] "
labels: enhancement
assignees: ''

---

## Summary

A clear, concise description of the feature or improvement you'd like to add.

## Motivation

Why would this feature improve the skill? Examples:
- Solves a routing problem (e.g., "should also trigger on 'polish the UI'")
- Improves design direction (e.g., "add a dimension for cultural context to rubric")
- Expands specialist routing (e.g., "add a route for data visualization")
- Improves asset generation (e.g., "add SVG animation templates")
- Better handles edge cases (e.g., "clarify stage when project has no README")

## Proposal

How should this work?

If modifying or adding a stage:
- Which stage? (reference SKILL.md or workflows/workflows.md)
- What should the new file do?
- Does it change authority or conflict with existing stages?

If modifying the rubric:
- Which dimension? (reference gates/taste-rubric.md)
- Should it replace or supplement an existing dimension?
- How should a dimension below 3 be handled?

If adding specialist routing:
- What is the trigger condition?
- Which existing skills should it recognize?
- How does it defer to the director's DESIGN.md?

## Acceptance Criteria

The feature is ready when:
- [ ] New stage files are referenced in SKILL.md or workflows/workflows.md
- [ ] manifest.json file list is updated
- [ ] At least one eval scenario is run and recorded in evals/baseline.md
- [ ] Behavior is documented in CLAUDE.md or CONTRIBUTING.md

## Alternative Approaches

Are there other ways to solve this? What are the trade-offs?

## Additional Context

- Attach examples or wireframes if applicable
- Link to related issues
- Share any test projects or fixtures that would help implement this
