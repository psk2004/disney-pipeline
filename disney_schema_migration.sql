-- ======================================================
-- TARGET MYSQL DDL DEPLOYMENT BLUEPRINTS
-- Generated programmatically via Python pipeline
-- ======================================================

CREATE DATABASE IF NOT EXISTS disney_analytics;
USE disney_analytics;

-- 1. Base Core Dimension Table
CREATE TABLE titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(15) NOT NULL,
    title VARCHAR(255) NOT NULL,
    country VARCHAR(255),
    date_added VARCHAR(50),
    release_year INT NOT NULL,
    rating VARCHAR(10),
    duration VARCHAR(50),
    description TEXT
);

-- 2. Cleaned Atomic Dimension Tables
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    director_name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE cast_members (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_name VARCHAR(150) NOT NULL UNIQUE
);

-- 3. Many-to-Many Relational Junction Bridge Tables
CREATE TABLE title_genres (
    title_id VARCHAR(10),
    genre_id INT,
    PRIMARY KEY (title_id, genre_id),
    FOREIGN KEY (title_id) REFERENCES titles(show_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE
);

CREATE TABLE title_directors (
    title_id VARCHAR(10),
    director_id INT,
    PRIMARY KEY (title_id, director_id),
    FOREIGN KEY (title_id) REFERENCES titles(show_id) ON DELETE CASCADE,
    FOREIGN KEY (director_id) REFERENCES directors(director_id) ON DELETE CASCADE
);

CREATE TABLE title_actors (
    title_id VARCHAR(10),
    actor_id INT,
    PRIMARY KEY (title_id, actor_id),
    FOREIGN KEY (title_id) REFERENCES titles(show_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES cast_members(actor_id) ON DELETE CASCADE
);