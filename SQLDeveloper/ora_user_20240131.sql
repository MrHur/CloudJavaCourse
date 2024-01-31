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

--AS 생략 가능
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
    
--VIEW 생성
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
VALUES ('GHI', 30); --에러

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
VALUES (10, 'LOW', '2024-01-01'); --수치 부적합 오류발생

CREATE TABLE ex3_2_1 (
    emp_id   NUMBER,
    emp_name VARCHAR2(100)
);

--데이터 타입 변경 : NUMBER -> VARCHAR2
--단, 기존에 입력돼 있는 값이 없어야 한다.
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

--의사컬럼
SELECT ROWNUM, employee_id
FROM employees;

SELECT ROWNUM, employee_id
FROM employees
WHERE ROWNUM <5;

SELECT ROWNUM, employee_id, ROWID
FROM employees
WHERE ROWNUM <5;

--quiz1 
--ex3_6이란 테이블을 만들고, 사원테이블(employees)에서 관리자사번이 124번이고
--급여가 2000에서 3000사이에 있는 사원의 사번, 사원명, 급여, 관리자사번을 입력하는 INSERT문을 작성해보자.
CREATE TABLE ex3_6 (
    employee_id   NUMBER(6),
    emp_name      VARCHAR2(80),
    salary        NUMBER(8,2),
    manager_id    NUMBER(6)
);

INSERT INTO ex3_6 
SELECT employee_id, emp_name, salary, manager_id
FROM employees a
WHERE a.manager_id = 124
  AND a.salary BETWEEN 2000 AND 3000;

SELECT * FROM EX3_6;

--연산자
SELECT employee_id || '-' || emp_name AS employee_info
FROM employees
WHERE ROWNUM < 5;

--표현식
SELECT employee_id, salary,
    CASE WHEN salary <= 5000 THEN 'C등급'
    WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
        ELSE 'A등급'
    END AS salary_grade
    FROM employees;
    
--조건식

--비교조건식
SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = 2000
OR salary = 3000
OR salary = 4000
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ALL (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = SOME (2000, 3000, 4000)
ORDER BY employee_id;

--논리조건식
SELECT employee_id, salary
FROM employees
--WHERE NOT (salary >= 2500)
WHERE salary < 2500
ORDER BY employee_id;

--BETWEEN AND 조건식
SELECT employee_id, salary
FROM employees
WHERE salary BETWEEN 2000 AND 2500 -- >=  2000 AND <=2500
ORDER BY employee_id;

--IN 조건식
SELECT employee_id, salary
FROM employees
WHERE salary IN (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary NOT  IN (2000, 3000, 4000)
ORDER BY employee_id;

--EXISTS 조건식
SELECT department_id, department_name
FROM departments a
WHERE EXISTS (SELECT *
                        FROM employees b
                        WHERE a.department_id = b.department_id
                            AND b.salary > 3000)
ORDER BY a.department_name;

--LIKE 조건식 (대소문자 구분 필수)
SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
ORDER BY emp_name;

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'Al%'
ORDER BY emp_name;

SELECT emp_name
FROM employees
WHERE emp_name LIKE '%s%'  --이름 안에 s를 포함하는 모든 이름
ORDER BY emp_name;

CREATE TABLE ex3_5 (
    names VARCHAR2(30)
);
INSERT INTO ex3_5 VALUES ('홍길동');

INSERT INTO ex3_5 VALUES ('홍길용');

INSERT INTO ex3_5 VALUES ('홍길상');

INSERT INTO ex3_5 VALUES ('홍길상동');

SELECT *
    FROM ex3_5
WHERE names LIKE '홍길%';

SELECT *
    FROM ex3_5
WHERE names LIKE '홍길_';

--quiz2

DELETE ex3_3;

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id
    FROM employees e, sales s
WHERE e.employee_id = s.employee_id
    AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;
    
COMMIT;

-- 관리자사번(manager_id)이 145번인 사원을 찾아 위 테이블에 있는 사원의 사번과
-- 일치하면 보너스 금액(bonus_amt)에 자신의 급여의 1%를 보너스로 갱신하고, 
-- ex3_3 테이블에 있는 사원의 사번과 일치하지 않는 사원을 신규 입력 
-- (이때 보너스 금액은 급여의 0.5%로 한다) 하는 MERGE 문을 작성해 보자.
MERGE INTO ex3_3 d
USING (
    SELECT e.employee_id, e.salary, e.manager_id
    FROM employees e
    WHERE e.manager_id = 145
) b
ON (d.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
WHEN NOT MATCHED THEN
    INSERT (employee_id, bonus_amt) VALUES (b.employee_id, b.salary * 0.005);

select * from ex3_3;
COMMIT;

--quiz3 
--사원테이블(employees)에서 커미션(commission_pct) 값이 없는 사원의 사번과 사원명을 추출하는 쿼리
SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL
ORDER BY employee_id;

--quiz4
--아래의 쿼리를 논리연산자로 변환해보자.
SELECT employee_id, salary
FROM employees
WHERE salary >= 2000
AND salary <= 2500
ORDER BY employee_id;

--quiz5
--다음 두 쿼리를 ANY, ALL 을 사용해서 동일한 결과를 추출하도록 변경해보자.
SELECT employee_id, salary
FROM employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary != ALL (2000, 3000, 4000)
ORDER BY employee_id;