-- Demonstrating how to use the numeric format masks for decimal information

SELECT
    3 AS some_integer,
    3.10 AS simple_decimal,
    ( 22 / 7 ) AS ratio,
    TO_CHAR(03, '99.9') AS basic,
    TO_CHAR(03.0, '00.0') AS basic_two,
    TO_CHAR(3.1, '99.000') AS basic_three,
    TO_CHAR(3.100, '99.99') AS basic_four,
    TO_CHAR(3.1, '99.99900') AS even_more_detail
FROM
    dual
;


-- SOME_INTEGER SIMPLE_DECIMAL      RATIO BASIC BASIC BASIC_T BASIC_ EVEN_MORE
-- ------------ -------------- ---------- ----- ----- ------- ------ ---------
--           3            3.1 3.14285714   3.0  03.0   3.100   3.10   3.10000

SELECT
    TO_CHAR(1234567895, '999,999,999') AS format_example,
    TO_CHAR(1234999999999999567895, '999,999,999') AS other_example,
    TO_CHAR(1234895, '999,999,999') AS real_example
FROM
    dual
;

-- FORMAT_EXAMP OTHER_EXAMPL REAL_EXAMPLE
-- ------------ ------------ ------------
-- ############ ############    1,234,895


