-- Set Operations

-- UNION

-- UNION ALL

-- MINUS

-- Demonstrate equivalence

(
    SELECT
        cou.course_no,
        cou.description
    FROM
        course cou
    WHERE
        cou.cost = 1095
)
MINUS
(
    SELECT
        cou.course_no,
        cou.description
    FROM
        course cou
    WHERE
        cou.cost = 
        (
            SELECT 
                MIN (co.cost)
            FROM
                course co
        )
)
;

-- INTERSECTS