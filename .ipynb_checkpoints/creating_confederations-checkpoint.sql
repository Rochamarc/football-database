INSERT INTO confederations VALUES (NULL, 'CONMEBOL', 'South America');
INSERT INTO confederations VALUES (NULL, 'CONCACAF', 'North America');
INSERT INTO confederations VALUES (NULL, 'UEFA', 'Europe');
INSERT INTO confederations VALUES (NULL, 'CAF', 'Africa');
INSERT INTO confederations VALUES (NULL, 'AFC', 'Asia');
INSERT INTO confederations VALUES (NULL, 'OFC', 'Oceania');


-- UPDATING JUST SOUTH AMERICAN CLUBS
SELECT id FROM confederations WHERE continent='South America'; -- 1

UPDATE clubs 
SET id_confederation=1 
WHERE 
country='Brazil' OR country='Argentina' OR country='Peru';

-- PROJETAR CLUBES PELA FEDERAÇAO
SELECT confederations.name, clubs.name, clubs.country 
FROM clubs
INNER JOIN confederations
    ON id_confederation = confederations.id;