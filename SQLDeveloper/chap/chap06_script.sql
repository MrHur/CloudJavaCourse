-- 동등조인
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
            departments b
 WHERE a.department_id = b.department_id;            
 
-- 세미조인
SELECT department_id, department_name
  FROM departments a
 WHERE EXISTS ( SELECT * 
                 FROM employees b
                WHERE a.department_id = b.department_id
                  AND b.salary > 3000)
ORDER BY a.department_name;

SELECT department_id, department_name
  FROM departments a
 WHERE a.department_id  IN ( SELECT b.department_id
                               FROM employees b
                              WHERE b.salary > 3000)
ORDER BY department_name;

--  동등조인과 비교
SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;

-- 안티조인
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.department_id NOT IN ( SELECT department_id
                                  FROM departments 
                                 WHERE manager_id IS NULL) ;

SELECT count(*)
  FROM employees a
 WHERE NOT EXISTS ( SELECT 1
                      FROM departments c
                   WHERE a.department_id = c.department_id 
AND manager_id IS NULL) ;


-- 셀프조인
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
  FROM employees a,
        employees b
 WHERE a.employee_id < b.employee_id      
   AND a.department_id = b.department_id
   AND a.department_id = 20;

-- 외부조인
-- 일반 조인과 비교
SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id;

SELECT a.department_id, a.department_name, b.job_id, b.department_id
FROM departments a,
     job_history b
WHERE a.department_id = b.department_id (+) ;

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a,
       job_history b
 WHERE a.employee_id = b.employee_id(+)
   AND a.department_id = b.department_id(+);

-- 카타시안 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;

-- ANSI 조인(내부)
--동등조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id
   AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    ON (a.department_id = b.department_id )
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');
 
SELECT a.employee_id, a.emp_name, department_id, b.department_name
  FROM employees a
  INNER JOIN departments b
    USING (department_id)
 WHERE a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

-- ANSI 외부조인
-- 외부조인
select a.employee_id, a.emp_name, b.job_id, b.department_id 
  from employees a,
       job_history b
 where a.employee_id  = b.employee_id(+)
   and a.department_id = b.department_id(+);

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM employees a
  LEFT OUTER JOIN job_history b
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;
       
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id 
  FROM job_history b 
  RIGHT JOIN employees a
  ON ( a.employee_id  = b.employee_id
       and a.department_id = b.department_id) ;
       
-- CROSS 조인
-- 카다시안 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
  FROM employees a,
       departments b;

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a 
CROSS JOIN departments b;

-- FULL OUTER 조인
CREATE TABLE LEE_A  (EMP_ID INT);

CREATE TABLE LEE_B  (EMP_ID INT);

INSERT INTO LEE_A VALUES ( 10);

INSERT INTO LEE_A VALUES ( 20);

INSERT INTO LEE_A VALUES ( 40);

INSERT INTO LEE_B VALUES ( 10);

INSERT INTO LEE_B VALUES ( 20);

INSERT INTO LEE_B VALUES ( 30);

COMMIT;

SELECT a.emp_id, b.emp_id
FROM lee_a a, 
     lee_b b
WHERE a.emp_id(+) = b.emp_id(+);

SELECT a.emp_id, b.emp_id
FROM lee_a a
FULL OUTER JOIN lee_b b
ON ( a.emp_id = b.emp_id);

-- chap06_ex1
-- 1.
select a.employee_id, a.emp_name, d.job_title, b.start_date, b.end_date, c.department_name
  from employees a,
       job_history b,
       departments c,
       jobs d
 where a.employee_id   = b.employee_id       
     and b.department_id = c.department_id
     and b.job_id = d.job_id
     and a.employee_id = 101;  

-- 서브쿼리
-- 연관성 없는 서브쿼리 

SELECT count(*)
  FROM employees 
 WHERE salary >=  ( SELECT AVG(salary)
                      FROM employees );
                      
SELECT count(*)
  FROM employees 
 WHERE department_id IN ( SELECT department_id
                            FROM departments
                           WHERE parent_id IS NULL);
                           
SELECT employee_id, emp_name, job_id
FROM employees
WHERE (employee_id, job_id ) IN ( SELECT employee_id, job_id
                                    FROM job_history);

UPDATE employees
   SET salary = ( SELECT AVG(salary)
                    FROM employees );

DELETE employees
 WHERE salary >= ( SELECT AVG(salary)
                    FROM employees );
                    
ROLLBACK;

SELECT SALARY
FROM employees;

-- 연관성 있는 서브쿼리   

SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );
                    
SELECT a.employee_id, 
       ( SELECT b.emp_name
           FROM employees b
          WHERE a.employee_id = b.employee_id) AS emp_name,
       a.department_id,
       ( SELECT b.department_name
           FROM departments b
          WHERE a.department_id = b.department_id) AS dep_name     
FROM job_history a;

SELECT a.department_id, a.department_name
  FROM departments a
 WHERE EXISTS ( SELECT 1
                  FROM employees b  
                 WHERE a.department_id = b.department_id 
                   AND b.salary > ( SELECT AVG(salary)  
                                      FROM employees )
               );
               
SELECT department_id , AVG(salary)
  FROM employees a
 WHERE department_id IN ( SELECT department_id 
                            FROM departments
                           WHERE parent_id = 90) 
GROUP BY department_id;              
                    
UPDATE employees a
   SET a.salary =  ( SELECT sal
                      FROM  ( SELECT b.department_id, AVG(c.salary) as sal
                               FROM departments b, 
                                    employees c
                              WHERE b.parent_id = 90 
                                AND b.department_id = c.department_id
                              GROUP BY b.department_id ) d   
                        WHERE a.department_id = d.department_id ) 
    WHERE a.department_id IN ( SELECT department_id 
                              FROM departments
                             WHERE parent_id = 90 ) ;                   
                    
SELECT department_id , MIN(salary), MAX(salary)
  FROM employees a
 WHERE department_id  IN ( SELECT department_id 
                             FROM departments
                            WHERE parent_id = 90) 
GROUP BY department_id ;
                    
MERGE INTO employees a
  USING ( SELECT b.department_id, AVG(c.salary) as sal
            FROM departments b, 
                  employees c
           WHERE b.parent_id = 90 
             AND b.department_id = c.department_id
            GROUP BY b.department_id ) d
      ON ( a.department_id = d.department_id )
 WHEN MATCHED THEN
 UPDATE SET a.salary = d.sal;                    
                    
ROLLBACK;

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

-- 2000년도 이탈리아 매출액
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
             )  a, -- 월간 매출액
             ( SELECT ROUND(AVG(a.amount_sold)) AS year_avg
                   FROM sales a,
                        customers b,
                        countries c
                   WHERE a.sales_month BETWEEN '200001' AND '200012' 
                        AND a.cust_id = b.CUST_ID
                        AND b.COUNTRY_ID = c.COUNTRY_ID
                        AND c.COUNTRY_NAME = 'Italy' 
                ) b  -- 연간 매출액      
     WHERE a.month_avg > b.year_avg ;            

-- chap06_ex1
-- 3. 
SELECT a.department_id, a.department_name
  FROM departments a, employees b
 WHERE a.department_id = b.department_id
   AND b.salary > 3000
ORDER BY a.department_name;

SELECT a.department_id, a.department_name
  FROM departments a
   INNER JOIN employees b
     ON ( a.department_id = b.department_id )
 WHERE b.salary > 3000
 ORDER BY a.department_name;

-- 4. 
SELECT a.department_id, a.department_name
 FROM departments a
WHERE EXISTS ( SELECT 1 
                 FROM job_history b
                WHERE a.department_id = b.department_id );
                
SELECT a.department_id, a.department_name
 FROM departments a
WHERE a.department_id IN ( SELECT department_id
                             FROM job_history  );


-- 연도별로 이탈리아 매출 데이터를 살펴 매출실적이 가장 많은 사원의 목록과 매출액 조회
-- 1. 이탈리아의 연도별, 사원별, 매출액 계산
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
SELECT  years, MAX(amount_sold) AS max_sold
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
 ORDER BY years;             
 
 -- 3. 1과 2의 결과를 조인해서 최대 매출을 일으킨 사원을 추출
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
                                   )
                                     GROUP BY years
                    ) sale
   WHERE emp.years = sale.years
        AND emp.amount_sold = sale.max_sold                     
 ORDER BY years;
 
 -- 4. 3의 결과와 사원테이블을 조인해서 사원이름을 추출
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
                                   )
                                     GROUP BY years
                    ) sale,
                    employees emp2
  WHERE emp.years = sale.years
    AND emp.amount_sold = sale.max_sold 
    AND emp.employee_id = emp2.employee_id
ORDER BY years;
 
 
-- chap06_ex1
-- 5.
-- 1. 이탈리아의 연도별, 사원별, 매출액 계산
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

--2. 연도별 최대, 최소 매출액 추출
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
-- 3. 1과 2의 결과를 조인해서 최대 매출을 일으킨 사원을 추출하고 사원테이블을 조인해서 사원이름을 추출 
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
 
 -- WITH 절
 -- 연도별 최종월
SELECT MAX(PERIOD) max_month
    FROM kor_loan_status
  GROUP BY SUBSTR(PERIOD, 1, 4);

-- 월별, 지역별 대출잔액
SELECT period, region, sum(loan_jan_amt) jan_amt    
    FROM kor_loan_status 
   GROUP BY period, region ;
   
-- 연도별 최종월 대출잔액이 가장 큰 금액 
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
 
-- 연도별 최종월 기준 가장 대출이 많은 도시와 잔액 조회
SELECT b2.*
FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt    -- 중복구문
             FROM kor_loan_status 
             GROUP BY period, region
          ) b2,
           ( SELECT b.period,  MAX(b.jan_amt) max_jan_amt
                 FROM ( SELECT period, region, sum(loan_jan_amt) jan_amt     -- 중복구문
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
 
-- 별첨지정

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
                   
-- 별첨사용

SELECT b2.*
  FROM b2, c
 WHERE b2.period = c.period
   AND b2.jan_amt = c.max_jan_amt
 ORDER BY 1;  
 
 
--WITH절 연습문제   
 WITH basis AS ( SELECT 
                                CASE WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth < 20 THEN '10대'
                                          WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth BETWEEN 20 AND 29 THEN '20대'
                                          WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth BETWEEN 30 AND 39 THEN '30대'
                                          WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth BETWEEN 40 AND 49 THEN '40대'
                                          WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth BETWEEN 50 AND 59 THEN '50대'
                                          WHEN to_char(sysdate, 'yyyy') - b.cust_year_of_birth >= 60 THEN '60대 이상'
                                END AS old_seg,
                                 s.amount_sold
                              FROM sales s, 
                                        customers b
                             WHERE s.sales_month = '200112'
                               AND s.cust_id = b.CUST_ID
                          ),
     real_data AS ( SELECT old_seg,  SUM(amount_sold) as old_seg_amt
                                  FROM basis
                                 GROUP BY old_seg
                          )
              
 SELECT *
 FROM real_data
 ORDER BY old_seg;  
 
 
--WIDTH_BUCKET사용
WITH basis AS ( SELECT WIDTH_BUCKET(to_char(sysdate, 'yyyy') - b.cust_year_of_birth, 10, 90, 8) AS old_seg,
                
                       s.amount_sold
                  FROM sales s, 
                       customers b
                 WHERE s.sales_month = '200112'
                   AND s.cust_id = b.CUST_ID
              ),
     real_data AS ( SELECT old_seg * 10 || ' 대' AS old_segment,
                           SUM(amount_sold) as old_seg_amt
                      FROM basis
                     GROUP BY old_seg
              )


 SELECT *
 FROM real_data
 ORDER BY old_segment;   



