# this file contain functions for addressbook
## 0.1 show
show_info(){
	# show contact's info to screen
	contact="$@"
	echo
	echo "#---Contact Info---#"
	echo "Name: $(echo "$contact" | cut -d: -f1)"
	echo "Phone number: $(echo "$contact" | cut -d: -f2)"
	echo "Email: $(echo "$contact" | cut -d: -f3)"
	echo "#------------------#"
	echo
}
## 1. search
search_contact(){
	# ask keywords to search
	echo "Please enter keywords to search"
	echo -en "(Default list all): "
	read keyword

	if [ -z $keyword ]; then
		# workaround catCommand
		old_IFS="$IFS"
		IFS=$'\n'

		# if keyword is nothing -> list all
		contacts=`cat book`
		for contact in $contacts
		do
			show_info "$contact"
		done
	else
		# get contact in nice format
		contact="$(grep -i "$keyword" book)"
		show_info "$contact"

		# done workaround catCommand
		IFS="$old_IFS"
	fi
}
## 2. add
add_contact(){
	# ask for name
	echo -en "Enter name: "
	read name
	# ask for phone number
	echo -en "Enter phone number: "
	read pnum
	# ask for email
	echo -en "Enter email: "
	read email
	# save to file with separate is colon (:)
	echo "${name}:${pnum}:${email}" >> book
	echo
}
## 3. remove
remove_contact(){
	# search for a contact
	search_contact
	# confirm delete
	echo -en "Are you sure to remove these contact(s)? (type \"yes\" to confirm) "
	read i
	if [[ -n $i && $i = yes ]]; then
		# delete contact(s)
		sed -i "/${keyword}/Id" book
	else
		# if !yes return
		echo Canceled!
		return 1
	fi
}
## 4. edit
edit_contact(){
	# search for a contact
	search_contact
	# remove this contact
	sed -i "/${keyword}/Id" book
	# add new contact
	echo
	echo "Please re-type contact info:"
	echo "#--------------------------#"
	add_contact
	echo "#--------------------------#"
	echo "Done!"
	echo
}
