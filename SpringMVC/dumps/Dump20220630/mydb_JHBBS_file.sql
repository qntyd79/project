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
-- Table structure for table `JHBBS_file`
--

DROP TABLE IF EXISTS `JHBBS_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JHBBS_file` (
  `file_idx` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_hash_name` varchar(255) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_ext` varchar(100) NOT NULL,
  `download` int NOT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `del` varchar(2) NOT NULL DEFAULT 'N',
  `board_idx` int DEFAULT '0',
  `member_idx` int DEFAULT '0',
  `email_idx` int DEFAULT '0',
  `category_idx` int DEFAULT '1',
  PRIMARY KEY (`file_idx`),
  KEY `fk_board_idx` (`board_idx`),
  KEY `fk_member_idx` (`member_idx`),
  KEY `fk_email_idx` (`email_idx`),
  CONSTRAINT `fk_board_idx` FOREIGN KEY (`board_idx`) REFERENCES `JHBBS_board` (`board_idx`),
  CONSTRAINT `fk_email_idx` FOREIGN KEY (`email_idx`) REFERENCES `JHBBS_email` (`email_idx`),
  CONSTRAINT `fk_member_idx` FOREIGN KEY (`member_idx`) REFERENCES `JHBBS_member` (`member_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JHBBS_file`
--

LOCK TABLES `JHBBS_file` WRITE;
/*!40000 ALTER TABLE `JHBBS_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `JHBBS_file` ENABLE KEYS */;
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
