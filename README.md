# claude-living-structure

A custom slash command for Claude Code that audits software projects against Christopher Alexander's [15 Properties of Living Structure](https://en.wikipedia.org/wiki/The_Nature_of_Order) from *The Nature of Order*.

## What it does

`/living-structure` examines a project's codebase and scores it against a checklist of 15 properties that characterize "living" systems — systems that feel coherent, adapted, and alive rather than mechanical or imposed.

| Property | What it evaluates |
|----------|------------------|
| Levels of Scale | Smooth gradations from small to large abstractions |
| Strong Centers | Clear core concepts that orient the whole system |
| Boundaries | Thick, well-defined boundaries protecting centers |
| Alternating Repetition | Dual structures (code/data, tests/impl) that strengthen each other |
| Positive Space | Every part is coherent and purposeful, not leftover scraps |
| Good Shape | Simple parts compose into elegant wholes |
| Local Symmetries | Similar things look similar; differences are meaningful |
| Deep Interlock | Centers hook into each other through shared interfaces |
| Contrast | Distinct parts are clearly differentiated at a glance |
| Gradients | Controlled transitions replace sharp jumps |
| Roughness | Pragmatic adaptation over artificial perfection |
| Echoes | Recurring structural themes across scales and parts |
| The Void | Quiet, stable spaces that allow life to bloom |
| Simplicity and Inner Calm | Complex but coherent; effortless-feeling precision |
| Not-Separateness | Deeply adapted to users, tools, and environment |

Output is a qualitative scorecard with strengths, growth areas, and connections between properties.

## Background

Christopher Alexander (1936-2022) was an architect whose work profoundly influenced software design — his *A Pattern Language* inspired the design patterns movement, wikis, and agile methodology. In his later work *The Nature of Order*, he distilled 15 geometric properties that characterize structures with "life." These properties apply far beyond architecture — to software, organizations, cities, and any complex adaptive system.

This command applies Alexander's framework specifically to software, drawing on Nikos Salingaros's formalization and Ben Christel's [detailed interpretation for code](https://benchristel.neocities.org/posts/alexandrian-software/).

## Installation

### Quick Install (bash)

```bash
curl -fsSL https://raw.githubusercontent.com/zhiganov/claude-living-structure/main/install.sh | bash
```

### Quick Install (PowerShell)

```powershell
irm https://raw.githubusercontent.com/zhiganov/claude-living-structure/main/install.ps1 | iex
```

### Manual Installation

1. Copy `living-structure.md` to `~/.claude/commands/living-structure.md`
2. Copy `living-structure-checklist.md` to `~/.claude/living-structure-checklist.md`

## Usage

```
/living-structure <project-directory>
/living-structure <project-directory> --focus <property>
```

### Examples

```
/living-structure my-app                    # Full audit (all 15 properties)
/living-structure my-app --focus boundaries # Audit only boundaries
/living-structure my-app --focus calm       # Audit only simplicity and inner calm
```

### Focus properties

`scale`, `centers`, `boundaries`, `alternation`, `positive`, `shape`, `symmetry`, `interlock`, `contrast`, `gradients`, `roughness`, `echoes`, `void`, `calm`, `fit`

## How it works

1. Claude reads the checklist from `~/.claude/living-structure-checklist.md`
2. Explores the project: directory structure, source files, architecture docs, tests, git history
3. Scores each item qualitatively: `[x]` present, `[~]` partial, `[ ]` missing, `[n/a]` not applicable
4. Outputs a scorecard with overall impression, property-by-property analysis, strengths, growth areas, and connections between properties
5. Optionally saves results to `{project}/LIVING-STRUCTURE-AUDIT.md`

## How it differs from `/audit-oss`

`/audit-oss` checks for concrete artifacts (LICENSE file, CI config, CONTRIBUTING.md) — things that either exist or don't. `/living-structure` is fundamentally qualitative: it reads actual code and evaluates emergent qualities like coherence, adaptation, and composability. The two audits complement each other well.

## Customizing the checklist

The checklist at `~/.claude/living-structure-checklist.md` is plain markdown. Add, remove, or modify items to match your values and context. The audit command reads it fresh each time.

## Further reading

- Christopher Alexander, *The Nature of Order* Vol. 1: *The Phenomenon of Life* (2002)
- Nikos Salingaros, ["The Fifteen Fundamental Properties"](https://patterns.architexturez.net/doc/az-cf-172521) in *Architecture's New Scientific Foundations*
- Ben Christel, ["Christopher Alexander's Fifteen Properties of Living Structure in Software"](https://benchristel.neocities.org/posts/alexandrian-software/) (2024)
- Richard Gabriel, *Patterns of Software: Tales from the Software Community* (1996)

## License

MIT
