DROP TABLE management IF EXISTS;
DROP TABLE information IF EXISTS;
DROP TABLE textbook IF EXISTS;
DROP TABLE professor IF EXISTS;
DROP TABLE class IF EXISTS;
DROP TABLE member IF EXISTS;

/**********************************/
/* テーブル名: 会員テーブル */
/**********************************/
CREATE TABLE member(
		member_id INTEGER DEFAULT 1 NOT NULL IDENTITY,
		member_name VARCHAR(30) NOT NULL,
		address VARCHAR(40) NOT NULL,
		tel VARCHAR(12) NOT NULL,
		email VARCHAR(50) NOT NULL,
		password VARCHAR(10),
		coupon INTEGER NOT NULL
);

/**********************************/
/* テーブル名: 授業テーブル */
/**********************************/
CREATE TABLE class(
		class_id INTEGER NOT NULL IDENTITY,
		class_name VARCHAR(30) NOT NULL
);

/**********************************/
/* テーブル名: 教授テーブル */
/**********************************/
CREATE TABLE professor(
		pro_id INTEGER NOT NULL IDENTITY,
		pro_name VARCHAR(30) NOT NULL,
		major VARCHAR(30) NOT NULL
);

/**********************************/
/* テーブル名: 教科書テーブル */
/**********************************/
CREATE TABLE textbook(
		text_id INTEGER NOT NULL IDENTITY,
		title VARCHAR(50) NOT NULL,
		author VARCHAR(30) NOT NULL,
		price INTEGER NOT NULL,
		stock INTEGER NOT NULL,
		pro_id INTEGER NOT NULL,
		class_id INTEGER NOT NULL
);

/**********************************/
/* テーブル名: 購入情報テーブル */
/**********************************/
CREATE TABLE information(
		info_id INTEGER NOT NULL IDENTITY,
		member_id INTEGER NOT NULL,
		text_id INTEGER NOT NULL,
		date DATE NOT NULL,
		total_price INTEGER NOT NULL,
		payment INTEGER NOT NULL,
		receive INTEGER NOT NULL
);

/**********************************/
/* テーブル名: 管理者テーブル */
/**********************************/
CREATE TABLE management(
		manage_pass VARCHAR(10) NOT NULL
);


ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (member_id);

ALTER TABLE class ADD CONSTRAINT IDX_class_PK PRIMARY KEY (class_id);

ALTER TABLE professor ADD CONSTRAINT IDX_professor_PK PRIMARY KEY (pro_id);

ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_PK PRIMARY KEY (text_id);
ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_FK0 FOREIGN KEY (class_id) REFERENCES class (class_id);
ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_FK1 FOREIGN KEY (pro_id) REFERENCES professor (pro_id);

ALTER TABLE information ADD CONSTRAINT IDX_information_PK PRIMARY KEY (info_id);
ALTER TABLE information ADD CONSTRAINT IDX_information_FK0 FOREIGN KEY (text_id) REFERENCES textbook (text_id);
ALTER TABLE information ADD CONSTRAINT IDX_information_FK1 FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE management ADD CONSTRAINT IDX_management_PK PRIMARY KEY (manage_pass);

