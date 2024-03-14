-- Working with NULL values

-- OK handling of NULL
SELECT
    NVL (phone, 'not really there') AS phone_number
FROM
    student
WHERE
    student_id BETWEEN 110 AND 115
;

-- PROPER handling of a NULL value
SELECT
    CASE
        WHEN phone IS NULL THEN 'none'
        ELSE SUBSTR(phone, -4)
    END as null_demo
FROM
    student
WHERE
    student_id BETWEEN 110 AND 115
;


-- Finding NULL values

SELECT
    student_id
FROM
    enrollment
WHERE
    final_grade IS NOT NULL
;

SELECT
    city
FROM
    zipcode
WHERE
    state IS NULL
;