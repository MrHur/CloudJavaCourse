CREATE TABLE ex2_3 (
    COL_INT     INTEGER,
    COL_DEC     DECIMAL,
    COL_NUM     NUMBER
);

--SQL �Ǵ� PL/SQL �������� �ּ��� ����� �� �ֽ��ϴ�. �� �� ��ü�� �ּ� ó���� ���� "--" ���ڸ� ���ο� ����ϰ�,
/* ���� ���� �ּ� ó���� ����  
�ּ����� ����մϴ�. */
--����Ű�� ��Ʈ�� ������ 

SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user ex_user identified by 1234
DEFAULT TABLESPACE MYTS
TEMPORARY TABLESPACE temp;

grant dba to ex_user;

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