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

/* season CHAR(4) NOT NULL, */ -- CHANGE TO FK

-- Table budget by season
CREATE TABLE club_budgets(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transfer_budget INT NOT NULL,
    salary_budget INT NOT NULL,
    id_club INT NOT NULL,
    FOREIGN KEY (id_club)
        REFERENCES clubs(id)
    id_season INT NOT NULL,
    FOREIGN KEY (id_season)
        REFERENCES seasons(id)
);