--������_chap03_ex2
--quiz 1
--Employee���̺��� ������ �����Ͽ�, EMP_INSERT�� �� ���̺��� ���弼��.
CREATE TABLE EMP_INSERT (
ENO                  NUMBER(4, 0),
ENAME	            VARCHAR2(10 BYTE),
JOB	                VARCHAR2(9 BYTE),
MANAGER	        NUMBER(4,0),
HIREDATE        	DATE,
SALARY	        NUMBER(7,2),
COMMISSION	NUMBER(7,2),
DNO                 number(2, 0) 
);

--quiz 2
--������ �����͸� EMP_INSERT ���̺� �߰��ϵ�, SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ���.
INSERT INTO EMP_INSERT(ENO, HIREDATE)
VALUES ('1', SYSDATE);

--quiz 3
--EMP_INSERT ���̺� ������� �߰��ϵ�, SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ���.
INSERT INTO EMP_INSERT(ENO, HIREDATE)
VALUES ('2', SYSDATE);

--quiz 4
--Employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ���弼��.
CREATE TABLE EMP_COPY AS
SELECT * FROM Employee;

--quiz 5 EMP_COPY ���̺���
--�����ȣ�� 7788�� ����� �μ���ȣ�� 10���� �����ϼ���.
UPDATE employees
SET DNO= 10
WHERE ENO = 7788;

--quiz 6
--Department ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� ���弼��.
CREATE TABLE DEPT_COPY AS
SELECT * FROM Department;

--quiz 7
--DEPT_COPY���̺��� �μ����� RESEARCH�� �μ��� �����ϼ���.
DELETE FROM DEPT_COPY
WHERE DNAME = 'RESEARCH';

--quiz 8
--DEPT_COPY���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϼ���.
DELETE FROM DEPT_COPY
WHERE DNO = '10'
OR DNO = '40';
