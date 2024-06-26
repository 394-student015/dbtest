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
		id INTEGER DEFAULT 1 NOT NULL IDENTITY,
		name VARCHAR(30) NOT NULL,
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
		id INTEGER NOT NULL IDENTITY,
		name VARCHAR(30) NOT NULL
);

/**********************************/
/* テーブル名: 教授テーブル */
/**********************************/
CREATE TABLE professor(
		id INTEGER NOT NULL IDENTITY,
		name VARCHAR(30) NOT NULL,
		major VARCHAR(30) NOT NULL
);

/**********************************/
/* テーブル名: 教科書テーブル */
/**********************************/
CREATE TABLE textbook(
		id INTEGER NOT NULL IDENTITY,
		title VARCHAR(50) NOT NULL,
		author VARCHAR(30) NOT NULL,
		price INTEGER NOT NULL,
		stock INTEGER NOT NULL,
		professor_id INTEGER NOT NULL,
		class_id INTEGER NOT NULL
);

/**********************************/
/* テーブル名: 購入情報テーブル */
/**********************************/
CREATE TABLE information(
		id INTEGER NOT NULL IDENTITY,
		member_id INTEGER NOT NULL,
		text_id INTEGER NOT NULL,
		date DATE NOT NULL,
		totalprice INTEGER NOT NULL,
		payment INTEGER NOT NULL,
		receive INTEGER NOT NULL
);

/**********************************/
/* テーブル名: 管理者テーブル */
/**********************************/
CREATE TABLE management(
		password VARCHAR(10) NOT NULL
);


ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (id);

ALTER TABLE class ADD CONSTRAINT IDX_class_PK PRIMARY KEY (id);

ALTER TABLE professor ADD CONSTRAINT IDX_professor_PK PRIMARY KEY (id);

ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_PK PRIMARY KEY (id);
ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_FK0 FOREIGN KEY (class_id) REFERENCES class (id);
ALTER TABLE textbook ADD CONSTRAINT IDX_textbook_FK1 FOREIGN KEY (professor_id) REFERENCES professor (id);

ALTER TABLE information ADD CONSTRAINT IDX_information_PK PRIMARY KEY (id);
ALTER TABLE information ADD CONSTRAINT IDX_information_FK0 FOREIGN KEY (text_id) REFERENCES textbook (id);
ALTER TABLE information ADD CONSTRAINT IDX_information_FK1 FOREIGN KEY (member_id) REFERENCES member (id);

ALTER TABLE management ADD CONSTRAINT IDX_management_PK PRIMARY KEY (password);

