SELECT  players.name Nome,
        players.nationality Nacionalidade,
        players.birth_year Nascimento,
        clubs.name Clube
FROM players 
INNER JOIN players_contract
INNER JOIN clubs
    ON players.id = players_contract.id_player 
    AND clubs.id = players_contract.id_club;

    
/* INTO OUTFILE '/var/lib/mysql-files/name.txt' */