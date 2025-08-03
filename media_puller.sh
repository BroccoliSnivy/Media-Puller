#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 -A|-V <YouTube URL> <Name>"
  exit 1
fi

FLAG=$1
URL=$2
NAME=$3

AUDIO_DIR="/home/spartan/Music/"
VIDEO_DIR="/home/spartan/Videos/"

mkdir -p "$AUDIO_DIR" "$VIDEO_DIR"

#Flags for Audio and Video output.
case "$FLAG" in
-A)
  yt-dlp -f bestaudio --extract-audio --audio-format mp3 -o "$AUDIO_DIR/${NAME}.%(ext)s" "$URL"
  ;;
-V)
  yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 -o "$VIDEO_DIR/${NAME}.%(ext)s" "$URL"
  ;;
*)
  echo "Invalid flag. Use -A for audio or -V for video."
  exit 1
  ;;
esac
