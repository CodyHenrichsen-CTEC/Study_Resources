-- Find the student numbers of the students enrolled in school whose cities have less than the average number of students.
-- Demonstrating the use of a named query (WITH xx AS ...) to simplify the reading and use of the code.

WITH count_by_city AS
(
	SELECT
            COUNT(*) AS number_enrolled,
            zip.city -- The KEY for this table!
    FROM
            zipcode zip
    JOIN
            student stu
    ON
            zip.zip = stu.zip
    JOIN
            enrollment enr
    ON
            stu.student_id = enr.student_id
    WHERE EXISTS
    (
            SELECT
                    'X'
            FROM
                    student
            WHERE
                    student_id = enr.student_id
    )
    GROUP BY
            zip.city
)

SELECT DISTINCT
    stu.student_id
FROM
    student stu
JOIN
    enrollment en
ON
    stu.student_id = en.student_id
JOIN
    zipcode zip
ON
    zip.zip = stu.zip
WHERE
    zip.city IN
    (
        SELECT 
            cbc.city 
        FROM
            count_by_city cbc
        WHERE
            cbc.number_enrolled <
            (
                SELECT
                    AVG(count_by_city.number_enrolled)
                FROM
                    count_by_city
            )
    )
ORDER BY
    stu.student_id DESC
;




