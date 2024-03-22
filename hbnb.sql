-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('13217cae-3882-48a1-b56f-74dfa6d7d974','2024-03-02 21:52:27','2024-03-02 21:52:27','Air Conditioning'),('37e9bb1e-eb49-4d35-b5bd-e7d3a5d4d72f','2024-03-02 19:03:23','2024-03-02 19:03:23','new amen'),('47f3b3f2-19bf-4a93-b69c-685c29b94a2a','2024-03-02 21:52:57','2024-03-02 21:52:57','Cat(s)'),('4a165e15-2189-4edf-8faa-e4348aea6380','2024-03-02 19:03:27','2024-03-02 19:03:27','new amen'),('74c8d535-8cce-4fab-90e3-a8684a1f705d','2024-03-02 21:53:06','2024-03-02 21:53:06','Dog(s)'),('8350e7c8-1fd8-406c-b957-2bf947c3ea27','2024-03-02 21:52:39','2024-03-02 21:52:39','Cable TV'),('c831eb91-2e9c-4a89-956e-982e8ecca03e','2024-03-02 21:44:35','2024-03-02 21:44:35','Fan'),('cbbca85a-3a1e-4f93-ae8b-d4d55a03a672','2024-03-02 19:03:26','2024-03-02 19:03:26','new amen'),('dc40616e-16ad-40c0-a07e-7ae6acdf23b0','2024-03-02 19:03:24','2024-03-02 19:03:24','new amen'),('e65b4d7e-c1c1-4131-af7f-ffe2d5e0a850','2024-03-02 19:03:25','2024-03-02 19:03:25','new amen');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','2024-02-27 00:00:55','2024-02-27 00:00:55','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('26ac184e-3f41-4517-82a7-1cfd6ba920d0','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('275d4439-b801-4152-a4a8-37151bbd389c','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('3e485a50-8bd5-43ee-b08b-1178c02e9da3','2024-02-27 00:10:42','2024-02-27 00:10:42','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('3e7d399f-ce8e-4afa-94f4-9488ab3b73d8','2024-02-26 23:02:24','2024-02-26 23:02:24','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4a16470d-68d1-4269-ba51-36cae508f3c5','2024-02-26 23:02:21','2024-02-26 23:02:21','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4e94bec4-a39b-49fe-abc2-c7905c426c82','2024-02-26 23:02:22','2024-02-26 23:02:22','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('6399585b-0d75-49dd-bf26-5f1cd7889a31','2024-02-26 23:02:25','2024-02-26 23:02:25','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('762decb5-6a5a-49a9-93e3-0efd7ab384d5','2024-02-27 00:02:29','2024-02-27 00:02:29','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('7af944c9-87ec-419b-9771-2ff66c1452a2','2024-02-27 00:09:12','2024-02-27 00:09:12','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('8b3ff843-7f20-42ce-a0f8-98067c2fdac0','2024-02-26 23:02:27','2024-02-26 23:02:27','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('8f176892-40aa-43d6-b954-889ad408452f','2024-02-27 00:11:05','2024-02-27 00:11:05','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria808'),('cd5ca8ea-d41b-451d-a9ff-19ca0fea9424','2024-02-26 23:02:26','2024-02-26 23:02:26','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('cf983868-4586-496d-be65-ff5ba4d395a0','2024-02-26 23:02:20','2024-02-26 23:02:20','5db6a986-00f5-487b-b90f-d5b9110dc118','new city');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('5c614488-fa61-47db-85f2-8f8cdb5630b7','2024-03-03 18:35:13','2024-03-03 18:35:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('644e27a1-a2a3-4913-9eaf-8b726ed177db','2024-03-05 20:36:10','2024-03-05 20:36:10','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',6,2,2,200,NULL,NULL),('6757f0de-e1a4-4404-b716-82719be08a08','2024-03-02 22:20:24','2024-03-02 22:20:24','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('8669f0c1-3ae6-48a8-bd2e-a9f8b8796c77','2024-03-02 19:02:40','2024-03-02 19:02:40','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('92b5d7b9-d4c3-4ecc-90e8-76ca6f95146e','2024-03-05 20:03:49','2024-03-05 20:03:49','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,20,NULL,NULL),('ad3ca2c0-f98b-4956-9ff9-f396e22868c4','2024-03-03 18:49:55','2024-03-03 18:49:55','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,2501,NULL,NULL),('bf930613-5b7b-46c4-8189-37836408ec6c','2024-02-27 03:58:46','2024-02-27 03:58:46','cf983868-4586-496d-be65-ff5ba4d395a0','b873b576-d44e-4c0b-863b-161123e1598f','new place',NULL,0,0,0,0,NULL,NULL),('c860abbf-95cd-4940-bb62-b543b9deed8a','2024-03-03 17:42:50','2024-03-03 17:42:50','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,0,NULL,NULL),('d1a8a709-737a-4919-91ae-2585360d0b37','2024-03-03 18:49:13','2024-03-03 18:49:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('f99d171a-480b-4342-87f3-ed8ec038033c','2024-03-02 22:21:06','2024-03-02 22:21:06','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Zeus House',NULL,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('e3e4e3a1-bb2f-4908-bbad-e9bbd1529bd0','2024-02-27 04:01:00','2024-02-27 04:01:00','bf930613-5b7b-46c4-8189-37836408ec6c','b873b576-d44e-4c0b-863b-161123e1598f','NULL');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('09b34483-fc81-437c-a087-37713e1db8c5','2024-02-26 18:11:35','2024-02-26 18:11:35','California3'),('0aeeb4c3-9dcb-4dd0-ac21-f5664f7ed7ec','2024-02-26 18:10:32','2024-02-26 18:10:32','California2'),('0baf8374-ec96-4088-8a76-0f991aefb983','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('0fdb1b37-e727-4796-87e4-f1cc7ec735ec','2024-02-26 17:46:00','2024-02-26 17:46:00','New State'),('1e916e1a-2965-413e-b277-c45f02411df5','2024-02-26 01:27:21','2024-02-26 01:27:21','new state'),('32b70c0f-33e4-4d40-b072-a783f1cb7539','2024-02-26 17:45:56','2024-02-26 17:45:56','New State'),('4603d0cf-705b-4937-9aad-c8a775d801f4','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('5338e696-a002-4af0-99ee-1723039a798c','2024-02-28 00:16:07','2024-02-28 00:16:07','California'),('5db6a986-00f5-487b-b90f-d5b9110dc118','2024-02-26 23:01:04','2024-02-26 23:01:04','new state'),('642f8ea8-1cb5-4bde-bb6a-38db0c37ff32','2024-02-26 18:09:45','2024-02-26 18:09:45','California'),('649ae7e5-2f9b-42d5-90d1-9d1cab50af69','2024-02-26 17:45:58','2024-02-26 17:45:58','New State'),('877c0e90-1d9e-422b-9e5b-102d43325ade','2024-02-26 17:45:55','2024-02-26 17:45:55','New State'),('aaca1896-ea6d-47f5-9733-18ec5a623cb7','2024-02-26 17:45:54','2024-02-26 21:04:43','California is so cool2'),('c5e89c12-3a1f-4ab8-9798-74674f87e9c0','2024-02-26 21:13:14','2024-02-26 21:13:14','California'),('d71d91d9-9136-4e7e-87aa-8ecf502f89da','2024-02-26 21:05:12','2024-02-26 21:06:09','Zeus');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('393ee745-a78b-4e7f-aa26-84b78404422e','2024-02-26 01:01:26','2024-02-26 01:01:26','zeusgolohor@gmail.com','betty',NULL,NULL),('7f6df5d0-7d34-49e2-baa9-8372206697d9','2024-02-26 01:27:09','2024-02-28 00:22:22','emin','pass','California is so cool',NULL),('b873b576-d44e-4c0b-863b-161123e1598f','2024-02-26 01:01:55','2024-02-26 01:01:55','zeusgolohor@gmail.com','betty',NULL,NULL);
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

-- Dump completed on 2024-03-18 17:54:23
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('13217cae-3882-48a1-b56f-74dfa6d7d974','2024-03-02 21:52:27','2024-03-02 21:52:27','Air Conditioning'),('37e9bb1e-eb49-4d35-b5bd-e7d3a5d4d72f','2024-03-02 19:03:23','2024-03-02 19:03:23','new amen'),('47f3b3f2-19bf-4a93-b69c-685c29b94a2a','2024-03-02 21:52:57','2024-03-02 21:52:57','Cat(s)'),('4a165e15-2189-4edf-8faa-e4348aea6380','2024-03-02 19:03:27','2024-03-02 19:03:27','new amen'),('74c8d535-8cce-4fab-90e3-a8684a1f705d','2024-03-02 21:53:06','2024-03-02 21:53:06','Dog(s)'),('8350e7c8-1fd8-406c-b957-2bf947c3ea27','2024-03-02 21:52:39','2024-03-02 21:52:39','Cable TV'),('c831eb91-2e9c-4a89-956e-982e8ecca03e','2024-03-02 21:44:35','2024-03-02 21:44:35','Fan'),('cbbca85a-3a1e-4f93-ae8b-d4d55a03a672','2024-03-02 19:03:26','2024-03-02 19:03:26','new amen'),('dc40616e-16ad-40c0-a07e-7ae6acdf23b0','2024-03-02 19:03:24','2024-03-02 19:03:24','new amen'),('e65b4d7e-c1c1-4131-af7f-ffe2d5e0a850','2024-03-02 19:03:25','2024-03-02 19:03:25','new amen');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','2024-02-27 00:00:55','2024-02-27 00:00:55','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('26ac184e-3f41-4517-82a7-1cfd6ba920d0','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('275d4439-b801-4152-a4a8-37151bbd389c','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('3e485a50-8bd5-43ee-b08b-1178c02e9da3','2024-02-27 00:10:42','2024-02-27 00:10:42','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('3e7d399f-ce8e-4afa-94f4-9488ab3b73d8','2024-02-26 23:02:24','2024-02-26 23:02:24','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4a16470d-68d1-4269-ba51-36cae508f3c5','2024-02-26 23:02:21','2024-02-26 23:02:21','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4e94bec4-a39b-49fe-abc2-c7905c426c82','2024-02-26 23:02:22','2024-02-26 23:02:22','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('6399585b-0d75-49dd-bf26-5f1cd7889a31','2024-02-26 23:02:25','2024-02-26 23:02:25','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('762decb5-6a5a-49a9-93e3-0efd7ab384d5','2024-02-27 00:02:29','2024-02-27 00:02:29','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('7af944c9-87ec-419b-9771-2ff66c1452a2','2024-02-27 00:09:12','2024-02-27 00:09:12','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('8b3ff843-7f20-42ce-a0f8-98067c2fdac0','2024-02-26 23:02:27','2024-02-26 23:02:27','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('8f176892-40aa-43d6-b954-889ad408452f','2024-02-27 00:11:05','2024-02-27 00:11:05','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria808'),('cd5ca8ea-d41b-451d-a9ff-19ca0fea9424','2024-02-26 23:02:26','2024-02-26 23:02:26','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('cf983868-4586-496d-be65-ff5ba4d395a0','2024-02-26 23:02:20','2024-02-26 23:02:20','5db6a986-00f5-487b-b90f-d5b9110dc118','new city');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('5c614488-fa61-47db-85f2-8f8cdb5630b7','2024-03-03 18:35:13','2024-03-03 18:35:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('644e27a1-a2a3-4913-9eaf-8b726ed177db','2024-03-05 20:36:10','2024-03-05 20:36:10','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',6,2,2,200,NULL,NULL),('6757f0de-e1a4-4404-b716-82719be08a08','2024-03-02 22:20:24','2024-03-02 22:20:24','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('8669f0c1-3ae6-48a8-bd2e-a9f8b8796c77','2024-03-02 19:02:40','2024-03-02 19:02:40','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('92b5d7b9-d4c3-4ecc-90e8-76ca6f95146e','2024-03-05 20:03:49','2024-03-05 20:03:49','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,20,NULL,NULL),('ad3ca2c0-f98b-4956-9ff9-f396e22868c4','2024-03-03 18:49:55','2024-03-03 18:49:55','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,2501,NULL,NULL),('bf930613-5b7b-46c4-8189-37836408ec6c','2024-02-27 03:58:46','2024-02-27 03:58:46','cf983868-4586-496d-be65-ff5ba4d395a0','b873b576-d44e-4c0b-863b-161123e1598f','new place',NULL,0,0,0,0,NULL,NULL),('c860abbf-95cd-4940-bb62-b543b9deed8a','2024-03-03 17:42:50','2024-03-03 17:42:50','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,0,NULL,NULL),('d1a8a709-737a-4919-91ae-2585360d0b37','2024-03-03 18:49:13','2024-03-03 18:49:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('f99d171a-480b-4342-87f3-ed8ec038033c','2024-03-02 22:21:06','2024-03-02 22:21:06','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Zeus House',NULL,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('e3e4e3a1-bb2f-4908-bbad-e9bbd1529bd0','2024-02-27 04:01:00','2024-02-27 04:01:00','bf930613-5b7b-46c4-8189-37836408ec6c','b873b576-d44e-4c0b-863b-161123e1598f','NULL');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('09b34483-fc81-437c-a087-37713e1db8c5','2024-02-26 18:11:35','2024-02-26 18:11:35','California3'),('0aeeb4c3-9dcb-4dd0-ac21-f5664f7ed7ec','2024-02-26 18:10:32','2024-02-26 18:10:32','California2'),('0baf8374-ec96-4088-8a76-0f991aefb983','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('0fdb1b37-e727-4796-87e4-f1cc7ec735ec','2024-02-26 17:46:00','2024-02-26 17:46:00','New State'),('1e916e1a-2965-413e-b277-c45f02411df5','2024-02-26 01:27:21','2024-02-26 01:27:21','new state'),('32b70c0f-33e4-4d40-b072-a783f1cb7539','2024-02-26 17:45:56','2024-02-26 17:45:56','New State'),('4603d0cf-705b-4937-9aad-c8a775d801f4','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('5338e696-a002-4af0-99ee-1723039a798c','2024-02-28 00:16:07','2024-02-28 00:16:07','California'),('5db6a986-00f5-487b-b90f-d5b9110dc118','2024-02-26 23:01:04','2024-02-26 23:01:04','new state'),('642f8ea8-1cb5-4bde-bb6a-38db0c37ff32','2024-02-26 18:09:45','2024-02-26 18:09:45','California'),('649ae7e5-2f9b-42d5-90d1-9d1cab50af69','2024-02-26 17:45:58','2024-02-26 17:45:58','New State'),('877c0e90-1d9e-422b-9e5b-102d43325ade','2024-02-26 17:45:55','2024-02-26 17:45:55','New State'),('aaca1896-ea6d-47f5-9733-18ec5a623cb7','2024-02-26 17:45:54','2024-02-26 21:04:43','California is so cool2'),('c5e89c12-3a1f-4ab8-9798-74674f87e9c0','2024-02-26 21:13:14','2024-02-26 21:13:14','California'),('d71d91d9-9136-4e7e-87aa-8ecf502f89da','2024-02-26 21:05:12','2024-02-26 21:06:09','Zeus');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('393ee745-a78b-4e7f-aa26-84b78404422e','2024-02-26 01:01:26','2024-02-26 01:01:26','zeusgolohor@gmail.com','betty',NULL,NULL),('7f6df5d0-7d34-49e2-baa9-8372206697d9','2024-02-26 01:27:09','2024-02-28 00:22:22','emin','pass','California is so cool',NULL),('b873b576-d44e-4c0b-863b-161123e1598f','2024-02-26 01:01:55','2024-02-26 01:01:55','zeusgolohor@gmail.com','betty',NULL,NULL);
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

-- Dump completed on 2024-03-18 17:54:35
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES ('13217cae-3882-48a1-b56f-74dfa6d7d974','2024-03-02 21:52:27','2024-03-02 21:52:27','Air Conditioning'),('37e9bb1e-eb49-4d35-b5bd-e7d3a5d4d72f','2024-03-02 19:03:23','2024-03-02 19:03:23','new amen'),('47f3b3f2-19bf-4a93-b69c-685c29b94a2a','2024-03-02 21:52:57','2024-03-02 21:52:57','Cat(s)'),('4a165e15-2189-4edf-8faa-e4348aea6380','2024-03-02 19:03:27','2024-03-02 19:03:27','new amen'),('74c8d535-8cce-4fab-90e3-a8684a1f705d','2024-03-02 21:53:06','2024-03-02 21:53:06','Dog(s)'),('8350e7c8-1fd8-406c-b957-2bf947c3ea27','2024-03-02 21:52:39','2024-03-02 21:52:39','Cable TV'),('c831eb91-2e9c-4a89-956e-982e8ecca03e','2024-03-02 21:44:35','2024-03-02 21:44:35','Fan'),('cbbca85a-3a1e-4f93-ae8b-d4d55a03a672','2024-03-02 19:03:26','2024-03-02 19:03:26','new amen'),('dc40616e-16ad-40c0-a07e-7ae6acdf23b0','2024-03-02 19:03:24','2024-03-02 19:03:24','new amen'),('e65b4d7e-c1c1-4131-af7f-ffe2d5e0a850','2024-03-02 19:03:25','2024-03-02 19:03:25','new amen');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','2024-02-27 00:00:55','2024-02-27 00:00:55','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('26ac184e-3f41-4517-82a7-1cfd6ba920d0','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('275d4439-b801-4152-a4a8-37151bbd389c','2024-02-26 23:02:28','2024-02-26 23:02:28','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('3e485a50-8bd5-43ee-b08b-1178c02e9da3','2024-02-27 00:10:42','2024-02-27 00:10:42','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('3e7d399f-ce8e-4afa-94f4-9488ab3b73d8','2024-02-26 23:02:24','2024-02-26 23:02:24','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4a16470d-68d1-4269-ba51-36cae508f3c5','2024-02-26 23:02:21','2024-02-26 23:02:21','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('4e94bec4-a39b-49fe-abc2-c7905c426c82','2024-02-26 23:02:22','2024-02-26 23:02:22','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('6399585b-0d75-49dd-bf26-5f1cd7889a31','2024-02-26 23:02:25','2024-02-26 23:02:25','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('762decb5-6a5a-49a9-93e3-0efd7ab384d5','2024-02-27 00:02:29','2024-02-27 00:02:29','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('7af944c9-87ec-419b-9771-2ff66c1452a2','2024-02-27 00:09:12','2024-02-27 00:09:12','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria'),('8b3ff843-7f20-42ce-a0f8-98067c2fdac0','2024-02-26 23:02:27','2024-02-26 23:02:27','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('8f176892-40aa-43d6-b954-889ad408452f','2024-02-27 00:11:05','2024-02-27 00:11:05','5db6a986-00f5-487b-b90f-d5b9110dc118','Alexandria808'),('cd5ca8ea-d41b-451d-a9ff-19ca0fea9424','2024-02-26 23:02:26','2024-02-26 23:02:26','5db6a986-00f5-487b-b90f-d5b9110dc118','new city'),('cf983868-4586-496d-be65-ff5ba4d395a0','2024-02-26 23:02:20','2024-02-26 23:02:20','5db6a986-00f5-487b-b90f-d5b9110dc118','new city');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('5c614488-fa61-47db-85f2-8f8cdb5630b7','2024-03-03 18:35:13','2024-03-03 18:35:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('644e27a1-a2a3-4913-9eaf-8b726ed177db','2024-03-05 20:36:10','2024-03-05 20:36:10','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',6,2,2,200,NULL,NULL),('6757f0de-e1a4-4404-b716-82719be08a08','2024-03-02 22:20:24','2024-03-02 22:20:24','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('8669f0c1-3ae6-48a8-bd2e-a9f8b8796c77','2024-03-02 19:02:40','2024-03-02 19:02:40','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','new place',NULL,0,0,0,0,NULL,NULL),('92b5d7b9-d4c3-4ecc-90e8-76ca6f95146e','2024-03-05 20:03:49','2024-03-05 20:03:49','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,20,NULL,NULL),('ad3ca2c0-f98b-4956-9ff9-f396e22868c4','2024-03-03 18:49:55','2024-03-03 18:49:55','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,2501,NULL,NULL),('bf930613-5b7b-46c4-8189-37836408ec6c','2024-02-27 03:58:46','2024-02-27 03:58:46','cf983868-4586-496d-be65-ff5ba4d395a0','b873b576-d44e-4c0b-863b-161123e1598f','new place',NULL,0,0,0,0,NULL,NULL),('c860abbf-95cd-4940-bb62-b543b9deed8a','2024-03-03 17:42:50','2024-03-03 17:42:50','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,0,NULL,NULL),('d1a8a709-737a-4919-91ae-2585360d0b37','2024-03-03 18:49:13','2024-03-03 18:49:13','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Newly Added','This is a beatiful house.',0,2,1,250,NULL,NULL),('f99d171a-480b-4342-87f3-ed8ec038033c','2024-03-02 22:21:06','2024-03-02 22:21:06','0b485d1d-726d-4c7b-acc5-b2f5fcaecfbe','393ee745-a78b-4e7f-aa26-84b78404422e','Zeus House',NULL,0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('e3e4e3a1-bb2f-4908-bbad-e9bbd1529bd0','2024-02-27 04:01:00','2024-02-27 04:01:00','bf930613-5b7b-46c4-8189-37836408ec6c','b873b576-d44e-4c0b-863b-161123e1598f','NULL');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('09b34483-fc81-437c-a087-37713e1db8c5','2024-02-26 18:11:35','2024-02-26 18:11:35','California3'),('0aeeb4c3-9dcb-4dd0-ac21-f5664f7ed7ec','2024-02-26 18:10:32','2024-02-26 18:10:32','California2'),('0baf8374-ec96-4088-8a76-0f991aefb983','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('0fdb1b37-e727-4796-87e4-f1cc7ec735ec','2024-02-26 17:46:00','2024-02-26 17:46:00','New State'),('1e916e1a-2965-413e-b277-c45f02411df5','2024-02-26 01:27:21','2024-02-26 01:27:21','new state'),('32b70c0f-33e4-4d40-b072-a783f1cb7539','2024-02-26 17:45:56','2024-02-26 17:45:56','New State'),('4603d0cf-705b-4937-9aad-c8a775d801f4','2024-02-26 17:45:57','2024-02-26 17:45:57','New State'),('5338e696-a002-4af0-99ee-1723039a798c','2024-02-28 00:16:07','2024-02-28 00:16:07','California'),('5db6a986-00f5-487b-b90f-d5b9110dc118','2024-02-26 23:01:04','2024-02-26 23:01:04','new state'),('642f8ea8-1cb5-4bde-bb6a-38db0c37ff32','2024-02-26 18:09:45','2024-02-26 18:09:45','California'),('649ae7e5-2f9b-42d5-90d1-9d1cab50af69','2024-02-26 17:45:58','2024-02-26 17:45:58','New State'),('877c0e90-1d9e-422b-9e5b-102d43325ade','2024-02-26 17:45:55','2024-02-26 17:45:55','New State'),('aaca1896-ea6d-47f5-9733-18ec5a623cb7','2024-02-26 17:45:54','2024-02-26 21:04:43','California is so cool2'),('c5e89c12-3a1f-4ab8-9798-74674f87e9c0','2024-02-26 21:13:14','2024-02-26 21:13:14','California'),('d71d91d9-9136-4e7e-87aa-8ecf502f89da','2024-02-26 21:05:12','2024-02-26 21:06:09','Zeus');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('393ee745-a78b-4e7f-aa26-84b78404422e','2024-02-26 01:01:26','2024-02-26 01:01:26','zeusgolohor@gmail.com','betty',NULL,NULL),('7f6df5d0-7d34-49e2-baa9-8372206697d9','2024-02-26 01:27:09','2024-02-28 00:22:22','emin','pass','California is so cool',NULL),('b873b576-d44e-4c0b-863b-161123e1598f','2024-02-26 01:01:55','2024-02-26 01:01:55','zeusgolohor@gmail.com','betty',NULL,NULL);
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

-- Dump completed on 2024-03-18 17:54:51
