SELECT ABS(10), ABS(-10), ABS(-10.123)
  FROM DUAL;
  
SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
  FROM DUAL;
  
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001)
  FROM DUAL;
  
SELECT ROUND(10.154), ROUND(10.541), ROUND(11.001)
  FROM DUAL;
  
SELECT ROUND(10.154, 1), ROUND(10.154, 2), ROUND(10.154, 3)
  FROM DUAL;
  
SELECT ROUND(0, 3), ROUND(115.155, -1), ROUND(115.155, -2)
  FROM DUAL; 

SELECT TRUNC(115.155), TRUNC(115.155, 1), TRUNC(115.155, 2), TRUNC(115.155, -2)
  FROM DUAL;
  
SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001)
  FROM DUAL;

SELECT POWER(-3, 3.0001)
  FROM DUAL;  
  
SELECT SQRT(2), SQRT(5)
  FROM DUAL;   
  
SELECT MOD(19,4), MOD(19.123, 4.2)
  FROM DUAL;
  
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
  FROM DUAL; 
  
SELECT EXP(2), LN(2.713), LOG(10, 100)
  FROM DUAL;
  
-- 문자함수
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye')
  FROM DUAL;  
  
SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye')
  FROM DUAL;  
  
SELECT CONCAT('I Have', ' A Dream'), 'I Have' || ' A Dream'
  FROM DUAL;
  
SELECT SUBSTR('ABCD EFG', 1, 4)
  FROM DUAL;
  
SELECT SUBSTR('ABCD EFG', 1, 4)
  FROM DUAL;
  
SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4)
  FROM DUAL;  

SELECT SUBSTR('ABCDEFG', 2, 3), SUBSTR('ABCDEFG', -3, 2)
  FROM DUAL;  

-- 한글 3byte  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 8)
  FROM DUAL;    
  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 6)
  FROM DUAL;    
  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 4)
  FROM DUAL;    
 
--문자셋 확인 
select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET'; 
  
SELECT LTRIM('ABCDEFGABC', 'ABC'), 
       LTRIM('가나다라', '가'),
       RTRIM('ABCDEFGABC', 'DEF'), 
       RTRIM('가나다라', '라')
  FROM DUAL;      
  
CREATE TABLE ex4_1 (
       phone_num VARCHAR2(30));
       
INSERT INTO ex4_1 VALUES ('111-1111');

INSERT INTO ex4_1 VALUES ('111-2222');

INSERT INTO ex4_1 VALUES ('111-3333');       
       
SELECT *
FROM ex4_1;

SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너')
  FROM DUAL;   

SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ', ' ', '')
  FROM DUAL;   
  
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS rep,
       TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS trn
  FROM DUAL; 
  
SELECT INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약') AS INSTR1, 
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5) AS INSTR2, 
       INSTR('내가 만약 외로울 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약', 5, 2) AS INSTR3 
  FROM DUAL; 
  
SELECT LENGTH('대한민국'),
       LENGTHB('대한민국')
  FROM DUAL;     
       
--날짜 함수
SELECT SYSDATE, SYSTIMESTAMP
  FROM DUAL;    
  
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
  FROM DUAL;  
  
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1, 
       MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
  FROM DUAL; 
       
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;  
  
SELECT SYSDATE, ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
  FROM DUAL; 
       
SELECT NEXT_DAY(SYSDATE, '금요일')
  FROM DUAL;       

-- 변환함수
SELECT TO_CHAR(123456789, '999,999,999')
  FROM DUAL;   
  
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_NUMBER('123456')
FROM DUAL;

SELECT TO_DATE('20140101', 'YYYY-MM-DD')
  FROM DUAL;

SELECT TO_TIMESTAMP('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;  

SELECT NEXT_DAY(TO_DATE('20140101', 'YYYY-MM-DD'), '금요일')
  FROM DUAL;       
  
--Quiz
--1.
SELECT employee_id,
       LPAD(SUBSTR(phone_number, 4), 13, '(02)')   --4번째 글자부터 가져와서 13글자 완성
  FROM employees;
  
--2.
SELECT employee_id AS "사원번호", emp_name AS "사원명", HIRE_DATE AS "입사일자", 
       ROUND((sysdate - hire_date) / 365) AS "근속년수"
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 10
 ORDER BY 3;   -- 입사일자 기준으로 오름차순 정렬
--3.
SELECT cust_name, cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
  FROM customers;
  
-- NULL 관련함수
SELECT NVL(manager_id, employee_id)
  FROM employees
 WHERE manager_id IS NULL;  

SELECT employee_id, 
       NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
  FROM employees;

SELECT employee_id, salary, commission_pct, 
       COALESCE (salary+(salary * commission_pct), salary) AS salary2
  FROM employees;  
       
SELECT employee_id, commission_pct
  FROM employees
 WHERE commission_pct < 0.2;
 
-- SELECT COUNT(*)
SELECT employee_id, commission_pct, NVL(commission_pct, 0) AS new
  FROM employees
 WHERE NVL(commission_pct, 0) < 0.2;
       
SELECT COUNT(*)
  FROM employees
 WHERE LNNVL(commission_pct >= 0.2) ;     
 
SELECT employee_id,
       TO_CHAR(start_date, 'YYYY') start_year,
       TO_CHAR(end_date, 'YYYY') end_year,
       NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY') ) nullif_year
FROM job_history;

-- 기타함수
SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;       
  
-- 기타함수
SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;

SELECT GREATEST('이순신', '강감찬', '세종대왕'),
       LEAST('이순신', '강감찬', '세종대왕')
  FROM DUAL; 
       
SELECT prod_id,  
        DECODE(channel_id, 3, 'Direct', 
                                         9, 'Direct',
                                         5, 'Indirect',
                                         4, 'Indirect',
                                              'Others') decode
  FROM sales
  WHERE rownum < 10;

-- Quiz
-- 4.
SELECT cust_name, cust_main_phone_number,
        TRANSLATE(cust_main_phone_number, '0123456789', 'qwertyuiop') AS new_number
  FROM customers;
  
-- 5.
SELECT CUST_NAME, 
       CUST_YEAR_OF_BIRTH,
       TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) AS age,
       DECODE( TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10), 3, '30대',
                                                                                                                                  4, '40대',
                                                                                                                                  5, '50대',
                                                                                                                                  '기타') AS generation
FROM CUSTOMERS;       

--6.
SELECT CUST_NAME, 
       CUST_YEAR_OF_BIRTH, 
       CASE WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) BETWEEN  1 AND 19 THEN '10대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 20 AND 29 THEN '20대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 30 AND 39 THEN '30대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 40 AND 49 THEN '40대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 50 AND 59 THEN '50대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 60 AND 69 THEN '60대'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 70 AND 79 THEN '70대'
          ELSE '기타' END AS new_generation
       
  FROM CUSTOMERS;         


  
  
  
  
  
  
  
  
  
  
  
  
  
  