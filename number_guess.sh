#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
echo Enter your username:
read USERNAME
USERS=$($PSQL "select * from users where username='$USERNAME';")
NUMBER=$(( (RANDOM % 1000)+1 ))
#echo $NUMBER
if [[ -z $USERS ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	NEW_USER=$($PSQL "insert into users (username,total_games,best_game) values ('$USERNAME',1,99999);")
else
	USER=$($PSQL "select username,total_games,best_game from users where username='$USERNAME';")
	#update total_games 
	UPDATE_USER=$($PSQL "update users set total_games = total_games+1 where username='$USERNAME';")
	echo "$USER" | while read NAME BAR TOTAL BAR BEST 
do
	echo "Welcome back, $USERNAME! You have played $TOTAL games, and your best game took $BEST guesses."
done
fi
echo "Guess the secret number between 1 and 1000:"
COUNT=0
while true 
do
read GUESS
#check the number is an integer TODO
if [[ $GUESS =~ ^[0-9]+$ ]]
then
if [[ $GUESS -gt $NUMBER ]]
then
	echo "It's lower than that, guess again:"
	COUNT=$(( COUNT+1 ))
elif [[ $GUESS -lt $NUMBER ]]
then
	echo "It's higher than that, guess again:"
	COUNT=$(( COUNT+1 ))
else
	COUNT=$(( COUNT+1 ))
	BEST_GAME=$($PSQL "select best_game from users where username='$USERNAME';")
	if [[ $BEST_GAME -gt $COUNT ]]
	then
		UPDATE_BEST=$($PSQL "update users set best_game = $COUNT where username='$USERNAME';")
	fi

	echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
	exit
fi
else
	echo "That is not an integer, guess again:"
fi
done
