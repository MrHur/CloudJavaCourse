CREATE TABLE ex2_3 (
    col_int INTEGER,
    col_dec DECIMAL,
    col_num NUMBER
);

--SQL 또는 PL/SQL 구문에서 주석을 사용할 수 있습니다. 한 줄 전체를 주석 처리할 때는 "--" 문자를 서두에 명시하고,
/* 여러 줄을 주석 처리할 때는  
주석문을 사용합니다. */
--단축키는 컨트롤 슬래쉬 

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
    CONSTRAINT unique_nml UNIQUE(col_unique)
);

--constraint 제약
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_7';

--한 줄 복사, CTRL SHIFT D
INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');
INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');


--명령의 73 행에서 시작하는 중 오류 발생 -
--INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA')
--오류 보고 -
--ORA-00001: 무결성 제약 조건(ORA_USER.SYS_C008348)에 위배됩니다
INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');
INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');

--기본키
CREATE TABLE ex2_8 (
    col1 VARCHAR2(10) PRIMARY KEY,
    col2 VARCHAR2(10)
);
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';

INSERT INTO ex2_8 VALUES ('', 'AA');
--명령의 94 행에서 시작하는 중 오류 발생 -
--INSERT INTO ex2_8 VALUES ('', 'AA')
--오류 발생 명령행: 94 열: 27
--오류 보고 -
--SQL 오류: ORA-01400: NULL을 ("ORA_USER"."EX2_8"."COL1") 안에 삽입할 수 없습니다
--01400. 00000 -  "cannot insert NULL into (%s)"
--*Cause:    An attempt was made to insert NULL into previously listed objects.
--*Action:   These objects cannot accept NULL values.

INSERT INTO ex2_8 VALUES ('AA', 'AA');
--구문을 두 번 실행할 때 에러가 발생하는 이유는 기본 키(primary key) 제약 조건에 위배되기 때문입니다.
--기본 키는 각 행을 고유하게 식별하기 위해 사용되며, 중복된 값을 허용하지 않습니다. 
--즉, 기본 키 제약 조건이 설정된 열에는 동일한 값을 중복해서 삽입할 수 없습니다.

--외래키(Foreign Key)

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


--DEFAULT 제약 조건은 해당 열에 값을 지정하지 않을 때 자동으로 사용될 기본값을 정의합니다. 그러나 INSERT 문에서 직접 값을 명시할 경우 DEFAULT 제약 조건은 무시됩니다.

--여기서 주의해야 할 부분은 col2에 대한 DEFAULT 제약 조건이 아닌, 
--해당 열을 NULL로 지정했는데도 불구하고 INSERT INTO 문에서 col2에 값을 명시적으로 입력했기 때문입니다. 
--col2에 값을 지정하지 않았다면 DEFAULT 제약 조건에 따라 NULL이 자동으로 삽입되었을 것입니다.

--테이블 삭제
DROP TABLE EX2_10;

--테이블 변경
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

ALTER TABLE ex2_10 ADD CONSTRAINT pk_ex2_10 PRIMARY KEY (col11);

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_10';

ALTER TABLE ex2_10 DROP CONSTRAINT pk_ex2_10;

--테이블 복사
CREATE TABLE ex2_9_1 AS
SELECT *
FROM EX2_9;

CREATE TABLE ex2_10_1 AS
SELECT col11
FROM EX2_10;

select *
from ex2_10_1;
--quiz1
CREATE TABLE orders (
    order_id     NUMBER(12, 0) PRIMARY KEY,
    order_date   DATE,
    order_mode   VARCHAR2(8 BYTE) CHECK ( order_mode IN ( 'direct', 'online' ) ),
    customer_id  NUMBER(6, 0),
    order_status NUMBER(2, 0),
    order_total  NUMBER(8, 2) DEFAULT 0,
    sales_rep_id NUMBER(6, 0),
    promotion_id NUMBER(6, 0)
);

--quiz2
--primary key 가 복수일 때,
CREATE TABLE order_items (
    order_id     NUMBER(12, 0),
    line_item_id NUMBER(3, 0),
    order_mode   VARCHAR2(8 BYTE),
    product_id   NUMBER(3, 0),
    unit_price   NUMBER(8, 2) DEFAULT 0,
    quantity     NUMBER(8, 0) DEFAULT 0,
    PRIMARY KEY (order_id, line_item_id)
);
--quiz3
CREATE TABLE promotions (
    PROMO_ID   NUMBER(6, 0),
    PROMO_NAME VARCHAR2(20),
    CONSTRAINT PK_PROMOTIONS PRIMARY KEY (PROMO_ID)
);

--CREATE TABLE HELLO (
--    order_id     NUMBER(12, 0) PRIMARY KEY,
--    line_item_id NUMBER(3, 0),
--    order_mode   VARCHAR2(8 BYTE),
--    product_id   NUMBER(3, 0) PRIMARY KEY,
--    unit_price   NUMBER(8, 2) DEFAULT 0,
--    quantity     NUMBER(8, 0) DEFAULT 0,
--);

SELECT a.employee_id, a.emp_name, a.department_id,
       b.department_name   -- 부서명 컬럼
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id;
    
CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT a.employee_id, a.emp_name, a.department_id,
       b.department_name   -- 부서명 컬럼
  FROM employees a,
       departments b
 WHERE a.department_id = b.department_id;
 
SELECT *
  FROM emp_dept_v1;  


--인덱스
CREATE UNIQUE INDEX ex2_10_ix01
ON ex2_10 (col11);

SELECT index_name, index_type, table_name, uniqueness
   FROM  user_indexes
  WHERE table_name = 'EX2_10';
  
SELECT constraint_name, constraint_type, table_name, index_name
FROM user_constraints
WHERE table_name = 'JOB_HISTORY';

SELECT index_name, index_type, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'JOB_HISTORY';

CREATE INDEX ex2_10_ix02
ON ex2_10 (col11, col2);

SELECT index_name, index_type, table_name, uniqueness
   FROM  user_indexes
  WHERE table_name = 'EX2_10';
  
  DROP INDEX EX2_10_IX02;
  
--시노님
CREATE OR REPLACE SYNONYM syn_channel
FOR channels;

SELECT    COUNT(*)
FROM    syn_channel;

--ex_user
SELECT    COUNT(*)
FROM    ora_user.syn_channel;

CREATE OR REPLACE PUBLIC SYNONYM syn_channel2
FOR dept;

GRANT SELECT ON syn_channel2 TO PUBLIC;

--ora_user
SELECT    COUNT(*)
FROM    syn_channel2;

DROP SYNONYM syn_channel;

DROP PUBLIC SYNONYM syn_channel2;

--시퀀스
CREATE SEQUENCE my_seq1
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

DELETE EX2_8;  --테이블 삭제가 아니고, 기존의 데이터를 삭제.

INSERT INTO ex2_8 ( col1 ) VALUES ( my_seq1.NEXTVAL );

SELECT my_seq1.CURRVAL
FROM DUAL;
SELECT my_seq1.NEXTVAL
FROM DUAL;

DROP SEQUENCE my_seq1;

--quiz4
CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1000
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOORDER
NOCACHE;

