# The method, and why each piece is there

This is the reasoning behind [`CLAUDE.md`](../CLAUDE.md). The rules there are short; here is
where they came from. Almost every one was born from something that failed first.

**Context.** One student, a software engineer whose native language is Spanish. Solid working
English: reads technical docs and writes at work. Eight and a half weeks from the start of this
setup to the exam (Aug 25 → Oct 24, 2026). Two 45-minute blocks a day, one day off a week.

---

## 1. Two active errors, not ten

**What failed.** For over a month, every text came back with around ten corrections. Each one
was right and clearly explained. Writing didn't move. In the student's words: *"we've been at
this for over a month and it hasn't improved."*

**Why.** Under a 7-minute (email) or 10-minute (discussion) clock there's no attention left to
check ten things. You understand the corrections afterwards and repeat them under pressure. A
TOEFL teacher on r/TOEFL gave someone with the same complaint the same advice: *"pick the two most
frequent ones and check only those."*

**The rule.** Exactly two active errors. Corrections of five lines or less, only about those two.
An error leaves after three clean texts in a row; the next one enters. Everything else goes to a
silent queue.

**What happened.** Writing went from 4.0 on the ETS practice test (Oct 10) to **6.0** on the real
exam (Oct 24). Two corrected forms showed up later, unprompted, in brand-new texts (`throughout
the day`, `depends on`), which is what "transfer" looks like.

## 2. Produce first, explain when asked

**What failed.** A preposition drill: the tutor explained the rule, then the student filled in
words. Verdict: *"honestly I don't feel it taught me anything."*

**What worked.** A rewrite of the student's own text, with empty cells for the correct form and
for *"what were you thinking in Spanish?"*, and the explanations given in the chat **only when
asked**. Verdict, two days later: *"I feel I did learn, because I rewrote it and asked you why
for each thing I put in the tables. Let's keep using this template."* While asking about
`through`, the student found `throughout my life`, which was better than the original sentence.

| | Drill ❌ | Rewrite ✅ |
|---|---|---|
| Who goes first | the tutor explains | the student fills the cell |
| When the "why" arrives | before producing | when the student asks |
| What gets produced | loose words | the whole sentence |

The difference wasn't the content. It was the **order**. An explanation that lands after you
committed to an answer fills a gap you already felt.

## 3. Your mistakes are the material

Every Anki card quotes a sentence the student actually wrote, letter by letter, with the date of
the error. Not generic examples. The two times the tutor slipped (cards with a "fan of the band"
example, a front rewritten from *"We are"* to *"There are"*) the student caught it immediately:
*"don't you read where that card came from?"*

The card has to say what it's testing. A bare sentence in Spanish could be asking about any of
five words. And if the answer isn't a *form* but "rebuild the sentence", it's not a card at all.

## 4. Check, don't trust: Anki edition

**Twice** (once for nine days, once for six), cards were written into the notes **and never
inserted into Anki.** It was found only because the student asked *"you did put the rewrite cards
in Anki, right?"*. Since then the day doesn't close until the tutor counts the cards in the
collection itself. A promised card that doesn't exist is worse than no card.

A later bug: inserted cards went to the **back** of the new-card queue, behind hundreds of old
ones, so they never showed up. Fresh errors are the most urgent; they go first.

## 5. Check, don't trust: transcription edition

The tutor can't hear. Every speaking correction depends on a transcript, and the transcript lied
in three different ways:

| What happened | Effect | Fix |
|---|---|---|
| A small Whisper model dropped *"I agree"* and invented *"civil engineer"* | criticized an answer that was fine | always `large-v3-turbo` |
| Whisper used the original audio as context and **finished a sentence the student cut off** | a Listen and Repeat score went from 28 to 31 | `-mc 0`, and record with headphones so the original isn't on the track |
| Transcribing 2–3 s clips in isolation | a real 32/35 measured as 22/35 | transcribe the whole file |

**Both times, the student caught it**: *"number 6 didn't even come out complete"* and *"I did
say all of number 7."* Hence the rule: if the student says they said something different, they're
right, and you re-transcribe.

## 6. Don't let measurements lie

- **Contamination.** The tutor's own analysis of the official tests quoted items with their
  answers. Using one of those tests as a checkpoint would have counted 12 already-seen questions.
  Now every test is grepped against the notes before it measures anything, and results are
  reported raw and clean.
- **Printed scripts.** ETS practice-test PDFs print the Listening scripts above the questions and
  the Speaking sentences. The student spotted it before starting: *"I think page 16 has the
  transcripts."* Checkpoints from PDFs now come without the scripts, plus a list of pages not to open.
- **Answer keys mid-PDF.** Each section in the teacher tests has its key right after it. Once the
  tutor gave a page range that included the Reading key. The student hadn't looked, so it was luck,
  not method. Now the whole PDF is swept first.

## 7. Generated prompts copy the format, they don't invent the task

The tutor generated an email asking the student to **turn down a request**. The student asked: *"do
the guides say they ask this type of email?"* The answer was no. None of the seven official prompts
asks for it, and it's harder than any of them: all seven leave the test-taker doing something
constructive. Since then generated prompts mix new topics and recipients but only use the
rhetorical moves found in the official set, and the word-count line is copied, not remembered (the
email has no minimum; the discussion says "at least 100 words").

## 8. One clean page per exercise

Exercises are not done in the chat. Each one gets its own page with only what would be printed on an
exam sheet. Twice the page came with metrics tables, reminders and the previous audit attached, and
the student was blunt about it. The test is simple: *would this be printed on the exam?*

And once the student opens a page, it's frozen. Editing it three times while they read (two new
collapsibles and a reworded criterion) left them not knowing which version they were looking at.

## 9. Priorities, and the clock belongs to the student

With only 90 minutes a day, the plan never fits completely. A plan without priorities makes the
student decide on the fly what to drop, and they drop what comes first in the list, not what matters
least. Hence 🔴🟡🟢 and "drops from the bottom up".

The tutor also miscounted the time twice (once declaring both blocks finished without knowing the
start time; once ignoring the 15-minute break). Rule: *"stop calculating the time, you get it wrong."*
The plan gives minutes per block; the student keeps the clock.

## 10. Five minutes of shadowing a day

Pronunciation is one of the four Speaking criteria, and it's the method's blind spot: the tutor
can't hear. Shadowing (speaking on top of the audio, half a second behind) is the only thing that
trains it, and it works by **frequency**, not duration. One sentence per day, 6–8 times, starting
just above the length where the student breaks.

Listen and Repeat went from breaking at 9–10 words to holding **two complete 12-word sentences**.
The day's sentence comes from a written queue: for three days the tutor kept assigning the same
sentence from memory while six newly cut ones sat unused (*"weren't there other ones? You've given
me the same one like ten times"*).

---

## What did NOT work (measured, and dropped)

| | Result |
|---|---|
| **Self-audit**: the student hunting their own errors after writing | 0 real errors found two days in a row, with hints and without. Detection catches one family of error at a time at best |
| **Writing initials** of each word during Listen and Repeat | worse in two separate tests. It degrades the *input*, not the memory: substitutions started sounding alike (`milk` → *meat*) |
| **Grouping words into meaning chunks** while listening | not executable: *"I can't group while I listen"* |
| **Silent shadowing** during Listen and Repeat | 30.2 vs 29.7 without it: noise |
| **"Hold on to the meaning"** | that's the root cause of the substitutions, not the cure |

General principle: **anything that adds a task while listening costs more than it gives.**
