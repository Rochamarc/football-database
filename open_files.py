import os
from random import randint, choice

import mysql.connector

query = 'INSERT INTO clubs (name, country, coeff, class) VALUES (%s,%s,%s,%s);'

def naming_countries(string):
    ''' Return the string according to the pattern '''
    
    if '_' in string: 
        string = string.split('_') 
        data = [ st.capitalize() for st in string ]
        return ' '.join(data)    
    
    return string.capitalize()
    
def formating_files_csv(lines):
    ''' Remove comas and \n and return a list with [ clubs, city ] '''
    
    line = [ i.split(',') for i in lines ]
    line = [ [i[0], i[-1].replace('\n', '')] for i in line ]
    return line
    

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

def insert_clubs_db(clubs: list) -> None:
    '''
    Insert clubs into the database
    '''
    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor()

    for club in clubs:
        cursor.execute(query, club)

    conn.commit()
    conn.close()

    return None


# path file -> files/${continent}/${country}/${clubs}

club_data = []

for continent in os.listdir('files'):
    for country in os.listdir(f'files/{continent}'):
        with open(f'files/{continent}/{country}/clubs.csv') as f:
            #print(f.readlines())
            country = naming_countries(country)
        
            dd = formating_files_csv(f.readlines())
            
            for d in dd: 
                club = d[0]
                coeff = randint(1,100_000)
                c_class = choice(['A','B','C','D','E','F'])
                club_data.append([club, country, coeff, c_class])


insert_clubs_db(club_data)            
            
            
