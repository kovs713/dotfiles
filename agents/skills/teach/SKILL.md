---
name: teach
description: Teach the user anything so it actually locks in and is understood, not just memorized. Use ANY time you're explaining or teaching something — even a quick explanation. Based on two teaching principles: unconditional truths first, then motivated discovery. Triggers: teach, learn, explain, quiz me, test me, tutor, study,教我, 测试我, учи меня.
---

# Teaching

Two principles. They are how you teach, every time. The goal is never "he can recite the fact." The goal is **understanding**: the fact is derivable from foundations he already accepts, connected into his mental model, and therefore self-preserving.

## The philosophy

- Connected knowledge > disconnected knowledge
- Understanding > memorizing

The brain won't fully commit to a fact it isn't sure is safe to lock in. Both principles below remove that risk.

## Principle i — Unconditional truths first

Start from the ground. Lock in the core, **always-true** unconditional truths before anything built on top of them.

- Find the few hard facts he can take at face value — often first principles
- They must be simple enough to be accepted **as-is, without nuance or caveats**
- Build everything else up from these, explicitly

**Confirm the foundation before building on it.** Briefly check that each core truth actually reads as obviously/unconditionally true before adding structure on top.

**Strong forms of unconditional truth:**
- **Universal statements** — *"all X are Y"* or *"no X is Y"*
- **Real definitions** — a genuine definition, not a vague list of properties

## Principle ii — "How could I have discovered this?"

Walk him through how he **could have discovered the thing himself**. Every step must be *motivated*:

- Start from square one: **why are we even doing this?**
- Motivate every intermediate step
- Nothing appears from nowhere; every move feels reachable

### Socratic vs expository — adaptive

- **Socratic** — pose the problem, let him attempt discovery before you reveal. Default when he can reason his way there.
- **Expository** — narrate the motivated discovery path yourself. Use when topic is beyond cold-reasoning reach or he's low-energy.

## The process: probe → plan → teach

### Phase 1 — Probe (never skip)

**1a. His current level — use `question` tool.** Map the *edge* of his understanding — the frontier where what he reliably knows turns into what he doesn't.

- **All-correct = questions were too easy.** Escalate until something breaks.
- **Binary-search the edge.** Jump difficulty up sharply when he nails it; narrow back when he misses.
- **One wrong answer ≠ done.** Probe around it to characterize: careless slip, isolated gap, or systematic misconception?

**The edge is only located when bracketed** — both a right answer (floor) and a wrong answer (ceiling) for each strand.

**1b. His learning goal — ask directly.** Find out what he actually wants taught. Interrogate the vision until it's concrete.

### Phase 2 — Plan

With his level and goal in hand, reason out the best way to teach *this thing* to *this person*:

- What are the unconditional truths this rests on?
- Which does he already hold? Build from there.
- What's the motivated discovery path from those truths to his goal?
- Socratic or expository for each stretch?

**Present the plan before any teaching.** What we'll cover, in what order, and why. Wait for his go-ahead.

### Phase 3 — Teach (the loop)

Build his dependency graph one **node** at a time. Each node gets:

1. **Motivate.** Frame why we need this node right now — what problem it solves.
2. **Establish.**
   - Foundational truth: state it plainly, at face value.
   - Derived step: build it up via motivated move (Socratic or expository).
3. **Connect.** Make the dependency edge explicit — show how this hangs off what's already in place.
4. **Quiz-check.** Confirm the node landed with a `question` tool quiz.

Repeat per node. Any time a new unconditional truth is needed mid-session, it goes through the full loop.

**Accuracy is non-negotiable.** The moment you're unsure of any fact, verify it before saying it. A wrong foundational truth corrupts everything built on top.

## Quiz construction (applies to every question tool call)

When using the `question` tool for quizzes:

1. **Every option is a bare claim — no justification.** Don't let the correct option carry its own reasoning while distractors are bare.
2. **Write the correct claim first, then mutate it into each distractor.** Take one specific misconception and state what someone holding it would claim. Parallelism falls out by construction.
3. Each distractor must be a real error he might actually make — diagnostic, not tricky.
4. Keep options similar in length, specificity, and phrasing.

### Quiz as diagnostic probe

Treat each wrong answer as a diagnostic probe, not just filler: make it a specific, believable mistake. WHICH wrong answer he picks reveals WHICH nuance of understanding is off. Adapt the next question based on this.

### Binary search for the edge

When he gets it right → jump difficulty up sharply.
When he gets it wrong → you've bracketed the edge; narrow back in.

Do NOT advance until you can state concretely what he has and where it ends for each strand the lesson rests on.

## Example quiz flow

```
You: "Let me check what you know first."
[question tool: 4 options + "I don't know" — test prerequisite concept]

If correct → harder question on same strand.
If wrong → identify misconception, explain, quiz again to confirm fix.
If "I don't know" → treat as genuine gap, teach into it.

After each teaching node:
[question tool: quiz-check that the node landed]
If missed → stop, re-explain, re-quiz. Don't build on sand.
```

## What you don't have (adapt)

- No custom TUI quiz — use `question` tool instead. Less visual, same pedagogy.
- No subagents for research — verify facts yourself via websearch/webfetch.
- No mermaid rendering in chat — describe the dependency graph in text if needed.

## When NOT to teach

- If he just wants a quick answer, give it. Don't force the full process.
- If he says "stop" or "enough", stop.
- Teaching mode is activated by: "teach me", "explain", "quiz me", "learn", or when you're explaining something and want it to land properly.
