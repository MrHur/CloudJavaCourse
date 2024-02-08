--Ʈ���� (EX_USER)
CREATE TABLE dept_origin
AS
SELECT * FROM department WHERE 0 = 1;

DROP TABLE dept_copy;
COMMIT;

CREATE TABLE dept_copy
AS
SELECT * FROM department WHERE 0=1;

--INSERT�� ������ Ʈ���Ÿ� ����
CREATE OR REPLACE TRIGGER trigger_sample
AFTER INSERT
ON dept_origin
for each row
BEGIN
IF inserting then
dbms_output.put_line('Insert Trigger �߻�');
insert into dept_copy
values (:new.dno, :new.dname, :new.loc);
END IF;
END;

INSERT INTO dept_origin
VALUES (10, 'ACCOUNTING', 'NEW YORK');

--UPDATE �� DELETE Ʈ����
ALTER TABLE dept_copy
ADD modtype NCHAR(2);

CREATE OR REPLACE TRIGGER trigger_sample2
AFTER UPDATE OR DELETE
ON dept_origin
FOR EACH ROW
DECLARE
    v_modtype NCHAR(2);
BEGIN
    IF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Updating Trigger �߻�');
        v_modtype := '����';
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Deleting Trigger �߻�');
        v_modtype := '����';
    END IF;
    
    INSERT INTO dept_copy (dno, dname, loc, modtype)
    VALUES (:OLD.dno, :OLD.dname, :OLD.loc, v_modtype);
END;
/

UPDATE dept_origin SET dno=30, dname='SALES', loc='CHICAGO'
WHERE dno=10;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;

DELETE FROM dept_origin
WHERE dno=30;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;