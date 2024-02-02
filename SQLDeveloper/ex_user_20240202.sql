--Group By�� HAVING �� 

--�μ��� �ְ� �޿��� 3000 �̻��� �μ��� ��ȣ�� �μ��� �ְ� �޿� ���ϱ�
SELECT DNO, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 3000;

--�Ŵ����� �����ϰ� �޿� �Ѿ��� 5000 �̻��� ��� ����(job)�� �޿� �Ѿװ� �ش� �ο��� ���ϱ�
SELECT JOB, SUM(SALARY) AS TOTAL_SALARY, COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
WHERE MANAGER IS NULL
GROUP BY JOB
HAVING SUM(SALARY) >= 5000;

--�μ��� ��� �޿��� �ְ� ��� �޿��� ��ȸ�ϱ�
SELECT DNO, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) = (SELECT MAX(AVG_SALARY) FROM (
                        SELECT DNO, AVG(SALARY) AS AVG_SALARY
                        FROM EMPLOYEE
                        GROUP BY DNO
                      )
                    );
                    
--HJH_chap04_ex2
--SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����ϼ���.
SELECT ENO, SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM'), 1, 4) AS HIRE_YEAR, SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM'), 6, 2) AS HIRE_MONTH
FROM EMPLOYEE;

--SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����ϼ���.
SELECT ENO, ENAME, HIREDATE
FROM EMPLOYEE
WHERE SUBSTR(TO_CHAR(HIREDATE, 'MM'), 1, 2) = '04';

--MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����ϼ���.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE MOD(ENO, 2) = 0;

--�Ի����� ������ 2�ڸ�(YY), ���� ����(MON), ���� 2�ڸ�(DD)�� ǥ���ϰ�, ������ *����(DAY)�� �����Ͽ� ����ϼ���.
SELECT ENO, TO_CHAR(HIREDATE, 'YY-MM-DD *DAY') AS HIRE_DATE_INFO
FROM EMPLOYEE;

--������� �Ŵ��� ����� ����ϵ� manager�� ���� ����� ���ؼ��� NULL ��ſ� 0 �� ����ϼ���.
SELECT ENO, ENAME, NVL(MANAGER, 0) AS MANAGER
FROM EMPLOYEE;

--DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �ϼ���. ������ 'ANALYST'�� ����� 200, 'SALESMAN'�� ����� 180, 'MANAGER'��
--����� 150, 'CLERK'�� ����� 100�� �λ��ϼ���.
SELECT ENO, ENAME, JOB,
  DECODE(JOB, 'ANALYST', SALARY + 200, 'SALESMAN', SALARY + 180, 'MANAGER', SALARY + 150, 'CLERK', SALARY + 100, SALARY) AS UPDATED_SALARY
FROM EMPLOYEE;
