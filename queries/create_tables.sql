CREATE DATABASE football;

USE football;

/* CREATE TABLES */

/* 
JUST AN EXPERIMENT 
now every time we have a season inside a table, it will be
an foreign key 
*/

CREATE TABLE seasons(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season VARCHAR(5)) NOT NULL
);

-- CONFEDERATION
CREATE TABLE confederations (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    continent VARCHAR(100) NOT NULL
);

/* 
FOR FUTURE CHANGES 

INTERNATIONAL_CONFEDERATIONS -> CONMEBOL, UEFA, ...
NATIONAL_CONFEDERATIONS -> AFA, CBF, ...

DIFF 
|INTERNATIONAL | NATIONAL |
|continent     | country  |

*/

-- CLUBS
CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    class CHAR(1),
    id_confederation INT,
    FOREIGN KEY (id_confederation)
    REFERENCES confederations(id)
);

CREATE TABLE club_budgets(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season CHAR(4) NOT NULL, -- CHANGE TO FK
    transfer_budget INT NOT NULL,
    salary_budget INT NOT NULL,
    id_club INT NOT NULL,
    FOREIGN KEY (id_club)
        REFERENCES clubs(id)
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
    season VARCHAR(5) NOT NULL, -- CHANGE TO FK
    overall INT NOT NULL,
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
    season CHAR(4) NOT NULL, -- CHANGE TO FK
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
    id_player INT,
    FOREIGN KEY (id_player)
        REFERENCES players(id)
);

-- Player value
CREATE TABLE player_values(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season CHAR(4) NOT NULL, -- CHANGE TO FK
    market_value INT NOT NULL,
    id_player INT,
    FOREIGN KEY (id_player)
        REFERENCES players(id)
);

-- COACHES
CREATE TABLE coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    birth_year INT(4) NOT NULL,
    formation VARCHAR(10),
    play_mode VARCHAR(50) NOT NULL
);

-- COACHES_CONTRACT
CREATE TABLE coaches_contract(
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date CHAR(4),
    end_date CHAR(4),
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


-- Competition
CREATE TABLE competitions(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE divisons(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE competition_tables(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season CHAR(4) NOT NULL, -- CHANGE TO FK
    matches INT,
    won INT,
    draw INT,
    lost INT,
    goals_for INT,
    goals_away INT,
    goal_diff INT,
    id_competition INT,
    FOREIGN KEY (id_competition)
        REFERENCES competitions(id),
    id_club INT,
    FOREIGN KEY (id_club)
        REFERENCES clubs(id),
    id_divison INT,
    FOREIGN KEY (id_divison)
        REFERENCES divisons(id)
);

CREATE TABLE home_game_stats(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    shots INT NOT NULL,
    shots_on_target INT NOT NULL,
    fouls INT NOT NULL,
    tackles INT NOT NULL,
    saves INT NOT NULL,
    ball_possession INT NOT NULL,
    offsides INT NOT NULL,
    freekicks INT NOT NULL
);

CREATE TABLE away_game_stats(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    shots INT NOT NULL,
    shots_on_target INT NOT NULL,
    fouls INT NOT NULL,
    tackles INT NOT NULL,
    saves INT NOT NULL,
    ball_possession INT NOT NULL,
    offsides INT NOT NULL,
    freekicks INT NOT NULL
);

-- Games
CREATE TABLE games(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    season CHAR(4) NOT NULL, -- CHANGE TO FK
    hour CHAR(5),
    score VARCHAR(5),
    id_competition INT,
    FOREIGN KEY (id_competition)
        REFERENCES competitions(id),
    id_stadium INT,
    FOREIGN KEY (id_stadium)
        REFERENCES stadiums(id),
    id_home_game_stats INT,
    FOREIGN KEY (id_home_game_stats)
        REFERENCES home_game_stats(id),
    id_away_game_stats INT,
    FOREIGN KEY (id_away_game_stats)
        REFERENCES away_game_stats(id)
);


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
