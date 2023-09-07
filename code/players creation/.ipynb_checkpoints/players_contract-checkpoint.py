import mysql.connector


select_brazilian_clubs_query = "SELECT clubs.id, clubs.name, clubs.country FROM clubs WHERE clubs.country='Brazil'"
select_brazilian_argetinian_player_query = "SELECT players.id, players.name, players.nationality, players.position, players.birth_year FROM players WHERE players.nationality='Brazil' OR 'Argentina'"

# YYYY-MM-DD
# create a two years contract
start_date = '2023'
end_date = '2024'
salary = 25_000
termination_fine = 1_000_000

insert_players_contract_query = "INSERT INTO players_contract VALUES(NULL, %s, %s, NULL, %s, %s, %s, %s)"

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

conn = mysql.connector.connect(**database_config) # init database and cursor
cursor = conn.cursor()

cursor.execute(select_brazilian_clubs_query) # select brazilian clubs
clubs = cursor.fetchall()

cursor.execute(select_brazilian_argetinian_player_query) # select all brazilian and argentinians players
players = cursor.fetchall()

# position = players[3]
all_players = { 'GK': [], 'RB': [], 'CB': [], 'LB': [], 'DM': [], 'CM': [], 'AM': [], 'RM': [], 'LM': [], 'SS': [], 'WG': [], 'CF': [] }

for player in players:
    ''' Separate players data with positions '''
    all_players[player[3]].append(player)


p_contracts = [] 

for club in clubs:
    for position, players in all_players.items():
        for _ in range(3):
            player = all_players[position].pop()
            id_player = player[0] 
    
            id_club = club[0]
            p_contracts.append([start_date, end_date, salary, termination_fine, id_club, id_player])

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

for p in p_contracts:
    cursor.execute(insert_players_contract_query, p)

conn.commit()
conn.close
