CREATE DATABASE db_library;

USE db_library;

CREATE TABLE tbl_admin_member(
	a_m_no	INT	AUTO_INCREMENT,
	a_m_approval INT NOT NULL DEFAULT 0,
	a_m_id	VARCHAR(20)	NOT NULL,
	a_m_pw   VARCHAR(100) 	NOT NULL,
	a_m_name VARCHAR(20) 	NOT NULL,
	a_m_gender 	CHAR(1) NOT NULL,
	a_m_part VARCHAR(20) NOT NULL,
	a_m_position VARCHAR(20) NOT NULL,
	a_m_mail VARCHAR(50) NOT NULL,
	a_m_phone VARCHAR(20) NOT NULL,
	a_m_reg_date DATETIME,
	a_m_mod_date DATETIME,
	PRIMARY KEY(a_m_no)
	);
	
	SELECT * FROM tbl_admin_member;
	
tbl_admin_memberINSERT INTO tbl_admin_member (a_m_approval, a_m_id, a_m_pw, a_m_name, a_m_gender, a_m_part, a_m_position, a_m_mail, a_m_phone, a_m_reg_date, a_m_mod_date)
VALUES (1, 'admin2', '1234', 'Admin Name', 'M', 'Administration', 'Admin', 'admin@example.com', '123-456-7890', NOW(), NOW());
	
tbl_admin_memberDELETE FROM tbl_admin_member WHERE a_m_id = 'admin2';