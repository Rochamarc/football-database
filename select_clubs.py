import mysql.connector 
import pandas as pd 

query = '''SELECT clubs.name, clubs.country, clubs.class, international_confederations.name 
FROM clubs INNER JOIN international_confederations 
ON id_international_confederation = international_confederations.id
'''

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

print(pd.DataFrame(select, columns=['Name', 'Country', 'Class', 'Confederation']))
