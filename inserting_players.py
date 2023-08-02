import mysql.connector
from random import randint, choice 

''' 
Nessa query existe um erro de modelagem, 'alem de varios', 
country deveria ser uma tabela ja que 

[brasil, argentina, frança, ... ] => pais  

e eu sinceramente nao sei pra que essa porra desse coeff serve

'''

query = 'INSERT INTO clubs (name, country, coeff, class) VALUES (%s,%s,%s,%s);'

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



clubs_names = {
    'Brasil': {
        'Fluminense', 
        'Flamengo',
        'Vasco',
        'Botafogo',
        'Cruzeiro',
        'Atlético Mineiro',
        'América Mineiro',
        'Brasil de Pelotas',
        'Botafogo-SP',
        'Botafogo-PB',
        'Portuguesa',
        'Portuguesa-RJ',
        'Internacional',
        'Grêmio',
        'Corinthians',
        'Palmeiras',
        'São Paulo',
        'Santos',
        'Ferroviario',
    },
    'França': {
        'Nantes',
        'PSG',
        'Lorient',
        'Lille',
        'Bordoux'
    },
    'EUA':{
        'LA Galaxy',
        'LA FC',
        'Miami FC',
    },
    'Inglaterra': {
        'Manchester United',
        'Manchester City',
        'Chelsea',
        'Arsenal',
        'Sheffield United',
        'Sheffield Wednesday',
        'Bournmouth',
        'Nottingham Forest',
        'Liverpol',
        'Newcastle United'
    },
    'Espanha': {
        'Real Madrid',
        'Atletico de Madrid',
        'Villareal',
        'Barcelona',
        'Valencia',
        'Rayo Vallecano',
        'Real Sociedad',
        'Mallorca',
        'Celta de Vigo',
        'Osasuna'
    },
    'Argentina': {
        'River Plate',
        'Boca Juniors',
        'Argentino Juniors',
        'Godoy Cruz',
        'Gimnasia',
        'Independiente',
        'Velez Sarsfield',
        'San Lorenzo',
        'Colón',
        'Tigre',
        'Huracan',
        'Lanús',
        'Talleres',
        'Rosario Central',
        'Estudiantes de La Plata',
        'Newells Old Boys'
    }
}    

clubs_data = []

for country, clubs in clubs_names.items():
    for club in clubs:
        data = []
        coeff = randint(1,100_000)
        c_class = choice(['A','B','C','D','E','F'])
        data += [club, country, coeff, c_class]
        clubs_data.append(data)
        data = []

insert_clubs_db(clubs_data)