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

-- 4). Display employee name and country in which he is working ?
SELECT e.first_name || ' ' || e.last_name, c.country_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
INNER JOIN countries c
ON l.country_id = c.country_id;

SELECT e.first_name || ' ' || e.last_name, c.country_name 
FROM employees e JOIN departments d
USING(department_id) 
JOIN locations l
USING( location_id) 
JOIN countries c
USING (country_id);

-- 5). Display department name, average salary and number of employees with commission within the department ?
SELECT d.department_name, AVG(e.salary) AS average_salary, COUNT(e.commission_pct) AS has_commission
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
--WHERE e.commission_pct IS NOT NULL    -- No need to check for null, as when you use the field in Count, it excludes nulls
GROUP BY d.department_name;

SELECT d.department_name, AVG(e.salary) AS average_salary, COUNT(e.commission_pct) AS has_commission 
FROM departments d JOIN employees e 
USING (department_id) 
GROUP BY d.department_name;

-- 6). Display the month in which more than 5 employees joined in any department located in Sydney ?
SELECT EXTRACT(MONTH FROM e.hire_date) AS month
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE l.city LIKE 'Sydney'
GROUP BY e.hire_date
HAVING COUNT(e.employee_id) > 5;

SELECT TO_CHAR(e.hire_date,'MON-YY') AS month
FROM employees e JOIN departments d USING (department_id) 
JOIN  locations l USING (location_id) 
WHERE  CITY = 'Seattle'
GROUP BY e.hire_date
HAVING COUNT(*) > 5;

-- 7). Display details of departments in which the maximum salary is more than 10000 ?
SELECT d.department_name, d.manager_id, d.location_id
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE j.max_salary > 10000;

SELECT d.department_id, d.department_name, d.manager_id, d.location_id
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name, d.manager_id, d.location_id
HAVING MAX(e.salary) > 10000
ORDER BY d.department_id;

SELECT * FROM departments d WHERE d.department_id IN 
( SELECT e.department_id FROM employees e 
  GROUP BY e.department_id 
  HAVING MAX(e.salary) > 10000)
ORDER BY d.department_id;

-- 8). Display details of departments managed by ‘Smith' ?
SELECT d.department_name, d.manager_id, d.location_id, e.last_name, e.manager_id, e.employee_id
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
WHERE e.last_name LIKE 'Smith'
GROUP BY d.department_name, d.manager_id, d.location_id, e.last_name, e.manager_id, e.employee_id;

SELECT d.department_name, d.manager_id, d.location_id, e.last_name, e.manager_id, e.employee_id
FROM departments d INNER JOIN employees e
ON d.manager_id = e.employee_id
WHERE e.last_name LIKE 'Smith'
GROUP BY d.department_name, d.manager_id, d.location_id, e.last_name, e.manager_id, e.employee_id;

SELECT * FROM departments d WHERE d.manager_id IN 
  ( SELECT e.employee_id 
    FROM employees e 
    WHERE e.first_name = 'Smith');

-- 9). Display jobs into which employees joined in the current year ?

