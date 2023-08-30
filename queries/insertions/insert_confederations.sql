INSERT INTO international_confederations VALUES (NULL, 'CONMEBOL', 'South America');
INSERT INTO international_confederations VALUES (NULL, 'CONCACAF', 'North America');
INSERT INTO international_confederations VALUES (NULL, 'UEFA', 'Europe');
INSERT INTO international_confederations VALUES (NULL, 'CAF', 'Africa');
INSERT INTO international_confederations VALUES (NULL, 'AFC', 'Asia');
INSERT INTO international_confederations VALUES (NULL, 'OFC', 'Oceania');

INSERT INTO national_confederations VALUES (NULL, 'AFA','Argentina');
INSERT INTO national_confederations VALUES (NULL, 'FBF','Bolívia');
INSERT INTO national_confederations VALUES (NULL, 'CBF','Brasil');
INSERT INTO national_confederations VALUES (NULL, 'FFC','Chile');
INSERT INTO national_confederations VALUES (NULL, 'FCF','Colômbia');
INSERT INTO national_confederations VALUES (NULL, 'FEF','Equador');
INSERT INTO national_confederations VALUES (NULL, 'APF','Paraguai');
INSERT INTO national_confederations VALUES (NULL, 'FPF','Peru');
INSERT INTO national_confederations VALUES (NULL, 'AUF','Uruguai');
INSERT INTO national_confederations VALUES (NULL, 'FVF','Venezuela'); 

-- UPDATING JUST SOUTH AMERICAN CLUBS AND INTERNATIONAL CONFEDERATIONS
SELECT id FROM international_confederations WHERE continent='South America'; -- 1

UPDATE clubs 
SET id_international_confederation=1 
WHERE 
country='Brazil' OR country='Argentina' OR country='Peru';

-- PROJETAR CLUBES PELA FEDERAÇAO
SELECT international_confederations.name, clubs.name, clubs.country 
FROM clubs
INNER JOIN international_confederations
    ON id_international_confederation = international_confederations.id;


SELECT * FROM national_confederations;
+----+------+-----------+----------+
| id | name | country   | Changes  |
+----+------+-----------+----------+
|  1 | AFA  | Argentina |          |
|  2 | FBF  | Bolívia   | Bolivia  |
|  3 | CBF  | Brasil    | Brazil   |
|  4 | FFC  | Chile     |          |
|  5 | FCF  | Colômbia  | Colombia |
|  6 | FEF  | Equador   | Ecuador  |
|  7 | APF  | Paraguai  | Paraguay |
|  8 | FPF  | Peru      |          |  
|  9 | AUF  | Uruguai   | Uruguay  |
| 10 | FVF  | Venezuela |          |
+----+------+-----------+----------+

UPDATE clubs
SET id_national_confederation = 3
WHERE clubs.country = 'Brazil';


-- Query of brazilian clubs
SELECT * FROM clubs 
INNER JOIN international_confederations 
INNER JOIN national_confederations 
    ON clubs.id_international_confederation = international_confederations.id 
    AND clubs.id_national_confederation = national_confederations.id;