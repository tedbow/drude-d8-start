#!/usr/bin/env bash

# Usage
# dsh init-url https://raw.githubusercontent.com/blinkreaction/drude-d8-testing/master/.drude/scripts/drude-init.sh <directory>

# Abort if anything fails
set -e

# Yes/no confirmation dialog with an optional message
# @param $1 confirmation message
_confirm ()
{
	while true; do
		read -p "$1 [y/n]: " answer
		case $answer in
			[Yy]|[Yy][Ee][Ss] )
				break
				;;
			[Nn]|[Nn][Oo] )
				exit 1
				;;
			* )
				echo 'Please answer yes or no.'
		esac
	done
}

_confirm "Initialize project in the current directory?"
git clone -b master https://github.com/blinkreaction/drude-d8-testing.git ./
dsh init
