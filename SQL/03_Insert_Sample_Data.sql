-- =============================================
-- Netflix Database Management System
-- 03. Sample Data Insertion
-- =============================================

USE NetflixDB;
GO

SELECT 'Subscription_Plan' AS TableName, COUNT(*) AS TotalRecords FROM Subscription_Plan
UNION ALL
SELECT 'Directors', COUNT(*) FROM Directors
UNION ALL
SELECT 'Genres', COUNT(*) FROM Genres
UNION ALL
SELECT 'Actors', COUNT(*) FROM Actors;

-- 1. Subscription_Plan
INSERT INTO Subscription_Plan
    (plan_name, price, duration_months, max_screens, quality)
VALUES
    ('Mobile', 149.00, 1, 1, 'SD'),
    ('Basic', 199.00, 1, 1, 'HD'),
    ('Standard', 499.00, 1, 2, 'Full HD'),
    ('Premium', 649.00, 1, 4, 'UHD'),
    ('Annual', 1499.00, 12, 4, 'UHD');

GO

-- 2. Directors
INSERT INTO Directors (director_name, bio)
VALUES
    ('Alex Morgan', 'Director specializing in mystery dramas.'),
    ('Daniel Carter', 'Known for science fiction storytelling.'),
    ('Sophia Bennett', 'Director of dramatic productions.'),
    ('Ryan Mitchell', 'Works on action and thriller content.'),
    ('Emma Wilson', 'Director specializing in comedy.');

GO

-- 3. Genres
INSERT INTO Genres (genre_name, description)
VALUES
    ('Action', 'Action-packed entertainment.'),
    ('Comedy', 'Comedy and humorous content.'),
    ('Drama', 'Dramatic storytelling.'),
    ('Thriller', 'Suspense and thriller content.'),
    ('Sci-Fi', 'Science fiction and futuristic content.');

GO

-- 4. Actors
INSERT INTO Actors (actor_name, bio)
VALUES
    ('Oliver James', 'Performs in drama and action productions.'),
    ('Isabella Rose', 'Known for thriller performances.'),
    ('Ethan Blake', 'Performs in science fiction productions.'),
    ('Mia Anderson', 'Works in comedy and drama.'),
    ('Noah Williams', 'Performs in action productions.');

GO

INSERT INTO Actors (actor_name, bio)
VALUES
    ('Oliver James', 'Performs in drama and action productions.'),
    ('Isabella Rose', 'Known for thriller performances.'),
    ('Ethan Blake', 'Performs in science fiction productions.'),
    ('Mia Anderson', 'Works in comedy and drama.'),
    ('Noah Williams', 'Performs in action productions.');

GO

INSERT INTO Actors (actor_name, bio)
VALUES
    ('Oliver James', 'Performs in drama and action productions.'),
    ('Isabella Rose', 'Known for thriller performances.'),
    ('Ethan Blake', 'Performs in science fiction productions.'),
    ('Mia Anderson', 'Works in comedy and drama.'),
    ('Noah Williams', 'Performs in action productions.');

GO

SELECT * FROM Subscription_Plan;
SELECT * FROM Directors;
SELECT * FROM Genres;
SELECT * FROM Actors;

-- 5. Users
INSERT INTO Users
    (plan_id, full_name, email, password_hash, phone)
VALUES
    (1, 'Aarav Sharma', 'aarav@example.com', 'sample_hash_001', '9000000001'),

    (2, 'Diya Patel', 'diya@example.com', 'sample_hash_002', '9000000002'),

    (3, 'Kabir Mehta', 'kabir@example.com', 'sample_hash_003', '9000000003'),

    (4, 'Anaya Shah', 'anaya@example.com', 'sample_hash_004', '9000000004'),

    (5, 'Rohan Desai', 'rohan@example.com', 'sample_hash_005', '9000000005');

GO

-- 6. Movies_TVShows
INSERT INTO Movies_TVShows
    (title, description, release_year, duration,
     content_type, director_id, genre_id)
VALUES

    ('The Last Signal',
     'A mysterious signal changes the future of humanity.',
     2024, 125, 'Movie', 1, 5),

    ('Midnight Chase',
     'An investigator follows a dangerous criminal network.',
     2023, 110, 'Movie', 2, 1),

    ('Hidden Truths',
     'A detective uncovers secrets in a quiet town.',
     2022, 45, 'TV Show', 3, 4),

    ('Laughing Days',
     'Friends navigate everyday life through comedy.',
     2024, 30, 'TV Show', 4, 2),

    ('Broken Promise',
     'A family faces difficult choices and unexpected events.',
     2025, 135, 'Movie', 5, 3);

GO

-- 7. Payments
INSERT INTO Payments
    (user_id, amount, payment_method, transaction_id, status)
VALUES
    (1, 149.00, 'UPI', 'TXN_NET_001', 'Success'),

    (2, 199.00, 'Card', 'TXN_NET_002', 'Success'),

    (3, 499.00, 'UPI', 'TXN_NET_003', 'Success'),

    (4, 649.00, 'Net Banking', 'TXN_NET_004', 'Pending'),

    (5, 1499.00, 'Card', 'TXN_NET_005', 'Success');

GO

-- 8. Watch_History
INSERT INTO Watch_History
    (user_id, movie_id, watch_duration, completed)
VALUES
    (1, 1, 125, 1),

    (2, 2, 65, 0),

    (3, 3, 45, 1),

    (4, 4, 20, 0),

    (5, 5, 135, 1);

GO

-- 9. Ratings
INSERT INTO Ratings
    (user_id, movie_id, rating, review)
VALUES
    (1, 1, 9, 'Excellent science fiction story.'),

    (2, 2, 8, 'Enjoyable action and suspense.'),

    (3, 3, 10, 'Very engaging mystery series.'),

    (4, 4, 7, 'Funny and entertaining.'),

    (5, 5, 9, 'A compelling drama.');

GO

-- 10. Movie_Cast
INSERT INTO Movie_Cast
    (movie_id, actor_id, character_name)
VALUES
    (1, 1, 'Alex'),
    (1, 2, 'Jordan'),
    (2, 1, 'Detective Ryan'),
    (3, 3, 'Ethan'),
    (4, 4, 'Mia');

GO

USE NetflixDB;
GO

-- Verification
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

-- Constraint Verification Tests
BEGIN TRY

    INSERT INTO Movie_Cast
    (movie_id, actor_id, character_name)
    VALUES
    (1, 1, 'Duplicate Character');

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;

BEGIN TRY

    INSERT INTO Payments
    (user_id, amount, payment_method, transaction_id, status)
    VALUES
    (999, 499.00, 'UPI', 'TXN_TEST_FK_001', 'Success');

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;

BEGIN TRY

    INSERT INTO Users
    (plan_id, full_name, email, password_hash, phone)
    VALUES
    (1, NULL, 'notnull_test@example.com',
     'sample_hash_test', '9000000099');

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;

BEGIN TRY

    INSERT INTO Users
    (plan_id, full_name, email, password_hash, phone)
    VALUES
    (1, 'Test User', 'aarav@example.com',
     'sample_hash_test', '9000000088');

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;

BEGIN TRY

    INSERT INTO Payments
    (user_id, amount, payment_method, transaction_id, status)
    VALUES
    (1, 0, 'UPI', 'TXN_TEST_CHECK_001', 'Success');

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;

END CATCH;

BEGIN TRANSACTION;

INSERT INTO Directors (director_name, bio)
VALUES ('Default Test Director', 'Testing DEFAULT constraint');

SELECT
    director_id,
    director_name,
    created_at
FROM Directors
WHERE director_name = 'Default Test Director';

ROLLBACK TRANSACTION;

SELECT 'Subscription_Plan' AS TableName, COUNT(*) AS TotalRecords FROM Subscription_Plan
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
