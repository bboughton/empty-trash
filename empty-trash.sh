#!/usr/bin/env bash

date_iso8601() { /bin/date +%Y-%m-%dT%H:%M:%S%z; }
log() { echo "$(date_iso8601) $@"; }


# Find files in the local trash that haven't been modified in the last 30 days
# Securely remove all the old files and directories with 7 passes
#
# Using -mindepth 1 -prune, so that if a DIRECTORY is in the Trash every file
# in the directory is deleted (good for app bundles)
# /usr/bin/find $HOME/.Trash -mindepth 1 -prune -not -newermt '30 days ago' -exec /usr/bin/srm --recursive --medium --zero --force {} \;
log "looking for trash older then 15 days"
/usr/bin/find $HOME/.Trash -mindepth 1 -prune -not -newermt "15 days ago" | while read file
do
	log "deleting: $file"
	/usr/bin/srm --recursive --medium --zero --force "$file"
done
