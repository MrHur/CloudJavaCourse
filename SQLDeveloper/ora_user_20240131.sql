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

--AS 생략 가능
SELECT
    a.employee_id,
    a.emp_name,
    a.department_id,
    b.department_name AS dep_name
FROM
    employees   a,
    departments b
WHERE
    a.department_id = b.department_id;
    
--VIEW 생성
CREATE OR REPLACE VIEW emp_dept_v3 AS
    SELECT
        a.employee_id,
        a.emp_name,
        a.department_id,
        b.department_name AS dep_name
    FROM
        employees   a,
        departments b
    WHERE
        a.department_id = b.department_id
--WITH CHECK OPTION;
    WITH READ ONLY;
    
INSERT INTO emp_dept_v3 VALUES (2, 'AA', 2, 'asd');