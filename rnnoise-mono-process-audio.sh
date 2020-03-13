#!/usr/bin/env bash

filename=$(basename -- "$1")
filename="${filename%.*}"
echo "Audio File Name: $filename"

echo "Converting to RAW PCM..."
ffmpeg -i "$1" -ac 1 -af aresample=resampler=soxr -ar 48000 -f s16le -acodec pcm_s16le "$filename.s16le.input"
echo "Convert to RAW PCM done."

echo "Process RAW PCM with rnnoise..."
./rnnoise/examples/rnnoise_demo "$filename.s16le.input" "$filename.s16le.output"
echo "Process RAW PCM with rnnoise done."

echo "Encode to FLAC..."
ffmpeg -f s16le -ar 48000 -i "$filename.s16le.output" -acodec flac -compression_level 5 "$filename.rnnoise.flac"
echo "Encode to FLAC done."

echo "Cleaning up..."
rm "$filename.s16le.input"
rm "$filename.s16le.output"
echo "Clean up done."

echo "Processed file: $filename.rnnoise.flac"
