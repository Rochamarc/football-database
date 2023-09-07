import mysql.connector

database_config = {
	'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

get_brazilian_clubs = "SELECT clubs.id FROM clubs WHERE clubs.country='Brazil';"
insert_coaches_contract = "INSERT INTO coaches_contract VALUES(NULL, NULL, %s, %s, %s, %s);"


conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(get_brazilian_clubs)

clubs_id = cursor.fetchall()

i = 0
for c_id in clubs_id:
	i += 1
	cursor.execute(insert_coaches_contract, [20_000, 1_000_000, c_id[0], i])

conn.commit()
conn.close()

