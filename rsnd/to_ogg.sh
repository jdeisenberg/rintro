#!/bin/bash

for file do
  new=${file%.wav}.ogg
  sox "$file" "$new"
done
