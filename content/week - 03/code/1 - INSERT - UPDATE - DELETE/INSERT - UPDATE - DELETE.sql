-- 1. insert data to examples
-- DATA : 
-- first_name:        David        |       Emily         |      Theo          |      Emily         |      Jim 
-- last_name:        Mitchell      |       Watson        |      Scott         |      Smith         |      Burr
-- email:        dmitch@gmail.com  |  ewatson@gmail.com  |  tscott@gmail.com  |  esmith@gmail.com  |  jburr@gmail.com
-- nationality:        GBR         |         USA         |        AUS         |       GBR          |       USA
-- age:                43          |         29          |        33          |       29           |       54

INSERT INTO examples (first_name, last_name, email, nationality, age)
VALUES ('David', 'Mitchell', 'dmitch@gmail.com', 'GBR', 43),
	   ('Emily', 'Watson', 'ewatson@gmail.com', 'USA', 29),
	   ('Theo', 'Scott', 'tscott@gmail.com', 'AUS', 33),
	   ('Emily', 'Smith', 'esmith@gmail.com', 'GBR', 29),
	   ('Jim', 'Burr', 'jburr@gmail.com', 'USA', 54);
	  
SELECT * FROM examples;
-- #########################################################
-- Update data in a table
/*
UPDATE table_name
SET column_name = 'new_value'
WHERE  condition  ;
*/
-- 2. update David Mitchell email to "davidmichell@gmail.com"
UPDATE examples
SET email = 'davidmichell@gmail.com'
WHERE example_id = 1;

SELECT * FROM examples;

-- 3. update USA to CAN
UPDATE examples
SET nationality = 'CAN'
WHERE nationality = 'USA';

-- 4. update Jim Burr first name to "James" and age to "55"
UPDATE examples
SET first_name = 'James', age = 55
WHERE example_id = 5;

-- #########################################################
-- Deleting data from a table
/*
DELETE FROM table_name
WHERE condition;
*/
-- 1. delete Emily Watson record.
DELETE FROM examples
WHERE example_id = 2;

SELECT * FROM examples;

-- 2. delete all record with nationality = "GBR"
DELETE FROM examples
WHERE nationality = 'GBR';