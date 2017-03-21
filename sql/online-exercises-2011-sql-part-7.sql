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

SELECT Q'[Paddy O'Reilly]' FROM DUAL;
SELECT Q'$Paddy O'Reilly$' FROM DUAL;




















