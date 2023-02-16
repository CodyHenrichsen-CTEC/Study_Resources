-- Using the INTERVAL data types in Oracle
-- Intervals can interact with dates

-- Lets take too much effort to add time!
SELECT
    EXTRACT (MONTH FROM TO_YMINTERVAL('3-05')) AS month_info,
    ADD_MONTHS(SYSDATE, EXTRACT (MONTH FROM TO_YMINTERVAL('3-05'))) AS date_interval_manip
FROM
    dual;

-- Better use of combining DATE and INTERVAL    
SELECT
    'Cody' AS name,
    TO_CHAR(TO_DATE('06-19-1995','MM-DD-YYYY'), 'fmMonth fmDdspth, Year') AS special_day,    
    TO_CHAR(SYSDATE - TO_YMINTERVAL('5-11'), 'DD MM YYYY') || ' was almost six years ago!' AS interval_demo,
    TO_CHAR(TO_DATE('09-30-4321','MM-DD-YYYY'), 'Day Month Year') || ' is not right now lol' AS demo_two
FROM
    dual;
-- note the requirement of contiguous time
SELECT
    ADD_MONTHS(SYSDATE, -4) AS backward,
    TO_CHAR(SYSDATE - TO_YMINTERVAL('0-4'), 'DD MM YYYY') || ' was four months ago!' AS interval_demo,
    TO_CHAR(SYSDATE + TO_DSINTERVAL('3 4:45:32'), 'DD MM YYYY') || ' is three days and a few hours from now!' AS interval_demo_two
FROM
    dual;


--error version
SELECT
    EXTRACT (DAY FROM INTERVAL '3:2' DAY TO SECOND) AS error_version
FROM
    dual;

--correct version
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
    (TO_DATE('10/01/2007','DD/MM/YYYY'), TO_YMINTERVAL('0-1'));