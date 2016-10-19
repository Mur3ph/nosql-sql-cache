-- 1). Display employees who joined in the month of May ?
SELECT TO_CHAR(HIRE_DATE,'MONTH')  FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'mon') = 'may';

