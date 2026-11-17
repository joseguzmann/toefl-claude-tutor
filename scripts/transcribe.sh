#!/bin/bash
# Transcribe a recording locally with whisper.cpp, with the settings that don't lie.
#
#   ./scripts/transcribe.sh ~/Documents/interview.m4a
#   ./scripts/transcribe.sh ~/Documents/listen-and-repeat.m4a > transcript.txt
#
# Why these settings (each one cost a false measurement):
#   large-v3-turbo  small models drop words ("I agree") and invent others
#   -mc 0           otherwise Whisper uses what it already heard as context and FINISHES
#                   a sentence the student cut off (inflated a Listen and Repeat score)
#   whole file      never transcribe 2-3 s clips in isolation: the model destroys them
#
# Model path: $WHISPER_MODEL, or the default below.
set -euo pipefail

IN="${1:?usage: transcribe.sh <audio file>}"
MODEL="${WHISPER_MODEL:-$HOME/.cache/whisper.cpp/ggml-large-v3-turbo.bin}"
[ -f "$IN" ] || { echo "file not found: $IN" >&2; exit 1; }

if ! command -v whisper-cli >/dev/null; then
  echo "whisper-cli not found. On a Mac: brew install whisper-cpp" >&2
  exit 1
fi
if [ ! -f "$MODEL" ]; then
  echo "model not found: $MODEL" >&2
  echo "download it (~1.6 GB):" >&2
  echo "  mkdir -p \"$(dirname "$MODEL")\" && curl -L -o \"$MODEL\" \\" >&2
  echo "    https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo.bin" >&2
  exit 1
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
WAV="$TMP/audio.wav"

# 16 kHz mono WAV, the format whisper.cpp expects
if command -v afconvert >/dev/null; then
  afconvert -f WAVE -d LEI16@16000 -c 1 "$IN" "$WAV"
elif command -v ffmpeg >/dev/null; then
  ffmpeg -loglevel error -i "$IN" -ar 16000 -ac 1 -c:a pcm_s16le "$WAV"
else
  echo "need afconvert (macOS) or ffmpeg to convert the audio" >&2
  exit 1
fi

whisper-cli -m "$MODEL" -f "$WAV" -l en -ml 0 -mc 0 -bo 5 -bs 5 2>/dev/null
