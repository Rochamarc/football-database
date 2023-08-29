import mysql.connector
from random import randint 

select_players = """
SELECT players.id, players.position, players_overall.overall 
FROM players
INNER JOIN players_contract
INNER JOIN players_overall
    ON players.id = players_contract.id_player
    AND players.id = players_overall.id_player
WHERE players_overall.season = '2023';
"""

database_config = {
    "host": "localhost",
    "username": "tournament_user",
    "password": "tournament_pass",
    "database": "football"
}

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(select_players)
players_info = cursor.fetchall() # my players info

print(players_info)

season = 2023;
for player_info in players_info:
    matches = 0 
    goals = 0
    assists = 0
    tackles = 0
    clearences = 0
    defenses = 0
    points = 0
    average = 0
    id_player = player_info[0]
    player_position = player_info[1]
    player_overall = player_info[-1]
    
    if player_position == 'GK':
        pass