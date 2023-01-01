#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon  -t -c"
SERVICES=$($PSQL "select * from services;")
START(){
read SERVICE_ID_SELECTED 
SELECT_SERVICE=$($PSQL "select * from services where service_id=$SERVICE_ID_SELECTED;")
if [[ -z $SELECT_SERVICE ]]
then
	MAIN_MENU
else
	#get service_id,phone,name and time
	echo "Enter phone number"
	read CUSTOMER_PHONE
	#check if customer using phone
	CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
	if [[ -z $CUSTOMER_ID ]]
	then
		echo "Enter name"
		read CUSTOMER_NAME
		ADD_CUSTOMER=$($PSQL "insert into customers (phone,name) values ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
	fi
	if [[ -z $CUSTOMER_NAME ]]
	then
		CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
	fi

		CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
		echo "Enter service time"
		read SERVICE_TIME
		ADD_APPT=$($PSQL "insert into appointments (customer_id,service_id,time) values ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
	
		SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED;")
		CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^ *//')
	echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 
fi
}
MAIN_MENU(){
echo "$SERVICES" | while read ID BAR NAME
do
	echo $ID\) $NAME
done
START
}
MAIN_MENU
