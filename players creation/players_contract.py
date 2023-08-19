import mysql.connector
from pprint import pprint 

select_brazilian_clubs_query = "SELECT clubs.id, clubs.name, clubs.country FROM clubs WHERE clubs.country='Brazil'"
select_brazilian_argetinian_player_query = "SELECT players.id, players.name, players.nationality, players.position, players.age FROM players WHERE players.nationality='Brazil' or 'Argentina'"

# YYYY-MM-DD
# create a two years contract
start_date = '2023-01-01'
end_date = '2024-01-01'
salary = 25_000
termination_fine = 1_000_000

insert_players_contract_query = "INSERT INTO players_contract VALUES(NULL, %s, %s, NULL, %s, %s, %s, %s)"

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(select_brazilian_clubs_query)
clubs = cursor.fetchall()

cursor.execute(select_brazilian_argetinian_player_query)
players = cursor.fetchall()


for club in clubs:
    p_contracts = []
    for i in range(30):
        player = players.pop()
        id_player = player[0] 
        id_club = club[0]
        p_contracts.append([start_date, end_date, salary, termination_fine, id_club, id_player])

    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor()

    for p in p_contracts:
        cursor.execute(insert_players_contract_query, p)

    conn.commit()
    conn.close
