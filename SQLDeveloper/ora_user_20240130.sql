CREATE TABLE ex2_3 (
    COL_INT     INTEGER,
    COL_DEC     DECIMAL,
    COL_NUM     NUMBER
);

--SQL �Ǵ� PL/SQL �������� �ּ��� ����� �� �ֽ��ϴ�. �� �� ��ü�� �ּ� ó���� ���� "--" ���ڸ� ���ο� ����ϰ�,
/* ���� ���� �ּ� ó���� ����  
�ּ����� ����մϴ�. */

SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user ex_user identified by 1234
DEFAULT TABLESPACE MYTS
TEMPORARY TABLESPACE temp;

grant dba to ex_user;


