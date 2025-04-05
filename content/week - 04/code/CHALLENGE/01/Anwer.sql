-- 1 - Select the movie_name and release_date of every movie.
SELECT movie_name, release_date FROM movies;

-- 2 - Select the first and last names of all Americans directors.
SELECT first_name, last_name FROM directors
WHERE nationality = 'American';

-- 3 - Select all male actors borns after the 1st of Janurry 1970.
SELECT * FROM actors
WHERE gender = 'F' AND date_of_birth > '1970-01-01';

-- 4 - Select the names of all movies which are over 90 minutes long and movie language is English.
SELECT movie_name FROM movies
WHERE movie_length > 90 AND movie_lang = 'English';