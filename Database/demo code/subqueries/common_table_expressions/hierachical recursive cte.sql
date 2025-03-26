

WITH hierarchy_demo (subjectCode, courseNumber, prerequisite, courseID) AS
(
    SELECT -- Anchor Query
        cou.subjectCode,
        cou.courseNumber,
        cou.prerequisite,
        cou.courseID
    FROM
        courses cou
    WHERE
        cou.prerequisite IS NULL

    UNION ALL

    SELECT -- Recursive Query
        cour.subjectCode,
        cour.courseNumber,
        cour.prerequisite,
        cour.courseID
    FROM
        courses cour
    JOIN
        hierarchy_demo demo
    ON
        demo.courseID = cour.prerequisite
)
SELECT
    recur.subjectCode || ' ' || recur.courseNumber AS course,
    recur.prerequisite AS requires
FROM
    hierarchy_demo recur
WHERE
    recur.subjectCode = 'CS'
;



WITH hierarchy_demo_level (course_name, prerequisite, id, prereq_count) AS
(
    SELECT -- Anchor Query
        cou.subjectCode || ' ' || cou.courseNumber AS course_name,
        cou.prerequisite,
        cou.courseID,
        0 AS prereq_count
    FROM
        courses cou
    WHERE
        cou.prerequisite IS NULL

    UNION ALL

    SELECT -- Recursive Query
        cour.subjectCode || ' ' || cour.courseNumber AS course_name,
        cour.prerequisite,
        cour.courseID,
        demo.prereq_count + 1 -- Shows the depth of recursion!
    FROM
        courses cour
    JOIN
        hierarchy_demo_level demo
    ON
        demo.id = cour.prerequisite
)
SELECT
    *
FROM
    hierarchy_demo_Level recur
WHERE
    INSTR(recur.course_name, 'CS') > 0
;




