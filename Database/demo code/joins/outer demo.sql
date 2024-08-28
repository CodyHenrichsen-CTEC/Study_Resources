-- Demonstrating OUTER JOIN in SQL with the Student database

-- Base query

SELECT
	stu.first_name,
	stu.last_name,
	zip.city
FROM
	student stu
JOIN
	zipcode zip
ON
	stu.zip = zip.zip;

-- RIGHT OUTER JOIN

SELECT
	stu.first_name,
	stu.last_name,
	zip.city
FROM
	student stu
RIGHT OUTER JOIN
	zipcode zip
ON
	stu.zip = zip.zip;

-- FULL OUTER JOIN - Note how it is the same as the RIGHT OUTER JOIN!

SELECT
	stu.first_name,
	stu.last_name,
	zip.city
FROM
	student stu
FULL OUTER JOIN
	zipcode zip
ON
	stu.zip = zip.zip;

-- base query 

SELECT
	cou.course_no,
	cou.description,
    loj.course_no AS pre_req,
	loj.description AS pre_desc
FROM
	course cou
JOIN
	course loj
ON
	loj.course_no = cou.prerequisite
ORDER BY
    cou.course_no;

-- LEFT OUTER JOIN

SELECT
	cou.course_no,
	cou.description,
    loj.course_no AS pre_req,
	loj.description AS pre_desc
FROM
	course cou
LEFT OUTER JOIN
	course loj
ON
	loj.course_no = cou.prerequisite
ORDER BY
    cou.course_no;

-- RIGHT OUTER JOIN
SELECT
	cou.course_no,
	cou.description,
    roj.course_no AS pre_req,
	roj.description AS pre_desc
FROM
	course cou
RIGHT OUTER JOIN
	course roj
ON
	roj.course_no = cou.prerequisite
ORDER BY
    cou.course_no;

-- FULL OUTER JOIN

SELECT
	cou.course_no,
	cou.description,
    foj.course_no AS pre_req,
	foj.description AS pre_desc
FROM
	course cou
FULL OUTER JOIN
	course foj
ON
	foj.course_no = cou.prerequisite
ORDER BY
    cou.course_no;

-- Proper use of a CASE block with a LEFT OUTER JOIN to make the results better
-- For some reason NULL causes me stress!

SELECT
	cou.course_no,
	cou.description,
    CASE
        WHEN loj.course_no IS NULL THEN 'n/a'
        ELSE TO_CHAR(loj.course_no)
    END AS pre_req
	,
	CASE
        WHEN loj.description IS NULL THEN 'none'
        ELSE loj.description
    END AS pre_desc
FROM
	course cou
LEFT OUTER JOIN
	course loj
ON
	loj.course_no = cou.prerequisite
ORDER BY
    cou.course_no;


-- If no data is missing LOJ/ROJ is the same as the default (INNER) join
SELECT
	gr.numeric_grade,
	enr.student_id
FROM
	grade gr
JOIN
	enrollment enr
ON
	gr.student_id = enr.student_id
	AND
	enr.section_id = gr.section_id;
   
