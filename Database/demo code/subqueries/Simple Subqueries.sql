-- Basic Scalar subquery
-- I want to find the student's names that are less than the 
-- average student id
-- start with inner
SELECT 
    AVG (stu.student_id)
FROM
    student stu
;
-- then the outer

SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
;

-- Combined for answer

SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
WHERE
    stu.student_id <
    (
        SELECT 
            FLOOR(AVG (stu.student_id)) AS average_ID
        FROM
            student stu     
    )
;