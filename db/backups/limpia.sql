-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: unisan
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('ccfdbca5-bed5-11eb-a54d-0242ac120003','Unidades Sanitarias',NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccfe3567-bed5-11eb-a54d-0242ac120003','Bacterias',NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccfeaddd-bed5-11eb-a54d-0242ac120003','Aromatizantes',NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccff2811-bed5-11eb-a54d-0242ac120003','Productos químicos',NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotization`
--

DROP TABLE IF EXISTS `cotization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotization` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `model_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comercial_address_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_address_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observation` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_896B83257975B7E7` (`model_id`),
  CONSTRAINT `FK_896B83257975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotization`
--

LOCK TABLES `cotization` WRITE;
/*!40000 ALTER TABLE `cotization` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('cd023e51-bed5-11eb-a54d-0242ac120003','Peso chileno','CLP','$',1,'2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_seller` tinyint(1) NOT NULL,
  `code_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_code` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_validate` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo`
--

DROP TABLE IF EXISTS `demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo`
--

LOCK TABLES `demo` WRITE;
/*!40000 ALTER TABLE `demo` DISABLE KEYS */;
INSERT INTO `demo` VALUES ('ccf3a5d6-bed5-11eb-a54d-0242ac120003','Mock - 1','Description mock - 1','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf42d6f-bed5-11eb-a54d-0242ac120003','Mock - 2','Description mock - 2','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf4a093-bed5-11eb-a54d-0242ac120003','Mock - 3','Description mock - 3','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf5028c-bed5-11eb-a54d-0242ac120003','Mock - 4','Description mock - 4','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf569b3-bed5-11eb-a54d-0242ac120003','Mock - 5','Description mock - 5','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf5f07d-bed5-11eb-a54d-0242ac120003','Mock - 6','Description mock - 6','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf663b4-bed5-11eb-a54d-0242ac120003','Mock - 7','Description mock - 7','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf6d78c-bed5-11eb-a54d-0242ac120003','Mock - 8','Description mock - 8','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf73809-bed5-11eb-a54d-0242ac120003','Mock - 9','Description mock - 9','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ccf79ea7-bed5-11eb-a54d-0242ac120003','Mock - 10','Description mock - 10','2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `for_section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `json_models` longtext COLLATE utf8_unicode_ci NOT NULL,
  `json_services` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter`
--

LOCK TABLES `filter` WRITE;
/*!40000 ALTER TABLE `filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `user_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `resource` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F3F68C5A76ED395` (`user_id`),
  CONSTRAINT `FK_8F3F68C5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `service_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `for_home` tinyint(1) NOT NULL,
  `for_industry` tinyint(1) NOT NULL,
  `for_event` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model3d` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `spec` longtext COLLATE utf8_unicode_ci,
  `conditions` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D79572D9ED5CA9E6` (`service_id`),
  CONSTRAINT `FK_D79572D9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES ('cd3d3765-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,0,1,'Baño Químico Vip',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd3dbd96-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,0,1,'Baño Químico Minusválido',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd3e27fb-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Baño Químico con conexión',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd3e9b2b-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Carro Urbano simple',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd3f17aa-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Carro Agrícola Doble',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd3f9048-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',1,1,0,'Baño Químico',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd400910-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Ducha Portátil',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd407bef-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Arnés Alzador',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd40ef88-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Punto de Agua',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd41721f-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Caseta de Vigilancia simple',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd41f325-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Caseta de Vigilancia con baño',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd42747a-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Caseta de Vigilancia doble',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd42da5a-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,0,1,'Caseta Mudador',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd434b1d-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,0,'Urinario Urijet',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd43b60b-bed5-11eb-a54d-0242ac120003','cd326cfb-bed5-11eb-a54d-0242ac120003',0,1,1,'Urinario pasillo',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd459007-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Trailer Vip',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd45f8b2-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Trailer Presidencial',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd465cc4-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Trailer Minusvalido',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd46c372-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Trailer Gold',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd47255b-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Trailer Silver',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd478f44-bed5-11eb-a54d-0242ac120003','cd32dca9-bed5-11eb-a54d-0242ac120003',1,1,1,'Torres de Iluminación',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd49006e-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',0,1,0,'Retiro de Riles',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd496b96-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',0,1,0,'Retiro de Grasas',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd49cec7-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',1,1,0,'Retiro de Aguas Servidas',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4a369e-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',1,1,0,'Limpieza Hydrojet',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4aa783-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',1,1,0,'Destape de ductos',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4b1c56-bed5-11eb-a54d-0242ac120003','cd335723-bed5-11eb-a54d-0242ac120003',1,1,0,'Mantención de Camaras',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4cf20b-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,1,'Tolva abierta 12 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4d69c4-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,1,'Tolva abierta 20 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4dd3d1-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,1,'Tolva abierta 30 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4e3f27-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,0,'Autocompactador 20 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4e9ff7-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,0,'Tolva cerrada 15 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4f0c8b-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,0,'Tolva estanco 15 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4f7800-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,0,'Alza contenedor',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd4ff4b3-bed5-11eb-a54d-0242ac120003','cd33cfde-bed5-11eb-a54d-0242ac120003',0,1,0,'Contenedores plásticos',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd51a375-bed5-11eb-a54d-0242ac120003','cd343c52-bed5-11eb-a54d-0242ac120003',0,1,0,'Retiro de Respel',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd522286-bed5-11eb-a54d-0242ac120003','cd343c52-bed5-11eb-a54d-0242ac120003',0,1,0,'Bodegas Respel',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd539fed-bed5-11eb-a54d-0242ac120003','cd34ac63-bed5-11eb-a54d-0242ac120003',0,1,0,'Multibucket 5 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd547455-bed5-11eb-a54d-0242ac120003','cd34ac63-bed5-11eb-a54d-0242ac120003',0,1,0,'Multibucket 9 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd54e87e-bed5-11eb-a54d-0242ac120003','cd34ac63-bed5-11eb-a54d-0242ac120003',1,0,0,'Tolva abierta 12 m3',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd55602a-bed5-11eb-a54d-0242ac120003','cd34ac63-bed5-11eb-a54d-0242ac120003',0,1,0,'Bagster',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd55d618-bed5-11eb-a54d-0242ac120003','cd34ac63-bed5-11eb-a54d-0242ac120003',0,1,0,'Jaula Segregación',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd573944-bed5-11eb-a54d-0242ac120003','cd352b58-bed5-11eb-a54d-0242ac120003',0,1,0,'Jaula de Reciclaje',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd57b1e3-bed5-11eb-a54d-0242ac120003','cd352b58-bed5-11eb-a54d-0242ac120003',0,1,1,'Puntos Limpios',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd582fe3-bed5-11eb-a54d-0242ac120003','cd352b58-bed5-11eb-a54d-0242ac120003',0,1,0,'Enfardadora en origen',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd58bc0f-bed5-11eb-a54d-0242ac120003','cd352b58-bed5-11eb-a54d-0242ac120003',0,1,0,'Tolvas de Segregación',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd591cac-bed5-11eb-a54d-0242ac120003','cd352b58-bed5-11eb-a54d-0242ac120003',0,1,0,'Retiro de reciclables',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd5a9cbe-bed5-11eb-a54d-0242ac120003','cd35d6da-bed5-11eb-a54d-0242ac120003',0,1,0,'Oficinas',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd5b1ff8-bed5-11eb-a54d-0242ac120003','cd35d6da-bed5-11eb-a54d-0242ac120003',0,1,0,'Espacios abiertos',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd5b8841-bed5-11eb-a54d-0242ac120003','cd35d6da-bed5-11eb-a54d-0242ac120003',0,1,0,'Sanitarios',NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.','2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `popup_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `picture` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CFBDFA147CA3AC35` (`popup_id`),
  CONSTRAINT `FK_CFBDFA147CA3AC35` FOREIGN KEY (`popup_id`) REFERENCES `popup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `orders_status_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E52FFDEE9395C3F3` (`customer_id`),
  KEY `IDX_E52FFDEE193741E5` (`orders_status_id`),
  CONSTRAINT `FK_E52FFDEE193741E5` FOREIGN KEY (`orders_status_id`) REFERENCES `orders_status` (`id`),
  CONSTRAINT `FK_E52FFDEE9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_item`
--

DROP TABLE IF EXISTS `orders_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_item` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `order_id` int(11) DEFAULT NULL,
  `product_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `price` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1CEE4B58D9F6D38` (`order_id`),
  KEY `IDX_B1CEE4B54584665A` (`product_id`),
  CONSTRAINT `FK_B1CEE4B54584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_B1CEE4B58D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_item`
--

LOCK TABLES `orders_item` WRITE;
/*!40000 ALTER TABLE `orders_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES ('CANCELLED','Cancelado','danger',900,0,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('DELIVERED','Entregado','info',300,0,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ENTERED','Ingresado','warning',100,1,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('IN_PROCCESS','En proceso','primary',200,0,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('INVOICED','Facturado','success',400,0,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ON_DELIVERY','En entrega','warning',250,0,'2021-05-27 10:25:04','2021-05-27 10:25:04',1);
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `order_id` int(11) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `gross` double NOT NULL,
  `total` double NOT NULL,
  `vat` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_83854EFF8D9F6D38` (`order_id`),
  KEY `IDX_83854EFF38248176` (`currency_id`),
  CONSTRAINT `FK_83854EFF38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  CONSTRAINT `FK_83854EFF8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popup`
--

DROP TABLE IF EXISTS `popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popup` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `section_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A096458D823E37A` (`section_id`),
  CONSTRAINT `FK_A096458D823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup`
--

LOCK TABLES `popup` WRITE;
/*!40000 ALTER TABLE `popup` DISABLE KEYS */;
/*!40000 ALTER TABLE `popup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `category_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `currency_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_salient` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  KEY `IDX_D34A04AD38248176` (`currency_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_D34A04AD38248176` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('cd161543-bed5-11eb-a54d-0242ac120003','ccfdbca5-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Baño químico',NULL,100000,NULL,1,'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan con ventanillas de ventilación, tubo extracción de olores y cierre con pestillos. Urinario, lavamanos y otros adicionales son acorde al requerimiento del cliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs Capacidad del estanque: 227 lts.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd179e4d-bed5-11eb-a54d-0242ac120003','ccfdbca5-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Carro Urbano con baño',NULL,100000,NULL,0,'Unidades fabricadas en acero galvanizado, posee  eje con suspención que permite desplazamiento hasta de 90 km/Hora y soporta peso de 250 kg. Posee pata estabilizadora y rueda repuesto. Carro cuenta  con escala para acceder al baño químico montado sobre él. Las características del baño pueden ser ajustadas a la necesidad del cliente. Las medidas son: 2,2 x 1,55 x 1,55 m Peso vacío: 131 Kgs. El carro cuenta con luces reglamentarias y documentación que permiten el desplazamiento en ruta.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd192f5c-bed5-11eb-a54d-0242ac120003','ccfdbca5-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Ducha plástico',NULL,100000,NULL,0,'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan manillas, aspersor de agua y conexión a la red de agua para  fría y caliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd1ac299-bed5-11eb-a54d-0242ac120003','ccfdbca5-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Caseta de vigilancia',NULL,100000,NULL,0,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd1d4b5a-bed5-11eb-a54d-0242ac120003','ccfe3567-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Bactería para grasas',NULL,100000,NULL,1,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd1eb72d-bed5-11eb-a54d-0242ac120003','ccfe3567-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Bactería para residuos domiciliarios',NULL,100000,NULL,1,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd214f1e-bed5-11eb-a54d-0242ac120003','ccfeaddd-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Spray aromatizante',NULL,100000,NULL,0,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd22f580-bed5-11eb-a54d-0242ac120003','ccfeaddd-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Disco aromáticos',NULL,100000,NULL,0,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd258a98-bed5-11eb-a54d-0242ac120003','ccff2811-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Amonio Cuaternario',NULL,100000,NULL,1,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd273f84-bed5-11eb-a54d-0242ac120003','ccff2811-bed5-11eb-a54d-0242ac120003','cd023e51-bed5-11eb-a54d-0242ac120003','Kit para urinarios',NULL,100000,NULL,0,'','2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('ACCOUNT','Mi cuenta',200,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ACCOUNT-CONVENIOS','Listado de convenios',300,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ACCOUNT-CONVENIOS-DETAIL','Detalle de convenio',400,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ACCOUNT-ORDERS','Listado de órdenes',500,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ACCOUNT-ORDERS-DETAIL','Detalle de órden',600,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('ACCOUNT-USERS','Listado de usuarios',600,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('CART','Carrito de compras',600,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('COTIZATION','Formulario de cotización',600,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('FORGOT-PASSWORD','Olvidé mi constraseña',1200,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('HOME','Inicio',100,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('LOGIN','Inicio de sesión',600,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('PRODUCT','Listado de productos',1000,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('PRODUCT-DETAIL','Detalle de producto',1100,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('PSALIENT','Productos Destacados',1150,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('RESET-PASSWORD','Blanqueo de contraseña',1300,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('SERVICES','Detalle de Servicio',1500,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('SERVICES-DETAIL','Detalle de Model',1500,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0),('VALIDATE-ACCOUNT','Activación de cuenta',1500,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('cd326cfb-bed5-11eb-a54d-0242ac120003','Unidades Sanitarias',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd32dca9-bed5-11eb-a54d-0242ac120003','Baños de Lujo',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd335723-bed5-11eb-a54d-0242ac120003','Limpieza de Fosas y Grasas',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd33cfde-bed5-11eb-a54d-0242ac120003','Residuos Industriales',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd343c52-bed5-11eb-a54d-0242ac120003','Residuos Peligrosos',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd34ac63-bed5-11eb-a54d-0242ac120003','Escombros',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd352b58-bed5-11eb-a54d-0242ac120003','Reciclaje y Valorización',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0),('cd35d6da-bed5-11eb-a54d-0242ac120003','Sanitización',NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.','2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_category`
--

DROP TABLE IF EXISTS `service_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_category` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_category`
--

LOCK TABLES `service_category` WRITE;
/*!40000 ALTER TABLE `service_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_subcategory`
--

DROP TABLE IF EXISTS `service_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_subcategory` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `category_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C14682E412469DE2` (`category_id`),
  CONSTRAINT `FK_C14682E412469DE2` FOREIGN KEY (`category_id`) REFERENCES `service_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_subcategory`
--

LOCK TABLES `service_subcategory` WRITE;
/*!40000 ALTER TABLE `service_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_orders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_cotizations` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('setting','Unisan','email@host.com','email@host.com','© 2021 - smartraining.cl','2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `menu_display` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `code_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiration_code` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `picture` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ccef0fcb-bed5-11eb-a54d-0242ac120003','Superusuario',NULL,'admin@email.com','large','$2y$13$LEs4yEqUr9yCQgPBYGtfiO28rppFXkUBK9NYi35e7gUupHWDS15Ga',NULL,NULL,'ROLE_SUPER','Super usuario creado automaticamente, se recomienda crear otro usuario con el rol SUPER y elimine este.',NULL,NULL,1,NULL,'2021-05-27 10:25:04','2021-05-27 10:25:04',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 12:50:10
