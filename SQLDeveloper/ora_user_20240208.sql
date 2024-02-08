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