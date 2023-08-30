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
SET id_confederation=1 
WHERE 
country='Brazil' OR country='Argentina' OR country='Peru';

-- PROJETAR CLUBES PELA FEDERAÇAO
SELECT international_confederations.name, clubs.name, clubs.country 
FROM clubs
INNER JOIN international_confederations
    ON id_confederation = international_confederations.id;