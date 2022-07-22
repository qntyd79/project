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
-- Table structure for table `JHBBS_comment`
--

DROP TABLE IF EXISTS `JHBBS_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JHBBS_comment` (
  `comment_idx` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL,
  `depth` int NOT NULL,
  `sortno` int NOT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `hit` int NOT NULL,
  `cipp` varchar(30) DEFAULT '127.0.0.1',
  `vote` int DEFAULT '0',
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` varchar(2) NOT NULL DEFAULT 'N',
  `board_idx` int DEFAULT '0',
  PRIMARY KEY (`comment_idx`),
  KEY `fk_comment_idx` (`board_idx`),
  CONSTRAINT `fk_comment_idx` FOREIGN KEY (`board_idx`) REFERENCES `JHBBS_board` (`board_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JHBBS_comment`
--

LOCK TABLES `JHBBS_comment` WRITE;
/*!40000 ALTER TABLE `JHBBS_comment` DISABLE KEYS */;
INSERT INTO `JHBBS_comment` VALUES (1,1,0,0,'webmaster','오정환','$2a$10$9HzP6ECSv1VK5Xcqk5kO/O3V1Dk8QTNnAVcTzEVUAC4rH6YdufMHa','qntyd79@naver.com','댓글테스트입니다.',0,'127.0.0.1',0,'2022-06-10 09:02:32','N',1),(2,2,0,0,'qntyd79','오정환','$2a$10$MLR3oLJxrQzXtC936yB/ruOuqFknzuWP0SoOZT8L8F0kLZ9ZOOkf.','qntyd79@naver.com','댓글테스트입니다.',0,'127.0.0.1',0,'2022-06-16 10:21:43','Y',16),(3,3,0,0,'admin','오정환','$2a$10$9931bjqOQqnIWA4QlyyUluTM8u.vvpQNm8T7lVF1W7wIsQAT3D142','qntyd79@naver.com','ajax가 안되고 있어요<br />\n목록으로 여러개의 데이터를 가져와야 하는데 참 복잡하네요<br />\n어떻게 하면 좋을까요<br />\n검토 부탁드립니다.<br />\n&nbsp;',0,'127.0.0.1',0,'2022-06-17 13:08:09','N',32),(4,4,0,0,'admin','관리자','$2a$10$DaJA7zvoaThWBBqLaGZZF.USTOtuBA/a89l.2twmKeS5HI/..uIJG','qntyd79@naver.com','dsfadsfasdf',0,'127.0.0.1',0,'2022-06-24 15:26:13','N',17);
/*!40000 ALTER TABLE `JHBBS_comment` ENABLE KEYS */;
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
