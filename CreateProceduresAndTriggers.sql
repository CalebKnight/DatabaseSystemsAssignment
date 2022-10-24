-- Create a trigger to account for negative runtime values

DELIMITER //

CREATE TRIGGER IF NOT EXISTS FESTIVAL_RUNTIME_TRIGGER 
BEFORE INSERT ON FESTIVAL FOR EACH ROW BEGIN 
	IF NEW.runtime < 0 THEN SET NEW.runtime = 0;
	END IF;
END; 

// 

DELIMITER ;

-- Create a trigger for year field to make sure it is greater than 1927 and raise an error if it isn't

-- We don't automatically fix this as it is likely a typo or invalid data

DELIMITER //

CREATE TRIGGER IF NOT EXISTS YEAR_TRIGGER BEFORE INSERT 
ON FILM FOR EACH ROW BEGIN 
	IF NEW.year < 1927 THEN SIGNAL SQLSTATE '45000'
	SET
	    MESSAGE_TEXT = 'Year must be greater than 1928';
	END IF;
END; 

// 

DELIMITER ;

-- Create a procedure when inserting films to make null values like length 0

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS ADD_FILM(IN TITLE VARCHAR
(255), IN GENRE VARCHAR(255), IN YEAR INTEGER, IN 
DIRECTOR_ID INTEGER, IN LENGTH INTEGER) BEGIN 
	INSERT INTO
	    Film (
	        title,
	        genre,
	        year,
	        director_id,
	        length
	    )
	VALUES (
	        title,
	        genre,
	        year,
	        director_id,
	        IFNULL(LENGTH, 0)
	    );
END; 

// 

DELIMITER ;

-- Create a procedure to add a festival

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS ADD_FESTIVAL(IN FESTIVAL_NAME 
VARCHAR(255), IN RUNTIME INTEGER) BEGIN 
	INSERT INTO
	    Festival (festival_name, runtime)
	VALUES (festival_name, runtime);
END; 

// 

DELIMITER ;

-- Create a trigger so that if a festival is deleted, all the films scheduled for that festival are also deleted

DELIMITER //

CREATE TRIGGER IF NOT EXISTS FESTIVAL_DELETE_TRIGGER 
BEFORE DELETE ON FESTIVAL FOR EACH ROW BEGIN 
	DELETE FROM Scheduled_Film
	WHERE
	    festival_id = OLD.festival_id;
END; 

// 

DELIMITER ;

-- If a festivals year has changed remove the films associated with it

DELIMITER //

CREATE TRIGGER IF NOT EXISTS VENUE_UPDATE_TRIGGER BEFORE 
UPDATE ON VENUE FOR EACH ROW BEGIN 
	IF NEW.year <> OLD.year THEN
	DELETE FROM Scheduled_Film
	WHERE
	    festival_id = OLD.festival_id;
	END IF;
END; 

// 

DELIMITER ;