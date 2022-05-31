# this file contain functions for addressbook
## 0.1 show
show_info(){
	# change Internal Field Separator
	old_IFS="$IFS"
	IFS=":"

	# show contact's info to screen
	contact="$@"
	set -- $contact
	echo
	echo "#---Contact Info---#"
	echo "Name: $1"
	echo "Phone number: $2"
	echo "Email: $3"
	echo "#------------------#"
	echo

	# restore IFS
	IFS="$old_IFS"
}
## 1. search
search_contact(){
	# ask keywords to search
	echo "Please enter keywords to search"
	echo -en "(Default list all): "
	read keyword

	if [ -z $keyword ]; then
		# if keyword is nothing -> list all
		contacts=`cat book`
		for contact in $contacts
		do
			show_info $contact
		done
	else
		# get contact in nice format
		contact="$(grep -i "$keyword" book)"
		show_info $contact
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
}
## 3. remove
remove_contact(){
	# search for a contact
	echo searching...
	# delete this contact line
}
## 4. edit
edit_contact(){
	# search for a contact
	echo searching....
	# remove this contact
	# add new contact
}
