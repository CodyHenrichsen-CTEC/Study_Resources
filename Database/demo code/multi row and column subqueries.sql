-- Bad 🫠 demo for finding all the student ids whose section is less than any of the ones with more than three
SELECT
    stu.student_id
FROM
    student stu
JOIN
    enrollment enr
ON
    enr.student_id = stu.student_id
WHERE
    enr.section_id < ANY 
    (
        SELECT
            in_enr.section_id
        FROM
            enrollment in_enr
        GROUP BY
            in_enr.section_id
        HAVING
            COUNT (*) > 3
    )
;


-- Find all the students who AREN'T in classes with more than three students
SELECT
    stu.student_id
FROM
    student stu
JOIN
    enrollment enr
ON
    enr.student_id = stu.student_id
WHERE
    enr.section_id NOT IN
    (
        SELECT
            in_enr.section_id
        FROM
            enrollment in_enr
        GROUP BY
            in_enr.section_id
        HAVING
            COUNT (*) > 3
    )
;

-- Base query for java classes
SELECT 
    cou.course_no
FROM
    course cou
WHERE
    cou.description LIKE '%Java%'
;


-- Find the students in java classes
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
JOIN
    enrollment enr
ON
    enr.student_id = stu.student_id
JOIN
    section sec
ON
    sec.section_id = enr.section_id
WHERE
    sec.course_no IN
    (
        SELECT 
            cou.course_no
        FROM
            course cou
        WHERE
            cou.description LIKE '%Java%'
    )
;
-- Remade via the WITH/AS clauses
WITH java_courses AS
(
        SELECT 
            cou.course_no
        FROM
            course cou
        WHERE
            cou.description LIKE '%Java%'
)
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
JOIN
    enrollment enr
ON
    enr.student_id = stu.student_id
JOIN
    section sec
ON
    sec.section_id = enr.section_id
WHERE
    sec.course_no IN
    (
        SELECT
            *
        FROM
            java_courses
    )
;

--any/all

-- Students whose id is less than or equal to any of the section_id

SELECT
    stu.first_name,
    stu.zip
FROM
    student stu
WHERE
    stu.student_id <= ANY
    (
        SELECT
            sec.section_id
        FROM
            section sec
        WHERE
            sec.location LIKE 'L%'
    )
;


SELECT
    stu.first_name,
    stu.zip
FROM
    student stu
WHERE
    stu.student_id > ALL
    (
        SELECT
            sec.section_id
        FROM
            section sec
        WHERE
            sec.location LIKE 'L%'
    )
;

SELECT
    stu.first_name,
    stu.zip
FROM
    student stu
WHERE
    (stu.student_id, stu.created_by) <= ANY -- Can't have more than one column in the comparison!
    (
        SELECT
            sec.section_id,
            sec.modified_by
        FROM
            section sec
        WHERE
            sec.location LIKE 'L%'
    )
;  

SELECT
    stu.first_name,
    stu.zip
FROM
    student stu
WHERE
    (stu.student_id, stu.created_by) IN -- Use IN/NOT IN for a match of multiple values
    (
        SELECT
            sec.section_id,
            sec.modified_by
        FROM
            section sec
        WHERE
            sec.location LIKE 'L%'
    )
;     

--

SELECT 
    out_co.course_no, 
    out_co.description, 
    out_co.cost
FROM 
    course out_co
WHERE 
    out_co.cost IN
    (
        SELECT 
            in_co.cost
        FROM 
            course in_co
        WHERE 
            in_co.prerequisite = 20
    )
;