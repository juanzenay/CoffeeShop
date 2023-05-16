CREATE DATABASE  IF NOT EXISTS `pointofsales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pointofsales`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: coffee-shop.mysql.database.azure.com    Database: pointofsales
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchnumber` int NOT NULL,
  `address` varchar(35) DEFAULT NULL,
  `managerID` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`branchnumber`),
  UNIQUE KEY `branchnumber_UNIQUE` (`branchnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'123 Main St, Houston, TX',0000006),(2,'456 Elm St, Houston, TX',0000023),(3,'789 Oak St, Houston, TX',0000030);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `name` char(30) NOT NULL,
  `email` char(25) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `username` char(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `Username_UNIQUE` (`username`),
  CONSTRAINT `user.email_validation` CHECK (regexp_like(`email`,_utf8mb4'^[a-zA-Z0-9][a-zA-Z0-9.!#$%&\'*+-/=?^_`{|}~]*?[a-zA-Z0-9._-]?@[a-zA-Z0-9][a-zA-Z0-9._-]*?[a-zA-Z0-9]?\\.[a-zA-Z]{2,63}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Adam','adam@gmail.com','7133333333','adam','adam'),('Amon Gus','amongus@yahoo.com','1237894567','amongus@yahoo.com','12345'),('Rajon Rondo','john@gmail.com','7132226666','babayaga','john'),('Cherry Coca Cola','Cherrycoke@yahoo.com','1236547890','CherryCocaCola','109'),('customer','customer@gmail.com','7131112222','customer1','password'),('Guest','Guest9@gmail.com','1234567890','Guest9','Password'),('Jane Doe','email@email.com','8328328321','jane','password'),('Juan Yanez','email2@email.com','1234567890','juany','password'),('Nibras Sultan','nibras@gmail.com','7133333333','nibras','password'),('test','test@email.com','8888888888','test','password'),('Michael Jackson','tester@hotmail.com','2222222223','Tester','password'),('First  User','123@gmail.com','8888888888','user1','password'),('new3','user1@email.com','8888888888','user2','password'),('Col','user1@email.com','8888888888','user3','password');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `bran_num` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ename_first` varchar(45) NOT NULL,
  `ename_last` varchar(45) NOT NULL,
  `id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`,`username`,`bran_num`,`ename_last`,`ename_first`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `branchNum_idx` (`bran_num`),
  CONSTRAINT `prod_seven_dig` CHECK ((`id` between 0 and 9999999))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'user2','password1','LeBron','James',0000006),(1,'ela','12345','ela','bbb',0000010),(1,'emp1','password','Lionel','Messi',0000023),(1,'emp3','password','Stephen','Curry',0000030),(1,'userr','password','Use','Er',1114449),(1,'emp2','password','Johnny','Doe',1234567);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `productid` int(7) unsigned zerofill NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `branchnum` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  UNIQUE KEY `productid_UNIQUE` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (0000001,'Espresso: Small',2.5,0,1),(0000002,'Espresso: Medium',3.5,147,1),(0000003,'Espresso: Large',4.5,167,1),(0000004,'Americano: Small',3,168,1),(0000005,'Americano: Medium',4,187,1),(0000006,'Americano: Large',5,899,1),(0000007,'Cappuccino: Small',4,179,1),(0000008,'Cappuccino: Medium',5,195,1),(0000009,'Cappuccino: Large',6,195,1),(0000010,'Latte: Small',4.5,197,1),(0000011,'Latte: Medium',5.5,189,1),(0000012,'Latte: Large',6.5,194,1),(0000013,'Mocha: Small',5,193,1),(0000014,'Mocha: Medium',6,185,1),(0000015,'Mocha: Large',7,196,1),(0000016,'Green Tea: Small',3.5,1,1),(0000017,'Green Tea: Medium',4.5,134,1),(0000018,'Green Tea: Large',5.5,186,1),(0000019,'Black Tea: Small',3.5,197,1),(0000020,'Black Tea: Medium',4.5,197,1),(0000021,'Black Tea: Large',5.5,200,1),(0000022,'Herbal Tea: Small',3.5,198,1),(0000023,'Herbal Tea: Medium',4.5,194,1),(0000024,'Herbal Tea: Large',5.5,198,1),(0000025,'Chai Tea: Small',4.5,198,1),(0000026,'Chai Tea: Medium',5.5,197,1),(0000027,'Chai Tea: Large',6.5,196,1),(0000028,'Plain Croissant',3,3919,1),(0000029,'Chocolate Chip Muffin',2.5,189,1),(0000030,'Blueberry Scone',3.5,195,1),(0000031,'Chocolate Chip Cookie',1.5,200,1),(0034251,'coffee89',12,15,1),(1212121,'Decaf Coffee',6,1,1),(1234567,'bread',10,380,123);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`group9`@`%`*/ /*!50003 TRIGGER `inventory_AFTER_UPDATE` AFTER UPDATE ON `inventory` FOR EACH ROW BEGIN
    DECLARE inventory_count INT;
    DECLARE branch_num INT;
    SELECT quantity, branchnum INTO inventory_count, branch_num FROM inventory WHERE productid = NEW.productid;
    
    IF inventory_count < 10 THEN
        INSERT INTO messages (recipient, message_text, branchno)
        VALUES ('Manager: ', CONCAT('Inventory is low for item ', NEW.productid, ' in branch ', branch_num), branch_num);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `managerid` int NOT NULL,
  `managerpass` varchar(45) NOT NULL,
  `managerfname` varchar(45) NOT NULL,
  `managerlname` varchar(45) NOT NULL,
  `managesbranch` int NOT NULL,
  PRIMARY KEY (`managerid`),
  UNIQUE KEY `managerid_UNIQUE` (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,'password','John','Doe',1);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) NOT NULL,
  `message_text` text NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `branchno` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Manager: ','Inventory is low for item 1234563','2023-03-22 22:10:29',NULL),(2,'Manager: ','Inventory is low for item 1234567','2023-03-23 21:36:20',NULL),(3,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-03-23 21:44:26',1),(4,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-03-23 21:49:04',2),(5,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-04 22:45:48',1),(6,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-05 22:13:03',1),(7,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-14 20:18:55',1),(8,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-14 20:25:41',1),(9,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:07:27',2),(10,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:07:27',1),(11,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:07:33',2),(12,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:07:33',1),(13,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:08:10',2),(14,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:08:10',1),(15,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:08:37',2),(16,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:08:37',1),(17,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:09:06',2),(18,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:09:06',1),(19,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-15 09:09:10',2),(20,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-15 09:09:10',1),(21,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-15 09:11:06',1),(22,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-15 22:56:07',1),(23,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-15 23:45:13',1),(24,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-15 23:54:21',1),(25,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-15 23:54:39',1),(26,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:40:10',1),(27,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:40:26',1),(28,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:40:34',1),(29,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:40:48',1),(30,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:41:14',1),(31,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:57:38',1),(32,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 05:58:11',1),(33,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 06:00:51',1),(34,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 06:06:18',1),(35,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 06:51:26',1),(36,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 06:52:27',1),(37,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-16 20:11:16',1),(38,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 22:55:37',1),(39,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 22:56:49',1),(40,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 22:57:52',1),(41,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 22:59:46',1),(42,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:00:24',1),(43,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:00:57',1),(44,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-16 23:01:29',1),(45,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-16 23:01:29',1),(46,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-16 23:01:29',1),(47,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 23:01:29',1),(48,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-16 23:01:29',1),(49,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-16 23:01:29',1),(50,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-16 23:01:29',1),(51,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-16 23:01:29',1),(52,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-16 23:01:29',1),(53,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-16 23:01:29',1),(54,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-16 23:01:29',1),(55,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-16 23:01:29',1),(56,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-16 23:01:29',1),(57,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-16 23:01:29',1),(58,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-16 23:01:29',1),(59,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-16 23:01:29',1),(60,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-16 23:01:29',1),(61,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-16 23:01:29',1),(62,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-16 23:01:29',1),(63,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-16 23:01:29',1),(64,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-16 23:01:29',1),(65,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-16 23:01:29',1),(66,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-16 23:01:29',1),(67,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-16 23:01:29',1),(68,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-16 23:01:29',1),(69,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-16 23:01:29',1),(70,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-16 23:01:29',1),(71,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-16 23:01:29',1),(72,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-16 23:01:29',1),(73,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-16 23:01:29',1),(74,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-16 23:01:29',1),(75,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-16 23:01:29',2),(76,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:01:29',1),(77,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-16 23:03:48',1),(78,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-16 23:03:48',1),(79,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-16 23:03:48',1),(80,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-16 23:03:48',1),(81,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-16 23:03:48',1),(82,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-16 23:03:48',1),(83,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-16 23:03:48',1),(84,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-16 23:03:48',1),(85,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-16 23:03:48',1),(86,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-16 23:03:48',1),(87,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-16 23:03:48',1),(88,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-16 23:03:48',1),(89,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-16 23:03:48',1),(90,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-16 23:03:48',1),(91,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-16 23:03:48',1),(92,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-16 23:03:48',1),(93,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-16 23:03:48',1),(94,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-16 23:03:48',1),(95,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-16 23:03:48',1),(96,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-16 23:03:48',1),(97,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-16 23:03:48',1),(98,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-16 23:03:48',1),(99,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-16 23:03:48',1),(100,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-16 23:03:48',1),(101,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-16 23:03:48',1),(102,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-16 23:03:48',1),(103,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-16 23:03:48',1),(104,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-16 23:03:48',1),(105,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-16 23:03:48',1),(106,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-16 23:03:48',1),(107,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-16 23:03:48',1),(108,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-16 23:03:48',2),(109,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:03:48',1),(110,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:05:32',1),(111,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:06:23',1),(112,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:13:43',1),(113,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:14:04',1),(114,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:19:48',1),(115,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-16 23:21:03',1),(116,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 03:38:04',1),(117,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 03:38:33',1),(118,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 03:39:48',1),(119,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 05:38:38',1),(120,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-17 05:38:38',1),(121,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-17 05:38:38',1),(122,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-17 05:38:38',1),(123,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-17 05:38:38',1),(124,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-17 05:38:38',1),(125,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-17 05:38:38',1),(126,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-17 05:38:38',1),(127,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-17 05:38:38',1),(128,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-17 05:38:38',1),(129,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-17 05:38:38',1),(130,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-17 05:38:38',1),(131,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-17 05:38:38',1),(132,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-17 05:38:38',1),(133,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-17 05:38:38',1),(134,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-17 05:38:38',1),(135,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-17 05:38:38',1),(136,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-17 05:38:38',1),(137,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-17 05:38:38',1),(138,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-17 05:38:38',1),(139,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-17 05:38:38',1),(140,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-17 05:38:38',1),(141,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-17 05:38:38',1),(142,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-17 05:38:38',1),(143,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-17 05:38:38',1),(144,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-17 05:38:38',1),(145,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-17 05:38:38',1),(146,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-17 05:38:38',1),(147,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-17 05:38:38',1),(148,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-17 05:38:38',1),(149,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-17 05:38:38',1),(150,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-17 05:38:38',2),(151,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:38:38',1),(152,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 05:38:42',1),(153,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-17 05:38:42',1),(154,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-17 05:38:42',1),(155,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-17 05:38:42',1),(156,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-17 05:38:42',1),(157,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-17 05:38:42',1),(158,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-17 05:38:42',1),(159,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-17 05:38:42',1),(160,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-17 05:38:42',1),(161,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-17 05:38:42',1),(162,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-17 05:38:42',1),(163,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-17 05:38:42',1),(164,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-17 05:38:42',1),(165,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-17 05:38:42',1),(166,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-17 05:38:42',1),(167,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-17 05:38:42',1),(168,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-17 05:38:42',1),(169,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-17 05:38:42',1),(170,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-17 05:38:42',1),(171,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-17 05:38:42',1),(172,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-17 05:38:42',1),(173,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-17 05:38:42',1),(174,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-17 05:38:42',1),(175,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-17 05:38:42',1),(176,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-17 05:38:42',1),(177,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-17 05:38:42',1),(178,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-17 05:38:42',1),(179,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-17 05:38:42',1),(180,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-17 05:38:42',1),(181,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-17 05:38:42',1),(182,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-17 05:38:42',1),(183,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-17 05:38:42',2),(184,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:38:42',1),(185,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:38:49',1),(186,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:39:21',1),(187,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:43:21',1),(188,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:50:07',1),(189,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:50:29',1),(190,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 05:50:50',1),(191,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-17 06:24:10',1),(192,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-17 06:24:35',1),(193,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-17 06:25:00',2),(194,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:26:18',1),(195,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 06:26:29',1),(196,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-17 06:26:29',1),(197,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-17 06:26:29',1),(198,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-17 06:26:29',1),(199,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-17 06:26:29',1),(200,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-17 06:26:29',1),(201,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-17 06:26:29',1),(202,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-17 06:26:29',1),(203,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-17 06:26:29',1),(204,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-17 06:26:29',1),(205,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-17 06:26:29',1),(206,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-17 06:26:29',1),(207,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-17 06:26:29',1),(208,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-17 06:26:29',1),(209,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-17 06:26:29',1),(210,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-17 06:26:29',1),(211,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-17 06:26:29',1),(212,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-17 06:26:29',1),(213,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-17 06:26:29',1),(214,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-17 06:26:29',1),(215,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-17 06:26:29',1),(216,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-17 06:26:29',1),(217,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-17 06:26:29',1),(218,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-17 06:26:29',1),(219,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-17 06:26:29',1),(220,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-17 06:26:29',1),(221,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-17 06:26:29',1),(222,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-17 06:26:29',1),(223,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-17 06:26:29',1),(224,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-17 06:26:29',1),(225,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-17 06:26:29',1),(226,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-17 06:26:29',2),(227,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:26:29',1),(228,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 06:26:34',1),(229,'Manager: ','Inventory is low for item 0000002 in branch 1','2023-04-17 06:26:34',1),(230,'Manager: ','Inventory is low for item 0000003 in branch 1','2023-04-17 06:26:34',1),(231,'Manager: ','Inventory is low for item 0000004 in branch 1','2023-04-17 06:26:34',1),(232,'Manager: ','Inventory is low for item 0000005 in branch 1','2023-04-17 06:26:34',1),(233,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-17 06:26:34',1),(234,'Manager: ','Inventory is low for item 0000007 in branch 1','2023-04-17 06:26:34',1),(235,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-17 06:26:34',1),(236,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-17 06:26:34',1),(237,'Manager: ','Inventory is low for item 0000010 in branch 1','2023-04-17 06:26:34',1),(238,'Manager: ','Inventory is low for item 0000011 in branch 1','2023-04-17 06:26:34',1),(239,'Manager: ','Inventory is low for item 0000012 in branch 1','2023-04-17 06:26:34',1),(240,'Manager: ','Inventory is low for item 0000013 in branch 1','2023-04-17 06:26:34',1),(241,'Manager: ','Inventory is low for item 0000014 in branch 1','2023-04-17 06:26:34',1),(242,'Manager: ','Inventory is low for item 0000015 in branch 1','2023-04-17 06:26:34',1),(243,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-17 06:26:34',1),(244,'Manager: ','Inventory is low for item 0000017 in branch 1','2023-04-17 06:26:34',1),(245,'Manager: ','Inventory is low for item 0000018 in branch 1','2023-04-17 06:26:34',1),(246,'Manager: ','Inventory is low for item 0000019 in branch 1','2023-04-17 06:26:34',1),(247,'Manager: ','Inventory is low for item 0000020 in branch 1','2023-04-17 06:26:34',1),(248,'Manager: ','Inventory is low for item 0000021 in branch 1','2023-04-17 06:26:34',1),(249,'Manager: ','Inventory is low for item 0000022 in branch 1','2023-04-17 06:26:34',1),(250,'Manager: ','Inventory is low for item 0000023 in branch 1','2023-04-17 06:26:34',1),(251,'Manager: ','Inventory is low for item 0000024 in branch 1','2023-04-17 06:26:34',1),(252,'Manager: ','Inventory is low for item 0000025 in branch 1','2023-04-17 06:26:34',1),(253,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-17 06:26:34',1),(254,'Manager: ','Inventory is low for item 0000027 in branch 1','2023-04-17 06:26:34',1),(255,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-17 06:26:34',1),(256,'Manager: ','Inventory is low for item 0000029 in branch 1','2023-04-17 06:26:34',1),(257,'Manager: ','Inventory is low for item 0000030 in branch 1','2023-04-17 06:26:34',1),(258,'Manager: ','Inventory is low for item 0000031 in branch 1','2023-04-17 06:26:34',1),(259,'Manager: ','Inventory is low for item 1234566 in branch 2','2023-04-17 06:26:34',2),(260,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:26:34',1),(261,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:26:39',1),(262,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:28:37',1),(263,'Manager: ','Inventory is low for item 0000026 in branch 1','2023-04-17 06:51:29',1),(264,'Manager: ','Inventory is low for item 0000008 in branch 1','2023-04-17 06:52:59',1),(265,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 06:53:32',1),(266,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-17 06:54:10',1),(267,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 06:55:10',1),(268,'Manager: ','Inventory is low for item 0000009 in branch 1','2023-04-17 07:11:59',1),(269,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 21:30:31',1),(270,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 21:31:38',1),(271,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 21:35:13',1),(272,'Manager: ','Inventory is low for item 1234567 in branch 1','2023-04-17 21:36:36',1),(274,'Manager: ','Transaction 1 has 10 items and requires attention. Customer phone number: 8888888888','2023-04-18 01:48:38',1),(275,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-18 06:56:50',1),(276,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-18 06:57:01',1),(277,'Manager: ','Inventory is low for item 0000006 in branch 1','2023-04-18 07:23:01',1),(278,'Manager: ','Transaction 3 has 12 items and requires attention. Customer phone number: 8888888888','2023-04-18 16:18:24',2),(279,'Manager: ','Transaction 4 has 12 items and requires attention. Customer phone number: 8888888888','2023-04-18 16:20:45',2),(280,'Manager: ','Transaction 5 has 50 items and requires attention. Customer phone number: 8888888888','2023-04-18 16:26:05',2),(281,'Manager: ','Transaction 5 has 100 items and requires attention. Customer phone number: 8888888888','2023-04-18 16:26:05',2),(282,'Manager: ','Transaction 7 has 96 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:16:47',1),(283,'Manager: ','Transaction 8 has 97 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:19:39',1),(284,'Manager: ','Transaction 9 has 97 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:21:17',1),(285,'Manager: ','Transaction 10 has 13 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:28:43',1),(286,'Manager: ','Transaction 10 has 19 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:28:43',1),(287,'Manager: ','Transaction 10 has 26 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:28:43',1),(288,'Manager: ','Transaction 13 has 12 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:45:57',1),(289,'Manager: ','Transaction 13 has 22 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:45:57',1),(290,'Manager: ','Transaction 13 has 32 items and requires attention. Customer phone number: 8888888888','2023-04-18 17:45:57',1),(291,'Manager: ','Transaction 14 has 15 items and requires attention. Customer phone number: 8888888888','2023-04-18 18:01:12',1),(292,'Manager: ','Transaction 15 has 10 items and requires attention. Customer phone number: 8888888888','2023-04-18 18:02:21',1),(293,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-18 20:41:45',1),(294,'Manager: ','Transaction 20 has 995 items and requires attention. Customer phone number: 8888888888','2023-04-18 20:41:45',1),(295,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:32:06',1),(296,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:33:51',1),(297,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:33:51',1),(298,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:33:51',1),(299,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:34:10',1),(300,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:34:11',1),(301,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:34:11',1),(302,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:35:50',1),(303,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:35:50',1),(304,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-04-19 09:35:50',1),(305,'Manager: ','Transaction 49 has 10 items and requires attention. Customer phone number: 8888888888','2023-04-19 16:14:49',1),(306,'Manager: ','Transaction 56 has 10 items and requires attention. Customer phone number: 8888888888','2023-04-19 21:39:26',1),(307,'Manager: ','Transaction 58 has 10 items and requires attention. Customer phone number: 7133333333','2023-04-19 21:58:19',1),(308,'Manager: ','Inventory is low for item 0000028 in branch 1','2023-04-19 22:00:01',1),(309,'Manager: ','Transaction 59 has 190 items and requires attention. Customer phone number: 8328328321','2023-04-19 22:00:01',1),(310,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-19 22:14:16',1),(311,'Manager: ','Transaction 61 has 10 items and requires attention. Customer phone number: 7133333333','2023-04-19 22:14:16',1),(312,'Manager: ','Inventory is low for item 0000016 in branch 1','2023-04-19 22:57:11',1),(313,'Manager: ','Transaction 63 has 10 items and requires attention. Customer phone number: 7131112222','2023-04-19 22:57:11',1),(314,'Manager: ','Transaction 64 has 12 items and requires attention. Customer phone number: 7132226666','2023-04-23 19:33:39',2),(315,'Manager: ','Transaction 66 has 11 items and requires attention. Customer phone number: 8328328321','2023-04-23 21:55:05',1),(316,'Manager: ','Transaction 73 has 13 items and requires attention. Customer phone number: 7133333333','2023-05-07 22:23:10',1),(317,'Manager: ','Inventory is low for item 1212121 in branch 1','2023-05-07 22:28:01',1),(318,'Manager: ','Transaction 74 has 86 items and requires attention. Customer phone number: 7133333333','2023-05-07 22:28:01',1),(319,'Manager: ','Inventory is low for item 0000001 in branch 1','2023-05-07 22:36:22',1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `product_id` int(7) unsigned zerofill NOT NULL,
  `snumber` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `supplier_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `supplier_id_UNIQUE` (`supplier_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (0000001,'9999999','The Krusty Mfg',0000001);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `customer_user` char(20) NOT NULL,
  `payment_total` double NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `to_go` varchar(45) NOT NULL,
  `branchN` int DEFAULT NULL,
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id_UNIQUE` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES ('user1',5,'cash','2023-04-17','2023-04-17 16:42:00','no',1,1),('user1',6,'card','2023-04-18','2023-04-18 18:17:14','yes',2,2),('user1',37,'card','2023-04-18','2023-04-18 18:18:24','yes',2,3),('user1',48,'card','2023-04-18','2023-04-18 18:20:45','yes',2,4),('user1',275,'card','2023-04-18','2023-04-18 18:26:04','yes',2,5),('user1',2.5,'cash','2023-04-18','2023-04-18 19:16:02','no',1,6),('user1',240,'cash','2023-04-18','2023-04-18 19:16:47','yes',1,7),('user1',242.5,'card','2023-04-18','2023-04-18 19:19:38','yes',1,8),('user1',242.5,'cash','2023-04-18','2023-04-18 19:21:17','no',1,9),('user1',93,'cash','2023-04-18','2023-04-18 19:28:43','no',1,10),('user1',93,'cash','2023-04-18','2023-04-18 19:29:27','no',1,11),('user1',93,'cash','2023-04-18','2023-04-18 19:31:50','no',1,12),('user1',163,'card','2023-04-18','2023-04-18 19:45:56','yes',1,13),('user1',37.5,'cash','2023-04-18','2023-04-18 20:01:12','no',1,14),('user1',46,'card','2023-04-18','2023-04-18 20:02:21','yes',1,15),('',66,'cash','2023-04-18','2023-04-18 22:06:09','no',2,16),('',66,'cash','2023-04-18','2023-04-18 22:15:48','no',2,17),('user1',2.5,'cash','2023-04-18','2023-04-18 22:37:55','yes',1,18),('user1',5,'cash','2023-04-18','2023-04-18 22:41:15','yes',1,19),('user1',2487.5,'card','2023-04-18','2023-04-18 22:41:45','yes',1,20),('jane',7.5,'cash','2023-04-18','2023-04-18 22:57:36','no',1,21),('user1',7,'cash','2023-04-18','2023-04-18 23:11:11','yes',1,22),('jane',2.5,'cash','2023-04-18','2023-04-18 23:16:48','no',1,23),('jane',4.5,'cash','2023-04-18','2023-04-18 23:21:56','no',1,24),('jane',2.5,'cash','2023-04-18','2023-04-18 21:28:43','yes',1,25),('user1',7,'cash','2023-04-18','2023-04-18 23:48:55','yes',1,26),('jane',10.5,'cash','2023-04-19','2023-04-19 00:10:47','no',1,27),('jane',2.5,'cash','2023-04-19','2023-04-19 00:16:45','no',1,28),('user1',10,'cash','2023-04-19','2023-04-19 01:04:34','no',1,29),('',21,'cash','2023-04-19','2023-04-19 01:06:27','no',2,30),('user1',0,'cash','2023-04-19','2023-04-19 02:40:26','no',1,31),('user1',0,'cash','2023-04-19','2023-04-19 02:43:08','no',1,32),('user1',0,'cash','2023-04-19','2023-04-19 02:44:56','no',1,33),('user1',0,'cash','2023-04-19','2023-04-19 02:45:21','yes',1,34),('user1',0,'cash','2023-04-19','2023-04-19 02:46:01','yes',1,35),('user1',0,'cash','2023-04-19','2023-04-19 02:48:15','yes',1,36),('user1',0,'cash','2023-04-19','2023-04-19 02:48:59','no',1,37),('',0,'cash','2023-04-19','2023-04-19 03:26:21','no',1,38),('user2',5,'cash','2023-04-19','2023-04-19 06:12:03','yes',1,39),('user2',7.5,'cash','2023-04-19','2023-04-19 06:12:32','no',1,40),('user1',20,'cash','2023-04-19','2023-04-19 08:13:13','no',1,41),('user1',303,'cash','2023-04-19','2023-04-19 08:41:08','no',1,42),('user1',313,'cash','2023-04-19','2023-04-19 08:50:58','no',1,43),('user1',313,'cash','2023-04-19','2023-04-19 08:51:10','no',1,44),('user2',5,'card','2023-04-19','2023-04-19 07:20:14','yes',2,45),('user1',323,'cash','2023-04-19','2023-04-19 10:36:02','no',1,46),('user2',9.5,'cash','2023-04-19','2023-04-19 16:09:12','yes',1,47),('user2',15,'card','2023-04-19','2023-04-19 16:11:39','yes',1,48),('user2',25,'cash','2023-04-19','2023-04-19 16:14:49','yes',1,49),('user2',7.5,'cash','2023-04-19','2023-04-19 17:00:25','no',1,50),('user1',15,'cash','2023-04-19','2023-04-19 21:12:40','yes',1,52),('jane',12.5,'cash','2023-04-19','2023-04-19 21:35:36','yes',1,54),('user2',5,'cash','2023-04-19','2023-04-19 21:37:37','yes',1,55),('user2',25,'cash','2023-04-19','2023-04-19 21:39:26','no',1,56),('nibras',10.5,'cash','2023-04-19','2023-04-19 21:57:53','no',2,57),('nibras',25,'cash','2023-04-19','2023-04-19 21:58:19','no',1,58),('jane',570,'cash','2023-04-19','2023-04-19 22:00:01','yes',1,59),('adam',6,'cash','2023-04-19','2023-04-19 22:13:52','yes',1,60),('adam',35,'cash','2023-04-19','2023-04-19 22:14:16','no',1,61),('customer1',5.5,'cash','2023-04-19','2023-04-19 22:56:49','no',1,62),('customer1',35,'cash','2023-04-19','2023-04-19 22:57:11','no',1,63),('babayaga',52,'cash','2023-04-23','2023-04-23 19:33:39','no',2,64),('jane',12.5,'card','2023-04-23','2023-04-23 21:56:57','yes',1,67),('user2',13,'card','2023-04-23','2023-04-23 22:00:04','no',1,68),('Guest9',22,'cash','2023-04-24','2023-04-24 00:31:10','no',1,69),('jane',5.5,'cash','2023-04-24','2023-04-24 00:31:55','no',1,70),('Guest9',45,'cash','2023-04-24','2023-04-24 01:12:49','yes',1,71),('adam',10,'cash','2023-05-07','2023-05-07 22:18:00','no',1,72),('adam',78,'cash','2023-05-07','2023-05-07 22:23:10','yes',1,73),('adam',516,'cash','2023-05-07','2023-05-07 22:28:01','yes',1,74),('adam',7,'cash','2023-05-07','2023-05-07 22:53:39','yes',1,75),('adam',7,'cash','2023-05-07','2023-05-07 22:53:46','no',1,76),('adam',7,'cash','2023-05-07','2023-05-07 22:53:54','no',1,77),('adam',7,'cash','2023-05-07','2023-05-07 22:54:00','no',1,78),('adam',7,'cash','2023-05-07','2023-05-07 22:54:08','no',1,79),('adam',7,'cash','2023-05-07','2023-05-07 22:54:14','no',1,80),('adam',7,'cash','2023-05-07','2023-05-07 22:54:21','no',1,81),('adam',7,'cash','2023-05-07','2023-05-07 22:54:27','no',1,82),('adam',7,'cash','2023-05-07','2023-05-07 22:54:33','no',1,83),('adam',7,'cash','2023-05-07','2023-05-07 22:54:39','no',1,84),('adam',7,'cash','2023-05-07','2023-05-07 22:54:45','no',1,85),('adam',7,'cash','2023-05-07','2023-05-07 22:54:50','no',1,86),('adam',7,'cash','2023-05-07','2023-05-07 22:54:56','no',1,87),('adam',7,'cash','2023-05-07','2023-05-07 22:55:01','no',1,88),('adam',17.5,'cash','2023-05-07','2023-05-07 22:55:09','no',1,89),('adam',21,'cash','2023-05-07','2023-05-07 22:55:16','no',1,90),('adam',3.5,'cash','2023-05-07','2023-05-07 22:55:22','no',1,91),('adam',3.5,'cash','2023-05-07','2023-05-07 22:55:27','no',1,92);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_items`
--

DROP TABLE IF EXISTS `transaction_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_items` (
  `product_id` int(7) unsigned zerofill NOT NULL,
  `quantity` int NOT NULL,
  `transit_id` int NOT NULL,
  `processid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`processid`),
  KEY `prodID_idx` (`product_id`),
  CONSTRAINT `prodID` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_items`
--

LOCK TABLES `transaction_items` WRITE;
/*!40000 ALTER TABLE `transaction_items` DISABLE KEYS */;
INSERT INTO `transaction_items` VALUES (0000001,4,1,1),(0000002,6,1,15),(0000001,1,2,17),(0000002,1,2,18),(0000001,5,3,19),(0000002,7,3,20),(0000016,6,4,21),(0000017,6,4,22),(0000001,50,5,23),(0000028,50,5,24),(0000001,1,6,40),(0000001,96,7,41),(0000001,97,8,42),(0000001,97,9,43),(0000001,6,10,44),(0000003,7,10,45),(0000001,6,10,46),(0000003,7,10,47),(0000007,12,13,48),(0000014,10,13,49),(0000018,10,13,50),(0000001,15,14,51),(0000001,2,15,52),(0000008,2,15,53),(0000018,2,15,54),(0000027,2,15,55),(0000030,2,15,56),(0000021,6,16,57),(0000021,6,17,59),(0000001,1,18,61),(0000001,1,19,62),(0000029,1,19,63),(0000001,995,20,64),(0000001,3,21,65),(0000001,1,22,66),(0000003,1,22,67),(0000001,1,23,70),(0000002,1,0,71),(0000003,1,24,72),(0000001,1,25,73),(0000001,1,0,74),(0000005,2,0,75),(0000001,1,27,76),(0000005,2,27,77),(0000001,1,28,78),(0000005,1,0,80),(0000003,4,0,81),(0000001,4,29,84),(0000015,3,30,85),(0000001,2,31,96),(0000001,2,32,97),(0000001,2,34,98),(0000001,2,35,99),(0000001,2,37,100),(0000003,1,37,101),(0000001,5,38,102),(0000001,2,39,103),(0000001,3,40,104),(0000005,5,41,105),(0000017,8,42,106),(0000017,8,43,108),(0000017,8,44,110),(0000001,2,45,112),(0000017,8,46,113),(0000001,2,47,115),(0000003,1,47,116),(0000002,2,48,117),(0000007,2,48,118),(0000001,10,49,119),(0000001,3,50,120),(0000001,5,51,121),(0000001,2,52,122),(0000001,4,52,123),(0000001,2,53,129),(0000001,5,54,130),(0000001,2,55,131),(0000001,10,56,132),(0000001,3,57,133),(0000028,1,57,134),(0000001,10,58,135),(0000028,190,59,136),(0000001,1,60,137),(0000030,1,60,138),(0000016,10,61,139),(0000001,1,62,140),(0000028,1,62,141),(0000016,10,63,142),(0000009,4,64,143),(0000023,4,64,144),(0000029,4,64,145),(0000029,5,67,148),(0000012,2,68,149),(0000001,2,69,150),(0000003,2,69,151),(0000005,2,69,152),(0000026,1,70,153),(0000001,3,71,154),(0000012,3,71,155),(0000014,3,71,156),(1234567,1,72,157),(1212121,13,73,158),(1212121,86,74,159),(0000002,2,75,160),(0000002,2,76,161),(0000002,2,77,162),(0000002,2,78,163),(0000002,2,79,164),(0000002,2,80,165),(0000002,2,81,166),(0000002,2,82,167),(0000002,2,83,168),(0000002,2,84,169),(0000002,2,85,170),(0000002,2,86,171),(0000002,2,87,172),(0000002,2,88,173),(0000002,5,89,174),(0000002,6,90,175),(0000002,1,91,176),(0000002,1,92,177);
/*!40000 ALTER TABLE `transaction_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`group9`@`%`*/ /*!50003 TRIGGER `check_item_count` AFTER INSERT ON `transaction_items` FOR EACH ROW BEGIN
    DECLARE total_items INT;
    DECLARE phone_number VARCHAR(10);
    DECLARE message_text TEXT;
    DECLARE branch_number INT;
    
    -- calc total transaction items
    SELECT SUM(quantity) INTO total_items
    FROM transaction_items
    WHERE transit_id = NEW.transit_id;
    
    -- retrieve phone number
    SELECT customer.phone, transaction_details.branchN INTO phone_number, branch_number
    FROM transaction_details
    JOIN customer ON transaction_details.customer_user = customer.username
    WHERE transaction_details.transaction_id = NEW.transit_id;
    
    -- if item count is more than 9 then send message
    IF total_items > 9 THEN
        SET message_text = CONCAT('Transaction ', NEW.transit_id, ' has ', total_items, ' items and requires attention. Customer phone number: ', phone_number);
        INSERT INTO messages (recipient, message_text, branchno) VALUES ('Manager: ', message_text, branch_number);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'pointofsales'
--

--
-- Dumping routines for database 'pointofsales'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-16 18:09:22
