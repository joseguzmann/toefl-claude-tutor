#!/usr/bin/env python3
"""
Add cards to Anki and verify they're really there, through AnkiConnect.

    python3 scripts/anki.py add anki/2026-09-16-discussion.json
    python3 scripts/anki.py count 2026-09-16

Needs Anki OPEN with the AnkiConnect add-on (code 2055492159).

The JSON is a list of cards (HTML allowed; [sound:file.m4a] for audio):

    [{"front": "...", "back": "...", "tags": "2026-09-16 preposition"}, ...]

Why this exists:
- A card written in a notes file is not a card in Anki. In the preparation this project comes
  from, that happened twice, for nine and six days. So the day closes with `count`.
- Fresh mistakes matter more than an old backlog. If new cards never show up in reviews, they're
  probably waiting behind hundreds of older ones: reposition them to the front (see the tip it prints).

Environment: ANKI_DECK (default "TOEFL"), ANKI_URL (default http://127.0.0.1:8765).
"""
import json
import os
import sys
import urllib.request

URL = os.environ.get("ANKI_URL", "http://127.0.0.1:8765")
DECK = os.environ.get("ANKI_DECK", "TOEFL")


def call(action, **params):
    req = json.dumps({"action": action, "version": 6, "params": params}).encode()
    try:
        with urllib.request.urlopen(URL, req, timeout=10) as r:
            res = json.load(r)
    except OSError:
        sys.exit("🔴 Can't reach Anki. Open Anki and check the AnkiConnect add-on is installed.")
    if res.get("error"):
        raise RuntimeError(f"{action}: {res['error']}")
    return res["result"]


def add(path):
    with open(path, encoding="utf-8") as f:
        cards = json.load(f)
    call("createDeck", deck=DECK)
    notes = [
        {
            "deckName": DECK,
            "modelName": "Basic",
            "fields": {"Front": c["front"], "Back": c["back"]},
            "tags": c.get("tags", "").split(),
            "options": {"allowDuplicate": False, "duplicateScope": "deck"},
        }
        for c in cards
    ]
    ok = call("canAddNotes", notes=notes)
    to_add = [n for n, can in zip(notes, ok) if can]
    for n, can in zip(notes, ok):
        if not can:
            print(f"  already exists or invalid, skipped: {n['fields']['Front'][:60]}")
    ids = call("addNotes", notes=to_add) if to_add else []
    ids = [i for i in ids if i]

    print(f"\n✅ {len(ids)} added · {len(notes) - len(ids)} skipped · deck '{DECK}'")
    print("   Verify at the close of the day with:  python3 scripts/anki.py count <date tag>")
    if ids:
        print("   Tip: if you have a big backlog of new cards, in Anki's Browse select these and use")
        print("   Cards → Reposition → start 0, 'shift position of existing cards', so they come first.")


def count(tag):
    total = len(call("findNotes", query=f'"deck:{DECK}"'))
    today = len(call("findNotes", query=f'"deck:{DECK}" tag:{tag}'))
    print(f"{total} notes in '{DECK}' · {today} tagged {tag}")


if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] not in ("add", "count"):
        sys.exit(__doc__)
    {"add": add, "count": count}[sys.argv[1]](sys.argv[2])
