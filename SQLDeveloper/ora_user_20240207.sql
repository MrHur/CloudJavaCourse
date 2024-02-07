-- 익명블록
DECLARE
   vi_num NUMBER;
BEGIN
   vi_num := 100;
   
   DBMS_OUTPUT.PUT_LINE(vi_num);

END;

-- 연산자
DECLARE
  a INTEGER := 2**2*3**2;
BEGIN
  DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;

-- 주석
DECLARE
  -- 한 줄 주석, 변수선언
  a INTEGER := 2**2*3**2;
BEGIN
	/* 실행부
	   DBMS_OUTPUT을 이용한 변수값 출력 
	*/
  DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;

-- DML 문
DECLARE
  vs_emp_name    VARCHAR2(80); -- 사원명 변수
  vs_dep_name    VARCHAR2(80); -- 부서명 변수
BEGIN
  SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
   WHERE a.department_id = b.department_id
     AND a.employee_id = 100;


  DBMS_OUTPUT.PUT_LINE( vs_emp_name || ' - ' || vs_dep_name);
END;

DECLARE
  vs_emp_name employees.emp_name%TYPE;
  vs_dep_name departments.department_name%TYPE;
BEGIN
  SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
   WHERE a.department_id = b.department_id
     AND a.employee_id = 100;


  DBMS_OUTPUT.PUT_LINE( vs_emp_name || ' - ' || vs_dep_name);
END;
