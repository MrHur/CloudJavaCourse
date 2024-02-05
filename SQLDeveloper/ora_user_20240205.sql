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