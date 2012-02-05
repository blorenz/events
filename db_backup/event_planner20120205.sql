-- MySQL dump 10.13  Distrib 5.5.14, for Linux (i686)
--
-- Host: localhost    Database: event_planner
-- ------------------------------------------------------
-- Server version	5.5.14

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
-- Table structure for table `attending_event`
--

DROP TABLE IF EXISTS `attending_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attending_event` (
  `ep_user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `will_attend` tinyint(1) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  UNIQUE KEY `uc_epuserid_eventid` (`ep_user_id`,`event_id`),
  KEY `fk_event_attending_event` (`event_id`),
  CONSTRAINT `fk_ep_user_attending_event` FOREIGN KEY (`ep_user_id`) REFERENCES `ep_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_attending_event` FOREIGN KEY (`event_id`) REFERENCES `event_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attending_event`
--

LOCK TABLES `attending_event` WRITE;
/*!40000 ALTER TABLE `attending_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `attending_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` char(3) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (4,'AFG','AFGHANISTAN'),(5,'ALB','ALBANIA'),(6,'DZA','ALGERIA'),(7,'ASM','AMERICAN SAMOA'),(8,'AND','ANDORRA'),(9,'AGO','ANGOLA'),(10,'AIA','ANGUILLA'),(11,'ATA','ANTARCTICA'),(12,'ATG','ANTIGUA AND BARBUDA'),(13,'ARG','ARGENTINA'),(14,'ARM','ARMENIA'),(15,'ABW','ARUBA'),(16,'AUS','AUSTRALIA'),(17,'AUT','AUSTRIA'),(18,'AZE','AZERBAIJAN'),(19,'BHS','BAHAMAS'),(20,'BHR','BAHRAIN'),(21,'BGD','BANGLADESH'),(22,'BRB','BARBADOS'),(23,'BLR','BELARUS'),(24,'BEL','BELGIUM'),(25,'BLZ','BELIZE'),(26,'BEN','BENIN'),(27,'BMU','BERMUDA'),(28,'BTN','BHUTAN'),(29,'BOL','BOLIVIA'),(30,'BIH','BOSNIA AND HERZEGOWINA'),(31,'BWA','BOTSWANA'),(32,'BVT','BOUVET ISLAND'),(33,'BRA','BRAZIL'),(34,'IOT','BRITISH INDIAN OCEAN TERRITORY'),(35,'BRN','BRUNEI DARUSSALAM'),(36,'BGR','BULGARIA'),(37,'BFA','BURKINA FASO'),(38,'BDI','BURUNDI'),(39,'KHM','CAMBODIA'),(40,'CMR','CAMEROON'),(41,'CAN','CANADA'),(42,'CPV','CAPE VERDE'),(43,'CYM','CAYMAN ISLANDS'),(44,'CAF','CENTRAL AFRICAN REPUBLIC'),(45,'TCD','CHAD'),(46,'CHL','CHILE'),(47,'CHN','CHINA'),(48,'CXR','CHRISTMAS ISLAND'),(49,'CCK','COCOS (KEELING) ISLANDS'),(50,'COL','COLOMBIA'),(51,'COM','COMOROS'),(52,'COG','CONGO'),(53,'COD','CONGO, THE DRC'),(54,'COK','COOK ISLANDS'),(55,'CRI','COSTA RICA'),(56,'CIV','COTE D\'IVOIRE'),(57,'HRV','CROATIA'),(58,'CUB','CUBA'),(59,'CYP','CYPRUS'),(60,'CZE','CZECH REPUBLIC'),(61,'DNK','DENMARK'),(62,'DJI','DJIBOUTI'),(63,'DMA','DOMINICA'),(64,'DOM','DOMINICAN REPUBLIC'),(65,'TMP','EAST TIMOR'),(66,'ECU','ECUADOR'),(67,'EGY','EGYPT'),(68,'SLV','EL SALVADOR'),(69,'GNQ','EQUATORIAL GUINEA'),(70,'ERI','ERITREA'),(71,'EST','ESTONIA'),(72,'ETH','ETHIOPIA'),(73,'FLK','FALKLAND ISLANDS (MALVINAS)'),(74,'FRO','FAROE ISLANDS'),(75,'FJI','FIJI'),(76,'FIN','FINLAND'),(77,'FRA','FRANCE'),(78,'FXX','FRANCE, METROPOLITAN'),(79,'GUF','FRENCH GUIANA'),(80,'PYF','FRENCH POLYNESIA'),(81,'ATF','FRENCH SOUTHERN TERRITORIES'),(82,'GAB','GABON'),(83,'GMB','GAMBIA'),(84,'GEO','GEORGIA'),(85,'DEU','GERMANY'),(86,'GHA','GHANA'),(87,'GIB','GIBRALTAR'),(88,'GRC','GREECE'),(89,'GRL','GREENLAND'),(90,'GRD','GRENADA'),(91,'GLP','GUADELOUPE'),(92,'GUM','GUAM'),(93,'GTM','GUATEMALA'),(94,'GIN','GUINEA'),(95,'GNB','GUINEA-BISSAU'),(96,'GUY','GUYANA'),(97,'HTI','HAITI'),(98,'HMD','HEARD AND MC DONALD ISLANDS'),(99,'VAT','HOLY SEE (VATICAN CITY STATE)'),(100,'HND','HONDURAS'),(101,'HKG','HONG KONG'),(102,'HUN','HUNGARY'),(103,'ISL','ICELAND'),(104,'IND','INDIA'),(105,'IDN','INDONESIA'),(106,'IRN','IRAN (ISLAMIC REPUBLIC OF)'),(107,'IRQ','IRAQ'),(108,'IRL','IRELAND'),(109,'ISR','ISRAEL'),(110,'ITA','ITALY'),(111,'JAM','JAMAICA'),(112,'JPN','JAPAN'),(113,'JOR','JORDAN'),(114,'KAZ','KAZAKHSTAN'),(115,'KEN','KENYA'),(116,'KIR','KIRIBATI'),(117,'PRK','KOREA, D.P.R.O.'),(118,'KOR','KOREA, REPUBLIC OF'),(119,'KWT','KUWAIT'),(120,'KGZ','KYRGYZSTAN'),(121,'LAO','LAOS '),(122,'LVA','LATVIA'),(123,'LBN','LEBANON'),(124,'LSO','LESOTHO'),(125,'LBR','LIBERIA'),(126,'LBY','LIBYAN ARAB JAMAHIRIYA'),(127,'LIE','LIECHTENSTEIN'),(128,'LTU','LITHUANIA'),(129,'LUX','LUXEMBOURG'),(130,'MAC','MACAU'),(131,'MKD','MACEDONIA'),(132,'MDG','MADAGASCAR'),(133,'MWI','MALAWI'),(134,'MYS','MALAYSIA'),(135,'MDV','MALDIVES'),(136,'MLI','MALI'),(137,'MLT','MALTA'),(138,'MHL','MARSHALL ISLANDS'),(139,'MTQ','MARTINIQUE'),(140,'MRT','MAURITANIA'),(141,'MUS','MAURITIUS'),(142,'MYT','MAYOTTE'),(143,'MEX','MEXICO'),(144,'FSM','MICRONESIA, FEDERATED STATES OF'),(145,'MDA','MOLDOVA, REPUBLIC OF'),(146,'MCO','MONACO'),(147,'MNG','MONGOLIA'),(148,'MSR','MONTSERRAT'),(149,'MAR','MOROCCO'),(150,'MOZ','MOZAMBIQUE'),(151,'MMR','MYANMAR (Burma) '),(152,'NAM','NAMIBIA'),(153,'NRU','NAURU'),(154,'NPL','NEPAL'),(155,'NLD','NETHERLANDS'),(156,'ANT','NETHERLANDS ANTILLES'),(157,'NCL','NEW CALEDONIA'),(158,'NZL','NEW ZEALAND'),(159,'NIC','NICARAGUA'),(160,'NER','NIGER'),(161,'NGA','NIGERIA'),(162,'NIU','NIUE'),(163,'NFK','NORFOLK ISLAND'),(164,'MNP','NORTHERN MARIANA ISLANDS'),(165,'NOR','NORWAY'),(166,'OMN','OMAN'),(167,'PAK','PAKISTAN'),(168,'PLW','PALAU'),(169,'PAN','PANAMA'),(170,'PNG','PAPUA NEW GUINEA'),(171,'PRY','PARAGUAY'),(172,'PER','PERU'),(173,'PHL','PHILIPPINES'),(174,'PCN','PITCAIRN'),(175,'POL','POLAND'),(176,'PRT','PORTUGAL'),(177,'PRI','PUERTO RICO'),(178,'QAT','QATAR'),(179,'REU','REUNION'),(180,'ROM','ROMANIA'),(181,'RUS','RUSSIAN FEDERATION'),(182,'RWA','RWANDA'),(183,'KNA','SAINT KITTS AND NEVIS'),(184,'LCA','SAINT LUCIA'),(185,'VCT','SAINT VINCENT AND THE GRENADINES'),(186,'WSM','SAMOA'),(187,'SMR','SAN MARINO'),(188,'STP','SAO TOME AND PRINCIPE'),(189,'SAU','SAUDI ARABIA'),(190,'SEN','SENEGAL'),(191,'SYC','SEYCHELLES'),(192,'SLE','SIERRA LEONE'),(193,'SGP','SINGAPORE'),(194,'SVK','SLOVAKIA (Slovak Republic)'),(195,'SVN','SLOVENIA'),(196,'SLB','SOLOMON ISLANDS'),(197,'SOM','SOMALIA'),(198,'ZAF','SOUTH AFRICA'),(199,'SGS','SOUTH GEORGIA AND SOUTH S.S.'),(200,'ESP','SPAIN'),(201,'LKA','SRI LANKA'),(202,'SHN','ST. HELENA'),(203,'SPM','ST. PIERRE AND MIQUELON'),(204,'SDN','SUDAN'),(205,'SUR','SURINAME'),(206,'SJM','SVALBARD AND JAN MAYEN ISLANDS'),(207,'SWZ','SWAZILAND'),(208,'SWE','SWEDEN'),(209,'CHE','SWITZERLAND'),(210,'SYR','SYRIAN ARAB REPUBLIC'),(211,'TWN','TAIWAN, PROVINCE OF CHINA'),(212,'TJK','TAJIKISTAN'),(213,'TZA','TANZANIA, UNITED REPUBLIC OF'),(214,'THA','THAILAND'),(215,'TGO','TOGO'),(216,'TKL','TOKELAU'),(217,'TON','TONGA'),(218,'TTO','TRINIDAD AND TOBAGO'),(219,'TUN','TUNISIA'),(220,'TUR','TURKEY'),(221,'TKM','TURKMENISTAN'),(222,'TCA','TURKS AND CAICOS ISLANDS'),(223,'TUV','TUVALU'),(224,'UGA','UGANDA'),(225,'UKR','UKRAINE'),(226,'ARE','UNITED ARAB EMIRATES'),(227,'GBR','UNITED KINGDOM'),(228,'USA','UNITED STATES'),(229,'UMI','U.S. MINOR ISLANDS'),(230,'URY','URUGUAY'),(231,'UZB','UZBEKISTAN'),(232,'VUT','VANUATU'),(233,'VEN','VENEZUELA'),(234,'VNM','VIET NAM'),(235,'VGB','VIRGIN ISLANDS (BRITISH)'),(236,'VIR','VIRGIN ISLANDS (U.S.)'),(237,'WLF','WALLIS AND FUTUNA ISLANDS'),(238,'ESH','WESTERN SAHARA'),(239,'YEM','YEMEN'),(240,'ZMB','ZAMBIA'),(241,'ZWE','ZIMBABWE');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ep_user`
--

DROP TABLE IF EXISTS `ep_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ep_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `profile_picture_path` varchar(200) DEFAULT NULL,
  `show_rsvp` bit(1) NOT NULL DEFAULT b'0',
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_ep_user` (`location_id`),
  CONSTRAINT `fk_location_ep_user` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ep_user`
--

LOCK TABLES `ep_user` WRITE;
/*!40000 ALTER TABLE `ep_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ep_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ep_user_oauth_details`
--

DROP TABLE IF EXISTS `ep_user_oauth_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ep_user_oauth_details` (
  `token` varchar(150) NOT NULL,
  `ep_user_id` int(10) unsigned NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `is_default_account` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`token`),
  KEY `fk_ep_user_id_ep_user_oauth_details` (`ep_user_id`),
  CONSTRAINT `fk_ep_user_id_ep_user_oauth_details` FOREIGN KEY (`ep_user_id`) REFERENCES `ep_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ep_user_oauth_details`
--

LOCK TABLES `ep_user_oauth_details` WRITE;
/*!40000 ALTER TABLE `ep_user_oauth_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ep_user_oauth_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_classification`
--

DROP TABLE IF EXISTS `event_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_classification` (
  `event_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `uc_eventid_tagid` (`event_id`,`tag_id`),
  KEY `fk_tag_event_classification` (`tag_id`),
  CONSTRAINT `fk_event_event_classification` FOREIGN KEY (`event_id`) REFERENCES `event_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_event_classification` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_classification`
--

LOCK TABLES `event_classification` WRITE;
/*!40000 ALTER TABLE `event_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_comment`
--

DROP TABLE IF EXISTS `event_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ep_user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `comment_text` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ep_user_event_comment` (`ep_user_id`),
  KEY `fk_event_event_comment` (`event_id`),
  CONSTRAINT `fk_ep_user_event_comment` FOREIGN KEY (`ep_user_id`) REFERENCES `ep_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_event_comment` FOREIGN KEY (`event_id`) REFERENCES `event_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_comment`
--

LOCK TABLES `event_comment` WRITE;
/*!40000 ALTER TABLE `event_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_details`
--

DROP TABLE IF EXISTS `event_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `venue_name` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rsvp_enabled` bit(1) NOT NULL DEFAULT b'0',
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `timezone_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_location_event` (`location_id`),
  KEY `fk_timezone_event` (`timezone_id`),
  CONSTRAINT `fk_location_event` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_timezone_event` FOREIGN KEY (`timezone_id`) REFERENCES `timezone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_details`
--

LOCK TABLES `event_details` WRITE;
/*!40000 ALTER TABLE `event_details` DISABLE KEYS */;
INSERT INTO `event_details` VALUES (1,'Dinner at Z Cucina di spirito','2012-01-27 19:00:00','2012-01-27 21:00:00','Z Cucina Di Spirito','1368 Grandview Avenue','Celebrating Megan Oroszi\'s 26th Birthday',NULL,'','2012-01-26 22:00:00','2012-01-26 22:00:00',NULL,1),(2,'Square 1','2012-01-29 21:00:00','2012-01-29 23:00:00','Google Plus',NULL,'Jon Chris Brandon',NULL,'','2012-01-26 22:03:00','2012-01-26 22:03:00',NULL,1);
/*!40000 ALTER TABLE `event_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `ep_user_id` int(10) unsigned NOT NULL,
  `following_ep_user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `uc_epuserid_following_epuserid` (`ep_user_id`,`following_ep_user_id`),
  KEY `fk_ep_user_following_2` (`following_ep_user_id`),
  CONSTRAINT `fk_ep_user_following_1` FOREIGN KEY (`ep_user_id`) REFERENCES `ep_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ep_user_following_2` FOREIGN KEY (`following_ep_user_id`) REFERENCES `ep_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `timezone_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_cityname_stateid_postalcode` (`city_name`,`state_id`,`postal_code`),
  KEY `fk_state_location` (`state_id`),
  KEY `fk_timezone_location` (`timezone_id`),
  KEY `fk_country_location` (`country_id`),
  KEY `ix_location_postal_code` (`postal_code`),
  KEY `ix_location_city_name` (`city_name`),
  CONSTRAINT `fk_state_location` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  CONSTRAINT `fk_timezone_location` FOREIGN KEY (`timezone_id`) REFERENCES `timezone` (`id`),
  CONSTRAINT `fk_country_location` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_device`
--

DROP TABLE IF EXISTS `mobile_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_device`
--

LOCK TABLES `mobile_device` WRITE;
/*!40000 ALTER TABLE `mobile_device` DISABLE KEYS */;
INSERT INTO `mobile_device` VALUES (1,'iPhone');
/*!40000 ALTER TABLE `mobile_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_device_user_agent`
--

DROP TABLE IF EXISTS `mobile_device_user_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_device_user_agent` (
  `mobile_device_id` int(10) unsigned NOT NULL,
  `user_agent` varchar(500) NOT NULL,
  KEY `fk_mobile_device_mobile_device_user_agent` (`mobile_device_id`),
  CONSTRAINT `fk_mobile_device_mobile_device_user_agent` FOREIGN KEY (`mobile_device_id`) REFERENCES `mobile_device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_device_user_agent`
--

LOCK TABLES `mobile_device_user_agent` WRITE;
/*!40000 ALTER TABLE `mobile_device_user_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_device_user_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` char(2) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (7,'AK','Alaska'),(8,'AL','Alabama'),(9,'AR','Arkansas'),(10,'AZ','Arizona'),(11,'CA','California'),(12,'CO','Colorado'),(13,'CT','Connecticut'),(14,'DC','District of Columbia'),(15,'DE','Delaware'),(16,'FL','Florida'),(17,'GA','Georgia'),(18,'HI','Hawaii'),(19,'IA','Iowa'),(20,'ID','Idaho'),(21,'IL','Illinois'),(22,'IN','Indiana'),(23,'KS','Kansas'),(24,'KY','Kentucky'),(25,'LA','Louisiana'),(26,'MA','Massachusetts'),(27,'MD','Maryland'),(28,'ME','Maine'),(29,'MI','Michigan'),(30,'MN','Minnesota'),(31,'MO','Missouri'),(32,'MS','Mississippi'),(33,'MT','Montana'),(34,'NC','North Carolina'),(35,'ND','North Dakota'),(36,'NE','Nebraska'),(37,'NH','New Hampshire'),(38,'NJ','New Jersey'),(39,'NM','New Mexico'),(40,'NV','Nevada'),(41,'NY','New York'),(42,'OH','Ohio'),(43,'OK','Oklahoma'),(44,'OR','Oregon'),(45,'PA','Pennsylvania'),(46,'RI','Rhode Island'),(47,'SC','South Carolina'),(48,'SD','South Dakota'),(49,'TN','Tennessee'),(50,'TX','Texas'),(51,'UT','Utah'),(52,'VA','Virginia'),(53,'VT','Vermont'),(54,'WA','Washington'),(55,'WI','Wisconsin'),(56,'WV','West Virginia'),(57,'WY','Wyoming');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Party'),(2,'Meeting'),(3,'Sports');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(5) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `gmt_offset` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'EST','Eastern Standard Time',-5.00),(2,'ADT','Atlantic Daylight Time',-3.00),(3,'AFT','Afghanistan Time',4.50),(4,'AKDT','Alaska Daylight Time',-8.00),(5,'AKST','Alaska Standard Time',-9.00),(6,'ALMT','Alma-Ata Time',6.00),(7,'AMST','Armenia Summer Time',5.00),(8,'AMST','Amazon Summer Time',-3.00),(9,'AMT','Armenia Time',4.00),(10,'AMT','Amazon Time',-4.00),(11,'ANAST','Anadyr Summer Time',12.00),(12,'ANAT','Anadyr Time',12.00),(13,'AQTT','Aqtobe Time',5.00),(14,'ART','Argentina Time',-3.00),(15,'AST','Arabia Standard Time',3.00),(16,'AST','Atlantic Standard Time',-4.00),(17,'AZOST','Azores Summer Time',0.00),(18,'AZOT','Azores Time',-1.00),(19,'AZST','Azerbaijan Summer Time',5.00),(20,'AZT','Azerbaijan Time',4.00),(21,'BNT','Brunei Darussalam Time',8.00),(22,'BOT','Bolivia Time',-4.00),(23,'BRST','Brasilia Summer Time',-2.00),(24,'BRT','Brasília time',-3.00),(25,'BST','Bangladesh Standard Time',6.00),(26,'BST','British Summer Time',1.00),(27,'BTT','Bhutan Time',6.00),(28,'CAST','Casey Time',8.00),(29,'CAT','Central Africa Time',2.00),(30,'CCT','Cocos Islands Time',6.50),(31,'CDT','Central Daylight Time',10.50),(32,'CDT','Cuba Daylight Time',-4.00),(33,'CDT','Central Daylight Time',-5.00),(34,'CEST','Central European Summer Time',2.00),(35,'CET','Central European Time',1.00),(36,'CHADT','Chatham Island Daylight Time',13.75),(37,'CHAST','Chatham Island Standard Time',12.75),(38,'CKT','Cook Island Time',-10.00),(39,'CLST','Chile Summer Time',-3.00),(40,'CLT','Chile Standard Time',-4.00),(41,'COT','Colombia Time',-5.00),(42,'CST','China Standard Time',8.00),(43,'CST','Central Standard Time',9.50),(44,'CST','Central Standard Time',-6.00),(45,'CST','Cuba Standard Time',-5.00),(46,'CVT','Cape Verde Time',-1.00),(47,'CXT','Christmas Island Time',7.00),(48,'ChST','Chamorro Standard Time',10.00),(49,'DAVT','Davis Time',7.00),(50,'EASST','Easter Island Summer Time',-5.00),(51,'EAST','Easter Island Standard Time',-6.00),(52,'EAT','Eastern Africa Time',3.00),(53,'EAT','East Africa Time',3.00),(54,'ECT','Ecuador Time',-5.00),(55,'EDT','Eastern Daylight Time',11.00),(56,'EDT','Eastern Daylight Time',-4.00),(57,'EEST','Eastern European Summer Time',3.00),(58,'EET','Eastern European Time',2.00),(59,'EGST','Eastern Greenland Summer Time',0.00),(60,'EGT','East Greenland Time',-10.00),(61,'EST','Eastern Standard Time',10.00),(63,'ET','Tiempo Del Este',-5.00),(64,'FJST','Fiji Summer Time',13.00),(65,'FJT','Fiji Time',12.00),(66,'FKST','Falkland Islands Summer Time',-3.00),(67,'FKT','Falkland Island Time',-4.00),(68,'FNT','Fernando de Noronha Time',-2.00),(69,'GALT','Galapagos Time',-6.00),(70,'GAMT','Gambier Time',-9.00),(71,'GET','Georgia Standard Time',4.00),(72,'GFT','French Guiana Time',-3.00),(73,'GILT','Gilbert Island Time',12.00),(74,'GMT','Greenwich Mean Time',0.00),(75,'GST','Gulf Standard Time',4.00),(76,'GYT','Guyana Time',-4.00),(77,'HAA','Heure Avancée de l\'Atlantique',-3.00),(78,'HAC','Heure Avancée du Centre',-5.00),(79,'HADT','Hawaii-Aleutian Daylight Time',-9.00),(80,'HAE','Heure Avancée de l\'Est',-4.00),(81,'HAP','Heure Avancée du Pacifique',-7.00),(82,'HAR','Heure Avancée des Rocheuses',-6.00),(83,'HAST','Hawaii-Aleutian Standard Time',-10.00),(84,'HAT','Heure Avancée de Terre-Neuve',-2.50),(85,'HAY','Heure Avancée du Yukon',-8.00),(86,'HKT','Hong Kong Time',8.00),(87,'HLV','Hora Legal de Venezuela',-4.50),(88,'HNA','Heure Normale de l\'Atlantique',-4.00),(89,'HNC','Heure Normale du Centre',-6.00),(90,'HNE','Heure Normale de l\'Est',-5.00),(91,'HNP','Heure Normale du Pacifique',-8.00),(92,'HNR','Heure Normale des Rocheuses',-7.00),(93,'HNT','Heure Normale de Terre-Neuve',-3.50),(94,'HNY','Heure Normale du Yukon',-9.00),(95,'HOVT','Hovd Time',7.00),(96,'ICT','Indochina Time',7.00),(97,'IDT','Israel Daylight Time',3.00),(98,'IOT','Indian Chagos Time',6.00),(99,'IRDT','Iran Daylight Time',4.50),(100,'IRKST','Irkutsk Summer Time',9.00),(101,'IRKT','Irkutsk Time',8.00),(102,'IRST','Iran Standard Time',3.50),(103,'IST','Israel Standard Time',2.00),(104,'IST','India Standard Time',5.50),(105,'IST','Irish Standard Time',1.00),(106,'JST','Japan Standard Time',9.00),(107,'KGT','Kyrgyzstan Time',6.00),(108,'KRAST','Krasnoyarsk Summer Time',8.00),(109,'KRAT','Krasnoyarsk Time',7.00),(110,'KST','Korea Standard Time',9.00),(111,'KUYT','Kuybyshev Time',4.00),(112,'LHDT','Lord Howe Daylight Time',11.00),(113,'LHST','Lord Howe Standard Time',10.50),(114,'LINT','Line Islands Time',14.00),(115,'MAGST','Magadan Summer Time',12.00),(116,'MAGT','Magadan Time',11.00),(117,'MART','Marquesas Time',-9.50),(118,'MAWT','Mawson Time',5.00),(119,'MDT','Mountain Daylight Time',-6.00),(120,'MHT','Marshall Islands Time',12.00),(121,'MMT','Myanmar Time',6.50),(122,'MSD','Moscow Daylight Time',4.00),(123,'MSK','Moscow Standard Time',3.00),(124,'MST','Mountain Standard Time',-7.00),(125,'MUT','Mauritius Time',4.00),(126,'MVT','Maldives Time',5.00),(127,'MYT','Malaysia Time',8.00),(128,'NCT','New Caledonia Time',11.00),(129,'NDT','Newfoundland Daylight Time',-2.50),(130,'NFT','Norfolk Time',11.50),(131,'NOVST','Novosibirsk Summer Time',7.00),(132,'NOVT','Novosibirsk Time',6.00),(133,'NPT','Nepal Time',5.75),(134,'NST','Newfoundland Standard Time',-3.50),(135,'NUT','Niue Time',-11.00),(136,'NZDT','New Zealand Daylight Time',13.00),(137,'NZST','New Zealand Standard Time',12.00),(138,'OMSST','Omsk Summer Time',7.00),(139,'OMST','Omsk Standard Time',6.00),(140,'PDT','Pacific Daylight Time',-7.00),(141,'PET','Peru Time',-5.00),(142,'PETST','Kamchatka Summer Time',12.00),(143,'PETT','Kamchatka Time',12.00),(144,'PGT','Papua New Guinea Time',10.00),(145,'PHOT','Phoenix Island Time',13.00),(146,'PHT','Philippine Time',8.00),(147,'PKT','Pakistan Standard Time',5.00),(148,'PMDT','Pierre & Miquelon Daylight Time',-2.00),(149,'PMST','Pierre & Miquelon Standard Time',-3.00),(150,'PONT','Pohnpei Standard Time',11.00),(151,'PST','Pacific Standard Time',-8.00),(152,'PST','Pitcairn Standard Time',-8.00),(153,'PT','Tiempo del Pacífico',-8.00),(154,'PWT','Palau Time',9.00),(155,'PYST','Paraguay Summer Time',-3.00),(156,'PYT','Paraguay Time',-4.00),(157,'RET','Reunion Time',4.00),(158,'SAMT','Samara Time',4.00),(159,'SAST','South Africa Standard Time',2.00),(160,'SBT','Solomon IslandsTime',11.00),(161,'SCT','Seychelles Time',4.00),(162,'SGT','Singapore Time',8.00),(163,'SRT','Suriname Time',-3.00),(164,'SST','Samoa Standard Time',-11.00),(165,'TAHT','Tahiti Time',-10.00),(166,'TFT','French Southern and Antarctic Time',5.00),(167,'TJT','Tajikistan Time',5.00),(168,'TKT','Tokelau Time',-10.00),(169,'TLT','East Timor Time',9.00),(170,'TMT','Turkmenistan Time',5.00),(171,'TVT','Tuvalu Time',12.00),(172,'ULAT','Ulaanbaatar Time',8.00),(173,'UYST','Uruguay Summer Time',-2.00),(174,'UYT','Uruguay Time',-3.00),(175,'UZT','Uzbekistan Time',5.00),(176,'VET','Venezuelan Standard Time',-4.50),(177,'VLAST','Vladivostok Summer Time',11.00),(178,'VLAT','Vladivostok Time',10.00),(179,'VUT','Vanuatu Time',11.00),(180,'WAST','West Africa Summer Time',2.00),(181,'WAT','West Africa Time',1.00),(182,'WDT','Western Daylight Time',9.00),(183,'WEST','Western European Summer Time',1.00),(184,'WET','Western European Time',0.00),(185,'WFT','Wallis and Futuna Time',12.00),(186,'WGST','Western Greenland Summer Time',-2.00),(187,'WGT','West Greenland Time',-3.00),(188,'WIB','Western Indonesian Time',7.00),(189,'WIT','Eastern Indonesian Time',9.00),(190,'WITA','Central Indonesian Time',8.00),(191,'WST','Western Sahara Summer Time',1.00),(192,'WST','Western Standard Time',8.00),(193,'WST','West Samoa Time',-11.00),(194,'WT','Western Sahara Standard Time',0.00),(195,'YAKST','Yakutsk Summer Time',10.00),(196,'YAKT','Yakutsk Time',9.00),(197,'YAPT','Yap Time',10.00),(198,'YEKST','Yekaterinburg Summer Time',6.00),(199,'YEKT','Yekaterinburg Time',5.00);
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-05 12:59:54
