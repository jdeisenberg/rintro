#!/usr/bin/bash

for file do
  new=${file%htm}html
  mv "$file" "$new"
done

