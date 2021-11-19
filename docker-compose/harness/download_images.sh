#!/usr/bin/env bash
set -e

IMAGES=`grep '^\s*image' docker-compose.yml | sed 's/image://' | sort | uniq | sed 's/ ^*//g'`
echo $IMAGES > images.txt
input="images.txt"
imagelist=""
while IFS= read -r line
do
 imagelist="$imagelist `echo $line`"
done < "$input"

echo "Saving the following images to images.tar.gz "$imagelist
docker save $imagelist | gzip > images.tar.gz
rm -f images.txt
echo "Zip this folder and copy it to the destination, untar the images using unpack_images.sh and then run the application using start_harness.sh"
