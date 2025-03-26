WITH demo (field, field_two) AS -- Alias Field list enclosed in parens
(
    SELECT -- The Anchor Query
        field,
        field_two
    FROM
        data_source
    
    UNION ALL

    SELECT  -- The recursive query
        field,
        field_two
    FROM 
        demo
    WHERE
        field = 'tested'  -- The logic to END recursive queries - NOTE this is FAKE!!
)
SELECT
    *
FROM
    demo
;


WITH demo (num) AS
(
    SELECT  -- Anchor Query
        10
    FROM
        dual
    
    UNION ALL

    SELECT -- Recursive Query
        num - 1 AS total
    FROM
        demo
    WHERE
        num > 0
)
SELECT
    * 
FROM
    demo
;