-- MySQL dump 10.13  Distrib 8.0.3-rc, for Linux (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	8.0.3-rc-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CART` (
  `username` varchar(20) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`productid`),
  KEY `productid` (`productid`),
  CONSTRAINT `CART_ibfk_1` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`),
  CONSTRAINT `CART_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `PRODUCTS` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CART`
--

LOCK TABLES `CART` WRITE;
/*!40000 ALTER TABLE `CART` DISABLE KEYS */;
INSERT INTO `CART` VALUES ('siddharth',23,2);
/*!40000 ALTER TABLE `CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIES`
--

DROP TABLE IF EXISTS `CATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CATEGORIES` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) NOT NULL,
  `categorydescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIES`
--

LOCK TABLES `CATEGORIES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` VALUES (9,'Pringles','Flavored Potato Chips'),(10,'Ice Cream','Amul Ice Creams'),(11,'Soft Drinks','FIzzy Aerated Drinks'),(12,'Bread','Homemade Breads');
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CUSTOMERS` (
  `username` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  `city` varchar(20) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES ('siddharth','Siddharth Sahay','Room 31, CVR Hostel, IITBHU',221005,'Varanasi','7071270242','sahay.siddharth@yahoo.in'),('Tejas','Tejas Sardana','Room 31, CVR Hostel, IITBHU',221005,'Varanasi','4041424344','tejas.sardana12345@gmail.com');
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EMPLOYEES` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(45) DEFAULT NULL,
  `employeephone` varchar(10) DEFAULT NULL,
  `employeesalary` double DEFAULT NULL,
  `employeepassword` varchar(20) DEFAULT '',
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'root','7777777777',NULL,'password'),(11,'Krishna','8081828384',6000,'krishna');
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEEDBACKS`
--

DROP TABLE IF EXISTS `FEEDBACKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FEEDBACKS` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `feedback` varchar(200) DEFAULT NULL,
  `feedbackdate` date DEFAULT NULL,
  `feedbacktime` time DEFAULT NULL,
  `feedbackusername` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `fk_F_U` (`orderid`),
  KEY `fk_FE_U` (`feedbackusername`),
  CONSTRAINT `fk_FE_U` FOREIGN KEY (`feedbackusername`) REFERENCES `USERS` (`username`),
  CONSTRAINT `fk_F_U` FOREIGN KEY (`orderid`) REFERENCES `USERORDERS` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDBACKS`
--

LOCK TABLES `FEEDBACKS` WRITE;
/*!40000 ALTER TABLE `FEEDBACKS` DISABLE KEYS */;
INSERT INTO `FEEDBACKS` VALUES (29,3,'First Feedback','2018-10-01','12:59:00','Tejas');
/*!40000 ALTER TABLE `FEEDBACKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIKES`
--

DROP TABLE IF EXISTS `LIKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `LIKES` (
  `username` varchar(20) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`username`,`productid`),
  KEY `fk_L_P` (`productid`),
  CONSTRAINT `fk_L_P` FOREIGN KEY (`productid`) REFERENCES `PRODUCTS` (`productid`),
  CONSTRAINT `fk_L_U` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIKES`
--

LOCK TABLES `LIKES` WRITE;
/*!40000 ALTER TABLE `LIKES` DISABLE KEYS */;
INSERT INTO `LIKES` VALUES ('siddharth',16),('Tejas',16),('siddharth',17),('siddharth',22),('Tejas',22);
/*!40000 ALTER TABLE `LIKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICATIONS`
--

DROP TABLE IF EXISTS `NOTIFICATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `NOTIFICATIONS` (
  `notificationid` int(11) NOT NULL AUTO_INCREMENT,
  `notification` varchar(200) DEFAULT NULL,
  `notificationdate` date DEFAULT NULL,
  `notificationtime` time DEFAULT NULL,
  PRIMARY KEY (`notificationid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATIONS`
--

LOCK TABLES `NOTIFICATIONS` WRITE;
/*!40000 ALTER TABLE `NOTIFICATIONS` DISABLE KEYS */;
INSERT INTO `NOTIFICATIONS` VALUES (9,'Hello Users','2018-10-01','12:27:33');
/*!40000 ALTER TABLE `NOTIFICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERPRODUCTS`
--

DROP TABLE IF EXISTS `ORDERPRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ORDERPRODUCTS` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `orderquantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`,`productid`),
  KEY `FK_OP_P` (`productid`),
  CONSTRAINT `FK_OP_P` FOREIGN KEY (`productid`) REFERENCES `PRODUCTS` (`productid`),
  CONSTRAINT `fk_OP_UO` FOREIGN KEY (`orderid`) REFERENCES `USERORDERS` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERPRODUCTS`
--

LOCK TABLES `ORDERPRODUCTS` WRITE;
/*!40000 ALTER TABLE `ORDERPRODUCTS` DISABLE KEYS */;
INSERT INTO `ORDERPRODUCTS` VALUES (1,17,2),(1,18,1),(1,19,2),(2,22,2),(2,23,1),(3,16,3),(3,22,3);
/*!40000 ALTER TABLE `ORDERPRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PRODUCTS` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) DEFAULT NULL,
  `productprice` double DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `availablequantity` int(11) DEFAULT '0',
  `description` varchar(150) DEFAULT '',
  PRIMARY KEY (`productid`),
  KEY `categoryid` (`categoryid`),
  CONSTRAINT `PRODUCTS_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `CATEGORIES` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` VALUES (16,'Classic Salted',60,9,17,'Chips seasoned with salt'),(17,'Cheese and Onion',80,9,10,'Flavors of cheese with onion'),(18,'Spiced Vinegar',80,9,9,'Chillies and vinegar'),(19,'Chocobar',20,10,23,'Stick ice cream'),(20,'Vanilla Cup',10,10,15,'Cup ice cream'),(21,'Mango Brick',150,10,4,'Brick ice cream'),(22,'Coca Cola',20,11,15,'Pepsico'),(23,'Mountain Dew',25,11,19,'Pepsico'),(24,'Wholewheat',32,12,5,'All grain bread'),(25,'Brown Bread',34,12,8,'No sugar');
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIERPRODUCTS`
--

DROP TABLE IF EXISTS `SUPPLIERPRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SUPPLIERPRODUCTS` (
  `supplierid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`supplierid`,`productid`),
  KEY `fk_SP_P` (`productid`),
  CONSTRAINT `fk_SP_P` FOREIGN KEY (`productid`) REFERENCES `PRODUCTS` (`productid`),
  CONSTRAINT `fk_SP_S` FOREIGN KEY (`supplierid`) REFERENCES `SUPPLIERS` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIERPRODUCTS`
--

LOCK TABLES `SUPPLIERPRODUCTS` WRITE;
/*!40000 ALTER TABLE `SUPPLIERPRODUCTS` DISABLE KEYS */;
INSERT INTO `SUPPLIERPRODUCTS` VALUES (9,16),(10,17);
/*!40000 ALTER TABLE `SUPPLIERPRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIERS`
--

DROP TABLE IF EXISTS `SUPPLIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SUPPLIERS` (
  `supplierid` int(11) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(20) DEFAULT NULL,
  `supplierphone` varchar(10) DEFAULT NULL,
  `supplieraddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIERS`
--

LOCK TABLES `SUPPLIERS` WRITE;
/*!40000 ALTER TABLE `SUPPLIERS` DISABLE KEYS */;
INSERT INTO `SUPPLIERS` VALUES (9,'Dhanraj','7071727374','Begumpet, Hyderabad'),(10,'Mainak','6061626364','Tollygung, Huderabad');
/*!40000 ALTER TABLE `SUPPLIERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERORDERS`
--

DROP TABLE IF EXISTS `USERORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `USERORDERS` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `orderdate` date DEFAULT NULL,
  `ordertime` time DEFAULT NULL,
  `employeeid` int(11) DEFAULT NULL,
  `deliveryaddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_UO_U` (`username`),
  KEY `fk_UO_E` (`employeeid`),
  CONSTRAINT `FK_UO_U` FOREIGN KEY (`username`) REFERENCES `USERS` (`username`),
  CONSTRAINT `fk_UO_E` FOREIGN KEY (`employeeid`) REFERENCES `EMPLOYEES` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERORDERS`
--

LOCK TABLES `USERORDERS` WRITE;
/*!40000 ALTER TABLE `USERORDERS` DISABLE KEYS */;
INSERT INTO `USERORDERS` VALUES (1,'siddharth',280,'Pending','2018-10-01','12:53:27',1,'Room 31, CVR Hostel, IITBHU'),(2,'siddharth',65,'Assigned','2018-10-01','12:54:01',11,'Room 31, CVR Hostel, IITBHU'),(3,'Tejas',240,'Completed','2018-10-01','12:58:25',NULL,'Room 31, CVR Hostel, IITBHU');
/*!40000 ALTER TABLE `USERORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `USERS` (
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('Krishna','krishna',1),('root','password',1),('siddharth','pass',1),('Tejas','tejas',1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS_ROLES`
--

DROP TABLE IF EXISTS `USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `USERS_ROLES` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `user` (`user`),
  CONSTRAINT `USERS_ROLES_ibfk_1` FOREIGN KEY (`user`) REFERENCES `USERS` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (1,'root','ROLE_ADMIN'),(22,'siddharth','ROLE_USER'),(23,'Krishna','ROLE_EMPLOYEE'),(24,'Tejas','ROLE_USER');
/*!40000 ALTER TABLE `USERS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01 15:21:44
