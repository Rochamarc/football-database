import mysql.connector
from random import randint, choice, uniform 


query = 'INSERT INTO players(name, nationality, age, position, height, weight, foot, retired) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)'

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

def insert_players(players: list) -> None:
    ''' Insert players into the database '''
    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor()

    for player in players:
        cursor.execute(query, player)

    conn.commit()
    conn.close()

    return None

def define_name() -> str:
    ''' Define players name '''
    name = ''
    
    with open('files/players/first_names.csv', 'r') as f:
        line = f.readlines()
        line = [ i.split(',') for i in line ]
        name += choice([ i[0] for i in line ])
    
    name += ' '
    
    with open('files/players/last_names.csv', 'r') as f:
        line = f.readlines()
        line = [ i.split(',') for i in line ]
        name += choice([ i[0] for i in line ])
        
    return name 


def player_data() -> list:
    nationality = choice(['Brazil', 'Argentina', 'Bolivia', 'Uruguay' ]) # for while
    
    name = define_name()
    
    age = randint(15,40)
    positions = choice([ 'GK', 'RB', 'CB', 'LB', 'DM', 'CM', 'AM', 'RM', 'LM', 'RW', 'LW', 'SS', 'CF' ])
    height =  float("{0:.2f}".format(uniform(1.6,1.9)))
    weight = float("{0:.2f}".format(uniform(60,90)))
    foot = choice(choice(['R', 'L']))
    retired = 'F'

    return [ name, nationality, age, positions, height, weight, foot, retired ]

players = []

for _ in range(10000):
    players.append(player_data())

insert_players(players)