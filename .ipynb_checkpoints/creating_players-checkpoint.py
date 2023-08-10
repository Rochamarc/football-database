from random import choice, randint, uniform

def select_name(name_type:str) -> str:
    ''' Select a name from file/players/${name_file}.csv '''

    with open(f'files/players/{name_type}.csv', 'r') as f:
        line = f.readlines()
        line = [ i.split(',') for i in line ]
        return choice([ i[0] for i in line ])

def define_name() -> str:
    ''' Define players name '''
    return ' '.join([select_name('first_names'), select_name('last_names')]) 

def player_data() -> list:
    ''' Generate random player data '''
    name = define_name()
    nationality = choice(['Brazil', 'Argentina', 'Bolivia', 'Uruguay' ]) # for while  
    age = randint(15,40)
    positions = choice([ 'GK', 'RB', 'CB', 'LB', 'DM', 'CM', 'AM', 'RM', 'LM', 'RW', 'LW', 'SS', 'CF' ])
    height =  float("{0:.2f}".format(uniform(1.6,1.9)))
    weight = float("{0:.2f}".format(uniform(60,90)))
    foot = choice(choice(['R', 'L']))
    retired = 'F'

    return [ name, nationality, age, positions, height, weight, foot, retired ]

def create_players_data(i_range: int) -> list:
    ''' Generate a range of players_data '''
    players = [ player_data() for _ in range(i_range) ]

    return players
    