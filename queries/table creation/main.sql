-- CONFEDERATION
CREATE TABLE international_confederations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    continent VARCHAR(100) NOT NULL
);

CREATE TABLE national_confederations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    class CHAR(1),
    id_international_confederation INT,
    id_national_confederation INT
);

CREATE TABLE club_budgets(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transfer_budget INT NOT NULL,
    salary_budget INT NOT NULL,
    season CHAR(4) NOT NULL,
    id_club INT NOT NULL
);

CREATE TABLE coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    birth_year INT(4) NOT NULL,
    formation VARCHAR(10),
    play_mode VARCHAR(50) NOT NULL
);

CREATE TABLE coaches_contract(
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date CHAR(4),
    end_date CHAR(4),
    value INT,
    salary INT NOT NULL,
    termination_fine INT,
    id_club INT NOT NULL,
    id_coach INT NOT NULL
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

-- PLAYER SKILL TABLE
CREATE TABLE players_overall (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    overall INT NOT NULL,
    season CHAR(4) NOT NULL,
    id_player INT NOT NULL
);

-- PLAYERS_CONTRACT
/* NOW THE CONTRACT ONLY RECEIVE THE YEAR */
CREATE TABLE players_contract(
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date CHAR(4),
    end_date CHAR(4),
    value INT,
    salary INT NOT NULL,
    termination_fine INT,
    id_club INT NOT NULL,
    id_player INT NOT NULL
);

-- Player season stats
CREATE TABLE player_stats(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    matches INT,
    goals INT,
    assists INT,
    tackles INT,
    clearances INT,
    defenses INT,
    goals_conceded INT,
    clean_sheets INT,
    points FLOAT,
    average FLOAT,
    season CHAR (4) NOT NULL,
    id_player INT NOT NULL
);

-- Player value
CREATE TABLE player_values(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    market_value INT NOT NULL,
    season CHAR(4) NOT NULL,
    id_player INT NOT NULL
);

CREATE TABLE stadiums ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    capacity INT,
    id_club INT 
);

/* CONSTRAINTS */
ALTER TABLE clubs 
ADD CONSTRAINT fk_clubs_international_confederations
FOREIGN KEY(id_international_confederation)
REFERENCES international_confederations(id);

ALTER TABLE clubs
ADD CONSTRAINT fk_clubs_national_confederations 
FOREIGN KEY(id_national_confederation)
REFERENCES national_confederations(id);

ALTER TABLE club_budgets
ADD CONSTRAINT fk_club_budgets_club
FOREIGN KEY(id_club)
REFERENCES clubs(id);

ALTER TABLE coaches_contract
ADD CONSTRAINT fk_coaches_contract_club
FOREIGN KEY(id_club)
REFERENCES clubs(id);

ALTER TABLE coaches_contract
ADD CONSTRAINT fk_coaches_contract_coach
FOREIGN KEY(id_coach)
REFERENCES coaches(id);

ALTER TABLE players_overall 
ADD CONSTRAINT fk_players_overall_player
FOREIGN KEY(id_player)
REFERENCES players(id);

ALTER TABLE players_contract
ADD CONSTRAINT fk_players_contract_club
FOREIGN KEY(id_club)
REFERENCES clubs(id);

ALTER TABLE players_contract 
ADD CONSTRAINT fk_players_contract_player
FOREIGN KEY(id_player)
REFERENCES players(id);

ALTER TABLE player_stats 
ADD CONSTRAINT fk_player_stats_player
FOREIGN KEY(id_player)
REFERENCES players(id);

ALTER TABLE player_values
ADD CONSTRAINT fk_player_values_player
FOREIGN KEY(id_player)
REFERENCES players(id);

ALTER TABLE stadiums
ADD CONSTRAINT fk_stadiums_club
FOREIGN KEY(id_club)
REFERENCES clubs(id);