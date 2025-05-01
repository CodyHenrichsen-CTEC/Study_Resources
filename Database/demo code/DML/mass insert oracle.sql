-- Structure

INSERT INTO
    table_name (fields, separated, by, commas)
WITH cte_example AS
(
    SELECT 123, 'some value', 3.1415 FROM dual UNION ALL
    SELECT 987, '', 0.0001 FROM dual
)
SELECT
    *
FROM
    cte_example
;

-- Example
-- Note the use of tabs to verify all fields are properly aligned to values!
INSERT INTO
    students (firstName,    lastName,       studentID, streetAddress,   city,           state,          zip,        phone,          admissionDate)
WITH student_inserts AS
(
    SELECT 'example'        ,'student'      , 0     , 'nowhere'         , 'na'          , '??'          , '-999'    , '1234561234'  , TO_DATE('05/01/2025','DD/MM/YYYY') FROM dual UNION ALL
    SELECT 'example_two'    ,'student????'  , 1     , 'here'            , 'na'          , '??'          , '-999'    , '1234561234'  , TO_DATE('05/01/2025','DD/MM/YYYY') FROM dual UNION ALL
    SELECT 'example three'  ,'student name' , 2     , 'there'           , 'na'          , '??'          , '-999'    , '1234561234'  , TO_DATE('05/01/2025','DD/MM/YYYY') FROM dual UNION ALL
    SELECT 'example 4'      ,'last name'    , 13    , '123 some street' , 'some city'   , 'state name'  , '001213'  , '3456780987'  , TO_DATE('05/01/2025','DD/MM/YYYY') FROM dual
)
SELECT  
    *
FROM
    student_inserts
;