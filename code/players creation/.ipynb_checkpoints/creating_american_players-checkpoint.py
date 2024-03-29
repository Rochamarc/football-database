# Create players from germany, US, england and walles
#
#

import mysql.connector

from player_creation import *

first_name_query = "SELECT first_name.value FROM first_name INNER JOIN region ON region_id = id_region WHERE region.language='English';"
last_name_query = "SELECT last_name.value FROM last_name INNER JOIN region ON region_id = id_region WHERE region.language='English';"

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'name_generator'
}

first_names = [] # list de sets, com um valor somente dentro
last_names = []

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(first_name_query)
first_names += cursor.fetchall()


cursor.execute(last_name_query)
last_names += cursor.fetchall()

conn.close()

insert_player_query = "INSERT INTO players(name, nationality, position, height, weight, foot, birth_year, retired) VALUES(%s, %s, %s, %s, %s, %s, %s, NULL)"

players = []
for _ in range(150000):
    name = format_name(first_names, last_names)
    nationality = choice(['United States', 'Germany', 'England', 'Walles'])
    birth_year = get_player_age()
    position = get_player_position()
    height = get_player_height(position)
    weight = get_player_wight()
    foot = get_player_foot()

    players.append([ name, nationality, position, height, weight, foot, birth_year ])
    

database_config['database'] = 'football'

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

for player in players:
    cursor.execute(insert_player_query, player)

conn.commit()
conn.close()
