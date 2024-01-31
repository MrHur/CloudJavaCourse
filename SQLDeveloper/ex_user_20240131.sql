--허준혁_chap03_ex2
--quiz 1
--Employee테이블의 구조만 복사하여, EMP_INSERT란 빈 테이블을 만드세요.
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
--임의의 데이터를 EMP_INSERT 테이블에 추가하되, SYSDATE를 이용해서 입사일을 오늘로 입력하세요.
INSERT INTO EMP_INSERT(ENO, HIREDATE)
VALUES ('1', SYSDATE);

--quiz 3
--EMP_INSERT 테이블에 옆사람을 추가하되, SYSDATE를 이용해서 입사일을 오늘로 입력하세요.
INSERT INTO EMP_INSERT(ENO, HIREDATE)
VALUES ('2', SYSDATE);

--quiz 4
--Employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요.
CREATE TABLE EMP_COPY AS
SELECT * FROM Employee;

--quiz 5 EMP_COPY 테이블에서
--사원번호가 7788인 사원의 부서번호를 10으로 수정하세요.
UPDATE employees
SET DNO= 10
WHERE ENO = 7788;

--quiz 6
--Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요.
CREATE TABLE DEPT_COPY AS
SELECT * FROM Department;

--quiz 7
--DEPT_COPY테이블에서 부서명이 RESEARCH인 부서를 제거하세요.
DELETE FROM DEPT_COPY
WHERE DNAME = 'RESEARCH';

--quiz 8
--DEPT_COPY테이블에서 부서번호가 10이거나 40인 부서를 제거하세요.
DELETE FROM DEPT_COPY
WHERE DNO = '10'
OR DNO = '40';
