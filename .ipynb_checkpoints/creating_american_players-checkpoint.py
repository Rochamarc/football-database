import mysql.connector

first_name_query = "SELECT first_name.value FROM first_name INNER JOIN region ON region_id = id_region WHERE region.language='English';"
last_name_query = "SELECT last_name.value FROM last_name INNER JOIN region ON region_id = id_region WHERE region.language='English';"

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'name_generator'
}

first_names = []
last_names = []

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(first_name_query)
first_names += cursor.fetchall()


cursor.execute(last_name_query)
last_names += cursor.fetchall()

conn.close()

print(first_names)
print(last_names)