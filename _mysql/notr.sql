-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: notr
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen`
--

LOCK TABLES `notizen` WRITE;
/*!40000 ALTER TABLE `notizen` DISABLE KEYS */;
INSERT INTO `notizen` VALUES (1,'Arztermin',0,NULL,NULL,0,'2021-01-21 10:41:40'),(2,'Bestellung',0,NULL,NULL,0,'2021-01-17 10:41:40'),(3,'Essen gehen\r\n',0,NULL,NULL,0,'0000-00-00 00:00:00'),(4,'Einkaufszettel',0,NULL,NULL,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `notizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notizen_tags`
--

DROP TABLE IF EXISTS `notizen_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizen_tags` (
  `ID_tags` int(11) NOT NULL,
  `ID_notizen` int(11) NOT NULL,
  PRIMARY KEY (`ID_tags`,`ID_notizen`),
  KEY `ID-tags` (`ID_tags`),
  KEY `ID-notizen` (`ID_notizen`),
  CONSTRAINT `FK_notizen-tags_notizen` FOREIGN KEY (`ID_notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notizen-tags_tags` FOREIGN KEY (`ID_tags`) REFERENCES `tags` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen_tags`
--

LOCK TABLES `notizen_tags` WRITE;
/*!40000 ALTER TABLE `notizen_tags` DISABLE KEYS */;
INSERT INTO `notizen_tags` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `notizen_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notizen_text`
--

DROP TABLE IF EXISTS `notizen_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizen_text` (
  `ID_notizen` int(11) NOT NULL,
  `ID_text` int(11) NOT NULL,
  PRIMARY KEY (`ID_notizen`,`ID_text`),
  KEY `ID-notizen` (`ID_notizen`,`ID_text`),
  KEY `FK_notizen-text_text` (`ID_text`),
  CONSTRAINT `FK_notizen-text_notizen` FOREIGN KEY (`ID_notizen`) REFERENCES `notizen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_notizen-text_text` FOREIGN KEY (`ID_text`) REFERENCES `text` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen_text`
--

LOCK TABLES `notizen_text` WRITE;
/*!40000 ALTER TABLE `notizen_text` DISABLE KEYS */;
INSERT INTO `notizen_text` VALUES (1,1),(2,2),(3,4),(4,3);
/*!40000 ALTER TABLE `notizen_text` ENABLE KEYS */;
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
INSERT INTO `text` VALUES (1,'Dienstag 16.2.2021'),(2,'Bestellung Tabletten für Oma'),(3,'Brot\r\nFisch \r\nGemüse'),(4,'Freitag 28.2.2021');
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

-- Dump completed on 2021-02-12  9:57:22
