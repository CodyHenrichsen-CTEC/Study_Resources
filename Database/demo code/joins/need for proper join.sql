

--Demonstrating the importance of proper ON clause usage!
SELECT
    COUNT(*) AS size_of_query
FROM
    registration reg
JOIN
    assignmentScore aScore
ON
    aScore.studentID = reg.studentID
    AND
    aScore.sectionID = reg.sectionID
;

-- SIZE_OF_QUERY
-- -------------
--        86739

-- vs just none or one
-- Just Student
SELECT
    COUNT(*) AS size_of_query
FROM
    registration reg
JOIN
    assignmentScore aScore
ON
    aScore.studentID = reg.studentID
;

-- SIZE_OF_QUERY
-- -------------
--        992744   

-- Just  section
SELECT
    COUNT(*) AS size_of_query
FROM
    registration reg
JOIN
    assignmentScore aScore
ON
    aScore.sectionID = reg.sectionID
;
-- SIZE_OF_QUERY
-- -------------
--        506740

-- NONE!!!!

SELECT
    COUNT(*) AS size_of_query
FROM
    registration reg,
    assignmentScore aScore
;

-- SIZE_OF_QUERY
-- -------------
--     413594454 
-- DO YOU SEE HOW RIDICULOUS THIS IS!!!! 
-- SCREAMING!!!!!!