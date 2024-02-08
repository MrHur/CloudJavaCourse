--1. SQL �Լ� �� INITCAP�̶� �Լ��� �ִ�. �� �Լ��� �Ű������� ������ ���ڿ����� �� ���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ��̴�.
--INITCAP�� �Ȱ��� �����ϴ� my_initcap �̶� �̸����� �Լ��� ������. (�� ���⼭�� ���� �� ���ڷ� �ܾ� ���̸� �����Ѵٰ� �����Ѵ�)

CREATE OR REPLACE FUNCTION my_initcap ( ps_string VARCHAR2 )
   RETURN VARCHAR2
IS
   vn_pos1   NUMBER := 1;   -- �� �ܾ� ���� ��ġ
   vs_temp   VARCHAR2(100) :=  ps_string;
   vs_return VARCHAR2(80);  -- ��ȯ�� �빮�ڷ� ��ȯ�� ���ڿ� ����
   vn_len   NUMBER;         -- vs_temp�� ����

BEGIN
   
   WHILE vn_pos1 <> 0 -- ���鹮�ڸ� �߰����� ���� ������ ������ ����. 
   LOOP
        -- ���鹮���� ��ġ�� �����´�. 
       vn_pos1 := INSTR(vs_temp, ' ');  --'my favorite color is blue'
       
       IF vn_pos1 = 0 THEN -- ���鹮�ڸ� �߰����� ������ ���, �� �� ������ �ܾ��� ���....
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_len -1);
       ELSE -- ���鹮�� ��ġ�� ��������, �� ù�ڴ� UPPER�� ����� �빮�ڷ� ��ȯ�ϰ�, ������ ���ڸ� �߶� ������ �ִ´�. 
          vs_return := vs_return || UPPER(SUBSTR(vs_temp, 1, 1)) ||SUBSTR(vs_temp, 2, vn_pos1 -2) || ' ';
       END IF;
       
       vn_len := LENGTH(vs_temp);
       
       -- vs_temp ������ ���� ��ü ���ڿ��� ������, ������ ���鼭 �� �ܾ ���ʷ� ���ش�.
       vs_temp := SUBSTR(vs_temp, vn_pos1+1, vn_len - vn_pos1);
    END LOOP;   
    
    RETURN vs_return;
END;
       
SELECT my_initcap ('my favorite color is blue')
  FROM DUAL;      
       
--2. ��¥�� SQL �Լ� �߿��� �ش� �� ������ ���ڸ� ��ȯ�ϴ� LAST_DAY�� �Լ��� �ִ�.
--�Ű������� ���������� ���ڸ� �޾�, �ش� ������ �� ������ ��¥�� ���������� ��ȯ�ϴ� �Լ��� my_last_day�� �̸����� ����� ����.

CREATE OR REPLACE FUNCTION my_last_day ( p_input_date VARCHAR2)
    RETURN VARCHAR2
IS
   vs_input_date  VARCHAR2(10) := p_input_date;
   vs_temp_year   VARCHAR2(4);
   vs_temp_month  VARCHAR2(2);   
   vs_return_date VARCHAR2(50);
BEGIN
	 
	 -- �Է����ڿ��� '-'�� ���� 
	 vs_input_date := REPLACE(vs_input_date, '-', '');   
     
     -- �Է����ڿ��� '-'�� ������ ���ڿ� ���̰� 8�� �ƴ� ��� ���� �޽��� ���
	 IF LENGTH(vs_input_date) <> 8 THEN
	    vs_return_date := '�Է����� ����';
     ELSE
	   vs_temp_year  := SUBSTR(vs_input_date, 1, 4); -- �⵵�� ������
	   vs_temp_month := SUBSTR(vs_input_date, 5, 2); -- ���� ������
       
       IF vs_temp_month = '12' THEN -- ���� 12���̸� 
	      -- �⵵�� +1, 
	      vs_temp_year := TO_CHAR(TO_NUMBER(vs_temp_year) + 1);
	      -- ���� ������ 1�� 
	      vs_temp_month := '01';
         ELSE
              -- 12���� �ƴϸ� ���� ������ +1
              vs_temp_month := TRIM(TO_CHAR(TO_NUMBER(vs_temp_month) + 1, '00'));
        END IF;   
        
         -- �⵵ + ������ + 01�Ͽ��� -1���� �ϸ� �Է����� ���� ������ ���ڰ� ����
	    vs_return_date := TO_CHAR(TO_DATE(vs_temp_year || vs_temp_month || '01', 'YYYY-MM-DD') -1,  'YYYYMMDD');
      END IF; 
      
      RETURN vs_return_date;
END;
      
SELECT my_last_day ('2024-02-09')
  FROM DUAL;       
       
--Quiz 3. �Ʒ� ���ν����� �̹� �忡�� �н��ߴ� my_new_job_proc ���ν����̴�. �� ���ν����� JOBS ���̺� ���� �����Ͱ� ������ INSERT, ������ UPDATE�� �����ϴµ�
--IF���� ����� �����Ͽ���. IF���� �����ϰ� ������ ������ ó���ϵ��� MERGE���� ����� my_new_job_proc2 �� ���ν����� ������ ����.        
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

--Quiz 4. �μ� ���̺��� ���纻 ���̺��� ������ ���� ������.

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






       
       