
-- Can't just dump random crap into the TO_CHAR function
SELECT
    TO_CHAR(SYSDATE, 'MM/DD/YYYY Day' || ' the ' || 'DDspth' || ' of ' || 'Month, YYYY') AS bizarre_request
FROM
    dual;

-- Note that the ridiculous query length can be split over multiple lines to make it much easier to read
SELECT
    TO_CHAR(SYSDATE, 'MM/DD/YYYY Day' ) || ' the '  
    || TO_CHAR(SYSDATE, 'DDspth') || ' of ' 
    || TO_CHAR(SYSDATE, 'Month, YYYY') AS overdone_but_valid
FROM
    dual;