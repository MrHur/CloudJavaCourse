--SELECT
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
AND job_id = 'IT_PROG'
ORDER BY employee_Id desc;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
OR job_id = 'IT_PROG'
ORDER BY employee_Id desc;
