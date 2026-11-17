-- =============================================
-- Netflix Database Management System
-- 05. Constraint Testing
-- =============================================

USE NetflixDB;
GO

-- 1. Primary Key: Duplicate composite key
BEGIN TRY
    INSERT INTO Movie_Cast
        (movie_id, actor_id, character_name)
    VALUES
        (1, 1, 'Duplicate Character');
END TRY
BEGIN CATCH
    SELECT
        'PRIMARY KEY TEST' AS TestName,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- 2. Foreign Key: Invalid user_id reference
BEGIN TRY
    INSERT INTO Payments
        (user_id, amount, payment_method, transaction_id, status)
    VALUES
        (999, 499.00, 'UPI', 'TXN_TEST_FK_001', 'Success');
END TRY
BEGIN CATCH
    SELECT
        'FOREIGN KEY TEST' AS TestName,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- 3. NOT NULL: NULL full_name
BEGIN TRY
    INSERT INTO Users
        (plan_id, full_name, email, password_hash, phone)
    VALUES
        (1, NULL, 'notnull_test@example.com',
         'sample_hash_test', '9000000099');
END TRY
BEGIN CATCH
    SELECT
        'NOT NULL TEST' AS TestName,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- 4. UNIQUE: Duplicate email
BEGIN TRY
    INSERT INTO Users
        (plan_id, full_name, email, password_hash, phone)
    VALUES
        (1, 'Test User', 'aarav@example.com',
         'sample_hash_test', '9000000088');
END TRY
BEGIN CATCH
    SELECT
        'UNIQUE TEST' AS TestName,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- 5. CHECK: Amount <= 0
BEGIN TRY
    INSERT INTO Payments
        (user_id, amount, payment_method, transaction_id, status)
    VALUES
        (1, 0, 'UPI', 'TXN_TEST_CHECK_001', 'Success');
END TRY
BEGIN CATCH
    SELECT
        'CHECK TEST' AS TestName,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- 6. DEFAULT: Auto-populate created_at
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
GO
