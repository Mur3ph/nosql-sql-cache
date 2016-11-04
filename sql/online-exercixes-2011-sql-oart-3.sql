-- 1). Display the number of days between system date and 1st January 2011 ? 
SELECT EXTRACT(DAY FROM (SYSDATE - CAST(TO_DATE('1.1.' || 2011, 'DD.MM.YYYY') AS TIMESTAMP ))) AS DAYS_BETWEEN_TWO_DATES FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE - CAST(DATE '2011-01-01' AS TIMESTAMP)) AS DAYS_BETWEEN_TWO_DATES FROM DUAL;
SELECT SYSDATE - to_date('01-jan-2011') AS DAYS_BETWEEN_TWO_DATES FROM DUAL;

-- 2). Display how many employees joined in each month of the current year ?


-- 3). Display manager ID and number of employees managed by the manager ?


-- 4). Display employee ID and the date on which he ended his previous job ? 
SELECT EMPLOYEE_ID, END_DATE 
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID, MAX(END_DATE) 
FROM JOB_HISTORY 
GROUP BY EMPLOYEE_ID;

SELECT e.EMPLOYEE_ID, MAX(jh.END_DATE) AS END_DATE_OF_PREVIOUS_JOB
FROM EMPLOYEES e
INNER JOIN JOB_HISTORY jh
ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
GROUP BY e.EMPLOYEE_ID;
