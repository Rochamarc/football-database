from player_creation import get_player_age


import mysql.connector

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}


select_id_query = "SELECT players.id FROM players;"
update_query = "UPDATE players SET birth_year=%s WHERE id=%s;"

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()


cursor.execute(select_id_query)
ids = cursor.fetchall()

for i in ids:
    update_data = [get_player_age(), i[0]]
    cursor.execute(update_query, update_data)
    
conn.commit()
conn.close()
