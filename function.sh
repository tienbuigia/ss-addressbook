
# this file contain functions for addressbook
## 1. search
search_contact(){
	# ask keywords to search
	echo -en "Please enter keywords to search\
		(can be name or phone number or email): "
	read keyword
	# use keywords search though book file.
	grep $keyword book
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
## 4. edit

