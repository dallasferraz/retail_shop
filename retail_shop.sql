-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: retail_shop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `idEmployee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `permit` varchar(45) NOT NULL,
  `info` varchar(100) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John Doe','555-0001','123','ADMIN','DBA'),(3,'Mary Ann','555-0002','abc','EMPLOYEE','Owner of the company'),(4,'Pedro Garcia','555-0003','p4ssw0rd','EMPLOYEE','Salesman');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_records`
--

DROP TABLE IF EXISTS `inventory_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory_records` (
  `idInventoryRecords` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity_before` double NOT NULL,
  `quantity_after` double NOT NULL,
  `modification_date` date NOT NULL,
  `fk_idProduct` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idInventoryRecords`),
  KEY `product2_idx` (`fk_idProduct`),
  CONSTRAINT `product2` FOREIGN KEY (`fk_idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_records`
--

LOCK TABLES `inventory_records` WRITE;
/*!40000 ALTER TABLE `inventory_records` DISABLE KEYS */;
INSERT INTO `inventory_records` VALUES (1,0,100,'2017-05-15',1104),(2,0,250,'2017-05-15',1106),(3,0,60,'2017-05-16',1112),(4,0,30,'2017-05-22',1127),(5,0,15,'2017-05-29',1141),(6,250,215,'2017-06-01',1106),(7,15,14,'2017-06-01',1141),(8,30,23,'2017-06-01',1127),(9,60,50,'2017-06-02',1112),(10,23,18,'2017-06-02',1127),(11,215,200,'2017-06-03',1106),(12,200,220,'2017-06-03',1106);
/*!40000 ALTER TABLE `inventory_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `idProduct` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1104,'Red wine','Alentejo Vinhos, Lisbon, Portugal',70,32.8),(1106,'Canadian beer','Toronto Brewery, Toronto, Canada',2.5,1.5),(1112,'Vodka','Kiev Vodkas, Kiev, Ukraine',15,8.6),(1127,'Rum','Flavors of Caribbean, New Orleans, USA',20,11),(1141,'Brandy','Devon Beverages, Exeter, England',42,32.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sale` (
  `idSale` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_date` date NOT NULL,
  `total_before` double NOT NULL,
  `discount` double NOT NULL,
  `cash` double NOT NULL,
  `credit_card` double NOT NULL,
  `check` double NOT NULL,
  `check_date` varchar(20) DEFAULT NULL,
  `check_name` varchar(70) NOT NULL,
  `total_after` double NOT NULL,
  `fk_idEmployee` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idSale`),
  KEY `employee1_idx` (`fk_idEmployee`),
  CONSTRAINT `employee1` FOREIGN KEY (`fk_idEmployee`) REFERENCES `employee` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2017-06-01',87.5,2.5,0,0,85,'2017-07-02','Mark Smith',85,4),(2,'2017-06-01',182,2,180,0,0,'0','N/A',180,4),(5,'2017-06-02',150,0,0,150,0,'0','N/A',150,4),(9,'2017-06-02',100,0,80,20,0,'0','N/A',100,3),(14,'2017-06-03',37.5,0.5,37,0,0,'0','N/A',37,4);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_item`
--

DROP TABLE IF EXISTS `sale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sale_item` (
  `idSaleItem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `fk_idSale` int(10) unsigned DEFAULT NULL,
  `fk_idProduct` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idSaleItem`),
  KEY `sale1_idx` (`fk_idSale`),
  KEY `sale2_idx` (`fk_idProduct`),
  CONSTRAINT `sale1` FOREIGN KEY (`fk_idSale`) REFERENCES `sale` (`idSale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale2` FOREIGN KEY (`fk_idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_item`
--

LOCK TABLES `sale_item` WRITE;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` VALUES (1,35,1,1106),(2,1,2,1141),(3,7,2,1127),(4,10,5,1112),(5,5,9,1127),(6,15,14,1106);
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-29 16:11:37
