-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: school_db_test
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `school_db_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `school_db_test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `school_db_test`;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id_pic` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `path_of media` varchar(256) NOT NULL,
  PRIMARY KEY (`id_pic`),
  KEY `id_school` (`id_school`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `tbl_school_main_table` (`school_id`),
  CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(256) NOT NULL,
  `admin_contact` varchar(10) NOT NULL,
  `admin_address` varchar(256) NOT NULL,
  `admin_password` varchar(64) NOT NULL,
  `admin_is_super` tinyint(1) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_blog_attachment`
--

DROP TABLE IF EXISTS `tbl_blog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_blog_attachment` (
  `id_blog_attachment` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_path` varchar(256) NOT NULL,
  `attachment_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id_blog_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_blog_attachment`
--

LOCK TABLES `tbl_blog_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_blog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_blog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_blog_data`
--

DROP TABLE IF EXISTS `tbl_blog_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_blog_data` (
  `id_blog_data` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_data` int(11) NOT NULL,
  `blog_title` varchar(256) NOT NULL,
  `blog_text` varchar(1000) NOT NULL,
  `id_blog_attachment` int(11) NOT NULL,
  `id_school` int(11) NOT NULL,
  PRIMARY KEY (`id_blog_data`),
  KEY `id_user_data` (`id_user_data`),
  KEY `id_blog_attachment` (`id_blog_attachment`),
  KEY `id_school` (`id_school`),
  CONSTRAINT `tbl_blog_data_ibfk_1` FOREIGN KEY (`id_user_data`) REFERENCES `tbl_users` (`user_id`),
  CONSTRAINT `tbl_blog_data_ibfk_2` FOREIGN KEY (`id_blog_attachment`) REFERENCES `tbl_blog_attachment` (`id_blog_attachment`),
  CONSTRAINT `tbl_blog_data_ibfk_3` FOREIGN KEY (`id_school`) REFERENCES `tbl_school_main_table` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_blog_data`
--

LOCK TABLES `tbl_blog_data` WRITE;
/*!40000 ALTER TABLE `tbl_blog_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_blog_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_child_table`
--

DROP TABLE IF EXISTS `tbl_child_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_child_table` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `child_name` varchar(80) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_child_table`
--

LOCK TABLES `tbl_child_table` WRITE;
/*!40000 ALTER TABLE `tbl_child_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_child_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comments_table`
--

DROP TABLE IF EXISTS `tbl_comments_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comments_table` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_blog` int(11) NOT NULL,
  `type_of_text` varchar(256) NOT NULL,
  `comment_text` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_blog` (`id_blog`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_comments_table_ibfk_1` FOREIGN KEY (`id_blog`) REFERENCES `tbl_blog_data` (`id_blog_data`),
  CONSTRAINT `tbl_comments_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comments_table`
--

LOCK TABLES `tbl_comments_table` WRITE;
/*!40000 ALTER TABLE `tbl_comments_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comments_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comparison_strings`
--

DROP TABLE IF EXISTS `tbl_comparison_strings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comparison_strings` (
  `idtbl_comparison_strings` int(11) NOT NULL AUTO_INCREMENT,
  `creteria` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtbl_comparison_strings`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comparison_strings`
--

LOCK TABLES `tbl_comparison_strings` WRITE;
/*!40000 ALTER TABLE `tbl_comparison_strings` DISABLE KEYS */;
INSERT INTO `tbl_comparison_strings` VALUES (1,'school_timing','Full day(9am ­ 4pm)','1'),(2,'school_timing','Half day(7am – 12 pm)','2'),(3,'school_timing','Evening school(1 pm – 5 pm)','3'),(4,'category','Government','1'),(5,'category','Private','2'),(6,'category','Semi Government','3'),(7,'courses','Pre­Nursery','1'),(8,'courses','Kindergarten','2'),(9,'courses','Primary','3'),(10,'courses','Upper primary','4'),(11,'courses','PUC/12th','5'),(12,'courses','Special school for the handicap','6'),(13,'school_size','3000+','1'),(14,'school_size','2000+','2'),(15,'school_size','1000+','3'),(16,'school_size','500+','4'),(17,'school_size','500 and below+','5'),(18,'board','CBSE','1'),(19,'board','ICSE','2'),(20,'board','State board','3'),(21,'medium_of_teaching','English','1'),(22,'medium_of_teaching','Hindi','2'),(23,'medium_of_teaching','Kannada','3'),(24,'medium_of_teaching','Others','4'),(25,'admission_method','Interview','1'),(26,'admission_method','Written test+ interview','2'),(27,'admission_method','Percent criteria','3'),(28,'admission_method','Govt Procedure','4'),(29,'admission_method','School prerogative','5');
/*!40000 ALTER TABLE `tbl_comparison_strings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_like_comments`
--

DROP TABLE IF EXISTS `tbl_like_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_like_comments` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` varchar(256) NOT NULL,
  `comment_text` varchar(256) NOT NULL,
  PRIMARY KEY (`id_like`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_like_comments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_like_comments`
--

LOCK TABLES `tbl_like_comments` WRITE;
/*!40000 ALTER TABLE `tbl_like_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_like_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_likes_blogs`
--

DROP TABLE IF EXISTS `tbl_likes_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_likes_blogs` (
  `id_likes` int(11) NOT NULL AUTO_INCREMENT,
  `id_blog` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_likes`),
  KEY `id_blog` (`id_blog`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_likes_blogs_ibfk_1` FOREIGN KEY (`id_blog`) REFERENCES `tbl_blog_data` (`id_blog_data`),
  CONSTRAINT `tbl_likes_blogs_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_likes_blogs`
--

LOCK TABLES `tbl_likes_blogs` WRITE;
/*!40000 ALTER TABLE `tbl_likes_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_likes_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_likes_reviews`
--

DROP TABLE IF EXISTS `tbl_likes_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_likes_reviews` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `id_review` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  PRIMARY KEY (`id_like`),
  KEY `id_review` (`id_review`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `tbl_likes_reviews_ibfk_1` FOREIGN KEY (`id_review`) REFERENCES `tbl_review_data` (`id_review_data`),
  CONSTRAINT `tbl_likes_reviews_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_likes_reviews`
--

LOCK TABLES `tbl_likes_reviews` WRITE;
/*!40000 ALTER TABLE `tbl_likes_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_likes_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permission_table`
--

DROP TABLE IF EXISTS `tbl_permission_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_permission_table` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `permission_level` varchar(256) NOT NULL,
  PRIMARY KEY (`perm_id`),
  KEY `admin_id` (`admin_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `tbl_permission_table_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tbl_admin` (`admin_id`),
  CONSTRAINT `tbl_permission_table_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `tbl_school_main_table` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permission_table`
--

LOCK TABLES `tbl_permission_table` WRITE;
/*!40000 ALTER TABLE `tbl_permission_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permission_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ratings_table`
--

DROP TABLE IF EXISTS `tbl_ratings_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ratings_table` (
  `id_rating` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `rating_type` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating_points` int(11) NOT NULL,
  `child_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `id_school` (`id_school`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_ratings_table_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `tbl_school_main_table` (`school_id`),
  CONSTRAINT `tbl_ratings_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ratings_table`
--

LOCK TABLES `tbl_ratings_table` WRITE;
/*!40000 ALTER TABLE `tbl_ratings_table` DISABLE KEYS */;
INSERT INTO `tbl_ratings_table` VALUES (1,4,'study',13,0,13),(2,4,'lib',1,0,1),(3,4,'sport',2,0,2),(4,4,'teacher',3,4,3),(5,4,'study',13,2,13),(6,4,'lib',13,2,13),(7,4,'sport',13,2,13),(8,4,'teacher',13,2,13),(9,1,'study',13,0,13),(10,1,'lib',13,3,13),(11,1,'sport',13,2,13),(12,1,'teacher',13,4,13);
/*!40000 ALTER TABLE `tbl_ratings_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review_attachment`
--

DROP TABLE IF EXISTS `tbl_review_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_review_attachment` (
  `id_review_attachment` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_path` varchar(256) NOT NULL,
  `attachment_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id_review_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_attachment`
--

LOCK TABLES `tbl_review_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_review_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_review_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review_data`
--

DROP TABLE IF EXISTS `tbl_review_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_review_data` (
  `id_review_data` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user_data` int(11) NOT NULL,
  `tbl_review_title` varchar(256) NOT NULL,
  `tbl_review_text` varchar(256) NOT NULL,
  `id_review_attachment` int(11) NOT NULL,
  `id_rating_data` varchar(256) NOT NULL,
  PRIMARY KEY (`id_review_data`),
  KEY `id_school` (`id_school`),
  KEY `id_review_attachment` (`id_review_attachment`),
  CONSTRAINT `tbl_review_data_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `tbl_school_main_table` (`school_id`),
  CONSTRAINT `tbl_review_data_ibfk_2` FOREIGN KEY (`id_review_attachment`) REFERENCES `tbl_review_attachment` (`id_review_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_data`
--

LOCK TABLES `tbl_review_data` WRITE;
/*!40000 ALTER TABLE `tbl_review_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_review_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_school_main_table`
--

DROP TABLE IF EXISTS `tbl_school_main_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_school_main_table` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(256) NOT NULL,
  `principal_name` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL,
  `pin` varchar(16) NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `web_link` varchar(256) NOT NULL,
  `session_timmings` varchar(256) NOT NULL,
  `category` varchar(256) NOT NULL,
  `school_type` varchar(256) NOT NULL,
  `courses` varchar(256) NOT NULL,
  `school_size` int(11) NOT NULL,
  `board` varchar(256) NOT NULL,
  `medium_of_teaching` varchar(256) NOT NULL,
  `mobility` varchar(256) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `small_description` varchar(256) NOT NULL,
  `admission_description` varchar(1000) NOT NULL,
  `average_rating_score` int(11) NOT NULL,
  `religous_preference` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_school_main_table`
--

LOCK TABLES `tbl_school_main_table` WRITE;
/*!40000 ALTER TABLE `tbl_school_main_table` DISABLE KEYS */;
INSERT INTO `tbl_school_main_table` VALUES (1,'Kendriya Vidyalaya','Sh S Keshava Murthy (M.A., M.Ed, Phd)','Kendriya Vidyalaya Hebbal, Sadashiva Nagar, Bengaluru, Karnataka, India','Bangalore','India','560080','13.0158945','77.57556260000001','','1','1','','3',3,'1','1','','080 341249','Kendriya Vidyalaya located in Sadhashiv Nagar Post Hebbal Bangalore Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 1965. The school has been operating offi','',0,NULL,NULL),(2,'Kendriya Vidyalaya','Sh S Keshava Murthy (M.A., M.Ed, Phd)','Kendriya Vidyalaya Hebbal, Sadashiva Nagar, Bengaluru, Karnataka, India','Bangalore','India','560080','13.0158945','77.57556260000001','','1','1','','3',3,'1','1','','080 341249','Kendriya Vidyalaya located in Sadhashiv Nagar Post Hebbal Bangalore Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 1965. The school has been operating offi','',0,NULL,NULL),(3,'Sunrise International Residential School','Clementine Panicker (Ma, B.Ed.,)','Sunrise International Residential School, Bengaluru, Karnataka, India','Bangalore','India','560099','12.8442457','77.70199890000004','www.srischool.com','1','2','','5',2,'1','1','','0422 99009','Sunrise International Residential School located in Lakshminarayanapura, Huskur Post, Near Electronic City, Behind Apmc Market, is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional ba','',0,NULL,NULL),(4,'Nehru Smarka Vidyalaya','Y P Jayanthi (M.Sc. B.Ed)','Nehru Samarak Kendry Vidyalaya, 2nd Main Road, Jaya Nagar, Bengaluru, Karnataka, India','Lucknow','India','','12.9270696','77.57787059999998','','1','2','','3',4,'3','1','','080 266493','ehru Smarka Vidyalaya located in 244/c 7th Block Jayanagar Bangalore Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 2003. The school has been operating off','',0,'1',NULL),(5,'Sindhi High School','Mr. Mrs Mahalakshmi Vijaychand (M.A. B.Ed)','Sindhi High School, Bengaluru, Karnataka, India','Bangalore','India','560024','13.0501217','77.59850189999997','www.sindhihighschool.com','1','2','','5',5,'1','1','','080 228216','	Sindhi High School located in Kempapura Hebbal Bangalore Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 1988. The school has been operating officially und','',0,NULL,NULL),(6,'The Deen\'S Academy','Shanthi Menon (B.A.,B.Ed)','The Deens Academy, Bengaluru, Karnataka, India','Lucknow','India','560066','12.9765289','77.74181039999996','www.deenacademy.com','1','2','','2',1,'1','1','','02423 080-','The Deen\'S Academy located in No/ 64/1 & 65/2, E.C.C. Road, White Field, Bangalore - 560 066 is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 2006. The school has been','',0,NULL,NULL),(7,'Vidyanjali Academy For Learning','','Vidyanjali Academy for Learning, Bengaluru, Karnataka, India','Bangalore','India','','13.036657','77.59786899999995','','2','2','','4',4,'2','1','','01655 2403','Vidyanjali Academy For Learning located in Cholanayakanahalli, R. T. Nagar, Bangalore, Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 2007. The school has ','',0,NULL,NULL),(8,'Royale Concorde International School','Mrs.Mary Thomas (M.Sc, B.Ed)','royal conco','Bangalore','India','','13.1033683','77.56633020000004','','1','2','','4',2,'1','1','','080-284614','Royale Concorde International School located in No.38, Attur Layout, Yelahanka New Town, is a Co-Educational Secondary School institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 2011. The school has been ope','',0,'2',NULL),(9,'Royale Concorde International School','Mrs.Mary Thomas (M.Sc, B.Ed)','royal conco','Bangalore','India','','13.1033683','77.56633020000004','','1','2','','4',2,'1','1','','080-284614','Royale Concorde International School located in No.38, Attur Layout, Yelahanka New Town, is a Co-Educational Secondary School institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 2011. The school has been ope','',0,'2',NULL),(10,'Air Force School','M K Lakshmi (B.A. , B.Ed)','air force school','Bangalore','India','560006','13.0150142','77.57898399999999','','1','1','','4',3,'1','1','','080 309439','Air Force School located in Post J C Nagar Hebbal Bangalore Karnataka is a Co-Educational Senior Secondary institution affiliated to the Central Board of Secondary Education (CBSE) on Provisional basis since 1959. The school has been operating officially u','',0,'1',NULL),(11,'Christ Church College','Sir Rogers','Christ Church College, Lucknow, Uttar Pradesh, India','Lucknow','India','226001','26.84861889999999','80.94358749999992','','2','2','','5',2,'2','1','','7855455875','','',0,'5',NULL),(12,'Sindhi College Bangalore ','Sir Rustam Sindhi','Sindhi College, Bengaluru, Karnataka, India','Bangalore','India','560024','13.0501273','77.59847509999997','','2','2','','4',2,'1','1','','782982992','','',0,'3',NULL);
/*!40000 ALTER TABLE `tbl_school_main_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student_table`
--

DROP TABLE IF EXISTS `tbl_student_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_student_table` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `current_std` int(11) NOT NULL,
  `period_start` int(11) NOT NULL,
  `period_end` int(11) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student_table`
--

LOCK TABLES `tbl_student_table` WRITE;
/*!40000 ALTER TABLE `tbl_student_table` DISABLE KEYS */;
INSERT INTO `tbl_student_table` VALUES (13,12,12,0);
/*!40000 ALTER TABLE `tbl_student_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `city` varchar(256) NOT NULL,
  `role` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(256) NOT NULL,
  `pic` varchar(256) NOT NULL,
  `isProfileUpdated` int(11) DEFAULT NULL,
  `isParent` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,'abhijit','71201','banglore','student','gta4roy@gmail.com','','','',NULL,NULL,NULL),(2,'admin','2f760ec7f5de7c4ccce99c26880bc1c0','banglore','student','admin@gmail.com','','','',NULL,NULL,NULL),(3,'abhijitjkk','9f34f66b65b94cf83d0b3c282da85f84','','','abhijitr@gmail.com','','','',NULL,NULL,NULL),(4,'Sujoy','decdd040d9b69a1b2f9366e13f9ee7e4','','','raos.gaurav91@gmail.com','','','',NULL,NULL,NULL),(5,'test','098f6bcd4621d373cade4e832627b4f6','','','test@gmail.com','','','',NULL,NULL,NULL),(6,'mavin','d10906c3dac1172d4f60bd41f224ae75','','','mavin@gmail.com','','','',NULL,NULL,NULL),(7,'mavin1','768c39bef08f5572d94e6ac594ff6798','','','mavin1@gmail.com','','','',NULL,NULL,NULL),(8,'mavin2','eb6110a34833fe26480c10e473061fd8','','','mavin3@gmail.com','','','',NULL,NULL,NULL),(9,'mavin4','503561e7a98cecc3d05586551febea51','','','mavin4@gmail.com','','','',NULL,NULL,NULL),(10,'mavin5','1342d7b99990333e208942dbaea8b945','','','mavin5@gmail.com','','','',NULL,NULL,NULL),(11,'mavin6','1c9d96cfccc91e46e8c678eafce6ac5f','','','mavin6@gmail.com','','','',NULL,NULL,NULL),(12,'mavin7','768c39bef08f5572d94e6ac594ff6798','','','mavin7@gmail.com','','','',0,NULL,NULL),(13,'mavin10','bbcd3908154b270b2a064870880d9090','mavin10@gmail..com','account','mavin10@gmail..com','34343434','Sameer singh road','prof_pic/mavin10.png',1,'false','India'),(14,'mavin11','d7fe8eb07bde5682ea9e3ef93cab19a3','','','mavin11','','','',0,NULL,NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `path_of_media` varchar(256) NOT NULL,
  PRIMARY KEY (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-01 22:39:23
