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
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizen`
--

LOCK TABLES `notizen` WRITE;
/*!40000 ALTER TABLE `notizen` DISABLE KEYS */;
INSERT INTO `notizen` VALUES (1,'Arztermin',0,NULL,NULL,0,'2021-01-21 10:41:40'),(2,'Bestellung',0,NULL,NULL,0,'2021-01-17 10:41:40'),(3,'Essen gehen\r\n',0,NULL,NULL,0,'0000-00-00 00:00:00'),(4,'Einkaufszettel',0,NULL,NULL,0,'0000-00-00 00:00:00'),(8,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(9,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(10,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(11,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(12,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(13,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(14,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(15,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(16,'Simon',0,NULL,NULL,0,'0000-00-00 00:00:00'),(17,'Test',0,NULL,NULL,0,'0000-00-00 00:00:00'),(18,'Test',0,NULL,NULL,0,'0000-00-00 00:00:00'),(19,'Test',0,NULL,NULL,0,'0000-00-00 00:00:00'),(20,'Test',0,NULL,NULL,0,'0000-00-00 00:00:00'),(21,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(22,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(23,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(24,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(25,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(26,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(27,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(28,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(29,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(30,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(31,'sdfg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(32,'sdfg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(33,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(34,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(35,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(36,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(37,'t',0,NULL,NULL,0,'0000-00-00 00:00:00'),(38,'t',0,NULL,NULL,0,'0000-00-00 00:00:00'),(39,'e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(40,'e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(41,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(42,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(43,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(44,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(45,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(46,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(47,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(48,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(49,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(50,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(51,'adgsf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(52,'adgsf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(53,'a',0,NULL,NULL,0,'0000-00-00 00:00:00'),(54,'a',0,NULL,NULL,0,'0000-00-00 00:00:00'),(55,'ff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(56,'ff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(57,'ffg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(58,'ffg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(59,'ffg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(60,'ffg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(61,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(62,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(63,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(64,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(65,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(66,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(67,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(68,'h',0,NULL,NULL,0,'0000-00-00 00:00:00'),(69,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(70,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(71,'sfd',0,NULL,NULL,0,'0000-00-00 00:00:00'),(72,'sfd',0,NULL,NULL,0,'0000-00-00 00:00:00'),(73,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(74,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(75,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(76,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(77,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(78,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(79,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(80,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(81,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(82,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(83,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(84,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(85,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(86,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(87,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(88,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(89,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(90,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(91,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(92,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(93,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(94,'f',0,NULL,NULL,0,'0000-00-00 00:00:00'),(95,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(96,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(97,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(98,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(99,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(100,'f3e',0,NULL,NULL,0,'0000-00-00 00:00:00'),(101,'fdsa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(102,'fdsa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(103,'fdsa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(104,'fdsa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(105,'ooo',0,NULL,NULL,0,'0000-00-00 00:00:00'),(106,'ooo',0,NULL,NULL,0,'0000-00-00 00:00:00'),(107,'aa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(108,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(109,'header',0,NULL,NULL,0,'0000-00-00 00:00:00'),(110,'fff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(111,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(112,'ffa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(113,'Faul',0,NULL,NULL,0,'0000-00-00 00:00:00'),(114,'hans',0,NULL,NULL,0,'0000-00-00 00:00:00'),(115,'vv',0,NULL,NULL,0,'0000-00-00 00:00:00'),(116,'sjt',0,NULL,NULL,0,'0000-00-00 00:00:00'),(117,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(118,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(119,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(120,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(121,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(122,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(123,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(124,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(125,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(126,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(127,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(128,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(129,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(130,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(131,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(132,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(133,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(134,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(135,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(136,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(137,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(138,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(139,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(140,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(141,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(142,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(143,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(144,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(145,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(146,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(147,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(148,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(149,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(150,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(151,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(152,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(153,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(154,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(155,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(156,'Q§ER',0,NULL,NULL,0,'0000-00-00 00:00:00'),(157,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(158,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(159,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(160,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(161,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(162,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(163,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(164,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(165,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(166,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(167,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(168,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(169,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(170,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(171,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(172,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(173,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(174,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(175,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(176,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(177,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(178,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(179,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(180,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(181,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(182,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(183,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(184,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(185,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(186,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(187,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(188,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(189,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(190,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(191,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(192,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(193,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(194,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(195,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(196,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(197,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(198,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(199,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(200,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(201,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(202,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(203,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(204,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(205,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(206,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(207,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(208,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(209,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(210,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(211,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(212,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(213,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(214,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(215,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(216,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(217,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(218,'GGR',0,NULL,NULL,0,'0000-00-00 00:00:00'),(219,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(220,'grae',0,NULL,NULL,0,'0000-00-00 00:00:00'),(221,'jjj',0,NULL,NULL,0,'0000-00-00 00:00:00'),(222,'Monique',0,NULL,NULL,0,'0000-00-00 00:00:00'),(223,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(224,'ljb',0,NULL,NULL,0,'0000-00-00 00:00:00'),(225,'ljb',0,NULL,NULL,0,'0000-00-00 00:00:00'),(226,'ljb',0,NULL,NULL,0,'0000-00-00 00:00:00'),(227,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(228,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(229,'asdg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(230,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(231,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(232,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(233,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(234,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(235,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(236,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(237,'aa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(238,'aa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(239,'aa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(240,'aa',0,NULL,NULL,0,'0000-00-00 00:00:00'),(241,'AS',0,NULL,NULL,0,'0000-00-00 00:00:00'),(242,'<br /><b>Warning</b>:  Undefined variable $title in <b>C:xampphtdocsgit\notredit.',0,NULL,NULL,0,'0000-00-00 00:00:00'),(243,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(244,'FASD',0,NULL,NULL,0,'0000-00-00 00:00:00'),(245,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(246,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(247,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(248,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(249,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(250,'SHFG',0,NULL,NULL,0,'0000-00-00 00:00:00'),(251,'ASD',0,NULL,NULL,0,'0000-00-00 00:00:00'),(252,'ASD',0,NULL,NULL,0,'0000-00-00 00:00:00'),(253,'ASD',0,NULL,NULL,0,'0000-00-00 00:00:00'),(254,'ASD',0,NULL,NULL,0,'0000-00-00 00:00:00'),(255,'Daniel Evans',0,NULL,NULL,0,'0000-00-00 00:00:00'),(256,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(257,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(258,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(259,'fasd',0,NULL,NULL,0,'0000-00-00 00:00:00'),(260,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(261,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(262,'sahdfg',0,NULL,NULL,0,'0000-00-00 00:00:00'),(263,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(264,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(265,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(266,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(267,'',0,NULL,NULL,0,'0000-00-00 00:00:00'),(268,'sfd',0,NULL,NULL,0,'0000-00-00 00:00:00'),(269,'asdf',0,NULL,NULL,0,'0000-00-00 00:00:00'),(270,'ff',0,NULL,NULL,0,'0000-00-00 00:00:00'),(271,'ff',0,NULL,NULL,0,'0000-00-00 00:00:00');
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
INSERT INTO `notizen_text` VALUES (1,1),(2,2),(3,4),(4,3),(9,6),(11,7),(13,8),(15,9),(17,10),(19,11),(21,12),(23,13),(25,14),(27,15),(29,16),(31,17),(33,18),(35,19),(37,20),(39,21),(41,22),(43,23),(45,24),(47,25),(49,26),(51,27),(53,28),(55,29),(57,30),(59,31),(61,32),(63,33),(65,34),(67,35),(69,36),(71,37),(73,38),(75,39),(77,40),(79,41),(81,42),(83,43),(85,44),(87,45),(89,46),(91,47),(93,48),(95,49),(97,50),(99,51),(101,52),(103,53),(105,54),(107,55),(108,56),(109,57),(110,58),(111,59),(112,60),(113,61),(114,62),(115,63),(116,64),(117,65),(118,66),(119,67),(120,68),(121,69),(122,70),(123,71),(124,72),(125,73),(126,74),(127,75),(128,76),(129,77),(130,78),(131,79),(132,80),(133,81),(134,82),(135,83),(136,84),(137,85),(138,86),(139,87),(140,88),(141,89),(142,90),(143,91),(144,92),(145,93),(146,94),(147,95),(148,96),(149,97),(150,98),(151,99),(152,100),(153,101),(154,102),(155,103),(156,104),(157,105),(158,106),(159,107),(160,108),(161,109),(162,110),(163,111),(164,112),(165,113),(166,114),(167,115),(168,116),(169,117),(170,118),(171,119),(172,120),(173,121),(174,122),(175,123),(176,124),(177,125),(178,126),(179,127),(180,128),(181,129),(182,130),(183,131),(184,132),(185,133),(186,134),(187,135),(188,136),(189,137),(190,138),(191,139),(192,140),(193,141),(194,142),(195,143),(196,144),(197,145),(198,146),(199,147),(200,148),(201,149),(202,150),(203,151),(204,152),(205,153),(206,154),(207,155),(208,156),(209,157),(210,158),(211,159),(212,160),(213,161),(214,162),(215,163),(216,164),(217,165),(218,166),(219,167),(220,168),(221,169),(222,170),(223,171),(224,172),(225,173),(226,174),(227,175),(228,176),(229,177),(230,178),(231,179),(232,180),(233,181),(234,182),(235,183),(236,184),(237,185),(238,186),(239,187),(240,188),(241,189),(242,190),(243,191),(244,192),(245,193),(246,194),(247,195),(248,196),(249,197),(250,198),(251,199),(252,200),(253,201),(254,202),(255,203),(256,204),(257,205),(258,206),(259,207),(260,208),(261,209),(262,210),(263,211),(264,212),(265,213),(266,214),(267,215),(268,216),(269,217),(270,218),(271,219);
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'Dienstag 16.2.2021'),(2,'Bestellung Tabletten für Oma'),(3,'Brot\r\nFisch \r\nGemüse'),(4,'Freitag 28.2.2021'),(5,'Lorem ipsum...'),(6,'Lorem ipsum...'),(7,'Simon ist toll'),(8,'Simon ist toll'),(9,'Simon ist toll'),(10,'Lorem iasdlgkjaölsdjfpsum...'),(11,'Lorem iasdlgkjaölsdjfpsum...'),(12,'asdf'),(13,'asdf'),(14,''),(15,''),(16,''),(17,'sg'),(18,''),(19,''),(20,'r'),(21,'c'),(22,''),(23,''),(24,''),(25,''),(26,''),(27,'asdf'),(28,'a'),(29,'ff'),(30,'fft'),(31,'fft'),(32,'g'),(33,''),(34,''),(35,''),(36,'f'),(37,'f'),(38,'fa'),(39,' fa '),(40,'  fa  '),(41,'   fa   '),(42,'    fa    '),(43,'     fa     '),(44,'      fa      '),(45,'       fa       '),(46,'        fa        '),(47,'         fa         '),(48,'          fa          '),(49,'fe'),(50,'fe'),(51,'fe'),(52,'nwtr'),(53,'nwtr'),(54,'saaa'),(55,'vv'),(56,''),(57,'headertest'),(58,'ffA'),(59,''),(60,'aafd'),(61,'tier'),(62,'wurst'),(63,'qq'),(64,'HET'),(65,''),(66,''),(67,''),(68,''),(69,''),(70,''),(71,''),(72,''),(73,''),(74,''),(75,''),(76,''),(77,''),(78,''),(79,''),(80,''),(81,''),(82,''),(83,''),(84,''),(85,''),(86,''),(87,''),(88,''),(89,''),(90,''),(91,''),(92,''),(93,''),(94,''),(95,''),(96,''),(97,''),(98,''),(99,''),(100,''),(101,''),(102,''),(103,''),(104,'grw'),(105,''),(106,''),(107,''),(108,''),(109,''),(110,''),(111,''),(112,''),(113,''),(114,''),(115,''),(116,''),(117,''),(118,''),(119,''),(120,''),(121,''),(122,''),(123,''),(124,''),(125,''),(126,''),(127,''),(128,''),(129,''),(130,''),(131,''),(132,''),(133,''),(134,''),(135,''),(136,''),(137,''),(138,''),(139,''),(140,''),(141,''),(142,''),(143,''),(144,''),(145,''),(146,''),(147,''),(148,''),(149,''),(150,''),(151,''),(152,''),(153,''),(154,''),(155,''),(156,''),(157,''),(158,''),(159,''),(160,''),(161,''),(162,''),(163,''),(164,'G$RW'),(165,''),(166,'RAA'),(167,'aww'),(168,'aebr'),(169,'65qw'),(170,'Ist ganz toll'),(171,''),(172,'mv '),(173,'mv '),(174,'mv '),(175,''),(176,''),(177,'WGVD'),(178,''),(179,''),(180,''),(181,''),(182,''),(183,''),(184,''),(185,'ff'),(186,'ff'),(187,'ff'),(188,'ff'),(189,'dA'),(190,'<br />\r\n<b>Warning</b>:  Undefined variable $text in <b>C:xampphtdocsgit\notredit.php</b> on line <b>52</b><br />\r\n'),(191,''),(192,'ASDF'),(193,'SGH'),(194,'SGH'),(195,'SGH'),(196,'SGH'),(197,'SGH'),(198,'SGH'),(199,'ADSF'),(200,'ADSF'),(201,'ADSF'),(202,'ADSF'),(203,'- Kurze Haare\r\n- Informatiker'),(204,''),(205,'asdf'),(206,''),(207,'asdf'),(208,''),(209,''),(210,'aegr'),(211,''),(212,''),(213,''),(214,''),(215,''),(216,'WEGF'),(217,'asdf'),(218,'aaa'),(219,'aaa');
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

-- Dump completed on 2021-03-02 10:55:34
