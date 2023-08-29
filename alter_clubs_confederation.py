import mysql.connector

select_query = "SELECT id FROM confederations WHERE continent=%s"
update_query = "UPDATE clubs SET id_confederation=%s WHERE country=%s"

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

    
    cursor.execute(select_query, [continent])
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
        cursor.execute(update_query, [id_confederation, country])

    conn.commit()
    conn.close()
    
