import mysql.connector

query = 'INSERT INTO clubs (name, country, class) VALUES (%s,%s,%s);'

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
            
