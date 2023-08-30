CREATE DATABASE football;

USE football;

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
