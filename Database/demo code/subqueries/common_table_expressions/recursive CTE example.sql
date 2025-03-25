WITH demo (field, field_two) AS -- Alias Field list enclosed in parens
(
    SELECT -- The 
        field,
        field_two
    FROM
        data_source
    
    UNION ALL

    SELECT
        field,
        field_two
    FROM 
        demo
    WHERE
        field = 'tested'
)
SELECT
    *
FROM
    demo
;


WITH demo (num) AS
(
    SELECT
        1
    FROM
        dual
    UNION ALL

    SELECT
        num + 1 AS total
    FROM
        demo
    WHERE
        num < 10
)
SELECT
    * 
FROM
    demo
;