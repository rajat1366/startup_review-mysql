CREATE DATABASE  IF NOT EXISTS `startupreviewdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `startupreviewdb`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: startupreviewdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `description` text,
  `rating` float DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `startup_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlvbtu5ki2qe9dcms8nw7wc7jj` (`startup_id`),
  KEY `FKb3354ee2xxvdrbyq9f42jdayd` (`user_id`),
  CONSTRAINT `FKb3354ee2xxvdrbyq9f42jdayd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlvbtu5ki2qe9dcms8nw7wc7jj` FOREIGN KEY (`startup_id`) REFERENCES `startups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'2021-04-26 18:44:50','This is a test Review for Uber 123',6,'Review 1 for Uber',18,4),(5,'2021-04-26 17:30:22','Review 2 Edited again  descirption',9.5,'Review 2',18,5);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startups`
--

DROP TABLE IF EXISTS `startups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `startups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(20) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `launch_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKe2j7pts8cm0223w9pmqg6o0pj` (`name`),
  KEY `FKkbubfvl2ekx6ev22m0pha2e58` (`user_id`),
  CONSTRAINT `FKkbubfvl2ekx6ev22m0pha2e58` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups`
--

LOCK TABLES `startups` WRITE;
/*!40000 ALTER TABLE `startups` DISABLE KEYS */;
INSERT INTO `startups` VALUES (18,'Uber Technologies, Inc., commonly known as Uber, is an American technology company. Its services include ride-hailing, food delivery (Uber Eats), package delivery, couriers, freight transportation, and, through a partnership with Lime, electric bicycle and motorized scooter rental. The company is based in San Francisco and has operations in over 900 metropolitan areas worldwide.[3] It is one of the largest firms in the gig economy.','uber',4,'2021-04-21 22:14:29','2020-04-21 00:00:00'),(19,'Zomato (/zoʊmɑːtoʊ/) is an Indian multinational restaurant aggregator and food delivery company founded by Pankaj Chaddah and Deepinder Goyal in 2008.[8][9] Zomato provides information, menus and user-reviews of restaurants as well as food delivery options from partner restaurants in select cities.[10] As of 2019, the service is available in 24 countries and in more than 10,000 cities.[11]','zomato',4,'2021-04-21 22:14:55','2020-03-21 00:00:00'),(20,'Lyft, Inc. develops, markets, and operates a mobile app, offering vehicles for hire, motorized scooters, a bicycle-sharing system, and food delivery. The company is based in San Francisco, California and operates in 644 cities in the United States and 12 cities in Canada.[2]\n\nWith a 30% market share, Lyft is the second-largest ridesharing company in the United States after Uber.[3]','lyft',4,'2021-04-21 22:16:24','2020-02-21 00:00:00'),(22,'CRED is an Indian fintech startup and unicorn,[1][2][3] based out of Bangalore, Karnataka, which was founded in 2018.[4][5][6] CRED\'s main feature is allowing users to make credit card payments through its app for which they get rewarded.[7] Later, CRED added features to allow users to make house rent payments[8] and introduced short-term credit lines.[9] CRED\'s business model and valuation has received criticism for being overvalued and lacking a solid monetization plan.[10][11]\n\nCRED raised funding from DST Global,[12] Sequoia Capital (India),[13][14] and Tiger Global,[15] among other investors, through four rounds of private funding so far[16] and is currently valued at $2.2 billion (April 2021).[17] CRED posted losses of Rs. 360.31 crore in the 2020 fiscal year (FY20),[18] caused primarily due to high expenditure on marketing and advertising.[19] CRED became the official partner (sponsor) for the Indian Premier League for three years from 2020 to 2022,[20][21][22] in a Rs. 120 crore deal.[23] CRED\'s advertising content and videos, often made in-house and featuring celebrities such as Anil Kapoor,[24] Madhuri Dixit[25] and Udit Narayan[26] generated large discourse in news and social media[27][28][29][30] due to their unique advertising strategy, which has received both praise[31] and criticism.[32]','cred',4,'2021-04-24 13:01:20','2018-01-01 00:00:00'),(23,'Swiggy is India\'s largest[3][4][5] online food ordering and delivery platform, founded in 2014. Swiggy is based in Bangalore, India, and as of March 2019, was operating in 100 Indian cities.[6] In early 2019, Swiggy expanded into general product deliveries under the name Swiggy Stores.[7][8][4]\n\nIn September 2019, Swiggy launched instant pickup and drop service Swiggy Go.[9] The service is used for a diverse array of items, including laundry and document or parcel deliveries to business clients and retail customers.[10]\n\nSwiggy is operated by Bundl Technologies Private Limited.[1]','swiggy',4,'2021-04-25 00:47:40','2014-01-01 00:00:00');
/*!40000 ALTER TABLE `startups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,1),(5,1),(4,2),(4,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'rajat.kumar@iiitb.ac.in','$2a$10$9d3yQFxJ2xHimtvJdGofh.YNszBBhXkgAqEau5e8m/Qp0VpuiQfsS','rajat','Rajat Kumar'),(5,'rajat1@gmail.com','$2a$10$x2vZwnKR6yLSgabWi1ZUgOEPLc55RCUUUz54edAzPYzrZA21t347a','rajat1','Rajat Kumar');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 16:17:06
