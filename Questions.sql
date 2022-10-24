-- Which actors or directors won an award at the Oscars?

SELECT
    People.first_name,
    People.last_name,
    Award.name as 'Won Award For'
FROM People
    JOIN Award_Winner ON Award_Winner.people_id = People.people_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
LIMIT 20;

-- Which actors won the most awards?

SELECT
    People.first_name,
    People.last_name,
    COUNT(Award.name) as 'Number of Awards Won'
FROM People
    JOIN Award_Winner ON Award_Winner.people_id = People.people_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
GROUP BY People.people_id
ORDER BY
    COUNT(Award.name) DESC
LIMIT 10;

-- Which films won the most awards?

SELECT
    Film.title as "Film Title",
    COUNT(Award.name) as 'Number of Awards Won'
FROM Film
    JOIN Award_Winner ON Award_Winner.film_id = Film.film_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
GROUP BY Film.film_id
ORDER BY
    COUNT(Award.name) DESC
LIMIT 10;

-- Which films were the longest?

SELECT
    Film.title as "Film Title",
    Film.length as "Film Length"
FROM Film
ORDER BY Film.length DESC
LIMIT 10;

-- Which films were the shortest?

SELECT
    Film.title as "Film Title",
    Film.length as "Film Length"
FROM Film
ORDER BY Film.length ASC
LIMIT 10;

-- Which films were at each festival?

SELECT
    Film.title as 'Film Title',
    Festival.festival_name as 'Festival Name',
    Venue.place as 'Festival Location',
    Venue.year as 'Year'
FROM Film
    JOIN Scheduled_Film ON Scheduled_Film.film_id = Film.film_id
    JOIN Festival ON Festival.festival_id = Scheduled_Film.festival_id
    JOIN Venue ON Venue.festival_id = Festival.festival_id
LIMIT 10;

-- Which film won the most awards in a decade?

SELECT
    Film.title as "Film Title",
    Film.year as "Year",
    COUNT(Award.name) as 'Number of Awards Won'
FROM Film
    JOIN Award_Winner ON Award_Winner.film_id = Film.film_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
WHERE
    Film.year BETWEEN 2000 AND 2009
GROUP BY Film.film_id
ORDER BY
    COUNT(Award.name) DESC
LIMIT 10;

-- Which Festival showcased the most films?

SELECT
    Festival.festival_name as 'Festival Name',
    Venue.year as 'Year',
    COUNT(Scheduled_Film.film_id) as 'Number of Films'
FROM Festival
    JOIN Scheduled_Film ON Scheduled_Film.festival_id = Festival.festival_id
    JOIN Venue ON Venue.festival_id = Festival.festival_id
GROUP BY
    Festival.festival_id,
    Venue.year
ORDER BY
    COUNT(Scheduled_Film.film_id) DESC
LIMIT 10;

-- Who directed the most award winning films

SELECT
    People.first_name as 'Director First Name',
    People.last_name as 'Director Last Name',
    COUNT(Award.name) as 'Number of Awards Won'
FROM People
    JOIN Film ON Film.director_id = People.people_id
    JOIN Award_Winner ON Award_Winner.film_id = Film.film_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
GROUP BY People.people_id
ORDER BY
    COUNT(Award.name) DESC
LIMIT 10;

-- Find the most award winning genre

SELECT
    Film.genre,
    COUNT(Award.name) as 'Number of Awards Won'
FROM Film
    JOIN Award_Winner ON Award_Winner.film_id = Film.film_id
    JOIN Award ON Award.award_id = Award_Winner.award_id
GROUP BY Film.genre
ORDER BY
    COUNT(Award.name) DESC
LIMIT 10;