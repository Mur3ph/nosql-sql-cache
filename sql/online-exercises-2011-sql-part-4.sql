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



