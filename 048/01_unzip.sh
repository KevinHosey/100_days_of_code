#!/bin/bash
# Unzip all compressed files in directory

for f in *.zip;
do
  dir=${f%.zip}

  unzip -d "./$dir" "./$f"
done
