SELECT players.id, players.position, players_overall.overall 
FROM players
INNER JOIN players_contract
INNER JOIN players_overall
    ON players.id = players_contract.id_player
    AND players.id = players_overall.id_player
WHERE players_overall.season = '2023';