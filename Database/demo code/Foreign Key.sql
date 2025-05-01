ALTER TABLE
    table_name
ADD CONSTRAINT
    fk_referencing_table_source_table
FOREIGN KEY
    (field_name_in_parens)
REFERENCES
    other_table_name (primary_key)
;

ALTER TABLE
    table_name
ADD CONSTRAINT
    fk_referencing_table_source_table
FOREIGN KEY
    (field_name_in_parens)
REFERENCES
    other_table_name (primary_key)
-- Optional Triggers:
-- ON DELETE [NO ACTION / CASCADE / SET NULL]
;

CREATE TABLE sales
(
    sales_id PRIMARY KEY,
    export_id NUMBER(5,0) NOT NULL,
    description VARCHAR2(100)
    -- Other fields not shown
);

CREATE TABLE exporters
(
    id PRIMARY KEY,
    export_destination_code NUMBER(5,0) NOT NULL
    -- Other fields not shown
);

ALTER TABLE
    sales
ADD CONSTRAINT
    fk_exporters_sales
FOREIGN KEY
    (export_id)
REFERENCES
    exporters (export_destination_code)
;

