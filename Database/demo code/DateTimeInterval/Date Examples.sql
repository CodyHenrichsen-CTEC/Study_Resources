-- Base query
SELECT
   prodname AS product_name,
   prodNextShipDate AS next_ship_date
FROM
    product
;

SELECT
    student_id,
    section_id,
    enroll_date
FROM
    enrollment
;

-- Use EXTRACT on a DATE!
SELECT
    prodname AS product_name,
    prodNextShipDate AS next_ship_date,
    EXTRACT (MONTH FROM prodNextShipDate) AS month_data
FROM
    product
;

SELECT
    student_id,
    section_id,
    EXTRACT (MONTH FROM enroll_date) AS month_enrolled
FROM
    enrollment
ORDER BY
    month_enrolled DESC
;

SELECT
    student_id,
    section_id,
    EXTRACT (MONTH FROM enroll_date) AS month_enrolled
FROM
    enrollment
WHERE
    EXTRACT (MONTH FROM enroll_date) = 1
;


-- Using dates in a WHERE clause
-- Before: 10 rows

-- After 
-- Using EXTRACT in the WHERE
SELECT
    prodname AS product_name,
    prodNextShipDate AS next_ship_date
FROM
    product
WHERE
    EXTRACT (MONTH FROM prodNextShipDate) = 2;



-- using WHERE: To find days or years with 07
SELECT
    prodName AS product_name,
    prodNextShipDate AS next_ship_date
FROM
    product
WHERE
    TO_CHAR(prodNextShipDate, 'DD-YY') LIKE '%07%';
;


SELECT
    section_id AS class,
    start_date_time AS raw_date
FROM
    section
WHERE
    TO_CHAR (start_date_time, 'MI') LIKE '%5%'
    OR
    TO_CHAR (start_date_time, 'HH') LIKE '%1%'
;

-- Using WHERE: To find February as the month
SELECT
    prodname AS product_name,
    prodNextShipDate AS next_ship_date
FROM
    product
WHERE
    TO_CHAR(prodNextShipDate, 'MON') = 'FEB';

-- Evaluate a date as text
SELECT
    prodname AS product_name,
    prodNextShipDate AS next_ship_date
FROM
    product
WHERE
    INSTR(prodNextShipDate ,'JAN') > 0;


SELECT
    student_id,
    section_id
FROM
    enrollment
WHERE
    INSTR (enroll_date, 'FEB') > 0
;

-- But if looking at the masked data nopers
SELECT
    prodname AS product_name,
    prodNextShipDate AS next_ship_date
FROM
    product
WHERE
    INSTR(TO_CHAR(prodNextShipDate, 'DD/MM/YYYY') ,'JAN') > 0; -- only sees month in numeric values!

SELECT
    student_id,
    section_id
FROM
    enrollment
WHERE
    INSTR (TO_CHAR(enroll_date, 'DD-MM-YYYY'), 'FEB') > 0
;

-- Can't just mismatch date components

SELECT
    TO_DATE('April Thursday','Month Day') AS text
FROM
    dual
;

-- Error report -
-- ORA-01835: day of week conflicts with Julian date
