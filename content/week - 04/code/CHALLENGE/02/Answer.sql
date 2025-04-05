-- 1 - Select the movie names and movie language of all movies with a movie language of English, Spanish or Korean.
SELECT movie_name, movie_lang FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');

-- 2 - Select the first and last names of all actors whose last name begins with M and were born between 01/01/1940 
-- and 31/12/1969.
SELECT first_name, last_name FROM actors
WHERE last_name LIKE 'M%' AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';

-- 3 - Select the first and last names of the directors with nationality of British, French or German born between
-- 01/01/1950 and 31/12/1980.
SELECT first_name, last_name FROM directors 
WHERE nationality IN ('British', 'French', 'German') AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';