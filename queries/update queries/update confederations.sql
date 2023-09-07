/* 
UPDATE CLUBS.NATIONAL_CONFEDERATIONS BASED ON INNER JOIN 

club.country == national_confederations.country

*/
UPDATE clubs 
INNER JOIN national_confederations 
    ON clubs.country = national_confederations.country 
SET clubs.id_national_confederation = national_confederations.id;

/*
SEELCT CLUBS NAME, INTERNATIONAL FEDERATION NAME AND NATIONAL FEDERATION NAME

*/

SELECT clubs.name, international_confederations.name, national_confederations.name 
FROM clubs 
INNER JOIN international_confederations
    ON international_confederations.id = clubs.id_international_confederation 
INNER JOIN national_confederations 
    ON national_confederations.id = clubs.id_national_confederation;
