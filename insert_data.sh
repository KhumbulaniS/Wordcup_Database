#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Delete any informations on the table before uploading
echo $($PSQL "TRUNCATE games, teams")

######READING FILE AND ADDING WINNER TO THE TEAM TABLE
cat games.csv  | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
#Eliminating the heading on the output
if [[ $WINNER != winner ]]
then
#Get team_id for winner
TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
#if not found
if [[ -z $TEAM_ID ]]
  then
#insert winner team
    INSERT_TEAM_RESULTS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULTS == "INSERT 0 1" ]]
        then
        echo $WINNER has been inserted into teams 
      fi
     
fi
fi
done
######READING FILE AND ADDING OPPONENT TO THE TEAM TABLE

cat games.csv  | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
#Eliminating the heading on the output
if [[ $OPPONENT != opponent ]]
  then
#Get team_id for opponent
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
#if not found
  if [[ -z $TEAM_ID ]]
    then
#insert opponent team
      INSERT_TEAM_RESULTS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULTS == "INSERT 0 1" ]]
        then
        echo $OPPONENT has been inserted into teams 
      fi
  
  fi
fi
done 

#### ADDING TO GAMES TABLE

cat games.csv  | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do

if [[ $YEAR != year ]]
  then
#get team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
#insert games
    INSERT_GAME_RESULTS=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR,'$ROUND', $WINNER_ID,$OPPONENT_ID,$W_GOALS,$O_GOALS)")
    if [[ $INSERT_GAME_RESULTS == "INSERT 0 1" ]]
        then
        echo $WINNER vs $OPPNENT game has been added
      fi
fi

done
