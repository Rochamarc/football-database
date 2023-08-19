/* ID, NAME, NATIONALITY, AGE, OVERALL, SEASON */

-- 26 years or younger and overall of 2023
SELECT players.id, players.name, players.nationality, players.age, players_overall.overall, players_overall.season 
FROM players 
    INNER JOIN players_overall
    ON players_overall.id_player = players.id
WHERE players.age <= 26 AND players_overall.season = '2023';

-- 26 year or younger and overall of 2023 and overall >= 85
SELECT players.id, players.name, players.nationality, players.age, players_overall.overall, players_overall.season 
FROM players 
    INNER JOIN players_overall
    ON players_overall.id_player = players.id
WHERE players.age <= 26 AND (players_overall.season = '2023' AND players_overall.overall >= 85);