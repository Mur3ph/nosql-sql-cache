-- 1). Display department name and number of employees in the department ? 
DESCRIBE departments;
SELECT * FROM departments;

SELECT d.department_name, COUNT(*) 
FROM employees e NATURAL JOIN departments d 
GROUP BY d.department_name;

SELECT d.department_name, COUNT(*) 
FROM employees e INNER JOIN departments d 
WHERE e.employee_id = d.manager_id
GROUP BY d.department_name;