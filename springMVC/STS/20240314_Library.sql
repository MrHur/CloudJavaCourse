db_library

CREATE TABLE tbl_book(
b_no	INT	AUTO_INCREMENT,
b_thumbnail   VARCHAR(100),
b_name VARCHAR(30) 	NOT NULL,
b_author 	VARCHAR(20) NOT NULL,
b_publisher VARCHAR(20) NOT NULL,
b_publish_year CHAR(4) NOT NULL,
b_isbn VARCHAR(30) NOT NULL,
b_call_number VARCHAR(30) NOT NULL,
b_rental_able TINYINT NOT NULL DEFAULT 1,
b_reg_date DATETIME,
b_mod_date DATETIME,
PRIMARY KEY(b_no)
);

SELECT * FROM tbl_book;

DROP TABLE tbl_book;

CREATE TABLE tbl_book(
b_no	INT	AUTO_INCREMENT,
b_thumbnail   VARCHAR(100),
b_name VARCHAR(30) 	NOT NULL,
b_author 	VARCHAR(20) NOT NULL,
b_publisher VARCHAR(20) NOT NULL,
b_publish_year CHAR(4) NOT NULL,
b_isbn VARCHAR(30) NOT NULL,
b_call_number VARCHAR(30) NOT NULL,
b_rantal_able TINYINT NOT NULL DEFAULT 1,
b_reg_date DATETIME,
b_mod_date DATETIME,
PRIMARY KEY(b_no)
);

CREATE TABLE tbl_user_member(
	u_m_no		INT 	AUTO_INCREMENT, 
	u_m_id		VARCHAR(20) 	NOT NULL, 
	u_m_pw		VARCHAR(100) 	NOT NULL, 
	u_m_name	VARCHAR(20) 	NOT NULL, 
	u_m_gender	CHAR(1) NOT NULL, 
	u_m_mail	VARCHAR(50) 	NOT NULL, 
	u_m_phone	VARCHAR(20) 	NOT NULL, 
	u_m_reg_date 	DATETIME, 
	u_m_mod_date	DATETIME, 
	PRIMARY KEY(u_m_no)
);

SELECT * FROM tbl_user_member;