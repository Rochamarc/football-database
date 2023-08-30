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
    matches INT,
    won INT,
    draw INT,
    lost INT,
    goals_for INT,
    goals_away INT,
    goal_diff INT,
    id_season INT,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id),
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
    hour CHAR(5),
    score VARCHAR(5),
    id_season INT,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id),
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