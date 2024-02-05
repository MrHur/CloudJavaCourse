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