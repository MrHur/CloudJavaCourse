--��� ��ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�ϼ���.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE JOB = (SELECT JOB
    FROM EMPLOYEE
    WHERE ENO = 7788)
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
WHERE (DNO, SALARY) IN (SELECT DNO, MIN(SALARY)
                                     FROM EMPLOYEE
                                     GROUP BY DNO);

--�������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м���(ANALYST)�ƴ� ���(�����ȣ, �̸�, ������,�޿�)���� ǥ���ϼ���.
SELECT ENO, ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE JOB <> 'ANALYST'
AND SALARY < ANY ( SELECT SALARY
                               FROM EMPLOYEE
                               WHERE JOB = 'ANALYST');

--�Ŵ��� ���� ����� �̸��� ǥ���ϼ���.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NULL;

SELECT ENAME 
FROM EMPLOYEE
WHERE eno IN(SELECT ENO
                     FROM EMPLOYEE
                     WHERE MANAGER IS NULL);
--�Ŵ��� �ִ� ����� �̸��� ǥ���ϼ���.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL;

SELECT ENAME 
FROM EMPLOYEE
WHERE eno IN(SELECT ENO
                     FROM EMPLOYEE
                     WHERE MANAGER IS NOT NULL);
-- BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.(�� BLAKE�� ����)
-- <> BLAKE
SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE DNO = (
    SELECT DNO
    FROM EMPLOYEE
    WHERE ENAME = 'BLAKE')
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
WHERE DNO IN ( SELECT DNO 
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
                                              GROUP BY JOB));

--���������� ����(manager) ����� �����ȣ�� �̸��� ����ϼ���.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE ENO IN(SELECT MANAGER
                      FROM EMPLOYEE);
                      
--HJH_chap08_ex2
--1. IF���� ����Ͽ� KING ����� �μ���ȣ�� ���ͼ�, �μ� ��ȣ�� ���� �μ����� ����ϼ���.
DECLARE
    vn_department_id EMPLOYEE.DNO%TYPE;
    vn_department_name DEPARTMENT.DNAME%TYPE;
BEGIN
    -- KING ����� �μ� ��ȣ ���
    SELECT DNO INTO vn_department_id
    FROM EMPLOYEE
    WHERE ENAME = 'KING';

    -- �μ� ��ȣ�� ���� �μ��� ���
    IF vn_department_id IS NOT NULL THEN
        SELECT DNAME INTO vn_department_name
        FROM DEPARTMENT
        WHERE DNO = vn_department_id;

        -- �μ��� ���
        DBMS_OUTPUT.PUT_LINE('KING ����� �μ���: ' || vn_department_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('KING ����� �μ� ������ ã�� �� �����ϴ�.');
    END IF;
END;
/
--2. BASIC LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
vn_sum NUMBER := 0;
vn_cnt NUMBER := 1;
BEGIN

LOOP

    vn_sum := vn_sum + vn_cnt;
  vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����

  EXIT WHEN vn_cnt >11;  -- vn_cnt�� 10���� ũ�� ���� ����
DBMS_OUTPUT.PUT_LINE ('1���� 10������ ���� = '  || vn_sum);
END LOOP;

END;
--3 FOR LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
    v_sum NUMBER := 0;
    v_cnt NUMBER := 0;
BEGIN
    -- �ݺ����� ����Ͽ� cnt�� �ջ�
    FOR i IN 1..10 LOOP
        v_cnt := i; -- ���÷� i�� cnt�� ����մϴ�.
        v_sum := v_sum + v_cnt;
    END LOOP;

    -- ��� ���
    DBMS_OUTPUT.PUT_LINE('�ջ�� ��: ' || v_sum);
END;
/
--4. WHILE LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
    v_sum NUMBER := 0;
    v_cnt NUMBER := 1;
BEGIN
    -- �ݺ����� ����Ͽ� cnt�� �ջ�
    while v_cnt <=10
    loop
        v_sum := v_sum + v_cnt;
        v_cnt := v_cnt +1;
    END LOOP;

    -- ��� ���
    DBMS_OUTPUT.PUT_LINE('�ջ�� ��: ' || v_sum);
END;
/