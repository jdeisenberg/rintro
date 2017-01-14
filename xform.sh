#!/bin/bash

for file do
   sed -f updater.sed < $file > data.txt
   mv data.txt $file
   echo "Converted $file"
done
