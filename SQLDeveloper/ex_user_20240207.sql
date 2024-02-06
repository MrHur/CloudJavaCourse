--��� ��ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�ϼ���.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE ENO = 7788;

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
