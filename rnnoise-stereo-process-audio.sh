#!/usr/bin/env bash

filename=$(basename -- "$1")
filename="${filename%.*}"
echo "Audio File Name: $filename"

echo "Converting to RAW PCM..."
ffmpeg -i "$1" -map_channel 0.0.0 -af aresample=resampler=soxr -ar 48000 -f s16le -acodec pcm_s16le "$filename.s16le.left.input" -map_channel 0.0.1 -af aresample=resampler=soxr -ar 48000 -f s16le -acodec pcm_s16le "$filename.s16le.right.input"
echo "Convert to RAW PCM done."

echo "Process Left Channel RAW PCM with rnnoise..."
./rnnoise/examples/rnnoise_demo "$filename.s16le.left.input" "$filename.s16le.left.output"
echo "Process RAW PCM with rnnoise done."

echo "Process Right Channel RAW PCM with rnnoise..."
./rnnoise/examples/rnnoise_demo "$filename.s16le.right.input" "$filename.s16le.right.output"
echo "Process RAW PCM with rnnoise done."

echo "Encode to FLAC..."
ffmpeg -f s16le -ar 48000 -i "$filename.s16le.left.output" -f s16le -ar 48000 -i "$filename.s16le.right.output" -filter_complex "[0:a][1:a]amerge=inputs=2[a]" -map "[a]" -acodec flac -compression_level 5 "$filename.rnnoise.flac"
echo "Encode to FLAC done."

echo "Cleaning up..."
rm "$filename.s16le.right.input"
rm "$filename.s16le.right.output"
rm "$filename.s16le.left.input"
rm "$filename.s16le.left.output"
echo "Clean up done."

echo "Processed file: $filename.rnnoise.flac"
