--1. EMP 테이블의 구조만 복사하여 EMP_INSERT란 빈 테이블을 만드세요. 

CREATE TABLE emp_insert AS 
SELECT * FROM employee WHERE 1=0;

--2. 임의의 데이터를 EMP_INSERT테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요 

INSERT INTO emp_insert 
VALUES (1,'LEE','TEACHER',null,sysdate,2700,250,10); 

-- 3. EMP_INSERT 테이블에 옆사람을 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요

INSERT INTO emp_insert 
VALUES (2,'SEO','STUDENT',null,sysdate,2500,500,20); 

-- 4. Employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요.
CREATE TABLE emp_copy AS 
SELECT * FROM employee; 

--5. EMP_COPY테이블에서 사원번호가 7788인 사원의 부서번호를 10으로 수정하세요.
UPDATE emp_copy 
SET dno=10 
WHERE eno=7788; 

-- 6. Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요

CREATE TABLE dept_copy AS 
SELECT * FROM department; 

--7. DEPT_COPY테이블에서 부서명이 RESEARCH인 부서를 제거하세요.
DELETE FROM dept_copy 
WHERE dname='RESEARCH'; 

-- 8. DEPT_COPY테이블에서 부서번호가 10이거나 40인 부서를 제거하세요.
DELETE FROM dept_copy 
WHERE dno IN (10,40); 





