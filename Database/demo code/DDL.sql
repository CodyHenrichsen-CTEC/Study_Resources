-- DDL Syntax guide
-- CREATE table
CREATE TABLE table_name
(
	field_name TYPE(parameter) NOT NULL,
	other_field_name TYPE
	--ONE FIELD PER LINE!!!!
	--Indentation is important
	--for humans to read
);

-- ALTER table for PK
ALTER TABLE 
	table_name
ADD PRIMARY KEY
	(key_field);

-- ALTER table for composite PK	
ALTER TABLE
	demo_table
ADD PRIMARY KEY
	(composite_key, other_key);

-- ALTER table for FK	
ALTER TABLE
	demo_table
ADD CONSTRAINT
	fk_reference_source
FOREIGN KEY
	(key_field)
REFERENCES
	table_name (key_field)
ON DELETE
	CASCADE;

-- Drop table

DROP TABLE
    table_name;
-- Check existence first
DROP TABLE IF EXISTS
    table_name;
   
-- Demo of DDL with data

-- CREATE table demos

CREATE TABLE foods
(
    food_id NUMBER(3) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(100) NOT NULL
    
);

CREATE TABLE people
(
    person_id NUMBER(3) PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_food NUMBER(3)
);


-- ALTER table FK demo

ALTER TABLE
    people
ADD CONSTRAINT
    fk_foods_people
FOREIGN KEY
    (favorite_food)
REFERENCES
    foods (food_id)
ON DELETE
    CASCADE;

-- valid INSERT data

INSERT INTO
    people
    (last_name, first_name, person_id)
VALUES
    ('Last name value','This is a first name',214);

-- Invalid INSERT - FK child before parent

INSERT INTO
    people
    (last_name, first_name, person_id, favorite_food)
VALUES
    ('Last name','This isnt a name',2, 32);


-- Add parent FK

INSERT INTO foods
(
    food_id,
    name,
    description
)
VALUES
(
    32,
    'Nori',
    'Roasted seaweed!'
    
);

-- How to handle unsanitized data insertions
-- concantenation option 
INSERT INTO foods
(
    food_id,
    name,
    description
)
VALUES
(
    42,
    'Sliced Nori',
    ''||'&'||'MAX(asd)'
    
);

--or (not preferred)
SET DEFINE OFF; 

-- then the insert statement
INSERT INTO foods
(
    food_id,
    name,
    description
)
VALUES
(
    2,
    'dark chocolate',
    'dairy free'||'&'||'MAX(vegan approved)'
    
);


--clean up demo code
DROP TABLE -- Have to drop the people table first. 
people;
DROP TABLE
foods;

   
   
	
	