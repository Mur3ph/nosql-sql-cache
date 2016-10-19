-- Describe the object in detail (i.e. Columns data types)
DESC COUNTRIES;
DESC DEPARTMENTS;
DESC EMPLOYEES;
DESC JOB_HISTORY;
DESC JOBS;
DESC LOCATIONS;
DESC REGIONS;

-- Show User Indexes
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS 
FROM USER_INDEXES;

-- Show All Indexes
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS 
FROM ALL_INDEXES;

-- Find indexes on a Table, only works on Constraints
SELECT *
FROM user_cons_columns
WHERE table_name = 'JOBS';