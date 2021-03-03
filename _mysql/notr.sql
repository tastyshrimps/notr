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
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen`
--

LOCK TABLES `notizen` WRITE;
/*!40000 ALTER TABLE `notizen` DISABLE KEYS */;
INSERT INTO `notizen` VALUES (331,'asdffff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(332,' asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(333,'ff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(335,'',0,NULL,NULL,0,'0000-00-00 00:00:00');
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
INSERT INTO `notizen_text` VALUES (331,279),(332,280),(333,281),(335,283);
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
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'Dienstag 16.2.2021'),(2,'Bestellung Tabletten für Oma'),(3,'Brot\r\nFisch \r\nGemüse'),(4,'Freitag 28.2.2021'),(5,'Lorem ipsum...'),(6,'Lorem ipsum...'),(7,'Simon ist toll'),(8,'Simon ist toll'),(9,'Simon ist toll'),(10,'Lorem iasdlgkjaölsdjfpsum...'),(11,'Lorem iasdlgkjaölsdjfpsum...'),(12,'asdf'),(13,'asdf'),(14,''),(15,''),(16,''),(17,'sg'),(18,''),(19,''),(20,'r'),(21,'c'),(22,''),(23,''),(24,''),(25,''),(26,''),(27,'asdf'),(28,'a'),(29,'ff'),(30,'fft'),(31,'fft'),(32,'g'),(33,''),(34,''),(35,''),(36,'f'),(37,'f'),(38,'fa'),(39,' fa '),(40,'  fa  '),(41,'   fa   '),(42,'    fa    '),(43,'     fa     '),(44,'      fa      '),(45,'       fa       '),(46,'        fa        '),(47,'         fa         '),(48,'          fa          '),(49,'fe'),(50,'fe'),(51,'fe'),(52,'nwtr'),(53,'nwtr'),(54,'saaa'),(55,'vv'),(56,''),(57,'headertest'),(58,'ffA'),(59,''),(60,'aafd'),(61,'tier'),(62,'wurst'),(63,'qq'),(64,'HET'),(65,''),(66,''),(67,''),(68,''),(69,''),(70,''),(71,''),(72,''),(73,''),(74,''),(75,''),(76,''),(77,''),(78,''),(79,''),(80,''),(81,''),(82,''),(83,''),(84,''),(85,''),(86,''),(87,''),(88,''),(89,''),(90,''),(91,''),(92,''),(93,''),(94,''),(95,''),(96,''),(97,''),(98,''),(99,''),(100,''),(101,''),(102,''),(103,''),(104,'grw'),(105,''),(106,''),(107,''),(108,''),(109,''),(110,''),(111,''),(112,''),(113,''),(114,''),(115,''),(116,''),(117,''),(118,''),(119,''),(120,''),(121,''),(122,''),(123,''),(124,''),(125,''),(126,''),(127,''),(128,''),(129,''),(130,''),(131,''),(132,''),(133,''),(134,''),(135,''),(136,''),(137,''),(138,''),(139,''),(140,''),(141,''),(142,''),(143,''),(144,''),(145,''),(146,''),(147,''),(148,''),(149,''),(150,''),(151,''),(152,''),(153,''),(154,''),(155,''),(156,''),(157,''),(158,''),(159,''),(160,''),(161,''),(162,''),(163,''),(164,'G$RW'),(165,''),(166,'RAA'),(167,'aww'),(168,'aebr'),(169,'65qw'),(170,'Ist ganz toll'),(171,''),(172,'mv '),(173,'mv '),(174,'mv '),(175,''),(176,''),(177,'WGVD'),(178,''),(179,''),(180,''),(181,''),(182,''),(183,''),(184,''),(185,'ff'),(186,'ff'),(187,'ff'),(188,'ff'),(189,'dA'),(190,'<br />\r\n<b>Warning</b>:  Undefined variable $text in <b>C:xampphtdocsgit\notredit.php</b> on line <b>52</b><br />\r\n'),(191,''),(192,'ASDF'),(193,'SGH'),(194,'SGH'),(195,'SGH'),(196,'SGH'),(197,'SGH'),(198,'SGH'),(199,'ADSF'),(200,'ADSF'),(201,'ADSF'),(202,'ADSF'),(203,'- Kurze Haare\r\n- Informatiker'),(204,''),(205,'asdf'),(206,''),(207,'asdf'),(208,''),(209,''),(210,'aegr'),(211,''),(212,''),(213,''),(214,''),(215,''),(216,'WEGF'),(217,'asdf'),(218,'aaa'),(219,'aaa'),(220,'awef'),(221,'aer'),(222,'Testtext1'),(223,'def'),(224,'aSFD'),(225,'ttt'),(226,'qaet'),(227,'z4'),(228,'aasdf'),(229,'asdf'),(230,'asdff'),(231,'adsf'),(232,'asdfasdfSE'),(233,'ooooo'),(234,'ooooo'),(235,'asdfasdfa'),(236,'rrrrr'),(237,'ppppp'),(238,'asdf'),(239,'asdf'),(240,'nein'),(241,'kkkkk'),(242,'FS'),(243,'WGE'),(244,'ffff'),(245,'ppp'),(246,'gg'),(247,'asdf'),(248,'ethat'),(249,'asdf'),(250,'asdf'),(251,''),(252,'asdf'),(253,'WGR'),(254,'RH<'),(255,'AGDFS'),(256,'fff'),(257,'ffff'),(258,'fff'),(259,'asdf'),(260,'dgdrgr'),(261,'asdf'),(262,'gR'),(263,'ggghtasdfasdasdf'),(264,'Butterhhh\r\nMehl'),(265,'Zucker\r\nMilch'),(266,'athreg'),(267,'fasdfasdfaaagfdtzksfdajd'),(268,'Schlimme Sache, das'),(269,'asdfasdfa'),(270,'asdfasdfasdfffff'),(271,''),(272,''),(273,'es funktioniert!\r\nUnglaublich!'),(274,'arwg'),(275,'sdfgsdfg'),(276,'fasdfasdf'),(277,'asdfa'),(278,'asdf'),(279,'asdf'),(280,'asdf'),(281,'aa'),(282,''),(283,'');
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

-- Dump completed on 2021-03-03 20:06:37
