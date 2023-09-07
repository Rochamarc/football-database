import mysql.connector

database_config = {
    "user": "tournament_user",
    "password": "tournament_pass",
    "host": "localhost",
    "database": "football"
}

def get_db_connector():
    """ return a connector from mysql with the database 'football' """    
    conn = mysql.connector.connect(**database_config)
    return conn

