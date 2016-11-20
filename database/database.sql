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
  KEY `id_school` (`id_school`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_child_table`
--

LOCK TABLES `tbl_child_table` WRITE;
/*!40000 ALTER TABLE `tbl_child_table` DISABLE KEYS */;
INSERT INTO `tbl_child_table` VALUES (1,20,'Suresh',12),(2,20,'saurav',12),(3,20,'djfhksjdhkfhjds',12),(4,20,'djfhksjdhkfhjds',45),(5,20,'djfhksjdhkfhjds',45),(6,20,'djfhksjdhkfhjds',45),(7,20,'djfhksjdhkfhjds',45),(8,20,'djfhksjdhkfhjds',45);
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
  KEY `user_id` (`user_id`)
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
-- Table structure for table `tbl_dislike_table`
--

DROP TABLE IF EXISTS `tbl_dislike_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dislike_table` (
  `idtbl_dislike_table` int(11) NOT NULL AUTO_INCREMENT,
  `id_review` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dislike_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtbl_dislike_table`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dislike_table`
--

LOCK TABLES `tbl_dislike_table` WRITE;
/*!40000 ALTER TABLE `tbl_dislike_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_dislike_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fees_action`
--

DROP TABLE IF EXISTS `tbl_fees_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fees_action` (
  `idtbl_fees_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_fees_data` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `action` char(1) DEFAULT NULL,
  PRIMARY KEY (`idtbl_fees_action`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fees_action`
--

LOCK TABLES `tbl_fees_action` WRITE;
/*!40000 ALTER TABLE `tbl_fees_action` DISABLE KEYS */;
INSERT INTO `tbl_fees_action` VALUES (1,3,23,'L'),(2,2,23,'D'),(3,1,23,'L');
/*!40000 ALTER TABLE `tbl_fees_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fees_attachment`
--

DROP TABLE IF EXISTS `tbl_fees_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fees_attachment` (
  `id_fees_attachment` int(11) NOT NULL AUTO_INCREMENT,
  `attach_path` varchar(256) NOT NULL,
  `attach_type` varchar(4) NOT NULL,
  `attach_data` blob,
  `id_fees` int(11) NOT NULL,
  PRIMARY KEY (`id_fees_attachment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fees_attachment`
--

LOCK TABLES `tbl_fees_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_fees_attachment` DISABLE KEYS */;
INSERT INTO `tbl_fees_attachment` VALUES (1,'file_upload/file_1.pdf','.pdf',NULL,1),(2,'file_upload/file_3.pdf','.pdf',NULL,3),(3,'file_upload/file_4.pdf','.pdf',NULL,4);
/*!40000 ALTER TABLE `tbl_fees_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fees_data`
--

DROP TABLE IF EXISTS `tbl_fees_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_fees_data` (
  `id_fees_data` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `standard` int(11) DEFAULT NULL,
  `fees_txt` varchar(5000) DEFAULT NULL,
  `review_date` varchar(12) DEFAULT NULL,
  `hasFile` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_fees_data`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fees_data`
--

LOCK TABLES `tbl_fees_data` WRITE;
/*!40000 ALTER TABLE `tbl_fees_data` DISABLE KEYS */;
INSERT INTO `tbl_fees_data` VALUES (1,23,2,5,'fees ','2016-11-20',NULL),(2,23,2,7,'dafsdsa','2016-11-20',NULL),(3,23,2,0,'rkjkerkjrhr','2016-11-20',NULL),(4,23,2,0,'SAWDASAS','2016-11-20',NULL);
/*!40000 ALTER TABLE `tbl_fees_data` ENABLE KEYS */;
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
  `like_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id_like`),
  KEY `id_review` (`id_review`),
  KEY `id_users` (`id_users`)
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
  KEY `school_id` (`school_id`)
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
  `rating_desc` varchar(5000) DEFAULT NULL,
  `rating_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `id_school` (`id_school`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ratings_table`
--

LOCK TABLES `tbl_ratings_table` WRITE;
/*!40000 ALTER TABLE `tbl_ratings_table` DISABLE KEYS */;
INSERT INTO `tbl_ratings_table` VALUES (1,2,'study',23,4,23,'in studies school is one of the best \n        ','2016-11-20'),(2,2,'lib',23,5,23,'weew      \n        ','2016-11-20'),(3,2,'sport',23,1,23,'great in  school labs  \n        ','2016-11-20'),(4,2,'lab',23,5,23,'excellent labs     \n        ','2016-11-20'),(5,2,'teacher',23,4,23,'  eeee      ','2016-11-20'),(6,2,'study',23,5,23,'        \n        ','2016-11-20'),(7,2,'lib',23,5,23,'        \n        ','2016-11-20'),(8,2,'sport',23,4,23,'        \n        ','2016-11-20'),(9,2,'lab',23,4,23,'        \n        ','2016-11-20'),(10,2,'teacher',23,4,23,'        ','2016-11-20'),(11,2,'study',23,4,23,'        \n        ','2016-11-20'),(12,2,'lib',23,1,23,'        SDSDSD\n        ','2016-11-20'),(13,2,'sport',23,4,23,'SDSD        \n        ','2016-11-20'),(14,2,'lab',23,4,23,'        \n        SD','2016-11-20'),(15,2,'teacher',23,3,23,'        SSDS','2016-11-20');
/*!40000 ALTER TABLE `tbl_ratings_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review_action`
--

DROP TABLE IF EXISTS `tbl_review_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_review_action` (
  `idtbl_review_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_review_data` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `action` char(1) NOT NULL,
  PRIMARY KEY (`idtbl_review_action`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_action`
--

LOCK TABLES `tbl_review_action` WRITE;
/*!40000 ALTER TABLE `tbl_review_action` DISABLE KEYS */;
INSERT INTO `tbl_review_action` VALUES (1,1,22,'D'),(2,2,22,'D'),(3,3,22,'L'),(4,3,23,'L'),(5,4,22,'N'),(6,7,23,'L'),(7,1,23,'D'),(8,2,23,'D'),(9,4,23,'L'),(10,8,23,'L');
/*!40000 ALTER TABLE `tbl_review_action` ENABLE KEYS */;
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
  `attachment_data` blob,
  `id_review` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_review_attachment`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_attachment`
--

LOCK TABLES `tbl_review_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_review_attachment` DISABLE KEYS */;
INSERT INTO `tbl_review_attachment` VALUES (1,'attach_pic/pic_1_1.jpg','jpg',NULL,1),(2,'attach_pic/pic_2_1.jpg','jpg',NULL,2),(3,'attach_pic/pic_2_2.jpg','jpg',NULL,2),(4,'attach_pic/pic_2_3.jpg','jpg',NULL,2),(5,'attach_pic/pic_3_1.jpg','jpg',NULL,3),(6,'attach_pic/pic_4_1.jpg','jpg',NULL,4),(7,'attach_pic/pic_7_1.jpg','jpg',NULL,7);
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
  `id_rating_data` varchar(256) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`id_review_data`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review_data`
--

LOCK TABLES `tbl_review_data` WRITE;
/*!40000 ALTER TABLE `tbl_review_data` DISABLE KEYS */;
INSERT INTO `tbl_review_data` VALUES (1,2,22,'image test ','',NULL,'2016-11-19'),(2,2,22,'image test 2','',NULL,'2016-11-19'),(3,2,22,'image test','',NULL,'2016-11-19'),(4,2,22,'testing images ','testing images ',NULL,'2016-11-20'),(5,2,23,'Brief Introduction','great school to study',NULL,NULL),(6,2,23,'Admission Introduction','good admission process',NULL,NULL),(7,2,23,'tester1 review1','review1',NULL,'2016-11-20'),(8,2,23,'jhjhkjh','',NULL,'2016-11-20');
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
  `contact` varchar(15) NOT NULL,
  `small_description` varchar(3000) NOT NULL,
  `admission_description` varchar(1000) NOT NULL,
  `average_rating_score` int(11) NOT NULL,
  `religous_preference` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `profile_pic_data` blob,
  `admission_method` varchar(45) NOT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `latitude_UNIQUE` (`latitude`),
  UNIQUE KEY `longitude_UNIQUE` (`longitude`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_school_main_table`
--

LOCK TABLES `tbl_school_main_table` WRITE;
/*!40000 ALTER TABLE `tbl_school_main_table` DISABLE KEYS */;
INSERT INTO `tbl_school_main_table` VALUES (1,'Vidyaniketan School','Ms.Lalitha Desikan','# 30, Kempapura, Hebbal, Bangalore - 560 024','Bangalore','India','560 024','13.0475813','77.59676820000004','http://www.vidyaniketanhebbal.org/','1','2','','5',2,'2','1','yes','080-23331531','Vidya Niketan School features 45 spacious, well- ventilated classrooms designed to make learning a pleasure. All classrooms are equipped with an Interactive White Board and Activinspire which plays a dynamic role in classroom learning and caters to the Mul','Vidya Niketan School follows the ICSE Syllabus till Std X and the ISCsyllabus for Std XI and XII.\n\nThe school is divided into 3 Sections \nPrimary school - Std I to IV Middle School - Std V to VII High School - Std VIII to X The ISC section has two streams - Science and Commerce',0,'1',' vidyaniketan@gmail.com','ZGF0YTppbWFnZS9naWY7YmFzZTY0LFIwbEdPRGxod3dDUUFQY0FBQUFBQVAvLy8vN3g2MzRCQUlVQUE0TUFBbzBCQW9jQkE0QUJBbjRCQW4wQkE0b0NCWUlDQTRRREJIa0RCSWNFQjNvSUNYVU5EM2d3TVpoYVczNU1UWVlBQm9JQkJYOENCWUlFQ1lBSURYQUhDblVJREcwUEVua1dHWHdjSDRJa0tIY2lKSUV6TlpOR1NKaE5VSkVCQ0ljRERIMEVDbjhNRTNnTkU0QVJHSWRjWU4vTTAvRGs2Zjc2L3YvOC8vejIvOVBJM052UjV2MzgvL3Y2L2NyQjRrc3p1R2hjc1dCVHhyaXk0cXVtNDFOTDJGcFJ6Z2tCN3g0WTFTZ2c0VFV2emtVLzNGTkw3MDVKM1ZOTzREMDRvR2xsNUd4b3pBVUEvd0lBOEFRQThBUUE3UU1BNndNQi9BTUIrd1VCK2djQitRTUIrUVVDOWdVRDhnWUQ2Z2dFN2djRTRRY0UyUXNJNmdzSTVnc0h6QXdKNWhVUzV4UVIzUjBhNXlrbjBpa214elF3NmpJdjJFSS8rVGcyMVU5SytVOUs5MDVNK0V4STVtWmk4RnhZMkd0bzFKR1EzZ0FEL2dBQS9BQUErZ0FBK1FBQTh3QUE4UUFBN2dBQTZ3RUE2QUFBNUFFQTNBRUIvd0lCL2dFQy9BRUQrd0VEK1FFRDlnSUI5Z0lDL3dJQy9RSUMrZ0lDK0FJRDh3TUM4Z01EOHdNRDhBUUU5UVVFNVFnSjZRb0o0d29MNEJzYThDTWkzQ0lqMFNrcDJpMHMwanM4eTBORXhsdGN3SGw1endBSS93QUYvZ0FFK2dBRzZnRUY4QUVHN1NZczFDY3EyQzB5MVVoTjBVeFB1RmRiemx0ZDFFZE4wRWhPemxOWXhscGh6bHBoekZsaHpGcGl5bDVuemw1bnhGWmp6RlpqeE9QbjkrbnUvTi9qNy9IMC9QZjkvZnIrL3Z6Ly8ranU2dnovL1BEMjcvcisrZnIrOWY3LytQMys4djcvNVA3KzdmNys5Zi8vKy9iMjgvLy8vZjM3K1AzdzZ2Zm80dkRmMmZ6dTZmbnM1L1BqM3RDN3RkM0l3K3JYMHViVHp1UFB5OWErdXMyd3JNNjFzZGl5cnNLaW5ydVlsY2VwcG5RSEFZOVpWckdOaTMwRUFYb0ZBWUVGQW40SEFua0xCb3BIUkl0S1NLK0RnZEtwcUljQUFJUUFBSUlBQUlFQUFJQUNBSDhDQUg4QkFIMENBSDBCQUhvQ0FJWUJBWVFEQVlJQ0FYVURBWDREQW53REFvWUZBNEVEQTRFRkJYd0ZCWGdHQm5JVkZJMDhQSUUvUDQxUVQ0Wk5UWmRrWTUxcmE2VjFkUDc4L1AvKy92ejgvUC8vL3lINUJBRUFBUDhBTEFBQUFBRERBSkFBQUFqL0FBVUlIRWl3b01HRENCTXFYTWl3b2NPSEVDTktuRWl4b3NXTEdETnEzTWl4bzhlUElFT0tIRW15cE1tVEtGTWVOTmFNR2JSbXpwd1pVMG16cGsyRnhLSlJBN0dCSFRzTUpqWjhtQUR0cHRHaktKdHh5MURpQVR4eTJOYkJrNmV0QVFSOHpwQnEzYnBSV0RjTkZnaGd5M2J0R2pwejdkQlpVeWR1SG9kcXdyaktuZnZRR0Q0VGFxZE51NWF1Z045d0JRaFl1L1p0d1FacU0ra3FYa3h3Mzd3RjZNcGhzMFl1M2JsejZES2JZOEJnbkxwMzgvWXhIazIzV29ZR0Njb1JPSURBblR0eDRzcWRHekNBZ0FWM2xOUFJpMGE2TjFKaEhneVljekRnTXUzanlJM1RMcWRPd2pEZjBHdDJnekR1R2dMazJMTXZ4N2FCZC9UdkpwRjkvNmhRVnB6Mjg3VEpqU1B3SVJuNDl3YUZ4YzNZcmNTQnpPUFFvMCt3SUlOM2pQUEJwOUl5RkRTVEVUY0xqS01BQXRmb2Q1NDcyTUFqMmtYTDRQT2ZnQ25wdzBFK3oxV1VEQWpxc0hOQkFRMDZpRjA1MXJBenpnY2RUbFFNTkI5b3dBeUdOQzJUUWp3aFZKT1lSTXVnVUIwQkE0Umpvam5tekZhT09BVTRJTTRKN2trVXpETFVaTk5PUGpUVzVKZ0JKa2dnelVUS25BRE9OUVNjWTU2RGx4bXBtanZocE5Ba1JNaHM0MEVFQnJDRFRKVTBNUk1CQ2ZFRWRjK01FQzNqcFRrRW1GT09pZGlkUTBBNzRLZ0prVERSY0lCQkF4Z1lFQUl4ZEtwVXpEYnpUTk9BQWRqUXM4K2FEUFdvRHFEdXpFWW9jZzIwa3lhb0NyRVV3Z1VHVlA4SHp3WkZWYXBTTXhvY1FNQTQ1cFQxUVRjdEtyUk1CT1NBZVkycCtoMDU2RG1BV2pOQUI2d2k1TXcyRzBBUVR6anJwSU9OUFFIYWVsSXg5WkJ3d1RVWHpDTU9hQ0ZBUXlsT0U3QmpMTExvd2Jic1ptYUpVTXhDeStTakFRWVB4RU9aQlF1ODA0MjNOTlVYanp3RnVETkFPZVMwTTA4K2N5cWtUempXWEdBQnZPZ05Pb0I2MXpCUWdqNnRkaE1CQXdTNFE0NWY2TGh6Z1FmUkVrelNNQ0JnMEk2enh4MHBUd2NRSnlRTkJPbGNnRUIrcDlJMmpqWGNaWFVRb3hKc0FNNDNtQTFnQVFLQ21qQ3d5eXBWWTk4MUdtOU1Ualo1Z3FEajBkUlVvQUE2M3dSTjJ6bmd5Sk5QdHdJVmcwd0lKdkI3QURnSklDQ09BZ09JOHcwS3lsRC9QZUFKQzlDY1hzTUlUS1ZCUGNjY3hBd0tFUEJsTm0wSG9CQXhRY05RYzZjQkI4UW1UampnSUVEY091T01jSy9mS0JFemdRSkNJc2NBQ1JYMGFzNDZFVkJqOUVEQnFMQ0JQRm1mdWc0RUlCTkV6RDdqTFVBT2tkWllzdzRCNEF3M0Rqd2M4RWs2U3NqUXcvVEN0TFVqenpqZ0ZHQ0JDUTlnZ01JK2ZRODBUQWdOT0ZCTzdnNm1VOCtPT1ZIN2dBSHJETlpPQWhjd2dFQTU2RGhRd0FYM1BLOVNNTlM0UURqS3dZNXdmTU1jZStFY0F5NkFEWFU4d0FRZzZNYm9CUENNRHJEREFaazVod1VzY0w1QjlTb0I3YkNPQWpyd2pJRWN3eDZBYThCWXlMR09jaURnaFFNd1J3SWN3QTRDbU9CQy9qTkpORFR3RFhGTVF4M0NXWlp4LzJCakhnZk1JMTN6YVVZOUh0QUFhNWdESHRjUkJ6akFNY0IydkdNQkpyQkg0Z1Nnakh4NG9CM2p3Rmh5QnNBQWQ2Q2pBaUhZVVE1Tklnd0pwT01iMTFqSEFZaHpJdGdnNEFJbWlNYzhKTUNuWVl5Z0ErLzdSbld1UVE1d3JHTWQ2amhBQ3ZReEUyTlVJd1Fsd05NMGpsT21NU2F2QVNXb3hocFZBZzE1SkFnQkZwaEhkb2lJQUFZd3NRRVBXR1RFbUlIQ0M3U2pBckFVR3p0UWdJK0lkU01FOHBESEJkVHhqWFRvWnpiZ0dFY0ZQQkNzVFpha0dDQ29BRHpXa2FUc2RIQWNCdHdnT0FhZ0FSQkVZejdNaU1ZRXRybE5mVHlEVDlMWXh6U3lrUTd6c0hCTTZEbkhPTjVoZ3Q0Wjh5VEIySWNKMnJFT2NLQmpsREUweHdEQTBmK1hBYUNqSFExUXdBZWlzUzZFTEdNZkVSQkhFMS9uRnpPYXlCb0g4TUF5M3BrU1pYamdBTmNZQjlDUTQwRjBpS2w0NGVobk84Z3hqM3NZeUNERzBBY0lHSmlOQnh6QWhRbEl3QUN1bzUxS1d1TUJJcUNvU3ZaQkFyMU04M0VMK3dZRE5MQVA1d2tER3ZVUXh6ZzZlQ29QRXNrYzJJQkFyWFI2RW1lZ1lBRVpCYW81UEZxT29IUmdIOGd3eGo0NHdBNk5sVW1NMlRIVGtSakFMYXFXRGg4azZBeFFNWE1XQkZTQUJCcW9ScHNXZ0kxS0JxMUlzQUhNQmFicVZwTjB5UUpBWFpnNHRvb092V1dBR2NvUWdRSEljYy9IQVhZZDhZZ0hDRnBXV0pGSTRBRWxNdHM0WXVPYWpENVdHZHo0eHRpMGFnNXhJRUFlb2Vsc1NwcUJqbVAvTFF4OTZDSFNDNThtanNjdWd4dmp1SUJNTFp1M2RqakFBMnlUN1VpTUlRRURUS01kcXdrSGtSNG5EbTBjNDdlYnc2MSt5S0VlZVFqbUF1NVVya21xOFRNR0JJWlhRSzN1ZGJtUlhiTnhseHp1QUZnRW5DZmVra1RQQUoxRFFFelRhMTNzRHRDOXd4dUFBa2d3Z2ZxbUpCOEhnQWM4NWpkY3M2blh2OXAxa0R0UWRBTDZHcGdreU9pQUF5NEFEbkUwT0dnUFp1OS9INGNtYTRRZ3VSY1dpVDQwZ0lCdjJCT3QrZ2x4ZXgvbkFIQ1FBNGNwSGdrME5xQ09kU3hnSFRDT1YzOUZIR0gwa0lNZEMwaGpqcjlWajZGQmtiL3JuZkdweU9FdkRFeHR5U2FCeGp3S01BMUJVWGZJVWo0Vk5pSTZVU3liSkJrZHdDbzhObm9xR1k4NC8yamorSmlaVWJLUEM3eWpBVVUrajV2elhLaHpyQU1GRnA2elNENWtBQWJvMDhGZ2Z2TXZOL1k2ZkV4UTBDVEp4d0t5b2JEUnlzdEJleWFUTzVLM0dYbHNDZEltYVVZR0pvTzlLUVlUMDRubWMvNis4YzhIMUFQRm9QNElNZTR4Tjg1UnNUaW9qcktpejVNYWN4eEFhckUraWFqVFlXcGVIVnJJdXVhekM5RXhEZ09Bb0pqQkRra2JHY0M1QWxEMjJIcE9kVHI5YkFHeVhVQ1QwUjZ2UE5SVEFBUW9COWtRM25ad0IyQUFlbkEyM0I0eHhnZkkzZUVnMHliVDU3a01PZVN4am0rRUY5NGp5UWNHR0dBTkF4UWdNakhXZHI0WHh0MEl2QnZnSFZFR0J5eVEwYTNtT3QwTEowY0Q0RkZnaUp1RUdoZ2c0SkV1VHVSMGJ1elhoUC8xdUVpT2tZRURtR09LOXNZM2VzWmhnUk9yL0pqMklFRTYxaEdPbUN0ODVsSzllWll0a0E3YkpqelpEbEtIQjlRbzlKQVFZd1R1NEl0c2lMUlU3TWg4WTlKMVFEcU9qQUY5QktQcEpla0dPOVJSQUhFd2k1N292UGZQTnlhYkVSV3JBMlVHKzNJL2NJQjJ5R1pqVlVmTzFZZEdqZ3BZSXgzeG1KRGNTZEtOY2VVT1kxY25oL0hJa3c0VW5IVHdJMUVHUFpnTnV2d2dmdTNxRWNjRkdzQ0FlendhOGlBcEJqWEVnYWdDckNPR1ZsLzdBTFkrRFFOYzROT2dIOG5pc0RHTmRBUUtmVmZmNXpxdXNRQVd4YjRrRTRoSDdTdVFBRGJuVGZWNU93Yzd2UEg3a3V6WUFEMUxBTGFQajNUc1RPTUN2bS8rY2tOQUFuVTRBQUdWUFU3LzdzdHhEUXhRU2Zza3Nkb2N4Wmg0ZGNCanZ1Z25pVEZBY0lBRW9DbjExYWNOUE1qKzcvaC9KQmo1VUFIdE1BMWxvM2VKSmpURllRN2o0QUJ4NTM4aFlTTU9RSUQ0NTErQzBtRzFGUThTd0hRTytCSDZnQUUwWllDNlpqZXhnVDN6Z0dNYjZCSE9rQUZ4TW9FaVZtN25VQTc4VkErZmQ0SWVJUXdpc0FEc3dJS2JVd0Q0d3huemNHVTBHQkxTc0FIRzUyYmljQllIY0FFZ0VENUJHQkxGOEFFTEFDOTdkZzNtOEEwWElIaE5HQkxSNEFEdFFDUUtZREpEeGptQ2dRN3ZBSGRaT0JMQ1FBOWxOd0FPc0dsaENBNGxBdzRMY0E4RmRZWWcwUTBGQUE3bDRBQU84QTF2aUQ4R2dBR3pZNGNnZ1F3UjBBRGd3SWQrR0dYSk13QUwveUFDZFVpSUhoRU1Fd0FCMzZDSWlXWU5EY0FPSmlpSkhHRW53c0VPNEpCbzZPQnMwT2FKSEVFTTNFQUMxekFOQkFBQjY3VnNGZ0NFcVBnUjBZQUI1REFOQlFDTHk3QU5OTWNBOURBNXRmZ1JiV1FBMWhBTy9iVU5jUGdBSFRlTUlRRU5KZEJqL1NVQ2NKZ0N3dWlNTlpoTUQ3WU44SUFPdElpTkhSRU0rbEFDRERCazE4QU9qd2VPSDVFTUtYQUF5WWdPSXZCMTZoZ1MrTENJdmRnQXNEZVBIOUVNOHpBUHg2QU05a0FQcDZpUEduRXA4c0FNdzNBUFhrZVFRZ2gzeUtBUEQ4ZVFGeUVNSWNBTTFkQi9FcmtSd2RBTjJaU1BHZGtSRDlrTnNQYVJHYUVDSzBDU0F3RURrckFETE5tU0x2bVNPckFETmpDVE5Ha0RONUFHT1A5WkF6ZkFralZKa3p2NWtrQVpsS0l3Q1RNSWVUaGdCWVVRQllTd2xFelpsSVF3Q0lRd0J6MUFBNnpnQ2xacGxaTlFCNERRQjAvQUEwNHdCMnR3bFZiSkNta3dDSVhBbEliZ2xHb0psVkZnQlRDQWZrZVpDWUxBQm5SWmwzWkpsNWJ3QmwzUUNnSEFDN3dRQUFHZ0M2M2dDSEJ3QkpVQUNFY2dCemlBQzREWkM3MFFBRVhnQm5jNW1aUEpCM3FBQlcrcGZUaFFDR3h3QjNqd21hQVptcCtwQjNySkNyM1FBaTZBQzdrQURMK1FBM2J3QkpTQW1IR1FBN3pBRHkyUUM3Y0FtVy9nQjZMWm02TEpCMnhBQlpuWmZEU1FCVWlBQkVxUW5NcVpCTXpabkVnd0IxMWdtcjlBQzQ3WkFydkFEenBRQjFXUUJFdEFCem5RQy83UUMvei80SmRGUUFkTDBKeEpvSnpxdVo1MG9BUlpFQU5nRndNME1KLzBPWjg0TUFtb29BcWxzSi84U1FyKytaK21zQXBHTUF1N0lBT3lnQXUvNEFLNXdBc3hrQXFma0FxcklBazBrQXNCY0pxOGNBdHJNQXFud0o4YnlwOGUrcUduTUFuMU9hSXNFRzVwWUFWVlVBVldnS0lxYWdWY29BaGFrQWd5T3FNMEtxT0tZQVdNNEFxNDRBS3k0Smd1WUoyN01BbDJvQWlLa0FYZlNRczdtZ3U0VUFSV29BZ3o2cVExR3FWWWdBVTNpcUpXa0FWWlVBVllhZ1RoTmdSU2NBU2ZlUWQ2WUFsM2tBZURBQVZId0FScXVxWnNxcVozY0FlTHdBb0J3QSt5a0pxODRBTDhzQXV1NEFONGtBbDFrQU9OMlErODBBdG9FQWRSMEFTSUNnVnR1cWhNLy9DWmZkQ29mSkFKZVpBSFpRb0ZhaEJ1T2xBRmd4QUZoVEFJZ1ZDWGZCQUl2dG1iZVFBSDBTbWVkZG9MdTRBTExUQUR1TEFHY3NBSGN3Q29GZG9QdUVDb2ZkQUVvenFxZWNBSGdnQUliR0FKbUdBSnhLb0hSOENsMFRZRWhJQUhkMENYZUFBRmZRQUl6VXFwYjFxdGszcXRlY0FHYmhDbnY5QUN0SENudUxDandMQUx2akFHYmVDZHYxQ3JqSWtHYjBDdDFmcXU4QXF2Z01BSGdJQUhlcUFIZk9BRXh4cHVRaUFIYmRBR2IrQUdiaEFIY3dBSGJ2QUdjUEFHQ3J1d0FTdXdEZ3NIVzJDYXdMQ2dMWENoc2JBTEx4QUFPSEFJZnhvQXY5QUxMc0FMdUlBR0NmdXZBTXV3S011d2J0QUdjRkN3L3hxd2JTQUhheUJveEZBTU52OXJzeG5hQ1owZ0NqcmJzNkVRQ3Azd3MwSUx0RDNyczZCQW9QNEFDM1hLQzdZQUMrTzZDN2t3Q1pGQUEzOEpzcmZ3cXBFZ0NrQWJDbG83dEY3cnRVVzdzMERyQ1RoUXN6Y2JpYkxGQXBId0JZL1F0bDRBQ1p6Z0NJNmdDWnRRdDNaN3QzaUx0NXJ3QlpBd0MzY2FDM1hhQXJGd0MveVFDd3ZLQ2tTQUE3M2dxZ3FLQzVQUUNIUmJ0NUdidDVTcnQ1cmdDSThBQ1YvQXRudjdDZklvWGl5d0JWSFFySDl3QkgzUUJ3Q2JzQTY3dXF6YnVpdmJCbkVhQUlJckM3endDcTJ3QzhBUUN5M1FBcmN3Q1dzUUFOUVpzb1FhQnduN0JxZnJ1c2pyc1A4S0J3YmJCRkRBQm1ycUIzcmdDR2hiV0N6UUExUFFCNElnQ0lPUXEzalFCSUgvQUFpSU9yN2tXNzdsQ3dpbWFwcjhFQXNCc0F1c01BbXYwQUsyTUo2NndBb3hFQUQrQUF5MlNxaHdBQWorNjcvbUc4RGwyNmhRb0tpZnlRZE40QVNBd0FRL1VMMXV4UUpkMEFlVENnaFFJS3AzOEFmU0dxOGFUS3JiS3JHMGtLZXQ4QVdBNnJUQUFBeTNBQXd5OEsyL2NLdG8wQWJWR3FZYUhNTnZ5Z1o1Z0FkZ09xbVd3QVFLZkFSaDRNQlVGYm91WEsxdjRNSnQ0QVl5Zk1SdkNyc1Nhd3UzMlFvKzBBaXNZQXVyK1FLN1VLQ3V5ZzhzYk1UVkdzUklESzlGbk1RS3U3eHZjQWRoOExuaTlRbVBJTGViSUxkczNNWnUvTVp3ekFoQU1BdXJPYis2VUF0Q0lNSzQ0QXY4d0ErOTBLTWZLd05YKzdodHZNWndmTWlJUExkci8rd0Z5T3BXTVdBRWFoREprV3dFUE11MVgzdkptT3kxb2hBSnBVREhMaEFMcWxvTGFoQUpudUFLdkpBTC9kQUwxQm5JVjdzR1didXpvdEMxbVR6TFFxdXpzYnl6UnBETGtHd0VrMUNpbTRRRFZTQUYya3NJVVVBSHhFdXd4TXU4eXJ6TXpOek16Q3dIRWRzUDNzb1BMdkFLbTBBSGRwQUdVcHpLdFBBTHJFeW9kQ0FIY1JBSGNpQUh6bnpPNk15OGNsQ3dMVnNJVWlBRmhvQUpWVUFEeGdUTVVnQUlleEFJVHZDb3o1cXJBdnpQLzF5YUlJdWtBZkFLbkFBSGQ1QUZpdHZIdEJBQXFieS9KQnNJQlJ3SWdRRFFGazIrZUxDVitub0Vlb0FIalhvSG1GblBoK0NwZk1BSHVmcW1NTnpGOFVxcWJ4Q240aGtMTWxEUVlRQUhlLzhnQjJQd0NybmdBdUZwcTc5Z0M3L1F3dS9LckNxTnhKMTVCR0RLQm51Z3cwM0FCQ0g5eTBnUTFIendwcE02MUVNZHA3Z0FETithQzY4QUJuZkFCSGRRQjJ1d0N6TUFESXlKb04wTTFGUTkxR1FLcG51d0I1YkFCb0hBQjM3QUE4T1pROFdwQlZlZ0JWaHdCVlBhMTM3OTE0RDkxMWN3MklTTkNJZmdBNnlnbWxMY0M2OHdCbFdnQllxQUNGL2dDcmNRbmk3UUN6TGdEMHQ2Q0lROTJJSDkyYUFkMkZjZ280aHdCVm5neTFSREF6bXcycXc5Q2FkQUNxZncyaDg2MjdSZDJ4K3FDcDh3b0xxUUMvNlFwNzR3Q1o5QUNxcGdDcU9RQTFJY3JyeDlDN21Rb2FSZ0NzN2RvYllkM1IvcTNLYXduOEs5Q3FwQUNwT0FBNnk5MnZUL1hDazZZQVdIY0FoVk1ONTJRQWR6VUFkMVFBZnMzZDd1L2Q3d0hkL3ZiUWM5d0FxbmJKdmtHZ2JxM1oxMWtBVTBzTnU0c0F1MmNMVkZzTjd5ZmVBSUx0OXpRQWZydlFSMllBZmpIZUZuWUN0Q1FBVmUvUWNlM1FkZ1N0R00ydUVlenFoTmNBZDl3QWg4eVpoOTZROWNqUWVENEFlV0FBZEF3QStOQ1pnQkVORkw3YndmZnVNZjN0VjlnS1pHRGE5a1lDdVpPZ2krbXBSZTNkVzdldVJJRHBwN0FMRnIwT1JPdmdaZDRBWjdFTldoV2dXKysrUnJBQVp0a09SY2p1U2VhZFRNQ2doUXlaUkJZQ3RuUUFnem5BZno2cGw4NEs1cHJjSFlXc09DZ0FtRzhPRHFYUWR6WUFlQ3dBZUdZQW1Yd0FSUDRBVFlyTjV4VUFkMjhBWjdla0N0ZU9EbWIzN0VpVzdVODZvSFBtNHJRTUFEZEluQi92dVo5ZXFaWGQ3cGVPQUhudG1vbjFuRFI3M29nc0FFVFpEQjFjb0dla0RER083cHNMN29vTmtFZXNEb1ltQXJheEFFWmtBR1pWQUdaUERyd0I3c3dqN3N4RjdzeHM3cnZkN3J4Nzdzek43c3p2N3JNNHVTMGo3dDFGN3Qxbjd0MEJFUUFEcz0=','2'),(2,'Sindhi High School','MAITHREYI SATYADEV','# 33/2A & B Hebbal Kempapura, Bengaluru, Karnataka 560024','Bangalore','India',' 560024','13.050091','77.59863799999994','http://sindhihighschool.edu.in/','1','2','','5',2,'1','1','yes','080-23621393/4','Sindhi High School at Hebbal was inaugurated on June 9, 2003 by the Deputy Prime Minister, Sri L.K.Advani in the presence of the Chief Minister Sri S.M.Krishna and other dignitaries.This initiative of Sindhi Seva Samiti was an extension of their vision of ','REGISTRATION\n\nRegistration forms may be collected from the School office and submit the duly filled to the School office before the end of registration period.\nIncomplete or illegible registration forms will not be processed\nDate for Interaction / written test will be given at the time of registration\nRegistration fee will not be refunded\nRegistration does not confirm admission. It is subject to qualifying in admission test / interaction and also availability of seats.\nhttp://sindhihighschool.edu.in/hebbal/admissions/\n',0,'1','assistacademicsshshebbal@gmail.com','ZGF0YTppbWFnZS9wbmc7YmFzZTY0LGlWQk9SdzBLR2dvQUFBQU5TVWhFVWdBQUFIc0FBQUI0Q0FJQUFBQmRNUnFHQUFBQUFYTlNSMElBcnM0YzZRQUFBQVJuUVUxQkFBQ3hqd3Y4WVFVQUFBQUpjRWhaY3dBQURzTUFBQTdEQWNkdnFHUUFBQUFZZEVWWWRGTnZablIzWVhKbEFIQmhhVzUwTG01bGRDQTBMakF1TnZ5TVk5OEFBRHlYU1VSQlZIaGU3WDBIVzFUWnR1MzdEKy83N3ZmZXZlK2VlMDZmUHQxdHpxbE5MV1lSUkVWUk1ZQUJGQlZGY3M1UTVDTG5LR0lBSkNoSURwSkRnWXFvaUloSXprWGx6QnRyYjBDNkRBMklmZnJjMjM2anEzZnRXbkdzdWNhY2MrOWR4ZjhhSDFmOGlkOFRmekwrZStOZmgzSEZyNDhuM3lvVThrK2NtVjc0RDRZL0t1T0V0VWxRWnhReW1WUXNrY3RrY3FsTUpwSEtwREp5VXFHUUNNbEpmRVFSTFZmZ2pVU3FrRS9VK2dQaW44dzRhSnBpaHh6VHJGRW5SWHpSVU44b0R1UXljdVpsNHp2N3kzRmFXNXlQYm5aeU03N1YvVzRRSjBGdWZscjlzVjljV09VdHBCMkZ2TDdzVll6dm85RWh6bFFYQkZNbVR4MVF2VXllK2QzeHoyYWNFQ29EY0F6amJhaDRIY3ZNZ2NGS0pWTHdlRjdOQjdZc0ZVdHhYbldGMVlHMXR2Wlg0bTZjQ3QyNXlPemtEbmZ1S0ErZkpzZVVibDlnOHFUbURXbFFJWTloUHRxK3dMU3ZhM2g2RndEV3B2ZjlVTi83WVhxTGtPV1pMUEE3NDUvTStIRC9XR0VHYTNTUUEyYkFiSWhieHE3RjVoMnR2U0RGL0Z5azJpb2JpVWdDWERyTTFGaG4xLzZ5QjJ1RGoySjljMndOWXQrLzZjZHhsRTgyS01ZeHZYSUJEdmQzTHpFZkcrRk9kUUZ5MlVOYzQ5TmtuWFl0TnRQWjQxR1kyWUNLRTU5UzlrNWVKOHQvYS94VEdWZkk4OUxxd0ZkQlJqM2hTeW9yeTMyMlk2RnBabElsYUFweVNjZHhiOGZReUFBSEI4NUdpVEtwRk1Xa0lnbjRFZ3ZGdElJSE9ONUhDMm54WlpVRno1OVV2ekU5RTQ3ZHdPY0twM3BCbWVTWUVyUUF0YmtmOS9qY2Z1L2RTeXdhSzF2eEVZZ21lNGd5ZWZnSmxDV1lHdDYzd2Jkbm5NeUxrbWFGZkdSZ1RNZ1g0Y3prUjNMSU1VelAyL3FlVEV6WUhPb2RoUm02M2toRWxZeGJGYUNwdXJpNXZhVjM1MEl6cG4wcWlCNGQ0QmhvK3AvZXpZQ2FSM3BtWVZ1NG15U0JjZFJDWVJxSE50amovTlFBMEd3WTR3RzJUa1ZlRTFxQVFHRVRKSWJra3lISjVWMXZCK0lDY24xdGtsUGpIck9IT0lUM3lZcmZDTitZY2N4SkpzTTBNRlZXV1l2YUt1dVUyRkxZOGxRQmlWaHlkSXNUZG5weFZtT3dTenFFRzVTZFVIRkZyYnJIcnlEUXlkRWw3RUVPVnNYbVVnd3E4dGg4cXd2UmRnWnhLT1pwY1FmRmpFK0hhYXkxRyt3WjZXenJoK1dlMnVsK2JKc0wySnpxQXJWZU5MemJ0OXdLUkxzWUpiNXY3UnZvSG9HZ1k2L0F6ZTVmWmIxbnFZWFdWbWNzeVpITlRxM1BPMm43bUtvKzc1aC94bWx6eHJnUlkyQzJtWWtWZnJZcE9CZ2I1bXFzdGRYVDhKMXVnQ2dHRm1qYlBMamUzbFEzM0VDVGlWMFBVbm82Qm5mUXBpMlZYajRTQUUzdmhGaExpZmowdkJ0Q2VmdXJjV2pxcktvWFdTSEt3VUx4dGJlN25WUHpubW9md0VmUW42YmFOblNOV3VwcmJCSFl3QUpnMFpvYkhkRXBvaUN4VUFKRjJydk04dnFKWU9nTXFTS0Nja2t4Q2N4aWVtdGZqMi9BT0l5YWprQ29jY01Cd2tMZlBPL0NXdyt6MnlDeDdVVVhlQ0NnR0UrL1diNWpnV2xxYktsWUlFYVVrcDllRDE2ZzczeU9BQlNZNklTaFlrM3hDMWdvbEFTUlRJVG5ROFNJYUJPTEFRbkdGZ0hGeENvVmNuUUhCM3RkTzJSaU1OUkpONU9raXdlWklvRll4QmRuSkZiQW9rRTlSQXd5QWptNkhWNkU5dW1SWE5jT1JuVU1BN2dabkgvcHNEODBCMU9aYUcyZU1QK01ZK1BEUWIxcEpoU0xlS0xuOVcvQkRxUVpKdE5VMTRaalg5dGtNc2xKeHJHUlFYR2dVeHBaSkptc3U1MG91dytVWFNvN3ZZdHhRc1dOWHIveXZDWm96cTRsNXRnQjhINVFlU2dTYk5QaVhDUjJDUXFnR0VMNFBjc3M3Sy9HbytHSjhTamtRYzVwV0Mxb0dpd2RwQi9mNWdwZ2FXK2NDdG0vMG5xNGo0MjZkR0VVNk9zY2xnakZnejJqaUVSUDduQkRnOFJSSTZDRTRWTmRURFQ3RlpoL3hwdFo3ZkJqOWxmaXlhNmtMTjFJT3dTVzlmWmxOMndRa2czUEp1UUo2WG1DY2dGWGlKMk8rSStlRDhwQUphRE8yQ3RwQ2VWM0lvdG9VMFY1U0lHUUt4VHlSR2dURGhHRnNlWFJDejRrb01JWUtBOVlJeVkvT1o3MlZ6MndYT2k0NVlXb3k1cis5T3FpRjdqZk0zczg2THBUaFhHTVJpSThIbEw3akVSUTZCU3I0bno5Wmx0ejEvUm01NHl2WlJ4RHBCY2Z3T0JnQzVpTXpjV1kzVXN0V3BzNjIxdDZFRXRndHBnQUxCRUZrTERnT0NlMWRvcHgwR2Q1UHVyQUdsdFVwTStNREhMd0tWMWd1b3lpTEU2US8wMHpOeHpnUC9JNkRWTlZBTGlCcnZZQnBuMEt4QWQrMWQvaFB0WVlaUkNoSC83WmdUdkt4d0NnVHZWbExYaEZ5OWhrcWl1dElQR0lTakZnakNyYUozdlhJck9jbEJyU01yWDhCTk82bUJXK2xuR01pVDhteUVtdVJmSUNSZWF5K1RBNktBazJzdFpXRndneHRtZUlhOGFOMDZGWWc0N1h2WENKZTVkYnd1cHBRZ0ZNQS9uTDlOMDl6NkFJZ295UUFCUkN4eGZUNXhIN0l6N0Jac3BOcldXWTNjYUFhVTFIcEFpYmdMS0I5TlRZeHgydis5UlcyMXhROTRHNC81TVpsMG1JWXJ4dTZ0US82SWNoWXZRWUpZd0lJVGFXd1V3M0FtOFJ3TkZVUHFscWhabTRHZC9DSmtDbXZtK0ZGYlJ5cWltd2pwZXB0OThJcEpmSlZ3Q1dnVkFWRWtjTjN1emFpZUNoWG5aSGF4OE00cXBXSUFJWVU1MXdmSVNoWWlJbER4dWhOZ0tlc1BoaEk2SjdwRlF3SFV4L0R1elBuWEY0Ly9pQVhEcVlMVWhuSWJTSTk4L0YwUFVPK1BMR0JJakdNRkRJSDVKRGpFa3VsV0lYNzF0dWlSeXk4MjEvZjljd3RyQlNnNzh6d0JkY0pieENjMFA3MnhmZDJBVHdreTQzRW1Ic2lPdnhLYzRVWlRaZ0Z2QXhtQVZHVHNlWEJBdE1zWGRMc3A1OGU4WXA0WVhOWWtEWW50aVNHRkJGZmhQZXdxN3hpcHdiOFY5Q1lCN2UzamdWaXNqaFhVc3Z4b1JhemZYdFZVWE5tQWFPcHd6dG53amxNU2dVbkJIZXFaME01QVRFbzFCVzRtMTFEMXV6cXVBNXBGOWZ3dytwTDl3QXRzTHJaKytSK2lMVWdWdkdYdmxWTzcrRjJUR09ZVUFXWUFKd09OaGw3OXY2b1hGdytwQnZMQU0rNVl6eUlIK0k2c0E0QWpLc2g1ZkZIWnpIcHpnRHpNRW9maWRnY2pJWmRpYzhKd21FRlBBdWZiQjN1QndvT0ZKZnpNWEhPaG43QUlhRmt2Z1VRb3F3aDB4S3Fha3ZZbmFNdysrM1B1K0MwaUhQaHFxZ000VGVHQXF5U3RnRlBSUm90K29LSzlnTHpnUTZwajJwYm9VNTBadmpqMkRhWHdBOVBNSzhWQXJCZ1lIdlhHejJ0T1lOckJpWkxXUUVob1dQTVJHc3grZ2dCekdZbzJIQ3QyVWNuRUlXb3J5em9OY0JqbWtZQ21nMU9obUN4S1NoL0RXeDhSRWVIT21KN2E0WUIyM2FxS0xVeUI4ZkdEbkdEMDRSZzJIOHlCNFEwVjgrR2tDNFJnRnFtK2FrMUVMTjR3TnpKMDdPR0wvTk9DMElFREk2aGNFeGRwYXI4UzJZOXAzd0lyeUZscW11dElhU05GUzhoaTNBbDhLUktqWHlMd3FLZXpMOWk0ZVlpR3JZUTF3Y2d3U0VqSWMzT3FpdnNVSEVBdCtibjFidlpYbkgyL3BlZFZFek1iSXZyc0Z2TTQ1ZTRTU3Zhd2VENGpPN1BXNEc1Ylc5NkVaa2NwM0tKQXN6V1pDNWUxSEYrQlM2aHVnUThvMWhLVFh5cnd1eVU2V3l5b0xuMEhUd2p2bG1KRlljMmV5RSthWW5sQ09BZ1F2RlI1ZzcyTUFyQkJhRUtEVXlIYi9CT0ZsU29SaGR4akp6RUJXaEd5bzhNcnVnN290VUdIdE5iWlUxOGgwZVc0QjRGbTRFSGxXcGhmOGVRTHlBU1BIUXp3NDBDWWhTVXVNZTB4S0tNOGlyaC9yWXNFSXdBTDNOVEtxRU5IenVVdnVYR01meVloODl2RjBGM2dHR0tVbk0zSXlUd2owZW5OemhEdDdST3JyWDJ1TGM5WFlBc29NTmhUcEtqZnozQUtpQW1JRFRtcElYajNPZUR2V09ncERiWVlXZzI5UGlMbzVobEpnK2tnenQ3VzZVNG4vV2UzMkpjYmxNN205L0g1d0d1YVJqcHlDYk56a1RoaEM3K0VFamRPWkZRM3VvVythcFhReWtQRDNJTTJjWmx2NnJBMnR3WHMwYjRvNkFrajVESy82NS9kNElseEZUNE8xVTRlbjRMT04wR0lSby85cnhJSkR1WTMwUDRlREl3QmhheEo1NlZ0dEdyeXEybXhBaDZ1U0ZwLzg1QURuSHRybWMzZStGdklTY1VSRGxxYWRTRUFkeXVaakVNeWp6OGFiL2lIRVVBWldJQWtVU0tEZ2lVd1NoTUcwMDVHNmFCRE9IbTBaYWYyU1RZMGRySDViMDR4Yi9od0FpNDJWeEZ6c2V1VFN0S3Myc2RtUi95RVZlUGUwQSszMmR3eWFudzZBRW9HZzZTNSt3Y2RSUHYxbCtkQXVodFNUckNkcmljNFEyK2pFZzNmRnFBa2gvMmZnT1BqTTlzUndmS2RXZE1TWXlUM29vRTJPYUdCazFPT3FBcUNHMTErakNjd0FzajdSRHpHM2lIc2lIdDNSSGN3WHNGMW9LNHp1d3hwWnBuK3BoZG52ZmNrdjR1UWUzS2tFZzJBZUJlNWFZSndUbWtkMC9iZnkvWnB3YVNscENPY2c5cCtaOVhzMm45LzBRNGsyeFVDemdDSjBNRStBb3JQU2lvVnhEUFd5S25XbDFadzdTQzJST0loVHdKR0tSVENJVzhubGlrWUE5TXRqZjJ6blEyOFZoRHlQUkVnbjRZdlF0NENBRlJHSGxScjRJa2pXS1JVSStGMXNWQjFJSlVqVnl4MGdxRmtwRUF2cVdLTVlBS0ZXY0xUcmIrdW1ycEdBR3VVaFp6alBRblp0U3UyK0ZGUmJnUVZJbGpGMnBpakxqWXlOY3lEU1VTQ1FRWVpDWnR5cmhHQytvK3hSa3NEQjlEL1BiQ0RselUrdGczVE5pSEdVbUFSb0lxQnY3Nzl0YkgyVmxlREZjOU02ZVV0MnRzbnpSRDkvLzdUOFcvdkJmeXhmOWZmbWk3My82L2k5Ly8rdS9iMWl6N01UUncyN09kc1dGdWVBT0ZRbEhhT2ZUL1pMMnlkcFFyK3lSb2RLaXZHQi9IMHN6bzR2bnpweldQbnBDNjlDNU05clhydWd6WEoxaUlrSktDbkw3dXQrRGVySUo2RFpodEZnQWVyVEtqWDhXdENjYkcrWU85NC9CTGtGUmhPZERMQURpdDJjMWJhVEpqN0loWmNhZnM5NWl1WkJFWWN2QW5IY3VORk5kYVlYa0N1RjlUZkVMTkZwSzZjd01oMFZzR2RZRkd4NGJmZFg4TkRJMFFQZlVzVlhMRnF4ZHVWQlBSNFBwYWZ3d2xkbmNtTkwzdmxETXF4WHo2NlJDbGdTdi9Ib2h0N2FqTmV0eFFiUy9sL0VodFYrV0x2ckhEY05MVDFrMU1IeHNDK1ZlUUJrQ003RmdzTGNyS2l6b2dPcXVKUXUrMDliYTZXSjNLVDdLS1RzdG9MdzRwdnB4Zk9HajBOVGJIc0ZNYzF1TDh5ZVA3MTJ6NHFkVnl4YWUwTklNWkhvMzFGVmhoOUhtVDYzclhOUnlaSUJqclI4TnVxOW9CZlowRElKdXBRSTBQbUhqYXF0dDFGZmJ3QVBBbk0xMHc3dmZEcnhyNlVYbzdXVjVGKzUwSXU3NVBPTVlMb3lGc0NDWENuaGpaU1VGRmliWDE2MWNzbW45VWl0VG5ieXNrTUdlUWpHZkpSV3hGT0lHdVlRbEZ6WEl4WTNqc2thRnRBR1FpMWtLU1FOTzRsZ214TnNHbWJoaHFMY2tQTWhxL2VwRmVqb24yMTYvZ0JYVHBKQmdnRExxMGVFQkQxZUg1WXQvdUdhZ1ZmVTRYc1N0bGdyckFUbWFralFvSkkwMDVKSkd0RWJhUjdPaStxR2VvdEw4Q0ZkSGczMDdONkR1MmRNbjd0KzdQVHpRUzhZdms5RGJoWmovUjNQOEJCUUtKOE9ieUZIc0RPTElCYS9QMzRiK3lITXFGRTIxYmNqcERUU1prQ0g2UXNxckp4MVl1aWlmN00rMU1oMFFZRmgwYVdHZThYV0Q1WXYvY1ZCdGEyaUExZHRYV1JKQnZVekVBck56ZzB6STRvNVUrbnViTDF2MGo3dTM0cEFLb3k5eXhVa2txQ3dyV2I5bW1lRWxyZTYySEhRQlFzZWx5dFUvQjJwMXNiRllJLzJQSDZReTlYUTFsaTM2L3RnUmpkUTd0d2E2MzR2NFBMbnNTeW43ZEVEVE5UYzVRczNIaHJqRUlqK3pWQjh4VGhrT3RBbGNqdzV5TW01V3dCdm83UFU4L0xORGY5ZXY3cEZQRmlhWkZuVzloOXlnZmR2NnlzUE5hZlh5aGZ0MmJZZ0p0eHZzS1pZSzZxWEVpZ2tSc0RLbENjOGNzRTJ3S1JQV3YzcWV2dlhuNVc3Tzl2Q01RR0o4MU1xbFB4VG5SY0ptc1c5SVI5SUdwYnBmQU5sWXhPVHI2S1VDK3dKT2RYWkdvSTYyNnVLZnZydCs1V0pONVdQNGRnSXA5WWo2cjZjL0hURE54c3JYOEptMmwyS2wxS1B1U2dWb2ZJSnhBbXhhaVRUWU9aMzJ3b2dGR3l0YnFTMnMzQ1VKQThRaXp1aGdXdktkUStyN0lJN09kaGZmTkdmQ0pHSFVTdE9iRjRDamdhNGk2SUNMdlJWODRJWTFpOXRmUFpUd2lZQW9sWnd6MEpTWTN6RGNXeElaWXFleVplWFdqV3ZqbzhMWXd3TXlzUWpFZkpaM3lxNHpiMVhzV21RVzdaTU5BcFVMVVBnMDQrU2ZYTTduQ0VxeUdyUHVWbzhNY2dqZHYrNEpid0ZzNm9nUS94VkxmenFtdVRQblFhQ0VCMk9wSjdwTUxIcmVLSmdPaFJRS1V6ODY4SGpMaG1Vcmx2emozZXRzaVlCRjFIbkdTdktiSUM2RTJpNW9GbzNYVnlaY09uOTQwWTkvYzdTMTdPbnFRQ1JBT1NxaTh0TUpvUmxIMmhqcWxsR1l3Wm9kNHg5QXRhSjhrZ0xaQmlJQnc4WCs0SUc5cjVveVJkdzZTamUrQ2NzZkE2NnZxejIzOVhtNlZJZzEvb2FkMHJLRElLcXpMUWZiRjFIUWxZdG5uN0pxSlNMaEo3TUVFQTA5K1VJNDkxdU1md3BFNXBGTDhEak9kcGJheDdVWUREZjJjQlVvSVA1cS9neE5DV2lmNkN6Q0d6RVZkWWhZWUVFSzZ4YkJES21ZaEM2QVZhY0NIajY3NnQzclJ5Z3pEN1l2cFJ5c2hEVEZHYW1JRExGWjhNTmZiUzFOZUp4UlpGSktsazYyUHFVSFNwSXdoYmt3RHUzbXNFZHNMSXpQNnA0T0R3OTBjM2Q3MnBnMWp6TDZTWUJvOEl1ZDFOOVp3Qit0QUtjU1htMUZVV3hCZHRpenVyc2RiVGtJTmtTOGVybW9IdXhBZG5yZTVtdnMyVExVVTR5M1NrMTlKWkFySEZUZmZmeVlwdW9lbFZmTnp3UzhEOS9IbUFsbXh6aENiTGhzSG52VTNOalE0SktlTzhNdElNRFhQOERuUWVaTnlEYzlJQVd4QmFLcU13UnRsYVF1ZVR1eFVhaVRNR1RZTDlLaSt1NzJ2SVJJNTFCZmk2MXJsLy8xUC83UHZYZ0dPTVVDVkpYR1c5elFoY2hxN050NjlkelJUV3VXNnA4OUZCVmlpM3lITjF6Vjg2NGc1WlluekJ5NUZaeDViMGNlRlpMUFltd2ZnSENlU2hjd3pxZDFkNURGUmtVRlhyOTJkZTJxcGFsM2I5SFhENVM0K2h4bXh6aUNVKzdvc1BFMUE2UHJobjUrUHY3K1Bnd1BSa3hNYUVpSS94VGo3OXB5aWd2alpvNktzbHYwVE1pVVlJOFU0OVVWU2VXbENTK2Zwdmt3akhac1dhTzY4K2NGLy9oclpYR2NnRjMrMDNkL0VZeFdnbkVVSGhzdVoxVWtGV1dGbmRjNW1Kem8wZkkwWFZ0enI2MzUrU1UvL2Qzc3N2YkZzNGRzVFhWRlk5V3B0N3cycmwyNmZjdWF1SEFIcUkzU0FHYUMrdHBrTER3OXdmQWdTeXRMODlpWUVIZDNOd2Q3dTE4MmI3aCtSVytvdjBlSnE4OWhwb3dUOFphSXhrWUgwYnFabVltdnI3ZTd1M3RjWERna0pRWjlNOXhIaDZyb0FaVVd4UnRkUDN2OW11Nk1ZS2pqNm15TVVISzRyOVRVOEdSa2tPMUliNm1ZVisvaWVNM0M3Tkw3TnprM281d1hmdiszL3ZkRmxzWm5vMFB0UWZTdUxldmVOR1hBd0xFd0lsN3ROWU1UejJwVDFIWnRUTDdwdFhiRndoQS95eENtSmZKN0tJemVhZXorTGVhWHRZOGUyUDd5U1JwdnJJYnBicEtYR1c1MFRYY0t5dVA1R0laa2tEN2VWb2hlc0YyZ1p1aVJ3WEFORFEzRXJNR0FxNXZMU2UxaktsczJ2SHorRk5rZkNhQS9vK0EwWnNvNFhDVjdaTURvcXI2VmxZV3JtMnRjWEJqNmk0ME5BK1BSMFNHdzlFYldRNXB4RWgyU0FKRU03amVCd3JRK0lLQis5ZVErdTcvTXg4WHd3dWtEcGJsUlVuNnRsRjhuRTlTcDc5bDg5TUNPRFNzWGFSN1lJZVd4cmwwNmxuN1BCNEtEdm1CM1pRVngzLzNsM3crcS9zSmpWeHNiYUZ1Wm52dityLzlSbUIzS0g2MWE4dVBmdTk4V2RMWGxmUDlmLzNGQ1k0ZlJwUlB0cjdJam1kYmpzaWNmUUNtRzBxZytBYkw1U01UQ1oxY2ZPckEzTWpMWTA5T0Q2ZThiSE14MGRYTmpNcjFOakcrc1c3Mzh6czFZK3Fxa0VudlRNVlBHNVZMcDA0WTZkYlY5Zm43ZURJWTdsQVNNUjBVRmUzZ3kvSmplQVlGKzZXbHh0Q0FneVR4eGVPZm05Y3RuZ2ozYjF3dEdxbWl4NWc1WEpkOTBVOSsxYWRuQzcxODlTNjh0dTdsbHc0cW9ZRnNqZzJNWFRta01kaFp1WHJzTU82RDZjZUtqMUFEMEFzWWhSQWdoZUtNVk1IYnd3aDRxcnk1TlhMTjg0VkJQVVVsdWhLYWFpa3pZQUxYUlBhWE9HYXBNVHZSQ2p5NTJsN21qbGZEQUZPTndGWTBWaGJIVGgvUVJsbTM1ZVVWZlZ6NjF3S3k2aWtTZE02ZGlva05nZHRIUm9Rd1BkLzhBWHlhVHFLdURnLzNQNjFlUlM4U1NyN2lYUHdXb0NwL0QzclY5aTRlSGUwUkVZRWhvZ0plM2g1ZTNKMklWU2w1Q2dvSjhhUlZHeXZDdUphdnJYZjVNOEs0bFc4eXJrNG9hR212dVFxOFBxVzNqRGxWRkJ0bnBuZEhnREZXOGIzMDQzRnVNckVxSXhFcFFQemFBYUtSV09GWXQ0dFpBaUVEQnIwQ3RONExGaXFJNDdKaEFiN09rV0RjUnQvS1hqYXNicXBMdTMvYmR0bkZsWElUVHVoVUw5Ky9jK1BibEE3b1d0aGR2dEZKcFZOUFIrVGEzby9XUm1GZUx3bWpjMzl2TTN0NDJKaVo0dXRreEdJeUlpQ0JyYTZ1cmwvU29TNC96b1NyRWEwcEU1c2JYckN3dFNIL0VZWVpBVW1Kajhlb2FFeE9Fdm9mN3kyVVQxMDhhaUxBZ1VCT3hQZ2N3S09IWGlYaDFmSFlOb292TjY1YmxQd2hldXVEN2h1bzc3UDdINjFjdVpsWGVScUNOTWhOVmhQVnk2c29CZ2tJRUR4TXNUM0RkTUM1aWpVdklHaUFxeDJLUTY3M3N5ckhCTWxaRklsWlJ4SzA5ZTBLdHNUcnA2SUdkMnphdGFtM0syTEZwZFZLY3EyQ3NKaVhKWi92bTFaekJDamlQcWJGTmg1eTZCa2xmRWNMeXdCdjcrSGlHaHZuRHVzRTRHS0FGRnNmSGp4L055ODVVNXUwanpNTEdRWGxoWHZZeExjM282R0EzTjNCTlJCeThvKy93aUVESVMxMU5HblFaZEF2R3F2UjFEK3ZwSE5MVE9mZzV1TmtiQ0RuMXZOSHFzOGZWVG1oaTg2eGg5NVh0L21YOTVyWExSL3ZMQ2grR0pVYTdtQm1lUG4vbVY3WE9uanh3Tzg3dEE5Y1VGSnhLY1dVQzRWM1dLT0d4WEd3djZ1a2UxTk05ZEVHSDRHR0t2NWhiNitOMGxUMVFEb2w0WEJEYjBacHRaWHgyNCtxbGhuckh2Snl1NUQ4SXVSdnZvWGYyMDZPOW9LTlJraHNKWjRQRytld0s5ZjI3WVhDZ09Dakl6OXZIMDl2SEt6SXlKQ3pNSHdjcVczL21za2VVZVBzWU03WnhDbHdPVzJYclJuOS9YNFRoNkFrc0J3YjUrZnA2K2ZoNGhZVUZwS2JFa21oWFFvTG9ncHd3Z2tlaG4wTk5XZnpZVUtXZDJmazN6elA2TzR2V0xGdWdkWEJYVm1xQW0vM2xpQUFyR05lNHBLRW9KencvTzJTcVN2NmowTndIUVUvcjcwMFFQWkF2Ylk0ZEZ6Y0ljNFBHWEs2TVM0Z3VJNklvSzRqSmZSZzhWYXY3SFFuRHU5dHpTbk1qRGM1cFF0azFEMnhIL0k1MVhiZDh3ZDRkRzlwYnNsODlTYy9MK3REUmRPUm1CYU1BSFl4V2xzU2RQNmNMRVo4d05ZWWJ4TVREMHoweUl0RFd4dnI4R1cyNTlMY3Y3YzZPY1pqNStUTW5uSndkc1pXd3F1SGhRVER3MkZoc0x0ZjQrSWlBUUY4cVdTQ2tRNXFoZWtnVXAwTTJCVkVqZjZ4VzU4UitCTmZsQlRFRG5VVlhMeDR6dlhveTQ1NGZkN2hDd0s1V2lBbmpZQWNlRXVVbjZpSWg0aUsyb1JSYzJpZ3VjK2RGSFJrWHN6aEI1cng0SjVUSGVhZ0svSnRVMkVCM1JQY0xCeXRrMTNBR3lvWjdTL0ZwVW94cjI0c3NKNXRMbDg1cE5sYmVSdDdVV0gwYjdvVHVoYTR5QlhLWmpKb0xKdVh2Yld4dmJ3Y2hoYWpHeDVGWlU1R3hXM1JVOE9sVDJzbTNiOHFvcS9aZnh1d1lSMzZmZERQbTNGa2Q5SUdvQ01JeTRVRGMzZUc0c2RkNnUwcHBBNFMzc2JVNDcyQ3IveXZZNkVjRjJXRHlJejJscDdYMjJWdGNxQzIvdWZUSDc4b0xZckh4d3dPc2poM2NhZjF4TFFwMlZ1ZnZKbnJRalJNQkVkUnh2SDhadFZzbWZSNGpLbytUdGowa2pFdWYwdjRUeXV2amV0M3hvMFpzTGZVU29wemdHeDZsQlNJT0dld3A2ZThzVnRtNGF2V3luNkJqa1B2WWNIdWxLdW5KdmxoNE1DNFZOSnc5ZlRBZ3dBZlJHcXd0akZnYkl6NCt6TS9QQ3dxajhzdW0vdTczQ0EyVkdQc1lzMk1jVVhuMysvWWRLbHNRcTZEWDJGakUvd2lTc0wvY3c4SUNQYjA4cXlwVGFWTDZPZ3Rpd2h3U29wMCtJTW9wTHRMcFlXb0EvTDZobnRhWjQ2cVljMlNBOWM2dGExY3Uvckc2TkNFckxTQTJ3akUreXZGWHRTWUJMb3J6SWljWWx6U0lpNTNaOXN0SGJaZHhtSHZIRVVnSUd5QXZXQW5GYURtSldJVDFkeE04NGlLVlc0dU5kTXA3R0NMbTF6aVk2eitydjFkVkZQdkRkLy9wYUszZjBwVDV3MS8vTXpYSk8vdCtBTVlaSDBXVngwR2tZM2x4REtGYjJERFVVM0pBYlM4RWhFcEJTRndZRk15RW5DSldzYmV6MWRZNlJHNFZ6RC9qRXJGRXlEOTZTTTJOSWpvd2lPbnI1K1hqNngwY1RIdzNOdHE5ZTlHMGxja2tUOGlkek1rYmpQUWRISW1nRm5ia1pLM3ZZS0V2NGxSYlhOZjU5My83MzYzUE1vYjdTdGlERlRDbHFmS2ZBSldxMEl3ckJnclp6bXZZanF2WlRxdEF1cmdZa29KbFlNbmVabzNhNjVGaktkRjBrbGh4aVZiOHFoMUF6SklLYXFGWEw1OGtIMVRkcHI1bmk5V05NeWVQN2ptaXZqMy9VWmlBVTBlcE5oa3ppWlJvc1JMVmwrWkg2ZXVkeDZ4SlpCSkw0aFBxR0RGYjJJVUxaMk1pSnI4by9WdVlyWTZUNjdSaHdmNVhyaGpReVQwY3R4dUp4OE93eFNEb3ZyNGUxTzByeUY5OVpLRE4xblVyYUd4WnUxem4yRDVRZ0h3RVlRbXlRU2hKZTh1amt0eW95QUNyemV1Vy8vTHp5cTNySndwL2pGMWIxeUgrZ1VhVDVSU3orRGUxMmZhcnhRK3NSYW5HbzNiTHg1elh5ZnR6eHNXTi9HUlB0cE1CWmV5RThlZU5LVnZYTGY5RXMrdFhiTis0YXJpblJDNWljUWNyOVhVUDdkMys4M0JQY1h0TDFvWlZpeXFMRTl6c3IyNVp0eHpRUHJTTGRFb1laM202WEhkMmRzSk1zYTFqWXNJeDk3aTRVR1NlVWRHaE83WnZmZDlPL2FUT0REQTd4bW0wdkh5dXVtODNZa1RpTktoMXhqRnNuRjcvOSsxRmlGaWdwTDN2OHAvWDM2UFJWSGZ2OWJQMHhxcGJXemVzdUIzakJpVlpzZmdITEltQVhkWGZXZmk4UG5tcTVDZlJ6RW9oRjhFeGVkaGRmUURiYnJub3ZqSFAzMUJXR1M2SU93c3o1MFZyallzYUJPbStna3cvc2lyVVZ1QU1sajJydWRQRStsVGpyR1F4SCtiZk1OSlh1bnZiT293aDFNOVNkZGZtTThkVU42MWZucHNaaERKTmRYZGZOMlhJcVkyRmtxZFBxRlBLNmVFZjRCY1V4RVJvR0JMcUh4b1NBUDk1K01CZWJIMGxsajZIdVRBdUZnbFZkNnVneTlCUUpnbVBQQmlRZFU4dkJzYUJ3TEdpTEJXTVEvc3dWZ3lVdmpxS3pBZ2hvN09WL292RysydVhMYWl2dk4zYlVXQnVkS2FIQ3QySVlud2VhQUdneFFveVBlYStrUjkxU2w0WDI3ZHpneVRmWDFZVHkvWGJpeldRMUFlT2Myc1VJNVVrZlVkNUtsNlNpc2dZbEJxa2dmTVlKQkxha2Q3SEFuWU53LzV5WVhiNG0rWUhSdy90WEwxMEFVSW1CRVVUVjFSa2pkQzlnd2RVRVNtNEl5NGtJczVBQ2dJamk0a09OakRRRC9MekVndDVTaXg5RG5OaEhDN0MyZDdLek13RXBvMDFENDhnQmg2SHVJV0tGSk9TSWlldnZqWWFYVDYrZDhmR2Zic0lMSTNQUWg4eHllUUV4dUVES250M2JhTFAveWJjSFM5RHFTakdud2pURGNmY05zbHFZMFVwWHQxcmxuQzhEQlZQNzhqS2c5aU9xOFlZbXhSamxSTXg0bUNwdURvZW1TZDYxRlJYVVdwd09pS0RiT2hua2g2aytQM3k4d3JnTC8vMzMxWXUrc2V1YmV2MzdmcVpSKzV0a1VpOE9DLzg0c1VMVkZwUGttMXNaVHBHaE1pbzd0MzV0dldWVkRUeFRQTnZZaTZNdzRGV2xSY2ZQcWdlR1VrY055SWt5bjNUc2g2S0pGZ3NxS01aYjI5NTJQSThvL1ZGSnZDKzdSRUpya21ZVlRmWVhUSjEva3Rvem1odFR1OTVsNHN0QW44bzc4cGdPNndTWlZncm50L251QnVDOGNIVGFvb1g2WXJtZE9HOWEyeTdaY0pIbG5UbUtianZNK1oxUTA0ZU1HcEVDNitmWjd4NStWSGpGQWE3aWlSOFJOekV4eDVSVjJFNFhPbDRuZFh5TE8zMWk0eFhUUm5ZbC9nSThIQXhKRmRvd3dLeG9TY2xOQmo1aDVjWFEyUC9icGxNL01sN25wL0VYQmlYU0VSOExudjcxcCtEZ3Z6OS9EeGpZMEk4UER6b2VKem12ZU50QWFhTnljUEU0QzNKSmRrNUFSTVc4U2J1QTR5TFdQeTdsOGJjTnltYVVoVXZzNFowTmJwWEx1N2R2RnJlbERuKytwSDhhY3FZNnpvRU1BbzJpUTdIL0V6NEtkNTBSZkFGcDBJUjk2dkdsU0dzSzg2T0ZQRnFjUXliZ05wQWxGQWR3b0xrNk1SUjFmRHdRQzh2SkgzQlh0NGV3U0VrT0VhVVltUjBqZUhxcU1UUGx6RW5HOGVDaW9VbVJsZHRiS3doSThnSWtQUXovWDJRQ0hoNWVTRGRMeTFKcG1jNzB2LzRsdzByTjYxWk5qZHNYcnZNMzlPWWJrb3hWTWgyV2lHNHFUL2VtamYrcHFCbjAwb3czcjFxaWJRc2FieXRlUHgxbnZET3RWSGJwYUlTWnhLdFY4VEtPM1BvNjdHdm05S1JWU3ExL0RFMnIxbTJjZlZTdkpManRYaGRXcFFiVHZxVnNQcmVGeHcrcEE2VG9yWnlNTkk5Q0F2WjNMR2hCelgyTnorZDNSZjc1c0k0alp5c1RPcDJYNUE3Zzc1QkFWRUw5L0QweEdnU2I0YVJLOWVJSzRRc2hCbXZHbFBuaHFiYTVHNTZ1OGdheFZYZUlGUmFGalRlWGlwcnpPaGV2WmhpZkRFLzNtdjhmUlU1V1grVGJiZVVHN2lIWEVTRW1pTW5valNkTjFvMTJ6RzhZS1crYkV4akR6NUdkWGpPM0lmQmhsY05FdUxKRGEvNGVCSVh3b1hDdG9LRG1mdjM3QkR5ditXZDVlbmdqbzNzVU5rY0dSbnM0VWtsK2d6RTQvU05vVkRFTFFLRURWTHllQTBWaEpGYlF0RGkyUUlSSVgrNGdtYWNuM0NLN2JoQzBaSTkzbGtsTHJqVnZYb0p6VGpIejJhODc4bDRWKzE0KytNeDkvVnNoeFdLa1NMQ05ad3RTVVNmaUxtMThJMTAxREZUd0ZaNDlYTHFlaUZDS1JmN1M5N2VESDkvSHo4bTlyR3ZyNjkzU0FnVEltTnVabXhyYVRyenVKREczQm1YU1VWbnoyZ2pKRWVVQ3BlQ29DVXNQTkRUazBIZGtXSzB2eW5BSk9IbGV6cnlMSXgxTFkxMXJVek96aFp1RGdZaVhoMkpVc1FzanEvS21NdjY4WGRsNDkwc1lVWUV1S1laSDdVeEhCOThPZDVMU09jR0hoaTFYU0o5RlVmWk9FdVE3aVBNRGhSeGFteE56MWthNjFqY21Ebk81S1FIUXYzQk9CeUE5dEg5VVZGRVJ2Q0srQVR5VFIwSEh6dDZ1TGFxVERMaktJWEczQm1YU2dTSmNWRVg5Uy9FUkllQWJ2aE15dGpoUmQxQmVtSCtiUklqU2h0SEJ4L2ZpbkZKakhiQjYyeVJtdVFsUTlnRHhvVTE4SXFJeE1jN2E4YjdtL2lKQVlSdUNpTldOOGJaYjhjSG04ZDdXYnpJNDJ6N3BlSXFMMlJEd2tlQkEwZFVGTU5sY0lOMzR0MXVSanZQQ28wMXR4RlpZUW9EM1lWSERoL0FIR0ZibUIwU1RteGljaHdkdkcrM0NubHVZZ1pYYUtkajdvd2o0Ky9xYU51emUzdDBWT0JrOGtuSEttNkl6Ukd1MGxja3FJMUpMblhPR1JPTU82MFpjOWt3M2xFTmkrYkZNeWRzSEl6YkdJOXpPOGVIWDQzM05mSkNqb3phTFJGWCswQlN1SUdtc25kNTQ1SW5TcTNORnRrWmdkZXZHOEpoZW5oNmdHVzh3dEtEZ3YyZG5SMXVHRjVTNG1RbW1Edmo1R3NKSXNFeHpRTStQaDVNZisvdzhBREVxblIyZ0ZjRVQ1QnltdkdtK250TVR4T21oL0ZzZ1lveUFYVTFYRkxQOGRxS05FZnh2bXg4NkNYL1ZzQVU0Nk9PcHVQY252SGgxK085RFJ6djdjajRKVS9EeU1Vc3hIWlVtZ3J2ZlNmT1hhbmxMK05Cc3E5OElwcHNjTERXWXpLOWZQM0lMUmNQVHdhbVNWMmdEanQxOG5oeC9pTWxUbWFDcjJDYyttS092NitucWFseFhGeW9IeFAreEQ4ZzBDOHcwQzg0MkI5TzVrMUxIakZ3YVdORFZaSzd3eFZYKzFtanNacmM2cVNYalJ0NkFEbU83RW55K0VDek1DdHVpbkZ1aU52NDZEc1l2dUp0R1Fxd0haWXJodkxwUElnR2t2WDRNRWUzanhyL0FwSnZlbENNazJ1SHA0NXJRQ1JwU1lGOFQ5eFRqZzVWM2JPZHkvN3dDOUF6eDl3Wko5L09VOGlibnpVY1BMQ2YzSm9nbCtjajZFZFpxQXNPSWJrNTVHRXI0dmU1TmRJdlg0bjlESGdqVlVJdXVZa09DTE5ORVIyS2MxM2hKTVdsOTZjWUY5eUxIQjl1SFI5b2twU0hzZTJYY1lOVnFidk1pRlhxNUFORkNuWWw4aGNKcjA1Qm5nTlZidjlqVUN5VHIwekFVS1Q4dXQ2Ty9DT2FCeWtScDYrUGtsZHZiMC9rZlZjdW5oTUxabm90WlRxK2huRUNzVkNndG05blNFZ0E0dE5wVWs0aTFxaW9RQ0tGMGtZeG4yVm1lSExuMWpXemhiYm1Uc1IyTk9QU0Y3RUl0M2tSMnVPOWRmS1hCY2g5Q09QSWdGalo4S1VRY1g2Y0x1VTJQY2NGTFA0OXhzQWhsWDZOWCtROWhZTFI2djA3TiszZXRsYXA4VTlpOTdaMWFyczI4OGVxMFNOaXJmUmtyeHMzcmtWRUlDVEVEZzcwOS9jTkRHUmlndWZPbnNsTXZUZnpadzJuNCtzWjU5dmJXTmpaMlNBbFEwYmc0K01aR1VrdVBzREplSGw3OHNacVFEb0NyTTYyN0JlTnlTK1FYelNselJ4dlhwRHZXcENuSVFSMUNrN0ZtTnY2TWRmMWl0YkM4WjZhM2wvV2d2R2VUYXNVOEtYZGRZcldmTGJUV2c1enh6aS9WdllxbmUxaUlNd1BVL0JxRkNMeXhhM1c1Z3lsbGorSGwwL3ZOemVrMGxLRzNXbGxxb3RKSWEyUG9LN1dSVk9QUzBSSEJlMVgzVFUyTXZUbFo2OCtoNjlsWENJUmxaY1dhWjg0R2hrUjRFNmxaSEF2a1pGQi9nRytrUEpYTHg3QnhrRTZCTEdyUFJmb2VaODNXM0JIS2hHb2pZc2JCZmV2UUtrbEJSNUk2NGN2SGdQakExcDd4enNyeGpzcVJGbU9rQlRwODFqaUxjV1FGSVEzOWRCaUFPR2RVb05mUU5lN0hNNXd1UlM2Uk9VK1dvZjNJdTZtcmhjU3Jta3BqNGdJMER0MzhzdGYrUHNDdnBaeEJDenM0Y0c5dTFXb0c0RFV2VzN5MEF5NXFoVVhILzRvK3haOVJWL0FxZnBsdzZvTnE1ZXNYNzE0dG5oYWUwY0NiWkUweWpzejJIYkx1WUZxaXRZOHJyOWw5OW9sWTA2RzQyMUZpbGZaSEM4Vi9pMWRjbWNaS1Q1aEhLOWtwYVVDbHM0eFZhVUd2NFJWaTNNemd1UWljclB0L1p0SFdrY1BSUlBHU1NMdDVjVUExMUNZcTFjdklSSDU4b05YWDhEWE1pNGxYd0lURzEyOTZPbmhoZzFJeCtQUjBlUStOK3dDNDVOUFBpcEZYOEFqeWo1TGtPK2RDRm5rUnBvWU9jN2hVWnRsc3ZKUVNXRjA5N29sb3N5QThWZlprbHczdHZOYXhWREJ1TEJPY045NytJclc0S2s5aXRFS0JRbkdDZTh6QjMySlVTb2s0MHk1N1dGbWRpTThQQWlobDYrZk4raW1MdFdHcUtudTZlbnErS2N4VGlNekxmbWkvbm5xU3BZSFlpa0VpTDYrWGxGUlFWQkFMcHZ5UXBMR3NZSEhMYy9TVzV0bmpaWm5hZTB0ajlBSUlIMFpOMnEzakJkMlJQRXNlVkI3cjd6eHJ2ekpYWTd2RGxHZUxXUkVsQmM2YW4yT24reUZWQlB5TXR4WCt2SkptbEpyWDhDYjVnYzlIUVhnR2xvazViTXNUYzVGUmdTNXVibEZUeVlaT0laL09uWDhDSG1BVnFGTXdnd3hQNHdQOXZmdTNiMmRYSHdnRDdHUW0xSjQ5ZkgxaE5VM1BjMmlHRzhvTDR4YnYzTHgrcFdMWm9zMXl4ZWVPcnFYWmh3eEg0ZTVtOXhqSy9TVjVQckxHMjZKc3gyUUhJM3phMkRnNHlMSWZjTTRuM3FWTmlMeFFmVzFLNVFiL0J6V3JWenNiSE9STm5aNGpzTWFleVBKVTV6MDdSNTN1Q2dtMDl2V3hqeVk2UzNnY2VXZi81V2dMMk4rR0JmeU9McW5qZ1VGK1NKV1JWeEk3blpURVhwY2JPakR6QVNGaE5xcTFQMFU4cDN3T1VITUo2SkVjc2c2ZnpoSlh2QUJXVTJNckRxQzQ2a2lMbWVNUTNZRTlRcHVsWUpUVFo0Si9hajZid0xDaGV4VUpxWTFrTlg2SXBONndqSUl5WE5vcUg5Z2tKK1BqMWRFUktER0FkV3U5KzF6aTFKb3pBL2pTUGVqdzBPdVg3dUtaQ3dnMEJlQlNtUWtlV3dJVWg0YTVrK0VHRG91cUg5U2UvZGhlc0Rja1BzZ1JDS2dIZ1BpVjQrNS8wd2VVOG0wRnFYY0dHUDhQTTZwRWo0TTdGZmYzTHR0MVppUElTTEM1NDNKbWFuTXJJOGErUUllcFBublB3aVpqRklhYmllNE90aGJCZ1ppSXVUaC9PaG82ckhXNk9BakIvZkxaZVRYRXBRWW1Ebm1oM0daUlBTbXBmbUFHb21sWU5wd0wzNStQbkE0c0E0RWk2TkRsY2c1UmJ5NmV6YzlMdXNkblJ1c1RIUkVISEw3RkJEbFdDTWI0bmhzR1hQZktMaC9GUVl1ZlhKYit2Syt2TDlZUVlVb2QyNHlMdXNmSmZpb25jL0JRTytvamRsNU1YV1RUeTV1Tkw5eEJuNklqZ2pKWm8yRFNIcDdNQnk4R0M1ekN3cW5NRCtNSS91U1NVV2FHcXJZZHpCdGNtdUsrbzRNUkFic043SWVJRmFoWWdEcW1SUHFBdE5zSWVIWFQxMWpVUXprc2gyV0kra2Z0VnNxZTVzOExpWmZMcUVleFdwUTBEOWRRYjFPci82YlVHQ0UxRVpFK3hKQjdhRUQ1SUVjS3VJS1FhQVNIT0lmRmhad1JGT2o1VVdUWXE0S1RtTitHS2ZoNCtGcVpXVU8wc1BDQXp3OWlmT2tuZ1lOelVoUElOZkt5VVdsdXFjMWQ2c2Z4MVUvanA4dDJsNDhrRTE4MjR6Y1R1UEZIUisxWFVJa1JWQkRQNEZGQTVRTmRSVXAxWjBKS2t2aWVFaTFxT2ZmVzVyU3RJOGZ2WmtRNlIvZ0V4RElqSXhDa3VHT3VFWHpvSnBFeFB0RDJEaU5odG9xcEF3eE1XR2VYaVJHREE0bXo3VER4Z01DL1JSU3lpTkpHMjNNem1rZTJENEhrR2RjSjIwY0thV2tJV1RVWmlrdjRRUXhiU3JKb29FOWhFejlzTHFLVXZYZkFpay8yRmxFUFZIRHVobnI3TzdxQUQwa1h5R2t2QkhreFovcDRXaHJLUlVMRkhQNnZac3B6Q2ZqOUZVdFVJenhRZmc4UEJGWFJZU0dJdC8zSHVnbGQybko1aVd4VjZOQyttU1dtRWhrSnBqRlcyN0ZxTXNhUWE3bGhDeE1NajV4akFMS0xYd0paSmZRWFpDSFFPdXVHV2hIUnBJa0RuTkIxb09vRnk1VVYrY2txN2FhU01vZng4WWxZb0dWcVpHWGwzdEFnQytTWTNMTmxuSTc4ZkZoZFRYcElBTGFJaHlyUmdpUmtlSTNPNlQ2ZGJmblFtcW5hQVU3bkxpVG5ISnYrakxzeEhrcXpHaHFTTWFHVUc3aHQ5RFRrWS9ob1RwL3RFcERiVGQxdTRkOHF5bzBMSkE4dHgwVHBxRytSeW9XRWJyL09Jd2pZaW5NZTZSejVtUlVaS0FmMDhmZjN4YzJRblpsZEhEYS9UajZOdmxJLytPcmVzZXVYcHcxYWtwdndoOStZRmJhK0RiRnFqVGNHTkVGb3VtcDgwZ1g3OS8ydnFLdnBWVDlTOUFIampaVzN5YlZ4UTFQNis3QW5HSFhFRWJxbm0wZ29zUHdNQjhMazJ1Zit5bmFXV0ZlR1lmSWNjZFU5K3lBazNGbnVNWEhSL2o3a3hneEppWVlMb2k2V0VHZXBRY3BSQ1dtZ1g0bWxIcGlncXpLMU92a0FVc3VJYzlWSVpNaXRGTFBma3BGRGI0bmR2aHFidUtOVm4zUWQyTGo1RUZxOURYVnppUklMWndoaHF6VXU1UThtRWVDS0dxTFJJWFkrdmk0WXZ4MHBBc1I5L0gxdW1hb1gxNVNLSmZPN2tjQVA0bjVaSng4bFZFdU5UVFFDd2ttR1JyMStBcDViQWc2SGhZVzFOZjlHTk9ib21ZNk1FOXdJUlZBUSt2RjNGcVFLK2JXa1lzYndqcnlxQW40b2hLVENSQnBxcW90aURKYTllT05WVDlWUEFvSFgxT2Ywc29BeG1YQ1JpUUJhSkMrZ2taZXFWOWlBYVlLZnd3czJLWHpSNktqZ3FndnFZWmlGa0ZCL2xHUlFZZlU5L0U0N0srTUMybk1LK1BrRjQxa3lYZHVYVE84RE04VEhNTDBvcEorS3ZrTWdaU0RDMXFDUVM1ZXdRN3M5MjNMZzdSa0h6ZW55NWN2SEQ2cHBhcStUMlhmN3EzNzkydzd1SC9IK2RPSHJ4c2NkM2U2bko3czAvRW1XMDVGOUlDQVUrZWl0ZXZHeWgrTlZ2N0lPTGxYeUNFWFYyR2tlQldNVmRlVUowU0gyVnFaNnVpZTJuZFFiY3VPcmF1M2JWcDVTRzNMMlRQN0xZM1B4RVRZMTFmZDVMTXJzWXBnbjk0QmxLY0Y0MDhFbk9xRDZuc1N5Q1VVN0U0bTlYVW5sN0JRZjBPREMwSUI3dy9IT0kyaGdUNzEvWHZoYWlCLzhYSEk4Z1BBT3hoUFRvNm1EVkFpcUJ2cEt5MThGSW8wOHFEYXprTWE2cGN1NnRuWjJjS3NzSXRkM1Z4ZFhGMWRxSC91N201dTd1N096azVYcjE3V09uSkk2L0ErTzRzTEpUbmhXWEV1MTFmK2FFd0JCN21KN3EzTkdTRk1DMDJON1d0WExWWGR1K3ZNcVJPR1Z5OWJXWm83T05pN3VEZzd1emhaVzFuZ3pJWHpadzhmMHRpNmVjUENuNzQ3Y2tBbDFOK2l2ZVVodldEVW1yR2VzZTdxNitrR0J2a2hCc2RnSUN5SVZXeXRqYk15VTZtNDhLdDhKbzM1WjF3azRPcWNQQWFIUXg1dWp5SE9CK09HeVNPQUVYSnIzN3pLZEhFd1VGZFYwZFU5N2VUa2lEZ1NuQUlNRHcrODRoOTlCck1sNTZsL1pDVVlEUHJBenRibXVNYStpOHQvZ0o0WVExVlcvbmh0eFkvN0YzNjNlc1hpazlySDdPM3QzTnlRZGVFL1YvSVBWUmhVbTFSbFVwLzZSM2RoWVdHdWRmVHc2aFZMVGh6WmxaOGRJdVRVU0FTc1lEOExwcDhIOVMwbnduVnNiRWhvYU9DeEl3ZTRZeVB5eVI5Wi9Fck1QK05pSVQ4c2lHbGpiY2IwOXdYWGNFRklPNUdDSWlFeXVLQ2xwcnJid3R3VWRrZElnTnhNQi9XUElzck4wZEhlMHRMYzFQaTZ5WTNycGlaR1ppWkc1cVkzekV4dkdPbWZOOW15OHNaS2l1NVZQNTVhOHZlbDMvMi9mYnUzWXdjY09xQjY3T2doclNNSGtZVWRPM0xvOUdudDgrZDFUVTJNc1h2UUp0MzRyN3Nqdk9NanRMOTdsNHJLbHRVcHR6ek9uemtZU2I1L1RhN1FraXNXeE13RDlNK2RuaGV1YWN3LzQ0aFlXcHFmYWg3V3dLQjkvYnhDUWdJUWFXR3ltQjdrZ3JZMStoai9CN3VRRUZCc1kyTnRiSFROMnNJa3dOY3JQaUlrUCtkaGUxdkw4RkEvK1NrSHNWQWk0QTcxZGFVR2VwdXNYd3p0Tmw3MUU2emJhZC9Ha3lxcmp5NzgyNFdsMzE5ZC9zUDE5WXRUdzVqc29UNzJ5T0JnZjI5dlYyZE5lVW5TelZnbk84dUw1MCtmUEtGMTR2alJhNFpYSEJ3YzBCMjlDY2lvNkgvdTd0Q2Z2WHQyd2lBaUlvSkRRLzA5dmNpVCtkZ043cTQydDIvR2taKzAvV2ltYzhQOE00NXdSU1lSSHptNEg5b05RbU5qdzcyOHZjalFQeGdYc1RVM054Zm9yTkcxSzY1T2R0RmhBVFhscGFNalEvYTZ4NUlZanNXcGQxNC9xVzlyZWRIVzh2Sk5VMk5aWm1xTW5ibko1aFhHcTJIYUJDYXJGaVNabmVIMWw0NTFGUWFkM2dmMkllaDR2YjdxSjdQZG0rNEgrNzVzck9jTUQwb0VQS2xJQVBUM2RqV3pxcE1DUE9NamcyMHRUWFJQSGNOdXVIcmxFandFdUo0Y0dPeWRlQkNjb0I0SklvK20rREc5ZGM5bzlmZDB6dmJod2kvZ0d6Qk8vUXlhbDV1emp3L0R5NXY4N0F2UlRhSWhZSjFZOUxWclYyeXR6U05EQXVxckt5VGtSM2VrdEVSS0pNSmI3dlpFb0ZjVEU1N2lFV2NvMWFaUC91U3J1ZjExY1l4b3BESS95THd5d1VVMFhKbm1mTWtFVlNoWm42cGx0SGJScFRXTExxOWZjbW4xUXVNMUMvSHA5WFZMaER5T1hDcVN5eVRza2FIa3BJUnJsL1dPSEZMVDFUa0ZCd0NyQjlma2xSb25kZU9RZlAxRDkvUXhBWmROc3MyUFpqbzN6RC9qTkdvcVNuVE9hRWRGa1R0QjJMdHdrckFwaHF0anlwM0V2cTRPVEFCY1M4VEM2ZkdXV0NKdWZjWXlXcjJBR0RKRjNBUW91azNYTEF6UlZXdktDcEp5YTlvcTRuME9xMkJoVEZjdlNMYTdJQmg0M0ZvVzUzZDBCekYvU1B6MHVsTlk5Wk9ydGdhNG5ycVpnQUdRMzJFVjhHb3JIcnM2MnB3OHJubGNTOVBDM0F4MHcxRWpzNGR4K1BxNGhBWXhwU0xodkVRcE5MNFY0OXl4WVhYVjNRZ3RqSzVkOW1FNEYrUThSQVlCaWFkMndJZUxRZE5uQWl0WFNNWEJSaGVOVnk4d0lSUXZNRnUveUdubjJwaXJXbVZ4em9PdEQ2UzgybmQxdCtNTWo4R2k0VGxwSGdIdlE5dmVsTVZMdURWUHM0S3dLaWFyRjhERzBZSXhjYkRVSzB4KzFZOFBZc09vZmllN3BuNE1IWDZIUGdtbGZ0UHlJb2pwZGZiME1jUXd4c1pHc0hmOUM2ZmZ0NytoeHZ4aG5GK0piOEk0eGljUzhoSmp3Z3R6SDQ0T0Q4RDdpWVZJSDM0cnVzS25jaWwzNkgzdnl3ZDlMWmtqNzNJRWZjVUtJVXN3V05yN0xLVWt4akZRZXk5Tk1hR2JacHdpSGVSaURTSXZIV29waVJHUFZZMjhmVlJ6eHlQSlFpZEFlN2Z6N3ZWMjIxYlpibDNwcEs0eU90U3YzT00wWUFHa0VwRk1JaElMK04zdjM4VkdodXFkTzMxRyt3ajlJOUR6aUc5bDQ4UXVpR0lRODVtVmpVakZ3c2I4bEtnclJ5TXZIUTdWMmUrMmY1UDFwbVdVcVU1Uy9EbVFaZmpKY2VmYVpIdTl1bFJmN0FaUXorc3Y1dllXYzNxS3VNT3RpS0tVK2xLRzBpQ3BSZmpWbWZuQXQySjh6b0NWOFRtanZoZE9mUENmdEYxUEovZHpvRW9pZktRalNNaUw2ZHFGNXVzWFIxc1lrb3RRODZjTVg0TS9IT00wQmp2YjNVNGVub2hTcG5NNkcwQnRVRDNvNGtrK2UyVG1tK3hiNHcvS3VCQnBkVStYOHdsMVJIVktQTTRjMTFmK3lEVFFZUS8yUzBWL29MODI5d2Rsbk1iWXlOQXRoZ01pYTFvbFpxSXQxTFpBWlBMVGpRMUwwOEtZY05vUVk2Vm0vN240UXpOT1luWUI5M2xOQlVOSEMxbk1UQmduL25QRDBrakw2MTN0clRKVUYvTG4vTGphTjhJZm12RUpJS3lVU1o1VmxzUTVXbGp1M213SWdWNnpnR1NZVkhCQ3A2TndzMGJybHpocnFkOFA4ZXQ1OTFZMnk3L1k5SHZpWDROeEFER01SSXdvbjlQZjJWSDY0SDUyYlBnZEwrY0VkNGNVZjQrQ2U0bFBLa3JIaGdkRXZERXhuNHRZUnpaL0Y1N21IZjhLalAvM3dwK00vOTc0ay9IZkcxL0JPSklLK2k4RWtZUWVyMGlLeVo5aG9qSjhLck1uVjRmSUg5c2lCOVJmM1pvNlQwcFFmMFNWUGltWFRYNUUxeUpmYWlKRnBqN0N2dzhGa01zb1NBcE9IMVB0VEJUNDBDYlZEbW1FS2t3Vkk1L1NCM1FCdWdvMWtZbEc2SW1RdWhNdGs3cVlFZDArcVRoNUVyVkl5VWw4NEdRR21EdmpRcDdJOW1Lc2srSE5VTmZNM05RNmU0TTRKOE9FMGtkUCtSeGhoT2REVTUzd3U1SEZFcUhZemlDdUxQZlptK1l1Kzh2eDdFRU8xaUF2dFE0bjNZeVRYajN0a0lvbGpWV3QvbmFwOEl2djMvVFpYb3AxdkpvUXg4d1o2UjhMZGN2a2pmSURITzQvcjJ2M01Mc3oxTWV1S25oZVgvWXFuUEVRVFRsY2lYL0JhcjhYV1l5T2JvY1ZZakFocmhrNHhraGtFcWxNS2swS0xSam9HbWx2NlVtT0xzMU5xYzFQcXg4YjRrYjdQTG9iVVl4ZWdQU0U4dHFTbDVZWG9seU5iM1czRDZLS1ZDTEZYRVFDTVZxb0tueisrTkhUZDY5N25hN2R0TmFMWnBXM1BLdHB5NzViamJYeHQ3dVBqMGdqRjJNeFNJeGNpWmt2WSs2TTg4Y0V1dnU4MkVNY3ppZ3Z5aWY3VVhMTnk4WjNlZ2Q4cysvVmVKamZBV1VncGFiNHhaRk5qaTQzRXBQQ0NnK3V0eHZzR1FYak1iNlBVTGk1L3UxbHpRRE16ZlhHcmZOcTNoMnRmUzhhMjFGbG9Ic0VqV0F4TGgveDk3Tk5RV0ZNNmVobUp4K2I1SlNZMHR5MHVpdEhBdDgwZGZXMEQ2S0xNM3M4WGpkMWhuczhBTE1HbXY2dHo3dWl2TE1JNHhLcG8ySDgyNWM5ejFsdk1SaWNQTExKQ2ZRWm53N2pjNFdKSWZuM29rdlFrYzVlejU2T29mSzhKaHY5R0ZBSit6aW42aTJrL2tSM2VtSjVjblNKeVptd2hvclhiNTUzeGZubkZqOXNESEhMd0t5MXQ3c0x1TUx5L0NZUDg5dmtqK2I5YmpZdTRvdjNyN1EyUEI1MEw2b2swanRMZDU4bmVBR1ZFVjRQQ3pKWWNxa1Vnd2JSdW5zOXJ4MFB0ak9JTmRJT0dSa1l3MlJpL0I2VlBucUNnV3B2ZDRQVm45M25sUkx6T013OTgrV1RkNW9iSFUvdjluQXhTZ1FkZTVkWkh0L21XcGpaQU9zN3Y5OEhrMmVZM3M1THJ6TTQ3SC85UkREZTlyNGZ5a2lzdUhpSWVlMUU4Tmd3RjJ0emRyK1htL0V0bUNvYWR6Uk1lTmZTMjFUWDVtRnhKOW8zbTJGNkI4dDU0MVFJUGtxT0xjbE1xdWg2TzRBaFFVbDRZNEl6dXoxd0hoc09qR05lT002NEJjWkx0Ylk2NDYyZlhZcTM5YjJDZE5ZSkZWZWpreUhxcTIxUUFGdlR4K2FlRWljendWZlpPTWFIdmhVeVdiUlBkdEVERnZaMUxETW5KNldXWVpvRWM3YlNqNjR1Yk1ZK3dJZ3hOeXU5Nk9GSnhqTVRLNXBaN1ZlT0JxQ3d2b2F2L2VXNFV6dmRZWS9PMTI5aS8xNDlGdFRYTmF5bjRRdFNUdTFrc0llNCtocCtMVS9mNzFsbWtYdS9GanZqemZOdUxFbHZ4NURkcGJpK2ptRXNRRzVLbmE5TmN0LzdZWFRISGVYRHhyMHM3NWJsUEN2TVlBVTVwOEVnSUNCWHRRSmhIMWkvZTlIRkdiY3FZSjRndXYxVkQ4cFk2OGVnaWxnZ3h2SjN0UTMwZDQxUU5sNEttYXJJZS83NjZYdllRV0VtQzhhRVlpZDN1R01XalpXdFB0YS9MK1BRdXlDbmRQb1lSZzBHT1NNOGI4dDdvLzFqV0FBejNYRFl2bFFzRFhaSnIzdjhLdnRlZFdKd0FmUUhJeTVJcTdlL0VnZURiWDNlZVNlaWlQNEwyWGZDaXlyeW1yQ1JVU1UrSUxlK3JDWFNNd3Q2a2hyN3VPaEJJK1FTZENRRzV6K3RlUlBPZUdCL0pkNythanlhUlJmb0NLSWg0QWh4M3Z4Y3hQMzRNcGdxR214NzBZMk5oWTRJcDVtczFxWk9qQkQ3QUxJR3YxSmQvQUsyZ2w1c0xzVzRteVJocWJBU2NKTGVWdmNnUjFoNGxDblBiZXB1SDhDbWdlbkFQVHl0YWN1N1h3ZXVtWGFwR0NUYWh5ZVlZbVBtbUR2akdERkdUeDlqSE9RdCtZTytSRVBKVzd5Zk9pa2x3QUVOK2lUcVRwMG5aeWluVDZLQ2FXZm84aFRJTWVTQy9naU5UeFNlTEVBM0paT1FZMUtBcWp0eE1Oa2c5YmRjcWRDRmJvSENoNEg5T3F3aTU2azhsN3lsdXB1b010a3ZmV2FLalpsajdvei9pYm5oVDhaL2IvekorTytOUHhuL3ZmRW40Nzh2eGhYL0h4YlFjZFV3b3hvL0FBQUFBRWxGVGtTdVFtQ0M=','2');
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
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student_table`
--

LOCK TABLES `tbl_student_table` WRITE;
/*!40000 ALTER TABLE `tbl_student_table` DISABLE KEYS */;
INSERT INTO `tbl_student_table` VALUES (8,10,5,10,1),(21,10,10,2,1),(22,9,9,3,15),(23,7,7,0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (2,'admin','2f760ec7f5de7c4ccce99c26880bc1c0','banglore','student','admin@gmail.com','','','',NULL,NULL,NULL),(3,'abhijitjkk','9f34f66b65b94cf83d0b3c282da85f84','','','abhijitr@gmail.com','','','',NULL,NULL,NULL),(4,'Sujoy','decdd040d9b69a1b2f9366e13f9ee7e4','','','raos.gaurav91@gmail.com','','','',NULL,NULL,NULL),(5,'test','098f6bcd4621d373cade4e832627b4f6','','','test@gmail.com','','','',NULL,NULL,NULL),(6,'mavin','d10906c3dac1172d4f60bd41f224ae75','','','mavin@gmail.com','','','',NULL,NULL,NULL),(7,'mavin1','768c39bef08f5572d94e6ac594ff6798','','','mavin1@gmail.com','','','',NULL,NULL,NULL),(8,'mavin2','eb6110a34833fe26480c10e473061fd8','','','mavin3@gmail.com','','','',NULL,NULL,NULL),(9,'mavin4','503561e7a98cecc3d05586551febea51','','','mavin4@gmail.com','','','',NULL,NULL,NULL),(10,'mavin5','1342d7b99990333e208942dbaea8b945','','','mavin5@gmail.com','','','',NULL,NULL,NULL),(11,'mavin6','1c9d96cfccc91e46e8c678eafce6ac5f','','','mavin6@gmail.com','','','',NULL,NULL,NULL),(12,'mavin7','768c39bef08f5572d94e6ac594ff6798','','','mavin7@gmail.com','','','',0,NULL,NULL),(13,'mavin10','bbcd3908154b270b2a064870880d9090','mavin10@gmail..com','account','mavin10@gmail..com','34343434','Sameer singh road','prof_pic/mavin10.png',1,'false','India'),(14,'mavin11','d7fe8eb07bde5682ea9e3ef93cab19a3','','account','','','','prof_pic/mavin11.png',1,'false',''),(15,'mavin12','4aeb12f90ff98f0398a387fc951ec4bb','mavin12@gmail.com','account','mavin12@gmail.com','32432423','B-307 Century Marvel Apartment','prof_pic/mavin12.png',1,'true','India'),(16,'mavin13','29b799dbacd85ef0f6f214af9e606b04','mavin13@gmail.com','account','mavin13@gmail.com','27282782','B-307 Century Marvel Apartment','prof_pic/mavin13.png',1,'true','India'),(17,'mavin14','e22ed7f5e30fdad77a9c1aca913ef9e6','mavin14@gmail.com','account','mavin14@gmail.com','S','A','prof_pic/mavin14.png',1,'true','India'),(18,'mavin15','a38bd5fcd92bf159ee387d698a523fbe','','','mavin15@gmail.com','','','',0,NULL,NULL),(19,'mavin16','afca73a4390825b929ab34a71f79ae86','mavin16@gmail.com','account','mavin16@gmail.com','dsfdfds','ffds','prof_pic/mavin16.png',1,'true','India'),(20,'mavin20','1b1520a553281d19db57c2c7775e6a33','Lucknow','account','mavin20@gmail.com','1212121212','Belundur','prof_pic/mavin20.png',1,'true','India'),(21,'abhijitr','2f760ec7f5de7c4ccce99c26880bc1c0','Bangalore','account','gta4roy@gmail.com','7829712286','B-307 Century Marvel Apartment','prof_pic/abhijitr.png',1,'false','India'),(22,'testuser','5d9c68c6c50ed3d02a2fcf54f63993b6','Lucknow','account','testuser@gmail.com','7829712286','41/39 saket palli, Narhi Lucknow','prof_pic/testuser.png',1,'false','India'),(23,'tester1','72a3dcef165d9122a45decf13ae20631','Bangalore','account','tester1@gmail.com','633738373','rt nager 123','prof_pic/tester1.png',1,'false','India');
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

-- Dump completed on 2016-11-20 23:46:17
