-- Contrived CTE example

-- I want all the students that have a last name starting with letters W - V 
-- and are enrolled in CS 1410 and have more than two graded assignments.
-- and I need their total registration course count

SELECT
    stu.studentID
FROM
    students stu
JOIN
    enrollment enr
ON
    enr.studentID = stu.studentID
WHERE
    stu.lastName BETWEEN 'W' AND 'V'
    ;

WITH named_query AS 
(
    SELECT
        tab.primary_field,
        tab.needed_field,
        other.other_needed
    FROM
        table_name tab
    JOIN
        other_table other
    ON
        other.foreign_key = tab.primary_field
    WHERE
        other.some_field < 123
)
, other_cte_example AS
(
    SELECT
        value
    FROM
        table_name
)
SELECT
    data.field_name,
    named.needed_field
FROM
    data_source data
JOIN
    named_query named
ON
    data.id = named.primary_field
WHERE
    data.my_stuff = 
    (
        SELECT
            MAX(refer.other_needed) AS big_data
        FROM
            named_query refer
    )
    AND
        data.some_field = 
        (
            SELECT
                MIN (field)
            FROM
                other_cte_example
        )
;

