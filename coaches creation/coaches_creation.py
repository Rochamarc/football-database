import mysql.connector
from random import randint, choice

def format_name(first_names: list, last_names: list) -> str:
    first_name, last_name = choice(first_names), choice(last_names)
    return "{} {}".format(first_name[0], last_name[0])


database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'name_generator'
}

insert_coach_query = "INSERT INTO coaches VALUES(NULL, %s, %s, %s, %s, %s);"

first_name_query = "SELECT first_name.value FROM first_name INNER JOIN region ON region_id = id_region WHERE region.language='Portuguese';"
last_name_query = "SELECT last_name.value FROM last_name INNER JOIN region ON region_id = id_region WHERE region.language='Portuguese';"


first_names = [] 
last_names = []

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(first_name_query)
first_names += cursor.fetchall()


cursor.execute(last_name_query)
last_names += cursor.fetchall()

conn.close()

coaches_data = []


for i in range(40):
	name = format_name(first_names, last_names)
	nationality = 'Brazil'
	age = randint(40,70)
	formation = choice(['4-3-3', '4-2-3-1', '3-5-2', '3-4-3', '4-4-2'])
	play_mode = choice(['Offensive', 'Defensive', 'Moderate'])

	coaches_data.append([ name, nationality, age, formation, play_mode ])

database_config['database'] = 'football'

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

for c_d in coaches_data:
	cursor.execute(insert_coach_query, c_d)

conn.commit()
conn.close()

