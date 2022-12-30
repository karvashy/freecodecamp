#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "truncate table games,teams;"

cat games.csv | while IFS=',', read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
	if [[ ($WINNER != winner) && ($OPPONENT != opponent) ]]
	then
	#add teams
	CHECK_TEAMS=$($PSQL "select name from teams where name='$WINNER'")
	#echo -e "$CHECK_TEAMS"
	if [[ -z $CHECK_TEAMS ]]
	then
		INSERT_TEAMS=$($PSQL "insert into teams (name) values ('$WINNER')")
		#echo -e "$INSERT_TEAMS"
	fi
	CHECK_TEAMS=$($PSQL "select name from teams where name='$OPPONENT'")
	#echo -e "$CHECK_TEAMS"
	if [[ -z $CHECK_TEAMS ]]
	then
		INSERT_TEAMS=$($PSQL "insert into teams (name) values ('$OPPONENT')")
		#echo -e "$INSERT_TEAMS"
	fi
	#get and store team id
	WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'")
	echo "$WIN_ID"
	OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
	echo "$OPP_ID"
	#add entry in games
	INSERT_GAMES=$($PSQL "insert into games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR, '$ROUND',$WIN_ID, $OPP_ID, $W_GOALS, $O_GOALS)")
	fi
done

#INSERT=($PSQL "insert into games(year,round,winner_goals,opponent_goals) values('$YEAR','$ROUND','$WINNER_GOALS','$OPPONENT_GOALS');")
