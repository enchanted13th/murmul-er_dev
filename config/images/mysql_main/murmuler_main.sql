-- MySQL dump 10.13  Distrib 5.7.26, for macos10.14 (x86_64)
--
-- Host: localhost    Database: murmuler_main
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `contract_list_tb`
--

DROP TABLE IF EXISTS `contract_list_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_list_tb` (
  `member_id` int(10) unsigned NOT NULL,
  `contract_id` int(10) unsigned NOT NULL,
  KEY `member_id` (`member_id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `contract_list_tb_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contract_list_tb_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `contract_tb` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_scan_tb`
--

DROP TABLE IF EXISTS `contract_scan_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_scan_tb` (
  `contract_id` int(10) unsigned NOT NULL,
  `contract_url` varchar(150) NOT NULL,
  `agreement_url` varchar(150) NOT NULL,
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `contract_scan_tb_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contract_tb` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_tb`
--

DROP TABLE IF EXISTS `contract_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_tb` (
  `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `contract_form` varchar(150) NOT NULL,
  `contract_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deposit` int(10) unsigned NOT NULL DEFAULT '0',
  `monthly_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `stay_from` char(10) NOT NULL,
  `stay_to` char(10) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `contract_tb_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dialogue_tb`
--

DROP TABLE IF EXISTS `dialogue_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialogue_tb` (
  `dialogue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sublessor_id` int(10) unsigned NOT NULL,
  `sublessee_id` int(10) unsigned NOT NULL,
  `content_file_url` varchar(150) NOT NULL,
  PRIMARY KEY (`dialogue_id`),
  KEY `sublessor_id` (`sublessor_id`),
  KEY `sublessee_id` (`sublessee_id`),
  CONSTRAINT `dialogue_tb_ibfk_1` FOREIGN KEY (`sublessor_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dialogue_tb_ibfk_2` FOREIGN KEY (`sublessee_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hashtag_tb`
--

DROP TABLE IF EXISTS `hashtag_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_tb` (
  `room_id` int(10) unsigned NOT NULL,
  `hashtag_name` varchar(30) NOT NULL,
  KEY `room_id` (`room_id`),
  CONSTRAINT `hashtag_tb_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `heating_tb`
--

DROP TABLE IF EXISTS `heating_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heating_tb` (
  `heating_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heating_name` varchar(20) NOT NULL,
  PRIMARY KEY (`heating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `like_list_tb`
--

DROP TABLE IF EXISTS `like_list_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_list_tb` (
  `member_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`room_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `like_list_tb_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `like_list_tb_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_tb`
--

DROP TABLE IF EXISTS `location_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tb` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sido` varchar(30) NOT NULL,
  `sigungu` varchar(60) NOT NULL,
  `bname` varchar(30) NOT NULL,
  `bname1` varchar(30) DEFAULT NULL,
  `bname2` varchar(30) NOT NULL,
  `jibun` varchar(60) NOT NULL,
  `roadname` varchar(60) NOT NULL,
  `road_jibun` varchar(60) NOT NULL,
  `detail_addr` varchar(100) NOT NULL,
  `latitude` decimal(16,14) NOT NULL,
  `longitude` decimal(17,14) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manage_cost_tb`
--

DROP TABLE IF EXISTS `manage_cost_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_cost_tb` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_dialogue_tb`
--

DROP TABLE IF EXISTS `member_dialogue_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_dialogue_tb` (
  `member_id` int(10) unsigned NOT NULL,
  `dialogue_id` int(10) unsigned NOT NULL,
  `the_other` int(10) unsigned DEFAULT NULL,
  KEY `member_id` (`member_id`),
  KEY `dialogue_id` (`dialogue_id`),
  KEY `the_other` (`the_other`),
  CONSTRAINT `member_dialogue_tb_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_dialogue_tb_ibfk_2` FOREIGN KEY (`dialogue_id`) REFERENCES `dialogue_tb` (`dialogue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_dialogue_tb_ibfk_3` FOREIGN KEY (`the_other`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_tb`
--

DROP TABLE IF EXISTS `member_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_tb` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` enum('M','F','X') NOT NULL,
  `birth` date NOT NULL,
  `phone` char(13) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `option_tb`
--

DROP TABLE IF EXISTS `option_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_tb` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(30) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_status_tb`
--

DROP TABLE IF EXISTS `post_status_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_status_tb` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_name` varchar(30) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_status_tb`
--

DROP TABLE IF EXISTS `process_status_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_status_tb` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `process_name` varchar(10) NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rent_type_tb`
--

DROP TABLE IF EXISTS `rent_type_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent_type_tb` (
  `rent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rent_name` varchar(20) NOT NULL,
  PRIMARY KEY (`rent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_tb`
--

DROP TABLE IF EXISTS `report_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_tb` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `report_type_id` int(10) unsigned NOT NULL,
  `additional_explain` text NOT NULL,
  `process_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `room_id` (`room_id`),
  KEY `report_type_id` (`report_type_id`),
  KEY `process_id` (`process_id`),
  CONSTRAINT `report_tb_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_tb_ibfk_2` FOREIGN KEY (`report_type_id`) REFERENCES `report_type_tb` (`report_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_tb_ibfk_3` FOREIGN KEY (`process_id`) REFERENCES `process_status_tb` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_type_tb`
--

DROP TABLE IF EXISTS `report_type_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_type_tb` (
  `report_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`report_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_hashtag_tb`
--

DROP TABLE IF EXISTS `review_hashtag_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_hashtag_tb` (
  `review_id` int(10) unsigned NOT NULL,
  `hashtag_name` varchar(30) COLLATE utf8_bin NOT NULL,
  KEY `review_id` (`review_id`),
  CONSTRAINT `review_hashtag_tb_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review_tb` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_tb`
--

DROP TABLE IF EXISTS `review_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_tb` (
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review_title` varchar(150) NOT NULL,
  `review_content` text NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `residence_period` int(10) unsigned NOT NULL DEFAULT '1',
  `period_unit` enum('Y','M','W') NOT NULL DEFAULT 'M',
  `score` int(10) unsigned NOT NULL DEFAULT '1',
  `advantage` text NOT NULL,
  `disadvantage` text NOT NULL,
  `insect_level` enum('H','M','L') NOT NULL DEFAULT 'L',
  `noise_level` enum('H','M','L') NOT NULL DEFAULT 'L',
  `hashtag_exist` enum('Y','N') NOT NULL DEFAULT 'N',
  `review_img` varchar(150) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_tb_ibfk_1` (`location_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `review_tb_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location_tb` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_tb_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member_tb` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_img_tb`
--

DROP TABLE IF EXISTS `room_img_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_img_tb` (
  `room_id` int(10) unsigned NOT NULL,
  `img_url` varchar(150) NOT NULL,
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_img_tb_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_manage_cost_tb`
--

DROP TABLE IF EXISTS `room_manage_cost_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_manage_cost_tb` (
  `manage_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  KEY `manage_id` (`manage_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_manage_cost_tb_ibfk_1` FOREIGN KEY (`manage_id`) REFERENCES `manage_cost_tb` (`manage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_manage_cost_tb_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_option_tb`
--

DROP TABLE IF EXISTS `room_option_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_option_tb` (
  `option_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  KEY `option_id` (`option_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_option_tb_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `option_tb` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_option_tb_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_tb`
--

DROP TABLE IF EXISTS `room_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_tb` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_area` double NOT NULL,
  `room_floor` int(11) NOT NULL,
  `heating_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `room_type_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `location_id` (`location_id`),
  KEY `heating_id` (`heating_id`),
  KEY `room_type_id` (`room_type_id`),
  CONSTRAINT `room_tb_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location_tb` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_tb_ibfk_2` FOREIGN KEY (`heating_id`) REFERENCES `heating_tb` (`heating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_tb_ibfk_3` FOREIGN KEY (`room_type_id`) REFERENCES `room_type_tb` (`room_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room_type_tb`
--

DROP TABLE IF EXISTS `room_type_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_type_tb` (
  `room_type_id` char(2) NOT NULL,
  `room_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_tb`
--

DROP TABLE IF EXISTS `sale_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_tb` (
  `room_id` int(10) unsigned NOT NULL,
  `sale_title` varchar(150) NOT NULL,
  `rent_id` int(10) unsigned NOT NULL,
  `period_num` int(10) unsigned NOT NULL DEFAULT '1',
  `period_unit` enum('Y','M','W') DEFAULT 'M',
  `post_id` int(10) unsigned NOT NULL,
  `deposit` int(10) unsigned NOT NULL DEFAULT '0',
  `monthly_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `manage_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `hashtag_exist` enum('Y','N') NOT NULL DEFAULT 'N',
  `sale_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `detail_explain` text NOT NULL,
  `member_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `rent_id` (`rent_id`),
  KEY `post_id` (`post_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `sale_tb_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_tb` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_tb_ibfk_2` FOREIGN KEY (`rent_id`) REFERENCES `rent_type_tb` (`rent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_tb_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post_status_tb` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_tb_ibfk_4` FOREIGN KEY (`member_id`) REFERENCES `member_tb` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 13:16:29
