-- �͸���
DECLARE
   vi_num NUMBER;
BEGIN
   vi_num := 100;
   
   DBMS_OUTPUT.PUT_LINE(vi_num);

END;

-- ������
DECLARE
  a INTEGER := 2**2*3**2;
BEGIN
  DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;

-- �ּ�
DECLARE
  -- �� �� �ּ�, ��������
  a INTEGER := 2**2*3**2;
BEGIN
	/* �����
	   DBMS_OUTPUT�� �̿��� ������ ��� 
	*/
  DBMS_OUTPUT.PUT_LINE('a = ' || TO_CHAR(a));
END;

-- DML ��
DECLARE
  vs_emp_name    VARCHAR2(80); -- ����� ����
  vs_dep_name    VARCHAR2(80); -- �μ��� ����
BEGIN
  SELECT a.emp_name, b.department_name
    INTO vs_emp_name, vs_dep_name
    FROM employees a,
         departments b
   WHERE a.department_id = b.department_id
     AND a.employee_id = 100;


  DBMS_OUTPUT.PUT_LINE( vs_emp_name || ' - ' || vs_dep_name);
END;
/
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
/
-- ���� ���Ͽ�
CREATE TABLE ch07_varchar2 (
      VAR1 VARCHAR2(5000));

CREATE TABLE ch07_varchar2 (
      VAR1 VARCHAR2(4000));
      
INSERT INTO ch07_varchar2 (VAR1)
VALUES ('tQbADHDjqtRCvosYCLwzbyKKrQCdJubDPTHnzqvjRwGxhQJtrVbXsLNlgeeMCemGMYpvfoHUHDxIPTDjleABGoowxlzCVipeVwsMFRNzZYgHfQUSIeOITaCKJpxAWwydApVUlQiKDgJlFIOGPOKoJsoemqNbOLdZOBcQhDcMLXuYjRQZDIpgpmImgiwzcLkSilCmLrSbmFNsKEEpzCHDylMvkYPKPNeuJxLvJiApNCYzrMcflECbxwNTKSxaEwVvCYnTnFfMFgDqxobWcSmMJrNTQIVOeWlPaMTfRHsrlFSukppmljmOojPSgJiSbQcgtWWOwUNNYFGtgCGBsIcTGAiHWBxtYVXecoJgJCAJptIVmVTZSKliRLoPYTIUpksBuQaqFHLhCkosWChoMjbqgLtBIRBynsKjKiLrdeHVvZanNVElDjLWwlCDhbpsAVQMTzjzhoKIJBdthynMBMVjeNmsKAjdAYhPZKmuKOuMloQdkqPjoKbfjDEeATciMrXiMQorMhYmBlMODBbyLLIkbmtZdPcWGSuxFEUwXnWpvnunEgcLelSneRIpgRNTzTkHqgLbpxoHzCYgSWlIAvKljCnmWiPWGGwlUFOudRSdoqUxntyhNYEiVXtMObywEltTImawnElpmeiWwlTjGTFceqyjhNqiDLxwduubykWzDmFSJNvVvDZibrCpAReqQjlQZcxuVqjKGKvoDuEcQPQeDzmdMYSOTIQdPDNfDffCOUWflHSQhvVTiYumBQIoyznWNITGZkefknJpGEutUnhBgLPQTWTBeTYccqlLrxvRjfJpdpfVDqqfKCngemIEDDHNdvBxCqKDTrrJAumXMKgpWLIHctQuACeNaKnffpYXiioLxZDrxpuZPPUGpRsCtoQuBfogkKuusVATkMyajKTPSyTQbfhZepRjNdrhkymqKvsAcThYbMSMnkKcLWFPAMeGysBVKkQtFMPvRBoDszlSZcMYzwxkKQwJnuVnDxShYiHFlzgDWqhZoqeypyFVBNDtHkiVzHkQisYLbsbVneJyHbHdtaIFLVbfTqbkGQTEjFlPiGUddPUIoLWALrbKcLwBizwhJvaXkvOphcGWpdNAhxgehCvjcQFSFhxrBuANKjyWncWAUpKKJcfQCsQlLfpqdMhjWGkAMMWUaDfCrGtmtkiIZOdNapEnvfFKiHAhBhejgKSuyKXFQXyCaLwwvonHsceJKgjtnYVZvBCYYBSqNCqVqCGewootJJsqrCnmiteMZBbyMPnIrdcielnGUYmwiOPmEqKGvxDmDRTDRumnSRcnvgxLbaiQIuzdslEIMquvvwmvgaumqPkduNyfRtXErCPvDYLelhjNNOjbGryRpTtDHxIJebMEtKryUyZRIdADeTEBExwHMRHzAYFizYiesaMhNIsOUzUTmyEMuFQrsUEtjwhUWIvADNlrcxPZwRazPMMvdVZssmXbXuCkRoPYNGLPwUmrWrrIgQoMSGMPvTcbHnbtleyKYmOMgymANQBZDMoqAOzMHrAVunIiykCudFVNObNgXOoyfQRICbFsWygSZXufipvrWWmRnBWYdoKmIRewOObUjiNDdQsxQIXtlbPSSngfQPfeQKOolVASXIuAmeODKtSOPaEaFKcedGzzsbrPlsPnRRuYFeVdhyufpjFVVrTPczSQkmPYXercLMmVEaDmJXKTqEVNSKeOshDCDJwdINFsLhAuKIIfOdjSEndDwumQLvePVjzNoIfUELOANeshoNgwVhFADjtUIjIhQAIyRnzSoxSRSWklITMgdjQZTthwsnBVLWyfSsAdLzOnEqmMCGBlTYGjtqvKbBoATRwkPkOTSbUhZClVzjiLLIFEMuptuodeRKXUaBfUhVTtasFsZdVnKtEfLldJYsxjlrBADRqhEBEmBKxlXKgEhiKcwAdztcETMUteJwadfaZLEBRjwJOGaIMhsfAxtuBQWyQLGXPDlFQmkcMsKsGUlQBEAubDqbuBYqXLZgmhPftLkYaCYGReLCVXssOxzJFJwnxKJzaaYzfVpbHYBtiBeQZRilJZqrrMTrVtYAcwGxAAddwtlxzdZebfZHjzqRmrrBPNbkVHqjCHtVKUjIDPVSrtyEsPRPoyyPOFOSBcgClTzlAIPmPMkdlpFHctzKGpyQMInMwPKojVErCOrHbCsZoEXqyOcHReSybmxwYabyioVnDxPEvskutVHLWQTNudmKICoaoSGKqONrBmvtGNBKAaJxCRKTDOIqrJOsQVOmGxmuIDEddVYvDwILTyushOAiXbkRIKgNLnFJdOagmiOHKRBKIIkxkOUeZWMRNlqpJdFgKjrGhIzrgBtgjVOtZAskKRbqzRVwLUoUAtRpRkoRQNLIrbLmmjZTugXJBNCscnMguKVAFDKpODtCsmdlBvQGALeBGUitYBxLYhJxeVcAnTWmTAvCITzdzqiBfEudEIBmkDAXIFmoOmsTMZDOnhXYrgMDlDbjednYWWJbGhrXFrxMQmQSmRBwoOqWGbGmjZNlJCvSHvmtZUkIScWXVdfSsdvdyQNpGFIOuteXhCMLmmEHrMucEmFbCIOHTJINAuIUOPfAfijIPkZjppGCCSRJNXWNCmliwUgABkHWuelUWeLsyVKVcZWOSeiQBQibCQJQUgGkTrXZxdBLsgjeMIwOyORDBpywuvlrLScRNhvaCYaKKRvOZeqBebUWWFhNnIRJvedFNfFPgWZJgNRaUpyYWFNiXJfAqNjyCEQYwAdFBQKKolwrufmJOfrToJFEsoNjaphcNvfWGIjKrKZSoSJEsbRqNVcoprpcGrnBgcNAnWUFpRldcPJkPfaoLKRCmVyMAWMXmnScodKisCTqllZEWQQSCFETxLNntgdcFEFRsTSIhuewwrHIlOeCcRqkzgQhKnKyHZHdFsMEKvPywLbjaspVxUMEkVzCGcGoTmaBjUMwJuAYdSTaYGDHHWDrvGgMVTtehpzfgofkmqtamffJbCKOzJgPsHNEnFarjADJGyKLwwitCiBXIraUdZtZwNjUtGbWqxksepVYztIBrimByoYQfUQgOndzFmhnuSmhYWvHliWUHgbvBIkYasDElNsjcCLtMvjQEhJjWvlnAscPwOYfelrfgfRAZGBxdFlMNkfYEWLbkfUhbRPHoDZsaAQdoKhAAWzOcHoAkkHPQMNIxgHNJaqEFBqCuMYEtLpMnIiMCWWEPnBYgYrxlXFGYpQWUNFevwcEUvUzDeSZNrdmahAfjeLSAGjHVnqyTzJkiVXjDJXzOiszXQCErQwwDMMqjLxWebJwNAVdrXeyMDRYXmLMDnuWLVaShVGhlgvbjOdOnhCDTNVazYDnzstqxjOuWbLcDaavRumKUOQXBQwKtdFgOzXiQKWFporrIcylIHlTmTKAIpBqNUbkajLTlwAHieCcqPIJYhegwQhWpYZdfxpQXDKtYzsrmnvdiTKgXfXKlIHPHlxQtqXGhMVPOBAKVZJfkrDNEwnQFwgfoHJSqQxTzRswVLrtFgpVzKcLilgznElWUfhERyeUrCcFCuGJddlFHJrXsqRdUjqUwaBmJVNwjRbCFiVMOSFuNctNVzhmhUpoddsMPUFMvNIMsMjHIWYiLjhSajZqpDkMvUOUCbYKfNHGpdUeWGUtDXHDNSCEXqYrhWhvnISnjfoBMCwwptksarPImRZaRxBMjoBdlmRGlIuQZDzCLnxxioATnGVFFTATUpeypOCaCeJAvPLxEXYzlCgXvXirGSZFyZPPSCdOSHxeELRsetFrWgqPNNpwgbgBEYPOSpLWeVdqOxPaQnidyPVMmELzeJPWgNsWBdPJPjhkdGpeAYZfrBNqdbOwzbtLiWMPafjgWQNcWKqmcleWLcMJoGSAEIUyFuzElZKXonHOMDdGMtSKEFUWdfPfnDecKNhIjAKRYmkXgpPAzlKIOpViZPkZdozzAoWwDnXkfDikvkXcQaoBtzKkcRhNpJRYaGTkdnlfotsJZsLqpYaWoK')
;

COMMIT;   

DECLARE
   vs_sql_varchar2   VARCHAR2(4000);
   vs_plsql_varchar2 VARCHAR2(32767);
BEGIN

   -- ch07_varchar2 ���̺��� ���� ������ ��´�. 
   SELECT VAR1
     INTO vs_sql_varchar2
     FROM ch07_varchar2;
     
  -- PL/SQL ������ 4000 BYTE �̻� ũ���� ���� �ִ´�. 
  vs_plsql_varchar2 := vs_sql_varchar2 || ' - ' || vs_sql_varchar2 || ' - ' || vs_sql_varchar2;
  
  -- �� ���� ũ�⸦ ����Ѵ�. 
  DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 ���� : ' || LENGTHB(vs_sql_varchar2)); 
  DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 ���� : ' || LENGTHB(vs_plsql_varchar2)); 
END;
/
--HJH_chap07_ex1
-- Quiz 1. 1. ������ �� 3���� ����ϴ� �͸� ����� ������.
DECLARE
   vi_num NUMBER;
    
BEGIN
   vi_num := 3;
   
   DBMS_OUTPUT.PUT_LINE('3 * 1 = ' || vi_num);
   DBMS_OUTPUT.PUT_LINE('3 * 2 = ' || vi_num*2);
   DBMS_OUTPUT.PUT_LINE('3 * 3 = ' || vi_num*3);
   DBMS_OUTPUT.PUT_LINE('3 * 4 = ' || vi_num*4);
   DBMS_OUTPUT.PUT_LINE('3 * 5 = ' || vi_num*5);
   DBMS_OUTPUT.PUT_LINE('3 * 6 = ' || vi_num*6);
   DBMS_OUTPUT.PUT_LINE('3 * 7 = ' || vi_num*7);
   DBMS_OUTPUT.PUT_LINE('3 * 8 = ' || vi_num*8);
   DBMS_OUTPUT.PUT_LINE('3 * 9 = ' || vi_num*9);

END;
/
--2. ��� ���̺��� 201�� ����� �̸��� �̸����ּҸ� ����ϴ� �͸� ����� ����� ����.
DECLARE
  vs_emp_name employees.emp_name%TYPE;
  vs_email employees.email%TYPE;
BEGIN
  SELECT emp_name, email
    INTO vs_emp_name, vs_email
    FROM employees
    where employee_id = 201;

  DBMS_OUTPUT.PUT_LINE( vs_emp_name || ' - ' || vs_email);
END;
/
--3.  ��� ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� ��, �� ��ȣ +1������ �Ʒ��� ����� ������̺� �ű� �Է��ϴ� �͸� ����� ����� ����.
DECLARE
    vs_max_empno employees.employee_id%TYPE;
    vs_email employees.email%TYPE;
BEGIN
    -- �ִ� �����ȣ ã��
    SELECT MAX(EMPLOYEE_ID) 
    INTO vs_max_empno
    FROM EMPLOYEES;
    
    -- ���ο� ��� �Է�
    INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMP_NAME, EMAIL, HIRE_DATE, DEPARTMENT_ID)
    VALUES (vs_max_empno + 1, 'Harrison Ford', 'HARRIS', SYSDATE, 50);
    
    COMMIT;
    
END;
/
    -- �̸����� 'HARRIS'�� ���ڵ� ��ȸ
    SELECT * 
    FROM EMPLOYEES
    WHERE EMAIL = 'HARRIS';

--ORACLE-PL-SQL/09�� PLSQL����� �������α׷�
-- IF ��

DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2 ;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'�� ū ��');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'�� ū ��');	 
	 END IF;
	
END;


DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  IF vn_salary BETWEEN 1 AND 3000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('�߰�');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('����');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END IF;  
   
	
END;


DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
   vn_commission NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary, commission_pct
     INTO vn_salary, vn_commission
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  IF vn_commission > 0 THEN
     IF vn_commission > 0.15 THEN
        DBMS_OUTPUT.PUT_LINE(vn_salary * vn_commission );
     END IF;  
  ELSE
     DBMS_OUTPUT.PUT_LINE(vn_salary);
  END IF;  
END;

-- CASE ��
DECLARE
   vn_salary NUMBER := 0;
   vn_department_id NUMBER := 0;
BEGIN
	
	vn_department_id := ROUND(DBMS_RANDOM.VALUE (10, 120), -1);
  
   SELECT salary
     INTO vn_salary
     FROM employees
    WHERE department_id = vn_department_id
      AND ROWNUM = 1;

  DBMS_OUTPUT.PUT_LINE(vn_salary);
  
  CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('�߰�');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('����');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('�ֻ���');
  END CASE;

END;

-- LOOP ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt�� 9���� ũ�� ���� ����
   
   END LOOP;
    
END;

-- WHILE ��
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
      
   END LOOP;
    
END;

DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt�� 9���� �۰ų� ���� ��쿡�� �ݺ�ó�� 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt ���� 1�� ����
   END LOOP;    
END;



-- FOR ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
   END LOOP;
    
END;

DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   FOR i IN REVERSE 1..9 LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
END;

--���� FOR ���� �̿��� ������ ���
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 LOOP
        FOR j IN 1..9 LOOP
            DBMS_OUTPUT.PUT_LINE (i || '*' || j || '= ' || i*j);
        END LOOP;
    END LOOP;
END;


-- CONTINUE ��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5;
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
    
END;

-- GOTO��
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   <<third>>
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
      
      IF i = 3 THEN
         GOTO fourth;
      END IF;   
   END LOOP;
   
   <<fourth>>
   vn_base_num := 4;
   FOR i IN 1..9 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;   
    
END;


