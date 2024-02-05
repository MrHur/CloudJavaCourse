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


--��������
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
        departments b
WHERE a.department_id = b.department_id;

--��������
SELECT department_id, department_name
FROM   departments a
WHERE EXISTS( SELECT *
                        FROM employees b
                        WHERE a.department_id = b.department_id
                        AND b.salary > 3000)
ORDER BY a.department_name;

--���� ���
SELECT department_id, department_name
FROM   departments a
WHERE a.department_id IN ( SELECT b.department_id
                        FROM employees b
                        WHERE b.salary > 3000)
ORDER BY department_name;

--�������ΰ� ��
SELECT a.department_id, a.department_name
FROM   departments a, employees b
WHERE a.department_id = b.department_id
    AND b.salary > 3000
ORDER BY a.department_name; 

--��Ƽ ����(ANTI JOIN)
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


--���� ����(SELF JOIN)
SELECT a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id 
FROM   employees a, employees b
WHERE a.employee_id < b.employee_id
    AND a.department_id = b.department_id
    AND a.department_id = 20;
    
-- �ܺ�����
-- �Ϲ� ���ΰ� ��
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

--īŸ�þ� ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a,
departments b;

--ANSI ����(����)
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

--ANSI �ܺ�����
--�ܺ�����
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
    

--CROSS ����
--ī�ٽþ� ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a,
departments b;

--ANSI CROSS ����
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM employees a
CROSS JOIN departments b;

--FULL OUTER ����
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
FROM employees a,
     job_history b
WHERE a.employee_id = b.employee_id(+)
AND a.department_id(+) = b.department_id;
--�� ���� ���̺��� outer-join�� �� �����ϴ�

SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a
LEFT JOIN job_history b
ON a.employee_id = b.employee_id 
AND a.department_id = b.department_id;