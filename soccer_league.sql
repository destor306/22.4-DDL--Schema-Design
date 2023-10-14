
DROP DATABASE IF EXISTS soccer;


CREATE DATABASE soccer;

\c soccer;

CREATE TABLE Team
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE League
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE Player
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    number INTEGER NOT NULL,
    team_id INTEGER REFERENCES Team(id),
    league_id INTEGER REFERENCES League(id)
);

CREATE TABLE Match
(
    id SERIAL PRIMARY KEY,
    team1 TEXT NOT NULL,
    team2 TEXT NOT NULL,
    date DATE NOT NULL,
    referres_id INTEGER REFERENCES Referees(id),
    league_id INTEGER REFERENCES League(id)
);
CREATE TABLE Goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Player(id),
    match_id INTEGER REFERENCES Match(id)
);

-- Inserting data into the "Team" table
INSERT INTO Team (name)
VALUES
('Team A'),
('Team B'),
('Team C');

-- Inserting data into the "Referees" table
INSERT INTO Referees (name)
VALUES
('Referee 1'),
('Referee 2'),
('Referee 3');

-- Inserting data into the "League" table
INSERT INTO League (start_date, end_date)
VALUES
('2023-01-01', '2023-12-31'),
('2024-01-01', '2024-12-31');

-- Inserting data into the "Player" table
INSERT INTO Player (name, number, team_id, league_id)
VALUES
('Player 1', 10, 1, 1),
('Player 2', 7, 2, 1),
('Player 3', 9, 3, 1);

-- Inserting data into the "Match" table
INSERT INTO Match (team1, team2, date, referres_id, league_id)
VALUES
('Team A', 'Team B', '2023-05-15', 1, 1),
('Team B', 'Team C', '2023-06-20', 2, 1),
('Team A', 'Team C', '2023-07-25', 3, 1);


-- Inserting data into the "Goals" table
INSERT INTO Goals (player_id, match_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(1, 3);
