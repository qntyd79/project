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
-- Table structure for table `JHBBS_category`
--

DROP TABLE IF EXISTS `JHBBS_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JHBBS_category` (
  `category_idx` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL,
  `depth` int NOT NULL,
  `sortno` int NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '일반',
  `name` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `total` int DEFAULT '0',
  `kind` int DEFAULT '0',
  `hit` int NOT NULL,
  `cipp` varchar(30) DEFAULT '127.0.0.1',
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` varchar(2) NOT NULL DEFAULT 'N',
  `board_idx` int DEFAULT '0',
  `member_idx` int DEFAULT '0',
  `email_idx` int DEFAULT '0',
  PRIMARY KEY (`category_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JHBBS_category`
--

LOCK TABLES `JHBBS_category` WRITE;
/*!40000 ALTER TABLE `JHBBS_category` DISABLE KEYS */;
INSERT INTO `JHBBS_category` VALUES (1,1,0,0,'일반','관리자','admin!@1234',0,1,2,'127.0.0.1','2022-03-24 13:31:16','N',0,0,0),(2,2,0,0,'일반회원','관리자','admin!@1234',0,2,0,'127.0.0.1','2022-03-24 13:31:16','N',0,0,0),(3,3,0,0,'수신','관리자','admin!@1234',0,3,0,'127.0.0.1','2022-03-24 13:31:16','N',0,0,0),(4,4,0,0,'정회원','오정환','$2a$10$.qS28dac1ekBiEqa0gMsQ.gk0PYwL3U1UnFT0lmZ1a0d1uGKOS9aW',0,2,0,'127.0.0.1','2022-06-15 00:00:00','N',0,0,0),(5,5,0,0,'관리자','오정환','$2a$10$6ygSqgmV2aMzyLMKwpbFxuFHQIvV.wWLynqtpjc6bHRzD/TOcyYxe',0,2,0,'127.0.0.1','2022-06-15 00:00:00','N',0,0,0),(6,6,0,0,'스프링','오정환','$2a$10$kHJZTfuBot8DCgfWMdzhwuSTGtcD4wkpk9IRJzBoOVTj7JRo/t9VS',0,1,7,'127.0.0.1','2022-06-15 00:00:00','N',0,0,0),(7,7,0,0,'전자정부','오정환','$2a$10$NBJ0K8DJtna3DmpVKWCuM.JQ7AAj0xxFEKFibUlOhUR5ohw8QVhO6',0,1,0,'127.0.0.1','2022-06-15 00:00:00','N',0,0,0),(8,8,0,0,'ajax','오정환','$2a$10$LGKkrN8BhMmDWXhwuz67Z.KE9OuiASESMZzfcNcgKmQ6p1U67SCUu',0,1,3,'127.0.0.1','2022-06-15 00:00:00','N',0,0,0);
/*!40000 ALTER TABLE `JHBBS_category` ENABLE KEYS */;
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
