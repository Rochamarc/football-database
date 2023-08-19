import mysql.connector

query = 'SELECT id FROM confederations WHERE continent={}'

database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}

def get_confederation_id(continent: str) -> int:
    '''
    '''
    
    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor() 

    
    cursor.execute("SELECT id FROM confederations WHERE continent='{}'".format(continent))
    re = cursor.fetchall()
    
    conn.close()

    return re[0][0]

def alter_confederations(continent: str, countries: list) -> None:
    ''' 
    '''
    
    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor() 

    id_confederation = get_confederation_id(continent)

    for country in countries:
        cursor.execute("UPDATE clubs SET id_confederation={} WHERE country='{}'".format(id_confederation, country))

    conn.commit()
    conn.close()
    
