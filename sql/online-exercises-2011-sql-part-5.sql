-- 1). Display department name and number of employees in the department ? 
DESCRIBE departments;
SELECT * FROM departments;

SELECT d.department_name, COUNT(*) AS num_of_employees
FROM employees e NATURAL JOIN departments d 
GROUP BY d.department_name;

SELECT d.department_name, COUNT(e.employee_id) AS num_of_employees
FROM employees e NATURAL JOIN departments d 
GROUP BY d.department_name;

SELECT d.department_name, COUNT(e.employee_id) AS num_of_employees
FROM employees e INNER JOIN departments d 
ON e.manager_id = d.manager_id
GROUP BY d.department_name;

SELECT d.department_name, COUNT(e.employee_id) AS num_of_employees
FROM employees e INNER JOIN departments d 
ON e.employee_id = d.manager_id
GROUP BY d.department_name;

-- 2). Display job title, employee ID, number of days between ending date and starting date for all jobs in department 30 from job history ?
SELECT * FROM job_history;

SELECT j.job_title, jh.employee_id, EXTRACT(DAY FROM jh.end_date - EXTRACT(DAY FROM jh.start_date)) AS num_of_days
FROM jobs j INNER JOIN job_history jh
ON jh.job_id = j.job_id
WHERE department_id = 30;

SELECT employee_id, job_title, end_date-start_date DAYS 
FROM job_history NATURAL JOIN jobs 
WHERE department_id=30;

-- 3). Display department name and manager first name ?
SELECT * FROM departments;

SELECT d.department_name, e.first_name
FROM departments d, employees e
WHERE d.manager_id = e.employee_id;

SELECT d.department_name, e.first_name 
FROM departments d INNER JOIN employees e 
ON d.manager_id = e.employee_id;

-- 4). Display department name, manager name, and city ?
SELECT d.department_name, e.first_name || ' ' || e.last_name AS manager, l.city 
FROM departments d INNER JOIN employees e 
ON d.manager_id = e.employee_id
INNER JOIN locations l
ON d.location_id = l.location_id;

SELECT d.department_name, e.first_name || ' ' || e.last_name AS manager, l.city 
FROM departments d INNER JOIN employees e 
ON (d.manager_id = e.employee_id) 
INNER JOIN locations l 
USING (location_id);

-- 5). Display country name, city, and department name ?
SELECT c.country_name, l.city, d.department_name
FROM departments d INNER JOIN locations l
ON d.location_id = l.location_id
INNER JOIN countries c
ON l.country_id = c.country_id;

SELECT c.country_name, l.city, d.department_name 
FROM countries c JOIN locations l
USING (country_id) 
JOIN departments d
USING (location_id);

-- 6). Display job title, department name, employee last name, starting date for all jobs from 2000 to 2005 ?











