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