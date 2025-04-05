-- Aggregate Functions : COUNT

-- Count of records in movie revenues table.
SELECT COUNT(*)
FROM movie_revenues;

-- Count of international takings in movie revenues table.
SELECT COUNT(domestic_takings)
FROM movie_revenues;

-- How many movies are in English?
SELECT COUNT(*)
FROM movies
WHERE movie_lang = 'English'
-- #####################################################
-- Aggregate Functions : SUM

-- Sum of domestic takings.
SELECT SUM(domestic_takings)
FROM movie_revenues
-- sum of movie length (lang = Chinese)

-- #####################################################
-- Aggregate Functions : MIN and MAX

-- Max and Min of movie length.
SELECT MAX(movie_length), MIN(movie_length)
FROM movies

-- #####################################################
-- Aggregate Functions : AVG

-- Average of movie length.
SELECT SUM(movie_length) / COUNT(*)
FROM movies