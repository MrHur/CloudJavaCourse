--Group By와 HAVING 절 

--부서별 최고 급여가 3000 이상인 부서의 번호와 부서별 최고 급여 구하기
SELECT DNO, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 3000;

--매니저를 제외하고 급여 총액이 5000 이상인 담당 업무(job)별 급여 총액과 해당 인원을 구하기
SELECT JOB, SUM(SALARY) AS TOTAL_SALARY, COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
WHERE MANAGER IS NULL
GROUP BY JOB
HAVING SUM(SALARY) >= 5000;

--부서별 평균 급여중 최고 평균 급여를 조회하기
SELECT DNO, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) = (SELECT MAX(AVG_SALARY) FROM (
                        SELECT DNO, AVG(SALARY) AS AVG_SALARY
                        FROM EMPLOYEE
                        GROUP BY DNO
                      )
                    );
                    
--HJH_chap04_ex2
--SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하세요.
SELECT ENO, SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM'), 1, 4) AS HIRE_YEAR, SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM'), 6, 2) AS HIRE_MONTH
FROM EMPLOYEE;

--SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하세요.
SELECT ENO, ENAME, HIREDATE
FROM EMPLOYEE
WHERE SUBSTR(TO_CHAR(HIREDATE, 'MM'), 1, 2) = '04';

--MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하세요.
SELECT ENO, ENAME
FROM EMPLOYEE
WHERE MOD(ENO, 2) = 0;

--입사일을 연도는 2자리(YY), 월은 숫자(MON), 일은 2자리(DD)로 표시하고, 요일은 *요일(DAY)로 지정하여 출력하세요.
SELECT ENO, TO_CHAR(HIREDATE, 'YY-MM-DD *DAY') AS HIRE_DATE_INFO
FROM EMPLOYEE;

--사원들의 매니저 사번을 출력하되 manager가 없는 사원에 대해서는 NULL 대신에 0 을 출력하세요.
SELECT ENO, ENAME, NVL(MANAGER, 0) AS MANAGER
FROM EMPLOYEE;

--DECODE 함수로 직급에 따라 급여를 인상하도록 하세요. 직급이 'ANALYST'인 사원은 200, 'SALESMAN'인 사원은 180, 'MANAGER'인
--사원은 150, 'CLERK'인 사원은 100을 인상하세요.
SELECT ENO, ENAME, JOB,
  DECODE(JOB, 'ANALYST', SALARY + 200, 'SALESMAN', SALARY + 180, 'MANAGER', SALARY + 150, 'CLERK', SALARY + 100, SALARY) AS UPDATED_SALARY
FROM EMPLOYEE;
