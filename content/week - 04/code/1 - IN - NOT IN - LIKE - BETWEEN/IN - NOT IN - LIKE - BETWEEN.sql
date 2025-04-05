-- Using IN and NOT IN 
SELECT * FROM actors;

-- Actors whose first name is "Bruce" - "John"
SELECT first_name, last_name 
FROM actors
WHERE first_name IN ('Bruce', 'John');

-- Actors whose first name is "Tom" - "John" - "Peter" - "Bruce"
SELECT first_name 
FROM actors
WHERE first_name IN ('Tom', 'John', 'Peter', 'Bruce');

-- Actors whose first name is not "Tom" - "John" - "Peter" - "Bruce"
SELECT first_name 
FROM actors
WHERE first_name NOT IN ('Tom', 'John', 'Peter', 'Bruce');

-- Directors whose nationality is "French" - "Chinese" - "British" - "South Korean"
SELECT * 
FROM directors
WHERE nationality IN ('French', 'Chinese', 'British', 'South Korea');

-- ##################################################################
-- Using LIKE with % and _
-- Actors whose first name is starts with "P" (Length not matter)
SELECT *
FROM actors
WHERE first_name LIKE 'P%';

-- Actors whose first name is starts with "Pe" (Length = 3)
SELECT * FROM actors
WHERE first_name LIKE 'Pe_';

-- Actors whose first name is contain "r" (Length not matter)
SELECT * FROM actors
WHERE first_name LIKE '%r%';

-- Actors whose first name is contain "rl" (Length not matter)
SELECT * FROM actors
WHERE first_name LIKE '%rl%';

-- Actors whose first name is contain "rl" (2 letter left / 1 letter right)
SELECT * FROM actors
WHERE first_name LIKE '__rl_';

-- ##################################################################
-- selecting data where a column is between 2 values
SELECT release_date FROM movies;

-- Movies whose release date "1995" - "1999"
SELECT * FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '1999-12-31'; 

-- Movies whose length "90" - "120"
SELECT * FROM movies
WHERE movie_length BETWEEN 90 AND 120;