# Anki

Each batch of cards is logged here, one file per session: `YYYY-MM-DD-<topic>.md` with the
context (the sentence the student wrote and the date), plus a `.json` with the cards to insert:

```json
[
  {"front": "I'd like to study ___ the library of my university. <i>(preposition)</i>",
   "back": "<b>in</b> or <b>at</b> (both correct)<br><small>You wrote \"study on the library\" on 2026-09-16.</small>",
   "tags": "2026-09-16 preposition"}
]
```

Insert (Anki open, with the [AnkiConnect](https://ankiweb.net/shared/info/2055492159) add-on):

```bash
python3 scripts/anki.py add anki/2026-09-16-discussion.json
python3 scripts/anki.py count 2026-09-16      # verify at the close of the day
```

⚠️ **A card in this folder is NOT a card in Anki** until it's inserted and counted.

## Index

| File | Cards |
|---|---|
