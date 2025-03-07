-- 1. Create examples table
--    column_1 : example_id (SERIAL - PK) 
--	  column_2 : first_name (VARCHAR(30)) 
--    column_3 : last_name (VARCHAR(30))

CREATE TABLE examples(
	example_id		SERIAL PRIMARY KEY,
	first_name		VARCHAR(30),
	last_name		VARCHAR(30)
);

SELECT * FROM examples;

-- ###################################

-- add column to the table :
/*

ALTER TABLE table_name
ADD COLUMN column_name data_type CONSTRAINT;

*/

-- 2. Add "email(VARCHAR(50) - UNIQUE)" Column to examples table

ALTER TABLE examples
ADD COLUMN email VARCHAR(50) UNIQUE;

SELECT * FROM examples;

-- ###################################

-- 3. Add "nationality(VARCHAR(30))" and "age(INT - NOT NULL)" columns to examples table

ALTER TABLE examples
ADD COLUMN nationality VARCHAR(30),
ADD COLUMN age INT NOT NULL;

SELECT * FROM examples;

-- ###################################

-- change column data type :
/*

ALTER TABLE table_name
ALTER COLUMN column_name TYPE new_data_type;

*/

-- ###################################

-- 4. Change "nationality" column type to CAHR(3)

ALTER TABLE examples 
ALTER COLUMN nationality TYPE CHAR(3);

SELECT * FROM examples;

-- ###################################

-- 5. Change type of "last_name" column to "VARCAHR(50)" and "email" column to "VARCHAR(80)"

ALTER TABLE examples 
ALTER COLUMN last_name TYPE VARCHAR(50),
ALTER COLUMN email TYPE VARCHAR(80);

SELECT * FROM examples;

-- ###################################

-- remove tables from a database
/*

DROP TABLE table_name;

*/
-- ###################################

--	6. create "practice" table 
--	   column_1 : practice_id (SERIAL - PK) 
-- 	   column_2 : product_name (VARCHAR(50)) 
-- 	   column_3 : product_price (NUMERIC(4,2))

CREATE TABLE practice (
	practice_id				SERIAL PRIMARY KEY,
	product_name 	VARCHAR(50),
	product_price 	NUMERIC(4,2)
);

SELECT * FROM practice;

-- ###################################

--	7. remove "practice" table

DROP TABLE practice;