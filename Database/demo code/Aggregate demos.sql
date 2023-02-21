-- Base query to get the airlines and first names from all
SELECT
    airline,
    passenger_first_name
FROM
    reservations
;

-- Coalesce results based on the same airline and first names
SELECT
    airline,
    passenger_first_name,
    COUNT(*) AS flights_by_name
FROM
    reservations
GROUP BY
    airline,
    passenger_first_name
;

-- Incorrect because missing the GROUP BY clause
-- Causes the Oracle 00979 error!
SELECT
    airline,
    passenger_first_name,
    COUNT(*) AS flights_by_name
FROM
    reservations
;

-- Adding a HAVING clause.
SELECT
    airline,
    passenger_first_name,
    COUNT(*) AS flights_by_name
FROM
    reservations
GROUP BY
    airline,
    passenger_first_name
HAVING
    AVG (cost) < 1100
;

-- Base query
SELECT
    section_id
FROM
    enrollment;

-- Identify individual values 
SELECT DISTINCT
    section_id
FROM
    enrollment;

-- Show relationship of DISTINCT values to COUNT and GROUP BY
SELECT
    section_id,
    COUNT(*) AS enroll_count
FROM
    enrollment
GROUP BY
    section_id;

-- Add another function to demonstrate how the GROUP BY impacts the results
SELECT
    section_id,
    AVG(student_id) AS ridiculous,
    COUNT(*) AS enroll_count
FROM
    enrollment
GROUP BY
    section_id;

-- Adding a third function
SELECT
    section_id,
    AVG(student_id) AS ridiculous,
    MIN(student_id) AS earliest_student,
    COUNT(*) AS enroll_count
FROM
    enrollment
GROUP BY
    section_id;

-- Using the HAVING clause to restrict results
SELECT
    section_id,
    COUNT(*) AS enroll_count
FROM
    enrollment
GROUP BY
    section_id
HAVING
    COUNT(*) > 4
ORDER BY
    enroll_count ASC,
    section_id ASC
;

-- Using the HAVING and WHERE clauses to restrict results
SELECT
    section_id,
    COUNT(*) AS enroll_count
FROM
    enrollment
WHERE
    section_id < 100
GROUP BY 
    section_id
HAVING
    COUNT(*) > 4
ORDER BY
    enroll_count ASC,
    section_id DESC
;

-- Write a SELECT statement that shows student IDs 
-- and the number of courses each student is
-- enrolled in. 
-- Show only those enrolled in more than two classes.

-- Stub
SELECT
    student_id
FROM
    enrollment
;

-- Base
SELECT
    student_id,
    COUNT(*) AS enrolled_count
FROM
    enrollment
GROUP BY
    student_id
;

-- Answer
SELECT
    student_id,
    count(*) AS enrolled_count
FROM
    enrollment
GROUP BY
    student_id
HAVING
    COUNT(*) > 2
;