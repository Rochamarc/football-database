SELECT clubs.name, clubs.country, clubs.class, 
international_confederations.name, international_confederations.continent
FROM clubs
INNER JOIN international_confederations
    ON international_confederations.id = clubs.id_international_confederation;