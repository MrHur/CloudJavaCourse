--FILE_NAME : HJH_CHAP03_EX3
--QUIZ1
--���������� �̿��Ͽ� ��� ����� ���Ͽ� $300�� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿�(salary_plus)�� ����ϼ���.
SELECT ename, salary, (salary+300) AS salary_plus
FROM employee;

--QUIZ2
--����� �̸�, �޿�, ���� �Ѽ���(total_salary)�� �޿��� ���� �� ���� ���� ������ ����ϼ���. 
-- ���� �Ѽ����� ���޿� *12�� �� �� $100�� �󿩱��� ���ؼ� ����ϼ���.
SELECT ename, salary, salary * 12 + 100 AS  total_salary
FROM employee
ORDER BY salary DESC;

--QUIZ3
--�޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ����ϼ���.
SELECT ename, salary
FROM employee
WHERE salary > 2000
ORDER BY salary DESC;
--QUIZ4
--��� ��ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���.
SELECT ename, dno
FROM employee
WHERE eno = 7788;
--QUIZ5
--�޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����ϼ���.
SELECT ename, salary
FROM employee
WHERE salary < 2000 OR salary > 3000;
--QUIZ6
--1981�� 2�� 20��(81/02/20) ���� 1981�� 5�� 1��(81/05/01) ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����ϼ���.
SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN TO_DATE('81/02/20', 'YY/MM/DD') AND TO_DATE('81/05/01', 'YY/MM/DD');
--QUIZ7
--�μ� ��ȣ�� 20 �� 30�� ���ϴ� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ������������ ������ ������ ����ϼ���.
SELECT ename, dno
FROM employee
WHERE dno IN (20, 30)
ORDER BY  ename DESC;
--QUIZ8
--��� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸��� �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���.
SELECT ename, salary, dno
FROM employee
WHERE salary BETWEEN 2000 AND 3000
  AND dno IN (20, 30)
ORDER BY  ename ASC;

--QUIZ9
--1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����ϼ���(LIKE�����ڿ� ���ϵ�ī��(%) ���)
SELECT ename, hiredate
FROM employee
WHERE hiredate LIKE '81%';

--QUIZ10
--�����ڰ� ���� ����� �̸��� �������� ����ϼ���.
SELECT ename, job
FROM employee
WHERE MANAGER IS NULL;

--QUIZ11
--Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� ������������ �����Ͽ� ����ϼ���.
SELECT ename, salary, commission
FROM employee
WHERE commission IS NOT NULL
ORDER BY salary DESC, commission DESC;

--QUIZ12
--�̸��� ����° ���ڰ� R�� ����� ����ϼ���.
SELECT ename
FROM employee
WHERE ename LIKE '__R%';

--QUIZ13
--�̸��� A�� E�� ��� �����ϴ� ����� �̸��� ����ϼ���.
SELECT ename
FROM employee
WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--QUIZ14
--�������� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950, $1300�� �ƴ� ����� �̸�, ������, �޿��� ����ϼ���.
SELECT ename, job, salary
FROM employee
WHERE (job ='CLERK' OR job = 'SALESMAN')
AND salary  NOT IN (1600, 950, 1300);

--QUIZ15
--Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����ϼ���.
SELECT ename, salary, commission
FROM employee
WHERE commission >=500;

--FILE_NAME : HJH_CHAP03_EX4
--QUIZ1
--20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸�, �μ���ȣ�� ����ϴ� ��(v_em_dno)�� �����Ͻÿ�.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, dno
FROM employee
WHERE dno = 20;

--QUIZ2
--�̹� ������ ��(v_em_dno)�� ���ؼ� �޿��� ��� ���� ���� ����� �� �ֵ��� �����Ͻÿ�.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20;

--QUIZ3
--�̹� ������ ��(v_em_dno)�� ���ؼ� ���ٰ����� �����͸� �Է� �����ϵ��� ������ �ɾ� ���ÿ�.
GRANT SELECT ON v_em_dno TO ex_user;

COMMIT;
--QUIZ4
--���� �����͸� ��(v_em_dno)�� ���ؼ� �Է��� �� �� ��ȸ �غ��ÿ�.

-- employee ���̺� ������ �߰�
INSERT INTO employee (eno, ename, dno, salary, job)
SELECT  5100, 'Belita', 10, 1500, 'CLERK' FROM DUAL
UNION ALL
SELECT  5200, 'Erica', 20, 2300, 'ANALYST' FROM DUAL
UNION ALL
SELECT 5300, 'Kali', 30, 1750, 'SALESMAN' FROM DUAL
UNION ALL
SELECT 5400, 'Mia', 20, 950, 'ANALYST' FROM DUAL
UNION ALL
SELECT 5500, 'Zinna', 10, 1050, 'CLERK' FROM DUAL;

--������ ��� �並 ��ȸ�Ͻÿ�.
SELECT * FROM v_em_dno;

--QUIZ5
--�̹� ������ ��(v_em_dno)�� ���ؼ� �б� ���� �Ӽ�(with check option/with read only�� ���� �ο� �Ұ���)�� �ο��� ���ÿ�.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, job, salary, dno
FROM employee
WHERE dno = 20
WITH READ ONLY;

--QUIZ6
--���, ����̸�, �μ���ȣ�� �μ� �̸��� �����ִ� �並(emp_dept) �����Ͻÿ�.
CREATE OR REPLACE VIEW emp_dept AS
SELECT e.eno, e.ename, e.dno, d.dname
FROM employee e
JOIN department d ON e.dno = d.dno;

--QUIZ7
--������ ��� �並 ��ȸ�Ͻÿ�.
-- ex_user ��Ű������ v_em_dno �� ��ȸ
SELECT * FROM v_em_dno;

-- ex_user ��Ű������ emp_dept �� ��ȸ
SELECT * FROM emp_dept;

--QUIZ8
--������ ��(v_em_dno,emp_dept)�� �����Ͻÿ�.

-- v_em_dno �� ����
DROP VIEW v_em_dno;

-- emp_dept �� ����
DROP VIEW emp_dept;


