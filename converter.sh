#!/bin/bash

for file do
  perl converter.pl $file > ../rintro2/$file
done
