#!/bin/bash
cd "$(dirname "$0")"
cd ..
rm -rf voxelands-texture-pack
rm -rf uctextures
mkdir textures
mkdir uctextures

FILES=$(dirname "$0")/../testbdcraft/*.png
for f in $FILES
do
cp $f "uctextures/"
done

cd uctextures

while read p; do
if [ -n "$p" ]
then
if [ -e "trans.png" ]
then
mv trans.png "../textures/$p"
else
mv "$p" trans.png
fi
fi
done < ../mc-to-vl-tp-conv/transtable.txt

cd ..
mv textures voxelands-texture-pack
