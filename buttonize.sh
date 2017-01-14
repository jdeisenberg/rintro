#!/bin/bash

for file do
  perl buttonize.pl $file > ../rintro2/$file
done
