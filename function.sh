
# this file contain functions for addressbook
## 1. search
search_contact(){
	# ask keywords to search
	echo "Please enter keywords to search"
	echo -en "(Default list all): "
	read keyword
	# if keyword is nothing -> list all
	[ -z $keyword ] && cat book ||\
		# get line that have keyword
		grep -i "$keyword" book
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
