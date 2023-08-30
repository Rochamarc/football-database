-- STADIUMS
CREATE TABLE stadiums ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    capacity INT,
    club_owner VARCHAR(100)
);

