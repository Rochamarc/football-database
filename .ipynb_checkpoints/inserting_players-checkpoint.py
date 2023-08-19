import mysql.connector
from creating_players import create_players_data

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

if __name__ == "__main__":
    players = create_players_data(10000)
    insert_players(players)