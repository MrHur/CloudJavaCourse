--1. EMP ���̺��� ������ �����Ͽ� EMP_INSERT�� �� ���̺��� ���弼��. 

CREATE TABLE emp_insert AS 
SELECT * FROM employee WHERE 1=0;

--2. ������ �����͸� EMP_INSERT���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ��� 

INSERT INTO emp_insert 
VALUES (1,'LEE','TEACHER',null,sysdate,2700,250,10); 

-- 3. EMP_INSERT ���̺� ������� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ���

INSERT INTO emp_insert 
VALUES (2,'SEO','STUDENT',null,sysdate,2500,500,20); 

-- 4. Employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ���弼��.
CREATE TABLE emp_copy AS 
SELECT * FROM employee; 

--5. EMP_COPY���̺��� �����ȣ�� 7788�� ����� �μ���ȣ�� 10���� �����ϼ���.
UPDATE emp_copy 
SET dno=10 
WHERE eno=7788; 

-- 6. Department ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� ���弼��

CREATE TABLE dept_copy AS 
SELECT * FROM department; 

--7. DEPT_COPY���̺��� �μ����� RESEARCH�� �μ��� �����ϼ���.
DELETE FROM dept_copy 
WHERE dname='RESEARCH'; 

-- 8. DEPT_COPY���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϼ���.
DELETE FROM dept_copy 
WHERE dno IN (10,40); 





