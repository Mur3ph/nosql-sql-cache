-- 1). Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years ?
SELECT d.department_name, e.first_name || ' ' || e.last_name, e.salary, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date) AS experience
FROM departments d INNER JOIN employees e
ON d.manager_id = e.employee_id
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date) > 5;

SELECT d.department_name, e.first_name || ' ' || e.last_name, e.salary, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date) AS experience
FROM departments d INNER JOIN employees e
ON d.manager_id = e.manager_id
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date) > 5;

SELECT d.department_name, e.first_name || ' ' || e.last_name, e.salary, (SYSDATE - e.hire_date) / 365 AS experience
FROM departments d INNER JOIN employees e 
ON d.manager_id = e.manager_id 
WHERE (SYSDATE - e.hire_date) / 365 > 5;

-- 2). Display employee name if the employee joined before his manager ?
SELECT e.first_name || ' ' || e.last_name AS employee_name, e.hire_date AS employee, m.hire_date AS manager, e.manager_id, m.manager_id, m.first_name || ' ' || m.last_name AS manager_name
FROM employees e INNER JOIN employees m
ON e.employee_id = m.manager_id
WHERE e.hire_date < m.hire_date;

SELECT e.first_name || ' ' || e.last_name AS fullname
FROM employees e INNER JOIN employees m
ON e.employee_id = m.manager_id
WHERE e.hire_date < m.hire_date;
