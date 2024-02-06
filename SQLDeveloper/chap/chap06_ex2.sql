--1. Equi조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하세요. 
SELECT e.ename, e.dno, d.dname 
  FROM employee e, department d
  WHERE e.dno = d.dno
   AND e.ename='SCOTT'; 

--2. Inner 조인과 on연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하세요. 
SELECT e.ename, d.dname, d.loc 
  FROM employee e
  INNER JOIN department d
    ON e.dno = d.dno; 
    
--3. INNER 조인 Using 연산자를 사용하여 10번 부서에 속하는 
--모든 담당업무의 고유 목록을 부서의 지역명을 포함하여 출력하세요. 
SELECT dno, job, loc 
FROM employee
INNER JOIN department 
USING(dno) 
WHERE dno=10; 

--4. Equal 조인과 Wild카드를 사용해서 
--이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요, 
SELECT e.ename, d.dname 
    FROM employee e, department d 
    WHERE e.dno=d.dno 
        AND e.ename LIKE '%A%'; 
        
--5. Self Join을 사용하여 사원의 이름및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요.  
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)         
SELECT e.ename AS "Employee", 
             e.manager AS "Emp#", 
             m.ename AS "Manager", 
             m.eno AS "Mgr#" 
    FROM employee e, employee m 
    WHERE e.manager = m.eno; 
    
--6. Self조인을 사용하여 지정한 사원의 이름('SCOTT'), 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하세요  
-- 각 열의 별칭은 이름, 부서번호, 동료로 지정하세요 
SELECT me.ename AS "이름", me.dno AS "부서번호", other.ename AS "동료" 
    FROM employee me, employee other 
  WHERE me.dno=other.dno 
    AND me.ename='SCOTT' 
    AND other.ename<>'SCOTT'; 
    
--7. Self 조인을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하세요.
SELECT other.ename, other.hiredate 
  FROM employee ward, employee other 
 WHERE other.hiredate > ward.hiredate 
   AND ward.ename='WARD'
 ORDER BY other.hiredate; 

-- 8. Self조인을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사입과 함께 출력하세요. 
-- 각 열의 별칭은 사원이름(Ename) 사원입사일(HIERDATE) 관리자 이름(Ename) 관리자 입사입(HIERDATE)로 출력하세요. 
SELECT other.ename AS "Ename", other.hiredate AS "HIERDATE",
            mgr.ename AS "Ename", mgr.hiredate AS "HIERDATE" 
    FROM employee mgr, employee other 
  WHERE other.manager = mgr.eno 
    AND other.hiredate <= mgr.hiredate; 









