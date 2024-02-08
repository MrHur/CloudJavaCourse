-- NULL 문
IF vn_variable = 'A' THEN
   처리로직1;
ELSIF vn_variable = 'B' THEN
   처리로직2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          처리로직1;
     WHEN vn_variable = 'B' THEN
          처리로직2;      
     ...
     ELSE NULL;
END CASE;     


-- 함수

CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )
   RETURN NUMBER  -- 반환 데이터타입은 NUMBER
IS
   vn_remainder NUMBER := 0; -- 반환할 나머지
   vn_quotient  NUMBER := 0; -- 몫 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- 피제수/제수 결과에서 정수 부분을 걸러낸다
	 vn_remainder := num1 - ( num2 * vn_quotient); --나머지 = 피제수 - ( 제수 * 몫)
	 
	 RETURN vn_remainder;  -- 나머지를 반환
	
END;	
  
  
SELECT my_mod(14, 3) reminder
  FROM DUAL;  
  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- 국가명 반환
	
END;	

SELECT fn_get_country_name (52777) COUN1, 
            fn_get_country_name(10000) COUN2
  FROM DUAL;
  
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- 국가명을 반환하므로 반환 데이터타입은 VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
	
	
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  IF vn_count = 0 THEN
     vs_country_name := '해당국가 없음';
  ELSE
	
	  SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- 국가명 반환
	
END;	  

SELECT fn_get_country_name (52777) COUN1,
            fn_get_country_name(10000) COUN2
FROM DUAL;


CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- 반환 데이터타입은 VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- 사용자이름 반환
	
END;	 	

SELECT fn_get_user(),fn_get_user
FROM DUAL;

-- 프로시저 생성

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS

BEGIN
	
	INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	          VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	          
	COMMIT;
	
	
END ;            

-- 프로시저 실행

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000);

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 1000, 5000); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
  END IF;
	          
	COMMIT;
	
	
END ;   

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000);

EXEC my_new_job_proc ('SM_JOB2', 'Sample JOB2', 3000, 9000);

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
 
-- 매개변수 디폴트 값 설정 
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = SYSDATE
	    WHERE job_id = p_job_id;
	
  END IF;
	          
	COMMIT;
	
	
END ;    


EXECUTE my_new_job_proc ('SM_JOB1', 'Sample JOB1');

SELECT *
  FROM jobs
 WHERE job_id = 'SM_JOB1';
 
-- OUT, IN OUT 매개변수 사용

CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100,
            p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  )
IS
  vn_cnt NUMBER := 0;
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT 매개변수에 일자 할당
	p_upd_date := vn_cur_date;
	          
	COMMIT;
	
	
END ;   


DECLARE
   vd_cur_date JOBS.UPDATE_DATE%TYPE;
BEGIN
	 my_new_job_proc ('SM_JOB1', 'Sample JOB1', 2000, 6000, vd_cur_date);
	 
	 DBMS_OUTPUT.PUT_LINE(vd_cur_date);
END;


CREATE OR REPLACE PROCEDURE my_parameter_test_proc (
               p_var1        VARCHAR2,
               p_var2 OUT    VARCHAR2,
               p_var3 IN OUT VARCHAR2 )
IS

BEGIN
	 DBMS_OUTPUT.PUT_LINE('p_var1 value = ' || p_var1);
	 DBMS_OUTPUT.PUT_LINE('p_var2 value = ' || p_var2);
	 DBMS_OUTPUT.PUT_LINE('p_var3 value = ' || p_var3);
	 
	 p_var2 := 'B2';
	 p_var3 := 'C2';
	
END;               


DECLARE 
   v_var1 VARCHAR2(10) := 'A';
   v_var2 VARCHAR2(10) := 'B';
   v_var3 VARCHAR2(10) := 'C';
BEGIN
	 my_parameter_test_proc (v_var1, v_var2, v_var3);
	 
	 DBMS_OUTPUT.PUT_LINE('v_var2 value = ' || v_var2);
	 DBMS_OUTPUT.PUT_LINE('v_var3 value = ' || v_var3);
END;


-- RETURN 문
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN  JOBS.JOB_ID%TYPE,
            p_job_title IN  JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100
            --p_upd_date  OUT JOBS.UPDATE_DATE%TYPE  
            )
IS
  vn_cnt NUMBER := 0;
  vn_cur_date JOBS.UPDATE_DATE%TYPE := SYSDATE;
BEGIN
	-- 1000 보다 작으면 메시지 출력 후 빠져나간다
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('최소 급여값은 1000 이상이어야 합니다');
	   RETURN;
  END IF;
	
	-- 동일한 job_id가 있는지 체크
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- 없으면 INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- 있으면 UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	          
	COMMIT;
	
	
END ;   


EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 999, 6000);


--- 현장 노하우 1
DECLARE
  emp_name VARCHAR2(80);
BEGIN
	emp_name := 'hong';
	
	UPDATE employees
	   SET emp_name = emp_name
	 WHERE employee_id = 100;
	 
	SELECT emp_name
	  INTO emp_name
	  FROM employees
	 WHERE employee_id = 100;
	 
	DBMS_OUTPUT.PUT_LINE(emp_name);
	
END;


--HJH_chap08_ex1

--Quiz01. SQL 함수 중 INITCAP이란 함수가 있다. 이 함수는 매개변수로 전달한 문자열에서 앞글자만 대문자로 변환하는 함수이다. 
--INITCAP과 똑같이 동작하는 my_initcap 이란 이름으로 함수를 만들어보자. (단 여기서는 공백 한 글자로 단어 사이를 구분한다고 가정한다)
  
  --공백문자 ' ',  매개변수 parameter
  --대문자로 변환 UPPER
  --입력받은 글자를 한 개씩 받아와서 / 공백을 받으면 STOP  -> LOOP  ' ' 이면 스탑?
  --첫 번째 자리의 위치를 받아와야겠네? 
  --index 이용
/*
CREATE OR REPLACE FUNCTION my_initcap (ps_string VARCHAR2)
    RETURN VARCHAR2
IS

BEGIN
END;
*/

CREATE OR REPLACE FUNCTION my_initcap(ps_string VARCHAR2)
RETURN VARCHAR2
IS
    v_result VARCHAR2(4000);
    v_length NUMBER;
    v_idx NUMBER := 1;
    v_next_is_upper BOOLEAN := TRUE; --공백 다음 문자는 대문자로 표시
BEGIN
    v_result := '';
    v_length := LENGTH(ps_string);

    WHILE v_idx <= v_length 
    LOOP
        IF SUBSTR(ps_string, v_idx, 1) = ' ' THEN
            -- 현재 문자가 공백인 경우 다음 문자가 대문자로 시작해야 함을 표시
            v_next_is_upper := TRUE;
        ELSE
            IF v_next_is_upper THEN
                -- 다음 문자가 대문자로 시작해야 하는 경우
                v_result := v_result || UPPER(SUBSTR(ps_string, v_idx, 1));
                v_next_is_upper := FALSE;
            ELSE
                -- 다음 문자가 소문자인 경우
                v_result := v_result || LOWER(SUBSTR(ps_string, v_idx, 1));
            END IF;
        END IF;

        v_idx := v_idx + 1;
    END LOOP;

    RETURN v_result;
END my_initcap;
/

SELECT my_initcap('hello, world!')
FROM DUAL;

--공백 어디갔지 ? ㅋㅋㅋㅋ

--Quiz 2. 날짜형 SQL 함수 중에는 해당 월 마지막 일자를 반환하는 LAST_DAY란 함수가 있다.
--매개변수로 문자형으로 일자를 받아, 해당 일자의 월 마지막 날짜를 문자형으로 반환하는 함수를 my_last_day란 이름으로 만들어 보자.

--포인트 개념 
--해당 월의 1일에서 -1일을 하면 전달의 마지막 날이 나옴.
-- - INTERVAL '1' DAY 를 하면, 전 달의 마지막 날을 구할 수 있을듯. 


CREATE OR REPLACE FUNCTION my_last_day(p_date_str VARCHAR2) 
RETURN VARCHAR2
IS
    v_year NUMBER;
    v_month NUMBER;
    v_last_day NUMBER;
    v_result VARCHAR2(10);
BEGIN
    -- 입력된 문자열을 날짜 형식으로 변환하여 연도와 월을 추출.
    v_year := TO_NUMBER(SUBSTR(p_date_str, 1, 4));
    v_month := TO_NUMBER(SUBSTR(p_date_str, 6, 2));
    
    -- 해당 월의 마지막 날짜 계산.
    IF v_month = 12 THEN
        v_last_day := 31; -- 12월인 경우 31일로 설정.
    ELSE
        -- 해당 월의 다음 달의 첫 번째 날의 하루 전이 해당 월의 마지막 날짜.
        SELECT TO_NUMBER(TO_CHAR(TO_DATE('01-' || v_month || '-' || v_year, 'DD-MM-YYYY') - INTERVAL '1' DAY, 'DD'))
        INTO v_last_day
        FROM DUAL;
    END IF;
    
    -- 결과 문자열 형식으로 변환.
    v_result := TO_CHAR(TO_DATE(v_last_day || '-' || v_month || '-' || v_year, 'DD-MM-YYYY'), 'YYYY-MM-DD');
    
    RETURN v_result;
END my_last_day;
/

--호출 1
DECLARE
    v_input_date VARCHAR2(10);
    v_last_day VARCHAR2(10);
BEGIN
    -- 테스트를 위한 입력 일자 설정.
    v_input_date := '2024-02-08';
    
    -- 함수 호출
    v_last_day := my_last_day(v_input_date);
    
    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('입력된 일자: ' || v_input_date);
    DBMS_OUTPUT.PUT_LINE('해당 월의 마지막 날짜: ' || v_last_day);
END;
/

--호출 2
SELECT my_last_day('2024-02-08') AS 월_마지막_날짜
FROM DUAL;


--Quiz 3. 오른쪽의 프로시저는 이번 장에서 학습했던 my_new_job_proc 프로시저이다. 이 프로시저는 JOBS 테이블에 기존 데이터가 없으면 INSERT, 
--있으면 UPDATE를 수행하는데 IF문을 사용해 구현하였다. IF문을 제거하고 동일한 로직을 처리하도록 MERGE문을 사용해 my_new_job_proc2 란 프로시저를 생성해 보자.

/*
CREATE OR REPLACE PROCEDURE my_new_job_proc
( p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE,
p_max_sal IN JOBS.MAX_SALARY%TYPE )
IS
vn_cnt NUMBER := 0;
BEGIN
-- 동일한 job_id가 있는지 체크
SELECT COUNT(*)
INTO vn_cnt
FROM JOBS
WHERE job_id = p_job_id;
-- 없으면 INSERT 
IF vn_cnt = 0 THEN 
INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
ELSE -- 있으면 UPDATE
UPDATE JOBS
SET job_title = p_job_title,
min_salary = p_min_sal,
max_salary = p_max_sal,
update_date = SYSDATE
WHERE job_id = p_job_id;
END IF;
COMMIT;
END  
*/

/*
머지? 문
MERGE INTO 테이블 별칭
USING 
ON ( = ) 
*/

CREATE OR REPLACE PROCEDURE my_new_job_proc2
( p_job_id IN JOBS.JOB_ID%TYPE,
  p_job_title IN JOBS.JOB_TITLE%TYPE,
  p_min_sal IN JOBS.MIN_SALARY%TYPE,
  p_max_sal IN JOBS.MAX_SALARY%TYPE )
IS
BEGIN
 MERGE INTO JOBS j
  USING DUAL
  ON (j.job_id = p_job_id)
  WHEN MATCHED THEN
    UPDATE SET
      job_title = p_job_title,
      min_salary = p_min_sal,
      max_salary = p_max_sal,
      update_date = SYSDATE
  WHEN NOT MATCHED THEN
    INSERT (job_id, job_title, min_salary, max_salary, create_date, update_date)
    VALUES (p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
  COMMIT;
END;
/
--Quiz 4. 부서 테이블의 복사본 테이블을 다음과 같이 만들어보자.
/*   CREATE TABLE ch09_departments AS
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
FROM DEPARTMENTS;    */

/* 위 테이블을 대상으로 다음과 같은 처리를 하는 프로시저를 my_dept_manage_proc 란 이름으로 만들어
보자.
(1) 매개변수 : 부서번호, 부서명, 상위부서번호, 동작 flag 
(2) 동작 flag 매개변수 값은 'upsert' -> 데이터가 있으면 UPDATE, 아니면 INSERT
'delete' -> 해당 부서 삭제
(3) 삭제 시, 만약 해당 부서에 속한 사원이 존재하는지 사원테이블을 체크해 존재하면 경고메시지와 함께
delete를 하지 않는다.   */


   CREATE TABLE ch09_departments AS
   SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
     FROM DEPARTMENTS;

CREATE OR REPLACE PROCEDURE my_dept_manage_proc
          ( p_department_id    IN departments.DEPARTMENT_ID%TYPE,
            p_department_name  IN departments.DEPARTMENT_NAME%TYPE,
            p_parent_id        IN departments.PARENT_ID%TYPE,
            p_flag             IN VARCHAR2 )
IS
  vn_cnt1 NUMBER := 0;
  vn_cnt2 NUMBER := 0;
BEGIN
        -- INSERT나 UPDATE 할 경우, 동작 flag 매개변수가 소문자로 들어올 수 있으므로 대문자로 변환 후 비교함 
        IF UPPER(p_flag) = 'UPSERT' THEN
        
              MERGE INTO ch09_departments a
                USING ( SELECT p_department_id AS department_id
                        FROM DUAL ) b
                 ON ( a.department_id = b.department_id )
               WHEN MATCHED THEN
                 UPDATE SET a.department_name  = p_department_name, 
                            a.parent_id        = p_parent_id
               WHEN NOT MATCHED THEN 
                 INSERT ( a.department_id, a.department_name, a.parent_id )
                 VALUES ( p_department_id, p_department_name, p_parent_id );	
                 
          -- 삭제할 경우
            ELSIF UPPER(p_flag) = 'DELETE' THEN       
                -- 해당 부서가 있는지 체크
               SELECT COUNT(*)
                 INTO vn_cnt1
                 FROM ch09_departments
                WHERE department_id = p_department_id;
                
                -- 해당 부서가 없으면 메시지와 함께 프로시저 종료 
               IF vn_cnt1 = 0 THEN
                  DBMS_OUTPUT.PUT_LINE('해당 부서가 없어 삭제할 수 없습니다');
                  RETURN;
               END IF;
               
               -- 해당 부서에 속한 사원이 있는지 체크
               SELECT COUNT(*)
                 INTO vn_cnt2
                 FROM employees
                WHERE department_id = p_department_id;
                
                -- 해당 부서에 속한 사원이 있으면 메시지와 함께 프로시저 종료 
               IF vn_cnt2 > 0 THEN
                DBMS_OUTPUT.PUT_LINE('해당 부서에 속한 사원이 존재하므로 삭제할 수 없습니다');
                  RETURN;	   	   
               END IF;
               
               DELETE ch09_departments
                WHERE department_id = p_department_id;

        END IF;
        COMMIT;

END ;


EXEC my_dept_manage_proc (280, 'vip배송부', 10, 'upsert');


