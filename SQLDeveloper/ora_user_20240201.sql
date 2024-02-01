SELECT ABS(10), ABS(-10), ABS(-10.123)
FROM DUAL;

SELECT CEIL(10.123), CEIL(10.541), CEIL(11.001)
FROM DUAL;

SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(11.001) 
FROM DUAL;

SELECT ROUND(10.154), ROUND(10.154, 2), ROUND(10.154, 3), 
             ROUND(0, 3), ROUND(115.154, -1), ROUND(115.154, -2)
FROM DUAL;

SELECT TRUNC(10.123), TRUNC(10.541), TRUNC(11.001) 
FROM DUAL;

SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001), POWER(0, 3.0001)
FROM DUAL;

SELECT SQRT(2), SQRT(5), SQRT(3) 
FROM DUAL;

SELECT MOD(19, 4), MOD(19.541, 4.2), MOD(11, 3) 
FROM DUAL;

SELECT REMAINDER(19, 4), REMAINDER(19.541, 4.2), REMAINDER(11, 3) 
FROM DUAL;

SELECT EXP(2), LN(2.713), LOG(10, 100) 
FROM DUAL;

--�����Լ�
SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye')
FROM DUAL;

SELECT LOWER('NEVER SAY GOODBYE')
FROM DUAL;

SELECT UPPER('never say goodbye')
FROM DUAL;

SELECT CONCAT('I Have', 'A Dream'), 'I Have' || 'A Dream'
FROM DUAL;

SELECT SUBSTR('ABCD EFG', 1, 4)
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG', -1, 4)
FROM DUAL;

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸿼һ�', 1, 4)
FROM DUAL;

SELECT LTRIM('ABCDEFGABC','ABC'), LTRIM('�����ٶ�','��')
FROM DUAL;

SELECT RTRIM('ABCDEFGABC','ABC'), RTRIM('�����ٶ�','��')
FROM DUAL;

SELECT LPAD('111-1111',12, '(02)'), RPAD('111-1111',12,'(02)')
FROM DUAL;

CREATE TABLE ex4_1 (
    phone_num VARCHAR2(30)
);

INSERT INTO ex4_1 VALUES ('111-1111');
INSERT INTO ex4_1 VALUES ('222-2222');
INSERT INTO ex4_1 VALUES ('333-3333');

SELECT *
FROM ex4_1;

SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT RPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '��', '��') AS rep,
TRANSLATE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?', '����', '�ʸ�') AS trn
FROM DUAL;

-- ������ , '����', 1, 1 �� ����.
SELECT INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����') AS INSTR1,
     INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5) AS INSTR2,
      INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����', 5, 2) AS INSTR3
FROM DUAL;

SELECT LENGTH('���ѹα�'),
      LENGTHB('���ѹα�')
FROM DUAL;

--��¥ �Լ�
SELECT SYSDATE, SYSTIMESTAMP
FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 1)) mon1,
    MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1), SYSDATE) mon2
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '�ݿ���')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE + 7, '�ݿ���') AS next_friday
FROM DUAL;
SELECT NEXT_DAY(SYSDATE + 7, '�����') AS next_thursday
FROM DUAL;

--��ȯ�Լ�
SELECT TO_CHAR(123456789, '999,999,999')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_NUMBER('123456')
FROM DUAL;

SELECT TO_DATE('20540101', 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_TIMESTAMP('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

SELECT NEXT_DAY(TO_DATE('20140101', 'YYYY-MM-DD'), '�ݿ���')
FROM DUAL;

--HJH_chap04_ex1
--������̺�(employees)���� phone_number��� �÷��� ����� ��ȭ��ȣ�� ###.###.#### ���·� ����Ǿ� �ִ�.
--���⼭ ó�� 3�ڸ� ���� ��� ���� ������ȣ�� (02)�� �ٿ� ��ȭ��ȣ�� ����ϵ��� ������ �ۼ��� ����.
SELECT '(' || '02' || ') ' || SUBSTR(phone_number, 4) AS seoul_phone_number
FROM employees;


--�������� �������� ������̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻��� ����� ������ ���� ������ ����� ����ϵ��� �ۼ��غ���.
--(�ټӳ���� ���� ���������� ����� �������� ����)
SELECT employee_id AS "�����ȣ",
            emp_name AS "�����",
            hire_date AS "�Ի�����",
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS "�ټӳ��"
FROM employees
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) >= 10
ORDER BY 4 DESC;

--�� ���̺�(CUSTOMERS)���� �� ��ȭ��ȣ(cust_main_phone_number) �÷��� �ִ�. 
--�� �÷� ���� ###-###-#### �����ε�, '-' ��� '/'�� �ٲ� ����ϴ� ������ �ۼ��� ����
SELECT REPLACE(cust_main_phone_number, '-', '/') AS modified_phone_number
FROM CUSTOMERS;
