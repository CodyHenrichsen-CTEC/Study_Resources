INSERT INTO products
(
	unit_price,
	product_name,
	product_id
)
VALUES
(
	6.32,
	'yam',
	42
);


INSERT INTO product
(
	prodNO,
	prodName,
	prodMFG,
	prodPrice
)
VALUES
(
	'P12345',
	'Portable hole',
	'ACME corp.',
	123.10
);


INSERT INTO zipcode
(
    city,
    state,
    zip,
    created_by,
    modified_by,
    modified_date,
    created_date
)
VALUES
(
    'SLC',
    'UT',
    '84118',
    'Cody Henrichsen',
    'Mr. H',
    SYSDATE,
    SYSDATE
);
   
INSERT INTO student
(
	student_id,
	salutation,
	first_name,
	last_name,
	street_address,
	zip,
	phone,
	employer,
	registration_date,
	created_by,
	created_date,
	modified_by,
	modified_date
)
VALUES	
(
	999,
	'Mx',
	'Quax',
	'Quackers',
	'987 Database Ln',
	'84119',
	'987.654.3210',
	'CTEC',
	SYSDATE,
	'database students',
	SYSDATE - 120,
	'mr h',
	SYSDATE + 123
);

-- Insert MANY demo

INSERT INTO sales (sales_id, export_id, sales_date) 
WITH demo AS
(
  SELECT 99, 3, TO_DATE('2021-02-18', 'YYYY-MM-DD') FROM dual UNION ALL
  SELECT 98, 4, TO_DATE('2021-02-10 13:03', 'YYYY-MM-DD MI:HH') FROM dual UNION ALL
  SELECT 97, 1, TO_DATE('2021-01-12 13:10', 'YYYY-MM-DD MI:HH') FROM dual UNION ALL
  SELECT 96, 12, TO_DATE('2021-01-10 13:22', 'YYYY-MM-DD MI:HH24') FROM dual

)
SELECT
  *
FROM
  demo;

INSERT INTO customer
(
	custNO,
	custFirstName,
	custLastName,
	custBal
)
WITH customers_demo AS
(
	SELECT
		'Cust 1',
		'First',
		'Last',
		123.45
	FROM
		dual
	UNION ALL
	SELECT 'cust 2', 'first 2', 'last 2', 0 FROM dual UNION ALL
	SELECT 'sda', 'as', 'asdasdasd', 123454 FROM dual
)
SELECT
	*
FROM
	customers_demo
;


INSERT INTO zipcode
(
    city,
    state,
    zip,
    created_by,
    modified_by,
    modified_date,
    created_date
)
WITH mega_insert AS 
(
	SELECT  	
		'Sandy', 
		'UT',
		'84070', 
		'Cody', 
		'We', 
		SYSDATE, 
		SYSDATE + 1 
	FROM 
		dual 
	UNION ALL
	SELECT 'Cottonwood Heights', 'UT', '84121', 'Cody', 'They', SYSDATE - 12, SYSDATE + 6 FROM dual UNION ALL
	SELECT 'Draper', 'UT', '84020', 'Them', 'Cody', SYSDATE - 123, SYSDATE + 23 FROM dual UNION ALL
	SELECT 'Midvale', 'UT', '84047', 'Cody', 'Me', SYSDATE - 4, SYSDATE + 3 FROM dual UNION ALL
	SELECT 'Salt Lake County', 'UT', '84096', 'You', 'Her', SYSDATE - 6, SYSDATE + 5 FROM dual UNION ALL
	SELECT 'Salt Lake City', 'UT', '84020', 'Cody', 'She', SYSDATE - 431, SYSDATE + 100 FROM dual 
)
SELECT 
	*
FROM
	mega_insert;

-- ambiguous column error

WITH demo AS
(
    SELECT 'a',    'a',  SYSDATE, SYSDATE FROM dual UNION ALL
    SELECT 'a',   '',    SYSDATE, SYSDATE FROM DUAL UNION ALL
    SELECT 'car', 'bat', SYSDATE, SYSDATE FROM DUAL
)
SELECT
    *
FROM
    demo;

   
--solution

WITH demo AS
(
    SELECT 'a' AS first,    'a' AS next ,  SYSDATE AS other_col, SYSDATE AS last_col FROM dual UNION ALL
    SELECT 'a',   '',    SYSDATE, SYSDATE FROM DUAL UNION ALL
    SELECT 'car', 'bat', SYSDATE, SYSDATE FROM DUAL
)
SELECT
    *
FROM
    demo;
   
-- Update examples

UPDATE
	table_name
SET
	some_field = value,
	other_fields = values_as_needed
WHERE
	table_name.field relational/equality_operator other_value;
	

UPDATE 
	zipcode
SET
	city = 'Kearns';

UPDATE
	product
SET
	prodName = 'bluetooth speaker'
;

ROLLBACK;

UPDATE
	product
SET
	prodName = 'bluetooth speaker',
	prodQOH = 100
WHERE
	prodNO = '234'
;


ROLLBACK;

UPDATE 
	zipcode
SET
	city = 'Kearns'
WHERE
	zip = '84118';

UPDATE 
	zipcode
SET
	city = 'unincorporated SL county',
	state = 'ut'
WHERE
	zip = '84118';


-- DELETE Demos

DELETE FROM
	table_name;

DELETE FROM
	table_name
WHERE
	some_condition_or_conditions!!!;


DELETE FROM
	zipcode

ROLLBACK; --!!!!!

DELETE FROM
	product
;
-- error - FK violation

DELETE FROM
	ordLine;
DELETE FROM
	product;

DELETE FROM
	zipcode
WHERE
	zip LIKE '840%'

-- DELETE Demos

DELETE FROM
	table_name;

DELETE FROM
	table_name
WHERE
	some_condition_or_conditions!!!;

SAVEPOINT updates_finished;


SELECT 
    * 
FROM 
    grade_conversion;

DELETE FROM
	grade_conversion;

SELECT 
    * 
FROM 
    grade_conversion;

ROLLBACK TO updates_finished; --!!!!!

DELETE FROM
	grade_conversion
WHERE
	max_grade LIKE '8_';
    
ROLLBACK TO updates_finished; --!!!!!

SELECT 
    * 
FROM 
    grade_conversion;

SELECT
    *
FROM
    zipcode
WHERE
    zip LIKE '84%'

DELETE FROM
	zipcode
WHERE
	zip LIKE '84%';

SELECT
    *
FROM
    zipcode
WHERE
    zip LIKE '840%';
    
ROLLBACK TO updates_finished; --!!!!!

SELECT
    *
FROM
    zipcode
WHERE
    zip LIKE '84%';

COMMIT;



