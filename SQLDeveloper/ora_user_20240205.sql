--집합 연산자

CREATE TABLE exp_goods_asia (
    country VARCHAR2(10),
    seq     NUMBER,
    goods VARCHAR2(80));
    
INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');    
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');    
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');    
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');    
INSERT INTO exp_goods_asia VALUES ('한국', 5, 'LCD');    
INSERT INTO exp_goods_asia VALUES ('한국', 6, '자동차부품');    
INSERT INTO exp_goods_asia VALUES ('한국', 7, '휴대전화');    
INSERT INTO exp_goods_asia VALUES ('한국', 8, '환식탄화수소');    
INSERT INTO exp_goods_asia VALUES ('한국', 9, '무선송신기 디스플레이 부속품');    
INSERT INTO exp_goods_asia VALUES ('한국', 10, '철 또는 비합금강');

INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');    
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');    
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');    
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');    
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');    
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');    
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');    
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');    
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');    
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

COMMIT;

SELECT goods
  FROM exp_goods_asia
WHERE country = '한국'
ORDER BY seq;

SELECT goods
  FROM exp_goods_asia
WHERE country = '일본'
ORDER BY seq;


SELECT goods
  FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT goods
  FROM exp_goods_asia
WHERE country = '일본';

-- 중복 데이터도 표시
SELECT goods
  FROM exp_goods_asia
WHERE country = '한국'
UNION ALL
SELECT goods
  FROM exp_goods_asia
WHERE country = '일본';

-- 교집합 데이터 표시
SELECT goods
  FROM exp_goods_asia
WHERE country = '한국'
INTERSECT
SELECT goods
  FROM exp_goods_asia
WHERE country = '일본';

--차집합 데이터 표시
SELECT goods
  FROM exp_goods_asia
WHERE country = '한국'
MINUS
SELECT goods
  FROM exp_goods_asia
WHERE country = '일본';

SELECT goods
  FROM exp_goods_asia
WHERE country = '일본'
MINUS
SELECT goods
  FROM exp_goods_asia
WHERE country = '한국';

-- 이전에 goods 만 비교했을 경우에는, 5개의 데이터가 제외 되었는데, seq, goods를 같이 조회했을때는 2개만 제외되었다.
-- UNION으로 조회할 경우 2조건을 모두 만족하는 중복만 제거 됨. 
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '일본';

SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '한국'
INTERSECT
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '일본';

SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '한국'
UNION
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '일본'
ORDER BY goods;

--GROUPING SETS
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
    AND region IN('서울', '경기')
GROUP BY GROUPING SETS(period, (gubun, region));

--HJH_chap05_ex1
--사원테이블 (employees) 에서 입사년도별 사원수를 구하는 쿼리를 작성해보자.
SELECT TO_CHAR(hire_date, 'YYYY') AS 입사년도, COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 입사년도;

--kor_loan_status 테이블에서 2012년도 월별, 지역별 대출 총 잔액을 구하는 쿼리를 작성하라.
SELECT period, region, SUM(loan_jan_amt) AS total_loan_amt
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;

--아래의 쿼리는 분할 ROLLUP을 적용한 쿼리이다.
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);
--이 쿼리를 ROLLUP을 사용하지 않고, 집합연산자를 사용해서 동일한 결과가 나오도록 쿼리를 작성해보자.
--M1)
SELECT period, gubun, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, gubun
UNION ALL
SELECT period, NULL AS gubun, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period
ORDER BY gubun;
--M2)
SELECT period, gubun, SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, gubun
UNION ALL
SELECT period, '', SUM(loan_jan_amt) AS totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period
ORDER BY gubun;
--다음 쿼리를 실행해서 결과를 확인한 후, 집합연산자를 사용해 동일한 결과를 추출하도록 쿼리를 작성해보자.
SELECT period,
     CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액,
     CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
  FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

SELECT period, SUM(CASE WHEN gubun = '주택담보대출' THEN loan_jan_amt ELSE 0 END) AS 주택담보대출액, 0 AS 기타대출액
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period
UNION ALL
SELECT period, 0 AS 주택담보대출액, SUM(CASE WHEN gubun = '기타대출' THEN loan_jan_amt ELSE 0 END) AS 기타대출액
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period
ORDER BY period;

--다음과 같은 형태, 즉 지역과 각 월별 대출총잔액을 구하는 쿼리를 작성해 보자.

SELECT region,
       TO_CHAR(SUM(CASE WHEN period = '201111' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201111",
       TO_CHAR(SUM(CASE WHEN period = '201112' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201112",
       TO_CHAR(SUM(CASE WHEN period = '201210' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201210",
       TO_CHAR(SUM(CASE WHEN period = '201211' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201211",
       TO_CHAR(SUM(CASE WHEN period = '201212' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201212",
       TO_CHAR(SUM(CASE WHEN period = '201310' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201310",
       TO_CHAR(SUM(CASE WHEN period = '201311' THEN loan_jan_amt ELSE 0 END), '999,999,999') AS "201311"
FROM kor_loan_status
GROUP BY region
ORDER BY region;


--동등조인
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
        departments b
WHERE a.department_id = b.department_id;

--세미조인
SELECT department_id, department_name
FROM   departments a
WHERE EXISTS( SELECT *
                        FROM employees b
                        WHERE a.department_id = b.department_id
                        AND b.salary > 3000)
ORDER BY a.department_name;

--같은 결과
SELECT department_id, department_name
FROM   departments a
WHERE a.department_id IN ( SELECT b.department_id
                        FROM employees b
                        WHERE b.salary > 3000)
ORDER BY department_name;

--동등조인과 비교
SELECT a.department_id, a.department_name
FROM   departments a, employees b
WHERE a.department_id = b.department_id
    AND b.salary > 3000
ORDER BY a.department_name; 

--안티 조인(ANTI JOIN)
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
        departments b
WHERE a.department_id = b.department_id
AND a.department_id NOT IN ( SELECT department_id
                            FROM departments
                            WHERE manager_id IS NULL);

SELECT count(*)
FROM employees a
WHERE NOT EXISTS ( SELECT 1
                    FROM departments c
                    WHERE a.department_id = c.department_id
AND manager_id IS NULL);


--셀프 조인(SELF JOIN)
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id 
FROM   employees a, employees b
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
WHERE a.department_id = b.department_id (+);

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a,
    job_history b
WHERE a.employee_id = b.employee_id (+)
AND a.department_id = b.department_id(+);

--카타시안 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a,
departments b;

--ANSI 조인(내부)
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a,
departments b
WHERE  a.department_id = b.department_id
AND a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a
INNER JOIN departments b
ON (a.department_id = b.department_id)
WHERE  a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

SELECT a.employee_id, a.emp_name, department_id, b.department_name
FROM employees a
INNER JOIN departments b
USING (department_id)
WHERE  a.hire_date >= TO_DATE('2003-01-01','YYYY-MM-DD');

--ANSI 외부조인
--외부조인
SELECT a.employee_id, a.emp_name, job_id, b.department_id
FROM employees a,
    job_history b
WHERE a.employee_id = b.employee_id (+)
AND a.department_id = b.department_id(+);

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a
LEFT OUTER JOIN job_history b
ON (a.employee_id = b.employee_id
    and a.department_id = b.department_id);
    
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM  job_history b
RIGHT OUTER JOIN employees a
ON (a.employee_id = b.employee_id
    and a.department_id = b.department_id);
    

--CROSS 조인
--카다시안 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a,
departments b;

--ANSI CROSS 조인
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a
CROSS JOIN departments b;

--FULL OUTER 조인
CREATE TABLE LEE_A (EMP_ID INT);
CREATE TABLE LEE_B (EMP_ID INT);
INSERT INTO LEE_A VALUES( 10);
INSERT INTO LEE_A VALUES( 20);
INSERT INTO LEE_A VALUES( 40);
INSERT INTO LEE_B VALUES( 10);
INSERT INTO LEE_B VALUES( 20);
INSERT INTO LEE_B VALUES( 30);

COMMIT;

SELECT a.emp_id, b.emp_id
FROM lee_a a,
 lee_b b
WHERE a.emp_id(+) = b.emp_id(+);

SELECT a.emp_id, b.emp_id
FROM lee_a a
FULL OUTER JOIN lee_b b
ON (a.emp_id = b.emp_id);

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
FROM employees a,
     job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id(+) = b.department_id;
--두 개의 테이블을 outer-join할 수 없습니다

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;