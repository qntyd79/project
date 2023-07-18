/* 20230718 */
/* 게시판테이블 */
CREATE TABLE IF NOT EXISTS mydb.JHBBS_board (
board_idx		INT(10) NOT NULL AUTO_INCREMENT,
parent		  	INT(10) NOT NULL,
depth 			INT(10) NOT NULL,
sortno 			INT(10) NOT NULL,         
userid			VARCHAR(100),
name 			VARCHAR(100) NOT NULL,          
pass 			VARCHAR(100) NOT NULL,          
email 			VARCHAR(100),           
homepage 		VARCHAR(100), 
link1 			VARCHAR(100),
link2 			VARCHAR(100),
title 			VARCHAR(100) NOT NULL,        
content 		LONGTEXT NOT NULL,
hit 			INT(10) NOT NULL,          
cipp 			VARCHAR(30) DEFAULT '127.0.0.1', 
tag 			INT(2) DEFAULT '0',
secret			INT(2) DEFAULT '0',
notice 			INT(2) DEFAULT '0',
vote			INT(10) DEFAULT '0',
sdate           VARCHAR(30),
edate           VARCHAR(30),
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
filecnt			INT(10) DEFAULT '0',
commentcnt		INT(10) DEFAULT '0',
category_idx 	INT(10) DEFAULT '1',
comment_idx		INT(10) DEFAULT '0',
file_idx		INT(10) DEFAULT '0',
member_idx 		INT(10) DEFAULT '0',
PRIMARY KEY(board_idx)
);

/* 카테고리테이블 */
CREATE TABLE IF NOT EXISTS  mydb.JHBBS_category (
category_idx	INT(10) NOT NULL AUTO_INCREMENT,
parent		  	INT(10) NOT NULL,
depth 			INT(10) NOT NULL,
sortno 			INT(10) NOT NULL,      
title 			VARCHAR(100) NOT NULL DEFAULT '일반',
name 			VARCHAR(100) NOT NULL,
pass 			VARCHAR(100) NOT NULL,        			
total	 		INT(10) DEFAULT '0',
kind	 		INT(10) DEFAULT '0',
hit 			INT(10) NOT NULL,  
cipp 			VARCHAR(30) DEFAULT '127.0.0.1',
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
board_idx 		INT(10) DEFAULT '0',
member_idx 		INT(10) DEFAULT '0',
email_idx       INT(10) DEFAULT '0',
PRIMARY KEY (category_idx)
);

/* 코멘트테이블 */
CREATE TABLE IF NOT EXISTS  mydb.JHBBS_comment (
comment_idx		INT(10) NOT NULL AUTO_INCREMENT,
parent		  	INT(10) NOT NULL,
depth 			INT(10) NOT NULL,
sortno 			INT(10) NOT NULL,         
userid			VARCHAR(100),
name 			VARCHAR(100) NOT NULL,          
pass 			VARCHAR(100) NOT NULL,          
email 			VARCHAR(100),       
content 		LONGTEXT NOT NULL,
hit 			INT(10) NOT NULL,          
cipp 			VARCHAR(30) DEFAULT '127.0.0.1',
vote 			INT(10) DEFAULT '0',
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
board_idx 		INT(10) DEFAULT '0',
PRIMARY KEY (comment_idx)
);

/* 게시판연동 파일테이블 */
CREATE TABLE IF NOT EXISTS  mydb.JHBBS_file (
file_idx		INT(10) NOT NULL AUTO_INCREMENT,
file_name 		VARCHAR(255) NOT NULL,
file_hash_name 	VARCHAR(255) NOT NULL,
file_size 		VARCHAR(100) NOT NULL,
file_type		VARCHAR(100) NOT NULL,
file_ext		VARCHAR(100) NOT NULL,
download 		INT(10) NOT NULL,  
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
board_idx 		INT(10) DEFAULT '0',
category_idx 	INT(10) DEFAULT '1',
member_idx      INT(10) DEFAULT '0',
email_idx       INT(10) DEFAULT '0',
PRIMARY KEY (file_idx)
);

/* 회원테이블 */
CREATE TABLE  IF NOT EXISTS mydb.JHBBS_member (
member_idx		INT(10) NOT NULL AUTO_INCREMENT,
userid			VARCHAR(10) NOT NULL,
pass 			VARCHAR(100) NOT NULL,
pass_ask		VARCHAR(100) NOT NULL,
pass_account 	VARCHAR(100) NOT NULL,
name 			VARCHAR(100) NOT NULL,
nickname		VARCHAR(100) NOT NULL,
/*jumin1		VARCHAR(10) NOT NULL,
jumin2 			VARCHAR(10) NOT NULL,*/
email 			VARCHAR(100) NOT NULL,           
homepage 		VARCHAR(100) NOT NULL,    
zipcode			VARCHAR(20) NOT NULL,
address			VARCHAR(100) NOT NULL,
detailaddress	VARCHAR(100) NOT NULL,
extraaddress	VARCHAR(100) NOT NULL,
phone			VARCHAR(20) NOT NULL,
hphone			VARCHAR(20) NOT NULL,
job				VARCHAR(30),
attach 			VARCHAR(50),
message			LONGTEXT NULL,
etc				LONGTEXT NULL,
mail_check		INT(2) DEFAULT '1',
/*com_name 		VARCHAR(50),
com_homepage 	VARCHAR(50),
com_station 	VARCHAR(50),
com_position 	VARCHAR(50),
com_zipcode		VARCHAR(20),
com_address1	VARCHAR(100),
com_address2	VARCHAR(100),
com_phone		VARCHAR(20),
com_fax			VARCHAR(20),
*/
level			INT(10) NOT NULL DEFAULT '10',
point			INT(10) NOT NULL DEFAULT '100',
approval		INT(10) NOT NULL DEFAULT '0',
join_date		DATETIME DEFAULT CURRENT_TIMESTAMP,
login_last		VARCHAR(30) DEFAULT '127.0.0.1',
login_cnt		INT(10) DEFAULT '0',
login_ip		VARCHAR(30) DEFAULT '127.0.0.1',
user_leave		INT(10) DEFAULT '0',
cipp 			VARCHAR(30) DEFAULT '127.0.0.1',
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
category_idx 	INT(10) NOT NULL DEFAULT '1',
add_frm1		VARCHAR(100),
add_frm2		VARCHAR(100),
add_frm3		VARCHAR(100),
add_frm4		VARCHAR(100),
add_frm5		VARCHAR(100),
add_frm6		VARCHAR(100),
add_frm7		VARCHAR(100),
add_frm8		VARCHAR(100),
add_frm9		VARCHAR(100),
add_frm10		VARCHAR(100),
PRIMARY KEY(member_idx)
);

/* 이메일테이블 */
CREATE TABLE  IF NOT EXISTS mydb.JHBBS_email (
email_idx		INT(10) NOT NULL AUTO_INCREMENT,
userid			VARCHAR(10) NOT NULL,
pass 			VARCHAR(100) NOT NULL,
toemail 		VARCHAR(100) NOT NULL,    
sendemail 		VARCHAR(100) NOT NULL,                  
title 			VARCHAR(100) NOT NULL,   
content			LONGTEXT NOT NULL,   
hit 			INT(10) NOT NULL,     
cipp 			VARCHAR(30) NOT NULL,       
regdate 		DATETIME DEFAULT CURRENT_TIMESTAMP,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
category_idx 	INT(10) DEFAULT '1',
PRIMARY KEY(email_idx)
);

/* 게시판 기본분류 */
INSERT INTO mydb.JHBBS_category (category_idx, parent, depth, sortno, title, name, pass, total, kind, hit, cipp, regdate, del, board_idx, member_idx) 
VALUES ('1', '1', '0', '0', '일반', '관리자', 'admin!@1234', '0', '1', '0', '127.0.0.1', CURRENT_TIMESTAMP(), 'N', '0', '0'); 

/* 회원게시판 기본분류 */
INSERT INTO mydb.JHBBS_category (category_idx, parent, depth, sortno, title, name, pass, total, kind, hit, cipp, regdate, del, board_idx, member_idx) 
VALUES ('2', '2', '0', '0', '일반회원', '관리자', 'admin!@1234', '0', '2', '0', '127.0.0.1', CURRENT_TIMESTAMP(), 'N', '0', '0'); 

/* 메일게시판 기본분류 */
INSERT INTO mydb.JHBBS_category (category_idx, parent, depth, sortno, title, name, pass, total, kind, hit, cipp, regdate, del, board_idx, member_idx) 
VALUES ('3', '3', '0', '0', '수신', '관리자', 'admin!@1234', '0', '3', '0', '127.0.0.1', CURRENT_TIMESTAMP(), 'N', '0', '0'); 

/* FOREIGN KEY 설정 */
ALTER TABLE mydb.JHBBS_comment ADD CONSTRAINT `fk_comment_idx` FOREIGN KEY (`board_idx`) REFERENCES mydb.JHBBS_board (`board_idx`);
ALTER TABLE mydb.JHBBS_file ADD CONSTRAINT `fk_board_idx` FOREIGN KEY (`board_idx`) REFERENCES mydb.JHBBS_board (`board_idx`);

ALTER TABLE mydb.JHBBS_file ADD CONSTRAINT `fk_member_idx` FOREIGN KEY (`member_idx`) REFERENCES mydb.JHBBS_member (`member_idx`);

ALTER TABLE mydb.JHBBS_file ADD CONSTRAINT `fk_email_idx` FOREIGN KEY (`email_idx`) REFERENCES mydb.JHBBS_email (`email_idx`);*/
