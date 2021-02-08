-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: notr
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dateien`
--

DROP TABLE IF EXISTS `dateien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dateien` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID-notizen` int(11) NOT NULL,
  `datei` blob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID-notizen` (`ID-notizen`),
  CONSTRAINT `FK_dateien_notizen` FOREIGN KEY (`ID-notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dateien`
--

LOCK TABLES `dateien` WRITE;
/*!40000 ALTER TABLE `dateien` DISABLE KEYS */;
/*!40000 ALTER TABLE `dateien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notizen`
--

DROP TABLE IF EXISTS `notizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `password_check` tinyint(1) NOT NULL,
  `password` varchar(34) DEFAULT NULL,
  `alarm` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen`
--

LOCK TABLES `notizen` WRITE;
/*!40000 ALTER TABLE `notizen` DISABLE KEYS */;
INSERT INTO `notizen` VALUES (1,'Testtitel',0,NULL,NULL,0,'2021-01-21 10:41:40'),(2,'Testtitel2123',0,NULL,NULL,0,'2021-01-17 10:41:40');
/*!40000 ALTER TABLE `notizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notizen-tags`
--

DROP TABLE IF EXISTS `notizen-tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizen-tags` (
  `ID-tags` int(11) NOT NULL,
  `ID-notizen` int(11) NOT NULL,
  PRIMARY KEY (`ID-tags`,`ID-notizen`),
  KEY `ID-tags` (`ID-tags`),
  KEY `ID-notizen` (`ID-notizen`),
  CONSTRAINT `FK_notizen-tags_notizen` FOREIGN KEY (`ID-notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notizen-tags_tags` FOREIGN KEY (`ID-tags`) REFERENCES `tags` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen-tags`
--

LOCK TABLES `notizen-tags` WRITE;
/*!40000 ALTER TABLE `notizen-tags` DISABLE KEYS */;
INSERT INTO `notizen-tags` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `notizen-tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notizen-text`
--

DROP TABLE IF EXISTS `notizen-text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizen-text` (
  `ID-notizen` int(11) NOT NULL,
  `ID-text` int(11) NOT NULL,
  PRIMARY KEY (`ID-notizen`,`ID-text`),
  KEY `ID-notizen` (`ID-notizen`,`ID-text`),
  KEY `FK_notizen-text_text` (`ID-text`),
  CONSTRAINT `FK_notizen-text_notizen` FOREIGN KEY (`ID-notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notizen-text_text` FOREIGN KEY (`ID-text`) REFERENCES `text` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen-text`
--

LOCK TABLES `notizen-text` WRITE;
/*!40000 ALTER TABLE `notizen-text` DISABLE KEYS */;
INSERT INTO `notizen-text` VALUES (1,1),(2,2),(2,3);
/*!40000 ALTER TABLE `notizen-text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'test'),(2,'arbeit');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `section` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam'),(2,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyamdfgdfgdfg'),(3,'test'),(4,'Simon Test');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 11:52:21
