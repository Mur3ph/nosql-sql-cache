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

