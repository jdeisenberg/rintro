#!/bin/bash

for file do
  new=${file%.wav}.mp3
  lame "$file" "$new"
done
