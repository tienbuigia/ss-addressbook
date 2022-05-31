#!/bin/sh
# AddressBook

# source functions
source ./function.sh

# Show menu to screen
clear
figlet Tien dep trai!
echo
echo "###----------Address Book----------###"
echo "1. Search"
echo "2. Add"
echo "3. Remove"
echo "4. Edit"
echo "q. Quit"
echo "###--------------------------------###"
echo

i=-1
while [ "$i" != 'q' ]; do
	# read input
	# base on input, act accordingly
	echo -en "Choose your option: "
	read i
	case $i in
		1)
			search_contact
			;;
		2)
			add_contact
			;;
		3)
			echo removing...
			;;
		4)
			echo editing...
			;;
		q)
			figlet bye bye!
			exit
			;;
		*)
			echo Invalid options
			;;
	esac
done
