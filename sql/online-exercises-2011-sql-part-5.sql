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
