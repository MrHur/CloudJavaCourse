SELECT employee_id AS "�����ȣ", emp_name AS "�����", HIRE_DATE AS "�Ի�����", 
       ROUND((sysdate - hire_date) / 365) AS "�ټӳ��"
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 10
 ORDER BY 3;   -- �Ի����� �������� �������� ����
 
 SELECT cust_name, cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
  FROM customers;

--NULL �����Լ�
SELECT NVL(manager_id, employee_id)
    FROM employees
WHERE manager_id IS NULL;

SELECT employee_id,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS salary2
    FROM employees;

