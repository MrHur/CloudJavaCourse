--eqaul(동등) 조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하세요.

SELECT
    e.ename,
    e.dno,
    d.dname
FROM
         employee e
    JOIN department d ON e.dno = d.dno
WHERE
    e.ename = 'SCOTT';
    
--Inner 조인과 ON연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하세요.

SELECT
    e.ename,
    d.dname,
    d.loc
FROM
         employee e
    JOIN department d ON e.dno = d.dno;

--INNER 조인 Using 연산자를 사용하여 10번 부서에 속하는 모든 담당업무의 고유 목록을 부서의 지역명을 포함하여 출력하세요.

SELECT
    dno,
    job,
    loc
FROM
         employee
    INNER JOIN department USING ( dno )
WHERE
    dno = 10;


--Equal 조인과 Wild카드를 사용해서 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요.

SELECT
    e.ename,
    d.dname
FROM
         employee e
    JOIN department d ON e.dno = d.dno
WHERE
    e.ename LIKE '%A%';
    
-- Self Join을 사용하여 사원의 이름및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요. 
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)

SELECT
  e1.ENAME AS Employee,
  e1.ENO AS "emp#",
  e2.ENAME AS Manager,
  e2.ENO AS "Mgr#"
FROM
  employee e1
JOIN
  employee e2 ON e1.MANAGER = e2.ENO;
  
--Self조인을 사용하여 지정한 사원(SCOTT)의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하세요.
--각 열의 별칭은 이름, 부서번호, 동료로 지정하세요.

SELECT
  e1.ENAME AS 이름,
  e1.DNO AS 부서번호,
  e2.ENAME AS 동료
FROM
  employee e1
JOIN
  employee e2 ON e1.DNO = e2.DNO
WHERE
  e1.ENAME = 'SCOTT' AND e1.ENO <> e2.ENO; --AND 이후에 <> 구문이 SCOTT 본인을 제외하는 구문임.

--Self 조인을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하세요.
    
SELECT
  e1.ENAME AS 이름,
  e1.HIREDATE AS 입사일
FROM
  employee e1
JOIN
  employee e2 ON e1.HIREDATE > e2.HIREDATE
WHERE
  e2.ENAME = 'WARD';    
  
--Self조인을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사입과 함께 출력하세요. 
--각 열의 별칭은 사원이름(Ename) 사원입사일(HIERDATE) 관리자 이름(Ename) 관리자 입사일(HIERDATE)로 출력하세요

SELECT
  e1.ENAME AS 사원이름,
  e1.HIREDATE AS 사원입사일,
  e2.ENAME AS 관리자이름,
  e2.HIREDATE AS 관리자입사일
FROM
  employee e1
JOIN
  employee e2 ON e1.MANAGER = e2.ENO
WHERE
  e1.HIREDATE <= e2.HIREDATE;