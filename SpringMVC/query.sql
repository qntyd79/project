INSERT INTO `mydb`.`jhbbs_bbs_category` (`category_idx`, `title`, `name`, `pass`, `total`, `idx`, `cipp`, `regdate`, `del`, `board_idx`) VALUES ('6', '일반', '홍길동', '123456', '0', '0', '192.168.0.141', '2019-04-03', 'N', '0');

select board_idx,title from mydb.jhbbs_bbs_board where board_idx < 2 order by board_idx asc limit 1;

select max(board_idx) from mydb.jhbbs_bbs_board;

select count(notice) from mydb.jhbbs_bbs_board where notice > 0;

select pass from mydb.jhbbs_bbs_board where board_idx =	1009;

SELECT * FROM mydb.jhbbs_bbs_board;

ALTER TABLE `mydb`.`JHBBS_bbs_board` AUTO_INCREMENT=1;

SELECT * FROM mydb.jhbbs_bbs_comment;

ALTER TABLE `mydb`.`JHBBS_bbs_comment` AUTO_INCREMENT=1;

DELETE FROM `mydb`.`jhbbs_bbs_board` WHERE (`board_idx` = '1016');

DELETE FROM `mydb`.`jhbbs_bbs_board` WHERE `board_idx` between "1" and "17";

DELETE FROM `mydb`.`jhbbs_bbs_comment` WHERE `comment_idx` between "1" and "8";

alter table `mydb`.`jhbbs_bbs_board` add del varchar(2) not null default 'Y'; 

alter table `mydb`.`jhbbs_bbs_category` add del varchar(2) not null default 'N'; 

alter table `mydb`.`jhbbs_bbs_category` add hit INT(10) NOT NULL; 

alter table `mydb`.`jhbbs_bbs_category` add pass varchar(100) not null; 

alter table `mydb`.`jhbbs_bbs_attach` add title varchar(100) not null; 

alter table `mydb`.`jhbbs_bbs_attach` add del varchar(2) not null default 'N'; 

UPDATE `mydb`.`jhbbs_bbs_board` SET `del` = 'N' WHERE (`board_idx` = '2');

UPDATE `mydb`.`jhbbs_bbs_board` SET `del` = 'N' WHERE `board_idx` between "2" and "9";

select * from `mydb`.`jhbbs_bbs_board` where board_idx > 0 and del = 'N'  order by parent desc, sortno asc limit 1, 10;

select count(notice) from mydb.jhbbs_bbs_board where notice = 1;

select count(board_idx) from mydb.jhbbs_bbs_board where board_idx > 0;

select * from mydb.jhbbs_bbs_board where board_idx > 0 AND  name LIKE '%홍길동%' order by board_idx desc, regdate desc limit 1, 10;

DELETE FROM mydb.JHBBS_bbs_board WHERE board_idx BETWEEN 1032 AND 1045;

UPDATE `mydb`.`JHBBS_bbs_board` SET `parent`='1' WHERE `board_idx`='1';

select max(board_idx) from mydb.jhbbs_bbs_board;

DELETE FROM `mydb`.`JHBBS_bbs_board` WHERE `board_idx`='7';

/* 테이블 초기화 */
truncate mydb.jhbbs_bbs_board;

ALTER TABLE `mydb`.`JHBBS_category` CHANGE COLUMN `idx` `kind` INT(10) NULL DEFAULT NULL ;
