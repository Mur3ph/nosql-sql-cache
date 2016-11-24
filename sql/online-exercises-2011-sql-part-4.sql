-- 1). Display departments in which more than five employees have commission percentage ?
SELECT department_id, commission_pct
FROM employees;

SELECT department_id
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT department_id, COUNT(employee_id)
FROM employees 
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

SELECT department_id
FROM employees  
WHERE commission_pct IS NOT NULL
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

SELECT department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE commission_pct IS NOT NULL
GROUP BY department_name
HAVING COUNT(employee_id) > 5;

-- 2). Display employee ID for employees who did more than one job in the past ?
SELECT employee_id, job_id
FROM employees
ORDER BY last_name;

SELECT employee_id, first_name, last_name 
FROM employees
GROUP BY employee_id, first_name, last_name 
HAVING COUNT(job_id) > 1
ORDER BY last_name;

SELECT employee_id
FROM employees
WHERE hire_date BETWEEN TO_DATE('1.1.' || 2001, 'DD.MM.YYYY')
AND TO_DATE('1.1.' || 2002, 'DD.MM.YYYY') -- WHERE EXTRACT(YEAR FROM hire_date) = EXTRACT(YEAR FROM SYSDATE)
GROUP BY employee_id
HAVING COUNT(job_id) > 1;

-- Aha! moment.. After all the above I notice the 'JOB_HISTORY' table
SELECT employee_id 
FROM job_history 
GROUP BY employee_id 
HAVING COUNT(*) > 1;

SELECT e.employee_id 
FROM employees e INNER JOIN job_history jh
ON e.employee_id = jh.employee_id
GROUP BY e.employee_id 
HAVING COUNT(e.employee_id) > 1;

-- 3). Display job ID of jobs that were done by more than 3 employees for more than 100 days ?
SELECT job_id, employee_id, start_date, end_date
FROM job_history;

SELECT jh.job_id, jh.employee_id, e.employee_id
FROM job_history jh, employees e;

SELECT (jh.end_date - jh.start_date) AS diff
FROM job_history jh;

SELECT job_id 
FROM job_history
GROUP BY job_id
HAVING COUNT(job_id) > 3;

SELECT job_id 
FROM job_history
WHERE end_date - start_date > 100
GROUP BY job_id
HAVING COUNT(job_id) > 3;

SELECT jh.job_id
FROM job_history jh INNER JOIN employees e
ON jh.employee_id = e.employee_id
WHERE jh.end_date - jh.start_date > 100
GROUP BY jh.job_id
HAVING COUNT(jh.employee_id) > 1;

-- 4). Display department ID, year, and Number of employees joined ?
SELECT department_id, EXTRACT(YEAR FROM hire_date) AS THE_YEAR, COUNT(employee_id) AS NUMBER_OF_EMPLOYEES
FROM employees
GROUP BY department_id, EXTRACT(YEAR FROM hire_date)
ORDER BY THE_YEAR;

SELECT department_id, TO_CHAR(hire_date,'YYYY'), COUNT(employee_id) 
FROM EMPLOYEES 
GROUP BY department_id, TO_CHAR(hire_date, 'YYYY')
ORDER BY department_id;

-- 5). Display departments where any manager is managing more than 5 employees ?
SELECT department_id, manager_id, employee_id
FROM employees;

SELECT department_id, manager_id
FROM employees
GROUP BY department_id, manager_id
HAVING COUNT(employee_id) > 5
ORDER BY department_id;

SELECT DISTINCT department_id
FROM employees
GROUP BY department_id, manager_id 
HAVING COUNT(employee_id) > 5;

SELECT e.department_id, e.manager_id, COUNT(e.employee_id)
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY e.manager_id, e.department_id
HAVING COUNT(e.employee_id) > 5
ORDER BY e.department_id;

