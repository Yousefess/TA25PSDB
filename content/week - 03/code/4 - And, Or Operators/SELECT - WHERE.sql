-- Retrive Data
-- Select all record from directors table.
SELECT * FROM directors;

-- Select director fname from directors table.
SELECT first_name FROM directors;

-- Select director fname and lname from directors table.
SELECT first_name, last_name FROM directors;

-- Select director fname and lname and nationality from directors table.
SELECT first_name, last_name, nationality FROM directors;

-- Retriving data with a where clasue

-- Select all record from movies table.
SELECT * FROM movies;

-- Select all record from movies table age certificate = 15.
SELECT * FROM movies
WHERE age_certificate = '15';

-- Select all record from movies table age certificate = 15 and movie language = Chinese.
SELECT * FROM movies
WHERE age_certificate = '15' AND movie_lang = 'Chinese';

-- Select all record from movies table age certificate = 15 or movie language = Chinese.
SELECT * FROM movies
WHERE age_certificate = '15' OR movie_lang = 'Chinese';

-- Select all record from movies table age certificate = 15 and movie language = english and director_id = 27.
SELECT * FROM movies
WHERE age_certificate = '15' AND movie_lang = 'English' AND director_id = 27;