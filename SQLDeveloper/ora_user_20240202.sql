SELECT employee_id AS "�����ȣ", emp_name AS "�����", HIRE_DATE AS "�Ի�����", 
       ROUND((sysdate - hire_date) / 365) AS "�ټӳ��"
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 10
 ORDER BY 3;   -- �Ի����� �������� �������� ����
 
 SELECT cust_name, cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
  FROM customers;

--NULL �����Լ�
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

--��Ÿ�Լ�
SELECT GREATEST(1, 2, 3, 2),
    LEAST(1, 2, 3, 2)
FROM DUAL;

SELECT GREATEST('�̼���','������', '�������'),
    LEAST('�̼���','������', '�������')
FROM DUAL;

SELECT DECODE(5, 1, '�̼���', 3, '������', '�ٺ�')
FROM DUAL;

SELECT DECODE(channel_id, 3, 'Direct',
                                        9, 'Indirect',
                                        5, 'Indirect',
                                        4, 'Indirect',
                                            'Others') decode
FROM sales
WHERE rownum < 10;

--�� ���̺�(CUSTOMERS)�� �� ��ȭ��ȣ(cust_main_phone_number) �÷��� �ٸ� ���ڷ� ��ü(������ ��ȣȭ)�ϵ��� ������ �ۼ��� ����.
select cust_name, cust_main_phone_number,
       translate(cust_main_phone_number,0123456789,'abcdefghij') AS modified_phone_number
  from customers;
--�� ���̺�(CUSTOMERS)���� ���� ����⵵(cust_year_of_birth) �÷��� �ִ�. ������ �������� �� �÷��� Ȱ���� 30��, 40��, 50�븦 ������ ����ϰ�,
--������ ���ɴ�� '��Ÿ'�� ����ϴ� ������ �ۼ��غ���.
SELECT DECODE(TRUNC(TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-cust_year_of_birth,-1),
                                                                              30, '30��',
                                                                              40, '40��',
                                                                              50, '50��',
                                                                                  '��Ÿ') as "���ɴ�"
FROM CUSTOMERS;
   
SELECT 
  CUST_NAME, 
  CUST_YEAR_OF_BIRTH,
  TRUNC(TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) AS age, 
  DECODE(
    TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH) / 10), 
    3, '30��', 
    4, '40��', 
    5, '50��', 
    '��Ÿ'
  ) AS "���ɴ�"
FROM CUSTOMERS;
--5�� ������ 30~50�� ������ ǥ���ߴµ�, �� ���ɴ븦 ǥ���ϵ��� ������ �ۼ��ϴµ�, �̹����� DECODE ��� CASE ǥ������ ����غ���.
SELECT
  cust_year_of_birth,
  CASE
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 10 AND 19 THEN '10��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 20 AND 29 THEN '20��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 30 AND 39 THEN '30��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 40 AND 49 THEN '40��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 50 AND 59 THEN '50��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 60 AND 69 THEN '60��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 70 AND 79 THEN '70��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 80 AND 89 THEN '80��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 90 AND 99 THEN '90��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 100 AND 109 THEN '100��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 110 AND 119 THEN '110��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 120 AND 129 THEN '120��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 130 AND 139 THEN '130��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 140 AND 149 THEN '140��'
    WHEN TRUNC((SYSDATE - TO_DATE(cust_year_of_birth, 'YYYY')) / 365.25) BETWEEN 150 AND 159 THEN '150��'
    ELSE '��Ÿ'
  END AS age_group
FROM CUSTOMERS;

--�����Լ�
SELECT COUNT(*)
FROM employees;

--�Ű������� �Էµ� �׸� null ���� ����
SELECT COUNT(department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id)
FROM employees;


SELECT DISTINCT department_id
FROM employees
ORDER BY 1;

SELECT DISTINCT employee_id, department_id
FROM employees
ORDER BY 2, 1;

--sum
select sum(salary)
from employees;

select sum(salary), sum(distinct salary)
from employees;

--avg
select avg(salary), avg(distinct salary)
from employees;

--min / max
select min(salary), max(salary)
from employees;

--variance stddev
select variance(salary), stddev(salary)
from employees;

--group by �� having ��
select department_id, sum(salary), avg(salary)
from employees
group by department_id
order by department_id;

select department_id, emp_name
from employees
where department_id =10;

select *
from kor_loan_status;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY period, region
ORDER BY period, region;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period = '201311'
GROUP BY period, region
ORDER BY region;

select period, region, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period = '201311'
GROUP BY period, region
having sum(loan_jan_amt) > 100000
ORDER BY region;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY period, gubun
ORDER BY period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY rollup(period, gubun)
ORDER BY period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY period, rollup(gubun)
ORDER BY period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY rollup(period), gubun
ORDER BY period;

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY CUBE(period, gubun);

select period, gubun, sum(loan_jan_amt) totl_jan
from kor_loan_status
where period LIKE '2013%'
GROUP BY period,  CUBE(gubun);