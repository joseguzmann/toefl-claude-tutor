# Getting started: no coding needed

This guide is for people who have never used a terminal, GitHub or a code editor.
You'll install one app, open a folder, and talk to the tutor in plain language.
**About 30 minutes.**

---

## What you need

| | |
|---|---|
| A computer | **Mac recommended.** Windows works too |
| A paid Claude plan | **Pro or Max**, at [claude.ai](https://claude.ai). Claude Code isn't included in the free plan |
| A headset with a microphone | for Speaking and shadowing |
| About 1 GB of free space | mostly for the transcription model and the ETS PDFs |

---

## Step 1 · Download this folder

1. At the top of [the project page](https://github.com/joseguzmann/toefl-claude-tutor), click the
   green **Code** button, then **Download ZIP**.
2. Unzip it and move the folder somewhere easy, like **Documents**.
3. Rename it if you want (for example `my-toefl`). The name doesn't matter.

> Have a GitHub account? Click **Use this template** instead, and **make your copy private**.
> It will hold your writing and recordings.

## Step 2 · Install Claude

1. Download the **Claude desktop app** from [claude.ai/download](https://claude.ai/download)
   and sign in with your paid account.
2. Open the **Code** tab.
3. Choose the folder from Step 1 as your project folder.

That's the whole installation. From here on, you only write messages.

> Prefer the terminal? Install Claude Code with the instructions at
> [docs.claude.com](https://docs.claude.com/en/docs/claude-code/setup), then run `claude`
> inside the folder.

## Step 3 · Your first session

Type:

> **Hi, let's start.**

You can write in your own language. The tutor will:

1. **Interview you:** exam date, target score, your current level, how much time you have
   per day, your native language.
2. **Set up a diagnostic:** an official practice test, to know where you really are.
3. **Offer to install the optional tools** (next section). It explains each one and asks
   before installing anything.

After that it writes your profile and your first plan into the folder.

### About the permission prompts

Claude Code asks before it runs commands or changes files. That's normal and it's there to protect
you. Read what it wants to do; if it makes sense, approve it. If something looks odd, say no and ask
*"what is this for?"*.

---

## Every day

| | Type something like |
|---|---|
| Start of the day | *"Plan today."* |
| You finished an exercise | *"Done, here's my email."* (paste it) |
| You recorded yourself | *"I recorded the interview, it's in Documents as interview.m4a."* |
| You don't understand a correction | *"Why is it **on** and not **in**?"* |
| End of the day | *"I did the email and the listening, skipped the reading."* |

The tutor keeps track of the rest in the folder.

---

## Optional tools (the tutor can set them up for you)

### Anki: flashcards from your own mistakes
1. Install [Anki](https://apps.ankiweb.net/).
2. In Anki: **Tools → Add-ons → Get Add-ons**, paste the code **`2055492159`** (AnkiConnect),
   and restart Anki.
3. Keep Anki **open** when the tutor adds cards.

### Whisper: transcription of your speaking, on your computer
This is what lets the tutor "listen" to your speaking practice: it turns your recording into text,
locally, without uploading it. Just say:

> *"Set up transcription."*

On a Mac it uses Homebrew and downloads the `large-v3-turbo` model (about 1.6 GB).

### Notion (only if you already use it)
If you prefer to do your exercises in Notion, connect it to Claude and tell the tutor. Without
Notion, exercises are simple files in the `exercises/` folder.

---

## Where to get practice material

The tutor generates daily practice, but **official tests are what measure you**. They're free:
see [`docs/official-materials.md`](docs/official-materials.md). Download them into the
`materials/` folder and tell the tutor.

---

## If something goes wrong

| Problem | Try |
|---|---|
| The tutor doesn't seem to know the plan | *"Read STATUS.md and today's journal."* |
| A correction doesn't make sense | Say so. **If you're sure about what you wrote or said, you're right**, not the transcript |
| Too much feedback, too many things | *"Only my two active errors, please."* That's the rule |
| It talks about the old TOEFL (Integrated Writing, 0–30 per section…) | *"That's the old format. Check docs/exam-2026.md."* |
