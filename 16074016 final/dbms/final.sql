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
INSERT INTO `CART` VALUES ('gamma',2,4),('null',14,20),('sahay',2,3),('sahay',14,3),('tejas',4,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIES`
--

LOCK TABLES `CATEGORIES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` VALUES (1,'Pringles','nice'),(2,'Ice Cream','nice'),(3,'Books','nice'),(4,'spectacles','nice'),(5,'drinks','nice'),(6,'wow',NULL),(7,'faltu','abcd');
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
  `mail` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
INSERT INTO `CUSTOMERS` VALUES ('abc','abc','abc',123,'abc','abc','abc@123'),('abh','abhi','abhi',1234,'abhi','abhi','abhi@abs.com'),('abhi','abhi','abhi',123,'abhi','abhi','abhi@abhi'),('dana','asdha','sajkdjak',1234,'sahdhaj','dana','ajksdbsmsd@sadha'),('gamma','gamma','gamma',123,'gamma','123','gamma@q'),('jskd','aa','aa',11,'aa','aa','aa@aa'),('kholu','kholup','kholu',111,'kholucity','111','lkasdnsc@akjdba.com'),('kholuP','kholu','kholu',111,'kholucity','111','lkasdnsc@akjdba.com'),('null','null','samdnmandmamndmadndm',123,'null','123','null@null'),('root','Admin',NULL,500094,'Hyderabad','General Store','admin@123.com'),('sahay','null','sainikpuri',221005,'Punjab','123','sid@123.com'),('sakndma','emwndms','awq',1123,'sams','sada','asnmada@12'),('siddharth','Siddharth','gaa',500094,'Var','31','sid@123.com'),('tejas','Tejas','Tejas',221005,'Hyderabad','Store','tejas@gmail.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'root','7777777777',NULL,'123'),(8,'money','12345',12345,'money');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDBACKS`
--

LOCK TABLES `FEEDBACKS` WRITE;
/*!40000 ALTER TABLE `FEEDBACKS` DISABLE KEYS */;
INSERT INTO `FEEDBACKS` VALUES (1,1,'hello',NULL,NULL,'root'),(2,10,'Very bad','2018-09-26','00:13:35','root'),(3,10,'abc','2018-09-26','00:57:40','root'),(4,10,'abc','2018-09-26','00:57:45','root'),(5,10,'nnnnnn',NULL,'01:13:57','root'),(6,11,'good','2018-09-26','16:30:05','root'),(7,11,'bad','2018-09-26','16:30:17','root'),(8,11,'late','2018-09-26','16:30:21','root'),(9,7,'ghghf','2018-09-27','01:10:53','root'),(10,7,'ghfh','2018-09-27','01:10:55','root'),(11,8,'nice drink','2018-09-27','17:22:30','root'),(12,8,'hello','2018-09-27','17:24:23','root'),(13,8,'bye','2018-09-27','17:26:07','root'),(14,12,'when will it be delivered?','2018-09-27','19:47:36','root'),(15,1,'bye','2018-09-27','20:31:14',NULL),(16,7,'abc','2018-09-27','20:33:33','sahay'),(17,1,'dsfss','2018-09-27','20:35:04','root'),(18,1,'snafnmad','2018-09-27','20:36:40','root'),(19,1,'samdbma','2018-09-27','20:37:09','root'),(20,1,'anmdn','2018-09-27','20:38:28','root'),(21,14,'ghhgj','2018-09-28','00:18:25','sahay'),(22,14,'fggfj','2018-09-28','00:18:30','sahay'),(23,18,'abc','2018-09-30','01:43:49','gamma'),(24,18,'gh','2018-09-30','01:50:28','gamma'),(25,18,'ty','2018-09-30','01:50:35','gamma'),(26,7,'qw','2018-09-30','01:51:19','gamma'),(27,7,'very bad','2018-09-30','01:57:22','gamma'),(28,18,'bye','2018-09-30','02:54:57','root');
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
INSERT INTO `LIKES` VALUES ('gamma',1),('gamma',2),('gamma',4),('gamma',7),('sahay',7),('gamma',11),('gamma',14),('gamma',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATIONS`
--

LOCK TABLES `NOTIFICATIONS` WRITE;
/*!40000 ALTER TABLE `NOTIFICATIONS` DISABLE KEYS */;
INSERT INTO `NOTIFICATIONS` VALUES (1,'new product drinks','2018-09-27','00:16:35'),(2,'hello world','2018-09-27','01:36:49'),(4,'yy','2018-09-30','02:41:21');
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
INSERT INTO `ORDERPRODUCTS` VALUES (1,1,2),(1,4,5),(2,1,1),(2,2,1),(2,6,1),(2,9,1),(2,11,2),(3,6,1),(3,9,1),(3,11,1),(4,2,2),(4,3,3),(4,9,2),(5,2,2),(5,3,3),(5,9,2),(6,2,2),(6,3,3),(6,9,2),(7,2,2),(7,3,3),(7,9,2),(8,2,2),(8,3,3),(8,9,2),(9,2,2),(9,3,1),(9,9,1),(10,1,1),(10,10,1),(10,12,1),(11,10,1),(12,2,1),(12,3,3),(12,7,1),(12,14,1),(14,2,1),(15,14,7),(16,1,4),(16,2,6),(17,1,1),(17,2,1),(18,12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` VALUES (1,'Classic Salted',60,1,8,'Tasty'),(2,'Cheese and Onion',80,1,10,''),(3,'Chocobar',20,2,12,''),(4,'Mangobar',25,2,9,''),(6,'Orangebar',10,2,5,''),(7,'Spicy Tomato',80,1,4,''),(8,'Vanilla Cup',15,2,7,''),(9,'Vanilla',15,2,12,''),(10,'baingan',500,1,0,''),(11,'Gazian',500,4,7,''),(12,'karela',200,1,0,'bitter'),(13,'Arihant',250,3,8,'full of knowledge'),(14,'coca cola',35,5,8,'Soft Drinks'),(15,'qwerty',123,7,123,'qwerty');
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
  CONSTRAINT `fk_SP_P` FOREIGN KEY (`supplierid`) REFERENCES `PRODUCTS` (`productid`),
  CONSTRAINT `fk_SP_S` FOREIGN KEY (`supplierid`) REFERENCES `SUPPLIERS` (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIERPRODUCTS`
--

LOCK TABLES `SUPPLIERPRODUCTS` WRITE;
/*!40000 ALTER TABLE `SUPPLIERPRODUCTS` DISABLE KEYS */;
INSERT INTO `SUPPLIERPRODUCTS` VALUES (1,1),(3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIERS`
--

LOCK TABLES `SUPPLIERS` WRITE;
/*!40000 ALTER TABLE `SUPPLIERS` DISABLE KEYS */;
INSERT INTO `SUPPLIERS` VALUES (1,'Dhanraj','2345567788','spaceandtime'),(2,'abc','123','123'),(3,'mvc','1234','1234');
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
INSERT INTO `USERORDERS` VALUES (1,'tejas',100,'Assigned','2018-09-24',NULL,1),(2,'tejas',1165,'Completed',NULL,'23:21:13',1),(3,'tejas',525,'Cancelled',NULL,NULL,1),(4,'sahay',250,'Cancelled',NULL,NULL,1),(5,'sahay',250,'Cancelled',NULL,NULL,1),(6,'sahay',250,'Completed',NULL,NULL,1),(7,'sahay',250,'Cancelled',NULL,NULL,1),(8,'sahay',250,'Completed',NULL,NULL,1),(9,'sahay',195,'Cancelled',NULL,NULL,1),(10,'sahay',760,'Assigned','2018-09-25','22:29:39',1),(11,'dana',500,'Assigned','2018-09-26','16:24:11',1),(12,'gamma',255,'Completed','2018-09-27','19:47:13',1),(14,'sahay',80,'Assigned','2018-09-28','00:17:59',1),(15,'sahay',245,'Assigned','2018-09-28','00:32:47',1),(16,'sahay',720,'Assigned','2018-09-28','22:45:03',8),(17,'sahay',140,'Assigned','2018-09-29','00:51:09',8),(18,'gamma',200,'Pending','2018-09-30','00:17:24',1),(41,NULL,NULL,'Assigned',NULL,NULL,8);
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
INSERT INTO `USERS` VALUES ('abc','abc',1),('abh','abhi',1),('abhi','abhi',1),('dana','dana',1),('gamma','gamma',1),('jskd','aa',1),('kholu','kholu',1),('kholuP','kholu',1),('money','money',1),('null','money',1),('root','password',1),('sahay','pass',1),('sakndma','123',1),('siddharth','pass2',1),('tejas','pass1',1),('vardhan','vardhan',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (1,'root','ROLE_ADMIN'),(2,'sahay','ROLE_USER'),(3,'tejas','ROLE_USER'),(4,'siddharth','ROLE_USER'),(5,'dana','ROLE_USER'),(6,'vardhan','ROLE_EMPLOYEE'),(8,'abhi','ROLE_USER'),(9,'abh','ROLE_USER'),(10,'jskd','ROLE_USER'),(11,'gamma','ROLE_USER'),(13,'kholu','ROLE_USER'),(14,'kholuP','ROLE_USER'),(15,'money','ROLE_EMPLOYEE'),(16,'null','ROLE_USER'),(17,'abc','ROLE_USER'),(18,'sakndma','ROLE_USER');
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

-- Dump completed on 2018-09-30  3:40:29
