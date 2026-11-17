USE NetflixDB;
GO

SELECT
    DB_NAME() AS CurrentDatabase,
    GETDATE() AS ExecutionDateTime,
    'SQL Server' AS DBMS;
GO

SELECT 'Subscription_Plan' AS TableName, COUNT(*) AS TotalRecords
FROM Subscription_Plan

UNION ALL

SELECT 'Directors', COUNT(*) FROM Directors

UNION ALL

SELECT 'Genres', COUNT(*) FROM Genres

UNION ALL

SELECT 'Actors', COUNT(*) FROM Actors

UNION ALL

SELECT 'Users', COUNT(*) FROM Users

UNION ALL

SELECT 'Movies_TVShows', COUNT(*) FROM Movies_TVShows

UNION ALL

SELECT 'Payments', COUNT(*) FROM Payments

UNION ALL

SELECT 'Watch_History', COUNT(*) FROM Watch_History

UNION ALL

SELECT 'Ratings', COUNT(*) FROM Ratings

UNION ALL

SELECT 'Movie_Cast', COUNT(*) FROM Movie_Cast;
GO


SELECT
    plan_id,
    plan_name,
    price,
    duration_months,
    max_screens,
    quality,
    is_active
FROM Subscription_Plan
ORDER BY price;
GO

SELECT
    U.user_id,
    U.full_name,
    U.email,
    S.plan_name,
    S.price,
    S.quality
FROM Users U
INNER JOIN Subscription_Plan S
    ON U.plan_id = S.plan_id
ORDER BY U.user_id;
GO

SELECT
    M.movie_id,
    M.title,
    M.release_year,
    M.duration,
    M.content_type,
    D.director_name,
    G.genre_name
FROM Movies_TVShows M
INNER JOIN Directors D
    ON M.director_id = D.director_id
INNER JOIN Genres G
    ON M.genre_id = G.genre_id
ORDER BY M.release_year DESC;
GO

SELECT
    D.director_id,
    D.director_name,
    M.title,
    G.genre_name
FROM Directors D
INNER JOIN Movies_TVShows M
    ON D.director_id = M.director_id
INNER JOIN Genres G
    ON M.genre_id = G.genre_id
ORDER BY D.director_name;
GO

SELECT
    P.payment_id,
    U.full_name,
    P.amount,
    P.payment_method,
    P.transaction_id,
    P.payment_date,
    P.status
FROM Payments P
INNER JOIN Users U
    ON P.user_id = U.user_id
ORDER BY P.payment_date DESC;
GO

SELECT
    W.watch_id,
    U.full_name,
    M.title,
    W.watched_at,
    W.watch_duration,
    W.completed
FROM Watch_History W
INNER JOIN Users U
    ON W.user_id = U.user_id
INNER JOIN Movies_TVShows M
    ON W.movie_id = M.movie_id
ORDER BY W.watched_at DESC;
GO

SELECT
    R.rating_id,
    U.full_name,
    M.title,
    R.rating,
    R.review,
    R.rated_at
FROM Ratings R
INNER JOIN Users U
    ON R.user_id = U.user_id
INNER JOIN Movies_TVShows M
    ON R.movie_id = M.movie_id
ORDER BY R.rating DESC;
GO

SELECT
    M.title,
    A.actor_name,
    C.character_name
FROM Movie_Cast C
INNER JOIN Movies_TVShows M
    ON C.movie_id = M.movie_id
INNER JOIN Actors A
    ON C.actor_id = A.actor_id
ORDER BY M.title;
GO

SELECT
    COUNT(*) AS TotalRatings,
    AVG(CAST(rating AS DECIMAL(5,2))) AS AverageRating,
    MAX(rating) AS HighestRating,
    MIN(rating) AS LowestRating
FROM Ratings;
GO

SELECT
    COUNT(*) AS TotalPayments,
    SUM(amount) AS TotalPaymentAmount,
    AVG(amount) AS AveragePaymentAmount
FROM Payments;
GO

SELECT
    OBJECT_NAME(FK.parent_object_id) AS ChildTable,
    C1.name AS ForeignKeyColumn,
    OBJECT_NAME(FK.referenced_object_id) AS ParentTable,
    C2.name AS ReferencedColumn,
    FK.name AS ForeignKeyName
FROM sys.foreign_keys FK
INNER JOIN sys.foreign_key_columns FKC
    ON FK.object_id = FKC.constraint_object_id
INNER JOIN sys.columns C1
    ON FKC.parent_object_id = C1.object_id
    AND FKC.parent_column_id = C1.column_id
INNER JOIN sys.columns C2
    ON FKC.referenced_object_id = C2.object_id
    AND FKC.referenced_column_id = C2.column_id
ORDER BY ChildTable, ForeignKeyName;
GO