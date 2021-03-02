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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen`
--

LOCK TABLES `notizen` WRITE;
/*!40000 ALTER TABLE `notizen` DISABLE KEYS */;
INSERT INTO `notizen` VALUES (27,'Einkaufszettel',0,NULL,NULL,0,'0000-00-00 00:00:00'),(28,'test',0,NULL,NULL,0,'0000-00-00 00:00:00'),(29,'test3',0,NULL,NULL,0,'0000-00-00 00:00:00'),(30,'test4',0,NULL,NULL,0,'0000-00-00 00:00:00'),(31,'test5',0,NULL,NULL,0,'0000-00-00 00:00:00');
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
INSERT INTO `notizen_text` VALUES (27,24),(28,25),(29,26),(30,27),(31,28);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (24,'test'),(25,'test'),(26,'test'),(27,'test'),(28,'test');
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

-- Dump completed on 2021-03-02 11:54:03
