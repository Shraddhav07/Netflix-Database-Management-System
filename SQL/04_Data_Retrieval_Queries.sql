-- =============================================
-- Netflix Database Management System
-- 04. Data Retrieval & Analysis Queries
-- =============================================

USE NetflixDB;
GO

-- 1. Basic SELECT Queries
SELECT *
FROM Users;

SELECT full_name, email
FROM Users;

SELECT title, release_year, content_type
FROM Movies_TVShows;


-- 2. WHERE Filtering
SELECT *
FROM Users
WHERE plan_id = 4;

SELECT title, release_year
FROM Movies_TVShows
WHERE release_year > 2023;

SELECT *
FROM Movies_TVShows
WHERE release_year BETWEEN 2022 AND 2024;

SELECT *
FROM Users
WHERE plan_id IN (1, 3, 5);

SELECT *
FROM Movies_TVShows
WHERE title LIKE '%Last%';


-- 3. ORDER BY Sorting
SELECT plan_name, price
FROM Subscription_Plan
ORDER BY price DESC;

SELECT title, release_year
FROM Movies_TVShows
ORDER BY release_year ASC;

SELECT title, release_year, duration
FROM Movies_TVShows
ORDER BY release_year DESC, duration DESC;


-- 4. Aggregate Functions
SELECT COUNT(*) AS TotalUsers
FROM Users;

SELECT SUM(amount) AS TotalPaymentAmount
FROM Payments;

SELECT AVG(CAST(rating AS DECIMAL(4,2))) AS AverageRating
FROM Ratings;

SELECT
    MAX(rating) AS HighestRating,
    MIN(rating) AS LowestRating
FROM Ratings;


-- 5. GROUP BY & HAVING
SELECT
    genre_id,
    COUNT(*) AS TotalContent
FROM Movies_TVShows
GROUP BY genre_id;

SELECT
    movie_id,
    AVG(CAST(rating AS DECIMAL(4,2))) AS AverageRating
FROM Ratings
GROUP BY movie_id;

SELECT
    genre_id,
    COUNT(*) AS TotalContent
FROM Movies_TVShows
GROUP BY genre_id
HAVING COUNT(*) > 1;


-- 6. INNER JOIN
SELECT
    U.full_name,
    U.email,
    P.plan_name,
    P.price
FROM Users AS U
INNER JOIN Subscription_Plan AS P
    ON U.plan_id = P.plan_id;

SELECT
    M.title,
    M.release_year,
    G.genre_name,
    D.director_name
FROM Movies_TVShows AS M
INNER JOIN Genres AS G
    ON M.genre_id = G.genre_id
INNER JOIN Directors AS D
    ON M.director_id = D.director_id;

SELECT
    U.full_name,
    M.title,
    W.watched_at,
    W.watch_duration,
    W.completed
FROM Users AS U
INNER JOIN Watch_History AS W
    ON U.user_id = W.user_id
INNER JOIN Movies_TVShows AS M
    ON W.movie_id = M.movie_id;


-- 7. LEFT JOIN
SELECT
    U.full_name,
    P.payment_id,
    P.amount,
    P.status
FROM Users AS U
LEFT JOIN Payments AS P
    ON U.user_id = P.user_id;


-- 8. TOP Clause
SELECT TOP 3
    M.title,
    R.rating
FROM Movies_TVShows AS M
INNER JOIN Ratings AS R
    ON M.movie_id = R.movie_id
ORDER BY R.rating DESC;


-- 9. Table Data Verification
USE NetflixDB;
GO

SELECT * FROM Subscription_Plan;
SELECT * FROM Directors;
SELECT * FROM Genres;
SELECT * FROM Actors;
SELECT * FROM Users;
SELECT * FROM Movies_TVShows;
SELECT * FROM Payments;
SELECT * FROM Watch_History;
SELECT * FROM Ratings;
SELECT * FROM Movie_Cast;
