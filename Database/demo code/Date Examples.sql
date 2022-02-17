-- Use EXTRACT on a DATE!

SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date,
    EXTRACT (MONTH FROM prodnextshipdate) AS month_data
FROM
    product;

-- Using dates in a WHERE clause
-- Before: 10 rows
SELECT
   prodname AS product_name,
   prodnextshipdate AS next_ship_date
FROM
    product;
-- After 
-- Using EXTRACT in the WHERE
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date
FROM
    product
WHERE
    EXTRACT (MONTH FROM prodnextshipdate) = 2;



-- using WHERE: To find days or years with 07
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date
FROM
    product
WHERE
    TO_CHAR(prodnextshipdate, 'DD-YY') LIKE '%07%';

-- Using WHERE: To find February as the month
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date
FROM
    product
WHERE
    TO_CHAR(prodnextshipdate, 'MON') = 'FEB';

-- Evaluate a date as text
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date
FROM
    product
WHERE
    INSTR(prodnextshipdate ,'JAN') > 0;

-- But if looking at the masked data nopers
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date
FROM
    product
WHERE
    INSTR(TO_CHAR(prodnextshipdate, 'DD/MM/YYYY') ,'JAN') > 0; -- only sees month in numeric values!

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

-- Using the INTERVAL data types in Oracle

-- Intervals interact with dates

-- Lets take too much effort to add time!
SELECT
    EXTRACT (MONTH FROM TO_YMINTERVAL('3-05')) AS month_info,
    ADD_MONTHS(SYSDATE, EXTRACT (MONTH FROM TO_YMINTERVAL('3-05'))) AS date_interval_manip
FROM
    dual;

--     
SELECT
    'Cody' AS name,
    TO_CHAR(TO_DATE('06-19-1995','MM-DD-YYYY'), 'fmMonth fmDdspth, Year') AS special_day,    
    TO_CHAR(SYSDATE - TO_YMINTERVAL('5-11'), 'DD MM YYYY') || ' was almost six years ago!' AS interval_demo,
    TO_CHAR(TO_DATE('09-30-4321','MM-DD-YYYY'), 'Day Month Year') || ' is not right now lol' AS demo_two
FROM
    dual;

SELECT
    ADD_MONTHS(SYSDATE, -4) AS backward,
    TO_CHAR(SYSDATE - TO_YMINTERVAL('0-4'), 'DD MM YYYY') || ' was four months ago!' AS interval_demo,
    TO_CHAR(SYSDATE + TO_DSINTERVAL('3 4:45:32'), 'DD MM YYYY') || ' is three days and a few hours from now!' AS interval_demo_two
FROM
    dual;
-- note the requirement of contiguous time
--error version
SELECT
    EXTRACT (DAY FROM INTERVAL '3:2' DAY TO SECOND) AS error_version
FROM
    dual;

--corect version
SELECT
    EXTRACT (DAY FROM INTERVAL '03 02:45:21' DAY TO SECOND) AS corrected_version
FROM
    dual;


-- Using the OVERLAPS command
-- Base query
SELECT
   ordname AS customer_name,
   TO_CHAR(orddate, 'DD Day') AS date_day 
FROM
    ordertbl;
-- Limit results to those that overlap
SELECT
   ordname AS customer_name,
   TO_CHAR(orddate, 'DD Day') AS date_day 
FROM
    ordertbl
WHERE
    (orddate, orddate) 
    OVERLAPS 
    (TO_DATE('10/01/2007','DD/MM/YYYY'), TO_YMINTERVAL('0-1'))
;