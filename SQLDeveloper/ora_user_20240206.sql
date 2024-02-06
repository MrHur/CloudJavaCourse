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

--연관성 있는 서브쿼리
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

-- 인라인뷰

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b,
       ( SELECT AVG(c.salary) AS avg_salary 
           FROM departments b,
                employees c
          WHERE b.parent_id = 90  -- 기획부
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
       )  a, --월간 매출액
       ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
           FROM sales a,
                customers b,
                countries c
          WHERE a.sales_month BETWEEN '200001' AND '200012'
            AND a.cust_id = b.CUST_ID
            AND b.COUNTRY_ID = c.COUNTRY_ID
            AND c.COUNTRY_NAME = 'Italy'       
       ) b -- 연간 매출액
 WHERE a.month_avg > b.year_avg ;

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
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;

--다음 쿼리를 ANSI 문법으로 변경해 보자.
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
--다음은 연관성이 있는 서브쿼리이다. 이를 연관성 없는 서브쿼리로 변환해 보자.
SELECT a.department_id, a.department_name
FROM departments a
WHERE EXISTS (SELECT 1
                FROM job_history b
                WHERE a.department_id = b.department_id );

SELECT a.department_id, a.department_name
FROM departments a
WHERE a.department_id IN (SELECT b.department_id
                         FROM job_history b);
                         
--연도별 이태리 최대매출액과 사원을 작성화는 쿼리를 학습했다. 이 쿼리를 기준으로 최대 매출액 뿐만 아니라
-- 최소 매출액과 해당 사원을 조회하는 쿼리를 작성해 보자.
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








--연도별로 이탈리아 매출 데이터를 살펴 매출실적이 가장 많은 사원의 목록
--1. 이탈리아의 연도별, 사원별, 매출액 계산
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

--2. 연도별 최대 매출액 추출
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
 
 --3. 1과 2의 결과를 조인해서 최대 매출을 일으킨 사원을 추출.
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

--4.  3결과와 사원테이블을 조인해서 사원 이름을 가져온다.
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
