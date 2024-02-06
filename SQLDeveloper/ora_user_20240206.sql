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

SELECT department_id, AVG(salary)
    FROM employees a
WHERE department_id IN ( SELECT department_id
                            FROM departments
                            WHERE parent_id = 90)
GROUP BY department_id;  

UPDATE employees a
    SET a.salary =  (SELECT sal
                        FROM ( SELECT b.department_id, AVG(c.salary) as sal
                            FROM departments b,
                                employees c
                            WHERE b.parent_id = 90
                                AND b.department_id = c.department_id
                            GROUP BY b.department_id ) d
                            WHERE a.department_id = d.department_id )
WHERE a.department_id IN(SELECT department_id
                                    FROM departments
                                    WHERE parent_id = 90 );

SELECT department_id, MIN(salary), MAX(salary)
FROM employees a
WHERE department_id IN (SELECT department_id
                                FROM departments
                                WHERE parent_id = 90)
GROUP BY department_id;     

MERGE INTO employees a
USING (
    SELECT b.department_id, AVG(c.salary) as sal
    FROM departments b,
         employees c
    WHERE b.parent_id = 90
        AND b.department_id = c.department_id
    GROUP BY b.department_id
) d
ON (a.department_id = d.department_id)
WHEN MATCHED THEN
    UPDATE SET a.salary = d.sal;
    
rollback;

-- �ζ��κ�

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- ��ȹ��
            AND b.department_id = c.department_id ) d
 WHERE a.department_id = b.department_id 
   AND a.salary > d.avg_salary;


SELECT a.* 
  FROM ( SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'     
          GROUP BY a.sales_month  
       )  a, --���� �����
       ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'       
       ) b -- ���� �����
 WHERE a.month_avg > b.year_avg ;

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
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;

--���� ������ ANSI �������� ������ ����.
SELECT a.department_id, a.department_name
FROM departments a, employees b
WHERE a.department_id = b.department_id
AND b.salary > 3000
ORDER BY a.department_name;

SELECT a.department_id, a.department_name
FROM departments a
JOIN employees b ON a.department_id = b.department_id
WHERE b.salary > 3000
ORDER BY a.department_name;
--������ �������� �ִ� ���������̴�. �̸� ������ ���� ���������� ��ȯ�� ����.
SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS (SELECT 1
                FROM job_history b
                WHERE a.department_id = b.department_id );

SELECT a.department_id, a.department_name
FROM departments a
WHERE a.department_id IN (SELECT b.department_id
                         FROM job_history b);
                         
--������ ���¸� �ִ����װ� ����� �ۼ�ȭ�� ������ �н��ߴ�. �� ������ �������� �ִ� ����� �Ӹ� �ƴ϶�
-- �ּ� ����װ� �ش� ����� ��ȸ�ϴ� ������ �ۼ��� ����.
WITH ItalySales AS (
    SELECT
        TO_CHAR(SALES_DATE, 'YYYY') AS SALES_YEAR,
        AMOUNT_SOLD,
        EMPLOYEE_ID,
        RANK() OVER (PARTITION BY TO_CHAR(SALES_DATE, 'YYYY') ORDER BY AMOUNT_SOLD DESC) AS SALES_RANK
    FROM
        SALES s
        JOIN CUSTOMERS c ON s.CUST_ID = c.CUST_ID
        JOIN COUNTRIES co ON c.COUNTRY_ID = co.COUNTRY_ID
    WHERE
        co.COUNTRY_NAME = 'Italy'
)
SELECT
    SALES_YEAR,
    MAX(AMOUNT_SOLD) AS MAX_SALES_AMOUNT,
    MIN(AMOUNT_SOLD) AS MIN_SALES_AMOUNT,
    MAX(CASE WHEN SALES_RANK = 1 THEN EMPLOYEE_ID END) AS TOP_SALES_EMPLOYEE,
    MAX(CASE WHEN SALES_RANK = (SELECT COUNT(DISTINCT EMPLOYEE_ID) FROM ItalySales) THEN EMPLOYEE_ID END) AS MIN_SALES_EMPLOYEE
FROM
    ItalySales
GROUP BY
    SALES_YEAR;

-- 1. ��Ż������ ������, �����, ����� ���
SELECT SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id, 
        SUM(a.amount_sold) AS amount_sold
   FROM sales a,
        customers b,
        countries c
  WHERE a.cust_id = b.CUST_ID
    AND b.country_id = c.COUNTRY_ID
    AND c.country_name = 'Italy'     
  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
  order by years;     

--2. ������ �ִ�, �ּ� ����� ����
SELECT  years, 
         MAX(amount_sold) AS max_sold,
         MIN(amount_sold) AS min_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
       )
  GROUP BY years; 
-- 3. 1�� 2�� ����� �����ؼ� �ִ� ������ ����Ų ����� �����ϰ� ������̺��� �����ؼ� ����̸��� ���� 
SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold,
                 MIN(amount_sold) AS min_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               )
          GROUP BY years
       ) sale,
       employees emp2 
  WHERE emp.years = sale.years
    AND (emp.amount_sold = sale.max_sold  OR emp.amount_sold = sale.min_sold)
    AND emp.employee_id = emp2.employee_id
  ORDER BY years;
 


--�������� ��Ż���� ���� �����͸� ���� ��������� ���� ���� ����� ���
--1. ��Ż������ ������, �����, ����� ���
SELECT SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id, 
        SUM(a.amount_sold) AS amount_sold
   FROM sales a,
        customers b,
        countries c
  WHERE a.cust_id = b.CUST_ID
    AND b.country_id = c.COUNTRY_ID
    AND c.country_name = 'Italy'     
GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;

--2. ������ �ִ� ����� ����
SELECT  years, 
        MAX(amount_sold) AS max_sold
 FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
 FROM sales a,
               customers b,
               countries c
  WHERE a.cust_id = b.CUST_ID
          AND b.country_id = c.COUNTRY_ID
          AND c.country_name = 'Italy'     
       GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
      ) K
 GROUP BY years
 ORDER BY years;
 
 --3. 1�� 2�� ����� �����ؼ� �ִ� ������ ����Ų ����� ����.
SELECT emp.years, 
       emp.employee_id,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
  ORDER BY years;

--4.  3����� ������̺��� �����ؼ� ��� �̸��� �����´�.
SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale,
       employees emp2
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
    AND emp.employee_id = emp2.employee_id
ORDER BY years;


-- WITH ��
-- ������ ������
SELECT MAX(PERIOD) max_month
  FROM kor_loan_status
 GROUP BY SUBSTR(PERIOD, 1, 4);

--����, ������ �����ܾ�
 SELECT period, region, sum(loan_jan_amt) jan_amt
   FROM kor_loan_status 
  GROUP BY period, region;
  
--������ ������ �����ܾ��� ���� ū �ݾ�
SELECT b.period,  MAX(b.jan_amt) max_jan_amt
 FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
              FROM kor_loan_status 
             GROUP BY period, region
           ) b,
           ( SELECT MAX(PERIOD) max_month
               FROM kor_loan_status
              GROUP BY SUBSTR(PERIOD, 1, 4)
           ) a
WHERE b.period = a.max_month
GROUP BY b.period;

--������ ������ ���� ���� ������ ���� ���ÿ� �ܾ� ��ȸ
SELECT b2.*
FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt --�ߺ� ����
         FROM kor_loan_status 
         GROUP BY period, region
      ) b2,  
       ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
         FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt  --�ߺ� ����
                  FROM kor_loan_status 
                 GROUP BY period, region
              ) b,
              ( SELECT MAX(PERIOD) max_month
                  FROM kor_loan_status
                 GROUP BY SUBSTR(PERIOD, 1, 4)
              ) a
         WHERE b.period = a.max_month
         GROUP BY b.period
      ) c   
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;
 
--��÷����
WITH b2 AS ( SELECT period, region, sum(loan_jan_amt) jan_amt
               FROM kor_loan_status 
              GROUP BY period, region
           ),
     c AS ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
              FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt
                      FROM kor_loan_status 
                     GROUP BY period, region
                   ) b,
                   ( SELECT MAX(PERIOD) max_month
                       FROM kor_loan_status
                      GROUP BY SUBSTR(PERIOD, 1, 4)
                   ) a
             WHERE b.period = a.max_month
             GROUP BY b.period
           )
--��÷���
SELECT b2.*
  FROM b2, c
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;           
 
 
--WITH�� ��������
--sales ���̺��� �Ǹŵ�����, customers ���̺��� �������� �ִ�.
--2001�� 12�� (SALES_MONTH = '200112') �Ǹŵ����� �� �������ڸ� ��������
--���� ����(customers.cust_year_of_birth)�� ����ؼ� ������ ���� ���ɴ뺰 ����ݾ��� �����ִ� ������ �ۼ��غ���.
WITH basis AS ( SELECT WIDTH_BUCKET(to_char(sysdate, 'yyyy') - b.cust_year_of_birth, 10, 90, 8) AS old_seg,
                       TO_CHAR(SYSDATE, 'yyyy') - b.cust_year_of_birth as olds,
                       s.amount_sold
                  FROM sales s, 
                       customers b
                 WHERE s.sales_month = '200112'
                   AND s.cust_id = b.CUST_ID
              ),
     real_data AS ( SELECT old_seg * 10 || ' ��' AS old_segment,
                           SUM(amount_sold) as old_seg_amt
                      FROM basis
                     GROUP BY old_seg
              )
 SELECT *
 FROM real_data
 ORDER BY old_segment;   