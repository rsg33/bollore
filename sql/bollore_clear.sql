-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bollore
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add номер кузова',7,'add_bodies'),(26,'Can change номер кузова',7,'change_bodies'),(27,'Can delete номер кузова',7,'delete_bodies'),(28,'Can view номер кузова',7,'view_bodies'),(29,'Can add дефект',8,'add_defects'),(30,'Can change дефект',8,'change_defects'),(31,'Can delete дефект',8,'delete_defects'),(32,'Can view дефект',8,'view_defects'),(33,'Can add деталь',9,'add_details'),(34,'Can change деталь',9,'change_details'),(35,'Can delete деталь',9,'delete_details'),(36,'Can view деталь',9,'view_details'),(37,'Can add приоритет дефекта',10,'add_priority'),(38,'Can change приоритет дефекта',10,'change_priority'),(39,'Can delete приоритет дефекта',10,'delete_priority'),(40,'Can view приоритет дефекта',10,'view_priority'),(41,'Can add оценка вероятности',11,'add_probabilityestimate'),(42,'Can change оценка вероятности',11,'change_probabilityestimate'),(43,'Can delete оценка вероятности',11,'delete_probabilityestimate'),(44,'Can view оценка вероятности',11,'view_probabilityestimate'),(45,'Can add масштаб последствий',12,'add_scaleofconsequences'),(46,'Can change масштаб последствий',12,'change_scaleofconsequences'),(47,'Can delete масштаб последствий',12,'delete_scaleofconsequences'),(48,'Can view масштаб последствий',12,'view_scaleofconsequences'),(49,'Can add статус дефекта',13,'add_status'),(50,'Can change статус дефекта',13,'change_status'),(51,'Can delete статус дефекта',13,'delete_status'),(52,'Can view статус дефекта',13,'view_status'),(53,'Can add цех',14,'add_workshops'),(54,'Can change цех',14,'change_workshops'),(55,'Can delete цех',14,'delete_workshops'),(56,'Can view цех',14,'view_workshops'),(57,'Can add тип несоответствия',15,'add_typeofmismatch'),(58,'Can change тип несоответствия',15,'change_typeofmismatch'),(59,'Can delete тип несоответствия',15,'delete_typeofmismatch'),(60,'Can view тип несоответствия',15,'view_typeofmismatch'),(61,'Can add фото',16,'add_photodefects'),(62,'Can change фото',16,'change_photodefects'),(63,'Can delete фото',16,'delete_photodefects'),(64,'Can view фото',16,'view_photodefects');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$6U9tStSINJoTWmPECaYLAJ$MOIsgd1CxOlW5sDZcdK6W1JqyX/ABytWgFVx0K4tDMI=','2021-09-14 12:36:13.000000',1,'rsg','Сергей','Рубцов','rsg81@ya.ru',1,1,'2021-09-14 12:34:22.000000'),(2,'pbkdf2_sha256$260000$bG7Ud6xY4Jwmf22ywKFVgz$TVF7O+emeUYBJ3TaJFr+W2DSAmGdG+TbPks10iJA0i0=',NULL,0,'i.kulakova','Ирина','Кулакова','i.kulakova@bakulingroup.ru',0,1,'2021-09-14 13:00:11.000000'),(3,'pbkdf2_sha256$260000$aApyi1ktrQt3GVCztcjAWP$lFHd9i3yqeaQfIogEkYl7x5KRfCKywZ33NQ7H6z/ZCs=',NULL,0,'d.bichenok','Дмитрий','Быченок','d.bichenok@bakulingroup.ru',0,1,'2021-09-14 13:01:20.000000'),(4,'pbkdf2_sha256$260000$aAydBJIojlNfI7sbmzbGrl$1i6VnGyuUlnSumnEKQN5NV/r2MeJwImdHO/+xOINUjU=',NULL,0,'a.zaicev','Андрей','Зайцев','a.zaicev@bakulingroup.ru',0,1,'2021-09-14 13:02:14.000000'),(5,'pbkdf2_sha256$260000$jqmDdVpI5buhMHA1f89ZMF$pnY1Cffu6YDkSUsuGIoQUOSkc+9Cvxe3yapiEms/9Aw=',NULL,0,'s.klochkov','Сергей','Клочков','s.klachkov@bakulingroup.ru',0,1,'2021-09-14 13:03:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_bodies`
--

DROP TABLE IF EXISTS `defects_bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_bodies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body_number` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `body_number` (`body_number`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_bodies`
--

LOCK TABLES `defects_bodies` WRITE;
/*!40000 ALTER TABLE `defects_bodies` DISABLE KEYS */;
INSERT INTO `defects_bodies` VALUES (1,'00006'),(2,'00007'),(3,'00008'),(4,'00009'),(5,'00010'),(6,'00011'),(7,'00012'),(8,'00013'),(9,'00014'),(10,'00015'),(11,'00016'),(12,'00017'),(13,'00018'),(14,'00019'),(15,'00020'),(16,'00021'),(17,'00022'),(18,'00023'),(19,'00024'),(20,'00025'),(21,'00026'),(22,'00027'),(23,'00028'),(24,'00029'),(25,'00030'),(26,'00031'),(27,'00032'),(28,'00033'),(29,'00034'),(30,'00035'),(31,'00036'),(32,'00037'),(33,'00038'),(34,'00039'),(35,'00040'),(36,'00041'),(37,'00042'),(38,'00043'),(39,'00044'),(40,'00045'),(41,'00046'),(42,'00047'),(43,'00048'),(44,'00049'),(45,'00050'),(46,'00051'),(47,'00052'),(48,'00053'),(49,'00054'),(50,'00055'),(51,'00056'),(52,'00057'),(53,'00058'),(54,'TS 34'),(55,'TS 35'),(56,'TS 36'),(57,'TS 37'),(58,'TS 38'),(59,'TS 39'),(60,'TS 40'),(61,'TS 41'),(62,'TS 42'),(63,'TS 43'),(64,'TS 44'),(65,'TS 45'),(66,'TS 46'),(67,'TS 47'),(68,'TS 48'),(69,'TS 49'),(70,'TS 50'),(71,'TS 51'),(72,'TS 52'),(73,'TS 53'),(74,'TS 54'),(75,'TS 55'),(76,'TS 56'),(77,'TS 57'),(78,'TS 58'),(79,'TS 59'),(80,'TS 60'),(81,'TS 61'),(82,'TS 62'),(83,'TS 63'),(84,'TS 64'),(85,'TS 65'),(86,'TS 66'),(87,'TS 67'),(88,'TS 68'),(89,'TS 69'),(90,'TS 70'),(91,'TS 71'),(92,'TS 72'),(93,'TS 73'),(94,'TS 74'),(95,'TS 75'),(96,'TS 76'),(97,'TS 77'),(98,'TS 78'),(99,'TS 79'),(100,'TS 80'),(101,'TS 81'),(102,'TS 82'),(103,'TS 83'),(104,'TS 84'),(105,'TS 85'),(106,'TS 86'),(107,'TS 87'),(108,'TS 88'),(109,'TS 89'),(110,'TS 90'),(111,'TS 91'),(112,'TS 92'),(113,'TS 93'),(114,'TS 94'),(115,'TS 95'),(116,'TS 96'),(117,'TS 97'),(118,'TS 98');
/*!40000 ALTER TABLE `defects_bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_defects`
--

DROP TABLE IF EXISTS `defects_defects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_defects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `date_defect_detection` date NOT NULL,
  `term_up_to` datetime(6) NOT NULL,
  `number_of_inconsistencies` int(11) NOT NULL,
  `discrepancy_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_number_id` bigint(20) NOT NULL,
  `detail_id` bigint(20) DEFAULT NULL,
  `priority_id` bigint(20) NOT NULL,
  `quality_controller_id` int(11) DEFAULT NULL,
  `responsible_executor_id` int(11) DEFAULT NULL,
  `status_id` bigint(20) NOT NULL,
  `type_of_discrepancy_id` bigint(20) NOT NULL,
  `workshop_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `defects_defects_detail_id_4ce7820b_fk_defects_details_id` (`detail_id`),
  KEY `defects_defects_priority_id_7c57cbfc_fk_defects_priority_id` (`priority_id`),
  KEY `defects_defects_quality_controller_id_9c10eee9_fk_auth_user_id` (`quality_controller_id`),
  KEY `defects_defects_responsible_executor_id_75596e44_fk_auth_user_id` (`responsible_executor_id`),
  KEY `defects_defects_status_id_75d4901f_fk_defects_status_id` (`status_id`),
  KEY `defects_defects_type_of_discrepancy__d40f5e18_fk_defects_t` (`type_of_discrepancy_id`),
  KEY `defects_defects_workshop_id_0a3c4502_fk_defects_workshops_id` (`workshop_id`),
  KEY `defects_defects_body_number_id_acfa2b8b_fk_defects_bodies_id` (`body_number_id`),
  CONSTRAINT `defects_defects_body_number_id_acfa2b8b_fk_defects_bodies_id` FOREIGN KEY (`body_number_id`) REFERENCES `defects_bodies` (`id`),
  CONSTRAINT `defects_defects_detail_id_4ce7820b_fk_defects_details_id` FOREIGN KEY (`detail_id`) REFERENCES `defects_details` (`id`),
  CONSTRAINT `defects_defects_priority_id_7c57cbfc_fk_defects_priority_id` FOREIGN KEY (`priority_id`) REFERENCES `defects_priority` (`id`),
  CONSTRAINT `defects_defects_quality_controller_id_9c10eee9_fk_auth_user_id` FOREIGN KEY (`quality_controller_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `defects_defects_responsible_executor_id_75596e44_fk_auth_user_id` FOREIGN KEY (`responsible_executor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `defects_defects_status_id_75d4901f_fk_defects_status_id` FOREIGN KEY (`status_id`) REFERENCES `defects_status` (`id`),
  CONSTRAINT `defects_defects_type_of_discrepancy__d40f5e18_fk_defects_t` FOREIGN KEY (`type_of_discrepancy_id`) REFERENCES `defects_typeofmismatch` (`id`),
  CONSTRAINT `defects_defects_workshop_id_0a3c4502_fk_defects_workshops_id` FOREIGN KEY (`workshop_id`) REFERENCES `defects_workshops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_defects`
--

LOCK TABLES `defects_defects` WRITE;
/*!40000 ALTER TABLE `defects_defects` DISABLE KEYS */;
/*!40000 ALTER TABLE `defects_defects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_details`
--

DROP TABLE IF EXISTS `defects_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article` (`article`)
) ENGINE=InnoDB AUTO_INCREMENT=1637 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_details`
--

LOCK TABLES `defects_details` WRITE;
/*!40000 ALTER TABLE `defects_details` DISABLE KEYS */;
INSERT INTO `defects_details` VALUES (1,'U159118AA','Уголок'),(2,'U152530AA','Накладка'),(3,'U156727AB','Кронштейн'),(4,'U156904AB','Раскос'),(5,'U152161AA','Заклепка резьбовая М10 шестигранная Rivelit AM10 HS13.1 IN1040'),(6,'U169398AA','Профиль'),(7,'U157062AB','Швеллер'),(8,'U160802AA','Уголок'),(9,'U158788AA','Швеллер'),(10,'U157011AA','Ребро'),(11,'U155098AB','Профиль в сборе'),(12,'U159339AA','Накладка'),(13,'U159751AA','Уголок'),(14,'U156455AA','Облицовка люка в сборе'),(15,'U158402AA','Раскос'),(16,'U152184AB','Кронштейн'),(17,'U160981AB','Раскос'),(18,'U148273AC','Профиль'),(19,'U155354AC','Профиль'),(20,'U150135AA','Раскос'),(21,'U150380AB','Профиль 50х50х3'),(22,'U155338AC','Стойка'),(23,'U159627AA','Раскос'),(24,'U179690AA','Пруток'),(25,'U157327AC','Профиль 40х40х3'),(26,'U160974AA','Раскос'),(27,'U155477AE','Облицовка'),(28,'U159304AA','Стойка'),(29,'U152667AB','Швеллер'),(30,'U159535AA','Профиль'),(31,'U152868AC','Кронштейн'),(32,'U165380AB','Короб в сборе'),(33,'U160470AB','Кронштейн в сборе'),(34,'U162746AA','Усиление'),(35,'U158898AC','Опора'),(36,'U158983AB','Пластина'),(37,'U159116AA','Кронштейн крепления АКБ в сборе'),(38,'U156485AA','Профиль'),(39,'U158572AA','Кронштейн'),(40,'U166019AA','Лист привязки труб каркаса кузова'),(41,'U152668AA','Заглушка'),(42,'U150912AA','Кронштейн в сборе'),(43,'U149838AH','Пол кабины водителя'),(44,'U156732AA','Кронштейн'),(45,'U159570AA','Раскос'),(46,'U156949AB','Уголок'),(47,'U168478AA','Швеллер'),(48,'U152246AA','Профиль'),(49,'U159282AA','Пластина'),(50,'U157617AC','Раскос'),(51,'U160303AA','Панель'),(52,'BMG-U164860AA-001','Ребро'),(53,'U152105AA','Кронштейн'),(54,'U151100AA','Накладка'),(55,'U157713AC','Профиль в сборе'),(56,'U156416AB','Швеллер левый'),(57,'U155512AD','Накладка'),(58,'U148266AA','Профиль'),(59,'U159898AD','Установка приварных элементов пола и подиума задней части'),(60,'U153987AA','Профиль'),(61,'U156684AA','Заглушка профиля порога'),(62,'U156853AB','Усиление крепления бачка'),(63,'U158386AA','Раскос в сборе'),(64,'U163215AA','Профиль в сборе'),(65,'U161090AA','Раскос'),(66,'U149291AB','Плита'),(67,'U168350AA','Кронштейн кондиционера кабины водителя в сборе'),(68,'U159705AB','Швеллер'),(69,'U159515AB','Профиль'),(70,'U158105AA','Раскос'),(71,'U159924AB','Косынка'),(72,'U160865AB','Ребро'),(73,'U181453AA','Швеллер'),(74,'U179711AA','Стойка в сборе'),(75,'U153054AA','Кронштейн в сборе'),(76,'U157856AB','Ребро'),(77,'U157131AA','Профиль горизонтальный'),(78,'U150745AA','Пластина'),(79,'U158174AC','Дно'),(80,'U152939AA','Раскос'),(81,'U158877AB','Профиль'),(82,'U157277AB','Кронштейн в сборе'),(83,'U154006AC','Патрубки в сборе'),(84,'U154678AA','Профиль'),(85,'U152820AA','Планка'),(86,'U154205AB','Профиль'),(87,'U159385AB','Кронштейн'),(88,'U154431AA','Накладка'),(89,'U150650AB','Швеллер опорный'),(90,'U160272AB','Накладка'),(91,'U152147AI','Каркас пола кабины водителя'),(92,'U159563AB','Швеллер'),(93,'U155872AD','Накладка в сборе'),(94,'U155586AA','Лист герметизации'),(95,'U154280AB','Ребро'),(96,'U154286AB','Ребро'),(97,'U159714AB','Швеллер'),(98,'U161076AA','Пластина'),(99,'U159548AA','Скоба'),(100,'U157795AA','Пластина опоры'),(101,'U155125AA','Пластина в сборе'),(102,'U156602AB','Профиль'),(103,'U155263AC','Заглушка в сборе'),(104,'U157684AB','Швеллер'),(105,'U155955AA','Раскос'),(106,'U155894AC','Накладка'),(107,'U165927AA','Панель герметизации'),(108,'U160945AB','Уголок'),(109,'U159989AG','Каркас задка'),(110,'U155076AA','Профиль усилительный'),(111,'U157612AB','Профиль'),(112,'U180940AB','Лист облицовки'),(113,'U167714AA','Кронштейн'),(114,'U160074AA','Накладка'),(115,'U156446AA','Профиль'),(116,'U159610AA','Раскос'),(117,'U151060AA','Раскос'),(118,'U160511AA','Стойка'),(119,'U155360AB','Уголок'),(120,'U152098AC','Профиль'),(121,'U158783AB','Заглушка'),(122,'U160601AC','Панель облицовки'),(123,'U159734AB','Профиль'),(124,'U157852AB','Профиль'),(125,'U159740AA','Кронштейн'),(126,'U158790AE','Стойка'),(127,'U158839AE','Стойка в сборе'),(128,'U155016AA','Кронштейн в сборе'),(129,'U160547AA','Раскос'),(130,'U151137AA','Кронштейн рамки радиатора'),(131,'U158951AA','Кронштейн'),(132,'U160806AC','Раскос'),(133,'U165042AA','Кронштейн крепления отопителя в сборе'),(134,'U159384AC','Кронштейн в сборе'),(135,'U157734AA','Дуга'),(136,'U152442AA','Лист герметизации'),(137,'U155278AB','Профиль в сборе'),(138,'U160089AA','Швеллер'),(139,'U155568AB','Профиль переходный'),(140,'U157986AA','Профиль в сборе'),(141,'U159657AA','Раскос в сборе'),(142,'U160506AA','Раскос'),(143,'U160761AB','Стенка'),(144,'U165151AA','Накладка в сборе'),(145,'U163239AA','Профиль в сборе'),(146,'U162967AA','Кронштейн'),(147,'U152747AA','Швеллер'),(148,'U152265AG','Каркас боковины левой'),(149,'U158157AB','Профиль'),(150,'U152391AD','Устройство буксировочное в сборе'),(151,'U152769AB','Платик'),(152,'U158979AB','Пластина'),(153,'U159729AB','Швеллер'),(154,'U149415AB','Профиль'),(155,'U150496AA','Заглушка'),(156,'U159991AF','Установка облицовки задка'),(157,'U150017AJ','Пол и подиум задней части'),(158,'U160872AB','Ребро'),(159,'U155111AA','Заглушка'),(160,'U157867AB','Раскос в сборе'),(161,'U164660AA','Кронштейн масляного контура'),(162,'U159990AA','Дуга'),(163,'U155408AB','Дуга'),(164,'U163802AA','Уголок'),(165,'U159259AB','Кронштейн'),(166,'U160800AA','Уголок'),(167,'U155297AB','Панель облицовки'),(168,'U155541AC','Профиль'),(169,'U155090AC','Панель облицовки'),(170,'U159139AA','Заглушка'),(171,'U114406AA','Шпилька опресcовочная М6х20'),(172,'U164354AB','Короб в сборе'),(173,'U162523AA','Кронштейн'),(174,'U156406AA','Швеллер'),(175,'U164464AB','Усиление'),(176,'U152202AB','Пруток'),(177,'U159054AA','Уголок'),(178,'U164618AA','Профиль пандуса'),(179,'U157189AB','Кронштейн в сборе'),(180,'U138627AA','Гайка приварная М5 DIN 929 M5 A2'),(181,'U158939AB','Стойка'),(182,'U157295AB','Уголок'),(183,'U169177AB','Бонка'),(184,'U158961AA','Дуга'),(185,'U156483AB','Профиль'),(186,'U155183AA','Профиль крепления настила пола'),(187,'U159220AA','Профиль'),(188,'U166692AA','Кронштейн'),(189,'U160363AA','Кронштейн в сборе'),(190,'U157997AA','Профиль в сборе'),(191,'U155975AB','Кронштейн в сборе'),(192,'U158407AA','Накладка'),(193,'U155413AA','Облицовка'),(194,'U160315AA','Раскос'),(195,'U154430AB','Накладка'),(196,'U161248AB','Облицовка'),(197,'U179742AA','Стойка в сборе'),(198,'U160229AB','Профиль'),(199,'U155097AB','Кронштейн модулятора'),(200,'U153057AA','Кронштейн'),(201,'U159702AB','Швеллер'),(202,'U158348AC','Стенка левая'),(203,'U155410AC','Стойка'),(204,'U163322AA','Стойка'),(205,'U157178AA','Уголок'),(206,'U148819AA','Профиль 40х40х3'),(207,'U157743AB','Накладка'),(208,'U155126AB','Кронштейн трубы'),(209,'U150055AB','Раскос'),(210,'U155970AA','Втулка'),(211,'U168397AA','Швеллер'),(212,'U157592AA','Профиль в сборе'),(213,'U158367AD','Профиль в сборе'),(214,'U162737AA','Усиление'),(215,'U155829AC','Облицовка правая'),(216,'U156730AA','Профиль'),(217,'U159797AB','Пластина'),(218,'U165358AA','Крышка короба'),(219,'U159135AA','Накладка'),(220,'U150581AB','Швеллер'),(221,'U162476AA','Пластина уплотнения'),(222,'U155152AE','Стойка'),(223,'U158563AB','Швеллер'),(224,'U157625AD','Накладка'),(225,'U156836AB','Раскос'),(226,'U152330AB','Лист опорный двери кабины водителя'),(227,'U164714AA','Кронштейн масляного контура в сборе'),(228,'U160535AB','Стойка в сборе'),(229,'U149623AC','Профиль'),(230,'U157726AC','Облицовка задняя'),(231,'U157848AA','Заглушка'),(232,'U159312AA','Стойка'),(233,'U179680AA','Пластина антенны'),(234,'U154667AB','Пластина'),(235,'U158256AB','Кронштейн'),(236,'U138142AA','Заклепка резьбовая М4 шестигранная Rivelit AM4 HS6 AZ0520'),(237,'U156202AG','Профиль'),(238,'U157060AA','Кронштейн'),(239,'U161243AA','Кронштейн'),(240,'U155494AA','Заглушка'),(241,'U156827AB','Профиль крепления бачка в сборе'),(242,'U159616AA','Раскос'),(243,'U152475AA','Накладка'),(244,'U161062AB','Накладка'),(245,'U179355AA','Заглушка'),(246,'U154355AA','Раскос'),(247,'U160489AB','Кронштейн'),(248,'U156517AA','Кронштейн'),(249,'U161117AB','Усиление'),(250,'U155474AC','Облицовка правая'),(251,'U159710AB','Швеллер'),(252,'U157750AC','Опора'),(253,'U160527AA','Дуга'),(254,'U157553AB','Косынка'),(255,'U161137AC','Пластина'),(256,'U160469AD','Кронштейн'),(257,'U154285AB','Ребро'),(258,'U155186AB','Накладка'),(259,'U161109AB','Уголок'),(260,'U158631AA','Заглушка'),(261,'U156900AB','Кронштейн в сборе'),(262,'U154032AB','Пластина'),(263,'U156809AC','Стойка'),(264,'U152670AA','Кронштейн в сборе'),(265,'U157198AB','Кронштейн'),(266,'U151067AB','Кронштейн в сборе'),(267,'U155169AB','Стойка'),(268,'U158605AC','Профиль в сборе'),(269,'U161372AC','Левая боковина'),(270,'U179736AA','Стойка'),(271,'U160172AA','Стойка'),(272,'U160429AA','Профиль'),(273,'U158473AA','Кронштейн'),(274,'U169148AA','Труба'),(275,'U161139-10AB','Косынка'),(276,'U155194AC','Заглушка'),(277,'U152080AB','Профиль'),(278,'U156964AB','Кронштейн в сборе'),(279,'U150996AA','Накладка'),(280,'U155991AD','Профиль в сборе'),(281,'U152149AJ','Приварные элементы пола водителя'),(282,'U158110AD','Профиль в сборе'),(283,'U160550AB','Швеллер'),(284,'U156329AB','Патрубок'),(285,'U158743AB','Кронштейн'),(286,'U155134AA','Уголок'),(287,'U156637AB','Стойка в сборе'),(288,'U155113AB','Накладка'),(289,'U151062AA','Опора сиденья в сборе'),(290,'U158380AA','Раскос'),(291,'U159929AA','Накладка'),(292,'U156469AB','Профиль'),(293,'U157166AA','Стойка'),(294,'U158801AB','Панель облицовки'),(295,'U150566AA','Накладка'),(296,'U158888AA','Профиль'),(297,'U156511AC','Профиль в сборе'),(298,'U157310AA','Профиль'),(299,'U152440AC','Кронштейн бачка омывателя в сборе'),(300,'U157037AB','Профиль'),(301,'U152114AA','Заклепка резьбовая М6 потайная шестигранная Rivelit AM6 HS9 AZ0530'),(302,'U163625AA','Косынка в сборе'),(303,'U150807AB','Кронштейн'),(304,'U150034AB','Вставка'),(305,'U149180AI','Каркас крыши в сборе'),(306,'U158430AD','Раскос в сборе'),(307,'U157038AC','Профиль в сборе'),(308,'U160269AA','Накладка'),(309,'U156478AA','Пластина в сборе'),(310,'U160449AA','Кронштейн в сборе'),(311,'U158543AA','Профиль 50х30х3'),(312,'U163214AA','Профиль в сборе'),(313,'U159659AC','Накладка'),(314,'U152279AI','Каркас модуля крепления задней подвески'),(315,'U157264AA','Кронштейн'),(316,'U165703AA','Накладка передней двери в сборе'),(317,'U150645AA','Пластина'),(318,'U150262AB','Профиль'),(319,'U157701AB','Швеллер'),(320,'U158717AD','Балка в сборе'),(321,'U158280AB','Профиль'),(322,'U160472AA','Кронштейн в сборе'),(323,'U157610AC','Стойка'),(324,'U158411AB','Профиль в сборе'),(325,'U160593AB','Профиль в сборе'),(326,'U152287AC','Облицовка'),(327,'U157561AA','Профиль'),(328,'U158370AB','Стойка'),(329,'U165407AA','Накладка передней двери'),(330,'U158779AC','Накладка'),(331,'U150616AA','Пластина'),(332,'U152258AA','Кронштейн'),(333,'U157126AB','Профиль опорный'),(334,'U157341AA','Раскос'),(335,'U154279AB','Ребро'),(336,'U156562AB','Кронштейн'),(337,'U155096AC','Профиль'),(338,'U161136AC','Стойка'),(339,'U157861AD','Облицовка в сборе'),(340,'U158111AA','Раскос в сборе'),(341,'U157415AB','Стойка'),(342,'U156569AD','Профиль в сборе'),(343,'U152816AC','Опора левая'),(344,'U157175AB','Кронштейн'),(345,'U158530AB','Пластина'),(346,'U159910AF','Каркас основания задка'),(347,'U150577AA','Накладка'),(348,'U162599AA','Усиление'),(349,'U158722AC','Стенка'),(350,'U160868AA','Панель'),(351,'U156719AA','Профиль'),(352,'U152379AC','Опора в сборе'),(353,'U160495AA','Раскос'),(354,'U159428AB','Швеллер в сборе'),(355,'U156851AA','Раскос'),(356,'U153856AD','Профиль в сборе'),(357,'U157065AC','Профиль в сборе'),(358,'U149171AG','Модуль крепления передней подвески'),(359,'U162940AA','Заклёпка резьбовая М5 Bollhoff 34377050025'),(360,'U163768AA','Пруток'),(361,'U169146AA','Труба'),(362,'U158372AA','Пластина'),(363,'U158736AB','Опора'),(364,'U158360AA','Накладка'),(365,'U160545AA','Профиль'),(366,'U159930AA','Швеллер'),(367,'U152527AA','Накладка'),(368,'U156492AA','Профиль'),(369,'U160534AA','Швеллер'),(370,'U149316AC','Профиль'),(371,'U159598AA','Раскос'),(372,'U165057AA','Заклепка резьбовая М10 шестигранная Rivelit AM10 HE13 AZ0540'),(373,'U180397AA','Швеллер'),(374,'U152372AB','Гайка квадратная М10'),(375,'U150225AA','Заглушка'),(376,'U164275AA','Обечайка'),(377,'U159881AD','Стойка'),(378,'U155666AB','Профиль'),(379,'U179738AA','Стойка'),(380,'U150844AE','Панель'),(381,'U160264AB','Кожух'),(382,'U163815AA','Ребро'),(383,'U150908AB','Кронштейн'),(384,'U152288AB','Короб правый'),(385,'U153058AA','Кронштейн в сборе'),(386,'U160533AB','Профиль'),(387,'U160006AA','Кронштейн в сборе'),(388,'U148954AA','Профиль'),(389,'U150792AC','Кронштейн'),(390,'U157808AB','Кронштейн в сборе'),(391,'U152095AA','Накладка'),(392,'U155265AC','Профиль в сборе'),(393,'U157652AA','Швеллер'),(394,'U158441AB','Кронштейн'),(395,'U152093AA','Панель герметизации'),(396,'U150370AA','Уголок крепления настила пола'),(397,'U156495AA','Профиль'),(398,'U157853-10AA','Профиль'),(399,'U152812AA','Опора'),(400,'U152499AD','Дуга в сборе'),(401,'U139169AA','Заклепка резьбовая М8 шестигранная Rivelit AM8 HS11 AZ0530'),(402,'U161056AA','Накладка'),(403,'U152974AA','Кронштейн'),(404,'U155756AB','Кожух в сборе'),(405,'U157346AB','Профиль'),(406,'U159727AB','Швеллер'),(407,'U155142AA','Стойка'),(408,'U152479AA','Накладка'),(409,'U152424AB','Опора двери кабины водителя в сборе'),(410,'U158533AA','Накладка'),(411,'U152443AB','Раскос'),(412,'U152178AA','Раскос'),(413,'U156214AA','Профиль'),(414,'U158378AA','Профиль 50х80х3'),(415,'U158112AA','Раскос в сборе'),(416,'U159524AA','Профиль'),(417,'U156953AB','Уголок'),(418,'U155151AE','Стойка'),(419,'U161123AB','Стойка в сборе'),(420,'U160544AA','Профиль'),(421,'U160135AA','Заглушка'),(422,'U158780AB','Профиль'),(423,'U157619AA','Кронштейн'),(424,'U154670AB','Кронштейн в сборе'),(425,'U155891AC','Опора'),(426,'U155371AC','Облицовка левая'),(427,'U154848AB','Профиль'),(428,'U155734AD','Профиль в сборе'),(429,'U157142AB','Кронштейн звукового сигнала'),(430,'U156749AC','Швеллер в сборе'),(431,'U156750AC','Раскос'),(432,'U160620AA','Косынка'),(433,'U166244AA','Опора поддомкратника в сборе'),(434,'U160387AB','Стойка в сборе'),(435,'U160064AA','Профиль'),(436,'U159851AD','Основание пола кабины водителя'),(437,'U156237AA','Облицовка пола'),(438,'U155476AC','Облицовка правая'),(439,'U158469AA','Кронштейн'),(440,'U161071-10AA','Решетка'),(441,'U154295AA','Швеллер'),(442,'U158315AB','Короб в сборе'),(443,'U155065AC','Опора в сборе'),(444,'U160133AA','Заглушка'),(445,'U152484AB','Накладка'),(446,'U164422AB','Усиление'),(447,'U159753AB','Профиль'),(448,'U149189AA','Профиль 50х50х3'),(449,'U158789AE','Профиль в сборе'),(450,'U155191AD','Профиль в сборе'),(451,'U155946AB','Профиль'),(452,'U155525AB','Накладка'),(453,'U158787AC','Профиль в сборе'),(454,'U157494AC','Балка в сборе'),(455,'U109871AA','Заклепка резъбовая М6 шестигранная Rivelit AM6 HS9 AZ3060'),(456,'U160754AC','Раскос'),(457,'U160782AC','Пластина'),(458,'U159422AA','Раскос в сборе'),(459,'U150594AA','Профиль'),(460,'U156868AA','Раскос'),(461,'U152811AA','Кронштейн в сборе'),(462,'U161229AC','Кронштейн'),(463,'U163754AA','Ребро'),(464,'U156807AB','Стойка'),(465,'U160034AA','Профиль'),(466,'U158190AB','Ребро'),(467,'U161419AB','Профиль'),(468,'U158578AB','Заглушка'),(469,'U158725AA','Уголок'),(470,'U156525AB','Профиль в сборе'),(471,'U159152AB','Профиль в сборе'),(472,'U160924AA','Уголок'),(473,'U149833AI','Каркас боковины левой в сборе'),(474,'U104307AA','Шпилька специальная М6х26'),(475,'U154864AA','Профиль'),(476,'U164391AB','Кронштейн рейсоуказателя в сборе'),(477,'U160071AA','Дуга'),(478,'U158976AC','Профиль'),(479,'U159196AC','Кронштейн в сборе'),(480,'U160733AA','Профиль'),(481,'U163495AA','Труба 50х2'),(482,'U156758AA','Профиль'),(483,'U158146AA','Раскос 20х40х2'),(484,'U156676AA','Кронштейн'),(485,'U161381AC','Опора левой подушки'),(486,'U164466AB','Пластина'),(487,'U156570AB','Втулка'),(488,'U158185AA','Швеллер'),(489,'U155334AB','Профиль опорный'),(490,'U161398AA','Короб рециркуляции'),(491,'U152417AA','Кронштейн жгута электрического'),(492,'U156999AB','Накладка'),(493,'U153050AA','Кронштейн'),(494,'U153994AB','Патрубок'),(495,'U156381AA','Стойка'),(496,'U155393AA','Раскос'),(497,'U164631AA','Профиль пандуса'),(498,'U149936AI','Каркас задка в сборе'),(499,'U156414AA','Профиль'),(500,'U156766AD','Облицовка'),(501,'U155123AA','Пластина в сборе'),(502,'U158734AB','Профиль'),(503,'U160524AA','Раскос'),(504,'U152396AB','Пластина в сборе'),(505,'U152270AG','Верхняя часть проема двери'),(506,'U152295AB','Раскос'),(507,'U155506AE','Накладка в сборе'),(508,'U168483AA','Швеллер'),(509,'U158782AB','Профиль'),(510,'U160787AD','Раскос в сборе'),(511,'U161045AA','Раскос'),(512,'U162216AA','Пруток'),(513,'U150831AF','Панель'),(514,'U149831AI','Каркас боковины правой в сборе'),(515,'U154690AB','Кронштейн'),(516,'U160504AA','Профиль'),(517,'U160759AA','Стойка'),(518,'U166245AA','Пластина опоры'),(519,'U157493AC','Стенка'),(520,'U158359AA','Накладка'),(521,'U158767AA','Раскос'),(522,'U156960AA','Швеллер'),(523,'U156867AA','Швеллер'),(524,'U154871AC','Профиль'),(525,'U165118AA','Панель герметизации'),(526,'U164372AA','Уголок рейсоуказателя'),(527,'U164644AA','Лист верхний'),(528,'U158836AC','Кронштейн опорный'),(529,'U160338-10AB','Кронштейн опорный'),(530,'U155340AB','Швеллер опорный'),(531,'U157491AA','Накладка'),(532,'U159578AA','Накладка'),(533,'U152506AH','Установка приварных элементов боковины правой'),(534,'U155503AA','Кронштейн в сборе'),(535,'U151138AA','Накладка'),(536,'U160576AA','Профиль'),(537,'U156849AA','Раскос'),(538,'U165356AA','Стенка короба'),(539,'U155048AB','Профиль'),(540,'U159577AC','Профиль усилительный крепления бачка ГУР в сборе'),(541,'U157438AC','Усиление'),(542,'U159550AB','Профиль крепления отопителя фронтального'),(543,'U160991AA','Профиль'),(544,'U148254AA','Профиль'),(545,'U160746AA','Дуга'),(546,'U160276AA','Панель'),(547,'U154641AA','Обечайка'),(548,'U160473AA','Кронштейн'),(549,'U159158AD','Стойка в сборе'),(550,'U158482AB','Уголок'),(551,'U160530AA','Швеллер'),(552,'U158172AA','Профиль'),(553,'U154847AA','Стойка'),(554,'U160347AA','Раскос'),(555,'U163748AA','Ребро'),(556,'U155102AC','Профиль в сборе'),(557,'U157218AA','Стойка 40х40х3'),(558,'U161058AA','Труба Ø30x2'),(559,'U101669AA','Гайка квадратная М8 DIN 557 A2'),(560,'U156915AA','Накладка'),(561,'U152375AA','Кожух гайки'),(562,'U159731AB','Швеллер'),(563,'U154297AB','Профиль 80х120х5'),(564,'U163872AA','Уголок в сборе'),(565,'U161120AA','Накладка'),(566,'U160191AA','Уголок'),(567,'U156906AB','Профиль'),(568,'U158758AC','Проушина'),(569,'U160496AA','Раскос'),(570,'U156841AA','Раскос'),(571,'U158956AC','Профиль'),(572,'U159420AA','Профиль'),(573,'U160093AA','Накладка'),(574,'U156799AA','Раскос'),(575,'U158099AC','Стойка'),(576,'U154668AA','Стойка'),(577,'U159589AB','Кронштейн'),(578,'U156752AB','Профиль в сборе'),(579,'U150898AA','Кронштейн'),(580,'U157565AA','Профиль'),(581,'U157324AA','Раскос'),(582,'U159536AA','Швеллер'),(583,'U166045AA','Лист накладки'),(584,'U150783AA','Втулка'),(585,'U164362AB','Кронштейн рейсоуказателя'),(586,'U158008AA','Профиль в сборе'),(587,'U152759AD','Короб внутренний'),(588,'U160751AA','Раскос в сборе'),(589,'U151131AB','Профиль'),(590,'U165708AA','Панель крепления передней двери в сборе'),(591,'U152410AA','Опора'),(592,'U159359AB','Кронштейн'),(593,'U157866AB','Раскос'),(594,'U156866AB','Кронштейн'),(595,'U163819AA','Ребро'),(596,'U165002AA','Кронштейн крепления отопителя'),(597,'U152366AA','Заглушка'),(598,'U156751AC','Раскос'),(599,'U164467AB','Обечайка'),(600,'U155892AC','Накладка'),(601,'U157372AC','Раскос'),(602,'U150633AB','Профиль в сборе'),(603,'U159274AA','Раскос'),(604,'U153960AC','Опора'),(605,'U159280AD','Кронштейн в сборе'),(606,'U160498AA','Кронштейн в сборе'),(607,'U155954AA','Раскос'),(608,'U159117AA','Кронштейн крепления АКБ'),(609,'U160349AA','Профиль'),(610,'U150835AA','Короб'),(611,'U159262AA','Стойка'),(612,'U149615AA','Профиль 50х80х3'),(613,'U149514AC','Дуга'),(614,'U160753AA','Скоба'),(615,'U158781AA','Профиль'),(616,'U155050AB','Профиль в сборе'),(617,'U152290AB','Раскос пола опорный'),(618,'U162547AC','Панель крепления передней двери'),(619,'U164316AA','Короб'),(620,'U152257AA','Пластина закладная'),(621,'U160066AA','Дуга'),(622,'U159197AA','Пластина'),(623,'U152106AA','Профиль усилительный кронштейна стеклоочистителя'),(624,'U158434AC','Раскос в сборе'),(625,'U161163AB','Кронштейн в сборе'),(626,'U155014AA','Стенка'),(627,'U158127AB','Профиль'),(628,'U159157AB','Проставка в сборе'),(629,'U152663AD','Профиль 80х50х3'),(630,'U180391AA','Швеллер'),(631,'U156808AA','Накладка'),(632,'U152364AA','Заглушка'),(633,'U155321AC','Профиль в сборе'),(634,'U156975AA','Раскос'),(635,'U157484AE','Ребро'),(636,'U156729AA','Профиль'),(637,'U163200AA','Косынка'),(638,'U155374AB','Стойка'),(639,'U165632AA','Панель крепления передней двери'),(640,'U157066AA','Кронштейн'),(641,'U158483AB','Стойка'),(642,'U157116AD','Профиль'),(643,'U155330AC','Профиль опорный'),(644,'U157869AB','Ребро'),(645,'U159560AA','Заглушка'),(646,'U162797AA','Кронштейн'),(647,'U150903AC','Профиль в сборе'),(648,'U158479AC','Стойка'),(649,'U168388AA','Швеллер'),(650,'U158723AC','Накладка верхняя'),(651,'U149977AB','Кронштейн'),(652,'U179728AA','Профиль'),(653,'U161238AB','Уголок'),(654,'U155087AD','Панель облицовки в сборе'),(655,'U156842AB','Профиль'),(656,'U156806AC','Профиль в сборе'),(657,'U106009AA','Шпилька специальная М10х35'),(658,'U157063AA','Накладка'),(659,'U158708AA','Профиль'),(660,'U158104AD','Профиль'),(661,'U154674AB','Кронштейн'),(662,'U157552AA','Профиль'),(663,'U152784AA','Швеллер'),(664,'U162550AA','Труба вентиляции'),(665,'U155727AD','Облицовка правая'),(666,'U155451AA','Накладка'),(667,'U155914AA','Профиль'),(668,'U155279AB','Профиль'),(669,'U159198AB','Кронштейн'),(670,'U150657AB','Швеллер опорный'),(671,'U158797AA','Кронштейн'),(672,'U161245AA','Накладка'),(673,'U161046AA','Заглушка'),(674,'U149434AA','Накладка'),(675,'U168806AA','Лист герметизации'),(676,'U151014AH','Модуль крепления задней подвески'),(677,'U155357AC','Лист герметизации'),(678,'U168481AA','Швеллер'),(679,'U157239AB','Швеллер'),(680,'U157392AB','Раскос'),(681,'U163213AA','Профиль в сборе'),(682,'U160720AB','Профиль'),(683,'U150856AB','Стойка'),(684,'U154003-20AB','Патрубок'),(685,'U158412AB','Накладка'),(686,'U153912AC','Опора'),(687,'U160866AB','Ребро'),(688,'U161446AD','Каркас задней части боковины правой'),(689,'U156468AB','Профиль'),(690,'U156466AB','Кронштейн'),(691,'U150814AA','Кронштейн'),(692,'U158889AA','Раскос'),(693,'U158680-10AA','Профиль'),(694,'U152495AI','Приварные элементы каркаса кузова'),(695,'U155286AA','Профиль'),(696,'U158139AC','Стойка в сборе'),(697,'U155058AB','Швеллер опорный'),(698,'U161004AB','Швеллер'),(699,'U150795AA','Накладка'),(700,'U161235AA','Кронштейн'),(701,'U163003AB','Установка идентификационной таблички кузова'),(702,'U150519AA','Накладка'),(703,'U155392AA','Раскос'),(704,'U160492AA','Профиль'),(705,'U158609AC','Профиль в сборе'),(706,'U150957AD','Профиль порога'),(707,'U160098AA','Накладка'),(708,'U157551AB','Стойка'),(709,'U149277AA','Профиль'),(710,'U155136AD','Стойка'),(711,'U154888AC','Профиль с втулками в сборе'),(712,'U154318AA','Профиль'),(713,'U166023AA','Опора герметизации накладки'),(714,'U149870AA','Профиль'),(715,'U158799AB','Панель облицовки'),(716,'U160341AA','Раскос'),(717,'U156169AA','Раскос'),(718,'U159567AA','Профиль'),(719,'U161047AA','Раскос'),(720,'U148949AC','Лонжерон 50х80х3'),(721,'U155314AB','Профиль в сборе'),(722,'BMG-U152443AB-002','Раскос'),(723,'U159268AA','Раскос'),(724,'U150419AA','Заглушка'),(725,'U158057AD','Накладка в сборе'),(726,'U155379AB','Профиль в сборе'),(727,'U160022AA','Швеллер'),(728,'U152472AA','Дуга'),(729,'U152100AC','Кронштейн бачка омывателя'),(730,'U161784AA','Кронштейн'),(731,'U159981AA','Накладка'),(732,'U160494AB','Ребро'),(733,'U154348AA','Накладка'),(734,'U157365AA','Раскос в сборе'),(735,'U159417AA','Раскос'),(736,'U159561AA','Швеллер'),(737,'U157388AA','Раскос'),(738,'U160625AA','Уголок'),(739,'U158015AC','Уголок'),(740,'U157330AA','Раскос'),(741,'U157058AB','Кронштейн в сборе'),(742,'U156698AB','Профиль усилительный'),(743,'U155144AA','Стойка'),(744,'U155641AA','Профиль'),(745,'U164860AA','Профиль в сборе'),(746,'U156988AA','Профиль'),(747,'U155912-10AB','Профиль'),(748,'U159917AB','Швеллер'),(749,'U157520AB','Уголок'),(750,'U159713AB','Швеллер'),(751,'U160250AB','Короб в сборе'),(752,'U157888AB','Швеллер'),(753,'U158373AB','Стойка'),(754,'U165366AB','Крышка короба'),(755,'U158791-10AB','Заглушка'),(756,'U160833AA','Профиль крепления отопителя фронтального'),(757,'U152408AA','Опора'),(758,'U163238AA','Заглушка'),(759,'U157336AA','Раскос'),(760,'U159142AA','Профиль'),(761,'U155957AB','Уголок'),(762,'U154350AA','Раскос'),(763,'U159675AA','Швеллер'),(764,'U155948AB','Стенка'),(765,'U160741AA','Профиль'),(766,'U151057AB','Кронштейн'),(767,'U162483AA','Пластина уплотнения'),(768,'U166024AA','Шпилька опрессовочная HFH М10х30'),(769,'U154335AA','Заглушка'),(770,'U164442AB','Обечайка'),(771,'U155124AA','Пластина'),(772,'U161350AA','Кронштейн'),(773,'U156993AC','Профиль'),(774,'U150951AB','Ребро'),(775,'U156979AA','Раскос'),(776,'U154677AB','Кронштейн в сборе'),(777,'U150026AA','Раскос опорный'),(778,'U149661AB','Швеллер'),(779,'U157139AA','Уголок'),(780,'U158957AC','Профиль'),(781,'U155187AD','Накладка'),(782,'U150343AB','Профиль'),(783,'U161132AB','Стойка'),(784,'U149203AC','Обечайка'),(785,'U159559AA','Швеллер'),(786,'U163782AA','Стенка'),(787,'U159342AA','Накладка в сборе'),(788,'U150781AA','Накладка'),(789,'U161022AA','Заглушка'),(790,'U157220AB','Профиль'),(791,'U150065AA','Кронштейн'),(792,'U150687AA','Профиль'),(793,'U150716AA','Заглушка'),(794,'BMG-U159989AD-001','Стойка'),(795,'U157604AA','Профиль'),(796,'U158480AB','Уголок'),(797,'U157015AA','Кронштейн в сборе'),(798,'U161417AD','Стойка в сборе'),(799,'U151048AA','Раскос'),(800,'U154154AC','Пластина'),(801,'U158470AA','Кронштейн в сборе'),(802,'U163296AA','Ребро'),(803,'U166246AA','Труба опоры'),(804,'U154740AA','Стойка'),(805,'U160279AA','Накладка'),(806,'U150634AB','Ребро'),(807,'U156989AA','Профиль в сборе'),(808,'U155768AC','Уголок'),(809,'U161122AA','Ребро'),(810,'U159163AA','Швеллер'),(811,'U154776AB','Короб в сборе'),(812,'U152346AA','Раскос'),(813,'U151053AB','Профиль'),(814,'U158014AB','Опора'),(815,'U161808AA','Кронштейн'),(816,'U155277AA','Раскос 50х50х3'),(817,'U149221AC','Профиль'),(818,'U168338-00AA','Кронштейн кондиционера кабины водителя в сборе'),(819,'U163202AA','Косынка'),(820,'U158958AC','Профиль в сборе'),(821,'BMG-U152443AB-001','Раскос'),(822,'U157288AB','Кронштейн крепления отопителя'),(823,'U155679AC','Кронштейн в сборе'),(824,'U157687AA','Накладка'),(825,'U166226AA','Накладка'),(826,'U159815AB','Профиль в сборе'),(827,'U156991AA','Заглушка'),(828,'U157870AA','Профиль в сборе'),(829,'U159442AA','Раскос в сборе'),(830,'U105785AA','Заклепка шестигранная вытяжная резьбовая М5 Rivelit AM5 HE7 AZ0530'),(831,'U159604AA','Раскос'),(832,'U159565AB','Профиль'),(833,'U169543AA','Стойка в сборе'),(834,'U158846AA','Шпилька приварная M6x20 ISO 13918'),(835,'U153809AA','Шайба'),(836,'U160920AA','Уголок'),(837,'U152073AB','Втулка'),(838,'U155389AA','Стойка'),(839,'U156693AA','Обечайка'),(840,'U153847AA','Труба Ø45'),(841,'U148818AB','Профиль'),(842,'U154859AB','Кронштейн в сборе'),(843,'U157172AA','Стойка в сборе'),(844,'U150709AA','Втулка'),(845,'U152074AA','Втулка'),(846,'U165307AA','Ребро накладки порога'),(847,'U159948AA','Накладка'),(848,'U157563AA','Профиль в сборе'),(849,'U153027AB','Лонжерон в сборе'),(850,'U159488AA','Ребро'),(851,'U158710AA','Профиль'),(852,'U160937AA','Стойка'),(853,'U158170AD','Стенка правая'),(854,'U158686AA','Профиль'),(855,'U106138AB','Заклепка резьбовая М6 шестигранная Rivelit AM6 HS9 AZ0530'),(856,'U151065AA','Гайка приварная М6 Emile Maurin 646076'),(857,'U101739AA','Заклепка резьбовая М8 шестигранная Rivelit AM8 HS11 AZ3060'),(858,'U157647AB','Стойка'),(859,'U158524AB','Стенка'),(860,'U155351AB','Кронштейн модулятора'),(861,'U160183AA','Профиль'),(862,'U149281AA','Профиль'),(863,'U158089AC','Стойка'),(864,'U155072AB','Заглушка'),(865,'U163661AA','Лист'),(866,'U159552AD','Облицовка'),(867,'U148265AA','Профиль'),(868,'U152248AB','Профиль усилительный крепления двери кабины водителя'),(869,'U158013AB','Опора'),(870,'U150515AA','Заглушка'),(871,'U155085AA','Заглушка'),(872,'U156744AC','Профиль'),(873,'U162422AA','Профиль модуля переднего в сборе'),(874,'U158542AB','Профиль'),(875,'U152192AA','Стойка'),(876,'U155150AF','Стойка в сборе'),(877,'U160950-10AB','Решетка'),(878,'U161057AA','Накладка'),(879,'U148349AB','Профиль усилительный крепления рулевого механизма'),(880,'U152524AB','Накладка'),(881,'U158786AA','Профиль в сборе'),(882,'U160996AB','Пластина'),(883,'U155285AA','Профиль 30х20х2'),(884,'U157132AA','Профиль опорный'),(885,'U159656AA','Профиль'),(886,'U156862AB','Кронштейн'),(887,'U158682AB','Профиль'),(888,'U148380AA','Профиль'),(889,'U157355AA','Раскос'),(890,'U155487AA','Швеллер'),(891,'U157050AA','Втулка'),(892,'U157271AA','Кронштейн'),(893,'U159358AC','Кронтейн в сборе'),(894,'U156695AA','Профиль'),(895,'U150145AA','Стойка'),(896,'U160347-10AA','Раскос'),(897,'U160362AA','Накладка'),(898,'U160353AA','Раскос'),(899,'U160836AA','Раскос'),(900,'U152244AA','Уголок'),(901,'U157481AB','Лонжерон'),(902,'U159153AA','Профиль в сборе'),(903,'U158129AA','Раскос'),(904,'U149605AA','Профиль'),(905,'U158732AB','Уголок'),(906,'U158701AA','Профиль'),(907,'U155806AD','Облицовка'),(908,'U156813AC','Усиление крепления бачка'),(909,'U151066AA','Гайка приварная М8 Emile Maurin 646078'),(910,'U161074-10AA','Решетка'),(911,'U168383AA','Швеллер'),(912,'U161082AA','Накладка в сборе'),(913,'U162888AA','Кронштейн камеры'),(914,'U163741AB','Кронштейн зарядного разъема'),(915,'U156350AA','Уголок'),(916,'U158555AA','Заглушка'),(917,'U152755AD','Опора левая'),(918,'U160603AA','Профиль'),(919,'U154972AB','Кронштейн'),(920,'U152395AA','Пластина крепления двери кабины водителя в сборе'),(921,'U152275AG','Верхняя часть проема двери'),(922,'U152151AA','Профиль'),(923,'U158079AC','Стойка'),(924,'U166761AA','Кронштейн поручня в сборе'),(925,'U104964AA','Заклепка резьбовая M4 Rivelit AM4 HS6 AZ2030'),(926,'U159320AA','Стойка'),(927,'U159629AA','Раскос'),(928,'U158733AD','Опора в сборе'),(929,'U161249AB','Облицовка'),(930,'U152357AC','Облицовка'),(931,'U159549AA','Профиль в сборе'),(932,'U160182AA','Профиль в сборе'),(933,'U154541AC','Кронштейн'),(934,'U156978AA','Раскос'),(935,'U153760AA','Профиль'),(936,'U152107AA','Кронштейн в сборе'),(937,'U158377AA','Заглушка'),(938,'U159680AA','Кронштейн в сборе'),(939,'U152446AA','Раскос'),(940,'U162153AB','Профиль в сборе'),(941,'U154860AB','Кронштейн'),(942,'U159091AA','Кронштейн крепления АКБ'),(943,'U158500AA','Кронштейн'),(944,'U169169AA','Дуга арки в сборе'),(945,'U158800AB','Панель облицовки'),(946,'U149841AI','Вставка каркаса основания средняя'),(947,'U165269AA','Проставка облицовки'),(948,'U156585AD','Патрубки'),(949,'U160239AA','Кожух'),(950,'U159813AD','Правая часть каркаса модуля крепления передней подвески'),(951,'U156741AC','Швеллер'),(952,'U160475AA','Профиль'),(953,'U156843AB','Профиль в сборе'),(954,'U152277AG','Верхняя часть проема двери'),(955,'U155185AB','Профиль крепления настила пола в сборе'),(956,'U157846AA','Стойка'),(957,'U155182AB','Профиль крепления настила пола в сборе'),(958,'U156764AC','Профиль'),(959,'U164647AA','Каркас пандуса в сборе'),(960,'U156661AD','Панель герметизации'),(961,'U160383AD','Стойка'),(962,'U152369AA','Заглушка'),(963,'U154283AB','Ребро'),(964,'U160946AB','Накладка'),(965,'U149313AB','Накладка'),(966,'BMG-U152667AB-001','Швеллер'),(967,'U157122AA','Косынка'),(968,'U156335AB','Втулка'),(969,'U160008AA','Кронштейн'),(970,'U156521AA','Уголок'),(971,'U162810AA','Профиль горизонтальный верхний'),(972,'U152388AD','Лонжерон в сборе'),(973,'U150893AA','Кронштейн'),(974,'U156694AB','Швеллер профиля порога'),(975,'U155661AB','Кронштейн'),(976,'U155184AA','Профиль крепления настила пола'),(977,'U158297AB','Швеллер'),(978,'U165911AB','Кронштейн патрубков отопления'),(979,'U157246AA','Профиль 40х40х3'),(980,'U155038AC','Панель облицовки'),(981,'U157873AA','Раскос в сборе'),(982,'U159332AA','Ребро'),(983,'U152851AG','Установка облицовки каркаса крыши'),(984,'U161145AB','Профиль в сборе'),(985,'U158566AD','Швеллер'),(986,'U160994AA','Профиль'),(987,'U158187AB','Швеллер'),(988,'U165987AB','Установка пластин для антенн'),(989,'U158875AA','Стойка'),(990,'U157512AB','Профиль'),(991,'U161423AA','Кронштейн модулятора'),(992,'U158362AC','Раскос в сборе'),(993,'U161055AB','Ребро'),(994,'U152118AA','Заклепка резьбовая М8 потайная шестигранная Rivelit AM8 HS11 AZ0530'),(995,'U161450AA','Кронштейн облицовки'),(996,'U157840AA','Стойка'),(997,'U161084AB','Накладка в сборе'),(998,'U154188AB','Профиль'),(999,'U156761AC','Облицовка'),(1000,'U156461AB','Профиль в сборе'),(1001,'U160564AA','Стойка'),(1002,'U161447AE','Каркас передней части боковины правой'),(1003,'U150012AB','Кронштейн'),(1004,'U159596AB','Уголок'),(1005,'U164290AA','Уголок крепления решетки'),(1006,'U160784AD','Раскос в сборе'),(1007,'U158303AA','Уголок'),(1008,'U157714AC','Профиль'),(1009,'U160185AA','Лонжерон'),(1010,'U158071AB','Раскос'),(1011,'U160513AC','Облицовка'),(1012,'U158068AB','Дно'),(1013,'U159474AB','Стойка в сборе'),(1014,'U157514AD','Швеллер'),(1015,'U155138AE','Стойка'),(1016,'U156671AB','Кронштейн'),(1017,'U155655AB','Кронштейн'),(1018,'U149546AB','Лист нижний'),(1019,'U162948AA','Кронштейн датчика уровня пола'),(1020,'U150248AC','Профиль'),(1021,'U158891AC','Опора'),(1022,'U154356AB','Накладка'),(1023,'U158630AA','Профиль 30х30х2'),(1024,'U152490AA','Кронштейн'),(1025,'U168338AA','Кронштейн кондиционера кабины водителя'),(1026,'U158080AC','Стойка в сборе'),(1027,'U161143AA','Швеллер'),(1028,'U155283AA','Профиль 40х40х3'),(1029,'U161093-10AA','Решетка'),(1030,'U159000AA','Профиль'),(1031,'U163744AA','Ребро'),(1032,'U155414AC','Облицовка'),(1033,'U150915AA','Кронштейн в сборе'),(1034,'U158374AB','Стойка в сборе'),(1035,'U160055AA','Уголок'),(1036,'U156977AA','Раскос'),(1037,'U155044AB','Панель облицовки'),(1038,'U150260AB','Профиль'),(1039,'U166693AA','Кронштейн'),(1040,'U159051AA','Швеллер'),(1041,'U152398AA','Заглушка'),(1042,'U158759AC','Проушина'),(1043,'U161101AA','Усиление'),(1044,'U157706AB','Профиль'),(1045,'U159281AC','Кронштейн'),(1046,'U158100AC','Стойка в сборе'),(1047,'U157845AB','Лист облицовки'),(1048,'U155322AA','Профиль передний'),(1049,'U156596AC','Стойка'),(1050,'U160186AA','Лонжерон в сборе'),(1051,'U157572AB','Раскос'),(1052,'U160793AA','Швеллер'),(1053,'U155117AA','Заглушка в сборе'),(1054,'U158416AB','Стойка'),(1055,'U163316AA','Заглушка'),(1056,'U160382AB','Накладка'),(1057,'U155729AA','Перегородка'),(1058,'U160042AA','Профиль'),(1059,'U154277AA','Кронштейн'),(1060,'U152815AA','Короб правый'),(1061,'U152745AA','Уголок'),(1062,'U161241AA','Уголок'),(1063,'U158477AF','Стойка в сборе'),(1064,'U164680AA','Перегородка'),(1065,'U160727AA','Профиль'),(1066,'U155959AB','Раскос'),(1067,'U158494AB','Кронштейн'),(1068,'U157236AB','Кронштейн'),(1069,'U150785AA','Бонка'),(1070,'U152485AA','Кронштейн'),(1071,'U154876AB','Профиль'),(1072,'U152084AB','Стойка'),(1073,'U161420AA','Профиль'),(1074,'U159397AA','Раскос'),(1075,'U157562AA','Накладка'),(1076,'U164635AA','Опора пандуса'),(1077,'U155411AA','Раскос'),(1078,'U158570AA','Кронштейн в сборе'),(1079,'U154003-10AB','Патрубок'),(1080,'U156531AA','Профиль в сборе'),(1081,'U157809AB','Кронштейн'),(1082,'U156831AB','Профиль'),(1083,'U159988AE','Установка приварных элементов задка'),(1084,'U158115AF','Стойка в сборе'),(1085,'U158760AB','Накладка'),(1086,'U159642AB','Уголок'),(1087,'U160894AB','Панель'),(1088,'U160537AB','Стойка'),(1089,'U152528AB','Профиль'),(1090,'U158680AA','Профиль'),(1091,'U107645AA','Шпилька опресcовочная М5х18'),(1092,'U160444AB','Профиль'),(1093,'U156832AB','Профиль'),(1094,'U155758AB','Панель'),(1095,'U157318AA','Профиль'),(1096,'U155135AC','Стойка в сборе'),(1097,'U156572AA','Патрубок'),(1098,'U157248AA','Кронштейн'),(1099,'U157127AA','Профиль'),(1100,'U152870AC','Кронштейн в сборе'),(1101,'U157133AA','Стойка'),(1102,'U151043AB','Профиль'),(1103,'U150592AA','Раскос'),(1104,'U159518AB','Облицовка'),(1105,'U156403AA','Швеллер'),(1106,'U150897AC','Кронштейн'),(1107,'U155364AD','Облицовка'),(1108,'U161070AB','Кронштейн'),(1109,'BMG-U164860AA-002','Ребро'),(1110,'U154893AA','Втулка'),(1111,'U165667AA','Накладка передней двери'),(1112,'U158737AD','Швеллер'),(1113,'U165734AA','Опора герметизации накладки'),(1114,'U158693AA','Профиль'),(1115,'U165150AA','Накладка в сборе'),(1116,'U160466AD','Лист пола в сборе'),(1117,'U180398AA','Швеллер'),(1118,'U150911AA','Кронштейн'),(1119,'U159092AA','Уголок'),(1120,'U156755AD','Накладка'),(1121,'U150631AB','Профиль 70х70х5'),(1122,'U160049AA','Профиль'),(1123,'U157374AD','Облицовка'),(1124,'U152169AA','Раскос'),(1125,'U160024AA','Лист'),(1126,'U150793AA','Пластина'),(1127,'U179359AA','Заглушка'),(1128,'U150925AA','Опора сиденья'),(1129,'U152433AB','Швеллер'),(1130,'U160556AA','Ребро'),(1131,'U158669AA','Дуга'),(1132,'U155352AB','Кронштейн модулятора'),(1133,'U160897-10AB','Кронштейн'),(1134,'U157311AA','Профиль'),(1135,'U160426AB','Профиль'),(1136,'U165946AA','Колодка пандуса'),(1137,'U156387AB','Профиль'),(1138,'U160381AA','Накладка'),(1139,'U150279AA','Профиль 30х30х2'),(1140,'U159586AB','Пластина'),(1141,'U160092AA','Заглушка'),(1142,'U156156AC','Пластина'),(1143,'U157454AD','Ребро'),(1144,'U164638AA','Заглушка'),(1145,'U179739AA','Стойка'),(1146,'U160951AB','Накладка'),(1147,'U156971AD','Профиль'),(1148,'U162475AA','Накладка передней двери'),(1149,'U160621AA','Уголок'),(1150,'U163632AA','Профиль'),(1151,'U156800AB','Раскос'),(1152,'U163384AA','Усиление пола'),(1153,'U158488AC','Стойка в сборе'),(1154,'U152415AB','Пруток'),(1155,'U159564AB','Профиль'),(1156,'U154765AA','Кронштейн'),(1157,'U159180AA','Накладка'),(1158,'U155953AA','Профиль'),(1159,'U160499AA','Кронштейн'),(1160,'U157600AB','Пруток'),(1161,'U158963AA','Пластина'),(1162,'U152819AB','Профиль в сборе'),(1163,'U166756AA','Кронштейн поручня в сборе'),(1164,'U161110AA','Профиль'),(1165,'U159614AB','Обечайка'),(1166,'U157700AA','Накладка'),(1167,'U156891AA','Заглушка'),(1168,'U159089AA','Кронштейн крепления АКБ в сборе'),(1169,'U159481AA','Стойка'),(1170,'U163851AB','Лист уплотнения'),(1171,'U163752AA','Ребро'),(1172,'U160408AA','Усиление'),(1173,'U157502AC','Лист нижний'),(1174,'U156476AA','Пластина в сборе'),(1175,'U153849AA','Труба Ø30x2'),(1176,'U159593AB','Пластина'),(1177,'U157067AC','Профиль'),(1178,'U155099AE','Кронштейн датчиков'),(1179,'U152376AB','Швеллер'),(1180,'U163221AA','Профиль в сборе'),(1181,'U158113AB','Стенка'),(1182,'U158798AA','Панель облицовки'),(1183,'U161013AB','Швеллер'),(1184,'U160791AA','Швеллер'),(1185,'U159620AA','Раскос'),(1186,'U149981AB','Профиль'),(1187,'U161391AC','Опора правой подушки'),(1188,'U160526AA','Кронштейн в сборе'),(1189,'U159628AA','Проставка'),(1190,'BMG-U152667AB-002','Швеллер'),(1191,'U156444AB','Кронштейн'),(1192,'U158577AC','Профиль в сборе'),(1193,'U161141AA','Швеллер'),(1194,'U155320-10AC','Уголок'),(1195,'U161436AE','Стойка задняя в сборе'),(1196,'U158178AA','Уголок'),(1197,'U159219AB','Накладка'),(1198,'U154298AA','Профиль 80х120х5'),(1199,'U160558AA','Швеллер'),(1200,'U161060AA','Труба Ø45x1.5'),(1201,'BMG-U155327AD-000','Cтойка передняя в сборе'),(1202,'U155380AC','Профиль'),(1203,'U160609AA','Скоба'),(1204,'U161104-10AA','Решетка'),(1205,'U152256AA','Кронштейн'),(1206,'U156451AD','Кронштейн в сборе'),(1207,'U160518AA','Кронштейн в сборе'),(1208,'U160604AA','Профиль'),(1209,'U157237AA','Накладка пола водителя'),(1210,'U165370AA','Стенка короба'),(1211,'U154863AA','Стойка крепления отопителя фронтального'),(1212,'U156340AA','Патрубок'),(1213,'U156664AA','Профиль'),(1214,'U150054AA','Профиль'),(1215,'U148381AD','Опора'),(1216,'U163751AA','Пластина'),(1217,'U159301AA','Профиль'),(1218,'U157999AA','Профиль'),(1219,'U155913AA','Стойка'),(1220,'U160539AA','Швеллер'),(1221,'U161154AA','Раскос'),(1222,'U150569AA','Пластина'),(1223,'U156850AB','Швеллер'),(1224,'U159528AC','Облицовка'),(1225,'U161119AA','Ребро'),(1226,'U158784AA','Заглушка'),(1227,'U159341AA','Кронштейн'),(1228,'U155728AB','Обод'),(1229,'U150689AC','Лист'),(1230,'U158404AC','Профиль'),(1231,'U162207AA','Пруток'),(1232,'U158560AB','Накладка'),(1233,'U150817AA','Кронштейн углового редуктора'),(1234,'U150789AA','Пластина'),(1235,'U156218AB','Раскос 20х40х2'),(1236,'U164423AB','Пластина'),(1237,'BMG-U155328AC-001','Cтойка передняя'),(1238,'U148348AC','Лонжерон'),(1239,'U150838AA','Уголок'),(1240,'U149909AA','Профиль'),(1241,'U156873AA','Раскос'),(1242,'U155545AB','Профиль'),(1243,'U155062AB','Накладка'),(1244,'U155454AD','Стенка правая'),(1245,'U159357AA','Швеллер'),(1246,'U158740AB','Стенка'),(1247,'U155504AA','Кронштейн в сборе'),(1248,'U161237AA','Кронштейн в сборе'),(1249,'U158006AA','Профиль в сборе'),(1250,'U158143AA','Накладка'),(1251,'U159527AA','Швеллер'),(1252,'U158376AB','Стойка в сборе'),(1253,'U156839AB','Раскос в сборе'),(1254,'U160205AA','Косынка'),(1255,'U155571AB','Облицовка'),(1256,'U156880AB','Кронштейн'),(1257,'U161144AA','Профиль в сборе'),(1258,'U161492AA','Кронштейн терминала'),(1259,'U152254AA','Пластина закладная'),(1260,'U159909AB','Каркас перегородки'),(1261,'U158995AA','Швеллер'),(1262,'U149155AB','Профиль 50х50х3'),(1263,'U150278AA','Профиль'),(1264,'U154393AA','Швеллер'),(1265,'U154760AA','Кронштейн'),(1266,'U158838AF','Стойка в сборе'),(1267,'U152541AA','Заглушка'),(1268,'U155719AB','Уголок'),(1269,'U150567AA','Накладка'),(1270,'U160853AA','Шайба'),(1271,'U158728AB','Стенка'),(1272,'BMG-U161449AA-000','Cтойка передняя в сборе'),(1273,'U152329AA','Профиль пола опорный'),(1274,'U157105AC','Кронштейн'),(1275,'U163422AA','Усиление пола'),(1276,'U150705AA','Обечайка'),(1277,'U152804AA','Планка'),(1278,'U147827AA','Шпилька приварная M8x20 ISO 13918'),(1279,'U159382AB','Кронштейн'),(1280,'U155654AA','Профиль'),(1281,'U160940-10AA','Заглушка'),(1282,'U156522AC','Стойка в сборе'),(1283,'U157000AA','Ребро'),(1284,'U158697AA','Профиль'),(1285,'U154353AA','Раскос'),(1286,'U158681AA','Профиль'),(1287,'U160036AA','Профиль'),(1288,'U156718AA','Профиль'),(1289,'U165680AA','Панель крепления двери'),(1290,'U150887AB','Кожух'),(1291,'U165355AA','Короб в сборе'),(1292,'U160332AA','Профиль'),(1293,'U160952AA','Ребро'),(1294,'U168820AA','Пластина'),(1295,'U156223AB','Раскос 20х40х2'),(1296,'U159858AE','Верхняя часть пола водителя'),(1297,'U156818AD','Накладка'),(1298,'U158154AA','Раскос 20х40х2'),(1299,'U156823AB','Усиление крепления бачка в сборе'),(1300,'U158863AB','Профиль'),(1301,'U156680AA','Уголок'),(1302,'U155998AE','Накладка'),(1303,'U150985AA','Раскос'),(1304,'U181451AA','Швеллер'),(1305,'U160428AA','Профиль'),(1306,'U156938AB','Кронштейн'),(1307,'U155296AA','Профиль 50х50х3'),(1308,'U169172AA','Дуга в сборе'),(1309,'U156905AB','Раскос'),(1310,'U159896AE','Каркас пола заднего'),(1311,'U161352AD','Каркас пола заднего в сборе'),(1312,'U160256AA','Накладка'),(1313,'U155489AA','Профиль'),(1314,'U155804AC','Облицовка левая'),(1315,'U160004AA','Кронштейн в сборе'),(1316,'U168339AA','Кронштейн кондиционера кабины водителя'),(1317,'U159440AA','Раскос в сборе'),(1318,'U155865AB','Кронштейн огнетушителя'),(1319,'U155810AB','Облицовка люка'),(1320,'U158067AB','Раскос'),(1321,'U150983AA','Стойка'),(1322,'U156848AB','Раскос в сборе'),(1323,'U159329AA','Раскос'),(1324,'U148345AD','Профиль 80х120х5'),(1325,'U154883AC','Втулка'),(1326,'U165030AA','Профиль нижнего проема'),(1327,'U156601-10AA','Накладка'),(1328,'U158785-10AC','Профиль'),(1329,'U156674AA','Пластина'),(1330,'U163317AA','Профиль в сборе'),(1331,'U155197AD','Профиль порога в сборе'),(1332,'U152413AB','Стойка'),(1333,'U160334AA','Профиль'),(1334,'U155210AC','Накладка порога'),(1335,'U155662AA','Кронштейн в сборе'),(1336,'U161105AB','Уголок'),(1337,'U161124AB','Накладка'),(1338,'U152185AC','Накладка'),(1339,'U157343AC','Профиль в сборе'),(1340,'U157367AA','Раскос'),(1341,'U160245AB','Кожух'),(1342,'U158991AB','Проставка'),(1343,'U156816AC','Накладка'),(1344,'U159156AA','Кожух'),(1345,'U152289AA','Раскос'),(1346,'U156967AB','Уголок'),(1347,'U150697AA','Накладка'),(1348,'U159383AA','Пластина'),(1349,'U150707AA','Обечайка в сборе'),(1350,'U158495AB','Кронштейн в сборе'),(1351,'U156910AB','Швеллер'),(1352,'U160380AA','Раскос'),(1353,'U158990AD','Патрубок'),(1354,'U149954-10AB','Кронштейн'),(1355,'U160664AB','Швеллер'),(1356,'U164633AA','Кронштейн кабеля двигателя'),(1357,'U158959AD','Профиль'),(1358,'U159595AB','Уголок'),(1359,'U158551AB','Опора'),(1360,'U156555AB','Профиль'),(1361,'U150408AA','Профиль'),(1362,'U154240AB','Профиль'),(1363,'U157594AA','Накладка'),(1364,'U161366AE','Каркас боковины правой'),(1365,'U159662AA','Кронштейн'),(1366,'U157853AA','Профиль'),(1367,'U152764AA','Раскос'),(1368,'U149558-10AC','Лист передний'),(1369,'U152091AA','Лист герметизации'),(1370,'U152250AD','Опора крепления двери кабины водителя'),(1371,'U157613AB','Профиль'),(1372,'U168384AA','Швеллер'),(1373,'U150922AA','Профиль'),(1374,'U159597AA','Раскос'),(1375,'U151111AD','Бонка'),(1376,'U150767AA','Профиль'),(1377,'U158299AC','Стенка'),(1378,'U160171AA','Стойка в сборе'),(1379,'U152315AA','Кронштейн'),(1380,'U154723AB','Кронштейн'),(1381,'U156409AB','Швеллер правый'),(1382,'U150918AC','Профиль в сборе'),(1383,'U158388AA','Кожух'),(1384,'U161463AC','Облицовка стойки'),(1385,'U148264AA','Профиль'),(1386,'U157332AA','Заглушка'),(1387,'U159164AA','Профиль'),(1388,'U158269AB','Профиль'),(1389,'U160617AA','Профиль'),(1390,'U158977AD','Стойка'),(1391,'U162455AA','Профиль модуля переднего в сборе'),(1392,'U165010AA','Кронштейн крепления отопителя'),(1393,'U159169AA','Накладка'),(1394,'U160302AA','Раскос'),(1395,'U155935AA','Профиль'),(1396,'U154317AD','Кронштейн'),(1397,'U157320AA','Раскос'),(1398,'U152531AA','Накладка'),(1399,'U152458AA','Шайба'),(1400,'U154726AB','Накладка'),(1401,'U163626AA','Косынка'),(1402,'U160163AA','Уголок'),(1403,'U152104AA','Профиль усилительный кронштейна стеклоочистителя'),(1404,'U161078-10AA','Решетка'),(1405,'U159645AA','Раскос'),(1406,'U160645AA','Стойка'),(1407,'U160456AA','Швеллер в сборе'),(1408,'U155502AB','Профиль'),(1409,'U158085AB','Раскос'),(1410,'U158504AA','Кронштейн'),(1411,'U160140AA','Накладка'),(1412,'U157615AB','Профиль'),(1413,'U166056AA','Кронштейн накладки в сборе'),(1414,'U161097AA','Накладка'),(1415,'U150703AA','Накладка'),(1416,'U169500AA','Скоба'),(1417,'U158347AA','Уголок'),(1418,'U150185AA','Стойка'),(1419,'U150033AA','Профиль опорный'),(1420,'U160480AA','Профиль'),(1421,'U159566AB','Профиль'),(1422,'U165132AA','Накладка'),(1423,'U160460AA','Швеллер'),(1424,'U152671AA','Кронштейн'),(1425,'U157807AA','Ребро'),(1426,'U160889AA','Раскос'),(1427,'U155481AB','Облицовка пола'),(1428,'U156691AB','Профиль'),(1429,'U152850AG','Каркас крыши'),(1430,'U159905AC','Каркас подиума задней части'),(1431,'U155178AF','Стойка'),(1432,'U152627AA','Гайка приварная М10 Emile Maurin 6460710'),(1433,'U160801AB','Профиль'),(1434,'U155722AD','Облицовка левая'),(1435,'U152813AA','Опора'),(1436,'U155941AB','Профиль'),(1437,'U157325AA','Профиль'),(1438,'U151063AA','Заглушка'),(1439,'U157371AC','Раскос в сборе'),(1440,'U150830AG','Кожух в сборе'),(1441,'U159814AD','Левая часть каркаса модуля крепления передней подвески'),(1442,'U158713AC','Опора в сборе'),(1443,'U149619AJ','Основание в сборе'),(1444,'U158532AA','Профиль в сборе'),(1445,'U156861AA','Профиль'),(1446,'U156742AA','Ребро'),(1447,'U154296AA','Профиль'),(1448,'U157618AA','Пруток'),(1449,'U150141AA','Раскос'),(1450,'U156845AB','Раскос'),(1451,'U152394AC','Опора крепления двери кабины водителя в сборе'),(1452,'U158835AD','Кронштейн в сборе'),(1453,'U156927AA','Швеллер'),(1454,'U158371AA','Уголок'),(1455,'U155313AB','Профиль'),(1456,'U156955AA','Швеллер'),(1457,'U155155AA','Профиль усилительный'),(1458,'U159717AB','Швеллер'),(1459,'U164957AA','Косынка соединения'),(1460,'U155944AB','Стенка'),(1461,'U164850AA','Ребро в сборе'),(1462,'U154777AB','Короб'),(1463,'U160830AA','Швеллер'),(1464,'U159111AA','Кронштейн фиксации АКБ'),(1465,'U161003AC','Площадка'),(1466,'U164781AA','Стойка в сборе'),(1467,'U152473AA','Заглушка'),(1468,'U157710AA','Заглушка'),(1469,'U159381AC','Кронштейн в сборе'),(1470,'U161150AA','Накладка'),(1471,'BMG-U164860AA-003','Ребро'),(1472,'U160713AA','Скоба в сборе'),(1473,'U164636AA','Кронштейн в сборе'),(1474,'U150679AA','Профиль опорный центральный'),(1475,'U156878AA','Накладка'),(1476,'U155612AB','Профиль'),(1477,'U157681AB','Профиль'),(1478,'U152274AH','Каркас модуля крепления передней подвески'),(1479,'U155037AD','Панель облицовки в сборе'),(1480,'U160705AA','Профиль'),(1481,'U150664AF','Установка облицовки переднего модуля'),(1482,'U159730AB','Швеллер'),(1483,'U160463AC','Лист пола'),(1484,'U152428AA','Кронштейн'),(1485,'U154367AB','Ребро'),(1486,'U160443AB','Раскос'),(1487,'U155051AA','Заглушка'),(1488,'U150280AB','Профиль 50х80х3'),(1489,'U157368AB','Профиль'),(1490,'U161201AA','Уголок'),(1491,'U156224AB','Раскос 20х40х2'),(1492,'U162795AA','Накладка передней двери в сборе'),(1493,'U152125-10AA','Заглушка'),(1494,'U158481AD','Стойка в сборе'),(1495,'U161370AB','Правая боковина'),(1496,'U155920AB','Профиль'),(1497,'U155378AB','Профиль в сборе'),(1498,'U154857AB','Профиль крепления отопителя фронтального'),(1499,'U161478AA','Кронштейн терминала'),(1500,'U157984AA','Профиль'),(1501,'U155921AD','Кронштейн'),(1502,'U158753AA','Кронштейн'),(1503,'U158188AC','Ребро'),(1504,'U156814AC','Усиление крепления бачка в сборе'),(1505,'U163475AC','Кронштейн'),(1506,'U148185AG','Каркас кузова в сборе'),(1507,'U151135AA','Накладка'),(1508,'U150292AA','Раскос 20х40х2'),(1509,'U157317AA','Раскос'),(1510,'U155830AC','Облицовка'),(1511,'U152526AA','Накладка'),(1512,'U161018AA','Лист'),(1513,'U157738AB','Опора'),(1514,'U163293AA','Ребро'),(1515,'U152539AB','Профиль в сборе'),(1516,'U157686AA','Профиль в сборе'),(1517,'U145912AA','Заклепка шестигранная вытяжная резьбовая М5 Bollhoff 343 41 050 055'),(1518,'U155195AB','Обечайка'),(1519,'U155013AA','Стенка'),(1520,'U160344AA','Кронштейн'),(1521,'U156003AA','Профиль передний в сборе'),(1522,'U150332AB','Уголок'),(1523,'U159769AA','Кронштейн'),(1524,'U163747AC','Площадка в сборе'),(1525,'U161085AA','Швеллер'),(1526,'U149217AD','Дуга'),(1527,'U156974AC','Раскос'),(1528,'U159409AA','Лист'),(1529,'U179712AA','Стойка в сборе'),(1530,'U161396AB','Короб в сборе'),(1531,'U152540AJ','Установка приварных элементов модуля заднего'),(1532,'U156757AB','Профиль в сборе'),(1533,'U156012AD','Кронштейн опорный в сборе'),(1534,'U158300AC','Стенка'),(1535,'U154769AA','Кронштейн в сборе'),(1536,'U159256AB','Кронштейн в сборе'),(1537,'N162219AE','Установка скоб'),(1538,'U156801AB','Раскос в сборе'),(1539,'U163190AA','Дуга'),(1540,'U157009AB','Накладка'),(1541,'U155815AD','Накладка'),(1542,'U155192AC','Профиль'),(1543,'U160943AB','Опора'),(1544,'U156759AB','Швеллер в сборе'),(1545,'U157485AC','Профиль в сборе'),(1546,'U157354AA','Раскос в сборе'),(1547,'U157699AB','Профиль в сборе'),(1548,'U154704AE','Короб'),(1549,'U159634AA','Заглушка'),(1550,'U163225AA','Платик'),(1551,'U160896AB','Кронштейн в сборе'),(1552,'U155231AA','Косынка'),(1553,'U156526AB','Профиль'),(1554,'U150682AA','Стойка'),(1555,'U155381AA','Заглушка в сборе'),(1556,'U156805AD','Раскос'),(1557,'U158270AA','Профиль в сборе'),(1558,'U159182AA','Швеллер'),(1559,'U152457AA','Шпилька М12х50'),(1560,'U154486AA','Кронштейн'),(1561,'U159624AA','Проставка'),(1562,'U104749AA','Шпилька опресовочная М6х15'),(1563,'U165149AC','Накладка  передней двери в сборе'),(1564,'U157130AA','Стойка в сборе'),(1565,'U156747AA','Облицовка'),(1566,'BMG-U152514AD-001','Cтойка передняя'),(1567,'U160998AA','Профиль'),(1568,'U159531AA','Накладка'),(1569,'U150839AA','Короб'),(1570,'U159350AA','Кронштейн в сборе'),(1571,'U155534AB','Уголок'),(1572,'U150656AB','Швеллер опорный'),(1573,'U152511AC','Профиль в сборе'),(1574,'U154603AC','Кронштейн в сборе'),(1575,'U158363AC','Раскос в сборе'),(1576,'U155757AB','Панель'),(1577,'U157703AA','Швеллер'),(1578,'U149557-10AB','Лист передний'),(1579,'U152445AA','Раскос'),(1580,'U156720AA','Профиль'),(1581,'U155095AD','Профиль в сборе'),(1582,'U149426AA','Уголок'),(1583,'U160832AA','Профиль крепления отопителя фронтального'),(1584,'U160519AA','Кронштейн'),(1585,'U150632AA','Швеллер'),(1586,'U163072AB','Накладка'),(1587,'U159344AA','Накладка в сборе'),(1588,'U153026AA','Лонжерон'),(1589,'U150708AA','Втулка'),(1590,'U161242AB','Кронштейн в сборе'),(1591,'U160091AA','Заглушка'),(1592,'U157064AB','Кронштейн в сборе'),(1593,'U156983AC','Кронштейн'),(1594,'U157386AA','Раскос'),(1595,'U156854AB','Профиль крепления бачка'),(1596,'U159712AB','Швеллер'),(1597,'U157804AB','Уголок'),(1598,'U159728AB','Швеллер'),(1599,'U149560AC','Уголок'),(1600,'U157874AB','Швеллер'),(1601,'U156844AB','Раскос'),(1602,'U157544AA','Раскос 50х80х3'),(1603,'U157593AA','Профиль'),(1604,'U156191AB','Профиль'),(1605,'U158879AB','Заглушка'),(1606,'U156568AC','Профиль в сборе'),(1607,'U157709AB','Заглушка'),(1608,'U150810AB','Кронштейн'),(1609,'U150901AC','Кронштейн в сборе'),(1610,'U152538AC','Стойка'),(1611,'U152951AA','Раскос'),(1612,'U159170AA','Профиль в сборе'),(1613,'U158151AA','Профиль'),(1614,'U158675AA','Дуга'),(1615,'U152474AH','Приварные элементы каркаса боковины левой'),(1616,'U150766AC','Профиль в сборе'),(1617,'U160929AA','Накладка'),(1618,'U156168AB','Раскос'),(1619,'U157227AC','Профиль 40х40х3'),(1620,'U149290AB','Плита'),(1621,'U159608AA','Пластина'),(1622,'U156463AB','Профиль в сборе'),(1623,'U152296-10AA','Кронштейн'),(1624,'U157595AB','Дно'),(1625,'U155339AC','Опора в сборе'),(1626,'U104800AB','Идентификационная табличка кузова'),(1627,'U155052AA','Заглушка'),(1628,'U158311AC','Профиль'),(1629,'U158997AB','Проставка'),(1630,'U160005AA','Кронштейн'),(1631,'U155496AA','Швеллер'),(1632,'U150655AB','Швеллер опорный'),(1633,'U155893AB','Кронштейн огнетушителя'),(1634,'U155846AB','Профиль в сборе'),(1635,'U157871AA','Профиль'),(1636,'U152852AG','Установка приварных элементов каркаса крыши');
/*!40000 ALTER TABLE `defects_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_photodefects`
--

DROP TABLE IF EXISTS `defects_photodefects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_photodefects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `defect_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `defects_photodefects_defect_id_7779b7dd_fk_defects_defects_id` (`defect_id`),
  CONSTRAINT `defects_photodefects_defect_id_7779b7dd_fk_defects_defects_id` FOREIGN KEY (`defect_id`) REFERENCES `defects_defects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_photodefects`
--

LOCK TABLES `defects_photodefects` WRITE;
/*!40000 ALTER TABLE `defects_photodefects` DISABLE KEYS */;
/*!40000 ALTER TABLE `defects_photodefects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_priority`
--

DROP TABLE IF EXISTS `defects_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_priority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `priority_status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_priority`
--

LOCK TABLES `defects_priority` WRITE;
/*!40000 ALTER TABLE `defects_priority` DISABLE KEYS */;
INSERT INTO `defects_priority` VALUES (1,'Низкий'),(2,'Средний'),(3,'Высокий'),(4,'Срочный');
/*!40000 ALTER TABLE `defects_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_probabilityestimate`
--

DROP TABLE IF EXISTS `defects_probabilityestimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_probabilityestimate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_probabilityestimate`
--

LOCK TABLES `defects_probabilityestimate` WRITE;
/*!40000 ALTER TABLE `defects_probabilityestimate` DISABLE KEYS */;
INSERT INTO `defects_probabilityestimate` VALUES (1,1,'Крайне маловероятно'),(2,2,'Маловероятно'),(3,3,'Возможно'),(4,4,'Весьма вероятно'),(5,5,'Практически достоверно');
/*!40000 ALTER TABLE `defects_probabilityestimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_scaleofconsequences`
--

DROP TABLE IF EXISTS `defects_scaleofconsequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_scaleofconsequences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_scaleofconsequences`
--

LOCK TABLES `defects_scaleofconsequences` WRITE;
/*!40000 ALTER TABLE `defects_scaleofconsequences` DISABLE KEYS */;
INSERT INTO `defects_scaleofconsequences` VALUES (1,1,'Незначительный риск'),(2,2,'Небольшой риск'),(3,3,'Средний риск'),(4,4,'Высокий риск'),(5,5,'Крайне высокий риск');
/*!40000 ALTER TABLE `defects_scaleofconsequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_status`
--

DROP TABLE IF EXISTS `defects_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `defect_status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_status`
--

LOCK TABLES `defects_status` WRITE;
/*!40000 ALTER TABLE `defects_status` DISABLE KEYS */;
INSERT INTO `defects_status` VALUES (1,'Обнаружен дефект'),(2,'Дефект устранен'),(3,'Дефект с допуском к производству'),(4,'Брак');
/*!40000 ALTER TABLE `defects_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_typeofmismatch`
--

DROP TABLE IF EXISTS `defects_typeofmismatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_typeofmismatch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mismatch` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `probability_estimate_id` bigint(20) NOT NULL,
  `scale_consequences_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `defects_typeofmismat_probability_estimate_bca0bcae_fk_defects_p` (`probability_estimate_id`),
  KEY `defects_typeofmismat_scale_consequences_i_5a0ed394_fk_defects_s` (`scale_consequences_id`),
  CONSTRAINT `defects_typeofmismat_probability_estimate_bca0bcae_fk_defects_p` FOREIGN KEY (`probability_estimate_id`) REFERENCES `defects_probabilityestimate` (`id`),
  CONSTRAINT `defects_typeofmismat_scale_consequences_i_5a0ed394_fk_defects_s` FOREIGN KEY (`scale_consequences_id`) REFERENCES `defects_scaleofconsequences` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_typeofmismatch`
--

LOCK TABLES `defects_typeofmismatch` WRITE;
/*!40000 ALTER TABLE `defects_typeofmismatch` DISABLE KEYS */;
INSERT INTO `defects_typeofmismatch` VALUES (1,'Брызги от сварки',5,1),(2,'Деталь не соответствует КД',3,5),(3,'Деталь приварена не по КД',3,5),(4,'Механические повреждения на детали',3,4),(5,'Не выдержан линейный размер',4,3),(6,'Не зачищен сварной шов',4,2),(7,'Несоответствие CF размера',4,5),(8,'Отсутствие детали, заклепки, гайки',4,5),(9,'Отсутствие сварного шва, лишний сварной шов',3,5),(10,'Приварена не та деталь',3,5),(11,'Сварочные дефекты',5,2),(12,'Крыша сверху. Дефекты ЛКП',3,3),(13,'Салон, боковины, основание. Непрокрасы',5,2),(14,'Основание. Недостаточная толщина антигравия',2,4),(15,'Пол сверху. Дефекты герметизации',2,3);
/*!40000 ALTER TABLE `defects_typeofmismatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects_workshops`
--

DROP TABLE IF EXISTS `defects_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects_workshops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_workshop` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsible_executor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `defects_workshops_responsible_executor_55ca3f9d_fk_auth_user` (`responsible_executor_id`),
  CONSTRAINT `defects_workshops_responsible_executor_55ca3f9d_fk_auth_user` FOREIGN KEY (`responsible_executor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects_workshops`
--

LOCK TABLES `defects_workshops` WRITE;
/*!40000 ALTER TABLE `defects_workshops` DISABLE KEYS */;
INSERT INTO `defects_workshops` VALUES (1,'Заготовительный цех',2),(2,'Кузовной цех',3),(3,'Цех окраски',4),(4,'Экспериментальный цех',5);
/*!40000 ALTER TABLE `defects_workshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-14 12:38:20.460802','1','Крайне маловероятно',1,'[{\"added\": {}}]',11,1),(2,'2021-09-14 12:38:30.505104','2','Маловероятно',1,'[{\"added\": {}}]',11,1),(3,'2021-09-14 12:38:38.904130','3','Возможно',1,'[{\"added\": {}}]',11,1),(4,'2021-09-14 12:38:51.326864','4','Весьма вероятно',1,'[{\"added\": {}}]',11,1),(5,'2021-09-14 12:39:09.983325','5','Практически достоверно',1,'[{\"added\": {}}]',11,1),(6,'2021-09-14 12:39:31.500548','1','Низкий',1,'[{\"added\": {}}]',10,1),(7,'2021-09-14 12:39:35.305087','2','Средний',1,'[{\"added\": {}}]',10,1),(8,'2021-09-14 12:39:39.384495','3','Высокий',1,'[{\"added\": {}}]',10,1),(9,'2021-09-14 12:39:44.441818','4','Срочный',1,'[{\"added\": {}}]',10,1),(10,'2021-09-14 12:40:15.695129','1','Незначительный риск',1,'[{\"added\": {}}]',12,1),(11,'2021-09-14 12:40:30.164508','2','Небольшой риск',1,'[{\"added\": {}}]',12,1),(12,'2021-09-14 12:40:44.707988','3','Возможно',1,'[{\"added\": {}}]',12,1),(13,'2021-09-14 12:40:58.297737','4','Весьма вероятно',1,'[{\"added\": {}}]',12,1),(14,'2021-09-14 12:41:19.898331','5','Крайне высокий риск',1,'[{\"added\": {}}]',12,1),(15,'2021-09-14 12:41:32.612805','3','Средний риск',2,'[{\"changed\": {\"fields\": [\"\\u041e\\u0446\\u0435\\u043d\\u043a\\u0430\"]}}]',12,1),(16,'2021-09-14 12:41:45.634388','4','Высокий риск',2,'[{\"changed\": {\"fields\": [\"\\u041e\\u0446\\u0435\\u043d\\u043a\\u0430\"]}}]',12,1),(17,'2021-09-14 12:43:42.653333','1','Обнаружен дефект',1,'[{\"added\": {}}]',13,1),(18,'2021-09-14 12:44:17.054420','2','Дефект устранен',1,'[{\"added\": {}}]',13,1),(19,'2021-09-14 12:44:42.783054','3','Дефект с допуском к производству',1,'[{\"added\": {}}]',13,1),(20,'2021-09-14 12:44:50.555415','4','Брак',1,'[{\"added\": {}}]',13,1),(21,'2021-09-14 12:52:49.240513','1','Брызги от сварки',1,'[{\"added\": {}}]',15,1),(22,'2021-09-14 12:53:04.628809','2','Деталь не соответствует КД',1,'[{\"added\": {}}]',15,1),(23,'2021-09-14 12:53:17.028059','3','Деталь приварена не по КД',1,'[{\"added\": {}}]',15,1),(24,'2021-09-14 12:53:28.589735','4','Механические повреждения на детали',1,'[{\"added\": {}}]',15,1),(25,'2021-09-14 12:53:42.389339','5','Не выдержан линейный размер',1,'[{\"added\": {}}]',15,1),(26,'2021-09-14 12:53:53.289264','6','Не зачищен сварной шов',1,'[{\"added\": {}}]',15,1),(27,'2021-09-14 12:54:05.290941','7','Несоответствие CF размера',1,'[{\"added\": {}}]',15,1),(28,'2021-09-14 12:54:18.220533','8','Отсутствие детали, заклепки, гайки',1,'[{\"added\": {}}]',15,1),(29,'2021-09-14 12:54:28.259971','9','Отсутствие сварного шва, лишний сварной шов',1,'[{\"added\": {}}]',15,1),(30,'2021-09-14 12:54:40.611673','10','Приварена не та деталь',1,'[{\"added\": {}}]',15,1),(31,'2021-09-14 12:54:55.659402','11','Сварочные дефекты',1,'[{\"added\": {}}]',15,1),(32,'2021-09-14 12:55:06.485231','12','Крыша сверху. Дефекты ЛКП',1,'[{\"added\": {}}]',15,1),(33,'2021-09-14 12:55:16.314952','13','Салон, боковины, основание. Непрокрасы',1,'[{\"added\": {}}]',15,1),(34,'2021-09-14 12:55:31.034920','14','Основание. Недостаточная толщина антигравия',1,'[{\"added\": {}}]',15,1),(35,'2021-09-14 12:55:40.143151','15','Пол сверху. Дефекты герметизации',1,'[{\"added\": {}}]',15,1),(36,'2021-09-14 13:00:11.687514','2','i.kulakova',1,'[{\"added\": {}}]',4,1),(37,'2021-09-14 13:01:20.191838','3','d.bichenok',1,'[{\"added\": {}}]',4,1),(38,'2021-09-14 13:02:14.668456','4','a.zaicev',1,'[{\"added\": {}}]',4,1),(39,'2021-09-14 13:03:00.849769','5','s.klochkov',1,'[{\"added\": {}}]',4,1),(40,'2021-09-14 13:04:01.502260','5','s.klochkov',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(41,'2021-09-14 13:04:33.304456','4','a.zaicev',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(42,'2021-09-14 13:05:00.832371','3','d.bichenok',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(43,'2021-09-14 13:05:26.531018','2','i.kulakova',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(44,'2021-09-14 13:05:46.103878','1','rsg',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(45,'2021-09-14 13:06:56.661921','1','Заготовительный цех',1,'[{\"added\": {}}]',14,1),(46,'2021-09-14 13:07:10.311659','2','Кузовной цех',1,'[{\"added\": {}}]',14,1),(47,'2021-09-14 13:07:22.885762','3','Цех окраски',1,'[{\"added\": {}}]',14,1),(48,'2021-09-14 13:07:42.454692','4','Экспериментальный цех',1,'[{\"added\": {}}]',14,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'defects','bodies'),(8,'defects','defects'),(9,'defects','details'),(16,'defects','photodefects'),(10,'defects','priority'),(11,'defects','probabilityestimate'),(12,'defects','scaleofconsequences'),(13,'defects','status'),(15,'defects','typeofmismatch'),(14,'defects','workshops'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-14 12:33:00.517514'),(2,'auth','0001_initial','2021-09-14 12:33:00.846882'),(3,'admin','0001_initial','2021-09-14 12:33:00.949893'),(4,'admin','0002_logentry_remove_auto_add','2021-09-14 12:33:00.973790'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-14 12:33:00.993702'),(6,'contenttypes','0002_remove_content_type_name','2021-09-14 12:33:01.036862'),(7,'auth','0002_alter_permission_name_max_length','2021-09-14 12:33:01.068258'),(8,'auth','0003_alter_user_email_max_length','2021-09-14 12:33:01.085946'),(9,'auth','0004_alter_user_username_opts','2021-09-14 12:33:01.101839'),(10,'auth','0005_alter_user_last_login_null','2021-09-14 12:33:01.132276'),(11,'auth','0006_require_contenttypes_0002','2021-09-14 12:33:01.135750'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-14 12:33:01.158630'),(13,'auth','0008_alter_user_username_max_length','2021-09-14 12:33:01.198296'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-14 12:33:01.230195'),(15,'auth','0010_alter_group_name_max_length','2021-09-14 12:33:01.259329'),(16,'auth','0011_update_proxy_permissions','2021-09-14 12:33:01.282000'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-14 12:33:01.317724'),(18,'defects','0001_initial','2021-09-14 12:33:02.085201'),(19,'sessions','0001_initial','2021-09-14 12:33:02.115334');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8v1mqw12rw61wd79jv9lxi9ic7o0ewbj','.eJxVjDkOwjAUBe_iGlnxArYp6XMG62_BAeRIcVIh7k4ipYD2zcx7qwzrUvLaZM4jq6sy6vS7IdBT6g74AfU-aZrqMo-od0UftOl-YnndDvfvoEArWx2CBCZktoguJTS-M4lNskn8QB34s4kpbBBwQG99DAwOLiBkXCRn1ecL9_84WA:1mQ7fZ:PnUFZxtmzPl-UfVf_VnWKOy-zF0OCrR5pL7t1a60e0k','2021-09-28 12:36:13.250118');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-14 16:11:28
