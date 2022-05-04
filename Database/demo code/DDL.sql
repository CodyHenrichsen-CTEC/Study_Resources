CREATE TABLE table_name
(
	field_name TYPE(parameter) NOT NULL,
	other_field_name TYPE
	--ONE FIELD PER LINE!!!!
	--Indentation is important
	--for humans to read
);


ALTER TABLE 
	table_name
ADD PRIMARY KEY
	(key_field);
	
ALTER TABLE
	demo_table
ADD PRIMARY KEY
	(composite_key, other_key);
	
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



DROP TABLE
    table_name;

DROP TABLE IF EXISTS
    table_name;
   
-- Demo of DDL and Inserts

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
    
INSERT INTO
    people
    (last_name, first_name, person_id)
VALUES
    ('Last name value','This is a first name',214);

INSERT INTO
    people
    (last_name, first_name, person_id, favorite_food)
VALUES
    ('Last name','This isnt a name',2, 32);

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
    'Nori',
    ''||'&'||'MAX(asd)'
    
);

--or 
SET DEFINE OFF; -- then the insert statement

--clean up demo code
DROP TABLE
people;
DROP TABLE
foods;

   
   
	
	