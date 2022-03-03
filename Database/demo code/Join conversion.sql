-- Convert this poorly formed query to match the ANSI JOIN syntax and Henrichsen's style guide!

SELECT c.course_no, c.description, s.section_no
FROM course c, section s
WHERE c.course_no = s.course_no
AND c.prerequisite IS NULL
ORDER BY c.course_no, section_no;

-- ANSI/Henrichsen approved version

SELECT
    cou.course_no,
    cou.description,
    sec.section_no
FROM
    course cou
JOIN
    section sec
ON
    cou.course_no = sec.course_no
WHERE
    cou.prerquisite IS NULL
ORDER BY
    cou.course_no,
    sec.section_no