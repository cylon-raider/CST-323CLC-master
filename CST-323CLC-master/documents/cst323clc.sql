CREATE DATABASE  IF NOT EXISTS `cst323clc` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cst323clc`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cst323clc
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` int NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(50) NOT NULL,
  `PRODUCT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRODUCT_PRICE` float DEFAULT '0',
  `PRODUCT_QUANTITY` int DEFAULT '0',
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'The Pop Shoppe - Root Beer','Donec semper sapien a libero. Nam dui.',653.98,694),(2,'Beer - Creemore','Morbi a ipsum.',440.65,823),(3,'Mousse - Banana Chocolate','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',195.3,607),(4,'Beans - Yellow','Vivamus tortor. Duis mattis egestas metus.',309.4,416),(5,'Bagelers - Cinn / Brown','Ut tellus.',18.25,232),(6,'Tomato - Green','In blandit ultrices enim.',138.43,657),(7,'Soup Bowl Clear 8oz92008','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.',77.83,20),(8,'Cleaner - Pine Sol','Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',639.99,699),(9,'honey','large',99.99,1000),(10,'crickets','small',8.99,30),(11,'Cheese','large',1.99,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `ROLE_ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'manager'),(3,'employee'),(4,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE_NUMBER` varchar(10) NOT NULL,
  `USERNAME` varchar(32) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  `ROLE` int DEFAULT '4',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_EMAIL_uindex` (`EMAIL`),
  UNIQUE KEY `USER_USERNAME_uindex` (`USERNAME`),
  KEY `USER_ROLE_ROLE_ID_fk` (`ROLE`),
  CONSTRAINT `USER_ROLE_ROLE_ID_fk` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','test','test','0123456789','test','test',1,4),(3,'John','Doe','test2','6026535167','admin','1234',1,4),(4,'Bob','Smith','blah','0123456789','bsmith','$2a$10$8vly3ktWH9wN3QL0YohXleSI5udXANlNCx4u8GkNedSjCw3cMvmAq',1,4),(5,'Thomas','Anderson','neo@theone.com','0123456789','neo','$2a$10$VhTQNKgqzlu/HxxjT/o4COUx1tH54HYwlFbzrr6CGB04i7.9Q7cNu',1,4),(8,'John ','Smith','markel74@msn.com','6026535167','jsmith','$2a$10$B0QdOlUbOYY8uDFg334V.uLpCa9Kve.KQIPIEX9ZViDgRbfUk5/Hi',1,4),(10,'Chris','Markel','cmarkel@gmail.com','6026535167','jdoe','$2a$10$hu8jsYO1y8GadXZ/QeukDubXFZFM.uG3whA6qqcQcw6qVs33AfCga',1,4),(12,'bill','smith','bsmith@email.com','6026535167','billsmith','$2a$10$mVFiIM8yerOAT.DR.anCnOFivDcu5Qf6pbQCX.EAyUtPiPvyKUlz2',1,4),(16,'Joe','Smith','jsmith@aol.com','6021234567','jsmith1','$2a$10$MKfkia01uB7mxJbtFOZ0uOyu1rWeEiw.FdO2dVBTu1QYVDr9R3pWe',1,4),(17,'Biff','Tannen','btannen@gmail.com','6025555555','btannen','$2a$10$waZPtK6GCiJRH.lSQAo5yeItpo0iu5.v1sYJdYquHoS2LdekDtKx2',1,4),(20,'John','Doe','jdoe@gmail.com','5555555555','jdoe1','$2a$10$xS7f21fBagTUxi3FovOA/uGxls2VbQlpMid.DHE/63xSi2dLdW0Zm',1,4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-04 18:02:39
