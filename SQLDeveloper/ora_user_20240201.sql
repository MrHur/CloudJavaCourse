SELECT ABS(10), ABS(-10), ABS(-10.123)
FROM DUAL;

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
FROM DUAL;

SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001) 
FROM DUAL;

SELECT ROUND(10.154), ROUND(10.154, 2), ROUND(10.154, 3), 
             ROUND(0, 3), ROUND(115.154, -1), ROUND(115.154, -2)
FROM DUAL;

SELECT TRUNC(10.123), TRUNC(10.541), TRUNC(11.001) 
FROM DUAL;

SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001), POWER(0, 3.0001)
FROM DUAL;

SELECT SQRT(2), SQRT(5), SQRT(3) 
FROM DUAL;

SELECT MOD(19, 4), MOD(19.541, 4.2), MOD(11, 3) 
FROM DUAL;

SELECT REMAINDER(19, 4), REMAINDER(19.541, 4.2), REMAINDER(11, 3) 
FROM DUAL;

SELECT EXP(2), LN(2.713), LOG(10, 100) 
FROM DUAL;

--문자함수
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye')
FROM DUAL;

SELECT LOWER('NEVER SAY GOODBYE')
FROM DUAL;

SELECT UPPER('never say goodbye')
FROM DUAL;

SELECT CONCAT('I Have', 'A Dream'), 'I Have' || 'A Dream'
FROM DUAL;

SELECT SUBSTR('ABCD EFG', 1, 4)
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4)
FROM DUAL;

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라맙소사', 1, 4)
FROM DUAL;

SELECT LTRIM('ABCDEFGABC','ABC'), LTRIM('가나다라','가')
FROM DUAL;

SELECT RTRIM('ABCDEFGABC','ABC'), RTRIM('가나다라','라')
FROM DUAL;

SELECT LPAD('111-1111',12, '(02)'), RPAD('111-1111',12,'(02)')
FROM DUAL;

CREATE TABLE ex4_1 (
    phone_num VARCHAR2(30)
);

INSERT INTO ex4_1 VALUES ('111-1111');
INSERT INTO ex4_1 VALUES ('222-2222');
INSERT INTO ex4_1 VALUES ('333-3333');

SELECT *
FROM ex4_1;

SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너') AS rep,
TRANSLATE('나는 너를 모르는데 너는 나를 알겠는가?', '나는', '너를') AS trn
FROM DUAL;

-- 생략시 , '만약', 1, 1 과 같다.
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

SELECT NEXT_DAY(SYSDATE + 7, '금요일') AS next_friday
FROM DUAL;
SELECT NEXT_DAY(SYSDATE + 7, '목요일') AS next_thursday
FROM DUAL;

--변환함수
SELECT TO_CHAR(123456789, '999,999,999')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_NUMBER('123456')
FROM DUAL;

SELECT TO_DATE('20540101', 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_TIMESTAMP('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT NEXT_DAY(TO_DATE('20140101', 'YYYY-MM-DD'), '금요일')
FROM DUAL;

--HJH_chap04_ex1
--사원테이블(employees)에는 phone_number라는 컬럼에 사원의 전화번호가 ###.###.#### 형태로 저장되어 있다.
--여기서 처음 3자리 숫자 대신 서울 지역번호인 (02)를 붙여 전화번호를 출력하도록 쿼리를 작성해 보자.
SELECT '(' || '02' || ') ' || SUBSTR(phone_number, 4) AS seoul_phone_number
FROM employees;


--현재일자 기준으로 사원테이블의 입사일자(hire_date)를 참조해서 근속년수가 10년 이상인 사원을 다음과 같은 형태의 결과를 출력하도록 작성해보자.
--(근속년수가 많은 사원순서대로 결과를 나오도록 하자)
SELECT employee_id AS "사원번호",
            emp_name AS "사원명",
            hire_date AS "입사일자",
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS "근속년수"
FROM employees
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) >= 10
ORDER BY 4 DESC;

--고객 테이블(CUSTOMERS)에는 고객 전화번호(cust_main_phone_number) 컬럼이 있다. 
--이 컬럼 값은 ###-###-#### 형태인데, '-' 대신 '/'로 바꿔 출력하는 쿼리를 작성해 보자
SELECT REPLACE(cust_main_phone_number, '-', '/') AS modified_phone_number
FROM CUSTOMERS;
