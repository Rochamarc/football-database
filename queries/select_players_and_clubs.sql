SELECT clubs.name, players.name, players.nationality, players.position, players.birth_year, players_contract.value, 
players_contract.salary, players_contract.termination_fine
FROM clubs 
    INNER JOIN players_contract 
    INNER JOIN players 
ON clubs.id = players_contract.id_club 
AND players.id = players_contract.id_player;