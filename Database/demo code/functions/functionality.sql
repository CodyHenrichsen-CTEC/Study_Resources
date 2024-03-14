-- Sample Oracle Functions
-- Using the Student database and Dual table

-- Text Functions

SELECT
    LOWER(city) || ' ' || city AS small_and_normal_city,
    UPPER(lastName) AS BIG_MOD,
    SUBSTR(city, 4) AS partial_city_name
FROM
    professors
WHERE
    MOD(zip, 2) = 0;

-- Note the effect RPAD with a small second parameter has on the results!
SELECT
    LPAD(city, 50, '*') AS left_pad_demo,
    RPAD(city, 6, '?') AS right_pad_trim_demo,
    RPAD(city, 20, '?') AS right_pad_demo
FROM
    zipcode
WHERE
    zip < 5000;
    

SELECT
    LTRIM ('cody', 'c') AS Left_Trim,
    RTRIM ('xxxyy   Z', 'xy') AS right_trim,
    RTRIM ('xxxyy   yz', 'z') AS right_trim_two,
    LTRIM ('        cody') AS left_trim_two,
    LTRIM ('xxxyyy', 'x') AS lt3,
    TRIM ('   asda as asda    ') AS full_trim
FROM
    dual;
    
SELECT
    firstName as FIRST,
    SUBSTR (firstName, 2) AS partial_first,
    SUBSTR (lastName, LENGTH(lastName) / 2 ) AS last_half_name,
    SUBSTR (firstName, -4) AS last_four_letters_of_first
FROM
    students;

-- Numeric functions
    
SELECT
    ROUND (1234.127, 2) AS partial_round,
    ROUND (1274.127, -2) AS whole_round
FROM 
    dual;
    
SELECT
    ROUND (numeric_grade, -1) AS rounded
FROM
    grade;


-- The order of WHEN blocks in a CASE really matter!!!
    
SELECT
    first_name,
    CASE
        WHEN zip < 10000 THEN 'here'
        WHEN zip < 39999 THEN 'there'
        WHEN zip > 40000 THEN 'over there ish'
        WHEN zip > 70000 THEN 'aways ish'
        ELSE 'idk'
    END AS where_are_they
FROM
    students;
    
-- The OK way to work with NULL

SELECT 
    NVL (field_name, '') AS data_source
FROM
    table_name;

-- The PREFERRED way to work with NULL!!!
    
SELECT
    CASE
        WHEN field_name IS NULL THEN 'empty'
        WHEN field_name < 123 THEN 'small'
        ELSE 'SDASDA'
    END AS datasource
FROM
    table_name;

-- Compound functions!!!

SELECT
    RTRIM (description, SUBSTR(description, - (LENGTH (DESCRIPTION ) / 2))) AS half_desc
FROM
    course
;