-- Set Operations

-- UNION

SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
WHERE
    stu.first_name LIKE 'K%'

UNION

SELECT
    ins.first_name,
    ins.last_name
FROM
    instructor ins
WHERE
    ins.last_name LIKE 'G%'
;


-- UNION ALL

SELECT
    stu.first_name,
    stu.last_name
FROM
    student stu
WHERE
    stu.first_name LIKE 'K%'
    
UNION ALL

SELECT
    ins.first_name,
    ins.last_name
FROM
    instructor ins
WHERE
    ins.last_name LIKE 'W%'
;

-- MINUS

SELECT
    stu.last_name
FROM
    student stu
    
MINUS

SELECT
    ins.last_name
FROM
    instructor ins
;


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


(
    SELECT 
        stu.student_id
    FROM
        student stu
    
    MINUS
    
    SELECT DISTINCT
        enr.student_id
    FROM
        enrollment enr
)

MINUS 
(

    SELECT
        stu.student_id
    FROM
        student stu
    WHERE
        NOT EXISTS
        (
            SELECT
                'X'
            FROM
                enrollment enr
            WHERE
                enr.student_id = stu.student_id
        )
    
)
;

-- INTERSECTS