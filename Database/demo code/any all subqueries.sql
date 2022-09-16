SELECT
    gra.student_id, 
    gra.section_id, 
    gra.numeric_grade
FROM 
    grade gra
WHERE 
    gra.grade_type_code = 'FI'
    AND 
    gra.numeric_grade > ANY
    (
        SELECT 
            in_grade.numeric_grade
        FROM 
            grade in_grade
        WHERE 
            in_grade.grade_type_code = 'HM'
            AND 
            gra.section_id = in_grade.section_id
            AND 
            gra.student_id = in_grade.student_id
    )
;    



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

-- Students who arent enrolled in classes
SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
WHERE NOT EXISTS
    (
        SELECT
            'X'
        FROM
            enrollment enr
        WHERE
            enr.student_id = stu.student_id
    )
;


SELECT 
    cou.course_no
FROM
    course cou
WHERE
    cou.description LIKE '%Java%'
;

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

