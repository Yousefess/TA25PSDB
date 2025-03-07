-- 1. create new database called "owners_pets"
-- ###################################

-- 2. create the "owners" table
-- 	  column_1 : id (INT - PK)
--    column_2 : first_name (VRCHAR(30))
-- 	  column_3 : last_name (VARCHAR(30))
-- 	  column_4 : city (VARCHAR(30))
--	  column_5 : state (CHAR(2))

CREATE TABLE owners (
	id			INT PRIMARY KEY,
	first_name	VARCHAR(30),
	last_name	VARCHAR(30),
	city		VARCHAR(30),
	state		CHAR(2)
);

SELECT * FROM owners;
-- ###################################

-- 3 - create the "pets" table (with a foregin key)
--	   column_1 : id (INT - PK)
-- 	   column_2 : species (VARCHAR(30))
--	   column_3 : full_name (VARCHAR(30))
-- 	   column_4 : age (INT)
-- 	   column_5 : owner_id (INT - FK)

CREATE TABLE pets (
	id			INT PRIMARY KEY,
	species		VARCHAR(30),
	full_name	VARCHAR(30),
	age			INT,
	owner_id	INT REFERENCES owners(id)
);

SELECT * FROM pets;
-- ###################################

-- 4 - add an "email(VARCHAR(50) - UNIQUE)" column to the owners table

ALTER TABLE owners
ADD COLUMN email VARCHAR(50) UNIQUE;

SELECT * FROM owners;

-- ###################################

-- 5 - change the data type of the "last_name" column in the owners table to "VARCHAR(50)"
	
ALTER TABLE owners 
ALTER COLUMN last_name TYPE VARCHAR(50);

SELECT * FROM owners;