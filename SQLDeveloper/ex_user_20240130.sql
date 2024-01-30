CREATE TABLE dept (
    dno   NUMBER(2),
    dname VARCHAR2(14),
    loc   VARCHAR2(13)
);

-- CTRL F7 자동 줄맞춤.
CREATE TABLE EMP (
    eno        NUMBER(4),
    ename      VARCHAR2(10),
    job        VARCHAR2(9),
    manager    NUMBER(4),
    hiredate   DATE,
    salary     NUMBER(7, 2),
    commission NUMBER(7, 2),
    dno        NUMBER(2)
);