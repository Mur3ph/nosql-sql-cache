# Oracle Personal Training

##SQL*Plus commands:

1. Connect to Oracle SQL*PLUS threw windows command line type: sqlplus
  * net stop OracleServiceXE
  * net start OracleServiceXE


## SQL Scripts

1. Describe the object in detail (i.e. Columns data types)
'
  * DESC COUNTRIES;
  * DESC DEPARTMENTS;
  * DESC EMPLOYEES;
  * DESC JOB_HISTORY;
  * DESC JOBS;
  * DESC LOCATIONS;
  * DESC REGIONS;
'

2. Show User Indexes
  * 'SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS FROM USER_INDEXES;' 

3. Show All Indexes
  * 'SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME, UNIQUENESS FROM ALL_INDEXES;'

4. Find indexes on a Table, only works on Constraints
  * 'SELECT * FROM user_cons_columns WHERE table_name = 'JOBS';'

  
5. Working with dates:
'
  * SELECT TO_CHAR(HIRE_DATE,'mon')  FROM EMPLOYEES;
  * SELECT TO_CHAR(HIRE_DATE,'month')  FROM EMPLOYEES;
  * SELECT TO_CHAR(HIRE_DATE,'MON')  FROM EMPLOYEES;
  * SELECT TO_CHAR(HIRE_DATE,'MONTH')  FROM EMPLOYEES;
'


## PL/SQL Scripts


## Bash Scripts


## Python Scripts


## Oracle Ports

* Ports: 2483 - 2484


## Sites:

1. [Live SQL Content] (https://livesql.oracle.com/apex/livesql/file/toc.html)
2. 
