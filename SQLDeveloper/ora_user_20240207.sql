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
-- 현장 노하우
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

   -- ch07_varchar2 테이블의 값을 변수에 담는다. 
   SELECT VAR1
     INTO vs_sql_varchar2
     FROM ch07_varchar2;
     
  -- PL/SQL 변수에 4000 BYTE 이상 크기의 값을 넣는다. 
  vs_plsql_varchar2 := vs_sql_varchar2 || ' - ' || vs_sql_varchar2 || ' - ' || vs_sql_varchar2;
  
  -- 각 변수 크기를 출력한다. 
  DBMS_OUTPUT.PUT_LINE('SQL VARCHAR2 길이 : ' || LENGTHB(vs_sql_varchar2)); 
  DBMS_OUTPUT.PUT_LINE('PL/SQL VARCHAR2 길이 : ' || LENGTHB(vs_plsql_varchar2)); 
END;
/
--HJH_chap07_ex1
-- Quiz 1. 1. 구구단 중 3단을 출력하는 익명 블록을 만들어보자.
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
--2. 사원 테이블에서 201번 사원의 이름과 이메일주소를 출력하는 익명 블록을 만들어 보자.
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
--3.  사원 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤, 이 번호 +1번으로 아래의 사원을 사원테이블에 신규 입력하는 익명 블록을 만들어 보자.
DECLARE
    vs_max_empno employees.employee_id%TYPE;
    vs_email employees.email%TYPE;
BEGIN
    -- 최대 사원번호 찾기
    SELECT MAX(EMPLOYEE_ID) 
    INTO vs_max_empno
    FROM EMPLOYEES;
    
    -- 새로운 사원 입력
    INSERT INTO EMPLOYEES (EMPLOYEE_ID, EMP_NAME, EMAIL, HIRE_DATE, DEPARTMENT_ID)
    VALUES (vs_max_empno + 1, 'Harrison Ford', 'HARRIS', SYSDATE, 50);
    
    COMMIT;
    
END;
/
    -- 이메일이 'HARRIS'인 레코드 조회
    SELECT * 
    FROM EMPLOYEES
    WHERE EMAIL = 'HARRIS';

--ORACLE-PL-SQL/09장 PLSQL문장과 서브프로그램
-- IF 문

DECLARE
   vn_num1 NUMBER := 1;
   vn_num2 NUMBER := 2 ;
BEGIN
	
	 IF vn_num1 >= vn_num2 THEN
	    DBMS_OUTPUT.PUT_LINE(vn_num1 ||'이 큰 수');
	 ELSE
	    DBMS_OUTPUT.PUT_LINE(vn_num2 ||'이 큰 수');	 
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
     DBMS_OUTPUT.PUT_LINE('낮음');
  
  ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
     DBMS_OUTPUT.PUT_LINE('중간');
  
  ELSIF vn_salary BETWEEN 6001 AND 10000 THEN
     DBMS_OUTPUT.PUT_LINE('높음');
  
  ELSE
     DBMS_OUTPUT.PUT_LINE('최상위');
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

-- CASE 문
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
            DBMS_OUTPUT.PUT_LINE('낮음');
       WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
       WHEN vn_salary BETWEEN 6001 AND 10000 THEN
            DBMS_OUTPUT.PUT_LINE('높음');
       ELSE 
            DBMS_OUTPUT.PUT_LINE('최상위');
  END CASE;

END;

-- LOOP 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
      EXIT WHEN vn_cnt >9;  -- vn_cnt가 9보다 크면 루프 종료
   
   END LOOP;
    
END;

-- WHILE 문
DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
      
   END LOOP;
    
END;

DECLARE
   vn_base_num NUMBER := 3;
   vn_cnt      NUMBER := 1;
BEGIN
   
   WHILE  vn_cnt <= 9 -- vn_cnt가 9보다 작거나 같을 경우에만 반복처리 
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '= ' || vn_base_num * vn_cnt);
      EXIT WHEN vn_cnt = 5;
      vn_cnt := vn_cnt + 1; -- vn_cnt 값을 1씩 증가
   END LOOP;    
END;



-- FOR 문
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

--이중 FOR 문을 이용한 구구단 출력
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 LOOP
        FOR j IN 1..9 LOOP
            DBMS_OUTPUT.PUT_LINE (i || '*' || j || '= ' || i*j);
        END LOOP;
    END LOOP;
END;


-- CONTINUE 문
DECLARE
   vn_base_num NUMBER := 3;
BEGIN
   
   FOR i IN 1..9 
   LOOP
      CONTINUE WHEN i=5;
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);
   END LOOP;
    
END;

-- GOTO문
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


