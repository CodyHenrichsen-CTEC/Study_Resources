SELECT
    reg.sectionID,
    (
        SELECT
            SUM(stu.tuitionBalance) AS BALANCE
        FROM
            students stu
        WHERE
            stu.studentID = reg.studentID
    ) AS section_balance
FROM
    registration reg
JOIN
    sections sec
ON
    sec.sectionID = reg.sectionID
JOIN
    courses cou
ON 
    cou.courseID = sec.courseID
WHERE
    cou.subjectCode = 'CS'
ORDER BY
    section_balance DESC
;


