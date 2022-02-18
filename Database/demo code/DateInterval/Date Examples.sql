-- Base query
SELECT
   prodname AS product_name,
   prodnextshipdate AS next_ship_date
FROM
    product;

-- Use EXTRACT on a DATE!
SELECT
    prodname AS product_name,
    prodnextshipdate AS next_ship_date,
    EXTRACT (MONTH FROM prodnextshipdate) AS month_data
FROM
    product;

-- Using dates in a WHERE clause
-- Before: 10 rows

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
