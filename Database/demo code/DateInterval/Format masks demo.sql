
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

SELECT
    TO_CHAR(SYSDATE, 'MM/DD/YYYY Day' ) || ' the '  
    || TO_CHAR(SYSDATE, 'Ddspth') || ' of ' 
    || TO_CHAR(SYSDATE, 'Month, YYYY') AS overdone_but_valid
FROM
    dual;

SELECT
    TO_CHAR(SYSDATE, 'MM/DD/YYYY Day' ) || ' the '  
    || TO_CHAR(SYSDATE, 'ddspth') || ' of ' 
    || TO_CHAR(SYSDATE, 'Month, YYYY') AS overdone_but_valid
FROM
    dual;

SELECT
    TO_CHAR(SYSDATE, 'MM/DD/YYYY fmDay' ) || ' the '  
    || TO_CHAR(SYSDATE, 'ddspth') || ' of ' 
    || TO_CHAR(SYSDATE, 'fmMonth, YYYY') AS overdone_but_valid
FROM
    dual;

-- Twosday query
SELECT
    TO_CHAR(TO_DATE('02/02/2022', 'DD/MM/YYYY'), 'Day, DD/MM/YYYY') AS almost_twos_day,
    TO_CHAR(TO_DATE('22/02/2022', 'DD/MM/YYYY'), 'Day, DD/MM/YYYY') AS twos_day,
    TO_CHAR(TO_DATE('02/02/2222', 'DD/MM/YYYY'), 'Day, DD/MM/YYYY') AS twos_day_next,
    TO_CHAR(TO_DATE('22/02/2222', 'DD/MM/YYYY'), 'Day, DD/MM/YYYY') AS twos_day_after
FROM
    dual;
    

