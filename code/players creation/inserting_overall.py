from random import randint
import mysql.connector


database_config = {
    'user': 'tournament_user',
    'host': 'localhost',
    'password': 'tournament_pass',
    'database': 'football'
}


def get_players_id() -> list:
    '''
    '''
    query = 'SELECT id FROM players'

    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor()

    cursor.execute(query)
    select = cursor.fetchall()

    conn.close()
    return [ i[0] for i in select ]


def insert_overall(players_id: list) -> None:
    '''
    '''
    conn = mysql.connector.connect(**database_config)
    cursor = conn.cursor()

    for id in players_id:
        overall = randint(50,90)
        query = f'INSERT INTO players_overall VALUES(NULL, {overall}, 1, {id})'
        cursor.execute(query)
    
    conn.commit()
    conn.close()

    return None

if __name__ == "__main__":
    insert_overall(get_players_id())