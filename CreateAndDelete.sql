-- Delete tables that currently exist in correct order

DROP TABLE IF EXISTS Scheduled_Film CASCADE;

DROP TABLE IF EXISTS Award_Winner CASCADE;

DROP TABLE IF EXISTS Film CASCADE;

DROP TABLE IF EXISTS Award CASCADE;

DROP TABLE IF EXISTS People CASCADE;

DROP TABLE IF EXISTS Venue CASCADE;

DROP TABLE IF EXISTS Festival CASCADE;

-- Create a table for each entity type

-- Table of films

CREATE TABLE
    IF NOT EXISTS Film (
        film_id INTEGER NOT NULL AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        genre VARCHAR(255) DEFAULT NULL,
        year INTEGER NOT NULL,
        director_id INTEGER NOT NULL,
        length INTEGER DEFAULT NULL,
        PRIMARY KEY(film_id)
    );

-- Table of people, in this context these would be nominees for awards

CREATE TABLE
    IF NOT EXISTS People(
        people_id INTEGER NOT NULL AUTO_INCREMENT,
        birth_year INTEGER DEFAULT NULL,
        death_year INTEGER,
        first_name VARCHAR(255) DEFAULT NULL,
        last_name VARCHAR(255) DEFAULT NULL,
        PRIMARY KEY(people_id)
    );

-- Table of awards for films and people

CREATE TABLE
    IF NOT EXISTS Award(
        award_id INTEGER NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        year INTEGER NOT NULL,
        PRIMARY KEY(award_id)
    );

-- Table of award winning films and people

CREATE TABLE
    IF NOT EXISTS Award_Winner(
        award_id INTEGER NOT NULL,
        people_id INTEGER,
        film_id INTEGER NOT NULL,
        FOREIGN KEY (award_id) REFERENCES Award(award_id) ON DELETE CASCADE,
        FOREIGN KEY (people_id) REFERENCES People(people_id),
        FOREIGN KEY (film_id) REFERENCES Film(film_id) ON DELETE CASCADE,
        PRIMARY KEY (award_id, film_id, people_id)
    );

-- Table of film festivals

CREATE TABLE
    IF NOT EXISTS Festival(
        festival_id INTEGER NOT NULL AUTO_INCREMENT,
        festival_name VARCHAR(255) NOT NULL,
        runtime INTEGER NOT NULL,
        PRIMARY KEY(festival_id)
    );

-- Table of venues for film festivals

CREATE TABLE
    IF NOT EXISTS Venue(
        place VARCHAR(255) NOT NULL,
        year INTEGER NOT NULL,
        festival_id INTEGER NOT NULL,
        PRIMARY KEY(place, year),
        FOREIGN KEY (festival_id) REFERENCES Festival(festival_id) ON DELETE CASCADE
    );

-- Table of films nominated at film festivals

CREATE TABLE
    IF NOT EXISTS Scheduled_Film(
        film_id INTEGER NOT NULL,
        festival_id INTEGER NOT NULL,
        FOREIGN KEY (film_id) REFERENCES Film(film_id) ON DELETE CASCADE,
        FOREIGN KEY (festival_id) REFERENCES Festival(festival_id) ON DELETE CASCADE,
        PRIMARY KEY (film_id, festival_id)
    );