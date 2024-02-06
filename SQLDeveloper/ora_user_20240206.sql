--HJH_chap06_ex1
--101번 사원에 대해 아래의 결과를 산출하는 쿼리를 작성해 보자.
SELECT a.EMPLOYEE_ID 사번, a.EMP_NAME 사원명, d.JOB_title job명칭, b.start_DATE job시작일자, b.end_date job종료일자 , c.department_name job수행부서명
FROM EMPLOYEES a,
    job_history b,
    departments c,
    jobs d
WHERE a.employee_id = b.employee_id
and b.department_id = c.department_id
and b.job_id = d.job_id
and a.employee_id = 101;

--아래의 쿼리를 수행하면 오류가 발생한다. 오류의 원인은 무엇인가?
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a,
     job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id(+) = b.department_id;
--두 개의 테이블을 outer-join할 수 없습니다

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;

--서브쿼리
--연관성 없는 서브쿼리

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
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          