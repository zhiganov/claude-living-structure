# claude-living-structure

A [Claude Code](https://claude.ai/code) slash command that audits software projects against Christopher Alexander's [15 Properties of Living Structure](https://en.wikipedia.org/wiki/The_Nature_of_Order).

## Why

Alexander argued that the 15 properties aren't aesthetic preferences or cognitive artifacts — they're structural features of all living systems, rooted in the physics of matter itself. They show up in nature, in traditional architecture, and in any well-adapted complex system. Software is no exception: codebases that exhibit these properties feel alive, coherent, and easy to work with. Those that don't feel dead, fragile, or hostile.

> I shall try to show that the structure of centers I call wholeness goes deeper than mere cognition, is linked to the functional and practical behavior of the natural world, and is as much at the foundation of physics and biology as it is of architecture.
>
> — Christopher Alexander, *The Nature of Order*

The properties are also *transformations* — active operations you apply repeatedly to generate life. The audit diagnoses where your codebase stands; the growth areas suggest which transformations to apply next.

## The 15 Properties

| # | Property | In software |
|---|----------|-------------|
| 1 | Levels of Scale | Smooth gradations from small to large abstractions |
| 2 | Strong Centers | Clear core concepts that orient the whole system |
| 3 | Boundaries | Thick, well-defined boundaries protecting centers |
| 4 | Alternating Repetition | Dual structures (code/data, tests/impl) that strengthen each other |
| 5 | Positive Space | Every part is coherent and purposeful, not leftover scraps |
| 6 | Good Shape | Simple parts compose into elegant wholes |
| 7 | Local Symmetries | Similar things look similar; differences are meaningful |
| 8 | Deep Interlock | Centers hook into each other through shared interfaces |
| 9 | Contrast | Distinct parts are clearly differentiated at a glance |
| 10 | Gradients | Controlled transitions replace sharp jumps |
| 11 | Roughness | Pragmatic adaptation over artificial perfection |
| 12 | Echoes | Recurring structural themes across scales and parts |
| 13 | The Void | Quiet, stable spaces that allow life to bloom |
| 14 | Simplicity and Inner Calm | Complex but coherent; effortless-feeling precision |
| 15 | Not-Separateness | Deeply adapted to users, tools, and environment |

## Installation

### Quick Install (bash)

```bash
curl -fsSL https://raw.githubusercontent.com/zhiganov/claude-living-structure/main/install.sh | bash
```

### Quick Install (PowerShell)

```powershell
irm https://raw.githubusercontent.com/zhiganov/claude-living-structure/main/install.ps1 | iex
```

### Manual

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

### Focus flags

`scale`, `centers`, `boundaries`, `alternation`, `positive`, `shape`, `symmetry`, `interlock`, `contrast`, `gradients`, `roughness`, `echoes`, `void`, `calm`, `fit`

## How it works

1. Claude reads the checklist from `~/.claude/living-structure-checklist.md`
2. Explores the project: directory structure, source files, architecture docs, tests, git history
3. Scores each item qualitatively: `[x]` present, `[~]` partial, `[ ]` missing, `[n/a]` not applicable
4. Outputs a scorecard with overall impression, property-by-property analysis, strengths, growth areas (with transformations to apply), and connections between properties
5. Optionally saves results to `{project}/LIVING-STRUCTURE-AUDIT.md`

## How it differs from `/audit-oss`

[`/audit-oss`](https://github.com/zhiganov/claude-audit-oss) checks for concrete artifacts (LICENSE file, CI config, CONTRIBUTING.md) — things that either exist or don't. `/living-structure` is fundamentally qualitative: it reads actual code and evaluates emergent qualities like coherence, adaptation, and composability. The two complement each other.

## Customizing

The checklist at `~/.claude/living-structure-checklist.md` is plain markdown. Add, remove, or modify items to match your values and context. The command reads it fresh each time.

## Background

Christopher Alexander (1936-2022) was an architect whose work profoundly influenced software — *A Pattern Language* inspired design patterns, wikis, and agile methodology. In *The Nature of Order*, he distilled 15 geometric properties that characterize structures with "life." In *The Battle for the Life and Beauty of the Earth*, he reframed them as generative transformations:

> These provide the active juice with which a living system provides the range of possibilities with which we may work. Every living system uses these transformations.

This command applies Alexander's framework to software, drawing on Nikos Salingaros's formalization and Ben Christel's [detailed interpretation for code](https://benchristel.neocities.org/posts/alexandrian-software/).

## Further reading

- Christopher Alexander, *The Nature of Order* Vol. 1: *The Phenomenon of Life* (2002)
- Christopher Alexander, *The Battle for the Life and Beauty of the Earth* (2012)
- Nikos Salingaros, ["The Fifteen Fundamental Properties"](https://patterns.architexturez.net/doc/az-cf-172521) in *Architecture's New Scientific Foundations*
- Ben Christel, ["Christopher Alexander's Fifteen Properties of Living Structure in Software"](https://benchristel.neocities.org/posts/alexandrian-software/) (2024)
- Richard Gabriel, *Patterns of Software: Tales from the Software Community* (1996)

## License

MIT
