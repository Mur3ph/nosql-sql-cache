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