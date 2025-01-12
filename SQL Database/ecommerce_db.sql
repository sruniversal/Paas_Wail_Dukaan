-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FK9x4wn098i53ikun1ynxet2ynj` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK9x4wn098i53ikun1ynxet2ynj` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,1,3,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_address`
--

LOCK TABLES `order_address` WRITE;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
INSERT INTO `order_address` VALUES (1,'Near Shivam Medical Store, Gwal Chowk, Harda Road, Gwaltoli, Hoshangabad','HOSHANGABAD','rohanyadav@gmail.com','ROHAN','YADAV','07049895951','461001','Madhya Pradesh'),(2,'Near Shivam Medical Store, Gwal Chowk, Harda Road, Gwaltoli, Hoshangabad','HOSHANGABAD','rohanyadav200031995@gmail.com','ROHAN','YADAV','07049895951','461001','Madhya Pradesh');
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `discount` int NOT NULL,
  `discount_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `shop` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'100 page A4 size',2,49,'th (1).jpeg',_binary '',50,40,'Classmate Register Copy','Deepak Book Store'),(2,NULL,'',0,50,'th (1).jpeg',_binary '',50,40,'Classmate Register Copy',NULL),(3,NULL,'',0,600,'grinder.jpg',_binary '',600,6,'Grinder','Jyoti Electricals'),(4,NULL,'',0,100,'groccery.jpg',_binary '',100,50,'grosery','gurukripa store');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order_address_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qcdbxaeuc7c5gahwh0dutg04r` (`order_address_id`),
  KEY `FKh73acsd9s5wp6l0e55td6jr1m` (`product_id`),
  KEY `FK4f2ycr32kigtux5ag3tv0xu5m` (`user_id`),
  CONSTRAINT `FK4f2ycr32kigtux5ag3tv0xu5m` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`),
  CONSTRAINT `FK8frxalwc79tpxo7hgqp3hsjck` FOREIGN KEY (`order_address_id`) REFERENCES `order_address` (`id`),
  CONSTRAINT `FKh73acsd9s5wp6l0e55td6jr1m` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,'2025-01-12','bdbe1e3b-41bc-444b-9490-731d5aeb65f3','COD',50,1,'In Progress',1,1,2),(2,'2025-01-12','300d90e4-dcba-4416-9bb0-93e790cea1fc','COD',600,1,'Out for Delivery',2,3,2);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (3,'th.jpeg',_binary '','Deepak Book Store'),(4,'appli.png',_binary '','Jyoti Electricals'),(5,'OIP.jpeg',_binary '','gurukripa store');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dtls`
--

DROP TABLE IF EXISTS `user_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dtls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_non_locked` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `failed_attempt` int DEFAULT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `lock_time` datetime(6) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dtls`
--

LOCK TABLES `user_dtls` WRITE;
/*!40000 ALTER TABLE `user_dtls` DISABLE KEYS */;
INSERT INTO `user_dtls` VALUES (1,_binary '','harada road gwaltoli hoshangabad','hoshangabad','shubhamyadav@gmail.com',0,_binary '',NULL,'7999727149','Shubham Yadav','$2a$10$i79ug3a7ymj67SUPKGC92.YCPWbp89JrfhFttRIvIn2L9ICk6OfXC','461001','Screenshot (3).png',NULL,'ROLE_RETAIL','Madhya Pradesh'),(2,_binary '','harada road gwaltoli hoshangabad','hoshangabad','rohanyadav@gmail.com',0,_binary '',NULL,'7049895951','Rohan Yadav','$2a$10$V.fYTVqWdYMttmriYm5JBeWqVHh6MfENgTYZQMa4Kxfh.kUYGIXWG','461001','profile.jpg',NULL,'ROLE_USER','Madhya Pradesh'),(3,_binary '','harada road gwaltoli hoshangabad','hoshangabad','satyam@gmail.com',0,_binary '',NULL,'987654321','Satyam Yadav','$2a$10$AstVG8yPDR0eZP.BcBBx7OL6u9dydbQ1co/U12mMexLWZEwHxTwxG','461001','default.jpg',NULL,'ROLE_ADMIN','Madhya Pradesh');
/*!40000 ALTER TABLE `user_dtls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-12 17:00:33
