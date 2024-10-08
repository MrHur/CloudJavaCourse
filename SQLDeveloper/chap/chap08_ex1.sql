--1. SQL 함수 중 INITCAP이란 함수가 있다. 이 함수는 매개변수로 전달한 문자열에서 앞 글자만 대문자로 변환하는 함수이다.
--INITCAP과 똑같이 동작하는 my_initcap 이란 이름으로 함수를 만들어보자. (단 여기서는 공백 한 글자로 단어 사이를 구분한다고 가정한다)

CREATE OR REPLACE FUNCTION my_initcap ( ps_string VARCHAR2 )
   RETURN VARCHAR2
IS
   vn_pos1   NUMBER := 1;   -- 각 단어 시작 위치
   vs_temp   VARCHAR2(100) :=  ps_string;
   vs_return VARCHAR2(80);  -- 반환할 대문자로 변환된 문자열 변수
   vn_len   NUMBER;         -- vs_temp의 길이

BEGIN
   
   WHILE vn_pos1 <> 0 -- 공백문자를 발견하지 못할 때까지 루프를 돈다. 
   LOOP
        -- 공백문자의 위치를 가져온다. 
       vn_pos1 := INSTR(vs_temp, ' ');  --'my favorite color is blue'
       
       IF vn_pos1 = 0 THEN -- 공백문자를 발견하지 못했을 경우, 즉 맨 마지막 단어일 경우....
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_len -1);
       ELSE -- 공백문자 위치를 기준으로, 맨 첫자는 UPPER를 사용해 대문자로 변환하고, 나머지 문자를 잘라서 변수에 넣는다. 
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_pos1 -2) || ' ';
       END IF;
       
       vn_len := LENGTH(vs_temp);
       
       -- vs_temp 변수는 최초 전체 문자열이 들어오며, 루프를 돌면서 한 단어씩 차례로 없앤다.
       vs_temp := SUBSTR(vs_temp, vn_pos1+1, vn_len - vn_pos1);
    END LOOP;   
    
    RETURN vs_return;
END;
       
SELECT my_initcap ('my favorite color is blue')
  FROM DUAL;      
       
--2. 날짜형 SQL 함수 중에는 해당 월 마지막 일자를 반환하는 LAST_DAY란 함수가 있다.
--매개변수로 문자형으로 일자를 받아, 해당 일자의 월 마지막 날짜를 문자형으로 반환하는 함수를 my_last_day란 이름으로 만들어 보자.

CREATE OR REPLACE FUNCTION my_last_day ( p_input_date VARCHAR2)
    RETURN VARCHAR2
IS
   vs_input_date  VARCHAR2(10) := p_input_date;
   vs_temp_year   VARCHAR2(4);
   vs_temp_month  VARCHAR2(2);   
   vs_return_date VARCHAR2(50);
BEGIN
	 
	 -- 입력일자에서 '-'를 제거 
	 vs_input_date := REPLACE(vs_input_date, '-', '');   
     
     -- 입력일자에서 '-'를 제거한 문자열 길이가 8이 아닐 경우 오류 메시지 출력
	 IF LENGTH(vs_input_date) <> 8 THEN
	    vs_return_date := '입력일자 오류';
     ELSE
	   vs_temp_year  := SUBSTR(vs_input_date, 1, 4); -- 년도를 가져옴
	   vs_temp_month := SUBSTR(vs_input_date, 5, 2); -- 월을 가져옴
       
       IF vs_temp_month = '12' THEN -- 월이 12월이면 
	      -- 년도는 +1, 
	      vs_temp_year := TO_CHAR(TO_NUMBER(vs_temp_year) + 1);
	      -- 월은 무조건 1월 
	      vs_temp_month := '01';
         ELSE
              -- 12월이 아니면 기존 월에서 +1
              vs_temp_month := TRIM(TO_CHAR(TO_NUMBER(vs_temp_month) + 1, '00'));
        END IF;   
        
         -- 년도 + 다음월 + 01일에서 -1일을 하면 입력일자 월의 마지막 일자가 나옴
	    vs_return_date := TO_CHAR(TO_DATE(vs_temp_year || vs_temp_month || '01', 'YYYY-MM-DD') -1,  'YYYYMMDD');
      END IF; 
      
      RETURN vs_return_date;
END;
      
SELECT my_last_day ('2024-02-09')
  FROM DUAL;       
       
--Quiz 3. 아래 프로시저는 이번 장에서 학습했던 my_new_job_proc 프로시저이다. 이 프로시저는 JOBS 테이블에 기존 데이터가 없으면 INSERT, 있으면 UPDATE를 수행하는데
--IF문을 사용해 구현하였다. IF문을 제거하고 동일한 로직을 처리하도록 MERGE문을 사용해 my_new_job_proc2 란 프로시저를 생성해 보자.        
CREATE OR REPLACE PROCEDURE my_new_job_proc2
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE )
IS      
BEGIN
        MERGE INTO jobs a
        USING ( SELECT p_job_id AS job_id
                  FROM DUAL ) b
           ON ( a.job_id = b.job_id )
        WHEN MATCHED THEN
           UPDATE SET a.job_title  = p_job_title, 
                      a.min_salary = p_min_sal,
                      a.max_salary = p_max_sal
        WHEN NOT MATCHED THEN 
           INSERT ( a.job_id, a.job_title, a.min_salary, a.max_salary, a.create_date, a.update_date )
           VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE );
       
       COMMIT;

END ;

--Quiz 4. 부서 테이블의 복사본 테이블을 다음과 같이 만들어보자.

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






       
       