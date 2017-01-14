#!/bin/bash

for file do
  perl change_js_version.pl $file > ../rintro2/$file
done
