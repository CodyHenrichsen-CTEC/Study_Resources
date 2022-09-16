-- Simple two table join with single PK-FK path

SELECT
    stu.first_name,
    zip.city
FROM
    student stu
JOIN
    zipcode zip
ON
    stu.zip = zip.zip
;
-- Three table join with single PK/FK relationships
SELECT
    ins.last_name,
    cou.cost
FROM
    instructor ins
JOIN
    section sec
ON
    ins.instructor_id = sec.instructor_id
JOIN
    course cou
ON
    cou.course_no = sec.course_no
;

-- Three table join with a WHERE clause to limit results. Single PK/FK relationships between all tables
SELECT
    ins.first_name,
    cou.description
FROM
    course cou
JOIN
    section sec
ON
    cou.course_no = sec.course_no
JOIN
    instructor ins
ON
    ins.instructor_id = sec.instructor_id
WHERE
    ins.first_name = 'Charles'
;

-- Three table JOIN with composite PK/FK relationships between all tables
SELECT
    gra.grade_type_code,
    enr.final_grade
FROM
    grade gra
JOIN
    enrollment enr
ON
    enr.student_id = gra.student_id
    AND
    gra.section_id = enr.section_id
JOIN
    grade_type_weight gtw
ON
    gtw.grade_type_code = gra.grade_type_code
    AND
    gtw.section_id = gra.section_id
WHERE
    gtw.percent_of_final_grade > 30
;

-- JOIN and Aggregate function demo

SELECT
    AVG(stu.student_id) AS silly,
    stu.zip,
    COUNT(*) AS students
FROM
    student stu
JOIN
    zipcode zip
ON
    zip.zip = stu.zip
WHERE
    zip.city LIKE '%c%'
GROUP BY
    stu.zip
ORDER BY
    students ASC
;

-- Build-a-query results
--AM
SELECT
    sec.course_no,
    cou.description,
    ins.street_address,
    COUNT(*) AS num_grades
FROM
    instructor ins
JOIN
    section sec
ON
    ins.instructor_id = sec.instructor_id
JOIN
    course cou
ON
    cou.course_no = sec.course_no
JOIN
    enrollment enr
ON
    sec.section_id = enr.section_id
JOIN
    grade gra
ON
    enr.section_id = gra.section_id
    AND
    enr.student_id = gra.student_id
GROUP BY
    sec.course_no,
    cou.description,
    ins.street_address
ORDER BY
    num_grades,
    ins.street_address;
--PM
SELECT
    stu.first_name,
    stu.zip,
    sec.course_no,
    AVG(gra.numeric_grade) AS average_grade,
    gra.created_date
FROM
    grade gra
JOIN
    enrollment enr
ON
    gra.student_id = enr.student_id
    AND
    gra.section_id = enr.section_id
JOIN
    student stu
ON
    stu.student_id = enr.student_id
JOIN
    section sec
ON
    sec.section_id = enr.section_id
GROUP BY
    stu.first_name,
    stu.zip,
    sec.course_no,
    gra.created_date
;    