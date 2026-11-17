#!/bin/bash
# TOEFL timer, with the 2026 section times.
#   ./scripts/timer.sh                 menu
#   ./scripts/timer.sh test            the full exam, section by section
#   ./scripts/timer.sh writing         one section: reading | listening | writing | speaking
#   ./scripts/timer.sh 10 "Discussion" a single block of N minutes
#
# SAY=0 turns the voice off. Listening and Speaking blocks are always silent:
# the timer must not talk over the exercise audio.
set -u
SAY=${SAY:-1}
MUTE=0
speak() { [ "$SAY" = 1 ] && [ "$MUTE" = 0 ] && command -v say >/dev/null && say "$1" 2>/dev/null & }
ding()  { command -v afplay >/dev/null && afplay -v 0.3 /System/Library/Sounds/Glass.aiff 2>/dev/null || printf '\a'; }

block() {
  local min="$1" name="$2" left
  case "$name" in *isten*|*peaking*|*nterview*|*epeat*) MUTE=1 ;; *) MUTE=0 ;; esac
  echo
  [ "$MUTE" = 1 ] && echo "  ▶  $name: $min min   🔇 (silent: you'll be listening to audio)" \
                  || echo "  ▶  $name: $min min"
  speak "Start $name. $min minutes."
  left=$(( min * 60 ))
  while [ $left -gt 0 ]; do
    printf "\r     %02d:%02d   %s        " $(( left/60 )) $(( left%60 )) "$name"
    case $left in 300) speak "Five minutes" ;; 60) speak "One minute" ;; 30) speak "Thirty seconds" ;; esac
    sleep 1; left=$(( left-1 ))
  done
  printf "\r     00:00   %s: TIME        \n" "$name"
  ding
  [ "$MUTE" = 0 ] && speak "Time."
  MUTE=0
}

next() {
  echo
  echo "  ──────────────────────────────────────────"
  echo "   Next: $1     ENTER to start · Ctrl+C to stop"
  echo "  ──────────────────────────────────────────"
  speak "Next: $1"
  read -r
}

reading()   { block 20 "Reading module 1"; next "Reading module 2"; block 9 "Reading module 2"; }
listening() { block 18 "Listening module 1"; next "Listening module 2"; block 9 "Listening module 2"; }
writing()   { block 6 "Build a Sentence"; next "Write an Email"; block 7 "Write an Email"
              next "Academic Discussion"; block 10 "Academic Discussion"; }
speaking()  { block 3 "Listen and Repeat"; next "Take an Interview"; block 5 "Take an Interview"; }
full()      { next "READING"; reading; next "LISTENING"; listening
              next "WRITING"; writing; next "SPEAKING"; speaking
              echo; echo "  ✓ Done. Give your answers to the tutor."; speak "Exam finished."; }

case "${1:-menu}" in
  test|full) full; exit 0 ;;
  reading) reading; exit 0 ;;  listening) listening; exit 0 ;;
  writing) writing; exit 0 ;;  speaking) speaking; exit 0 ;;
  menu) ;;
  *[!0-9]*) echo "  usage: timer.sh [test|reading|listening|writing|speaking] or timer.sh <min> \"name\""; exit 1 ;;
  *) block "$1" "${2:-block}"; exit 0 ;;
esac

cat <<'MENU'

  TOEFL TIMER (times are approximate; check the official Test Overview)

   t) FULL EXAM, section by section ...... ~87 min
   ─────────────────────────────────────────────
   r) Reading   (20 + 9) .................  29 min
   l) Listening (18 + 9) .................  27 min
   w) Writing   (6 + 7 + 10) .............  23 min
   s) Speaking  (3 + 5) ..................   8 min
   ─────────────────────────────────────────────
   5) Build a Sentence ...................   6 min
   6) Write an Email .....................   7 min
   7) Academic Discussion ................  10 min

MENU
read -rp "  Option: " op
case "$op" in
  t) full ;; r) reading ;; l) listening ;; w) writing ;; s) speaking ;;
  5) block 6 "Build a Sentence" ;; 6) block 7 "Write an Email" ;; 7) block 10 "Academic Discussion" ;;
  *) echo "  invalid option"; exit 1 ;;
esac
