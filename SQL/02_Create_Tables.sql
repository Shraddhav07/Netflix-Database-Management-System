-- =============================================
-- Netflix Database Management System
-- 02. Table Creation & Constraints
-- =============================================

USE NetflixDB;
GO

-- Table 1: Subscription_Plan
CREATE TABLE Subscription_Plan
(
    plan_id INT IDENTITY(1,1) PRIMARY KEY,

    plan_name VARCHAR(100) NOT NULL UNIQUE,

    price DECIMAL(10,2) NOT NULL,

    duration_months INT NOT NULL
        CHECK (duration_months > 0),

    max_screens INT NOT NULL,

    quality VARCHAR(20) NOT NULL,

    created_at DATETIME NOT NULL
        DEFAULT GETDATE(),

    is_active BIT NOT NULL
        DEFAULT 1
);
GO


-- Table 2: Directors
CREATE TABLE Directors
(
    director_id INT IDENTITY(1,1) PRIMARY KEY,

    director_name VARCHAR(150) NOT NULL,

    bio VARCHAR(MAX),

    created_at DATETIME NOT NULL
        DEFAULT GETDATE()
);
GO


-- Table 3: Genres
CREATE TABLE Genres
(
    genre_id INT IDENTITY(1,1) PRIMARY KEY,

    genre_name VARCHAR(100) NOT NULL UNIQUE,

    description VARCHAR(MAX)
);
GO


-- Table 4: Actors
CREATE TABLE Actors
(
    actor_id INT IDENTITY(1,1) PRIMARY KEY,

    actor_name VARCHAR(150) NOT NULL,

    bio VARCHAR(MAX),

    created_at DATETIME NOT NULL
        DEFAULT GETDATE()
);
GO

USE NetflixDB;
GO

-- Verification
SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

EXEC sp_help 'Subscription_Plan';


-- Table 5: Users
CREATE TABLE Users
(
    user_id INT IDENTITY(1,1) PRIMARY KEY,

    plan_id INT NOT NULL,

    full_name VARCHAR(150) NOT NULL,

    email VARCHAR(150) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    phone VARCHAR(20) NOT NULL,

    created_at DATETIME NOT NULL
        DEFAULT GETDATE(),

    is_active BIT NOT NULL
        DEFAULT 1,

    -- Foreign Key: Subscription_Plan
    CONSTRAINT FK_Users_SubscriptionPlan
    FOREIGN KEY (plan_id)
    REFERENCES Subscription_Plan(plan_id)
);
GO


-- Table 6: Movies_TVShows
CREATE TABLE Movies_TVShows
(
    movie_id INT IDENTITY(1,1) PRIMARY KEY,

    title VARCHAR(255) NOT NULL,

    description VARCHAR(MAX) NOT NULL,

    release_year SMALLINT NOT NULL,

    duration INT NOT NULL,

    content_type VARCHAR(10) NOT NULL
        CHECK (content_type IN ('Movie', 'TV Show')),

    director_id INT NOT NULL,

    genre_id INT NOT NULL,

    created_at DATETIME NOT NULL
        DEFAULT GETDATE(),

    -- Foreign Key: Directors
    CONSTRAINT FK_Movies_Directors
    FOREIGN KEY (director_id)
    REFERENCES Directors(director_id),

    -- Foreign Key: Genres
    CONSTRAINT FK_Movies_Genres
    FOREIGN KEY (genre_id)
    REFERENCES Genres(genre_id)
);
GO

USE NetflixDB;
GO

-- Verification
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

EXEC sp_help 'Users';

EXEC sp_help 'Movies_TVShows';


-- Table 7: Payments
CREATE TABLE Payments
(
    payment_id INT IDENTITY(1,1) PRIMARY KEY,

    user_id INT NOT NULL,

    amount DECIMAL(10,2) NOT NULL
        CHECK (amount > 0),

    payment_method VARCHAR(50) NOT NULL,

    transaction_id VARCHAR(100) NOT NULL UNIQUE,

    payment_date DATETIME NOT NULL
        DEFAULT GETDATE(),

    status VARCHAR(20) NOT NULL
        CHECK (status IN ('Success', 'Pending', 'Failed')),

    -- Foreign Key: Users
    CONSTRAINT FK_Payments_Users
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
);
GO

-- Table 8: Watch_History
CREATE TABLE Watch_History
(
    watch_id INT IDENTITY(1,1) PRIMARY KEY,

    user_id INT NOT NULL,

    movie_id INT NOT NULL,

    watched_at DATETIME NOT NULL
        DEFAULT GETDATE(),

    watch_duration INT NOT NULL
        CHECK (watch_duration >= 0),

    completed BIT NOT NULL
        DEFAULT 0,

    -- Foreign Key: Users
    CONSTRAINT FK_WatchHistory_Users
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    -- Foreign Key: Movies_TVShows
    CONSTRAINT FK_WatchHistory_Movies
    FOREIGN KEY (movie_id)
    REFERENCES Movies_TVShows(movie_id)
);
GO


-- Table 9: Ratings
CREATE TABLE Ratings
(
    rating_id INT IDENTITY(1,1) PRIMARY KEY,

    user_id INT NOT NULL,

    movie_id INT NOT NULL,

    rating TINYINT NOT NULL
        CHECK (rating BETWEEN 1 AND 10),

    rated_at DATETIME NOT NULL
        DEFAULT GETDATE(),

    review VARCHAR(500),

    -- Foreign Key: Users
    CONSTRAINT FK_Ratings_Users
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    -- Foreign Key: Movies_TVShows
    CONSTRAINT FK_Ratings_Movies
    FOREIGN KEY (movie_id)
    REFERENCES Movies_TVShows(movie_id)
);
GO

USE NetflixDB;
GO

-- Verification
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

EXEC sp_help 'Payments';
EXEC sp_help 'Watch_History';
EXEC sp_help 'Ratings';
GO


-- Table 10: Movie_Cast
CREATE TABLE Movie_Cast
(
    movie_id INT NOT NULL,

    actor_id INT NOT NULL,

    character_name VARCHAR(150),

    -- Composite Primary Key
    CONSTRAINT PK_Movie_Cast
    PRIMARY KEY (movie_id, actor_id),

    -- Foreign Key: Movies_TVShows
    CONSTRAINT FK_MovieCast_Movies
    FOREIGN KEY (movie_id)
    REFERENCES Movies_TVShows(movie_id),

    -- Foreign Key: Actors
    CONSTRAINT FK_MovieCast_Actors
    FOREIGN KEY (actor_id)
    REFERENCES Actors(actor_id)
);
GO

USE NetflixDB;
GO

-- Verification
SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

EXEC sp_help 'Movie_Cast';
GO

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
ORDER BY TABLE_NAME;
GO
