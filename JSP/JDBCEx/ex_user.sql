DROP TABLE member;

CREATE TABLE member(
    name varchar2(10) primary key,
    userid varchar2(10),
    userpwd varchar2(10),
    email varchar2(20),
    phone char(13),
    admin number(1) default 0 --0:�����, 1:������
);

INSERT INTO member
values ('��浿','ko','1234','ko@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('�ڱ浿','park','1234','park@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('�̱浿','lee','1234','lee@naver.com','010-1234-5678', 1);
INSERT INTO member
values ('��浿','jang','1234','jang@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('ȫ�浿','hong','1234','hong@naver.com','010-1234-5678', 0);

commit