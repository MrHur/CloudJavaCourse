--사원 번호가 7788인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무)하세요.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE ENO = 7788;

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
