CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: quiz
-- ------------------------------------------------------
-- Server version	5.1.52

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
-- Table structure for table `taxonomy_user_types`
--

DROP TABLE IF EXISTS `taxonomy_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_user_types` (
  `type` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_user_types`
--

LOCK TABLES `taxonomy_user_types` WRITE;
/*!40000 ALTER TABLE `taxonomy_user_types` DISABLE KEYS */;
INSERT INTO `taxonomy_user_types` VALUES (1,'Administrator','Administrator of web site. Full access to all users, notifications, events, reports, etc.'),(2,'Quizzer','Simple Quizzer. Has only the ability to take quizzes sent to them by a Quizzer Pro user.'),(3,'Quizzer Light','Quizzer on the Free or Basic account plan. Has the ability to create and modify their own quizzes, b');
/*!40000 ALTER TABLE `taxonomy_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspensions`
--

DROP TABLE IF EXISTS `suspensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspensions` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'This is the suspension table, used to determine during login whether a user should be able to access the web application.',
  `user_id` int(20) DEFAULT NULL,
  `suspension_reason_id` int(2) DEFAULT NULL,
  `date_suspended` datetime DEFAULT NULL,
  `suspended_by_user` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspensions`
--

LOCK TABLES `suspensions` WRITE;
/*!40000 ALTER TABLE `suspensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_states`
--

DROP TABLE IF EXISTS `taxonomy_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL,
  `abbrev` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_states`
--

LOCK TABLES `taxonomy_states` WRITE;
/*!40000 ALTER TABLE `taxonomy_states` DISABLE KEYS */;
INSERT INTO `taxonomy_states` VALUES (1,'Alaska','AK'),(2,'Alabama','AL'),(3,'American Samoa','AS'),(4,'Arizona','AZ'),(5,'Arkansas','AR'),(6,'California','CA'),(7,'Colorado','CO'),(8,'Connecticut','CT'),(9,'Delaware','DE'),(10,'District of Columbia','DC'),(11,'Federated States of Micronesia','FM'),(12,'Florida','FL'),(13,'Georgia','GA'),(14,'Guam','GU'),(15,'Hawaii','HI'),(16,'Idaho','ID'),(17,'Illinois','IL'),(18,'Indiana','IN'),(19,'Iowa','IA'),(20,'Kansas','KS'),(21,'Kentucky','KY'),(22,'Louisiana','LA'),(23,'Maine','ME'),(24,'Marshall Islands','MH'),(25,'Maryland','MD'),(26,'Massachusetts','MA'),(27,'Michigan','MI'),(28,'Minnesota','MN'),(29,'Mississippi','MS'),(30,'Missouri','MO'),(31,'Montana','MT'),(32,'Nebraska','NE'),(33,'Nevada','NV'),(34,'New Hampshire','NH'),(35,'New Jersey','NJ'),(36,'New Mexico','NM'),(37,'New York','NY'),(38,'North Carolina','NC'),(39,'North Dakota','ND'),(40,'Northern Mariana Islands','MP'),(41,'Ohio','OH'),(42,'Oklahoma','OK'),(43,'Oregon','OR'),(44,'Palau','PW'),(45,'Pennsylvania','PA'),(46,'Puerto Rico','PR'),(47,'Rhode Island','RI'),(48,'South Carolina','SC'),(49,'South Dakota','SD'),(50,'Tennessee','TN'),(51,'Texas','TX'),(52,'Utah','UT'),(53,'Vermont','VT'),(54,'Virgin Islands','VI'),(55,'Virginia','VA'),(56,'Washington','WA'),(57,'West Virginia','WV'),(58,'Wisconsin','WI'),(59,'Wyoming','WY'),(60,'Armed Forces Africa','AE'),(61,'Armed Forces Americas (except Canada)','AA'),(62,'Armed Forces Canada','AE'),(63,'Armed Forces Europe','AE'),(64,'Armed Forces Middle East','AE'),(65,'Armed Forces Pacific','AP');
/*!40000 ALTER TABLE `taxonomy_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_blacklist`
--

DROP TABLE IF EXISTS `ip_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_blacklist` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) DEFAULT NULL,
  `blacklist_reason` varchar(500) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `date_blacklisted` datetime DEFAULT NULL,
  `blacklisted_by_user` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_blacklist`
--

LOCK TABLES `ip_blacklist` WRITE;
/*!40000 ALTER TABLE `ip_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,1,'Patrizio Menu Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah','A test for newly hired servers at Patrizio. Covers menu, store information, table numbers, policies, etc.','2012-01-02 22:58:42','1994-10-02 11:22:25',0),(2,1,'Network+ Certification','A test covering the principles and information found in the CompTIA Network+ exam.','2012-01-02 22:59:23','1994-10-02 11:22:25',0);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_questions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(20) DEFAULT NULL,
  `question_type` int(4) DEFAULT NULL,
  `question_name` varchar(100) DEFAULT NULL,
  `question_content` varchar(1000) DEFAULT NULL,
  `question_image_url` varchar(150) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by_user` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzers`
--

DROP TABLE IF EXISTS `quizzers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `user_type` int(2) NOT NULL,
  `active` int(1) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `facebook_connected` int(1) DEFAULT NULL,
  `registered_from_facebook` int(1) DEFAULT NULL,
  `ip_registration` varchar(40) DEFAULT NULL,
  `ip_current` varchar(40) DEFAULT NULL,
  `account_past_due` int(1) DEFAULT NULL,
  `past_due_amount` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzers`
--

LOCK TABLES `quizzers` WRITE;
/*!40000 ALTER TABLE `quizzers` DISABLE KEYS */;
INSERT INTO `quizzers` VALUES (1,'pierce','502ee11cdfb874bbd839210128553c995c3e214e',1,1,'2012-01-04 22:36:29','1994-10-02 11:22:25',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `quizzers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_answers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(20) NOT NULL,
  `question_id` int(20) NOT NULL,
  `answer_type` int(2) NOT NULL,
  `answer_content` varchar(1000) NOT NULL,
  `is_correct` int(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_messages`
--

DROP TABLE IF EXISTS `site_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_messages` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_by_user` int(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) DEFAULT NULL,
  `sitewide` int(1) DEFAULT NULL,
  `for_user_type` int(99) DEFAULT NULL,
  `msg_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_messages`
--

LOCK TABLES `site_messages` WRITE;
/*!40000 ALTER TABLE `site_messages` DISABLE KEYS */;
INSERT INTO `site_messages` VALUES (1,'Under Maintenance','The site is currently undergoing some routine maintenance. You may notice that it is not performing as well as it should. It\'s just what\'s up, yo!',1,'2012-01-17 05:20:23','1994-10-02 11:22:25',1,1,NULL,3),(2,'Down for Maintenance','Quizzicus is currently down for some routine maintenance. Go grab a soda, watch a movie, and we\'ll be back before you know it.',1,'2012-01-17 06:59:18','1994-10-02 11:22:25',1,1,NULL,1),(3,'Back Online','Quizzicus went down for maintenance not too long ago, but we\'re back up now. Hopefully the website is performing at 100%, but if not let us know!',1,'2012-01-17 07:00:28','1994-10-02 11:22:25',1,1,NULL,2),(4,'Bullshit','This is just some bullshit that you shouldn\'t see.',1,'2012-01-17 07:00:50','2012-01-17 13:00:54',0,1,NULL,2);
/*!40000 ALTER TABLE `site_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(20) NOT NULL,
  `question_type` int(2) NOT NULL,
  `question_name` varchar(150) NOT NULL,
  `question_description` varchar(1000) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by_user` int(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type` (`question_type`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('5ec6fb464d2780bf782d9d96c8803cd3','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7',4294967295,''),('cc1c1bde71c62b61cfcd72d388b29271','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7',4294967295,''),('ba6b25c04337d69850135664f653d42b','166.205.9.239','Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 ',4294967295,''),('2da8475b42ac358182673872448b1652','38.229.70.44','Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6 (.NET CLR 3.5.30729)',4294967295,''),('a9f0b329b0c8748a3b494fcb884e5dc8','198.186.192.44','0',4294967295,''),('7105b125ac4c9a3ac64c0b1ec1042799','66.249.17.166','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 GTB7.1',4294967295,''),('1c681ec80441d1ab17fc62adcb0379cb','66.249.17.237','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13 GTB7.1',4294967295,''),('6b664e2d3400dbc6ab552544d0cd1d25','198.186.192.44','0',4294967295,''),('616e2aeb8095d4a2505cc7c1ef090036','198.186.192.44','0',4294967295,''),('d0d9bccc358596826609bae0074eb86b','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7',4294967295,''),('4325ae991771b7a3f5adabd8ed50ceeb','50.90.139.206','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7',4294967295,''),('5ab49a827507cbd90a557b3e695bfa79','184.72.246.39','Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',4294967295,''),('184c76d996d583c8c54f75e9b85d5fa3','184.72.246.39','Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',4294967295,''),('c2c15ba8d7ef207e6d007acbdc618cb3','166.205.9.155','Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 ',4294967295,''),('877f2906f57ade8eb6c2f8dea2a21d54','96.31.166.253','0',4294967295,''),('9b704d10fb6542098d259cb8924cc499','38.100.21.23','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)',4294967295,''),('95f0d7e118b013734eb5431bbf030dc6','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7',4294967295,''),('f98d647d48ae1c5bd2d22309cf380345','199.21.99.76','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('5f3b9fad002564e5ebab4de9626b6e30','38.99.82.221','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3',4294967295,''),('4e06d8e36dceac8921c8e5f0ee23e0e9','38.99.82.221','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081202 Firefox (Debian-2.0.0.19-0etch1)',4294967295,''),('6ca5b9e6adb14cde3cb360095647ccbf','66.249.66.111','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('ab0706a09d27e890ea6b0b047e5388e2','66.249.66.250','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('eab7aa68b153cd7faaa3bc12077e0b91','38.99.82.224','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.19) Gecko/20081202 Firefox (Debian-2.0.0.19-0etch1)',4294967295,''),('5b43b62e0567052ade04eda3be3a8069','66.249.16.212','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('c4dac0b41236f23a26ba683e07b34c82','199.21.99.76','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('ff95ba51a6dde3c66760ad942a1c7e63','74.84.201.86','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chrome/9.0.597.102 Safar',4294967295,''),('e445cc4261e2df08f117698daee9d0f9','82.117.252.24','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:9.0.1) Gecko/20100101 Firefox/9.0.1',4294967295,''),('f71e7b5a9b82ab6ab1ce33aff28773f2','82.117.252.24','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7',4294967295,''),('6249bacbd191d5456edcce1facac37be','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0',4294967295,''),('c852509e87e7a916ef276ba6dc44d4c1','173.203.197.57','GeoCerts SSL Check / 0.0.1 (http://www.geocerts.com/)',4294967295,''),('2ec5466006dbbe514c2ddec466a45b3a','66.249.66.67','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('affb21052c2557895947939ba3a19e3b','66.249.66.116','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('fdeb2b8997a07b8ce87524c03bc025f7','66.249.71.135','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('8c5e7077954b11d68bcea18e1268d4a0','93.158.147.8','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('b94eedbd115483c283c48d0352c26412','93.158.147.8','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('8e8efed633883daa1e4a0fa0d010623d','144.162.81.254','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1',4294967295,'a:25:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:6:\"pierce\";s:14:\"login_attempts\";i:1;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:40:\"502ee11cdfb874bbd839210128553c995c3e214e\";s:9:\"user_type\";s:1:\"1\";s:6:\"active\";s:1:\"1\";s:10:\"created_on\";s:19:\"2012-01-04 22:36:29\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:18:\"facebook_connected\";N;s:24:\"registered_from_facebook\";N;s:15:\"ip_registration\";N;s:10:\"ip_current\";N;s:16:\"account_past_due\";N;s:15:\"past_due_amount\";N;s:7:\"user_id\";s:1:\"1\";s:10:\"name_first\";s:6:\"Pierce\";s:9:\"name_last\";s:5:\"Moore\";s:5:\"phone\";s:10:\"2146167264\";s:12:\"country_code\";N;s:7:\"address\";s:37:\"2420 Canton St. #6305 Dallas,TX 75201\";s:17:\"profile_image_url\";N;s:9:\"full_name\";s:12:\"Pierce Moore\";s:8:\"loggedin\";b:1;s:7:\"quizzes\";a:2:{i:0;O:8:\"stdClass\":7:{s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:4:\"name\";s:73:\"Patrizio Menu Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah\";s:11:\"description\";s:105:\"A test for newly hired servers at Patrizio. Covers menu, store information, table numbers, policies, etc.\";s:12:\"date_created\";s:19:\"2012-01-02 22:58:42\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:6:\"active\";s:1:\"0\";}i:1;O:8:\"stdClass\":7:{s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"1\";s:4:\"name\";s:22:\"Network+ Certification\";s:11:\"description\";s:82:\"A test covering the principles and information found in the CompTIA Network+ exam.\";s:12:\"date_created\";s:19:\"2012-01-02 22:59:23\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:6:\"active\";s:1:\"0\";}}}'),('51fd1b864adc2752fcc518454a3db3ab','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0',4294967295,''),('0d7cd632868349470020db6e1ebdc9ea','71.170.163.8','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-us) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/',4294967295,''),('f66c1a4573f817f009bffdc8ba45b9e1','69.171.224.248','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',4294967295,''),('978d5778af4c880f8a3be0dcd0705afb','93.158.147.8','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('e053f3521f2875b5dafd5911dc17ed80','93.158.147.8','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('eed889a95d0522d443692e1be7baaf55','76.183.34.193','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7',4294967295,'a:25:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:6:\"pierce\";s:14:\"login_attempts\";i:1;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:40:\"502ee11cdfb874bbd839210128553c995c3e214e\";s:9:\"user_type\";s:1:\"1\";s:6:\"active\";s:1:\"1\";s:10:\"created_on\";s:19:\"2012-01-04 22:36:29\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:18:\"facebook_connected\";N;s:24:\"registered_from_facebook\";N;s:15:\"ip_registration\";N;s:10:\"ip_current\";N;s:16:\"account_past_due\";N;s:15:\"past_due_amount\";N;s:7:\"user_id\";s:1:\"1\";s:10:\"name_first\";s:6:\"Pierce\";s:9:\"name_last\";s:5:\"Moore\";s:5:\"phone\";s:10:\"2146167264\";s:12:\"country_code\";N;s:7:\"address\";s:37:\"2420 Canton St. #6305 Dallas,TX 75201\";s:17:\"profile_image_url\";N;s:9:\"full_name\";s:12:\"Pierce Moore\";s:8:\"loggedin\";b:1;s:7:\"quizzes\";a:2:{i:0;O:8:\"stdClass\":7:{s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:4:\"name\";s:73:\"Patrizio Menu Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah\";s:11:\"description\";s:105:\"A test for newly hired servers at Patrizio. Covers menu, store information, table numbers, policies, etc.\";s:12:\"date_created\";s:19:\"2012-01-02 22:58:42\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:6:\"active\";s:1:\"0\";}i:1;O:8:\"stdClass\":7:{s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"1\";s:4:\"name\";s:22:\"Network+ Certification\";s:11:\"description\";s:82:\"A test covering the principles and information found in the CompTIA Network+ exam.\";s:12:\"date_created\";s:19:\"2012-01-02 22:59:23\";s:13:\"last_modified\";s:19:\"1994-10-02 05:22:25\";s:6:\"active\";s:1:\"0\";}}}'),('2586d695d56a721532f882ecd3d1b9b4','70.123.125.172','Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/75',4294967295,''),('9fe3b1e49da4cc100066da168300dfc0','199.21.99.76','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('d9e543e3683c27af9b9569c4ae57884e','66.249.71.21','DoCoMo/2.0 N905i(c100;TB;W24H16) (compatible; Googlebot-Mobile/2.1; +http://www.google.com/bot.html)',4294967295,''),('c44a42aba5a101a4fc5a75afddb65c89','199.21.99.76','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',4294967295,''),('44c97b680f2bfc118b3bd33446d11074','66.249.66.104','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('7f53b59ee35f1e9d3365b280b3ecbec6','66.249.71.170','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('7adbb36c5ad89c605bc45159b61aaf3d','66.249.66.104','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('5c0025e30e5ecdd67793d697ba231862','66.249.71.170','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,''),('e64f565854af9550121972d6951c6453','66.249.71.170','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',4294967295,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_question_types`
--

DROP TABLE IF EXISTS `taxonomy_question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_question_types` (
  `question_type` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`question_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_question_types`
--

LOCK TABLES `taxonomy_question_types` WRITE;
/*!40000 ALTER TABLE `taxonomy_question_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomy_question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_countries`
--

DROP TABLE IF EXISTS `taxonomy_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_countries` (
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `printable_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_countries`
--

LOCK TABLES `taxonomy_countries` WRITE;
/*!40000 ALTER TABLE `taxonomy_countries` DISABLE KEYS */;
INSERT INTO `taxonomy_countries` VALUES ('AF','AFGHANISTAN','Afghanistan','AFG',4),('AL','ALBANIA','Albania','ALB',8),('DZ','ALGERIA','Algeria','DZA',12),('AS','AMERICAN SAMOA','American Samoa','ASM',16),('AD','ANDORRA','Andorra','AND',20),('AO','ANGOLA','Angola','AGO',24),('AI','ANGUILLA','Anguilla','AIA',660),('AQ','ANTARCTICA','Antarctica',NULL,NULL),('AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ATG',28),('AR','ARGENTINA','Argentina','ARG',32),('AM','ARMENIA','Armenia','ARM',51),('AW','ARUBA','Aruba','ABW',533),('AU','AUSTRALIA','Australia','AUS',36),('AT','AUSTRIA','Austria','AUT',40),('AZ','AZERBAIJAN','Azerbaijan','AZE',31),('BS','BAHAMAS','Bahamas','BHS',44),('BH','BAHRAIN','Bahrain','BHR',48),('BD','BANGLADESH','Bangladesh','BGD',50),('BB','BARBADOS','Barbados','BRB',52),('BY','BELARUS','Belarus','BLR',112),('BE','BELGIUM','Belgium','BEL',56),('BZ','BELIZE','Belize','BLZ',84),('BJ','BENIN','Benin','BEN',204),('BM','BERMUDA','Bermuda','BMU',60),('BT','BHUTAN','Bhutan','BTN',64),('BO','BOLIVIA','Bolivia','BOL',68),('BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BIH',70),('BW','BOTSWANA','Botswana','BWA',72),('BV','BOUVET ISLAND','Bouvet Island',NULL,NULL),('BR','BRAZIL','Brazil','BRA',76),('IO','BRITISH INDIAN OCEAN TERRITORY','British Indian Ocean Territory',NULL,NULL),('BN','BRUNEI DARUSSALAM','Brunei Darussalam','BRN',96),('BG','BULGARIA','Bulgaria','BGR',100),('BF','BURKINA FASO','Burkina Faso','BFA',854),('BI','BURUNDI','Burundi','BDI',108),('KH','CAMBODIA','Cambodia','KHM',116),('CM','CAMEROON','Cameroon','CMR',120),('CA','CANADA','Canada','CAN',124),('CV','CAPE VERDE','Cape Verde','CPV',132),('KY','CAYMAN ISLANDS','Cayman Islands','CYM',136),('CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',140),('TD','CHAD','Chad','TCD',148),('CL','CHILE','Chile','CHL',152),('CN','CHINA','China','CHN',156),('CX','CHRISTMAS ISLAND','Christmas Island',NULL,NULL),('CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands',NULL,NULL),('CO','COLOMBIA','Colombia','COL',170),('KM','COMOROS','Comoros','COM',174),('CG','CONGO','Congo','COG',178),('CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','COD',180),('CK','COOK ISLANDS','Cook Islands','COK',184),('CR','COSTA RICA','Costa Rica','CRI',188),('CI','COTE D\'IVOIRE','Cote D\'Ivoire','CIV',384),('HR','CROATIA','Croatia','HRV',191),('CU','CUBA','Cuba','CUB',192),('CY','CYPRUS','Cyprus','CYP',196),('CZ','CZECH REPUBLIC','Czech Republic','CZE',203),('DK','DENMARK','Denmark','DNK',208),('DJ','DJIBOUTI','Djibouti','DJI',262),('DM','DOMINICA','Dominica','DMA',212),('DO','DOMINICAN REPUBLIC','Dominican Republic','DOM',214),('EC','ECUADOR','Ecuador','ECU',218),('EG','EGYPT','Egypt','EGY',818),('SV','EL SALVADOR','El Salvador','SLV',222),('GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',226),('ER','ERITREA','Eritrea','ERI',232),('EE','ESTONIA','Estonia','EST',233),('ET','ETHIOPIA','Ethiopia','ETH',231),('FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FLK',238),('FO','FAROE ISLANDS','Faroe Islands','FRO',234),('FJ','FIJI','Fiji','FJI',242),('FI','FINLAND','Finland','FIN',246),('FR','FRANCE','France','FRA',250),('GF','FRENCH GUIANA','French Guiana','GUF',254),('PF','FRENCH POLYNESIA','French Polynesia','PYF',258),('TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories',NULL,NULL),('GA','GABON','Gabon','GAB',266),('GM','GAMBIA','Gambia','GMB',270),('GE','GEORGIA','Georgia','GEO',268),('DE','GERMANY','Germany','DEU',276),('GH','GHANA','Ghana','GHA',288),('GI','GIBRALTAR','Gibraltar','GIB',292),('GR','GREECE','Greece','GRC',300),('GL','GREENLAND','Greenland','GRL',304),('GD','GRENADA','Grenada','GRD',308),('GP','GUADELOUPE','Guadeloupe','GLP',312),('GU','GUAM','Guam','GUM',316),('GT','GUATEMALA','Guatemala','GTM',320),('GN','GUINEA','Guinea','GIN',324),('GW','GUINEA-BISSAU','Guinea-Bissau','GNB',624),('GY','GUYANA','Guyana','GUY',328),('HT','HAITI','Haiti','HTI',332),('HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands',NULL,NULL),('VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','VAT',336),('HN','HONDURAS','Honduras','HND',340),('HK','HONG KONG','Hong Kong','HKG',344),('HU','HUNGARY','Hungary','HUN',348),('IS','ICELAND','Iceland','ISL',352),('IN','INDIA','India','IND',356),('ID','INDONESIA','Indonesia','IDN',360),('IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IRN',364),('IQ','IRAQ','Iraq','IRQ',368),('IE','IRELAND','Ireland','IRL',372),('IL','ISRAEL','Israel','ISR',376),('IT','ITALY','Italy','ITA',380),('JM','JAMAICA','Jamaica','JAM',388),('JP','JAPAN','Japan','JPN',392),('JO','JORDAN','Jordan','JOR',400),('KZ','KAZAKHSTAN','Kazakhstan','KAZ',398),('KE','KENYA','Kenya','KEN',404),('KI','KIRIBATI','Kiribati','KIR',296),('KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','PRK',408),('KR','KOREA, REPUBLIC OF','Korea, Republic of','KOR',410),('KW','KUWAIT','Kuwait','KWT',414),('KG','KYRGYZSTAN','Kyrgyzstan','KGZ',417),('LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','LAO',418),('LV','LATVIA','Latvia','LVA',428),('LB','LEBANON','Lebanon','LBN',422),('LS','LESOTHO','Lesotho','LSO',426),('LR','LIBERIA','Liberia','LBR',430),('LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LBY',434),('LI','LIECHTENSTEIN','Liechtenstein','LIE',438),('LT','LITHUANIA','Lithuania','LTU',440),('LU','LUXEMBOURG','Luxembourg','LUX',442),('MO','MACAO','Macao','MAC',446),('MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MKD',807),('MG','MADAGASCAR','Madagascar','MDG',450),('MW','MALAWI','Malawi','MWI',454),('MY','MALAYSIA','Malaysia','MYS',458),('MV','MALDIVES','Maldives','MDV',462),('ML','MALI','Mali','MLI',466),('MT','MALTA','Malta','MLT',470),('MH','MARSHALL ISLANDS','Marshall Islands','MHL',584),('MQ','MARTINIQUE','Martinique','MTQ',474),('MR','MAURITANIA','Mauritania','MRT',478),('MU','MAURITIUS','Mauritius','MUS',480),('YT','MAYOTTE','Mayotte',NULL,NULL),('MX','MEXICO','Mexico','MEX',484),('FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FSM',583),('MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','MDA',498),('MC','MONACO','Monaco','MCO',492),('MN','MONGOLIA','Mongolia','MNG',496),('MS','MONTSERRAT','Montserrat','MSR',500),('MA','MOROCCO','Morocco','MAR',504),('MZ','MOZAMBIQUE','Mozambique','MOZ',508),('MM','MYANMAR','Myanmar','MMR',104),('NA','NAMIBIA','Namibia','NAM',516),('NR','NAURU','Nauru','NRU',520),('NP','NEPAL','Nepal','NPL',524),('NL','NETHERLANDS','Netherlands','NLD',528),('AN','NETHERLANDS ANTILLES','Netherlands Antilles','ANT',530),('NC','NEW CALEDONIA','New Caledonia','NCL',540),('NZ','NEW ZEALAND','New Zealand','NZL',554),('NI','NICARAGUA','Nicaragua','NIC',558),('NE','NIGER','Niger','NER',562),('NG','NIGERIA','Nigeria','NGA',566),('NU','NIUE','Niue','NIU',570),('NF','NORFOLK ISLAND','Norfolk Island','NFK',574),('MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MNP',580),('NO','NORWAY','Norway','NOR',578),('OM','OMAN','Oman','OMN',512),('PK','PAKISTAN','Pakistan','PAK',586),('PW','PALAU','Palau','PLW',585),('PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied',NULL,NULL),('PA','PANAMA','Panama','PAN',591),('PG','PAPUA NEW GUINEA','Papua New Guinea','PNG',598),('PY','PARAGUAY','Paraguay','PRY',600),('PE','PERU','Peru','PER',604),('PH','PHILIPPINES','Philippines','PHL',608),('PN','PITCAIRN','Pitcairn','PCN',612),('PL','POLAND','Poland','POL',616),('PT','PORTUGAL','Portugal','PRT',620),('PR','PUERTO RICO','Puerto Rico','PRI',630),('QA','QATAR','Qatar','QAT',634),('RE','REUNION','Reunion','REU',638),('RO','ROMANIA','Romania','ROM',642),('RU','RUSSIAN FEDERATION','Russian Federation','RUS',643),('RW','RWANDA','Rwanda','RWA',646),('SH','SAINT HELENA','Saint Helena','SHN',654),('KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KNA',659),('LC','SAINT LUCIA','Saint Lucia','LCA',662),('PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','SPM',666),('VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VCT',670),('WS','SAMOA','Samoa','WSM',882),('SM','SAN MARINO','San Marino','SMR',674),('ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','STP',678),('SA','SAUDI ARABIA','Saudi Arabia','SAU',682),('SN','SENEGAL','Senegal','SEN',686),('CS','SERBIA AND MONTENEGRO','Serbia and Montenegro',NULL,NULL),('SC','SEYCHELLES','Seychelles','SYC',690),('SL','SIERRA LEONE','Sierra Leone','SLE',694),('SG','SINGAPORE','Singapore','SGP',702),('SK','SLOVAKIA','Slovakia','SVK',703),('SI','SLOVENIA','Slovenia','SVN',705),('SB','SOLOMON ISLANDS','Solomon Islands','SLB',90),('SO','SOMALIA','Somalia','SOM',706),('ZA','SOUTH AFRICA','South Africa','ZAF',710),('GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands',NULL,NULL),('ES','SPAIN','Spain','ESP',724),('LK','SRI LANKA','Sri Lanka','LKA',144),('SD','SUDAN','Sudan','SDN',736),('SR','SURINAME','Suriname','SUR',740),('SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJM',744),('SZ','SWAZILAND','Swaziland','SWZ',748),('SE','SWEDEN','Sweden','SWE',752),('CH','SWITZERLAND','Switzerland','CHE',756),('SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SYR',760),('TW','TAIWAN, PROVINCE OF CHINA','Taiwan, Province of China','TWN',158),('TJ','TAJIKISTAN','Tajikistan','TJK',762),('TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZA',834),('TH','THAILAND','Thailand','THA',764),('TL','TIMOR-LESTE','Timor-Leste',NULL,NULL),('TG','TOGO','Togo','TGO',768),('TK','TOKELAU','Tokelau','TKL',772),('TO','TONGA','Tonga','TON',776),('TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','TTO',780),('TN','TUNISIA','Tunisia','TUN',788),('TR','TURKEY','Turkey','TUR',792),('TM','TURKMENISTAN','Turkmenistan','TKM',795),('TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TCA',796),('TV','TUVALU','Tuvalu','TUV',798),('UG','UGANDA','Uganda','UGA',800),('UA','UKRAINE','Ukraine','UKR',804),('AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',784),('GB','UNITED KINGDOM','United Kingdom','GBR',826),('US','UNITED STATES','United States','USA',840),('UM','UNITED STATES MINOR OUTLYING ISLANDS','United States Minor Outlying Islands',NULL,NULL),('UY','URUGUAY','Uruguay','URY',858),('UZ','UZBEKISTAN','Uzbekistan','UZB',860),('VU','VANUATU','Vanuatu','VUT',548),('VE','VENEZUELA','Venezuela','VEN',862),('VN','VIET NAM','Viet Nam','VNM',704),('VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VGB',92),('VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VIR',850),('WF','WALLIS AND FUTUNA','Wallis and Futuna','WLF',876),('EH','WESTERN SAHARA','Western Sahara','ESH',732),('YE','YEMEN','Yemen','YEM',887),('ZM','ZAMBIA','Zambia','ZMB',894),('ZW','ZIMBABWE','Zimbabwe','ZWE',716);
/*!40000 ALTER TABLE `taxonomy_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzers_info`
--

DROP TABLE IF EXISTS `quizzers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzers_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `name_first` text,
  `name_last` text,
  `phone` varchar(20) DEFAULT NULL,
  `country_code` text,
  `address` varchar(150) DEFAULT NULL,
  `profile_image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzers_info`
--

LOCK TABLES `quizzers_info` WRITE;
/*!40000 ALTER TABLE `quizzers_info` DISABLE KEYS */;
INSERT INTO `quizzers_info` VALUES (1,1,'Pierce','Moore','2146167264',NULL,'2420 Canton St. #6305 Dallas,TX 75201',NULL);
/*!40000 ALTER TABLE `quizzers_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-19 17:32:09
