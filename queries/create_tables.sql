CREATE DATABASE football;

USE football;

/* CREATE TABLES */

CREATE TABLE confederations (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    continent VARCHAR(100) NOT NULL
);


-- CLUBS
CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    coeff INT NOT NULL,
    class CHAR(1),
    formation VARCHAR(10),
    total_budget INT,
    salary_budget INT,
    id_confederation INT,
    FOREIGN KEY (id_confederation)
    REFERENCES confederations(id)
);

-- PLAYERS
CREATE TABLE players ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL, 
    nationality VARCHAR(100) NOT NULL, 
    birth_year INT(4) NOT NULL, 
    position VARCHAR(2) NOT NULL, 
    height FLOAT,  
    weight FLOAT,  
    foot VARCHAR(5), 
    retired CHAR(1)
);

CREATE TABLE players_overall (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season VARCHAR(5) NOT NULL,
    overall INT NOT NULL,
    id_player INT,
    FOREIGN KEY(id_player)
    REFERENCES players(id)
);

-- PLAYERS_CONTRACT
CREATE TABLE players_contract(
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    value INT,
    salary INT NOT NULL,
    termination_fine INT,
    id_club INT,
    id_player INT,
    FOREIGN KEY (id_club)
    REFERENCES clubs(id),
    FOREIGN key (id_player) 
    REFERENCES players(id)  
);

-- COACHES
CREATE TABLE coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    formation VARCHAR(10),
    play_mode VARCHAR(50) NOT NULL
);

-- COACHES_CONTRACT
CREATE TABLE coaches_contract(
    id INT AUTO_INCREMENT PRIMARY KEY,
    value INT,
    salary INT NOT NULL,
    termination_fine INT,
    id_club INT,
    id_coach INT,
    FOREIGN KEY (id_club)
    REFERENCES clubs(id),
    FOREIGN key (id_coach) 
    REFERENCES coaches(id)  
);


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


-- CONFEDERATION




/* INSERT EXAMPLES */
-- CLUBS
INSERT INTO clubs(name, country, coeff, class) VALUES ('Fluminense FC', 'Brasil', 1000, 'A');
INSERT INTO clubs(name, country, coeff, class) VALUES ('River Plate', 'Argentina', 1000, 'A');
INSERT INTO clubs(name, country, coeff, class) VALUES ('Peñarol', 'Uruguai', 1000, 'B');

-- COACHES
INSERT INTO coaches(name, nationality, age, play_mode) VALUES ('Tite', 'Brasil', 55, 'Defensive');
INSERT INTO coaches(name, nationality, age, play_mode, current_club) VALUES ('Fernando Diniz', 'Brasil', 45, 'Ofensive', 'Fluminense FC');
INSERT INTO coaches(name, nationality, age, play_mode, current_club) VALUES ('Mourinho', 'Portugal', 65, 'Defensive', 'Roma FC');

-- PLAYERS
INSERT INTO players (name, nationality, age, position, retired) VALUES ('German Cano', 'Argentina', 32, 'CF', 'F');
INSERT INTO players (name, nationality, age, position, retired) VALUES ('André', 'Brasil', 22, 'DF', 'F');
INSERT INTO players (name, nationality, age, position, retired) VALUES ('Fábio', 'Brasil', 40, 'GK', 'F');

INSERT INTO stadiums (name, location, capacity) VALUES ('Maracanã', 'RJ', 100000);
INSERT INTO stadiums (name, location, capacity) VALUES ('Engenhão', 'RJ', 50000);
INSERT INTO stadiums (name, location, capacity) VALUES ('Mineirão', 'MG', 100000);

INSERT INTO coach_contracts(salary, id_club, id_coach) VALUES (10000, 1263, 1);
