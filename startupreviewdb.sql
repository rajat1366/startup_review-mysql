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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `description` text,
  `rating_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe3087q6lb6xq4cm11ypkhcqkm` (`rating_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKe3087q6lb6xq4cm11ypkhcqkm` FOREIGN KEY (`rating_id`) REFERENCES `ratings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2021-05-04 15:33:37','This is a first test comment on this review. first Modification',1,4),(2,'2021-05-04 15:38:54','This is comment 2 on this rating.Thank you so much. Second Modification',1,4),(3,'2021-05-04 17:42:31','This is another test comment on this',1,4),(4,'2021-05-04 18:03:49','This is a test Review from a different user.',1,5),(5,'2021-05-04 19:36:10','Testing another comment for this rating. Modification is all done',1,4),(6,'2021-05-14 18:48:00','this is test comment for review 2',5,4),(7,'2021-05-14 19:26:31','this a comment for zoom app.',6,4),(8,'2021-05-14 21:07:42','this is first comment on this app\n',9,4);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

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
  `title` varchar(255) DEFAULT NULL,
  `startup_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlvbtu5ki2qe9dcms8nw7wc7jj` (`startup_id`),
  KEY `FKb3354ee2xxvdrbyq9f42jdayd` (`user_id`),
  CONSTRAINT `FKb3354ee2xxvdrbyq9f42jdayd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlvbtu5ki2qe9dcms8nw7wc7jj` FOREIGN KEY (`startup_id`) REFERENCES `startups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'2021-05-14 20:07:12','This is a test Review for Uber 123 test descirptiom',6,'Review 1 for Uber',18,4),(5,'2021-04-26 17:30:22','Review 2 Edited again  descirption',9.5,'Review 2',18,5),(6,'2021-05-14 19:27:02','this is test review for zoom application',5.5,'Useful app',29,4),(7,'2021-05-14 20:07:43','The food is delicious',8,'Review for Zomato',19,4),(8,'2021-05-14 20:17:06','like the serivce provided ',3,'very good service again',20,4),(9,'2021-05-14 21:05:45','The app is very usefull',8.5,'Nice App',22,4);
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
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `launch_date` datetime DEFAULT NULL,
  `tags` text,
  `logo_link` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKe2j7pts8cm0223w9pmqg6o0pj` (`name`),
  KEY `FKkbubfvl2ekx6ev22m0pha2e58` (`user_id`),
  CONSTRAINT `FKkbubfvl2ekx6ev22m0pha2e58` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups`
--

LOCK TABLES `startups` WRITE;
/*!40000 ALTER TABLE `startups` DISABLE KEYS */;
INSERT INTO `startups` VALUES (18,'Uber Technologies, Inc., commonly known as Uber, is an American technology company. Its services include ride-hailing, food delivery (Uber Eats), package delivery, couriers, freight transportation, and, through a partnership with Lime, electric bicycle and motorized scooter rental. The company is based in San Francisco and has operations in over 900 metropolitan areas worldwide.[3] It is one of the largest firms in the gig economy.','uber',4,'2021-05-14 17:32:17','2020-04-18 00:00:00','transport','https://www.logo.wine/a/logo/Uber/Uber-Logo.wine.svg'),(19,'Zomato (/zoʊmɑːtoʊ/) is an Indian multinational restaurant aggregator and food delivery company founded by Pankaj Chaddah and Deepinder Goyal in 2008.[8][9] Zomato provides information, menus and user-reviews of restaurants as well as food delivery options from partner restaurants in select cities.[10] As of 2019, the service is available in 24 countries and in more than 10,000 cities.[11]','zomato',4,'2021-05-04 23:13:45','2020-03-19 00:00:00','food,delivery','data:image/png;base64,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'),(20,'Lyft, Inc. develops, markets, and operates a mobile app, offering vehicles for hire, motorized scooters, a bicycle-sharing system, and food delivery. The company is based in San Francisco, California and operates in 644 cities in the United States and 12 cities in Canada.[2]\n\nWith a 30% market share, Lyft is the second-largest ridesharing company in the United States after Uber.[3]','lyft',4,'2021-05-04 22:37:59','2020-02-20 00:00:00','travel,transportation','https://cdn.designrush.com/uploads/inspiration_images/4796/990__1511457945_616_lyft.png'),(22,'CRED is an Indian fintech startup and unicorn,[1][2][3] based out of Bangalore, Karnataka, which was founded in 2018.[4][5][6] CRED\'s main feature is allowing users to make credit card payments through its app for which they get rewarded.[7] Later, CRED added features to allow users to make house rent payments[8] and introduced short-term credit lines.[9] CRED\'s business model and valuation has received criticism for being overvalued and lacking a solid monetization plan.[10][11]\n\nCRED raised funding from DST Global,[12] Sequoia Capital (India),[13][14] and Tiger Global,[15] among other investors, through four rounds of private funding so far[16] and is currently valued at $2.2 billion (April 2021).[17] CRED posted losses of Rs. 360.31 crore in the 2020 fiscal year (FY20),[18] caused primarily due to high expenditure on marketing and advertising.[19] CRED became the official partner (sponsor) for the Indian Premier League for three years from 2020 to 2022,[20][21][22] in a Rs. 120 crore deal.[23] CRED\'s advertising content and videos, often made in-house and featuring celebrities such as Anil Kapoor,[24] Madhuri Dixit[25] and Udit Narayan[26] generated large discourse in news and social media[27][28][29][30] due to their unique advertising strategy, which has received both praise[31] and criticism.[32]','cred',4,'2021-05-04 22:38:28','2017-12-31 00:00:00','finance','https://www.nextbigbrand.in/wp-content/uploads/2019/03/Screen-Shot-2019-03-08-at-9.36.24-PM.png'),(23,'Swiggy is India\'s largest[3][4][5] online food ordering and delivery platform, founded in 2014. Swiggy is based in Bangalore, India, and as of March 2019, was operating in 100 Indian cities.[6] In early 2019, Swiggy expanded into general product deliveries under the name Swiggy Stores.[7][8][4]\n\nIn September 2019, Swiggy launched instant pickup and drop service Swiggy Go.[9] The service is used for a diverse array of items, including laundry and document or parcel deliveries to business clients and retail customers.[10]\n\nSwiggy is operated by Bundl Technologies Private Limited.[1]','swiggy 123',4,'2021-05-14 18:18:53','2013-12-29 00:00:00','food,delivery','https://cdn.worldvectorlogo.com/logos/swiggy-1.svg'),(26,'Flipkart is an Indian e-commerce company, headquartered in Bangalore, Karnataka, India, and incorporated in Singapore as a private limited company.[7] The company initially focused on online book sales before expanding into other product categories such as consumer electronics, fashion, home essentials, groceries, and lifestyle products.\n\nThe service competes primarily with Amazon\'s Indian subsidiary and domestic rival Snapdeal.[8][9] As of March 2017, Flipkart held a 39.5% market share of India\'s e-commerce industry.[10] Flipkart has a dominant position in the apparel segment, bolstered by its acquisition of Myntra, and was described as being \"neck and neck\" with Amazon in the sale of electronics and mobile phones.[11] Flipkart also owns PhonePe, a mobile payments service based on the Unified Payments Interface.','flipkart',4,'2021-05-04 22:43:15','2006-12-27 00:00:00','ecommerce,apparel','https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5f3d81106163451.5f897528aa41a.jpg'),(29,'Zoom Video Communications, Inc. (stylized as zoom or simply Zoom) is an American communications technology company headquartered in San Jose, California. It provides videotelephony and online chat services through a cloud-based peer-to-peer software platform and is used for teleconferencing, telecommuting, distance education, and social relations.[4][5]\n\nEric Yuan, a former Cisco engineer and executive, founded Zoom in 2011, and launched its software in 2013.[6] Zoom\'s aggressive revenue growth, and perceived ease-of-use and reliability of its software, resulted in a $1 billion valuation in 2017, making it a \"unicorn\" company.[7] The company first became profitable in 2019,[8][9] and completed an initial public offering that year.[10] The company joined the NASDAQ-100 stock index on April 30, 2020.[11]','zoom',4,'2021-05-14 18:07:36','2021-04-28 00:00:00','video,communication','https://seeklogo.com/images/Z/zoom-icon-logo-C552F99BAC-seeklogo.com.png');
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
INSERT INTO `users` VALUES (4,'rajat.kumar@iiitb.ac.in','$2a$10$9d3yQFxJ2xHimtvJdGofh.YNszBBhXkgAqEau5e8m/Qp0VpuiQfsS','rajat','Rajat Kumar'),(5,'rajat1@gmail.com','$2a$10$x2vZwnKR6yLSgabWi1ZUgOEPLc55RCUUUz54edAzPYzrZA21t347a','rajat1','Lando Norris');
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

-- Dump completed on 2021-05-16 23:33:52
