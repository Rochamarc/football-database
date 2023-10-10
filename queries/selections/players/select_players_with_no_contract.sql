SELECT id_player FROM players_contract;

SELECT  players.name Nome,
        players.nationality Nacionalidade,
        players.birth_year Nascimento
FROM players
WHERE players.id NOT IN (SELECT id_player FROM players_contract);