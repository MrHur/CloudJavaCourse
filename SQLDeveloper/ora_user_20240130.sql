CREATE TABLE ex2_3 (
    col_int INTEGER,
    col_dec DECIMAL,
    col_num NUMBER
);

--SQL �Ǵ� PL/SQL �������� �ּ��� ����� �� �ֽ��ϴ�. �� �� ��ü�� �ּ� ó���� ���� "--" ���ڸ� ���ο� ����ϰ�,
/* ���� ���� �ּ� ó���� ����  
�ּ����� ����մϴ�. */
--����Ű�� ��Ʈ�� ������ 

SELECT
    column_id,
    column_name,
    data_type,
    data_length
FROM
    user_tab_cols
WHERE
    table_name = 'EX2_3'
ORDER BY
    column_id;

--��¥ ������ Ÿ��
CREATE TABLE EX2_5 (
    COL_DATA   DATE,
    COL_TIMESTAMP TIMESTAMP
);

INSERT INTO ex2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
FROM ex2_5;

--NOT NULL
CREATE TABLE ex2_6 (
    COL_NULL        VARCHAR2(10),
    COL_NOT_NULL    VARCHAR2(10) NOT NULL
);

--INSERT INTO ex2_6 VALUES ('AA', '');
INSERT INTO ex2_6 VALUES ('AA', 'BB');
INSERT INTO ex2_6 VALUES ('', 'BB');

SELECT *
FROM ex2_6;

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6';

-- UNIQUE
CREATE TABLE ex2_7 (
    COL_UNIQUE_NULL     VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NNULL    VARCHAR2(10) UNIQUE NOT null,
    col_unique          VARCHAR2(10),
    constraints unique_nml UNIQUE(col_unique)
);

--constraint ����
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_7';

--�� �� ����, CTRL SHIFT D
INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');
INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');


--����� 73 �࿡�� �����ϴ� �� ���� �߻� -
--INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA')
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(ORA_USER.SYS_C008348)�� ����˴ϴ�
INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');
INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');

--�⺻Ű
CREATE TABLE ex2_8 (
    col1 VARCHAR2(10) PRIMARY KEY,
    col2 VARCHAR2(10)
);
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';

INSERT INTO ex2_8 VALUES ('', 'AA');
--����� 94 �࿡�� �����ϴ� �� ���� �߻� -
--INSERT INTO ex2_8 VALUES ('', 'AA')
--���� �߻� �����: 94 ��: 27
--���� ���� -
--SQL ����: ORA-01400: NULL�� ("ORA_USER"."EX2_8"."COL1") �ȿ� ������ �� �����ϴ�
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

INSERT INTO ex2_8 VALUES ('AA', 'AA');
--������ �� �� ������ �� ������ �߻��ϴ� ������ �⺻ Ű(primary key) ���� ���ǿ� ����Ǳ� �����Դϴ�.
--�⺻ Ű�� �� ���� �����ϰ� �ĺ��ϱ� ���� ���Ǹ�, �ߺ��� ���� ������� �ʽ��ϴ�. 
--��, �⺻ Ű ���� ������ ������ ������ ������ ���� �ߺ��ؼ� ������ �� �����ϴ�.

--�ܷ�Ű(Foreign Key)

--CHECK
CREATE TABLE ex2_9 (
    num1    NUMBER,
    CONSTRAINT check1 CHECK (num1 BETWEEN 1 AND 9),
    gender  VARCHAR2(10),
    CONSTRAINT check2 CHECK (gender IN ('MALE', 'FEMALE'))
);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_9';

INSERT INTO ex2_9 VALUES (10, 'MAN');

INSERT INTO ex2_9 VALUES (5, 'FEMALE');

SELECT *
FROM ex2_9;

--DEFAULT
CREATE TABLE ex2_10 (
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE
);

INSERT INTO ex2_10 (col1, col2) VALUES ('AA', 'AA');
SELECT *
FROM ex2_10;


DEFAULT ���� ������ �ش� ���� ���� �������� ���� �� �ڵ����� ���� �⺻���� �����մϴ�. �׷��� INSERT ������ ���� ���� ����� ��� DEFAULT ���� ������ ���õ˴ϴ�.

--���⼭ �����ؾ� �� �κ��� col2�� ���� DEFAULT ���� ������ �ƴ�, 
--�ش� ���� NULL�� �����ߴµ��� �ұ��ϰ� INSERT INTO ������ col2�� ���� ��������� �Է��߱� �����Դϴ�. 
--col2�� ���� �������� �ʾҴٸ� DEFAULT ���� ���ǿ� ���� NULL�� �ڵ����� ���ԵǾ��� ���Դϴ�.

--���̺� ����
DROP TABLE EX2_10;

--���̺� ����
CREATE TABLE ex2_10 (
    col1 VARCHAR2(10) NOT NULL,
    col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE
);
ALTER TABLE ex2_10 RENAME COLUMN col1 TO COL11;

DESC EX2_10;

ALTER TABLE ex2_10 MODIFY col2 VARCHAR2(30);

DESC EX2_10;

ALTER TABLE ex2_10 ADD col3 NUMBER;

DESC EX2_10;

ALTER TABLE ex2_10 DROP COLUMN col3;
DESC EX2_10;

ALTER TABLE ex2_10 ADD CONSTRAINTS pk_ex2_10 PRIMARY KEY (col11);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_10';

ALTER TABLE ex2_10 DROP CONSTRAINTS pk_ex2_10;

--���̺� ����
CREATE TABLE ex2_9_1 AS
SELECT *
FROM EX2_9;
