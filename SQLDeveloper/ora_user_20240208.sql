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