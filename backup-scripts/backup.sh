#!/bin/bash
set -euo pipefail



echo "Starting backup"

# Current gen are INDIA and JULIET
# CURRENT_BACKUP="INDIA"
# Autodetect mounted volumes
[[ -d "/Volumes/INDIA" ]] && CURRENT_BACKUP="INDIA" || CURRENT_BACKUP="JULIET"



# Verify all mount locations are present
# TODO Add checks that the mounts are both present and the correct volumes are mounted
backupLocations="/Volumes/${CURRENT_BACKUP}/ /Volumes/media/ /Volumes/empar/ /Volumes/flemingg"
set -- $backupLocations
DIRS=$@
for i in "$@"
do
  if [ ! -d $i ]; then
    echo "Directory $i does not exist"
    exit 1
  fi
done

echo "Selecting ${CURRENT_BACKUP} as backup location"

echo "Prepping chrome bookmarks"
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" ~/Library/Application\ Support/Google/Chrome/Default/Bookmarks /Volumes/flemingg/Bookmarks
echo "DONE prepping chrome bookmarks"

echo "Backing up Empar"
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/empar/ /Volumes/${CURRENT_BACKUP}/empar/
echo "DONE backing up empar"

echo "Backing up flemingg"
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/flemingg/ /Volumes/${CURRENT_BACKUP}/flemingg/
echo "DONE backing up flemingg"

echo "Backing up media"
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" --exclude="PhotoLibrary" /Volumes/media/Pictures/ /Volumes/${CURRENT_BACKUP}/media/Pictures/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Books/ /Volumes/${CURRENT_BACKUP}/media/Books/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Music/ /Volumes/${CURRENT_BACKUP}/media/Music/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/TV/ /Volumes/${CURRENT_BACKUP}/media/TV/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Videos/ /Volumes/${CURRENT_BACKUP}/media/Videos/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Comics/ /Volumes/${CURRENT_BACKUP}/media/Comics/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Comedy/ /Volumes/${CURRENT_BACKUP}/media/Comedy/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Backups/ /Volumes/${CURRENT_BACKUP}/media/Backups/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Temp/ /Volumes/${CURRENT_BACKUP}/media/Temp/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" /Volumes/media/Films/ /Volumes/${CURRENT_BACKUP}/media/Films/
rsync -arvz --delete --exclude=".DS_Store" --exclude=".TemporaryItems" --exclude=".Trashes" --exclude=".AppleDouble" --exclude="processed" /Volumes/media/Processing/ /Volumes/${CURRENT_BACKUP}/media/Processing/
echo "DONE backing up media"

#TODO IMPLEMENT VERIFICATION CHECKS HERE
