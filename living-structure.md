# Living Structure Audit

Evaluate a software project against Christopher Alexander's "15 Properties of Living Structure" from *The Nature of Order*.

## Arguments

- `$ARGUMENTS` — project directory name (e.g., `harmonica-web-app`) and optional `--focus <property>` flag

## Instructions

### Step 1: Parse Arguments

Parse `$ARGUMENTS` to extract:
- **project**: directory name (required) — must be a subdirectory of the workspace
- **--focus**: optional property filter (one of: `scale`, `centers`, `boundaries`, `alternation`, `positive`, `shape`, `symmetry`, `interlock`, `contrast`, `gradients`, `roughness`, `echoes`, `void`, `calm`, `fit`)

If no project is specified, ask the user which project to audit.

### Step 2: Load the Checklist

Read the checklist from `~/.claude/living-structure-checklist.md`.

The checklist has 15 properties:
1. Levels of Scale (`scale`)
2. Strong Centers (`centers`)
3. Boundaries (`boundaries`)
4. Alternating Repetition (`alternation`)
5. Positive Space (`positive`)
6. Good Shape (`shape`)
7. Local Symmetries (`symmetry`)
8. Deep Interlock and Ambiguity (`interlock`)
9. Contrast (`contrast`)
10. Gradients (`gradients`)
11. Roughness (`roughness`)
12. Echoes (`echoes`)
13. The Void (`void`)
14. Simplicity and Inner Calm (`calm`)
15. Not-Separateness (`fit`)

If `--focus` was provided, only audit that property. Otherwise audit all 15 properties.

### Step 3: Understand the Project

Before scoring, build a holistic understanding of the project:

- Read the README, CLAUDE.md, and any architecture/design docs
- Examine the directory structure and module organization
- Read representative source files from different parts of the codebase (core logic, API layer, UI, utilities, tests)
- Check package metadata for dependencies and scripts
- Look at git history for development patterns and rhythms
- Identify the project's "strong center" — what is this system fundamentally about?

Use the Explore agent or parallel file reads to gather information efficiently.

**Important:** This is a qualitative audit, not a mechanical checklist. Each property requires judgment about whether the code exhibits the quality described. Read actual code, don't just check for file existence. A property can be present even if it manifests differently from the checklist's examples.

### Step 4: Score and Report

Output the audit as a scorecard:

```
# Living Structure Audit: {project-name}
Date: {today}
Focus: {property or "Full audit (all 15 properties)"}

## Summary
- Score: {checked}/{total} ({percentage}%)
- Partial: {partial-count}
- Missing: {missing-count}
- N/A: {na-count}

## Overall Impression

{2-3 sentences on the project's overall "life" quality. Does it feel alive, coherent,
adapted? Or does it feel mechanical, fragmented, imposed? What's the dominant feeling
when reading the code?}

## {Property Number}. {Property Name}

**Alexander's principle:** {1-sentence summary of the property}

- [x] **Item name** — {evidence found in the codebase}
- [~] **Item name** — {what's there vs what's missing}
- [ ] **Item name** — {what would need to change}
- [n/a] **Item name** — {why not applicable}

**Observation:** {A brief qualitative note about how this property manifests (or doesn't)
in this specific project. Reference specific files, patterns, or architectural decisions.}

... (repeat for each property in scope)

## Strengths

1. {Property where the project most excels} — {why, with specific examples}
2. {Second strongest property} — {why}
3. {Third strongest} — {why}

## Growth Areas

1. {Property with most room for improvement} — {concrete suggestion}
2. {Second most impactful} — {concrete suggestion}
3. {Third} — {concrete suggestion}

## Connections

{Note any interesting relationships between properties. For example, strong boundaries
might be enabling good positive space, or lack of levels of scale might be undermining
the strong center. Alexander emphasized that the 15 properties reinforce each other —
look for these reinforcement patterns or their absence.}
```

### Step 5: Save Results

Save the scorecard to `{project-dir}/LIVING-STRUCTURE-AUDIT.md` only if the user agrees. Ask first:

> "Save audit results to `{project}/LIVING-STRUCTURE-AUDIT.md`? (This file can be .gitignored if you prefer to keep it local.)"

### Step 6: Offer Next Steps

After showing results, offer:
- "Want me to work on any of the growth areas?"
- "Want to dive deeper into a specific property? (Use `--focus <property>`)"
- "Want to audit another project?"

## Property Reference (for --focus)

| Flag | Property |
|------|----------|
| `scale` | Levels of Scale |
| `centers` | Strong Centers |
| `boundaries` | Boundaries |
| `alternation` | Alternating Repetition |
| `positive` | Positive Space |
| `shape` | Good Shape |
| `symmetry` | Local Symmetries |
| `interlock` | Deep Interlock and Ambiguity |
| `contrast` | Contrast |
| `gradients` | Gradients |
| `roughness` | Roughness |
| `echoes` | Echoes |
| `void` | The Void |
| `calm` | Simplicity and Inner Calm |
| `fit` | Not-Separateness |

## Notes

- The checklist is at `~/.claude/living-structure-checklist.md` — it can be customized
- This audit is inherently qualitative. Unlike an OSS health audit where you check for a LICENSE file, "living structure" requires reading and understanding code
- Not all properties apply equally to every project. A CLI tool and a web app will manifest these properties differently
- The 15 properties reinforce each other. A project weak in one property often compensates through strength in another
- The audit is a lens for seeing, not a judgment. Use it to start conversations about design quality
- Alexander's properties describe *emergent* qualities — they arise from careful, incremental adaptation, not from top-down planning
