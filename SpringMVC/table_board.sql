
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
content 		TEXT NOT NULL,
hit 			INT(10) NOT NULL,          
cipp 			VARCHAR(30) NOT NULL,       
tag 			INT(2) DEFAULT '0',
secret			INT(2) DEFAULT '0',
notice 			INT(2) DEFAULT '0',
vote			INT(10) DEFAULT '0',
sdate           VARCHAR(30),
edate           VARCHAR(30),
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
filecnt			INT(10) DEFAULT '0',
commentcnt			INT(10) DEFAULT '0',
category_idx 	INT(10) DEFAULT '1',
comment_idx		INT(10),
file_idx		INT(10),
member_idx 		INT(10),
PRIMARY KEY(board_idx)
);

CREATE TABLE IF NOT EXISTS  mydb.JHBBS_category (
category_idx	INT(10) NOT NULL AUTO_INCREMENT,
parent		  	INT(10) NOT NULL,
depth 			INT(10) NOT NULL,
sortno 			INT(10) NOT NULL,      
title 			VARCHAR(100) NOT NULL DEFAULT '일반',
name 			VARCHAR(100) NOT NULL,
pass 			VARCHAR(100) NOT NULL,        			
total	 		INT(10),
kind	 		INT(10),
hit 			INT(10) NOT NULL,  
cipp 			VARCHAR(30) NOT NULL,  
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
board_idx 		INT(10) NOT NULL,
member_idx 		INT(10) NOT NULL,
PRIMARY KEY (category_idx)
);

INSERT INTO mydb.JHBBS_category (category_idx, parent, depth, sortno, title, name, pass, total, kind, hit, cipp, regdate, del, board_idx, member_idx) 
VALUES ('1', '1', '0', '0', '일반', 'admin', '1111', '0', '1', '0', '', now(), 'N', '0', '0'); 

CREATE TABLE IF NOT EXISTS  mydb.JHBBS_comment (
comment_idx		INT(10) NOT NULL AUTO_INCREMENT,
parent		  	INT(10) NOT NULL,
depth 			INT(10) NOT NULL,
sortno 			INT(10) NOT NULL,         
userid			VARCHAR(100),
name 			VARCHAR(100) NOT NULL,          
pass 			VARCHAR(100) NOT NULL,          
email 			VARCHAR(100),       
content 		TEXT NOT NULL,
hit 			INT(10) NOT NULL,          
cipp 			VARCHAR(30) NOT NULL,
vote 			INT(10) DEFAULT '0',
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
member_idx 		INT(10) NOT NULL,
board_idx 		INT(10) NOT NULL,
PRIMARY KEY (comment_idx)
);

ALTER TABLE mydb.JHBBS_comment ADD CONSTRAINT `fk_comment_idx` FOREIGN KEY (`board_idx`) REFERENCES mydb.JHBBS_board (`board_idx`);

CREATE TABLE IF NOT EXISTS  mydb.JHBBS_file (
file_idx		INT(10) NOT NULL AUTO_INCREMENT,
file_name 		VARCHAR(255) NOT NULL,
file_hash_name 	VARCHAR(255) NOT NULL,
file_size 		VARCHAR(100) NOT NULL,
file_type		VARCHAR(100) NOT NULL,
file_ext		VARCHAR(100) NOT NULL,
download 		INT(10) NOT NULL,  
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
board_idx 		INT(10) NOT NULL,
PRIMARY KEY (file_idx)
);

ALTER TABLE mydb.JHBBS_file ADD CONSTRAINT `fk_file_idx` FOREIGN KEY (`board_idx`) REFERENCES mydb.JHBBS_board (`board_idx`);

CREATE TABLE IF NOT EXISTS  mydb.JHBBS_attach(
file_idx		INT(10) NOT NULL AUTO_INCREMENT,
file_name 		VARCHAR(255) NOT NULL,
file_hash_name 	VARCHAR(255) NOT NULL,
file_size 		VARCHAR(100) NOT NULL,
file_type		VARCHAR(100) NOT NULL,
file_ext		VARCHAR(100) NOT NULL,
download 		INT(10) NOT NULL,
userid			VARCHAR(100),
name 			VARCHAR(100) NOT NULL,
pass 			VARCHAR(100) NOT NULL,
title 			VARCHAR(100) NOT NULL,   
content			TEXT, 
hit 			INT(10) NOT NULL,       
cipp 			VARCHAR(30) NOT NULL, 
vote 			INT(10) DEFAULT '0',   
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
category_idx 	INT(10) DEFAULT '1',
board_idx 		INT(10) NOT NULL,
PRIMARY KEY (file_idx)
);

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
message			TEXT,
etc				VARCHAR(100),
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
level			INT(10) NOT NULL DEFAULT '0',
point			INT(10) NOT NULL DEFAULT '0',
approval		INT(10) NOT NULL DEFAULT '2',
join_date		VARCHAR(30) NOT NULL,
login_last		VARCHAR(30) NOT NULL,
login_cnt		INT(10) NOT NULL DEFAULT '0',
login_ip		VARCHAR(30) NOT NULL DEFAULT '0',
user_leave		INT(10) NOT NULL DEFAULT '0',
cipp 			VARCHAR(30) NOT NULL,
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
category_idx 	INT(10) DEFAULT '1',
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

CREATE TABLE  IF NOT EXISTS mydb.JHBBS_email (
email_idx		INT(10) NOT NULL AUTO_INCREMENT,
userid			VARCHAR(10) NOT NULL,
pass 			VARCHAR(100) NOT NULL,
toemail 		VARCHAR(100) NOT NULL,    
sendemail 		VARCHAR(100) NOT NULL,                  
title 			VARCHAR(100) NOT NULL,   
content			TEXT,   
hit 			INT(10) NOT NULL,     
cipp 			VARCHAR(30) NOT NULL,       
regdate 		DATETIME NOT NULL,
del 			VARCHAR(2) NOT NULL DEFAULT 'N',
PRIMARY KEY(email_idx)
);
