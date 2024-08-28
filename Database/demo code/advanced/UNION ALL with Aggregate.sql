-- Using UNION ALL in a subquery for an aggregate based query. 

SELECT
    names.name,
    COUNT(*) as popularity
FROM
(
    SELECT
        stu.firstName AS name
    FROM
        students stu

    UNION ALL

    SELECT
        prof.firstName
    FROM
        professors prof
) names
GROUP BY
    names.name
ORDER BY
    popularity
;