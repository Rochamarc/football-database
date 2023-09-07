SELECT clubs.name, players.name, players.position, players.birth_year, players_contract.value, 
players_contract.salary, players_contract.termination_fine, players_overall.overall,
seasons.season 
FROM clubs 
    INNER JOIN players_contract 
    INNER JOIN players 
    INNER JOIN players_overall 
    INNER JOIN seasons
ON clubs.id = players_contract.id_club 
AND players.id = players_contract.id_player 
AND players.id = players_overall.id_player
AND players_overall.id_season = seasons.id;