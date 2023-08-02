CREATE DATABASE football;

USE football;


-- CLUBS TABLE CREATION AND INSERT SOME EXAMPLES 
CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    coeff INT NOT NULL,
    class CHAR(1),
    formation VARCHAR(10),
    total_budget INT,
    salary_budget INT
);

/* INSERT EXAMPLES */
INSERT INTO clubs(name, country, coeff, class) VALUES ('Fluminense FC', 'Brasil', 1000, 'A');
INSERT INTO clubs(name, country, coeff, class) VALUES ('River Plate', 'Argentina', 1000, 'A');
INSERT INTO clubs(name, country, coeff, class) VALUES ('Peñarol', 'Uruguai', 1000, 'B');

-- COACHES
CREATE TABLE coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    formation VARCHAR(10),
    play_mode VARCHAR(50) NOT NULL,
    current_club VARCHAR(100)
);

INSERT INTO coaches(name, nationality, age, play_mode) VALUES ('Tite', 'Brasil', 55, 'Defensive');
INSERT INTO coaches(name, nationality, age, play_mode, current_club) VALUES ('Fernando Diniz', 'Brasil', 45, 'Ofensive', 'Fluminense FC');
INSERT INTO coaches(name, nationality, age, play_mode, current_club) VALUES ('Mourinho', 'Portugal', 65, 'Defensive', 'Roma FC');


-- PLAYERS
CREATE TABLE players ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL, 
    nationality VARCHAR(100) NOT NULL, 
    age INT(2) NOT NULL, 
    overall INT(2) NOT NULL, 
    current_club VARCHAR(100), 
    position VARCHAR(2) NOT NULL, 
    matches_played INT(4), 
    goals INT(4), 
    assists INT(4), 
    points FLOAT(3,2), 
    avg FLOAT(3,2), 
    market_value INT(10),  
    salary FLOAT(10,2),  
    height FLOAT(2,2),  
    weight FLOAT(2,2),  
    foot VARCHAR(5), 
    retired CHAR(1)
);

INSERT INTO players (name, nationality, age, overall, current_club, position, retired) VALUES ('German Cano', 'Argentina', 32, 88, 'Fluminense FC', 'CF', 'F');
INSERT INTO players (name, nationality, age, overall, current_club, position, retired) VALUES ('André', 'Brasil', 22, 88, 'Fluminense FC', 'DF', 'F');
INSERT INTO players (name, nationality, age, overall, current_club, position, retired) VALUES ('Fábio', 'Brasil', 40, 80, 'Fluminense FC', 'GK', 'F');
