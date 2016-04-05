-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2016 at 11:11 AM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `id_pic` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `path_of media` varchar(256) NOT NULL,
  PRIMARY KEY (`id_pic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(256) NOT NULL,
  `admin_contact` varchar(10) NOT NULL,
  `admin_address` varchar(256) NOT NULL,
  `admin_password` varchar(64) NOT NULL,
  `admin_is_super` tinyint(1) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_attachment`
--

CREATE TABLE IF NOT EXISTS `tbl_blog_attachment` (
  `id_blog_attachment` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_path` varchar(256) NOT NULL,
  `attachment_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id_blog_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blog_data`
--

CREATE TABLE IF NOT EXISTS `tbl_blog_data` (
  `id_blog_data` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_data` int(11) NOT NULL,
  `blog_title` varchar(256) NOT NULL,
  `blog_text` varchar(1000) NOT NULL,
  `id_blog_attachment` int(11) NOT NULL,
  `id_school` int(11) NOT NULL,
  PRIMARY KEY (`id_blog_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments_table`
--

CREATE TABLE IF NOT EXISTS `tbl_comments_table` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `id_blog` int(11) NOT NULL,
  `type_of_text` varchar(256) NOT NULL,
  `comment_text` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_likes_blogs`
--

CREATE TABLE IF NOT EXISTS `tbl_likes_blogs` (
  `id_likes` int(11) NOT NULL AUTO_INCREMENT,
  `id_blog` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_likes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_likes_reviews`
--

CREATE TABLE IF NOT EXISTS `tbl_likes_reviews` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `id_review` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  PRIMARY KEY (`id_like`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like_comments`
--

CREATE TABLE IF NOT EXISTS `tbl_like_comments` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` varchar(256) NOT NULL,
  `comment_text` varchar(256) NOT NULL,
  PRIMARY KEY (`id_like`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission_table`
--

CREATE TABLE IF NOT EXISTS `tbl_permission_table` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `permission_level` varchar(256) NOT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ratings_table`
--

CREATE TABLE IF NOT EXISTS `tbl_ratings_table` (
  `id_rating` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `rating_type` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating_points` int(11) NOT NULL,
  PRIMARY KEY (`id_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review_attachment`
--

CREATE TABLE IF NOT EXISTS `tbl_review_attachment` (
  `id_review_attachment` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_path` varchar(256) NOT NULL,
  `attachment_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id_review_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review_data`
--

CREATE TABLE IF NOT EXISTS `tbl_review_data` (
  `id_review_data` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user_data` int(11) NOT NULL,
  `tbl_review_title` varchar(256) NOT NULL,
  `tbl_review_text` varchar(256) NOT NULL,
  `id_review_attachment` varchar(256) NOT NULL,
  `id_rating_data` varchar(256) NOT NULL,
  PRIMARY KEY (`id_review_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_main_table`
--

CREATE TABLE IF NOT EXISTS `tbl_school_main_table` (
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
  `large_description` varchar(1000) NOT NULL,
  `average_rating_score` int(11) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student_data`
--

CREATE TABLE IF NOT EXISTS `tbl_student_data` (
  `id_student_data` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) NOT NULL,
  `tbl_school_id` int(11) NOT NULL,
  `join_year` int(4) NOT NULL,
  `end_year` int(4) NOT NULL,
  `status` varchar(256) NOT NULL,
  `class_std` varchar(256) NOT NULL,
  PRIMARY KEY (`id_student_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `city` varchar(256) NOT NULL,
  `role` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(256) NOT NULL,
  `pic` varchar(256) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_school` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `path_of_media` varchar(256) NOT NULL,
  PRIMARY KEY (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
