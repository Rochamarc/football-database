SELECT players.position, count(*) 
FROM clubs 
INNER JOIN players_contract 
INNER JOIN players 
    ON clubs.id = players_contract.id_club 
    AND players.id = players_contract.id_player
WHERE clubs.name = 'Fluminense'
GROUP BY (players.position);