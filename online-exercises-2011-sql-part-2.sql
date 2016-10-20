-- 1). Display employees who joined in the month of May ?
SELECT TO_CHAR(HIRE_DATE,'MONTH') AS Hire_Date_Month  FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'mon') = 'may';

-- 2). Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department is 30 ?
DESC EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, SALARY, COMMISSION_PCT, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL
AND SALARY BETWEEN 5000 AND 10000
AND DEPARTMENT_ID = 30;

-- 3). Display first name and date of first salary of the employees ?

