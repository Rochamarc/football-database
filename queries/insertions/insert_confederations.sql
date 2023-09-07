/* International Federations */
INSERT INTO international_confederations VALUES (NULL, 'CONMEBOL', 'South America');
INSERT INTO international_confederations VALUES (NULL, 'CONCACAF', 'North America');
INSERT INTO international_confederations VALUES (NULL, 'UEFA', 'Europe');
INSERT INTO international_confederations VALUES (NULL, 'CAF', 'Africa');
INSERT INTO international_confederations VALUES (NULL, 'AFC', 'Asia');
INSERT INTO international_confederations VALUES (NULL, 'OFC', 'Oceania');

/* South American Federations */
INSERT INTO national_confederations VALUES (NULL, 'AFA','Argentina');
INSERT INTO national_confederations VALUES (NULL, 'FBF','Bolivia');
INSERT INTO national_confederations VALUES (NULL, 'CBF','Braszl');
INSERT INTO national_confederations VALUES (NULL, 'FFC','Chile');
INSERT INTO national_confederations VALUES (NULL, 'FCF','Colombia');
INSERT INTO national_confederations VALUES (NULL, 'FEF','Ecuador');
INSERT INTO national_confederations VALUES (NULL, 'APF','Paraguay');
INSERT INTO national_confederations VALUES (NULL, 'FPF','Peru');
INSERT INTO national_confederations VALUES (NULL, 'AUF','Uruguay');
INSERT INTO national_confederations VALUES (NULL, 'FVF','Venezuela'); 

-- UPDATING JUST SOUTH AMERICAN CLUBS AND INTERNATIONAL CONFEDERATIONS
SELECT id FROM international_confederations WHERE continent='South America'; /* 7 */




-- PROJETAR CLUBES PELA FEDERAÇAO
SELECT international_confederations.name, clubs.name, clubs.country 
FROM clubs
INNER JOIN international_confederations
    ON id_international_confederation = international_confederations.id;


SELECT * FROM national_confederations;

+----+------+-----------+
| id | name | country   |
+----+------+-----------+
| 11 | AFA  | Argentina |
| 12 | FBF  | Bolivia   |
| 13 | CBF  | Brazil    |
| 14 | FFC  | Chile     |
| 15 | FCF  | Colombia  |
| 16 | FEF  | Ecuador   |
| 17 | APF  | Paraguay  |
| 18 | FPF  | Peru      |
| 19 | AUF  | Uruguay   |
| 20 | FVF  | Venezuela |
+----+------+-----------+


UPDATE clubs
SET id_national_confederation = 3
WHERE clubs.country = 'Brazil';

-- Query of brazilian clubs
SELECT * FROM clubs 
INNER JOIN international_confederations 
INNER JOIN national_confederations 
    ON clubs.id_international_confederation = international_confederations.id 
    AND clubs.id_national_confederation = national_confederations.id;