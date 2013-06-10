-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rockstar2
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add rs user',8,'add_rsuser'),(23,'Can change rs user',8,'change_rsuser'),(24,'Can delete rs user',8,'delete_rsuser'),(25,'Can add stars',9,'add_stars'),(26,'Can change stars',9,'change_stars'),(27,'Can delete stars',9,'delete_stars'),(28,'Can add nonce',10,'add_nonce'),(29,'Can change nonce',10,'change_nonce'),(30,'Can delete nonce',10,'delete_nonce'),(31,'Can add association',11,'add_association'),(32,'Can change association',11,'change_association'),(33,'Can delete association',11,'delete_association'),(34,'Can add user open id',12,'add_useropenid'),(35,'Can change user open id',12,'change_useropenid'),(36,'Can delete user open id',12,'delete_useropenid');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'rockstar','','','rockstar@nor1.com','pbkdf2_sha256$10000$GBr1TXjVLF64$lWrGoHmtJJzpx8Esd+rummA4Yx+Y2n5ywmVTgyz3SEc=',1,1,1,'2013-05-31 17:49:40','2013-05-31 05:12:15'),(7,'radha.dharmaraajan@nor1.com','','','','pbkdf2_sha256$10000$ARiYSqZGS1Uj$4oeOfLtoKbL1rCq0fNZ6exkG3N3sAX94cqvVjtb+NbA=',0,1,0,'2013-05-31 17:51:53','2013-05-31 17:51:53'),(8,'morteza.shahram@nor1.com','','','','pbkdf2_sha256$10000$H68Es21ZUS6m$h8r7soIuWAOEAk6erotP/bSHf66J+ijD9IkJ55Z1fSs=',0,1,0,'2013-05-31 18:52:00','2013-05-31 17:52:18'),(9,'amir.amidi@nor1.com','','','','pbkdf2_sha256$10000$tULZuHRCgcqT$1F1xKqGK5ijD/tBP7SIVFiwKbivpn9Kw/ZRwf2t0yIA=',0,1,0,'2013-05-31 17:52:31','2013-05-31 17:52:31'),(10,'jill.garcia@nor1.com','','','','pbkdf2_sha256$10000$bP7N6fO1MEg9$8+1gETNMERwEdytCshd4CKVrXV8BN//Xi13N/biF4Mw=',0,1,0,'2013-05-31 17:52:41','2013-05-31 17:52:41'),(11,'roshan.naik@nor1.com','','','','pbkdf2_sha256$10000$8KJoPgdc1I1Q$Ls+FMa9UNQ3YzZXOVK8mHAJUOTpNCdQLqIYQNWd0DXc=',0,1,0,'2013-05-31 17:52:57','2013-05-31 17:52:57'),(12,'mohammad.shoeybi@nor1.com','','','','pbkdf2_sha256$10000$VN3MyueaMdwT$6VSxZh6ejFZocyQSIRk6cq+VGG9AysV+1CgSQHy7iZ4=',0,1,0,'2013-05-31 17:53:13','2013-05-31 17:53:13'),(13,'reza.bahadi@nor1.com','','','','pbkdf2_sha256$10000$W5KeaAzdB2XZ$iDPa6RYcd8gO2yweU634LgZ9oofP7laCsSA3rkqr+SI=',0,1,0,'2013-05-31 17:53:40','2013-05-31 17:53:40'),(14,'radha2@nor1.com','','','','pbkdf2_sha256$10000$GA2vN6mZuFXX$hUnstatisQdTYFjLBqYE3HXjWP7Jqi+VpyojI9QHYj0=',0,1,0,'2013-05-31 18:15:15','2013-05-31 18:09:02'),(15,'radha3@nor1.com','','','','pbkdf2_sha256$10000$TCpMwDyuD3w6$rE6kuBtOvE/AT8AZCYTQiDng+RZUeeUWIL789VpvzBg=',0,1,0,'2013-05-31 18:09:17','2013-05-31 18:09:17');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-05-31 05:23:48',1,3,'2','mammad',1,''),(2,'2013-05-31 05:24:04',1,3,'3','Radha',1,''),(3,'2013-05-31 06:00:49',1,3,'4','radha2@nor1.com',1,''),(4,'2013-05-31 06:00:55',1,3,'4','radha2@nor1.com',2,'Changed password.'),(5,'2013-05-31 06:01:19',1,8,'1','radha2@nor1.com',1,''),(6,'2013-05-31 13:28:59',1,3,'5','radha3@nor1.com',1,''),(7,'2013-05-31 13:29:08',1,8,'2','radha3@nor1.com',1,''),(8,'2013-05-31 17:43:41',1,3,'2','mammad',3,''),(9,'2013-05-31 17:43:41',1,3,'3','Radha',3,''),(10,'2013-05-31 17:44:22',1,9,'16','Stars object',3,''),(11,'2013-05-31 17:44:22',1,9,'15','Stars object',3,''),(12,'2013-05-31 17:44:22',1,9,'14','Stars object',3,''),(13,'2013-05-31 17:44:22',1,9,'13','Stars object',3,''),(14,'2013-05-31 17:44:22',1,9,'12','Stars object',3,''),(15,'2013-05-31 17:44:22',1,9,'11','Stars object',3,''),(16,'2013-05-31 17:44:22',1,9,'10','Stars object',3,''),(17,'2013-05-31 17:44:22',1,9,'9','Stars object',3,''),(18,'2013-05-31 17:44:22',1,9,'8','Stars object',3,''),(19,'2013-05-31 17:44:22',1,9,'7','Stars object',3,''),(20,'2013-05-31 17:44:22',1,9,'6','Stars object',3,''),(21,'2013-05-31 17:44:22',1,9,'5','Stars object',3,''),(22,'2013-05-31 17:44:22',1,9,'4','Stars object',3,''),(23,'2013-05-31 17:44:22',1,9,'3','Stars object',3,''),(24,'2013-05-31 17:44:22',1,9,'2','Stars object',3,''),(25,'2013-05-31 17:44:22',1,9,'1','Stars object',3,''),(26,'2013-05-31 17:44:49',1,3,'6','test@test.com',1,''),(27,'2013-05-31 17:44:54',1,3,'6','test@test.com',2,'Changed password.'),(28,'2013-05-31 17:45:31',1,8,'3','test@test.com',1,''),(29,'2013-05-31 17:47:15',1,9,'17','Stars object',1,''),(30,'2013-05-31 17:50:18',1,3,'6','test@test.com',3,''),(31,'2013-05-31 17:51:53',1,3,'7','radha.dharmaraajan@nor1.com',1,''),(32,'2013-05-31 17:52:00',1,3,'7','radha.dharmaraajan@nor1.com',2,'Changed password.'),(33,'2013-05-31 17:52:18',1,3,'8','morteza.shahram@nor1.com',1,''),(34,'2013-05-31 17:52:31',1,3,'9','amir.amidi@nor1.com',1,''),(35,'2013-05-31 17:52:41',1,3,'10','jill.garcia',1,''),(36,'2013-05-31 17:52:58',1,3,'11','roshan.naik@nor1.com',1,''),(37,'2013-05-31 17:53:14',1,3,'12','mohammad.shoeybi@nor1.com',1,''),(38,'2013-05-31 17:53:40',1,3,'13','reza.bahadi@nor1.com',1,''),(39,'2013-05-31 17:54:02',1,9,'18','Stars object',3,''),(40,'2013-05-31 17:54:34',1,8,'4','radha.dharmaraajan@nor1.com',1,''),(41,'2013-05-31 17:54:41',1,8,'5','morteza.shahram@nor1.com',1,''),(42,'2013-05-31 17:54:50',1,8,'6','amir.amidi@nor1.com',1,''),(43,'2013-05-31 17:55:08',1,8,'7','reza.bahadi@nor1.com',1,''),(44,'2013-05-31 17:55:14',1,8,'8','mohammad.shoeybi@nor1.com',1,''),(45,'2013-05-31 17:55:37',1,8,'9','jill.garcia',1,''),(46,'2013-05-31 17:55:46',1,8,'10','roshan.naik@nor1.com',1,''),(47,'2013-05-31 17:57:29',1,3,'10','jill.garcia@nor1.com',2,'Changed username and password.'),(48,'2013-05-31 18:02:50',1,9,'20','Stars object',1,''),(49,'2013-05-31 18:03:05',1,9,'21','Stars object',1,''),(50,'2013-05-31 18:03:22',1,9,'22','Stars object',1,''),(51,'2013-05-31 18:03:36',1,9,'23','Stars object',1,''),(52,'2013-05-31 18:03:51',1,9,'24','Stars object',1,''),(53,'2013-05-31 18:04:06',1,9,'25','Stars object',1,''),(54,'2013-05-31 18:04:17',1,9,'26','Stars object',1,''),(55,'2013-05-31 18:04:29',1,9,'27','Stars object',1,''),(56,'2013-05-31 18:04:43',1,9,'28','Stars object',1,''),(57,'2013-05-31 18:04:53',1,9,'29','Stars object',1,''),(58,'2013-05-31 18:05:03',1,9,'30','Stars object',1,''),(59,'2013-05-31 18:05:12',1,9,'31','Stars object',1,''),(60,'2013-05-31 18:05:22',1,9,'32','Stars object',1,''),(61,'2013-05-31 18:05:32',1,9,'33','Stars object',1,''),(62,'2013-05-31 18:07:10',1,3,'4','radha2@nor1.com',3,''),(63,'2013-05-31 18:07:10',1,3,'5','radha3@nor1.com',3,''),(64,'2013-05-31 18:09:02',1,3,'14','radha2@nor1.com',1,''),(65,'2013-05-31 18:09:17',1,3,'15','radha3@nor1.com',1,''),(66,'2013-05-31 18:09:40',1,8,'11','radha2@nor1.com',1,''),(67,'2013-05-31 18:09:50',1,8,'12','radha3@nor1.com',1,''),(68,'2013-05-31 18:14:07',1,9,'34','Stars object',1,''),(69,'2013-05-31 18:14:23',1,9,'35','Stars object',1,''),(70,'2013-05-31 18:20:07',1,9,'36','Stars object',1,''),(71,'2013-05-31 18:20:34',1,9,'37','Stars object',1,''),(72,'2013-05-31 18:21:24',1,9,'38','Stars object',1,''),(73,'2013-05-31 18:28:03',1,9,'39','Stars object',1,''),(74,'2013-05-31 18:29:26',1,9,'38','Stars object',3,''),(75,'2013-05-31 18:29:26',1,9,'37','Stars object',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'rs user','rsuser','rsuser'),(9,'stars','rsuser','stars'),(10,'nonce','django_openid_auth','nonce'),(11,'association','django_openid_auth','association'),(12,'user open id','django_openid_auth','useropenid');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_association`
--

DROP TABLE IF EXISTS `django_openid_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_association`
--

LOCK TABLES `django_openid_auth_association` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_nonce`
--

DROP TABLE IF EXISTS `django_openid_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(2047) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_nonce`
--

LOCK TABLES `django_openid_auth_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_useropenid`
--

DROP TABLE IF EXISTS `django_openid_auth_useropenid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_useropenid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `claimed_id` varchar(255) NOT NULL,
  `display_id` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `claimed_id` (`claimed_id`),
  KEY `django_openid_auth_useropenid_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_be7162f0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_useropenid`
--

LOCK TABLES `django_openid_auth_useropenid` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_auth_useropenid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e1u8sa3g3g4xykgwrpdjzb9b80anda26','NTY1NDBhMDM4NTM2NGM0ZGRkYzA2ODg3MDg3NzliOWJkZWU1ZTU5MjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==','2013-06-14 18:52:00'),('f5h0rj2w0awyp34g0j9jjfakicwvvwgz','ZWNlYmM1MjNiYmY1Yzk3ZTQwZTYzMTZkMjI1NzYwYzUyNzg3NGIwZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQR1Lg==','2013-06-14 16:12:48'),('frpt7lj45no7r7xbcsky0o04bf7rgp5i','ZmM1YTg2ZDM4NmMyMTRhY2M4OGVkMmU1ZmU0YWRiYmEzZjkwYTIzZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQ51Lg==','2013-06-14 18:15:15'),('pm6hwj7nxaj5goy38s85esrauvzer1or','YmVkNWViY2NiYzAwNDQxMzViYmYzNTY0ODcxMjkzMjgwMWIyYmU3NTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-06-14 16:08:27'),('vdu5k2c32wb016sswds2pfb7mrfysrl7','Y2U0MWIzNTczOTYyNjQxMjIzM2IzYzAwY2QxNTAyY2IzYzZhZGU0YTqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==','2013-06-14 17:50:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsuser_rsuser`
--

DROP TABLE IF EXISTS `rsuser_rsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rsuser_rsuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `starsEarned` int(11) NOT NULL,
  `starsAvail` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_3fc19146` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsuser_rsuser`
--

LOCK TABLES `rsuser_rsuser` WRITE;
/*!40000 ALTER TABLE `rsuser_rsuser` DISABLE KEYS */;
INSERT INTO `rsuser_rsuser` VALUES (4,7,41,100),(5,8,0,59),(6,9,0,100),(7,13,1,100),(8,12,0,100),(9,10,0,100),(10,11,0,100),(11,14,0,100),(12,15,0,100);
/*!40000 ALTER TABLE `rsuser_rsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsuser_stars`
--

DROP TABLE IF EXISTS `rsuser_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rsuser_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `giver` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `awardedstars` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsuser_stars`
--

LOCK TABLES `rsuser_stars` WRITE;
/*!40000 ALTER TABLE `rsuser_stars` DISABLE KEYS */;
INSERT INTO `rsuser_stars` VALUES (20,13,12,7,'2013-05-31 11:02:39'),(21,7,12,15,'2013-05-31 11:03:01'),(22,8,7,8,'2013-05-31 11:03:18'),(23,13,11,11,'2013-05-31 11:03:33'),(24,10,13,7,'2013-05-31 11:03:48'),(25,9,12,12,'2013-05-31 11:04:01'),(26,7,10,12,'2013-05-31 11:04:13'),(27,8,12,8,'2013-05-31 11:04:25'),(28,9,13,8,'2013-05-31 11:04:37'),(29,13,10,5,'2013-05-31 11:04:50'),(30,10,9,13,'2013-05-31 11:04:59'),(31,12,11,13,'2013-05-31 11:05:09'),(32,8,12,2,'2013-05-31 11:05:18'),(33,13,7,10,'2013-05-31 11:05:28'),(34,14,7,1,'2013-05-31 11:14:02'),(35,15,11,10,'2013-05-31 11:14:19'),(36,13,10,20,'2013-05-31 11:20:04'),(39,10,12,20,'2013-05-31 11:27:58'),(40,8,7,1,'2013-05-31 18:41:00'),(41,8,7,40,'2013-05-31 18:52:23');
/*!40000 ALTER TABLE `rsuser_stars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-10 21:41:22
