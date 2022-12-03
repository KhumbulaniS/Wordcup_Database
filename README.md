# Wordcup_Database
Developing a world cup database and answering questions using SQL

## World Cup Database  
### Instructions
Follow the instructions and get all the user stories below to pass to finish the project.

You start with several files, one of them is games.csv. It contains a comma-separated list of all games of the final three rounds of the World Cup tournament since 2014; the titles are at the top. It includes the year of each game, the round of the game, the winner, their opponent, and the number of goals each team scored. You need to do three things for this project:

#### Part 1: Create the database

Log into the psql interactive terminal with psql --username=freecodecamp --dbname=postgres and create your database structure according to the user stories below.

Don't forget to connect to the database after you create it.

#### Part 2: Insert the data

Complete the insert_data.sh script to correctly insert all the data from games.csv into the database. The file is started for you. Do not modify any of the code you start with. Using the PSQL variable defined, you can make database queries like this: $($PSQL "<query_here>"). The tests have a 20 second limit, so try to make your script efficient. The less you have to query the database, the faster it will be. You can empty the rows in the tables of your database with TRUNCATE TABLE games, teams;

#### Part 3: Query the database

Complete the empty echo commands in the queries.sh file to produce output that matches the expected_output.txt file. The file has some starter code, and the first query is completed for you. Use the PSQL variable defined to complete rest of the queries. Note that you need to have your database filled with the correct data from the script to get the correct results from your queries. Hint: Test your queries in the psql prompt first and then add them to the script file.



#### Tasks

* You should create a database named worldcup

- You should connect to your worldcup database and then create teams and games tables

- Your teams table should have a team_id column that is a type of SERIAL and is the primary key, and a name column that has to be UNIQUE

- Your games table should have a game_id column that is a type of SERIAL and is the primary key, a year column of type INT, and a round column of type VARCHAR

- Your games table should have winner_id and opponent_id foreign key columns that each reference team_id from the teams table

- Your games table should have winner_goals and opponent_goals columns that are type INT

- All of your columns should have the NOT NULL constraint



THANKS TO https://www.freecodecamp.org/ FOR THE PROJECT



