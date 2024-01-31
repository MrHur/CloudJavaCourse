--SELECT
SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
AND job_id = 'IT_PROG'
ORDER BY employee_Id desc;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
OR job_id = 'IT_PROG'
ORDER BY employee_Id desc;

--AS ���� ����
SELECT
    a.employee_id,
    a.emp_name,
    a.department_id,
    b.department_name AS dep_name
FROM
    employees   a,
    departments b
WHERE
    a.department_id = b.department_id;
    
--VIEW ����
CREATE OR REPLACE VIEW emp_dept_v3 AS
    SELECT
        a.employee_id,
        a.emp_name,
        a.department_id,
        b.department_name AS dep_name
    FROM
        employees   a,
        departments b
    WHERE
        a.department_id = b.department_id
--WITH CHECK OPTION;
    WITH READ ONLY;
    
INSERT INTO emp_dept_v3 VALUES (2, 'AA', 2, 'asd');

--INSERT
CREATE TABLE ex3_1 (
col1 VARCHAR2(10),
col2 NUMBER,
col3 DATE
);

INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, sysdate);

INSERT INTO ex3_1 (col3, col1, col2)
VALUES (SYSDATE, 'DEF', 20);

INSERT INTO ex3_1 (col1, col2, col3)
VALUES ('ABC', 10, 30);

INSERT INTO ex3_1
VALUES ('GHI', 10, sysdate);

INSERT INTO ex3_1 (col1, col2)
VALUES ('GHI', 20);

INSERT INTO ex3_1
VALUES ('GHI', 30); --����

CREATE TABLE ex3_2 (
    emp_id   NUMBER,
    emp_name VARCHAR2(100)
);

INSERT INTO ex3_2 (
    emp_id,
    emp_name
)
    SELECT
        employee_id,
        emp_name
    FROM
        employees
    WHERE
        salary > 5000;

INSERT INTO EX3_1 (COL1, COL2, COL3)
VALUES (10, '10', '2024-01-01');

INSERT INTO EX3_1 (COL1, COL2, COL3)
VALUES (10, 'LOW', '2024-01-01'); --��ġ ������ �����߻�

CREATE TABLE ex3_2_1 (
    emp_id   NUMBER,
    emp_name VARCHAR2(100)
);

--������ Ÿ�� ���� : NUMBER -> VARCHAR2
--��, ������ �Էµ� �ִ� ���� ����� �Ѵ�.
ALTER TABLE ex3_2_1 MODIFY emp_id VARCHAR2(10);


--UPDATE
SELECT *
FROM EX3_1;

UPDATE EX3_1
SET col2=50;

UPDATE ex3_1
SET    col3 = sysdate
WHERE    col3 = '';

UPDATE ex3_1
SET    col3 = sysdate
WHERE    col3 is null;

--MERGE
CREATE TABLE ex3_3 (
    employee_id   NUMBER,
    bonus_amt NUMBER DEFAULT 0
);

INSERT INTO ex3_3 ( employee_id )
    SELECT
        e.employee_id
    FROM
        employees e,
        sales     s
    WHERE
            e.employee_id = s.employee_id
        AND s.sales_month BETWEEN '200010' AND '200012'
    GROUP BY
        e.employee_id;
        
SELECT *
FROM ex3_3
ORDER BY employee_id;

SELECT employee_id, manager_id, salary, salary * 0.01
FROM employees
WHERE employee_id IN ( SELECT employee_id FROM ex3_3);

SELECT employee_id, manager_id, salary, salary * 0.01
FROM employees
WHERE employee_id NOT IN ( SELECT employee_id FROM ex3_3)
AND manager_id = 146;
--AND SALARY < 8000;

MERGE INTO ex3_3 d
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b
            ON (d.employee_id = b.employee_id)
            
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt =  d.bonus_amt + b.salary * 0.01
    DELETE WHERE(b.employee_id = 161)
WHEN NOT MATCHED THEN
    INSERT(d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
    WHERE (b.salary < 8000);
    
SELECT *
FROM ex3_3
ORDER BY employee_id;

--DELETE
DELETE ex3_3;

SELECT *
FROM ex3_3
ORDER BY employee_id;

SELECT partition_name
FROM user_tab_partitions
WHERE table_name = 'SALES';

DELETE SALES PARTITION (SALES_Q3_2000);

COMMIT;

--COMMIT, ROLLBACK, TRUNCATE
CREATE TABLE ex3_4 (
    employee_id NUMBER);

INSERT INTO ex3_4 VALUES (100);
COMMIT;

TRUNCATE TABLE ex3_4;

SELECT * FROM ex3_4;

--�ǻ��÷�
SELECT ROWNUM, employee_id
FROM employees;

SELECT ROWNUM, employee_id
FROM employees
WHERE ROWNUM <5;

SELECT ROWNUM, employee_id, ROWID
FROM employees
WHERE ROWNUM <5;

--quiz1 
--ex3_6�̶� ���̺��� �����, ������̺�(employees)���� �����ڻ���� 124���̰�
--�޿��� 2000���� 3000���̿� �ִ� ����� ���, �����, �޿�, �����ڻ���� �Է��ϴ� INSERT���� �ۼ��غ���.
CREATE TABLE ex3_6 (
    employee_id   NUMBER,
    emp_name      VARCHAR2(50),
    salary        NUMBER,
    manager_id    NUMBER
);

INSERT INTO ex3_6 (employee_id, emp_name, salary, manager_id)
SELECT employee_id, emp_name, salary, manager_id
FROM employees
WHERE manager_id = 124
  AND salary BETWEEN 2000 AND 3000;

SELECT * FROM EX3_6;