--��� ��ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�ϼ���.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE JOB = (
    SELECT JOB
    FROM EMPLOYEE
    WHERE ENO = 7788
)
AND ENO <> 7788;
--�����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ������)�ϼ���
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY
                            FROM EMPLOYEE
                            WHERE ENO = 7499);

--�ּ� �޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���ϼ���.(�׷��Լ�)
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                            FROM EMPLOYEE);
                            
--��� �޿��� ���� ���� ������ ã�� ���ް� ��� �޿��� ǥ���ϼ���. (having �� ���)
SELECT 
    JOB,
    AVG(SALARY) AS ��ձ޿�
FROM 
    EMPLOYEE
GROUP BY 
    JOB
HAVING 
    AVG(SALARY) = (SELECT MIN(AVG_SALARY) 
                   FROM (SELECT AVG(SALARY) AS AVG_SALARY 
                         FROM EMPLOYEE
                         GROUP BY JOB));
                         
-- �� �μ��� �ּұ޿��� �޴� ��� �̸�,�޿�,�μ���ȣ�� ǥ���ϼ���.
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE (DNO, SALARY) IN (
    SELECT DNO, MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
);

--�������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м���(ANALYST)�ƴ� ���(�����ȣ, �̸�, ������,�޿�)���� ǥ���ϼ���.
SELECT ENO, ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE JOB <> 'ANALYST'
AND SALARY < ANY (
    SELECT SALARY
    FROM EMPLOYEE
    WHERE JOB = 'ANALYST'
);

--�Ŵ��� ���� ����� �̸��� ǥ���ϼ���.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NULL;

--�Ŵ��� �ִ� ����� �̸��� ǥ���ϼ���.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL;

-- BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.(�� BLAKE�� ����)
-- <> BLAKE
SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE DNO = (
    SELECT DNO
    FROM EMPLOYEE
    WHERE ENAME = 'BLAKE'
)
AND ENAME <> 'BLAKE';

--�޿��� ��պ��� ���� ������� �����ȣ�� �̸��� ǥ���ϵ�, ����� �޿��� ���� ������������ �����ϼ���.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY)
                                    FROM EMPLOYEE)
ORDER BY SALARY ASC;

--�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.
--ENAME ='%K%'
--AND ENAME NOT LIKE '%K%';  /���� ����.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE DNO IN  (SELECT DNO
                                FROM EMPLOYEE
                                WHERE ENAME LIKE '%K%')
AND ENAME NOT LIKE '%K%';

--�μ���ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� �������� ǥ���ϼ���.
SELECT ENAME, DNO, JOB
FROM EMPLOYEE 
WHERE DNO IN (
                        SELECT DNO 
                        FROM DEPARTMENT
                        WHERE LOC = 'DALLAS');
                        
--KING���� �����ϴ� ����� �̸��� �޿��� ǥ���ϼ���.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE MANAGER IN ( SELECT ENO
                        FROM EMPLOYEE
                        WHERE ENAME = 'KING');
                        
--RESEARCH �μ��� ����� ���� �μ���ȣ, �����ȣ �� �������� ����ϼ���
SELECT DNO, ENO, JOB
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
                    FROM DEPARTMENT
                    WHERE DNAME = 'RESEARCH');
            
--��� �޿����� ���� �޿��� �ް� �̸����� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ����ϼ���.
SELECT ENO, ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY  > (SELECT AVG(SALARY)
                            FROM EMPLOYEE)
        AND DNO IN ( SELECT DNO 
                            FROM EMPLOYEE 
                            WHERE ENAME LIKE '%M%');

--��ձ޿��� ���� ���� ������ ã������. (having �� ���)
SELECT JOB, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY JOB
HAVING AVG(SALARY) = (SELECT MIN(AVG_SALARY)
                                    FROM (SELECT AVG(SALARY) AS AVG_SALARY
                                              FROM EMPLOYEE
                                              GROUP BY JOB) 
);

--���������� ����(manager) ����� �����ȣ�� �̸��� ����ϼ���.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL;