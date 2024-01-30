CREATE TABLE ex2_3 (
    COL_INT     INTEGER,
    COL_DEC     DECIMAL,
    COL_NUM     NUMBER
);

--SQL 또는 PL/SQL 구문에서 주석을 사용할 수 있습니다. 한 줄 전체를 주석 처리할 때는 "--" 문자를 서두에 명시하고,
/* 여러 줄을 주석 처리할 때는  
주석문을 사용합니다. */

SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user ex_user identified by 1234
DEFAULT TABLESPACE MYTS
TEMPORARY TABLESPACE temp;

grant dba to ex_user;


