import mysql.connector
from pprint import pprint 

query = "SELECT clubs.name, clubs.country FROM clubs WHERE clubs.country='Brazil'"

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

conn = mysql.connector.connect(**database_config)
cursor = conn.cursor()

cursor.execute(query)

select = cursor.fetchall()

for sel in select: 
    print(sel)