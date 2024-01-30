CREATE TABLE ex2_3 (
    COL_INT     INTEGER,
    COL_DEC     DECIMAL,
    COL_NUM     NUMBER
);

--SQL 또는 PL/SQL 구문에서 주석을 사용할 수 있습니다. 한 줄 전체를 주석 처리할 때는 "--" 문자를 서두에 명시하고,
/* 여러 줄을 주석 처리할 때는  
주석문을 사용합니다. */
--단축키는 컨트롤 슬래쉬 

SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user ex_user identified by 1234
DEFAULT TABLESPACE MYTS
TEMPORARY TABLESPACE temp;

grant dba to ex_user;

--날짜 데이터 타입
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