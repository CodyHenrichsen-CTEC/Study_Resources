-- DCL Demo Code
-- Please note that your user and role on the Oracle™ server instance must provide access to these commands.
-- Most DB developers and/or users DO NOT have access to this level of access. 

-- CREATE ROLE

CREATE ROLE
    administrati; -- Does not fit the COMMON_USER_PREFIX and will not result in a created role.

CREATE ROLE
    C##_administrati; -- Matches the default COMMON_USER_PREFIX and creates a role with ZERO permissions

CREATE ROLE
    C##_cs_students; -- Matches the default COMMON_USER_PREFIX and creates a role with ZERO permissions

-- CREATE USER

CREATE USER
    C##_user_name -- Note the use of the COMMON_USER_PREFIX
IDENTIFIED BY
    password_text -- CLEARTEXT!!
PASSWORD EXPIRE; -- Forces user to make a new password to login

CREATE USER
    C##_database_student -- Note the use of the COMMON_USER_PREFIX
IDENTIFIED BY
    12345 -- CLEARTEXT!!
PASSWORD EXPIRE; -- Forces user to make a new password to login

-- Privileges

-- GRANT
-- Permission to ROLE
GRANT SELECT ON
    table_name
TO
   C##_cs_students; 

-- More realistic GRANT statement
GRANT INSERT, UPDATE, DELETE ON
    table_name
TO
   C##_cs_students; 

-- GRANTing ROLE to USER
GRANT
    C##_cs_students
TO  
    C##_database_student;

GRANT
    C##_administrati
TO  
    C##_database_student;

-- REVOKE

-- REVOKE privilege FROM ROLE
REVOKE INSERT ON
    all_grades
FROM
    C##_cs_students;

-- REVOKE ROLE FROM USER
REVOKE 
    C##_administrati
FROM  
    C##_database_student;