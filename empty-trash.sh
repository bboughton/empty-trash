#!/usr/bin/env bash

date_iso8601() { /bin/date +%Y-%m-%dT%H:%M:%S%z; }
log() { echo "$(date_iso8601) $@"; }

find_trash() {
	local query
	query=$1

	# Using -mindepth 1 -prune, so that if a DIRECTORY is in the Trash every 
	# file in the directory is deleted (good for app bundles)
	/usr/bin/find $HOME/.Trash -mindepth 1 -prune -not -newermt "${query}" 
}

secure_rm() {
	local file
	file=$1

	log "deleting: $file"
	/usr/bin/srm --recursive --medium --zero --force "$file"
}

# limiting number of items to remove so that we don't bog the system down
limit_files=5
days=15

files=$(find_trash "${days} days ago" | head -n${limit_files})

if [ -z "${files}" ]; then
	log "no files found older then ${days} days"
	exit
fi

echo "${files}" | while read file
do
	secure_rm "$file"
done
