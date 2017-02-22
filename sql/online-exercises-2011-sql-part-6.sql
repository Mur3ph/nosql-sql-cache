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
