-- Players and player relatable tables 

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
    id_season INT,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id),
    id_player INT,
    FOREIGN KEY(id_player)
        REFERENCES players(id)
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
    id_club INT,
    FOREIGN KEY (id_club) 
        REFERENCES clubs(id),
    id_player INT,
    FOREIGN KEY (id_player) 
        REFERENCES players(id)  
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
    id_season INT,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id),
    id_player INT,
    FOREIGN KEY (id_player)
        REFERENCES players(id)
);

-- Player value
CREATE TABLE player_values(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    market_value INT NOT NULL,
    id_season INT,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id),
    id_player INT,
    FOREIGN KEY (id_player)
        REFERENCES players(id)
);