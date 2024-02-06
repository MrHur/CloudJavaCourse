--eqaul(����) ������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϼ���.

SELECT
    e.ename,
    e.dno,
    d.dname
FROM
         employee e
    JOIN department d ON e.dno = d.dno
WHERE
    e.ename = 'SCOTT';
    
--Inner ���ΰ� ON�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����ϼ���.

SELECT
    e.ename,
    d.dname,
    d.loc
FROM
         employee e
    JOIN department d ON e.dno = d.dno;

--INNER ���� Using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� �������� ���� ����� �μ��� �������� �����Ͽ� ����ϼ���.

SELECT
    dno,
    job,
    loc
FROM
         employee
    INNER JOIN department USING ( dno )
WHERE
    dno = 10;


--Equal ���ΰ� Wildī�带 ����ؼ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����ϼ���.

SELECT
    e.ename,
    d.dname
FROM
         employee e
    JOIN department d ON e.dno = d.dno
WHERE
    e.ename LIKE '%A%';
    
-- Self Join�� ����Ͽ� ����� �̸��� ��� ��ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����ϼ���. 
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)

SELECT
  e1.ENAME AS Employee,
  e1.ENO AS "emp#",
  e2.ENAME AS Manager,
  e2.ENO AS "Mgr#"
FROM
  employee e1
JOIN
  employee e2 ON e1.MANAGER = e2.ENO;
  
--Self������ ����Ͽ� ������ ���(SCOTT)�� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����ϼ���.
--�� ���� ��Ī�� �̸�, �μ���ȣ, ����� �����ϼ���.

SELECT
  e1.ENAME AS �̸�,
  e1.DNO AS �μ���ȣ,
  e2.ENAME AS ����
FROM
  employee e1
JOIN
  employee e2 ON e1.DNO = e2.DNO
WHERE
  e1.ENAME = 'SCOTT' AND e1.ENO <> e2.ENO; --AND ���Ŀ� <> ������ SCOTT ������ �����ϴ� ������.

--Self ������ ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����ϼ���.
    
SELECT
  e1.ENAME AS �̸�,
  e1.HIREDATE AS �Ի���
FROM
  employee e1
JOIN
  employee e2 ON e1.HIREDATE > e2.HIREDATE
WHERE
  e2.ENAME = 'WARD';    
  
--Self������ ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��԰� �Բ� ����ϼ���. 
--�� ���� ��Ī�� ����̸�(Ename) ����Ի���(HIERDATE) ������ �̸�(Ename) ������ �Ի���(HIERDATE)�� ����ϼ���

SELECT
  e1.ENAME AS ����̸�,
  e1.HIREDATE AS ����Ի���,
  e2.ENAME AS �������̸�,
  e2.HIREDATE AS �������Ի���
FROM
  employee e1
JOIN
  employee e2 ON e1.MANAGER = e2.ENO
WHERE
  e1.HIREDATE <= e2.HIREDATE;