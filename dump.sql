-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: cyber_sports_dashboard
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (34,36,2,'rdyry','2025-05-17 20:41:59','2025-05-17 20:41:59'),(35,36,2,'uyt','2025-05-17 20:42:02','2025-05-17 20:42:02'),(36,37,2,'j','2025-05-17 20:42:08','2025-05-17 20:42:08'),(37,37,2,'uu','2025-05-17 20:42:23','2025-05-17 20:42:23'),(38,37,2,'j','2025-05-17 20:42:25','2025-05-17 20:42:25'),(39,36,2,'yyy','2025-05-17 20:42:34','2025-05-17 20:42:34'),(40,36,2,'нененен','2025-05-17 20:44:11','2025-05-17 20:44:11'),(41,37,2,'вып','2025-05-18 07:37:10','2025-05-18 07:37:10'),(42,37,2,'ав','2025-05-18 07:37:12','2025-05-18 07:37:12'),(43,36,2,'а','2025-05-18 07:37:17','2025-05-18 07:37:17'),(44,36,2,'а','2025-05-18 07:37:21','2025-05-18 07:37:21'),(45,37,2,'f','2025-05-18 07:56:59','2025-05-18 07:56:59'),(46,37,2,'k','2025-05-18 07:57:02','2025-05-18 07:57:02'),(47,37,2,'k','2025-05-18 07:57:04','2025-05-18 07:57:04'),(48,37,2,'f','2025-05-18 08:05:10','2025-05-18 08:05:10'),(49,37,2,'G','2025-05-18 08:06:50','2025-05-18 08:06:50'),(50,37,2,'f','2025-05-18 08:10:52','2025-05-18 08:10:52'),(51,37,2,'f','2025-05-18 08:12:05','2025-05-18 08:12:05'),(52,37,2,'f','2025-05-18 08:14:21','2025-05-18 08:14:21'),(53,37,2,'f','2025-05-18 08:20:01','2025-05-18 08:20:01'),(54,37,2,'привет','2025-05-18 08:31:45','2025-05-18 08:31:45'),(55,37,2,'привет','2025-05-18 08:31:54','2025-05-18 08:31:54'),(56,37,6,'f','2025-05-18 09:39:18','2025-05-18 09:39:18'),(57,37,6,'f','2025-05-18 09:39:20','2025-05-18 09:39:20'),(58,37,6,'ff','2025-05-18 09:51:37','2025-05-18 09:51:37');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (11,'0001_01_01_000000_create_users_table',1),(12,'0001_01_01_000001_create_cache_table',1),(13,'0001_01_01_000002_create_jobs_table',1),(14,'2025_03_27_075723_create_personal_access_tokens_table',1),(15,'2025_03_27_091427_create_posts_table',1),(18,'2025_05_13_090006_create_comments_table',2),(19,'2025_05_16_091211_add_banned_to_users',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'MyApp','e77f92fcc665993fe4ec84dbcad6767195f296b82861454337076f4d17d34aa9','[\"*\"]','2025-05-10 06:00:31',NULL,'2025-05-10 06:00:29','2025-05-10 06:00:31'),(2,'App\\Models\\User',2,'MyApp','4b5b1011c8862e1bf7cf0a5bff6764d636ec5c3d6ed6fc9b71c63c615caeb734','[\"*\"]','2025-05-10 07:32:59',NULL,'2025-05-10 06:13:42','2025-05-10 07:32:59'),(3,'App\\Models\\User',2,'MyApp','13e5863f5fda873a86b931888aeb33eee58276e3536ebeb501597fb5033bcffb','[\"*\"]','2025-05-14 03:03:57',NULL,'2025-05-12 04:35:30','2025-05-14 03:03:57'),(4,'App\\Models\\User',3,'MyApp','c0ea1c4383c575700c8c375f4503733c259b50ef968f7f8c1fda7e7fbbd80b17','[\"*\"]','2025-05-13 04:43:26',NULL,'2025-05-13 04:15:50','2025-05-13 04:43:26'),(5,'App\\Models\\User',2,'MyApp','7c8efec5555b79820c892244e425e2514d922c0e9bf20cacd9e2040cb8338c1b','[\"*\"]','2025-05-13 04:50:01',NULL,'2025-05-13 04:46:11','2025-05-13 04:50:01'),(6,'App\\Models\\User',4,'MyApp','f6a36617f87b3b36c6f5bb2500b6b0c903af3ea1864b3626e267aefc9ff687e3','[\"*\"]','2025-05-13 04:51:22',NULL,'2025-05-13 04:50:19','2025-05-13 04:51:22'),(7,'App\\Models\\User',5,'MyApp','7c2cdbc1ea1bebe452e5d74259f7e463676977e1648b20db18333ef9b2c90d2a','[\"*\"]','2025-05-13 04:56:19',NULL,'2025-05-13 04:51:45','2025-05-13 04:56:19'),(8,'App\\Models\\User',2,'MyApp','a3a89484f4905733411665e22299d73bc951bda209571eaa0dcf61b947892e4b','[\"*\"]','2025-05-13 05:35:39',NULL,'2025-05-13 04:57:31','2025-05-13 05:35:39'),(9,'App\\Models\\User',2,'MyApp','475b4a814d620bec7f6cbd87108ceda52dd8b22d9dc41fd5a7a2e28488620d19','[\"*\"]','2025-05-15 09:23:48',NULL,'2025-05-15 09:23:45','2025-05-15 09:23:48'),(10,'App\\Models\\User',2,'MyApp','9e200d4c1e985da083ba3f1a966c7d837d5f877c90fff8bd905565c1e188821d','[\"*\"]','2025-05-15 10:08:10',NULL,'2025-05-15 09:25:09','2025-05-15 10:08:10'),(11,'App\\Models\\User',2,'MyApp','9df52d2aa03c536d8344f6877c9be7cac00eed7ebf11a62b5b1cd6eff7c36731','[\"*\"]','2025-05-15 10:09:57',NULL,'2025-05-15 10:09:48','2025-05-15 10:09:57'),(12,'App\\Models\\User',2,'MyApp','a10e105a2a573ab25914ea8fa23dde8fc3b9d0e073c601934e54de8ca638d38e','[\"*\"]','2025-05-16 04:33:21',NULL,'2025-05-15 10:11:30','2025-05-16 04:33:21'),(13,'App\\Models\\User',2,'MyApp','825532c47dcd4f3a63a7b58be0a5ef748dbfcc930923d46fad23a9c97b404bb0','[\"*\"]','2025-05-16 04:40:38',NULL,'2025-05-16 04:36:46','2025-05-16 04:40:38'),(14,'App\\Models\\User',1,'MyApp','58380554f4ac049c7964ee62ce8bb03cb4840ade30a72f3c6b5ec5585500c7c2','[\"*\"]','2025-05-16 04:45:30',NULL,'2025-05-16 04:41:08','2025-05-16 04:45:30'),(15,'App\\Models\\User',2,'MyApp','be189d4c35e4e2e7edbb50fc186f7f8d9b70b40d83ca370a2806840f5a3a2f7d','[\"*\"]','2025-05-16 05:06:09',NULL,'2025-05-16 04:45:46','2025-05-16 05:06:09'),(16,'App\\Models\\User',2,'MyApp','5d4768348692ef0ffa82900a17bdc1d48b1f841668db6841f092429242e5e499','[\"*\"]','2025-05-17 20:45:47',NULL,'2025-05-17 20:13:55','2025-05-17 20:45:47'),(17,'App\\Models\\User',2,'MyApp','29348e70f65dbca5cb43840b3db635b1bd00ad65015601fb7246949a3e685f16','[\"*\"]','2025-05-18 08:20:01',NULL,'2025-05-18 07:23:05','2025-05-18 08:20:01'),(18,'App\\Models\\User',2,'MyApp','97bf5478ae9ea993bee8fa1b10b4292f7febee022ab1bc8c3fbba1934777b3d6','[\"*\"]','2025-05-18 09:24:26',NULL,'2025-05-18 08:31:39','2025-05-18 09:24:26'),(19,'App\\Models\\User',6,'MyApp','436a25627497bca1510aa50497361e6fbabf28f31ad1348b841524f44cca956c','[\"*\"]','2025-05-18 09:51:37',NULL,'2025-05-18 09:39:15','2025-05-18 09:51:37');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('cs','dota') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (36,'asddddddddd','dsaddddddddd','cs','uploads/wwDkSA3i8WwGbiq6bFcBnihnLwYvtB1JGM5ytl0T.png','2025-05-17 20:41:20','2025-05-17 20:41:20'),(37,'asdddddddddddd','asddddddddddd','dota','uploads/Nx5nWOGpAxc0bo5R1MjGS3AOOxmS9wFIJ60xi4oL.png','2025-05-17 20:41:39','2025-05-17 20:41:39'),(38,'привет','привет привет привет','cs','uploads/v75RFFkdu3WTv9APK6XP5UXJ7ragBkCQ7pv5fo6t.png','2025-05-18 08:33:08','2025-05-18 08:33:08');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('AaSyafz0F7pVXBeoPFeJ9fwzKyO6XasttsEHb5y6',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia2N6SnhoVUt2bFhiemVoRFpRS1lpTEFaYkJkYlUwcjFDdjFKZG9LYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1746874443),('aijx6Jlt9ZU3KDeyex6bTMh4eiyqN0vC7LFIyIT7',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGJTRWo3bHlJZWF6YlFhdUZpYjRBbXZkUUEwSHJRNVRCUDV3ZVI1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747132806),('HhoLLkdPyYnIKcM2YSxD5NTTyKzETbhR6ZG77YfR',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0NyNHdGQkZrSU1aTnoyZkFpNFhEUXJkMjc4Yml2Q0JpYWxHYnJ3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747046814),('IwLv0NKAwc17SVO1SKEqjOpya17pkj3Jo22eWJa2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXBPOVZDZm5IT3I2b2t6YUhnMGJESlVPNG83c1lkTDd6OGVSb3ZNViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1746874436),('kzoSHey2tuot5k59nSde3pHSmNRIM9JNjklago0o',NULL,'192.168.191.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGx5SHU0bko4dmtsYmxHY1lxTlUwR3pORG5yaFRKa0tMdXFRMXhEVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjE5MS4xMjU6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747132874),('OSoLFFjdtG1g1BA4dYrnRrySuuORuTS7B43e2RrH',NULL,'192.168.191.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXIyeDJXTFJHOFJDaHBzSUhRaEsyR0w2MFh4S2tzajAwVnFPVXk5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjE5MS4xMjU6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747132883);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aldiyar','aldiyar57@gmail.com','user',1,NULL,'$2y$12$FVX/96Qv5L7JfNlPi365RuI0pT0.C1Rv.YpbaTvHNSnZYYZ4S0n5S',NULL,NULL,'2025-05-10 06:00:29','2025-05-18 08:32:45'),(2,'admin','example57@gmail.com','admin',1,NULL,'$2y$12$pDGbRmPBnBtaojzk5odgjebcYFDBJ3V7vjBgnmRH7k/8p4Kyeux2y','avatars/yuDSTO1dNWqawIPZvPRIgPGN1B7iEjoajHsyls5F.png',NULL,'2025-05-10 06:13:19','2025-05-18 08:32:45'),(3,'Shpappy7','shpappy7@gmail.com','user',0,NULL,'$2y$12$Xg6Y5GFcdmzBubcEnlWIdeJUo61D7g.i9rX25Q/bcx98uLUVXiOem',NULL,NULL,'2025-05-13 04:15:50','2025-05-18 08:32:46'),(4,'test0','test0@gmail.com','user',0,NULL,'$2y$12$fOhfviijicPlU5Oe2nLmMe1CGQROn7187Dm9hfpaZJOyNxJf.L4yC',NULL,NULL,'2025-05-13 04:50:19','2025-05-18 08:32:43'),(5,'tester','tester@gmail.com','user',1,NULL,'$2y$12$Dbd7HQMzYGWfJ51GEXLqeeaRoN5fD3.5iP7.9i6uN7BYFbpahGe/C',NULL,NULL,'2025-05-13 04:51:45','2025-05-18 08:32:43'),(6,'New_comer','New_comer@gmail.com','user',0,NULL,'$2y$12$4in3kxq8oucbkUGHX.Y5b.GfQ//NJ2rFebFT.PMGkiEJdqd9K0Sia',NULL,NULL,'2025-05-18 09:39:15','2025-05-18 09:39:15');
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

-- Dump completed on 2025-05-18 22:00:58
