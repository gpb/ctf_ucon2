#!/bin/bash

#initializing and tests
PROGRAM_NAME=${0}

REGISTER_FILE="/ctf_ucon2/registered_ids"
#REGISTERED_IDS=`cat $REGISTER_FILE`
REGISTERED_IDS="rafael julio marcos"

TAG_FILE=`whoami`.tags
TAGGED_IDS=`cat ${TAG_FILE}`

#the register and tag files are needed! <<< ATENTION
#they should exist previously to this script execution
#attention to they permissions and attributes
touch ${TAG_FILE}

#end of initialization and tests










#auxiliary functions
function helper() {
	echo " ----------- [${PROGRAM_NAME}] ----------- "
	echo -e " ::. ${1} "
	echo ""
}

function check_input() {
	#the user must provide an id
	if [ ${#} != 1 ]; then
		return 1
	else #everything is ok
		return 0
	fi
}

function id_is_registered() {
	ID=${1}
	for I in ${REGISTERED_IDS}; do
		if [ ${I} = ${ID} ]; then
			return 0 #id found in id file
		fi
	done
	return 1 #id not found (invalid id)
}

function id_is_tagged() {
	ID=${1}
	for I in ${TAGGED_IDS}; do
		if [ ${I} = ${ID} ]; then
			return 0 #id found in id file
		fi
	done
	return 1 #id not found (invalid id)
}
#end of auxiliary functions









#checking if a input was provided
check_input ${@}
if [ ${?} -eq 1 ]; then
	helper "Usage: ${PROGRAM_NAME} <userid>"
	exit 1
fi

#checking if the input is a valid user id
id_is_registered ${1}
if [ ${?} -eq 1 ]; then
	helper "Please use a valid id!"
	exit 1
fi

#check if the level is already tagged
id_is_tagged ${1}
if [ ${?} -eq 1 ]; then
	#appending ID to the tag file
	echo ${1} >> ${TAG_FILE}
	helper "Tagging this level now!!"
else
	helper "You already tagged this level!"
fi

exit 0
