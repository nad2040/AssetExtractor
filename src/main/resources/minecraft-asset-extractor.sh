#!/bin/bash
# Description: Minecraft Asset Extractor

ASSETS="$HOME/Library/Application Support/minecraft/assets"
OUTPUT_DIR=$PWD

echo -e "Enter the Minecraft version you want to extract from:"
read version

INDEX=`sed 's/ /\\ /g' <<< "$ASSETS/indexes/$version.json"`

if [ ! -f "$INDEX" ]; then
	echo -e "Unable to extract because that version isn't downloaded or doesn't exist."
	echo -e "Make sure to open the launcher and launch the version from which you need the assets\n"
	read -p "Press [Enter] key to continue..." && exit
fi

echo -e "Selected index.json: $INDEX"

sleep 1

echo
echo -e "Please provide a keyword or asset path for the program to find.\nNote that any directory or filename with your keyword will be extracted."
echo -e "To retrieve only a certain category, put a / before and after your search term. Like this: '/music/'"
echo -e "Please be warned that if you want to extract all sounds, the program will extract around 395 MB"
echo -e "In 1.18, all assets add up to around 466 MB. To extract all, just make the keyword a forward slash: / "

keyword=""
while [ -z "$keyword" ]; do
    echo "Keyword: "
    read keyword
done

for ENTRY in `cat "$INDEX" | python3 -c 'import sys,json; from pprint import pprint; data = json.load(sys.stdin); pprint(data);' | grep $keyword | awk -F\' '{print $2 "," $6}'`
do
  echo "Extracting $ENTRY..."
  FILENAME=`echo $ENTRY | cut -d, -f1`
  FILEHASH=`echo $ENTRY | cut -d, -f2`

  #Locate the file in the assets directory structure
  FULLPATH_HASHFILE=`find "$ASSETS" -name $FILEHASH`

  #Copy the file
  FOLDER=`dirname $FILENAME`
  mkdir -p $FOLDER
  cp "$FULLPATH_HASHFILE" "$OUTPUT_DIR/$FILENAME"

done
