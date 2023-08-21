import os

creation_files = [ 
    'create_brazilian_players.py', 
    'creating_american_players.py', 
    'creating_spanish_players.py', 
    'players_contract.py', 
    'inserting_overall.py'
]

for file in creation_files:
    print("Inserting {}".format(file))

    os.system("python players\ creation/{}".format(file))


