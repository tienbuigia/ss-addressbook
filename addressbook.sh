#!/bin/sh
# AddressBook

# source functions
source ./function.sh

show_menu(){
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
	echo "m. Show this Menu"
	echo "###--------------------------------###"
	echo
}

get_option(){
	i=-1
	while [ "$i" != 'q' ]; do
		# read input
		# base on input, act accordingly
		echo -en "Choose your option('m' to show menu): "
		read i
		case $i in
			1)
				search_contact
				;;
			2)
				add_contact
				;;
			3)
				remove_contact
				;;
			4)
				edit_contact
				;;
			m)
				show_menu
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
}

###############################
### Main program start here ###
###############################

show_menu; get_option
