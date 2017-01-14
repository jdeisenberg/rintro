#!/bin/bash

for file do
   sed -f updater2.sed < $file > data.txt
   mv data.txt $file
   echo "Converted $file"
done
