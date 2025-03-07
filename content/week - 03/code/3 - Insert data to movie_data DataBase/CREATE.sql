-- 1. Create movie_data DataBase
--	  (With gui) 
-- ###################################

-- create table :
/*

CREATE TABLE table_name(
	column_1		data_type CONSTRAINT,
	column_2		data_type CONSTRAINT
);

*/
-- ########################################

-- 2. create the "directors" table
--    column_1 : director_id (SERIAL - PK) 
--	  column_2 : first_name (VARCHAR(30))
--	  column_3 : last_name (VARCHAR(30) - NOT NULL)
--	  column_4 : date_of_birth (DATE) 
--	  column_5 : nationality (VARCHAR(20))

CREATE TABLE directors(
	director_id			SERIAL PRIMARY KEY,
	first_name			VARCHAR(30),
	last_name			VARCHAR(30) NOT NULL,
	date_of_birth		DATE,
	nationality			VARCHAR(20)
);

SELECT * FROM directors;

-- ########################################

-- 3. create the "actors" table
--    column_1 : actor_id (SERIAL _ PK)
--	  column_2 : first_name (VARCHAR(30))
--	  column_3 : last_name (VARCHAR(30))
--	  column_4 : gender (CHAR(1))
--	  column_5 : date_of_birth (DATE)

CREATE TABLE actors(
	actor_id		SERIAL PRIMARY KEY,
	first_name		VARCHAR(30),
	last_name		VARCHAR(30),
	gender			CHAR(1),
	date_of_birth	DATE
);

SELECT * FROM actors;

-- ########################################

-- How to use "foregin key" in a table :
/*

CREATE TABLE table_name (
	column_name		data_type REFERENCES reference_table_name(reference_column_name)
);

*/

-- 4. creating the "movies" table (with a foregin key)
--    column_1 : movie_id (SERIAL - PK)
--	  column_2 : movie_name (VARCHAR(50) - NOT NULL) 
--	  column_3 : movie_length (INT) 
-- 	  column_4 : movie_lang (VARCHAR(20))
--    column_5 : release_date (DATE) 
-- 	  column_6 : age_certificate (VARCHAR(5))
-- 	  column_7 : director_id (INT - FK)

CREATE TABLE movies(
	movie_id			SERIAL PRIMARY KEY,
	movie_name			VARCHAR(50) NOT NULL,
	movie_length		INT,
	movie_lang			VARCHAR(20),
	release_date		DATE,
	age_certificate		VARCHAR(5),
	director_id			INT REFERENCES directors(director_id)
);

SELECT * FROM movies;

-- ########################################

-- 5. creating the "movie_revenues" table (with a foregin key)	
--    column_1 : revenue_id (SERIAL - PK) 
--	  column_2 : movie_id (INT - FK) 
--	  column_3 : domestic_takings (NUMERIC(6,2)) 
-- 	  column_4 : international_takings (NUMERIC(6,2))	

CREATE TABLE movie_revenues(
	revenue_id				SERIAL PRIMARY KEY,
	movie_id				INT REFERENCES movies(movie_id),
	domestic_takings		NUMERIC(6,2),
	international_takings	NUMERIC(6,2)
);

SELECT * FROM movie_revenues;

-- ########################################

-- 6. creating the "movies_actors" table (Juction Table)
--    column_1 : movie_id (INT - FK - PK) 
--	  column_2 : actor_id (INT - FK - PK)

CREATE TABLE movies_actors(
	actor_id		INT REFERENCES actors(actor_id),
	movie_id		INT REFERENCES movies(movie_id),
	PRIMARY KEY(actor_id, movie_id)
);

SELECT * FROM movies_actors;