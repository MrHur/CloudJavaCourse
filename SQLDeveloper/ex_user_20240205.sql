--HJH_chap05_ex2

--모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요. 
--칼럼의 명칭은 최고액(Maximum) 최저액(Minimum), 총액(Sum), 평균(Average)로 지정하고 평균에 대해서는 정수로 반올림하세요.
SELECT 
  MAX(SALARY) AS Maximum, 
  MIN(SALARY) AS Minimum, 
  SUM(SALARY) AS Sum, 
  ROUND(AVG(SALARY)) AS Average 
FROM EMPLOYEE;

--각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하세요.
--칼럼의 명칭은 최고액(Maximum) 최저액(Minimum), 총액(Sum), 평균(Average)로 지정하고 평균에 대해서는 정수로 반올림하세요.
SELECT 
  JOB, 
  MAX(SALARY) AS Maximum, 
  MIN(SALARY) AS Minimum, 
  SUM(SALARY) AS Sum, 
  ROUND(AVG(SALARY)) AS Average 
FROM EMPLOYEE
GROUP BY JOB;

--Count(*) 함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요.
SELECT 
  JOB, 
  COUNT(*) AS Number_of_People 
FROM EMPLOYEE
GROUP BY JOB;

--관리자의 수를 나열하세요. 칼럼의 별칭은 COUNT(MANAGER)로 출력하세요.
SELECT 
  COUNT(DISTINCT(MANAGER)) AS "COUNT(MANAGER)"
FROM EMPLOYEE;

--급여 최고액, 급여 최저액의 차액을 출력하세요.
--칼럼의 별칭은 DIFFERENCE로 지정하세요.
SELECT 
  MAX(SALARY) - MIN(SALARY) AS Difference 
FROM EMPLOYEE;

--직급별 사원의 최저 급여를 출력하세요. 
--관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고,
--급여에 대한 내림차순으로 정렬하여 출력하세요.
SELECT 
  JOB, 
  MIN(SALARY) AS Minimum_Salary 
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL AND SALARY >= 2000
GROUP BY JOB
ORDER BY Minimum_Salary DESC;

--각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오.
--칼럼의 별칭은 부서번호(DNO), 사원수(Number of People), 평균급여(Salary)로 지정하고,
--평균급여는 소수점 2째자리에서 반올림 하세요.
SELECT 
  DNO, 
  COUNT(*) AS Number_of_People, 
  ROUND(AVG(SALARY), 2) AS Salary 
FROM EMPLOYEE
GROUP BY DNO;

----각 부서에 대해 부서번호이름, 지역명, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오.
--칼럼의 별칭은 부서번호이름(DName), 지역명(Location), 사원수(Number of People), 평균급여(Salary)로 지정하고,
--평균급여는 정수로 반올림 하세요.
SELECT
  D.DNO AS DName,
  D.LOC AS Location,
  COUNT(E.ENO) AS "Number of People",
  ROUND(AVG(DECODE(E.DNO, D.DNO, E.SALARY, NULL))) AS "Salary"
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E ON D.DNO = E.DNO
GROUP BY D.DNO, D.DNAME, D.LOC
ORDER BY DName;

select dno, decode(dno ,10,'ACCOUNTING'
                       ,20,'RESEARCH'
                       ,30,'SALES'
                       ,40,'OPERATIONS') as DName,
                       decode (dno,10,'NEW YORK'
                                  ,20,'DALLAS'
                                  ,30,'CHICAGO'
                                  ,40,'BOSTON') as Location
                         ,count(*)as "Number of PeoPle",round(avg(salary)) as Salary
  from employee
 group by dno
 order by dno;
                        

--업무를 표시한 다음 해당 업무에 대해 부서번호 별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오.
--칼럼의 별칭은 각각 job, 부서10, 부서20, 부서30, 총액으로 지정하세요.
SELECT
  JOB AS JOB, DNO,
  SUM(DECODE(DNO, 10, SALARY, 0)) AS "부서10",
  SUM(DECODE(DNO, 20, SALARY, 0)) AS "부서20",
  SUM(DECODE(DNO, 30, SALARY, 0)) AS "부서30",
  SUM(SALARY) AS "총액"
FROM EMPLOYEE
GROUP BY DNO, ROLLUP(JOB)
ORDER BY JOB;
