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

--고객 테이블(CUSTOMERS)의 고객 전화번호(cust_main_phone_number) 컬럼을 다른 문자로 대체(일종의 암호화)하도록 쿼리를 작성해 보자.
select cust_name, cust_main_phone_number,
       translate(cust_main_phone_number,0123456789,'abcdefghij') AS modified_phone_number
  from customers;
--고객 테이블(CUSTOMERS)에는 고객의 출생년도(cust_year_of_birth) 컬럼이 있다. 현재일 기준으로 이 컬럼을 활용해 30대, 40대, 50대를 구분해 출력하고,
--나머지 연령대는 '기타'로 출력하는 쿼리를 작성해보자.
SELECT DECODE(TRUNC(TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-cust_year_of_birth,-1),
                                                                              30, '30대',
                                                                              40, '40대',
                                                                              50, '50대',
                                                                                  '기타') as "연령대"
FROM CUSTOMERS;
   
SELECT 
  CUST_NAME, 
  CUST_YEAR_OF_BIRTH,
  TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) AS age, 
  DECODE(
    TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) / 10), 
    3, '30대', 
    4, '40대', 
    5, '50대', 
    '기타'
  ) AS GENERATION
FROM CUSTOMERS;
--5번 문제는 30~50대 까지만 표시했는데, 전 연령대를 표시하도록 쿼리를 작성하는데, 이번에는 DECODE 대신 CASE 표현식을 사용해보자.
SELECT
  cust_year_of_birth,
  CASE
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 10 AND 19 THEN '10대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 20 AND 29 THEN '20대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 30 AND 39 THEN '30대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 40 AND 49 THEN '40대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 50 AND 59 THEN '50대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 60 AND 69 THEN '60대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 70 AND 79 THEN '70대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 80 AND 89 THEN '80대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 90 AND 99 THEN '90대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 100 AND 109 THEN '100대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 110 AND 119 THEN '110대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 120 AND 129 THEN '120대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 130 AND 139 THEN '130대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 140 AND 149 THEN '140대'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 150 AND 159 THEN '150대'
    ELSE '기타'
  END AS age_group
FROM CUSTOMERS;
