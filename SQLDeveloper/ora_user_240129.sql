CREATE TABLE ex2_1 (
    COLUMN1     CHAR(10),
    COLUMN2     VARCHAR2(10),
    COLUMN3     NVARCHAR2(10),
    COLUMN4     NUMBER
    );
    
INSERT INTO ex2_1 ( column1, column2 ) VALUES ('abc', 'abc');

SELECT column1, LENGTH(column1) as len1,
    column2, LENGTH(column2) as len2
FROM ex2_1;

CREATE TABLE ex2_2 (
    COLUMN1     VARCHAR2(3),
    COLUMN2     VARCHAR2(3 byte),
    COLUMN3     VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES ('abc', 'abc', 'abc');

SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2,
       column3, LENGTH(column3) as len3
FROM ex2_2;

INSERT INTO ex2_2 VALUES ('全辨悼', '全辨悼', '全辨悼');

INSERT INTO ex2_2 (column3) VALUES ('全辨悼');

INSERT INTO ex2_2 VALUES ('全', '全', '全辨悼');

SELECT column3, LENGTH(column3) as len3, LENGTHB(column3) AS bytelen
FROM ex2_2;
