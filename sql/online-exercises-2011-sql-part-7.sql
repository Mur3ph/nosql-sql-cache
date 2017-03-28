-- Useful commands
SELECT Q'[Paddy O'Reilly]' FROM DUAL;
SELECT Q'$Paddy O'Reilly$' FROM DUAL;

-- 1). Display job title and average salary for employees who did a job in the past ?
SELECT j.job_title, ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e, jobs j
WHERE e.employee_id IN
    (   
        SELECT jh.employee_id
        FROM job_history jh
    )
GROUP BY j.job_title;

SELECT j.job_title, ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.employee_id IN
    (   
        SELECT jh.employee_id
        FROM job_history jh
    )
GROUP BY j.job_title;

-- 2). Display country name, city, and number of departments where department has more than 5 employees ?
SELECT c.country_name, l.city
FROM countries c INNER JOIN locations l
ON c.country_id = l.country_id;

SELECT c.country_name, l.city, COUNT(d.department_id)
FROM countries c INNER JOIN locations l
ON c.country_id = l.country_id
INNER JOIN departments d
ON l.location_id = d.location_id
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY c.country_name, l.city
HAVING COUNT(e.employee_id) > 5;

SELECT c.country_name, l.city, COUNT(d.department_id)
FROM countries c INNER JOIN locations l
USING (country_id) 
INNER JOIN departments d
USING (location_id) 
WHERE department_id IN 
    (
        SELECT e.department_id 
        FROM employees e
        GROUP BY e.department_id 
        HAVING COUNT(e.employee_id) > 5
        --HAVING COUNT(e.department_id) > 5
     )
GROUP BY c.country_name, l.city;

-- 3). Display details of manager who manages more than 5 employees ?
SELECT e1.first_name || ' ' || e1.last_name
FROM employees e1 INNER JOIN employees e2
ON e1.employee_id = e2.manager_id
GROUP BY e1.first_name, e1.last_name
HAVING COUNT(e1.employee_id) > 5;

SELECT first_name || ' ' || last_name 
FROM employees 
WHERE employee_id IN 
    (
        SELECT manager_id 
        FROM employees 
        GROUP BY manager_id 
        HAVING COUNT(*) > 5
    );

-- 4). Display employee name, job title, start date, and end date of past jobs of all employees with commission percentage null ?
SELECT e.first_name || ' ' || e.last_name AS Fullname, j.job_title, jh.start_date, jh.end_date
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
INNER JOIN job_history jh
ON e.employee_id = jh.employee_id
WHERE e.commission_pct IS NULL,
ORDER BY Fullname;

SELECT e.first_name || ' ' || e.last_name AS Fullname, j.job_title, jh.start_date, jh.end_date
FROM job_history jh INNER JOIN jobs j 
USING (job_id) 
INNER JOIN employees e  
ON ( jh.employee_id = e.employee_id)
WHERE e.commission_pct IS NULL
ORDER BY Fullname;

-- 5). Display the departments into which no employee joined in last two years ?
SELECT d.department_id, d.department_name, d.manager_id, d.location_id
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
WHERE (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date)) < 2;

SELECT d.department_id, d.department_name, d.manager_id, d.location_id
FROM departments d
WHERE d.department_id NOT IN 
    ( 
        SELECT e.department_id 
        FROM employees e 
        WHERE (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM e.hire_date)) < 2
    );

SELECT  * 
FROM departments d
WHERE d.department_id NOT IN 
    ( 
        SELECT e.department_id 
        FROM employees e 
        WHERE FLOOR((SYSDATE-e.hire_date)/365) < 2
    );

-- 6). Display the details of departments in which the max salary is greater than 10000 for employees who did a job in the past ?
SELECT d.department_id
FROM departments d INNER JOIN job_history jh
ON d.department_id = jh.department_id
INNER JOIN jobs j
ON jh.job_id = j.job_id
WHERE j.max_salary > 10000
AND (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM jh.start_date)) <= 1;

SELECT d.*                                  --, jh.start_date, e.salary
FROM departments d                          --, job_history jh, employees e
WHERE d.department_id IN 
    (
        SELECT e.department_id
        FROM employees e 
        WHERE e.employee_id IN 
            (
                SELECT jh.employee_id 
                FROM job_history jh
            )
        GROUP BY e.department_id
        HAVING MAX(e.salary) > 10000
    )
















