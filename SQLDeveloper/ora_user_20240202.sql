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

SELECT employee_id, salary, commission_pct,
    COALESCE(salary + (salary * commission_pct), salary) AS salary2
    FROM employees;

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct < 0.2;

--SELECT COUNT(*)
SELECT employee_id, commission_pct, NVL(commission_pct, 0) AS new
FROM employees
WHERE NVL(commission_pct, 0) < 0.2;

SELECT COUNT(*)
FROM employees
WHERE LNNVL(commission_pct >= 0.2);

SELECT employee_id,
    TO_CHAR(start_date, 'YYYY') start_year,
    TO_CHAR(end_date, 'YYYY') end_year,
    NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY')) nullif_year
FROM job_history;

--기타함수
SELECT GREATEST(1, 2, 3, 2),
    LEAST(1, 2, 3, 2)
FROM DUAL;

SELECT GREATEST('이순신','강감찬', '세종대왕'),
    LEAST('이순신','강감찬', '세종대왕')
FROM DUAL;

SELECT DECODE(5, 1, '이순신', 3, '강감찬', '바보')
FROM DUAL;

SELECT DECODE(channel_id, 3, 'Direct',
                                        9, 'Indirect',
                                        5, 'Indirect',
                                        4, 'Indirect',
                                            'Others') decode
FROM sales
WHERE rownum < 10;