SELECT * FROM clubs WHERE name='Fluminense';

+-----+------------+---------+-------+-------+-------+-----------+--------------+---------------+
| id  | name       | country | state | coeff | class | formation | total_budget | salary_budget |
+-----+------------+---------+-------+-------+-------+-----------+--------------+---------------+
| 602 | Fluminense | Brazil  | NULL  | 68095 | D     | NULL      |         NULL |          NULL |
+-----+------------+---------+-------+-------+-------+-----------+--------------+---------------+

DESC players_contract

+------------------+------+------+-----+---------+----------------+
| Field            | Type | Null | Key | Default | Extra          |
+------------------+------+------+-----+---------+----------------+
| id               | int  | NO   | PRI | NULL    | auto_increment |
| value            | int  | YES  |     | NULL    |                |
| salary           | int  | NO   |     | NULL    |                |
| termination_fine | int  | YES  |     | NULL    |                |
| id_club          | int  | YES  | MUL | NULL    |                |
| id_player        | int  | YES  | MUL | NULL    |                |
+------------------+------+------+-----+---------+----------------+

-- Select some specific players
SELECT name, position, age, id FROM players Where nationality='Brasil' AND age<20;


-- Making some contracts
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10980);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10978);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10813);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10809);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10529);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10225);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10200);
INSERT INTO players_contract VALUES (NULL, '2023-01-01', '2026-01-01', 1000000, 250000, 2000000, 602, 10001);

/*
SELECT name, country, id FROM clubs;
SELECT id, name, age, position FROM players;
SELECT id_club, value, salary, termination_fine, id_player FROM players_contract;
*/

-- JOIN CLUB, PLAYER_CONTRACT AND PLAYER

SELECT clubs.name, clubs.country, 
players_contract.start_date, players_contract.end_date, players_contract.value, players_contract.salary, players_contract.termination_fine, 
players.name, players.age, players.position
FROM clubs 
    INNER JOIN players_contract 
    ON clubs.id = id_club
    INNER JOIN players 
    ON players.id = id_player;