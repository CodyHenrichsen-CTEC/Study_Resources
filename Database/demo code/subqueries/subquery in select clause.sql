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
ORDER BY
    section_balance DESC
;