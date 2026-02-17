# Living Structure Checklist

Based on Christopher Alexander's "15 Properties of Living Structure" from *The Nature of Order* (2002-2005) and *The Battle for the Life and Beauty of the Earth* (2012), interpreted for software systems.

Primary sources:
- Christopher Alexander, *The Nature of Order*, Vol. 1: *The Phenomenon of Life*
- Christopher Alexander, *The Battle for the Life and Beauty of the Earth* — properties as generative transformations
- Nikos Salingaros, *Algorithmic Sustainable Design* — ch. 11 of *Architecture's New Scientific Foundations*
- Ben Christel, "Christopher Alexander's Fifteen Properties of Living Structure in Software" (2024)

Each item is scored: `[x]` present, `[~]` partial, `[ ]` missing, `[n/a]` not applicable.
Properties can be audited independently via `--focus <property>`.

**Key framing:** Alexander described these not just as properties to observe, but as *transformations* — active operations you apply repeatedly to generate living structure. Each property is both a diagnostic question ("does this code have it?") and a generative action ("apply this to improve it"). The audit scores current state; the transformation hints suggest where to go next.

---

## 1. Levels of Scale (`scale`)

Centers exist at many sizes, with smooth transitions between adjacent levels.

- [ ] **Multiple levels of abstraction** — code is organized into at least 4-5 distinct levels (tokens → expressions → functions → modules → layers → services)
- [ ] **Smooth size ratios** — adjacent levels differ by roughly 2:1 to 5:1 (e.g., functions have ~5-15 lines, classes have ~5-15 methods, modules have ~5-15 files)
- [ ] **No missing levels** — no jarring jumps from very small to very large centers (e.g., 500-line functions that skip the intermediate "paragraph" level)
- [ ] **Power-law distribution** — many small centers, fewer large ones (more helper functions than god objects)
- [ ] **Small centers are present** — the smallest meaningful units (well-named variables, focused expressions) are given attention, not neglected
- [ ] **Organizational levels of scale** — team structure has smooth gradations (individual → pair → team → department), not just "person" and "company"

**Transformation:** Introduce new centers at intermediate scales. When a function is too large, don't just extract one helper — create a whole new level (a module, a class) that populates the gap between existing scales.

## 2. Strong Centers (`centers`)

The system has clear cores — parts that everything else orbits and supports. Alexander called this the *master transformation*: it strengthens centers by calling on any combination of the other 14 properties. Every other transformation ultimately serves to make centers stronger.

- [ ] **Identifiable core concept** — a new team member could be told "the first thing to know about this system is X" and X would orient them
- [ ] **Domain model as center** — the core business logic/domain model is prominent, not buried under infrastructure
- [ ] **Centers support each other** — subordinate components clearly serve the strong center (e.g., API routes serve the domain, not the other way around)
- [ ] **Rock-solid core** — the strong center is precision-engineered, well-tested, and stable; roughness is tolerated at the edges, not the center
- [ ] **Navigability from center** — you can orient yourself relative to the strong center when lost in the codebase
- [ ] **Centers at every scale** — not just one "core" for the whole system, but strong centers within each module, each class, each function
- [ ] **Team has a center** — there is a clear point of contact, a lead or anchor who provides continuity and orientation

**Transformation:** Pick the weakest center and strengthen it by applying other properties — give it better boundaries, add levels of scale within it, make it more symmetrical. This is the meta-operation: any property can be used in service of strengthening a center.

## 3. Boundaries (`boundaries`)

Thick, well-defined boundaries protect centers and mediate between inside and outside. Alexander specified that boundaries should be *thick* — substantial enough to contain their own internal structure, roughly 25-50% the size of the center they protect.

- [ ] **Parsing at the boundary** — inputs are validated and parsed into structured types at system edges, not deep inside business logic
- [ ] **Serialization at the boundary** — output formatting (JSON, HTML, etc.) happens at the edges, not mixed into core logic
- [ ] **Error handling at the boundary** — errors from external systems are caught and translated at the boundary, keeping the core clean
- [ ] **Proportional thickness** — boundary code (parsers, adapters, API layers) is proportional to what it protects — not a thin one-line wrapper, but substantial enough to have its own internal structure
- [ ] **APIs as explicit boundaries** — interfaces between modules/services are explicitly defined, not accidentally coupled through shared internals
- [ ] **Boundaries have their own centers** — boundary layers are well-organized internally (e.g., a validation layer has its own clear structure), not a dumping ground
- [ ] **Team boundaries are clear** — responsibilities between roles (PM, design, engineering) have explicit boundaries with defined handoff points

**Transformation:** Where a center is weak or contaminated by outside concerns, wrap it in a thicker boundary. Create a dedicated parsing/adapter layer that gives the center room to be purely itself.

## 4. Alternating Repetition (`alternation`)

Dual structures repeat and alternate throughout the system, each strengthening the other.

- [ ] **Data and code alternate coherently** — data structures are as well-designed as the functions that process them; neither is neglected
- [ ] **Tests and production code alternate** — test code and implementation are both coherent, intelligible entities in their own right
- [ ] **Structure and behavior co-evolve** — refactoring and feature work alternate in a healthy rhythm, not segregated into separate phases
- [ ] **Input and output cycles** — the system has clear rhythms of reading/writing, request/response, or gather/compute/emit
- [ ] **Work-life rhythm** — development has a sustainable cadence with clear on/off boundaries, not constant crunch or constant drift

**Transformation:** Find a neglected "background" structure (data types, test code, config) and bring it to the same level of quality as the foreground. The alternation between the two should make both stronger.

## 5. Positive Space (`positive`)

Every part — foreground and background — is coherent and purposeful, not leftover scraps. Alexander emphasized that this transformation gives definite form to the "interstices" — the spaces *between* the obvious centers.

- [ ] **Functions are self-contained** — each function makes sense in isolation, without needing to know its callers to understand it
- [ ] **No idea fragments** — there are no functions that only make sense in the context of a single caller (negatively-shaped code)
- [ ] **Background code is positive** — utility functions, helpers, and infrastructure code are coherent abstractions, not random grab-bags
- [ ] **Interstitial code is shaped** — the code *between* major features (glue code, middleware, config) has its own coherent form, not just whatever fell out of connecting things together
- [ ] **Consistent abstraction levels** — each center operates at a single level of abstraction (file I/O code doesn't mix with domain logic)
- [ ] **Reusable by nature** — positively-shaped code feels like it could be part of the language or standard library
- [ ] **Easy to test in isolation** — because centers are coherent, unit testing feels natural, not forced

**Transformation:** Look at the "leftover" spaces — the glue code, the utility files, the middleware — and give them deliberate, recognizable form. Shape the background until it's as coherent as the foreground.

## 6. Good Shape (`shape`)

Centers are built from elementary, well-understood forms that compose beautifully.

- [ ] **Composed from simple parts** — complex behavior emerges from composition of simple, well-understood functions/types
- [ ] **Recursive good shape** — the elements of good shapes are themselves good shapes, all the way down
- [ ] **Code reads like the problem** — the solution feels like the language was made for the problem (Ward Cunningham's criterion)
- [ ] **Elegant composition** — chains of operations read naturally and do exactly what you'd expect
- [ ] **Minimal machinery** — the solution accomplishes its goal with surprisingly little code, without feeling compressed or obscure

**Transformation:** Take a rough outline of a solution and strengthen each piece — make types more distinct, names more precise, compositions more natural — until the overall shape becomes recognizable and memorable.

## 7. Local Symmetries (`symmetry`)

Similar things look similar; differences are meaningful, not accidental.

- [ ] **Similar behaviors have similar structure** — analogous operations are coded analogously (e.g., CRUD operations share consistent patterns)
- [ ] **Symmetrical branching** — if/else branches, switch cases, and pattern matches make their symmetry explicit
- [ ] **Meaningful asymmetry** — when code breaks symmetry, the reason is evident (adaptation to a genuine difference, not accidental inconsistency)
- [ ] **Templates and conventions** — repeating patterns (route handlers, test cases, data transformations) follow a recognizable template
- [ ] **Differences stand out** — because similar things look similar, the important differences are immediately visible

**Transformation:** When facing complexity, look for hidden symmetries. Make similar things look similar so that important differences stand out. If a center already has a natural axis (e.g., request/response), make the symmetry explicit.

## 8. Deep Interlock and Ambiguity (`interlock`)

Centers hook into each other at their boundaries; hierarchy is flexible, not rigid.

- [ ] **Inversion of control** — higher-order functions, callbacks, and dependency injection let centers collaborate without tight coupling
- [ ] **Shared interfaces** — intermediate types/interfaces serve both producers and consumers, belonging fully to neither
- [ ] **Multiple valid perspectives** — the system can be understood through different lenses (by feature, by layer, by data flow) without contradiction
- [ ] **Cross-functional teams** — people belong to multiple organizational centers simultaneously (team + discipline + project)
- [ ] **Composable building blocks** — components interlock through well-defined protocols, enabling flexible recombination

**Transformation:** At hard interfaces between two modules, create a third center — a shared type, protocol, or adapter — that belongs ambiguously to both sides, linking them without merging them.

## 9. Contrast (`contrast`)

Distinct parts are clearly differentiated; you can tell at a glance what type of thing you're looking at.

- [ ] **Concern separation is visible** — UI code looks different from database code looks different from business logic; the "squint test" passes
- [ ] **Clear architectural layers** — the system has distinct regions with different character (not a uniform mishmash of SQL, HTML, and logic)
- [ ] **Contrast without violence** — separation feels natural and incremental (like stone walls in a field), not imposed by rigid ideology
- [ ] **Roles are distinct** — team roles (PM, designer, engineer) have clearly different responsibilities that complement each other
- [ ] **Read vs. write paths differ** — query and command paths are appropriately differentiated (when the domain warrants it)

**Transformation:** Increase differentiation between regions that serve different purposes. Move scattered concerns (SQL mixed with HTML mixed with logic) into distinct, concentrated areas — like clearing stones from a field into walls.

## 10. Gradients (`gradients`)

Controlled transitions replace sharp jumps; centers adapt to varying forces across space.

- [ ] **Public-to-private gradient** — modules expose public interface first, with implementation details arranged from high-level to low-level
- [ ] **File reading gradient** — files are organized so the most important/commonly-sought information is near the top
- [ ] **Test case gradient** — tests are arranged from happy path to edge cases to error cases, reflecting priority
- [ ] **Complexity gradient** — the system gets progressively more detailed as you move from outer layers inward
- [ ] **Project lifecycle gradient** — development naturally transitions through phases (research → design → build → stabilize) without sharp handoffs

**Transformation:** Where there's a sharp boundary or jarring transition, introduce a gradient — a series of intermediate centers that vary gradually in size, complexity, or abstraction level, pointing toward or away from a center.

## 11. Roughness (`roughness`)

Precise adaptation to real forces, even when it means relaxing artificial rules.

- [ ] **Pragmatic approximations** — "good enough" solutions are used where exactness doesn't matter (caching, heuristics, simple algorithms)
- [ ] **Rules relaxed for readability** — formatting rules (line length, etc.) are relaxed when strict compliance hurts local symmetry or clarity
- [ ] **No artificial perfection** — the code doesn't strain for an idealized pattern when a simpler, slightly irregular approach works better
- [ ] **Handmade quality** — individual centers show signs of being shaped by a thinking person, not stamped out by a template
- [ ] **Context-sensitive decisions** — similar problems are solved differently when context warrants it, rather than forcing uniformity
- [ ] **Imperfection is honest** — TODOs, rough edges, and known limitations are acknowledged rather than papered over with false elegance

**Transformation:** Give the process *permission* to be rough where necessary. When strict adherence to a pattern, type system, or formatting rule conflicts with adaptation to real requirements, relax the rule in service of the larger whole.

## 12. Echoes (`echoes`)

Recurring structural themes appear at different scales and in different parts of the system.

- [ ] **Consistent idioms** — the same patterns (error handling, data transformation, state management) recur throughout the codebase
- [ ] **Cross-scale echoes** — patterns at one level echo at other levels (e.g., message-passing between objects echoes API calls between services)
- [ ] **Familiar foundations** — the system uses well-known patterns (ETL, pub/sub, pipeline, actor) rather than inventing novel structures unnecessarily
- [ ] **Team echoes code** — organizational structure echoes the software architecture (Conway's Law, consciously applied)
- [ ] **Design vocabulary** — the team has shared language for recurring patterns, making design discussions efficient

**Transformation:** Identify the dominant "angles and ratios" — the recurring idioms and structural proportions — and use them as defaults for new code. Give the system a family resemblance across its parts.

## 13. The Void (`void`)

Quiet, empty spaces exist that allow life to bloom within them. Alexander noted that at the core of any serious center there should be "some undisturbed and perfectly peaceful area which lacks busyness or excessive structure." In a fractal, the largest component survives as the void — you cannot fill everything with detail.

- [ ] **Stable platforms** — the system builds on stable, slow-changing foundations (languages, frameworks, protocols) that create space for application-level innovation
- [ ] **Breathing room in code** — blank lines, clear section breaks, and whitespace give the eye places to rest
- [ ] **Unopinionated core** — the central abstractions don't over-constrain; they leave room for varied use cases
- [ ] **Quiet-to-busy ratio** — the system has a healthy balance between stable/quiet code (frameworks, protocols, config) and dense/active code (features, business logic) — not everything is equally busy
- [ ] **Slack in the schedule** — the development process has room for exploration, refactoring, and responding to the unexpected
- [ ] **Empty extensibility** — the architecture has natural extension points that invite future growth without requiring it

**Transformation:** In a region with too much busyness, create an open center — a stable, quiet abstraction that doesn't do much itself but provides a peaceful foundation for smaller, more active structures around it.

## 14. Simplicity and Inner Calm (`calm`)

The whole feels effortless, unhurried, and precisely adapted — complex but coherent.

- [ ] **No unnecessary complexity** — every piece of complexity serves a real purpose; there is no accidental complexity or over-engineering
- [ ] **Working with the grain** — solutions follow the natural contours of the problem, like a knife finding the joints in the meat
- [ ] **No firefighting culture** — the development process is calm and predictable, not a constant state of emergency
- [ ] **Obvious in retrospect** — good solutions feel so natural that they seem like they must have always existed
- [ ] **No contortions** — the code doesn't twist itself into knots to satisfy an abstraction or pattern that doesn't fit
- [ ] **Effortless reading** — you can read the code from top to bottom and it tells a clear story, without jumping around

**Transformation:** Simplify by subtraction. Question every piece of structure: does it belong here? Remove anything chaotic, superfluous, or distracting until what remains is exactly what's needed — complex but coherent, like Occam's razor applied to code.

## 15. Not-Separateness (`fit`)

The system is deeply adapted to its context — users, tools, environment — and doesn't call attention to itself. Alexander described this as overcoming separation by forming "chains of centers which cross boundaries," creating softer, more permeable edges between the system and its environment.

- [ ] **Adapted to users' real workflows** — the system fits naturally into how people actually work, not how designers imagine they should work
- [ ] **Adapted to developers' tools** — code conventions account for the editors, debuggers, and review tools the team actually uses
- [ ] **Adapted to the ecosystem** — the system follows platform conventions, uses standard protocols, and plays well with adjacent tools
- [ ] **Bridging across hard edges** — where the system meets the outside world (APIs, CLI, config files), there are chains of intermediate structures that ease the transition rather than an abrupt boundary
- [ ] **Incremental adaptation** — the system evolves through many small adjustments based on real feedback, not big redesigns from scratch
- [ ] **Invisible when working well** — users don't notice the system when it's working; it feels like a natural extension of their workflow
- [ ] **No showroom engineering** — design decisions optimize for long-term usability, not demo-day impressions or novelty

**Transformation:** Where a boundary between the system and its environment is too sharp, build bridges — gradients of intermediate structures (SDKs, CLI wrappers, migration tools, compatibility layers) that soften the edge and create permeability in both directions.
