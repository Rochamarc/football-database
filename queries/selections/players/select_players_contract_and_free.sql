SELECT  players.name Nome,
        players.nationality Nacionalidade,
        players.birth_year Nascimento,
        IFNULL(clubs.name, "FREE AGENT") Clube
FROM players 
LEFT JOIN players_contract
    ON players.id = players_contract.id_player 
LEFT JOIN clubs
    ON clubs.id = players_contract.id_club;
    
/* INTO OUTFILE '/var/lib/mysql-files/name.txt' */