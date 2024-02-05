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
  
-- �����Լ�
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye')
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

-- �ѱ� 3byte  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 8)
  FROM DUAL;    
  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 6)
  FROM DUAL;    
  
SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 4)
  FROM DUAL;    
 
--���ڼ� Ȯ�� 
select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET'; 
  
SELECT LTRIM('ABCDEFGABC', 'ABC'), 
       LTRIM('�����ٶ�', '��'),
       RTRIM('ABCDEFGABC', 'DEF'), 
       RTRIM('�����ٶ�', '��')
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

SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '��', '��')
  FROM DUAL;   

SELECT LTRIM(' ABC DEF '),
       RTRIM(' ABC DEF '),
       REPLACE(' ABC DEF ', ' ', '')
  FROM DUAL;   
  
SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS rep,
       TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS trn
  FROM DUAL; 
  
SELECT INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����') AS INSTR1, 
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5) AS INSTR2, 
       INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5, 2) AS INSTR3 
  FROM DUAL; 
  
SELECT LENGTH('���ѹα�'),
       LENGTHB('���ѹα�')
  FROM DUAL;     
       
--��¥ �Լ�
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
       
SELECT NEXT_DAY(SYSDATE, '�ݿ���')
  FROM DUAL;       

-- ��ȯ�Լ�
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

SELECT NEXT_DAY(TO_DATE('20140101', 'YYYY-MM-DD'), '�ݿ���')
  FROM DUAL;       
  
--Quiz
--1.
SELECT employee_id,
       LPAD(SUBSTR(phone_number, 4), 13, '(02)')   --4��° ���ں��� �����ͼ� 13���� �ϼ�
  FROM employees;
  
--2.
SELECT employee_id AS "�����ȣ", emp_name AS "�����", HIRE_DATE AS "�Ի�����", 
       ROUND((sysdate - hire_date) / 365) AS "�ټӳ��"
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 10
 ORDER BY 3;   -- �Ի����� �������� �������� ����
--3.
SELECT cust_name, cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
  FROM customers;
  
-- NULL �����Լ�
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

-- ��Ÿ�Լ�
SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;       
  
-- ��Ÿ�Լ�
SELECT GREATEST(1, 2, 3, 2),
       LEAST(1, 2, 3, 2) 
  FROM DUAL;

SELECT GREATEST('�̼���', '������', '�������'),
       LEAST('�̼���', '������', '�������')
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
       DECODE( TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10), 3, '30��',
                                                                                                                                  4, '40��',
                                                                                                                                  5, '50��',
                                                                                                                                  '��Ÿ') AS generation
FROM CUSTOMERS;       

--6.
SELECT CUST_NAME, 
       CUST_YEAR_OF_BIRTH, 
       CASE WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) BETWEEN  1 AND 19 THEN '10��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 20 AND 29 THEN '20��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 30 AND 39 THEN '30��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 40 AND 49 THEN '40��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 50 AND 59 THEN '50��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 60 AND 69 THEN '60��'
            WHEN TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)  BETWEEN 70 AND 79 THEN '70��'
          ELSE '��Ÿ' END AS new_generation
       
  FROM CUSTOMERS;         


  
  
  
  
  
  
  
  
  
  
  
  
  
  