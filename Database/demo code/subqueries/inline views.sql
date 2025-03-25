SELECT
    sub.field_name
FROM
    (
        SELECT
            named_column AS field_name,
            primary_id AS other
        FROM
            rando_table
    ) sub
WHERE
    sub.other > 123
;

-- In the FROM clause for TOP N results

SELECT
    top_n.section,
    top_n.section_count
FROM
    (
        SELECT
            reg.sectionID AS section,
            COUNT(*) as section_count
        FROM
            registration reg
        GROUP BY
            reg.sectionID
        ORDER BY
            section_count DESC
    ) top_n
WHERE
    ROWNUM < 10
;

-- In a JOIN clause

SELECT
    reg.sectionID AS rando_sections
FROM
    registration reg
JOIN
    (
        SELECT
            stu.studentID, -- PK/FK Relationship
            stu.firstName,
            stu.lastName
        FROM
            students stu
        WHERE
            stu.phone LIKE '%77%'
    ) certain
ON
    certain.studentID = reg.studentID;
