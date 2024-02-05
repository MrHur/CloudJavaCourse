--HJH_chap05_ex2

--��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���. 
--Į���� ��Ī�� �ְ��(Maximum) ������(Minimum), �Ѿ�(Sum), ���(Average)�� �����ϰ� ��տ� ���ؼ��� ������ �ݿø��ϼ���.
SELECT 
  MAX(SALARY) AS Maximum, 
  MIN(SALARY) AS Minimum, 
  SUM(SALARY) AS Sum, 
  ROUND(AVG(SALARY)) AS Average 
FROM EMPLOYEE;

--�� ������ �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϼ���.
--Į���� ��Ī�� �ְ��(Maximum) ������(Minimum), �Ѿ�(Sum), ���(Average)�� �����ϰ� ��տ� ���ؼ��� ������ �ݿø��ϼ���.
SELECT 
  JOB, 
  MAX(SALARY) AS Maximum, 
  MIN(SALARY) AS Minimum, 
  SUM(SALARY) AS Sum, 
  ROUND(AVG(SALARY)) AS Average 
FROM EMPLOYEE
GROUP BY JOB;

--Count(*) �Լ��� �̿��ؼ� �������� ������ ����� ���� ����ϼ���.
SELECT 
  JOB, 
  COUNT(*) AS Number_of_People 
FROM EMPLOYEE
GROUP BY JOB;

--�������� ���� �����ϼ���. Į���� ��Ī�� COUNT(MANAGER)�� ����ϼ���.
SELECT 
  COUNT(MANAGER) AS "COUNT(MANAGER)"
FROM EMPLOYEE;

--�޿� �ְ��, �޿� �������� ������ ����ϼ���.
--Į���� ��Ī�� DIFFERENCE�� �����ϼ���.
SELECT 
  MAX(SALARY) - MIN(SALARY) AS Difference 
FROM EMPLOYEE;

--���޺� ����� ���� �޿��� ����ϼ���. 
--�����ڸ� �� �� ���� ��� �� ���� �޿��� 2000�̸��� �׷��� ���ܽ�Ű��,
--�޿��� ���� ������������ �����Ͽ� ����ϼ���.
SELECT 
  JOB, 
  MIN(SALARY) AS Minimum_Salary 
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL AND SALARY >= 2000
GROUP BY JOB
ORDER BY Minimum_Salary DESC;


--�� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�.
--Į���� ��Ī�� �μ���ȣ(DNO), �����(Number of People), ��ձ޿�(Salary)�� �����ϰ�,
--��ձ޿��� �Ҽ��� 2°�ڸ����� �ݿø� �ϼ���.
SELECT 
  DNO, 
  COUNT(*) AS Number_of_People, 
  ROUND(AVG(SALARY), 2) AS Salary 
FROM EMPLOYEE
GROUP BY DNO;

----�� �μ��� ���� �μ���ȣ�̸�, ������, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�.
--Į���� ��Ī�� �μ���ȣ�̸�(DName), ������(Location), �����(Number of People), ��ձ޿�(Salary)�� �����ϰ�,
--��ձ޿��� ������ �ݿø� �ϼ���.
SELECT
  D.DNO AS DName,
  D.LOC AS Location,
  COUNT(E.ENO) AS "Number of People",
  ROUND(AVG(DECODE(E.DNO, D.DNO, E.SALARY, NULL))) AS "Salary"
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.DNO = E.DNO
GROUP BY D.DNO, D.DNAME, D.LOC
ORDER BY DName;

--������ ǥ���� ���� �ش� ������ ���� �μ���ȣ �� �޿� �� �μ� 10, 20, 30�� �޿� �Ѿ��� ���� ����Ͻÿ�.
--Į���� ��Ī�� ���� job, �μ�10, �μ�20, �μ�30, �Ѿ����� �����ϼ���.
SELECT
  JOB AS JOB,
  SUM(DECODE(DNO, 10, SALARY, 0)) AS "�μ�10",
  SUM(DECODE(DNO, 20, SALARY, 0)) AS "�μ�20",
  SUM(DECODE(DNO, 30, SALARY, 0)) AS "�μ�30",
  SUM(SALARY) AS "�Ѿ�"
FROM EMPLOYEE
GROUP BY JOB
ORDER BY JOB;