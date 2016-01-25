# Empty Trash

Simple script to automatically empty the trash on osx

## Usage

Once installed this script will be run everyday at 5 in the morning by launchd.
The script will find files in your trash that were created more then 15 days ago
and use `srm` to securely remove them.

## Intsall

	make install

## Uninstall

	make uninstall
