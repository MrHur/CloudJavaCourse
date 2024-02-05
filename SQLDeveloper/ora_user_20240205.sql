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


