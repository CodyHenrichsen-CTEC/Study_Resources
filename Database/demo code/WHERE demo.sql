-- Demonstrating the different ways to limit
-- results of a query using the WHERE clause
-- February 2 2023

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
    )
    OR
    (
        course_no > 200
    )
;

