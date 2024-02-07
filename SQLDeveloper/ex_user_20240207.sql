--사원 번호가 7788인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무)하세요.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE JOB = (SELECT JOB
    FROM EMPLOYEE
    WHERE ENO = 7788)
AND ENO <> 7788;

--사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당업무)하세요
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY
                            FROM EMPLOYEE
                            WHERE ENO = 7499);

--최소 급여를 받는 사원의 이름, 담당업무 및 급여를 표시하세요.(그룹함수)
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                            FROM EMPLOYEE);
                            
--평균 급여가 가장 적은 업무를 찾아 직급과 평균 급여를 표시하세요. (having 절 사용)
SELECT 
    JOB,
    AVG(SALARY) AS 평균급여
FROM 
    EMPLOYEE
GROUP BY 
    JOB
HAVING 
    AVG(SALARY) = (SELECT MIN(AVG_SALARY) 
                   FROM (SELECT AVG(SALARY) AS AVG_SALARY 
                         FROM EMPLOYEE
                         GROUP BY JOB));
                         
-- 각 부서의 최소급여를 받는 사원 이름,급여,부서번호를 표시하세요.
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE (DNO, SALARY) IN (SELECT DNO, MIN(SALARY)
                                     FROM EMPLOYEE
                                     GROUP BY DNO);

--담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가(ANALYST)아닌 사원(사원번호, 이름, 담당업무,급여)들을 표시하세요.
SELECT ENO, ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE JOB <> 'ANALYST'
AND SALARY < ANY ( SELECT SALARY
                               FROM EMPLOYEE
                               WHERE JOB = 'ANALYST');

--매니저 없는 사원의 이름을 표시하세요.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NULL;

SELECT ENAME 
FROM EMPLOYEE
WHERE eno IN(SELECT ENO
                     FROM EMPLOYEE
                     WHERE MANAGER IS NULL);
--매니저 있는 사원의 이름을 표시하세요.
SELECT ENAME 
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL;

SELECT ENAME 
FROM EMPLOYEE
WHERE eno IN(SELECT ENO
                     FROM EMPLOYEE
                     WHERE MANAGER IS NOT NULL);
-- BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하세요.(단 BLAKE는 제외)
-- <> BLAKE
SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE DNO = (
    SELECT DNO
    FROM EMPLOYEE
    WHERE ENAME = 'BLAKE')
AND ENAME <> 'BLAKE';

--급여가 평균보다 많은 사원들의 사원번호와 이름을 표시하되, 결과를 급여에 대한 오름차순으로 정렬하세요.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY)
                                    FROM EMPLOYEE)
ORDER BY SALARY ASC;

--이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하는 질의를 작성하세요.
--ENAME ='%K%'
--AND ENAME NOT LIKE '%K%';  /본인 제외.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE DNO IN  (SELECT DNO
                                FROM EMPLOYEE
                                WHERE ENAME LIKE '%K%')
AND ENAME NOT LIKE '%K%';

--부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하세요.
SELECT ENAME, DNO, JOB
FROM EMPLOYEE 
WHERE DNO IN ( SELECT DNO 
                        FROM DEPARTMENT
                        WHERE LOC = 'DALLAS');
                        
--KING에게 보고하는 사원의 이름과 급여를 표시하세요.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE MANAGER IN ( SELECT ENO
                        FROM EMPLOYEE
                        WHERE ENAME = 'KING');
                        
--RESEARCH 부서의 사원에 대한 부서번호, 사원번호 및 담당업무를 출력하세요
SELECT DNO, ENO, JOB
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
                    FROM DEPARTMENT
                    WHERE DNAME = 'RESEARCH');
            
--평균 급여보다 많은 급여를 받고 이름에서 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 출력하세요.
SELECT ENO, ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY  > (SELECT AVG(SALARY)
                            FROM EMPLOYEE)
        AND DNO IN ( SELECT DNO 
                            FROM EMPLOYEE 
                            WHERE ENAME LIKE '%M%');

--평균급여가 가장 적은 업무를 찾으세요. (having 절 사용)
SELECT JOB, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY JOB
HAVING AVG(SALARY) = (SELECT MIN(AVG_SALARY)
                                    FROM (SELECT AVG(SALARY) AS AVG_SALARY
                                              FROM EMPLOYEE
                                              GROUP BY JOB));

--부하직원을 가진(manager) 사원의 사원번호와 이름을 출력하세요.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE ENO IN(SELECT MANAGER
                      FROM EMPLOYEE);
                      
--HJH_chap08_ex2
--1. IF문을 사용하여 KING 사원의 부서번호를 얻어와서, 부서 번호에 따른 부서명을 출력하세요.
DECLARE
    vn_department_id EMPLOYEE.DNO%TYPE;
    vn_department_name DEPARTMENT.DNAME%TYPE;
BEGIN
    -- KING 사원의 부서 번호 얻기
    SELECT DNO INTO vn_department_id
    FROM EMPLOYEE
    WHERE ENAME = 'KING';

    -- 부서 번호에 따른 부서명 얻기
    IF vn_department_id IS NOT NULL THEN
        SELECT DNAME INTO vn_department_name
        FROM DEPARTMENT
        WHERE DNO = vn_department_id;

        -- 부서명 출력
        DBMS_OUTPUT.PUT_LINE('KING 사원의 부서명: ' || vn_department_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('KING 사원의 부서 정보를 찾을 수 없습니다.');
    END IF;
END;
/
--2. BASIC LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
vn_sum NUMBER := 0;
vn_cnt NUMBER := 1;
BEGIN

LOOP

    vn_sum := vn_sum + vn_cnt;
  vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가

  EXIT WHEN vn_cnt >11;  -- vn_cnt가 10보다 크면 루프 종료
DBMS_OUTPUT.PUT_LINE ('1부터 10까지의 총합 = '  || vn_sum);
END LOOP;

END;
--3 FOR LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    v_sum NUMBER := 0;
    v_cnt NUMBER := 0;
BEGIN
    -- 반복문을 사용하여 cnt를 합산
    FOR i IN 1..10 LOOP
        v_cnt := i; -- 예시로 i를 cnt로 사용합니다.
        v_sum := v_sum + v_cnt;
    END LOOP;

    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('합산된 값: ' || v_sum);
END;
/
--4. WHILE LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    v_sum NUMBER := 0;
    v_cnt NUMBER := 1;
BEGIN
    -- 반복문을 사용하여 cnt를 합산
    while v_cnt <=10
    loop
        v_sum := v_sum + v_cnt;
        v_cnt := v_cnt +1;
    END LOOP;

    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('합산된 값: ' || v_sum);
END;
/