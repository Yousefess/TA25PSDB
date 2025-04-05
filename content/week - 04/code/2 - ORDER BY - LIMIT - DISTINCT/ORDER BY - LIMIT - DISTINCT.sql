-- Ordering the results returned
SELECT * FROM actors;

-- Actros order by first name
SELECT * FROM actors
ORDER BY first_name;

-- Actros order by first name (reverse)
SELECT * FROM actors
ORDER BY first_name DESC;

-- Actros order by birth date (old --> young)
SELECT * FROM actors
ORDER BY date_of_birth;

-- Actros order by birth date (young --> old)
SELECT * FROM actors
ORDER BY date_of_birth DESC;

-- Female actros order by birth date (young --> old)
SELECT * FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC;

-- ################################################
-- Limiting the number of records returned
-- Movies have lowest domestic takings (5)
SELECT domestic_takings
FROM movie_revenues
ORDER BY domestic_takings
LIMIT 5;

-- Movies have lowest domestic takings (4 - 8)
SELECT domestic_takings
FROM movie_revenues
ORDER BY domestic_takings
LIMIT 5 OFFSET 3;

-- ################################################
-- Distinct values

-- Movies order by language
SELECT DISTINCT movie_lang
FROM movies;

-- Movies order by language (distinct)
SELECT DISTINCT movie_lang
FROM movies
ORDER BY movie_lang;