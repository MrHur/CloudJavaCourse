--���� ������

CREATE TABLE exp_goods_asia (
    country VARCHAR2(10),
    seq     NUMBER,
    goods VARCHAR2(80));
    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5, 'LCD');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6, '�ڵ�����ǰ');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7, '�޴���ȭ');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8, 'ȯ��źȭ����');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');    
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');

INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');    
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

COMMIT;

SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
ORDER BY seq;

SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�'
ORDER BY seq;


SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

-- �ߺ� �����͵� ǥ��
SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION ALL
SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

-- ������ ������ ǥ��
SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
INTERSECT
SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

--������ ������ ǥ��
SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
MINUS
SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�'
MINUS
SELECT goods
  FROM exp_goods_asia
WHERE country = '�ѱ�';

-- ������ goods �� ������ ��쿡��, 5���� �����Ͱ� ���� �Ǿ��µ�, seq, goods�� ���� ��ȸ�������� 2���� ���ܵǾ���.
-- UNION���� ��ȸ�� ��� 2������ ��� �����ϴ� �ߺ��� ���� ��. 
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
INTERSECT
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�';

SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�ѱ�'
UNION
SELECT seq, goods
  FROM exp_goods_asia
WHERE country = '�Ϻ�'
ORDER BY goods;

--GROUPING SETS
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY GROUPING SETS(period, gubun);

SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
    AND region IN('����', '���')
GROUP BY GROUPING SETS(period, (gubun, region));

--HJH_chap05_ex1
--������̺� (employees) ���� �Ի�⵵�� ������� ���ϴ� ������ �ۼ��غ���.
SELECT TO_CHAR(hire_date, 'YYYY') AS �Ի�⵵, COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY �Ի�⵵;

--kor_loan_status ���̺��� 2012�⵵ ����, ������ ���� �� �ܾ��� ���ϴ� ������ �ۼ��϶�.
SELECT period, region, SUM(loan_jan_amt) AS total_loan_amt
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;

--�Ʒ��� ������ ���� ROLLUP�� ������ �����̴�.
 SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun);
--�� ������ ROLLUP�� ������� �ʰ�, ���տ����ڸ� ����ؼ� ������ ����� �������� ������ �ۼ��غ���.
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
--���� ������ �����ؼ� ����� Ȯ���� ��, ���տ����ڸ� ����� ������ ����� �����ϵ��� ������ �ۼ��غ���.
SELECT period,
     CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸�����,
     CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
  FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

SELECT period, SUM(CASE WHEN gubun = '���ô㺸����' THEN loan_jan_amt ELSE 0 END) AS ���ô㺸�����, 0 AS ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period
UNION ALL
SELECT period, 0 AS ���ô㺸�����, SUM(CASE WHEN gubun = '��Ÿ����' THEN loan_jan_amt ELSE 0 END) AS ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period
ORDER BY period;

--������ ���� ����, �� ������ �� ���� �������ܾ��� ���ϴ� ������ �ۼ��� ����.

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


