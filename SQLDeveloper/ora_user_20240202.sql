SELECT employee_id AS "사원번호", emp_name AS "사원명", HIRE_DATE AS "입사일자", 
       ROUND((sysdate - hire_date) / 365) AS "근속년수"
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 10
 ORDER BY 3;   -- 입사일자 기준으로 오름차순 정렬
 
 SELECT cust_name, cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
  FROM customers;

--NULL 관련함수
SELECT NVL(manager_id, employee_id)
    FROM employees
WHERE manager_id IS NULL;

SELECT employee_id,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
    FROM employees;

