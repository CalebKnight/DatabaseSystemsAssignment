CREATE TABLE
    IF NOT EXISTS Film (
        film_id INTEGER NOT NULL AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        genre VARCHAR(255) NOT NULL,
        year INTEGER NOT NULL,
        director_id INTEGER NOT NULL,
        length INTEGER NOT NULL,
        PRIMARY KEY(film_id)
    );

CREATE TABLE
    IF NOT EXISTS People(
        people_id INTEGER NOT NULL AUTO_INCREMENT,
        birth_year INTEGER NOT NULL,
        death_year INTEGER,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        PRIMARY KEY(people_id)
    );

CREATE TABLE
    IF NOT EXISTS Award(
        award_id INTEGER NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        year INTEGER NOT NULL,
        PRIMARY KEY(award_id)
    );

CREATE TABLE
    IF NOT EXISTS Award_Winner(
        award_id INTEGER NOT NULL,
        people_id INTEGER,
        film_id INTEGER NOT NULL,
        FOREIGN KEY (award_id) REFERENCES Award(award_id),
        FOREIGN KEY (people_id) REFERENCES People(people_id),
        FOREIGN KEY (film_id) REFERENCES Film(film_id),
        PRIMARY KEY (award_id, film_id, people_id)
    );

CREATE TABLE
    IF NOT EXISTS Festival(
        festival_id INTEGER NOT NULL AUTO_INCREMENT,
        festival_name VARCHAR(255) NOT NULL,
        runtime INTEGER NOT NULL,
        PRIMARY KEY(festival_id)
    );

CREATE TABLE
    IF NOT EXISTS Venue(
        place VARCHAR(255) NOT NULL,
        year INTEGER NOT NULL,
        festival_id INTEGER NOT NULL,
        PRIMARY KEY(place, year),
        FOREIGN KEY (festival_id) REFERENCES Festival(festival_id) ON DELETE CASCADE
    );

CREATE TABLE
    IF NOT EXISTS Scheduled_Film(
        film_id INTEGER NOT NULL,
        festival_id INTEGER NOT NULL,
        FOREIGN KEY (film_id) REFERENCES Film(film_id),
        FOREIGN KEY (festival_id) REFERENCES Festival(festival_id),
        PRIMARY KEY (film_id, festival_id)
    );