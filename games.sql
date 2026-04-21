-- Reset tables so the script can be executed multiple times
DROP TABLE IF EXISTS Scores;
DROP TABLE IF EXISTS Games;

-- Create base tables
CREATE TABLE Games (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Genre NVARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Scores (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GameId INT,
    PlayerName NVARCHAR(100) NOT NULL,
    Points INT NOT NULL
);

-- Insert sample games
INSERT INTO Games (Name, Genre, ReleaseYear)
VALUES
('Space Invaders', 'Arcade', 1978),
('Tetris', 'Puzzle', 1984);

-- Insert sample scores
INSERT INTO Scores (GameId, PlayerName, Points)
VALUES
(1, 'Vuk', 1200),
(1, 'Ana', 950),
(2, 'Marko', 2000);

-- Read all games
SELECT * FROM Games;

-- Update one score (safe update)
UPDATE Scores
SET Points = 1300
WHERE Id = 1;

-- Delete by ID (recommended)
DELETE FROM Scores
WHERE Id = 2;

-- Example: delete by condition (can affect multiple rows)
-- DELETE FROM Scores
-- WHERE PlayerName = 'Ana';

-- Join games with scores
SELECT
    Games.Name,
    Scores.PlayerName,
    Scores.Points
FROM Scores
INNER JOIN Games ON Scores.GameId = Games.Id;

-- Search games by name
SELECT *
FROM Games
WHERE Name LIKE '%Tet%';