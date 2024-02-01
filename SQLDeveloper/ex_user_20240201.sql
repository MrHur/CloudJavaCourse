--FILE_NAME : HJH_CHAP03_EX3
--QUIZ1
--덧셈연산을 이용하여 모든 사원에 대하여 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여(salary_plus)를 출력하세요.
SELECT ename, salary, (salary+300) AS salary_plus
FROM employee;

--QUIZ2
--사원의 이름, 급여, 연간 총수입(total_salary)을 급여가 많은 것 부터 작은 순으로 출력하세요. 
-- 연간 총수입은 월급에 *12를 한 후 $100의 상여금을 더해서 계산하세요.
SELECT ename, salary, salary * 12 + 100 AS  total_salary
FROM employee
ORDER BY salary DESC;

--QUIZ3
--급여가 2000이 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 출력하세요.
SELECT ename, salary
FROM employee
WHERE salary > 2000
ORDER BY salary DESC;
--QUIZ4
--사원 번호가 7788인 사원의 이름과 부서번호를 출력하세요.
SELECT ename, dno
FROM employee
WHERE eno = 7788;
--QUIZ5
--급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하세요.
SELECT ename, salary
FROM employee
WHERE salary < 2000 OR salary > 3000;
--QUIZ6
--1981년 2월 20일(81/02/20) 부터 1981년 5월 1일(81/05/01) 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하세요.
SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN TO_DATE('81/02/20', 'YY/MM/DD') AND TO_DATE('81/05/01', 'YY/MM/DD');
--QUIZ7
--부서 번호가 20 및 30에 속하는 사원의 이름과 부서번호를 출력하되 이름을 내림차순으로 영문자 순으로 출력하세요.
SELECT ename, dno
FROM employee
WHERE dno IN (20, 30)
ORDER BY  ename DESC;
--QUIZ8
--사원 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름과 급여와 부서번호를 출력하되 이름을 오름차순으로 출력하세요.
SELECT ename, salary, dno
FROM employee
WHERE salary BETWEEN 2000 AND 3000
  AND dno IN (20, 30)
ORDER BY  ename ASC;

--QUIZ9
--1981년도에 입사한 사원의 이름과 입사일을 출력하세요(LIKE연산자와 와일드카드(%) 사용)
SELECT ename, hiredate
FROM employee
WHERE hiredate LIKE '81%';

--QUIZ10
--관리자가 없는 사원의 이름과 담당업무를 출력하세요.
SELECT ename, job
FROM employee
WHERE MANAGER IS NULL;

--QUIZ11
--커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순으로 정렬하여 출력하세요.
SELECT ename, salary, commission
FROM employee
WHERE commission IS NOT NULL
ORDER BY salary DESC, commission DESC;

--QUIZ12
--이름의 세번째 문자가 R인 사원을 출력하세요.
SELECT ename
FROM employee
WHERE ename LIKE '__R%';

--QUIZ13
--이름에 A와 E를 모두 포함하는 사원의 이름을 출력하세요.
SELECT ename
FROM employee
WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--QUIZ14
--담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 급여가 $1600, $950, $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하세요.
SELECT ename, job, salary
FROM employee
WHERE (job ='CLERK' OR job = 'SALESMAN')
AND salary  NOT IN (1600, 950, 1300);

--QUIZ15
--커미션이 $500이상인 사원의 이름과 급여 및 커미션을 출력하세요.
SELECT ename, salary, commission
FROM employee
WHERE commission >=500;

--FILE_NAME : HJH_CHAP03_EX4
--QUIZ1
--20번 부서에 소속된 사원의 사원번호와 이름, 부서번호를 출력하는 뷰(v_em_dno)로 정의하시오.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, dno
FROM employee
WHERE dno = 20;

--QUIZ2
--이미 생성된 뷰(v_em_dno)에 대해서 급여와 담당 업무 역시 출력할 수 있도록 수정하시오.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20;

--QUIZ3
--이미 생성된 뷰(v_em_dno)를 통해서 접근가능한 데이터만 입력 가능하도록 제약을 걸어 보시오.
GRANT SELECT ON v_em_dno TO ex_user;

COMMIT;
--QUIZ4
--다음 데이터를 뷰(v_em_dno)를 통해서 입력을 한 뒤 조회 해보시오.

-- employee 테이블에 데이터 추가
INSERT INTO employee (eno, ename, dno, salary, job)
SELECT  5100, 'Belita', 10, 1500, 'CLERK' FROM DUAL
UNION ALL
SELECT  5200, 'Erica', 20, 2300, 'ANALYST' FROM DUAL
UNION ALL
SELECT 5300, 'Kali', 30, 1750, 'SALESMAN' FROM DUAL
UNION ALL
SELECT 5400, 'Mia', 20, 950, 'ANALYST' FROM DUAL
UNION ALL
SELECT 5500, 'Zinna', 10, 1050, 'CLERK' FROM DUAL;

--생성된 모든 뷰를 조회하시오.
SELECT * FROM v_em_dno;

--QUIZ5
--이미 생성된 뷰(v_em_dno)에 대해서 읽기 전용 속성(with check option/with read only는 동시 부여 불가능)을 부여해 보시오.
CREATE OR REPLACE VIEW v_em_dno AS
SELECT eno, ename, job, salary, dno
FROM employee
WHERE dno = 20
WITH READ ONLY;

--QUIZ6
--사번, 사원이름, 부서번호와 부서 이름을 보여주는 뷰를(emp_dept) 생성하시오.
CREATE OR REPLACE VIEW emp_dept AS
SELECT e.eno, e.ename, e.dno, d.dname
FROM employee e
JOIN department d ON e.dno = d.dno;

--QUIZ7
--생성된 모든 뷰를 조회하시오.
-- ex_user 스키마에서 v_em_dno 뷰 조회
SELECT * FROM v_em_dno;

-- ex_user 스키마에서 emp_dept 뷰 조회
SELECT * FROM emp_dept;

--QUIZ8
--생성된 뷰(v_em_dno,emp_dept)를 제거하시오.

-- v_em_dno 뷰 제거
DROP VIEW v_em_dno;

-- emp_dept 뷰 제거
DROP VIEW emp_dept;


