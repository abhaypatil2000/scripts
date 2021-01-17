#!/usr/bin/bash

# to check updates to the AUR repos on arch linux
# to use add alias to zshrc or bashrc
# alias uu='~/aur/aur_update.sh | column -t | sort'
# now use uu to check updates to AUR packages
dir_count=0

RED='\e[31m'
GREEN='\e[32m'
COLOR_RESET='\e[0m'

cd "/home/abhay/aur/"

for dir in *;
do
	if [ -d "$dir" ];
	then
		(( dir_count++ ))
		(
			# echo "$dir"
			cd "$dir"
			out=$(git fetch --dry-run)
			temp=$(($dir_count % 4))
			if [ -z "$out" ];
			then
				out="UP_TO_DATE"
				echo -ne "${GREEN}$dir : $out${COLOR_RESET}\n"
			else
				out="UPDATE_AVAILABLE"
				echo -ne "${RED}$dir : $out${COLOR_RESET}\n"
			fi

			cd ..
		) &
	fi
done

if [ "$dir_count" -ne 0 ];
then
	wait
fi