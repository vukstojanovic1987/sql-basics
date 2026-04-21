# SQL Basics

Lightweight SQL reference for basic database operations.

This repository contains a simple SQL example built around two related tables: `Games` and `Scores`.

The goal is to keep things practical and readable while covering the most common database operations:
table creation, inserting data, reading data, updating rows, deleting rows, joining related tables, and simple search with `LIKE`.

## Included

* `CREATE TABLE`
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`
* `JOIN`
* `LIKE`

---

## Setup

```sql
DROP TABLE IF EXISTS Scores;
DROP TABLE IF EXISTS Games;

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
```

---

## Insert data

```sql
INSERT INTO Games (Name, Genre, ReleaseYear)
VALUES
('Space Invaders', 'Arcade', 1978),
('Tetris', 'Puzzle', 1984);

INSERT INTO Scores (GameId, PlayerName, Points)
VALUES
(1, 'Vuk', 1200),
(1, 'Ana', 950),
(2, 'Marko', 2000);
```

Current data:

```text
Games
Id | Name           | Genre  | ReleaseYear
---+----------------+--------+------------
1  | Space Invaders | Arcade | 1978
2  | Tetris         | Puzzle | 1984

Scores
Id | GameId | PlayerName | Points
---+--------+------------+-------
1  | 1      | Vuk        | 1200
2  | 1      | Ana        |  950
3  | 2      | Marko      | 2000
```

---

## Select

```sql
SELECT * FROM Games;
```

```text
Id | Name           | Genre  | ReleaseYear
---+----------------+--------+------------
1  | Space Invaders | Arcade | 1978
2  | Tetris         | Puzzle | 1984
```

---

## Update

```sql
UPDATE Scores
SET Points = 1300
WHERE Id = 1;
```

Updated data:

```text
Id | GameId | PlayerName | Points
---+--------+------------+-------
1  | 1      | Vuk        | 1300
2  | 1      | Ana        |  950
3  | 2      | Marko      | 2000
```

---

## Delete

```sql
DELETE FROM Scores
WHERE Id = 2;
```

After delete:

```text
Id | GameId | PlayerName | Points
---+--------+------------+-------
1  | 1      | Vuk        | 1300
3  | 2      | Marko      | 2000
```

Additional example (can affect multiple rows):

```sql
DELETE FROM Scores
WHERE PlayerName = 'Ana';
```

---

## JOIN

```sql
SELECT
    Games.Name,
    Scores.PlayerName,
    Scores.Points
FROM Scores
INNER JOIN Games ON Scores.GameId = Games.Id;
```

```text
Name           | PlayerName | Points
---------------+------------+-------
Space Invaders | Vuk        | 1300
Tetris         | Marko      | 2000
```

---

## Search with LIKE

```sql
SELECT *
FROM Games
WHERE Name LIKE '%Tet%';
```

```text
Id | Name   | Genre  | ReleaseYear
---+--------+--------+------------
2  | Tetris | Puzzle | 1984
```

---

## Script

```text
games.sql
```

---

## Notes

This repository is intended as a simple reference for basic SQL operations.

It is not tied to any specific application and can be used for learning, testing, or quick demos.
