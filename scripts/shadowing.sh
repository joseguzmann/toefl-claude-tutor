#!/bin/bash
# Shadowing: play the same sentence in a loop so you can speak on top of it.
#
#   ./scripts/shadowing.sh 04-library-hours             8 times in a row
#   ./scripts/shadowing.sh 04-library-hours 10          10 times
#   ./scripts/shadowing.sh 04-library-hours 8 pause     wait for Enter between repetitions
#
# The name is searched in every set under audio/prompts/. Run without arguments to list them.
# One earbud in, one out. First 2 times: just listen. From the 3rd: speak ON TOP, half a second behind.
cd "$(dirname "$0")/.." || exit 1
A="audio/prompts"
NAME="${1:-}"
N="${2:-8}"

play() {
  if command -v afplay >/dev/null; then afplay "$1"
  elif command -v ffplay >/dev/null; then ffplay -nodisp -autoexit -loglevel quiet "$1"
  else echo "need afplay (macOS) or ffplay" >&2; exit 1; fi
}

F=""
[ -n "$NAME" ] && F=$(ls "$A"/*/*/"$NAME".* 2>/dev/null | head -1)

if [ -z "$F" ]; then
  [ -n "$NAME" ] && echo "not found: $NAME" && echo
  for d in "$A"/*/*/; do
    [ -d "$d" ] || continue
    echo "  ${d#$A/}"
    ls "$d" | sed 's/\.[a-z0-9]*$//' | sort -u | sed 's/^/      /'
  done
  exit 1
fi

echo
echo "🗣️  $(basename "${F%.*}")  ·  $N times  ·  $(basename "$(dirname "$F")")"
echo "   First 2: just listen. From the 3rd on, speak ON TOP of it."
echo
for i in $(seq 1 "$N"); do
  printf "   %2d/%d  " "$i" "$N"
  [ "$i" -le 2 ] && echo "listen" || echo "speak on top"
  play "$F"
  if [ "${3:-}" = "pause" ]; then read -r; else sleep 1; fi
done
echo
echo "   Done. Same sentence tomorrow, or the next one in the queue if this one is fluent."
echo
