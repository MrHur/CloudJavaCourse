--1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요.  
-- 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요.  
-- 칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고  
-- 평균에 대해서는 정수로 반올림 하세요. 

SELECT MAX(salary) AS "MAXimum", 
       MIN(salary) AS "Minimun", 
       SUM(salary) AS "Sum", 
       ROUND(AVG(salary)) AS "Average" 
FROM employee; 

--2. 각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하세요.  
-- 칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고  
-- 평균에 대해서는 정수로 반올림 하세요. 
SELECT job AS "JOB", 
    MAX(salary) AS "MAXimum", 
    MIN(salary) AS "Minimun", 
    SUM(salary) AS "Sum", 
    ROUND(AVG(salary)) AS "Average" 
FROM employee 
GROUP BY job; 

--3. Count(*)함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요 
SELECT job, count(*) 
FROM employee 
GROUP BY job; 

--4. 관리자의 수를 나열하세요. 칼럼의 별칭은 MANAGER로 출력하세요. 
SELECT count(DISTINCT(manager)) as manager
 FROM employee; 

--5. 급여 최고액, 급여 최저액의 차액을 출력하세요. 칼럼의 별칭 DIFFERENCE로 지정하세요 
SELECT MAX(salary)-MIN(salary) AS "DIFFERENCE" 
FROM employee; 

--6. 직급별 사원의 최저 급여를 출력하세요.  
-- 관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고  
-- 급여에 대한 내림차순으로 정렬하여 출력하세요. 

SELECT job, MIN(salary)
FROM employee
WHERE manager is not null
GROUP BY job
HAVING NOT MIN(salary)<2000
ORDER BY AVG(salary) DESC;
  
--7. 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오,  
-- 칼럼의 별칭은 부서번호(DNO), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고  
-- 평균급여는 소수점 2째 자리에서 반올림 하세요. 
SELECT dno, 
    COUNT(*) AS "NUMBER OF PEOPLE", 
    ROUND(AVG(salary),2) AS "Salary" 
FROM employee 
GROUP BY dno 
ORDER BY dno ASC; 

--8. 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오. 
-- 칼럼의 별칭은 부서번호이름(DName), 지역명(Location), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고  
-- 평균급여는 정수로 반올림하세요. 
SELECT DECODE(dno, 10,'ACCOUNTING', 
                    20,'RESEARCH', 
                    30,'SALES', 
                    40,'OPERATIONS') AS "DName", 
             DECODE(dno, 10,'NEW YORK', 
                    20,'DALLAS', 
                    30,'CHICAGO', 
                    40,'BOSTON') AS "Location", 
             COUNT(*) AS "Number of People", 
             ROUND(avg(salary)) AS "Salary"
FROM employee 
GROUP BY dno; 

--  9.업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서 10,20,30의 급여 총액을 각각 출력하시오.  
-- 각 칼럼의 별칭은 각각 job, 부서10,부서20, 부서30, 총액으로 지정하세요. 
SELECT job, dno,
        DECODE(dno,10, SUM(salary)) AS "부서 10",
        DECODE(dno,20, SUM(salary)) AS "부서 20",
        DECODE(dno,30, SUM(salary)) AS "부서 30",
        SUM(salary) AS "총액"
FROM employee
GROUP BY dno, ROLLUP(JOB)
ORDER BY dno;











