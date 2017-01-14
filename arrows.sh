#!/bin/bash

for file do
  perl arrows.pl $file > output.txt
  mv output.txt $file
done
