#!/bin/bash
for file
do
  new=${file%gif}png
  convert "$file" "$new"
done

