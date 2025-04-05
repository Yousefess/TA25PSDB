-- Using Mathematical Operators

/*
+ - / * %
*/

SELECT 5 + 6 AS addition;
SELECT 8 - 3 AS sybtraction;
SELECT 30 / 3 AS division;  -- just return integer part
SELECT 35 / 3 AS division;
SELECT 5 * 6 AS multiplication;

SELECT 15 % 4 AS modules;  -- reminder

SELECT movie_id, (domestic_takings + international_takings) AS total_takings FROM movie_revenues;

SELECT movie_id, (domestic_takings + international_takings) AS total_takings FROM movie_revenues
WHERE domestic_takings IS NOT NULL AND international_takings IS NOT NULL;
