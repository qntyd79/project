INSERT INTO `mydb`.`jhbbs_category` (`category_idx`, `title`, `name`, `pass`, `total`, `idx`, `cipp`, `regdate`, `del`, `board_idx`) VALUES ('6', '일반', '홍길동', '123456', '0', '0', '192.168.0.141', '2019-04-03', 'N', '0');

select board_idx,title from mydb.jhbbs_board where board_idx < 2 order by board_idx asc limit 1;

select max(board_idx) from mydb.jhbbs_board;

select count(notice) from mydb.jhbbs_board where notice > 0;

select pass from mydb.jhbbs_board where board_idx =	1009;

SELECT * FROM mydb.jhbbs_board;

ALTER TABLE `mydb`.`JHBBS_board` AUTO_INCREMENT=1;

SELECT * FROM `mydb`.`JHBBS_comment`;

Select * from mydb.JHBBS_category;
ALTER TABLE `mydb`.`JHBBS_comment` AUTO_INCREMENT=1;

DELETE FROM `mydb`.`jhbbs_board` WHERE (`board_idx` = '1016');

DELETE FROM `mydb`.`jhbbs_board` WHERE `board_idx` between "1" and "17";

DELETE FROM `mydb`.`jhbbs_comment` WHERE `comment_idx` between "1" and "8";

alter table `mydb`.`jhbbs_board` add del varchar(2) not null default 'Y'; 

alter table `mydb`.`jhbbs_category` add del varchar(2) not null default 'N'; 

alter table `mydb`.`jhbbs_category` add hit INT(10) NOT NULL; 

alter table `mydb`.`jhbbs_category` add pass varchar(100) not null; 

alter table `mydb`.`jhbbs_attach` add title varchar(100) not null; 

alter table `mydb`.`jhbbs_attach` add del varchar(2) not null default 'N'; 

UPDATE `mydb`.`jhbbs_board` SET `del` = 'N' WHERE (`board_idx` = '2');

UPDATE `mydb`.`jhbbs_board` SET `del` = 'N' WHERE `board_idx` between "2" and "9";

select * from `mydb`.`jhbbs_board` where board_idx > 0 and del = 'N'  order by parent desc, sortno asc limit 1, 10;

select count(notice) from mydb.jhbbs_board where notice = 1;

select count(board_idx) from mydb.jhbbs_board where board_idx > 0;

select * from mydb.jhbbs_board where board_idx > 0 AND name LIKE '%홍길동%' order by board_idx desc, regdate desc limit 1, 10;

DELETE FROM mydb.JHBBS_board WHERE board_idx BETWEEN 1032 AND 1045;

UPDATE `mydb`.`JHBBS_board` SET `parent`='1' WHERE `board_idx`='1';

select max(board_idx) from mydb.jhbbs_bbs_board;

DELETE FROM `mydb`.`JHBBS_board` WHERE `board_idx`='7';

/* 테이블 초기화 */
SET FOREIGN_KEY_CHECKS = 0; -- Disable foreign key checking.
truncate mydb.jhbbs_comment;
ALTER TABLE `mydb`.`JHBBS_category` CHANGE COLUMN `idx` `kind` INT(10) NULL DEFAULT NULL ;

UPDATE `mydb`.`JHBBS_comment` SET `email` = 'qntyd79@naver.com' WHERE (`comment_idx` = '4');

/* 외래키 설정 */
/*ALTER TABLE `mydb`.`JHBBS_file` ADD CONSTRAINT `fk_board_idx` FOREIGN KEY (`board_idx`) REFERENCES `mydb`.`JHBBS_board` (`board_idx`);
ALTER TABLE `mydb`.`JHBBS_file` ADD CONSTRAINT `fk_member_idx` FOREIGN KEY (`member_idx`) REFERENCES `mydb`.`JHBBS_member` (`member_idx`);
ALTER TABLE `mydb`.`JHBBS_file` ADD CONSTRAINT `fk_email_idx` FOREIGN KEY (`email_idx`) REFERENCES `mydb`.`JHBBS_email` (`email_idx`);*/
ALTER TABLE `mydb`.`JHBBS_comment` ADD CONSTRAINT `fk_comment_idx` FOREIGN KEY (`board_idx`) REFERENCES `mydb`.`JHBBS_board` (`board_idx`);


/* 회원정보에 카테고리 조인 */
select * from mydb.jhbbs_member AS m JOIN mydb.jhbbs_category AS c ON  m.category_idx = c.category_idx WHERE c.category_idx > 0 and m.del = 'N';