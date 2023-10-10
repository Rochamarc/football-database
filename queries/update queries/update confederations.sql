/*
UPDATE CLUBS INTERNATIONAL FEDERATION 
FROM SOUTH AMERICAN CLUBS
*/

UPDATE clubs 
INNER JOIN international_confederations
    ON international_confederations.continent='South America'
SET clubs.id_international_confederation = international_confederations.id
WHERE clubs.country IN ('Argentina','Bolivia','Brazil','Chile','Colombia','Ecuador','Paraguay','Peru','Uruguay','Venezuela');

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


/* UPDATE NORTH AMERICAN CLUBS */

UPDATE clubs 
INNER JOIN international_confederations
    ON international_confederations.continent='North America'
SET clubs.id_international_confederation = international_confederations.id
WHERE clubs.country 
IN ('canada','united states','dominician republic','anguilla','mexico','aruba',
'barbados','dominica','british virgin islands','bahamas','el salvador',
'bonaire','cayman islands','bermuda','belize','curaçao','french guiana',
'costa rica','jamaica','cuba','antigua and barbuda');

/* UPDATE EUROPEAN */
UPDATE clubs 
INNER JOIN international_confederations
    ON international_confederations.continent='Europe'
SET clubs.id_international_confederation = international_confederations.id
WHERE clubs.country 
IN ('austria','ukraine','croatia','czech republic','russia',
'portugal','spain','italy','denmark','greece','germany',
'belgium','france','england');

/* UPDATE ASIAN */
UPDATE clubs 
INNER JOIN international_confederations
    ON international_confederations.continent='Asia'
SET clubs.id_international_confederation = international_confederations.id
WHERE clubs.country 
IN ('bangladesh','australia','jordan','kuwait','democratic people republic of korea','laos',
'iraq','bhutan','iran','china people republic','indonesia','japan','india','afghanistan',
'cambodia','guam','chinese taipei','lebanon','korea republic','brunei darussalam','bahrain',
'hong kong','kyrgyz republic');

/* UPDATE AFRICAN */
UPDATE clubs 
INNER JOIN international_confederations
    ON international_confederations.continent='Africa'
SET clubs.id_international_confederation = international_confederations.id
WHERE clubs.country 
IN ('cameroon','benin','algeria','ghana','congo','burundi','botswana','democratic republic of the congo',
'egypt','angola','djibouti','comoros','chad','eritrea','gabon','burkina faso','guinea-bissau',
'central african republic','equatorial guinea','cape verde','eswatini','ethiopia','guinea','gambia');

/* */
SELECT  clubs.id, 
        clubs.name, 
        clubs.country, 
        international_confederations.name, 
        international_confederations.continent
FROM clubs 
INNER JOIN international_confederations 
    ON clubs.id_international_confederation = international_confederations.id;

SELECT  clubs.id, 
        clubs.name, 
        clubs.country, 
        international_confederations.name, 
        international_confederations.continent
FROM clubs 
INNER JOIN international_confederations 
    ON clubs.id_international_confederation = international_confederations.id
WHERE international_confederations.continent='Africa';