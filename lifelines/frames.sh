#!/bin/bash
input="fl.txt"
find *.MP4 | sed 's:\ :\\\ :g'| sed 's/^//' > fl.txt
while IFS= read -r line
do
  ffprobe -select_streams v -show_streams "$line" | awk '/nb_frames=/ {print}' >> n_frames.txt
done < "$input"
