--1. Equi������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϼ���. 
SELECT e.ename, e.dno, d.dname 
  FROM employee e, department d
  WHERE e.dno = d.dno
   AND e.ename='SCOTT'; 

--2. Inner ���ΰ� on�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����ϼ���. 
SELECT e.ename, d.dname, d.loc 
  FROM employee e
  INNER JOIN department d
    ON e.dno = d.dno; 
    
--3. INNER ���� Using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� 
--��� �������� ���� ����� �μ��� �������� �����Ͽ� ����ϼ���. 
SELECT dno, job, loc 
FROM employee
INNER JOIN department 
USING(dno) 
WHERE dno=10; 

--4. Equal ���ΰ� Wildī�带 ����ؼ� 
--�̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����ϼ���, 
SELECT e.ename, d.dname 
    FROM employee e, department d 
    WHERE e.dno=d.dno 
        AND e.ename LIKE '%A%'; 
        
--5. Self Join�� ����Ͽ� ����� �̸��� ��� ��ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����ϼ���.  
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)         
SELECT e.ename AS "Employee", 
             e.manager AS "Emp#", 
             m.ename AS "Manager", 
             m.eno AS "Mgr#" 
    FROM employee e, employee m 
    WHERE e.manager = m.eno; 
    
--6. Self������ ����Ͽ� ������ ����� �̸�('SCOTT'), �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����ϼ���  
-- �� ���� ��Ī�� �̸�, �μ���ȣ, ����� �����ϼ��� 
SELECT me.ename AS "�̸�", me.dno AS "�μ���ȣ", other.ename AS "����" 
    FROM employee me, employee other 
  WHERE me.dno=other.dno 
    AND me.ename='SCOTT' 
    AND other.ename<>'SCOTT'; 
    
--7. Self ������ ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����ϼ���.
SELECT other.ename, other.hiredate 
  FROM employee ward, employee other 
 WHERE other.hiredate > ward.hiredate 
   AND ward.ename='WARD'
 ORDER BY other.hiredate; 

-- 8. Self������ ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��԰� �Բ� ����ϼ���. 
-- �� ���� ��Ī�� ����̸�(Ename) ����Ի���(HIERDATE) ������ �̸�(Ename) ������ �Ի���(HIERDATE)�� ����ϼ���. 
SELECT other.ename AS "Ename", other.hiredate AS "HIERDATE",
            mgr.ename AS "Ename", mgr.hiredate AS "HIERDATE" 
    FROM employee mgr, employee other 
  WHERE other.manager = mgr.eno 
    AND other.hiredate <= mgr.hiredate; 









