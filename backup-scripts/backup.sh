#!/bin/bash
set -euo pipefail

exclusions=(".DS_Store" ".TemporaryItems" ".Trashes" ".AppleDouble")

# TODO add additional checkis that two params are set
# backup "source" "target" "(exclude1 exclude2)"
# -- 3rd parameter is an optional array of _additional_ exclusions
backup () {
  local -a additional_exclusions=${3:-}
  all_exclusions=(${exclusions[@]} ${additional_exclusions[@]})
  echo "Backing up ${1} to ${2}"
  rsync -arvz --delete --msgs2stderr "${all_exclusions[@]/#/--exclude=}" "${1}" "${2}"
  # rsync -r --delete --existing --ignore-existing --ignore-errors --msgs2stderr "${1}" "${2}"
}


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
backup "${HOME}/Library/Application Support/Google/Chrome/Default/Bookmarks" "/Volumes/flemingg/Bookmarks"
echo "DONE prepping chrome bookmarks"

echo "Backing up Empar"
backup "/Volumes/empar/" "/Volumes/${CURRENT_BACKUP}/empar/"
echo "DONE backing up empar"

echo "Backing up flemingg"
backup "/Volumes/flemingg/" "/Volumes/${CURRENT_BACKUP}/flemingg/"
echo "DONE backing up flemingg"

echo "Backing up media"
backup "/Volumes/media/Pictures/" "/Volumes/${CURRENT_BACKUP}/media/Pictures/" "(PhotoLibrary)"
backup "/Volumes/media/Books/" "/Volumes/${CURRENT_BACKUP}/media/Books/"
backup "/Volumes/media/Music/" "/Volumes/${CURRENT_BACKUP}/media/Music/"
backup "/Volumes/media/TV/" "/Volumes/${CURRENT_BACKUP}/media/TV/"
backup "/Volumes/media/Videos/" "/Volumes/${CURRENT_BACKUP}/media/Videos/"
backup "/Volumes/media/Comics/" "/Volumes/${CURRENT_BACKUP}/media/Comics/"
backup "/Volumes/media/Comedy/" "/Volumes/${CURRENT_BACKUP}/media/Comedy/"
backup "/Volumes/media/Backups/" "/Volumes/${CURRENT_BACKUP}/media/Backups/"
backup "/Volumes/media/Temp/" "/Volumes/${CURRENT_BACKUP}/media/Temp/"
backup "/Volumes/media/Films/" "/Volumes/${CURRENT_BACKUP}/media/Films/"
backup "/Volumes/media/Processing/" "/Volumes/${CURRENT_BACKUP}/media/Processing/" "(processed)"
echo "DONE backing up media"

#TODO IMPLEMENT VERIFICATION CHECKS HERE
