DROP TABLE member;

CREATE TABLE member(
    name varchar2(10) primary key,
    userid varchar2(10),
    userpwd varchar2(10),
    email varchar2(20),
    phone char(13),
    admin number(1) default 0 --0:사용자, 1:관리자
);

INSERT INTO member
values ('고길동','ko','1234','ko@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('박길동','park','1234','park@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('이길동','lee','1234','lee@naver.com','010-1234-5678', 1);
INSERT INTO member
values ('장길동','jang','1234','jang@naver.com','010-1234-5678', 0);
INSERT INTO member
values ('홍길동','hong','1234','hong@naver.com','010-1234-5678', 0);

commit