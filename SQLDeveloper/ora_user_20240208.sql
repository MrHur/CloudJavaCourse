-- NULL ��
IF vn_variable = 'A' THEN
   ó������1;
ELSIF vn_variable = 'B' THEN
   ó������2;
...
ELSE NULL;
END IF;

CASE WHEN vn_variable = 'A' THEN
          ó������1;
     WHEN vn_variable = 'B' THEN
          ó������2;      
     ...
     ELSE NULL;
END CASE;     


-- �Լ�

CREATE OR REPLACE FUNCTION my_mod ( num1 NUMBER, num2 NUMBER )
   RETURN NUMBER  -- ��ȯ ������Ÿ���� NUMBER
IS
   vn_remainder NUMBER := 0; -- ��ȯ�� ������
   vn_quotient  NUMBER := 0; -- �� 
BEGIN
	 
	 vn_quotient  := FLOOR(num1 / num2); -- ������/���� ������� ���� �κ��� �ɷ�����
	 vn_remainder := num1 - ( num2 * vn_quotient); --������ = ������ - ( ���� * ��)
	 
	 RETURN vn_remainder;  -- �������� ��ȯ
	
END;	
  
  
SELECT my_mod(14, 3) reminder
  FROM DUAL;  
  

CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
	 
	 SELECT country_name
	   INTO vs_country_name
	   FROM countries
	  WHERE country_id = p_country_id;
	 
	 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	

SELECT fn_get_country_name (52777) COUN1, 
            fn_get_country_name(10000) COUN2
  FROM DUAL;
  
CREATE OR REPLACE FUNCTION fn_get_country_name ( p_country_id NUMBER )
   RETURN VARCHAR2  -- �������� ��ȯ�ϹǷ� ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_country_name COUNTRIES.COUNTRY_NAME%TYPE;
   vn_count NUMBER := 0;
BEGIN
	
	
	SELECT COUNT(*)
	  INTO vn_count
	  FROM countries
	 WHERE country_id = p_country_id;
	 
  IF vn_count = 0 THEN
     vs_country_name := '�ش籹�� ����';
  ELSE
	
	  SELECT country_name
	    INTO vs_country_name
	    FROM countries
	   WHERE country_id = p_country_id;
	      
  END IF;
	 
 RETURN vs_country_name;  -- ������ ��ȯ
	
END;	  

SELECT fn_get_country_name (52777) COUN1,
            fn_get_country_name(10000) COUN2
FROM DUAL;


CREATE OR REPLACE FUNCTION fn_get_user
   RETURN VARCHAR2  -- ��ȯ ������Ÿ���� VARCHAR2
IS
   vs_user_name VARCHAR2(80);
BEGIN
	SELECT USER
    INTO vs_user_name
    FROM DUAL;
		 
  RETURN vs_user_name;  -- ������̸� ��ȯ
	
END;	 	

SELECT fn_get_user(),fn_get_user
FROM DUAL;

-- ���ν��� ����

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

-- ���ν��� ����

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
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
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
 
 
-- �Ű����� ����Ʈ �� ���� 
 
EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1'); 
 
 
CREATE OR REPLACE PROCEDURE my_new_job_proc 
          ( p_job_id    IN JOBS.JOB_ID%TYPE,
            p_job_title IN JOBS.JOB_TITLE%TYPE,
            p_min_sal   IN JOBS.MIN_SALARY%TYPE := 10,
            p_max_sal   IN JOBS.MAX_SALARY%TYPE := 100 )
IS
  vn_cnt NUMBER := 0;
BEGIN
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
	             
	ELSE -- ������ UPDATE
	
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
 
-- OUT, IN OUT �Ű����� ���

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
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	
	   UPDATE JOBS
	      SET job_title   = p_job_title,
	          min_salary  = p_min_sal,
	          max_salary  = p_max_sal,
	          update_date = vn_cur_date
	    WHERE job_id = p_job_id;
	
  END IF;
  
	-- OUT �Ű������� ���� �Ҵ�
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


-- RETURN ��
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
	-- 1000 ���� ������ �޽��� ��� �� ����������
	IF p_min_sal < 1000 THEN
	   DBMS_OUTPUT.PUT_LINE('�ּ� �޿����� 1000 �̻��̾�� �մϴ�');
	   RETURN;
  END IF;
	
	-- ������ job_id�� �ִ��� üũ
	SELECT COUNT(*)
	  INTO vn_cnt
	  FROM JOBS
	 WHERE job_id = p_job_id;
	 
	-- ������ INSERT 
	IF vn_cnt = 0 THEN 
	
	   INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
	             VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, vn_cur_date, vn_cur_date);
	             
	ELSE -- ������ UPDATE
	
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


--- ���� ���Ͽ� 1
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

--Quiz01. SQL �Լ� �� INITCAP�̶� �Լ��� �ִ�. �� �Լ��� �Ű������� ������ ���ڿ����� �ձ��ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ��̴�. 
--INITCAP�� �Ȱ��� �����ϴ� my_initcap �̶� �̸����� �Լ��� ������. (�� ���⼭�� ���� �� ���ڷ� �ܾ� ���̸� �����Ѵٰ� �����Ѵ�)
  
  --���鹮�� ' ',  �Ű����� parameter
  --�빮�ڷ� ��ȯ UPPER
  --�Է¹��� ���ڸ� �� ���� �޾ƿͼ� / ������ ������ STOP  -> LOOP  ' ' �̸� ��ž?
  --ù ��° �ڸ��� ��ġ�� �޾ƿ;߰ڳ�? 
  --index �̿�
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
    v_next_is_upper BOOLEAN := TRUE; --���� ���� ���ڴ� �빮�ڷ� ǥ��
BEGIN
    v_result := '';
    v_length := LENGTH(ps_string);

    WHILE v_idx <= v_length 
    LOOP
        IF SUBSTR(ps_string, v_idx, 1) = ' ' THEN
            -- ���� ���ڰ� ������ ��� ���� ���ڰ� �빮�ڷ� �����ؾ� ���� ǥ��
            v_next_is_upper := TRUE;
        ELSE
            IF v_next_is_upper THEN
                -- ���� ���ڰ� �빮�ڷ� �����ؾ� �ϴ� ���
                v_result := v_result || UPPER(SUBSTR(ps_string, v_idx, 1));
                v_next_is_upper := FALSE;
            ELSE
                -- ���� ���ڰ� �ҹ����� ���
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

--���� ����� ? ��������

--Quiz 2. ��¥�� SQL �Լ� �߿��� �ش� �� ������ ���ڸ� ��ȯ�ϴ� LAST_DAY�� �Լ��� �ִ�.
--�Ű������� ���������� ���ڸ� �޾�, �ش� ������ �� ������ ��¥�� ���������� ��ȯ�ϴ� �Լ��� my_last_day�� �̸����� ����� ����.

--����Ʈ ���� 
--�ش� ���� 1�Ͽ��� -1���� �ϸ� ������ ������ ���� ����.
-- - INTERVAL '1' DAY �� �ϸ�, �� ���� ������ ���� ���� �� ������. 


CREATE OR REPLACE FUNCTION my_last_day(p_date_str VARCHAR2) 
RETURN VARCHAR2
IS
    v_year NUMBER;
    v_month NUMBER;
    v_last_day NUMBER;
    v_result VARCHAR2(10);
BEGIN
    -- �Էµ� ���ڿ��� ��¥ �������� ��ȯ�Ͽ� ������ ���� ����.
    v_year := TO_NUMBER(SUBSTR(p_date_str, 1, 4));
    v_month := TO_NUMBER(SUBSTR(p_date_str, 6, 2));
    
    -- �ش� ���� ������ ��¥ ���.
    IF v_month = 12 THEN
        v_last_day := 31; -- 12���� ��� 31�Ϸ� ����.
    ELSE
        -- �ش� ���� ���� ���� ù ��° ���� �Ϸ� ���� �ش� ���� ������ ��¥.
        SELECT TO_NUMBER(TO_CHAR(TO_DATE('01-' || v_month || '-' || v_year, 'DD-MM-YYYY') - INTERVAL '1' DAY, 'DD'))
        INTO v_last_day
        FROM DUAL;
    END IF;
    
    -- ��� ���ڿ� �������� ��ȯ.
    v_result := TO_CHAR(TO_DATE(v_last_day || '-' || v_month || '-' || v_year, 'DD-MM-YYYY'), 'YYYY-MM-DD');
    
    RETURN v_result;
END my_last_day;
/

--ȣ�� 1
DECLARE
    v_input_date VARCHAR2(10);
    v_last_day VARCHAR2(10);
BEGIN
    -- �׽�Ʈ�� ���� �Է� ���� ����.
    v_input_date := '2024-02-08';
    
    -- �Լ� ȣ��
    v_last_day := my_last_day(v_input_date);
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE('�Էµ� ����: ' || v_input_date);
    DBMS_OUTPUT.PUT_LINE('�ش� ���� ������ ��¥: ' || v_last_day);
END;
/

--ȣ�� 2
SELECT my_last_day('2024-02-08') AS ��_������_��¥
FROM DUAL;


--Quiz 3. �������� ���ν����� �̹� �忡�� �н��ߴ� my_new_job_proc ���ν����̴�. �� ���ν����� JOBS ���̺� ���� �����Ͱ� ������ INSERT, 
--������ UPDATE�� �����ϴµ� IF���� ����� �����Ͽ���. IF���� �����ϰ� ������ ������ ó���ϵ��� MERGE���� ����� my_new_job_proc2 �� ���ν����� ������ ����.

/*
CREATE OR REPLACE PROCEDURE my_new_job_proc
( p_job_id IN JOBS.JOB_ID%TYPE,
p_job_title IN JOBS.JOB_TITLE%TYPE,
p_min_sal IN JOBS.MIN_SALARY%TYPE,
p_max_sal IN JOBS.MAX_SALARY%TYPE )
IS
vn_cnt NUMBER := 0;
BEGIN
-- ������ job_id�� �ִ��� üũ
SELECT COUNT(*)
INTO vn_cnt
FROM JOBS
WHERE job_id = p_job_id;
-- ������ INSERT 
IF vn_cnt = 0 THEN 
INSERT INTO JOBS ( job_id, job_title, min_salary, max_salary, create_date, update_date)
VALUES ( p_job_id, p_job_title, p_min_sal, p_max_sal, SYSDATE, SYSDATE);
ELSE -- ������ UPDATE
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
����? ��
MERGE INTO ���̺� ��Ī
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
--Quiz 4. �μ� ���̺��� ���纻 ���̺��� ������ ���� ������.
/*   CREATE TABLE ch09_departments AS
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, PARENT_ID
FROM DEPARTMENTS;    */

/* �� ���̺��� ������� ������ ���� ó���� �ϴ� ���ν����� my_dept_manage_proc �� �̸����� �����
����.
(1) �Ű����� : �μ���ȣ, �μ���, �����μ���ȣ, ���� flag 
(2) ���� flag �Ű����� ���� 'upsert' -> �����Ͱ� ������ UPDATE, �ƴϸ� INSERT
'delete' -> �ش� �μ� ����
(3) ���� ��, ���� �ش� �μ��� ���� ����� �����ϴ��� ������̺��� üũ�� �����ϸ� ���޽����� �Բ�
delete�� ���� �ʴ´�.   */


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
        -- INSERT�� UPDATE �� ���, ���� flag �Ű������� �ҹ��ڷ� ���� �� �����Ƿ� �빮�ڷ� ��ȯ �� ���� 
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
                 
          -- ������ ���
            ELSIF UPPER(p_flag) = 'DELETE' THEN       
                -- �ش� �μ��� �ִ��� üũ
               SELECT COUNT(*)
                 INTO vn_cnt1
                 FROM ch09_departments
                WHERE department_id = p_department_id;
                
                -- �ش� �μ��� ������ �޽����� �Բ� ���ν��� ���� 
               IF vn_cnt1 = 0 THEN
                  DBMS_OUTPUT.PUT_LINE('�ش� �μ��� ���� ������ �� �����ϴ�');
                  RETURN;
               END IF;
               
               -- �ش� �μ��� ���� ����� �ִ��� üũ
               SELECT COUNT(*)
                 INTO vn_cnt2
                 FROM employees
                WHERE department_id = p_department_id;
                
                -- �ش� �μ��� ���� ����� ������ �޽����� �Բ� ���ν��� ���� 
               IF vn_cnt2 > 0 THEN
                DBMS_OUTPUT.PUT_LINE('�ش� �μ��� ���� ����� �����ϹǷ� ������ �� �����ϴ�');
                  RETURN;	   	   
               END IF;
               
               DELETE ch09_departments
                WHERE department_id = p_department_id;

        END IF;
        COMMIT;

END ;


EXEC my_dept_manage_proc (280, 'vip��ۺ�', 10, 'upsert');


