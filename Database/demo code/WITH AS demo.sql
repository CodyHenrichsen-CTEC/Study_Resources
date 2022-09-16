-- Find the student numbers of the students enrolled in school whose zipcodes have less than the average number of students.
-- Demonstrating the use of a named query (WITH xx AS ...) to simplify the reading and use of the code.

WITH count_by_zip AS
(
	SELECT
                COUNT(*) AS number_enrolled,
                z.zip
        FROM
                zipcode z
        JOIN
                student stu
        ON
                z.zip = stu.zip
        JOIN
                enrollment en
        ON
                stu.student_id = en.student_id
        WHERE EXISTS
        (
                SELECT
                        'X'
                FROM
                        student
                WHERE
                        student_id = en.student_id
        )
        GROUP BY
                z.zip

)
SELECT DISTINCT
    stu.student_id
FROM
    student stu
JOIN
    enrollment en
ON
    stu.student_id = en.student_id
WHERE
    zip IN
    (
        SELECT 
            count_by_zip.zip
        FROM
        
            count_by_zip
        WHERE
            count_by_zip.number_enrolled <
            (
                SELECT
                    AVG(count_by_zip.number_enrolled)
                FROM
                    count_by_zip
            )
    )
ORDER BY
    stu.student_id DESC;

