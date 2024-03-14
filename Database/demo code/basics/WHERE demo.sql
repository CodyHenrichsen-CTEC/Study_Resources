-- Demonstrating the different ways to limit
-- results of a query using the WHERE clause
-- February 2 2024

-- Equality
SELECT
    max_grade
FROM
    grade_conversion
WHERE
    letter_grade = 'B+'
;

SELECT
    grade_point
FROM
    grade_conversion
WHERE
    max_grade = 79
;

SELECT
    section_id
FROM
    grade_type_weight
WHERE
    drop_lowest != 'Y'

;

-- Similarity 

SELECT
    section_no
FROM
    section
WHERE
    location LIKE '%4'
;

SELECT
    description
FROM
    course
WHERE
    course_no LIKE '_5_'
;

-- Specificity
SELECT
	first_name
FROM
	instructor
WHERE
	last_name IN ('Perez','Hromcik','Zhao')
;

SELECT DISTINCT
    grade_type_code
FROM
    grade
WHERE
    numeric_grade IN (85, 99, 76)
;

-- Relation

SELECT
    section_no
FROM
    section
WHERE
    capacity <= 25
;

SELECT
    section_id
FROM
    enrollment
WHERE
    student_id > 254
;

-- Range
SELECT
    student_id
FROM
    section
WHERE
    section_id BETWEEN 83 AND 91
;

SELECT
    student_id
FROM
    student
WHERE
    last_name BETWEEN 'Abdou' AND 'Avia'
;

-- Compound Logic


SELECT
    student_id
FROM
    student
WHERE
    (
        last_name BETWEEN 'Abdou' AND 'Avia'
    )
    AND
    (
        salutation != 'Mr.'
    )
;

SELECT
    description
FROM
    course
WHERE
    (
        course_no LIKE '_5_'
        AND
        course_no != '050'
    )
    OR
    (
        course_no > 200
    )
;

-- Compound logic in a WHERE clause
-- Last name must have EITHER second letter of 'a' or third letter of 'i' 
-- AND the first name needs to end in 'y'

SELECT
    firstName AS first,
    lastName AS last,
    city
FROM
    students
WHERE
    (
        lastName LIKE '_a%'
        OR
        lastName LIKE '__i%'
    )
    AND
    firstName LIKE '%y'
;


