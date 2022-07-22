-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `JHBBS_member`
--

DROP TABLE IF EXISTS `JHBBS_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JHBBS_member` (
  `member_idx` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `pass_ask` varchar(100) NOT NULL,
  `pass_account` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `homepage` varchar(100) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `detailaddress` varchar(100) NOT NULL,
  `extraaddress` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `hphone` varchar(20) NOT NULL,
  `job` varchar(30) DEFAULT NULL,
  `attach` varchar(50) DEFAULT NULL,
  `message` longtext,
  `etc` longtext,
  `mail_check` int DEFAULT '1',
  `level` int NOT NULL DEFAULT '10',
  `point` int NOT NULL DEFAULT '100',
  `approval` int NOT NULL DEFAULT '0',
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `login_last` varchar(30) DEFAULT '127.0.0.1',
  `login_cnt` int DEFAULT '0',
  `login_ip` varchar(30) DEFAULT '127.0.0.1',
  `user_leave` int DEFAULT '0',
  `cipp` varchar(30) DEFAULT '127.0.0.1',
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` varchar(2) NOT NULL DEFAULT 'N',
  `category_idx` int NOT NULL DEFAULT '1',
  `add_frm1` varchar(100) DEFAULT NULL,
  `add_frm2` varchar(100) DEFAULT NULL,
  `add_frm3` varchar(100) DEFAULT NULL,
  `add_frm4` varchar(100) DEFAULT NULL,
  `add_frm5` varchar(100) DEFAULT NULL,
  `add_frm6` varchar(100) DEFAULT NULL,
  `add_frm7` varchar(100) DEFAULT NULL,
  `add_frm8` varchar(100) DEFAULT NULL,
  `add_frm9` varchar(100) DEFAULT NULL,
  `add_frm10` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`member_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JHBBS_member`
--

LOCK TABLES `JHBBS_member` WRITE;
/*!40000 ALTER TABLE `JHBBS_member` DISABLE KEYS */;
INSERT INTO `JHBBS_member` VALUES (1,'qntyd79','$2a$10$51IMPILol8Uqk90ua/x.cepbHqc7lyP4n.JhXF76VrN6j9Ba7nBIa','2','이지혜','오정환','쿠쿠짱','qntyd79@naver.com','www.naver.com','34190','대전 유성구 봉명로 93','610-1302','(봉명동, 도안6단지 센트럴시티)','010-9937-2047','010-9937-2047','서비스업',NULL,'<p>고객님의 추가사항을 입력해 주세요</p>\r\n','<p>기타하실말씀 테스트입니다.</p>\r\n',1,10,100,0,'2022-06-15 11:23:50','127.0.0.1',0,'127.0.0.1',0,'127.0.0.1','2022-06-15 11:23:50','N',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'admin','$2a$10$rEcr9r2aLd6ibAH8I5M6oOP2mmHWo5hSsp6KLM.dKkCRUZsGAFXKO','1','발리','관리자','','qntyd0822@gmail.com','','34389','대전 대덕구 계족로 593','이엔지정보기술 2층','(중리동)','042-345-2246','010-9937-2047','선택',NULL,'','',1,1,100,0,'2022-06-22 11:51:33','192.168.1.62',0,'192.168.1.62',0,'192.168.1.62','2022-06-22 11:51:33','N',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'test','$2a$10$VayoANX/.Hz43XoJJwucFeOH1TNHtMAfhF3ScHX6J.qnU2BGyzr4G','1','발리','테스트','','test@co.kr','','34442','대전 대덕구 오정로 1','102호','(오정동)','042-856-5632','010-9937-2047','선택',NULL,'','',0,10,100,0,'2022-06-22 12:16:24','127.0.0.1',0,'127.0.0.1',0,'127.0.0.1','2022-06-22 12:16:24','N',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `JHBBS_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-30 13:57:56
