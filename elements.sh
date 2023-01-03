#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
if [[ -z $1 ]]
then
	echo Please provide an element as an argument.
	exit
fi
if [[ $1 =~ [0-9]+ ]]
then
	#atomic_number case
	DETAILS=$($PSQL "select * from elements inner join properties on elements.atomic_number = properties.atomic_number inner join types on properties.type_id = types.type_id where elements.atomic_number=$1;")
	if [[ -z $DETAILS ]]
	then
		echo "I could not find that element in the database."
		exit
	fi
elif [[ ${#1} -gt 2 ]]
then
	#element name case
	DETAILS=$($PSQL "select * from elements inner join properties on elements.atomic_number = properties.atomic_number inner join types on properties.type_id = types.type_id where elements.name='$1';")
	if [[ -z $DETAILS ]]
	then
		echo "I could not find that element in the database."
		exit
	fi
elif [[ ${#1} -lt 3 ]]
then
	# symbol case
	DETAILS=$($PSQL "select * from elements inner join properties on elements.atomic_number = properties.atomic_number inner join types on properties.type_id = types.type_id where elements.symbol='$1';")
	if [[ -z $DETAILS ]]
	then
		echo "I could not find that element in the database."
		exit
	fi
fi
if [[ -z $DETAILS ]]
then
	#should enter
	echo "Something wrong"
else
	echo "$DETAILS" | while read ID BAR SYMBOL BAR NAME BAR ID BAR MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID BAR TYPE_ID BAR TYPE
do
	#Actual printing
	echo "The element with atomic number $ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
fi
#echo out $1 
