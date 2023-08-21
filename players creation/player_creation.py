from random import triangular,choice, randint

def get_player_position() -> str:
    return choice(['GK', 'CB', 'RB', 'LB', 'DM', 'CM', 'AM', 'RM', 'LM', 'SS', 'WG', 'CF'])

def get_player_height(position: str) -> float:
    ''' Get Player height by position '''
    
    if position in [ 'GK', 'CB' ]:
        low = 1.90
    else:
        low = 1.50
    
    return float("{:.2f}".format(triangular(low, 2)))
    
def get_player_wight() -> float:
    return float("{:.2f}".format(triangular(60,90)))

def get_player_foot() -> str:
    return choice(['Right','Left'])

def format_name(first_names: list, last_names: list) -> str:
    first_name, last_name = choice(first_names), choice(last_names)
    return "{} {}".format(first_name[0], last_name[0])
    
def get_player_age():
    return randint(1889,2006)