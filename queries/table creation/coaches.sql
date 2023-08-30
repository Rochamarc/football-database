-- Coaches and coaches relatable tables

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

