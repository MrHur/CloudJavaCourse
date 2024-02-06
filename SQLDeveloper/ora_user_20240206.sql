--HJH_chap06_ex1
--101�� ����� ���� �Ʒ��� ����� �����ϴ� ������ �ۼ��� ����.
SELECT a.EMPLOYEE_ID ���, a.EMP_NAME �����, d.JOB_title job��Ī, b.start_DATE job��������, b.end_date job�������� , c.department_name job����μ���
FROM EMPLOYEES a,
    job_history b,
    departments c,
    jobs d
WHERE a.employee_id = b.employee_id
and b.department_id = c.department_id
and b.job_id = d.job_id
and a.employee_id = 101;

--�Ʒ��� ������ �����ϸ� ������ �߻��Ѵ�. ������ ������ �����ΰ�?
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a,
     job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id(+) = b.department_id;
--�� ���� ���̺��� outer-join�� �� �����ϴ�

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;

--��������
--������ ���� ��������

SELECT count(*)
FROM employees
WHERE salary >= (SELECT AVG(salary)
                          FROM employees );
                                                   
SELECT count(*)
FROM employees
WHERE department_id IN ( SELECT department_id
                                     FROM departments
                                    WHERE parent_id IS NULL );
SELECT count(*)
FROM employees;

SELECT
    employee_id,
    emp_name,
    job_id
FROM
    employees
WHERE
    ( employee_id, job_id ) IN (
        SELECT
            employee_id, job_id
        FROM
            job_history
    );
                          
update employees
set salary = (Select avg(salary)
                from employees);
                
DELETE employees
WHERE salary >= ( SELECT AVG(salary)
        FROM employees );

ROLLBACK;

SELECT SALARY
FROM EMPLOYEES;

--������ �ִ� ��������
select a.department_id, a.department_name
from departments a
WHERE EXISTS( SELECT 1
                        FROM job_history b
                        where a.department_id = b.department_id );
                        
SELECT a.employee_id,
            ( SELECT b.emp_name
              FROM employees b
              WHERE a.employee_id = b.employee_id ) AS emp_name,
              a.department_id,
              ( SELECT b.department_name
                FROM departments b
                WHERE a.department_id = b.department_id ) AS dep_name
            FROM job_history a;

SELECT
    a.department_id,
    a.department_name
FROM
    departments a         
 WHERE EXISTS( SELECT 1
                        FROM employees b
                        where a.department_id = b.department_id
                        AND b.salary > (SELECT AVG(SALARY)
                        FROM EMPLOYEES)
                        );   