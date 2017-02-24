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

-- 3). Display employee name, job title for the jobs employee did in the past where the job was done less than six months ? 
SELECT e.first_name || ' ' || e.last_name AS fullname, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.first_name || ' ' || e.last_name AS fullname, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
INNER JOIN job_history h
ON j.job_id = h.job_id
WHERE (h.end_date - h.start_date) / 12 < 6;

SELECT e.first_name || ' ' || e.last_name AS fullname, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
INNER JOIN job_history h
ON j.job_id = h.job_id
WHERE MONTHS_BETWEEN(h.end_date, h.start_date) < 6;

SELECT e.first_name || ' ' || e.last_name AS fullname, j.job_title
FROM employees e INNER JOIN job_history h 
ON e.employee_id = h.employee_id
INNER JOIN jobs j  
ON h.job_id = j.job_id
WHERE MONTHS_BETWEEN(h.end_date, h.start_date) < 6;
