# TOEFL Claude Tutor

**A personal TOEFL iBT tutor that runs in [Claude Code](https://claude.com/claude-code) on your own computer.**
It plans your study days, writes exercises in the 2026 exam format, corrects your writing,
transcribes and scores your speaking, and turns *your own* mistakes into Anki cards. Everything
it learns about you is saved in this folder, so it never starts from zero.

I built it to prepare for my own exam. In eight weeks I went from a B2 diagnostic to
**C1: 5.5 overall (110/120)**, with **Writing and Listening at the maximum score of 6.0**.

**No coding needed to use it.** → [Getting started](GETTING-STARTED.md)

---

## Results

| | Reading | Listening | Writing | Speaking | **Overall** |
|---|---|---|---|---|---|
| Diagnostic · Aug 31 *(official practice test)* | 4.5 | 5.5 | ~4 | ~4 | B2 |
| ETS practice test (TPO) · Oct 10 | 5.0 | 5.0 | 🔴 4.0 | 5.0 | **5.0** |
| **Real exam · Oct 24, 2026** | **5.5** | 🟢 **6.0** | 🟢 **6.0** | 5.0 | **5.5 · C1** |

Writing was the weakest section on the practice test and it went **from 4.0 to 6.0 in 14 days**.

> ⚠️ This is one person and one exam. It is a method that worked for me, not a guarantee.
> Speaking stayed at 5.0, and the tutor can't hear your pronunciation (more on that below).

---

## Why not just ask a chatbot for practice?

That's what I did first. For over a month I used a long, carefully written tutor prompt in a
regular chat, and my writing didn't improve. Five things changed when I moved to this setup:

1. **It remembers.** A chat forgets everything between conversations. Here the tutor keeps
   files (`STATUS.md`, your active errors, a daily journal) and reads them every session.
2. **Two errors at a time, nothing more.** Getting ten corrections per text felt useful and
   changed nothing. I understood them, then made them again under the clock. Writing only
   started to move once the tutor tracked **exactly two** recurring errors and stayed quiet
   about everything else.
3. **Your mistakes become the material.** Every Anki card is built from a sentence *you*
   wrote, with the date you got it wrong. No generic ESL examples.
4. **Measured, not guessed.** Speaking is recorded and transcribed **locally** with Whisper.
   Before a practice test is used to measure your level, the tutor checks that you haven't
   already seen its answers.
5. **It knows the 2026 exam.** The TOEFL changed completely in January 2026 (new tasks, a 1–6
   scale, adaptive sections). Most of what's online, and what AI models remember, describes
   the old test. The tutor is instructed never to answer about the format from memory.

## What a study day looks like

| When | What | Who |
|---|---|---|
| Before you start | Anki review + **5 minutes of shadowing** | you, on your own |
| Block 1 · 45 min | the exercises marked 🔴 | tutor plans, you do |
| Block 2 · 45 min | 🟡, then 🟢 if there's time | |
| End of day | you say what you did and what you skipped | the tutor carries it to tomorrow |

Every block has a priority: 🔴 essential · 🟡 important · 🟢 if there's time. When the day runs
short, things drop **from the bottom up**, and anything that drops two days in a row moves up.

## The rules behind the result

Every rule in [`CLAUDE.md`](CLAUDE.md) exists because something went wrong first. A few:

| What went wrong | The rule it became |
|---|---|
| Ten corrections per text, no improvement after a month | **Two active errors.** One leaves after 3 clean texts in a row |
| Grammar explained up front never stuck | **Produce first, ask why later.** Rewrite exercises have empty cells; the explanation comes when *you* ask |
| Cards were written in notes but **never inserted into Anki**, twice | At the end of each day the tutor **checks the Anki collection** itself |
| Whisper "heard" the original audio and finished a sentence I had cut off, inflating a score | Record Listen and Repeat **with headphones** and transcribe with `-mc 0` |
| A practice test's answers were already quoted in my notes | **Check for contamination** before any test is used to measure |
| A generated email prompt asked for something the real exam never asks | **Generated prompts copy the official format; they never invent a task** |

The full method, and why each piece is there: [`docs/method.md`](docs/method.md).
Patterns we found along the way (n=1, to test, not to trust blindly): [`docs/findings.md`](docs/findings.md).

---

## Getting started

**Not a programmer?** Follow [GETTING-STARTED.md](GETTING-STARTED.md). It takes about 30
minutes. You install the Claude desktop app, open this folder, and type *"Hi, let's start."*

**Already use Claude Code?**

```bash
git clone https://github.com/joseguzmann/toefl-claude-tutor.git
cd toefl-claude-tutor
claude
> Hi, let's start.
```

On the first session the tutor interviews you (exam date, target score, schedule, native
language), asks for a diagnostic, and offers to set up the optional tools.

### Requirements

| | |
|---|---|
| **Claude Code** | needs a paid Claude plan (Pro or Max) |
| **macOS** | recommended. Windows and Linux work; a few helper scripts are Mac-first |
| **Headset with mic** | for Speaking practice and shadowing |
| Optional · [Anki](https://apps.ankiweb.net/) + AnkiConnect | so the tutor can add cards for you |
| Optional · [whisper.cpp](https://github.com/ggml-org/whisper.cpp) | local transcription of your speaking |

You **don't** need Notion, GitHub or VS Code.

---

## What's in the folder

```
CLAUDE.md               the tutor's instructions: the heart of the project
STATUS.md               what we know, what's decided, what's next (the tutor fills it in)
GETTING-STARTED.md      setup guide for non-programmers
docs/
  method.md             the method and why each rule exists
  findings.md           patterns observed in one learner
  exam-2026.md          the 2026 format in one page
  official-materials.md free official ETS materials, with links
profile/                about you: profile, active errors, grammar already explained
journal/                one page per study day, with the day's plan and close
exercises/              one clean page per exercise
anki/                   card log + helper to add them to Anki
drills/                 longer output drills
audio/prompts/          audio prompts cut from exercises, reusable for practice
scripts/                timer, shadowing loop, transcription, Anki helper
materials/              put the ETS PDFs and audio here (not tracked by git)
recordings/             your recordings (not tracked by git)
```

## What's not included

- **ETS materials.** The practice tests, audio and the Official Guide are copyrighted.
  [`docs/official-materials.md`](docs/official-materials.md) links to the free official ones.
- **My personal notes.** The real exercises, recordings and cards from my preparation stay private.
  The rules they produced are all here.

## Privacy

Everything lives in this folder on your computer. Transcription runs **locally**, so your
voice isn't uploaded anywhere for that. Your conversations with Claude go through Anthropic like
any Claude Code session. If you put your copy on GitHub, **make the repository private**:
it will contain your writing, your errors and your recordings.

## Limits

- **Claude can't hear audio.** It reads a transcript. Pronunciation, one of the four Speaking
  criteria, isn't evaluated; daily shadowing is how this method trains it.
- It's tuned for **Spanish speakers** in the examples, but works with any native language: the
  tutor asks yours on day one.
- It was built for the **January 2026** format. If ETS changes the test again, update
  [`docs/exam-2026.md`](docs/exam-2026.md) first.

## License

[MIT](LICENSE). Use it, fork it, adapt it to IELTS or anything else. If it helps you, I'd love to hear
your score.
