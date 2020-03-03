-- MySQL dump 10.16  Distrib 10.1.23-MariaDB, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: biochemistry
-- ------------------------------------------------------
-- Server version	10.1.23-MariaDB-9+deb9u1

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
-- Table structure for table `Inventory_record`
--

DROP TABLE IF EXISTS `Inventory_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory_record` (
  `Inventory_ID` int(10) NOT NULL AUTO_INCREMENT,
  `source_of_information` varchar(50) NOT NULL,
  `Item_Name` varchar(1000) NOT NULL,
  `Specification` varchar(5000) NOT NULL,
  `Details` varchar(5000) NOT NULL,
  PRIMARY KEY (`Inventory_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAT`
--

DROP TABLE IF EXISTS `TAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAT` (
  `id` int(11) NOT NULL,
  `Ward` int(11) NOT NULL,
  `OPD` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abnormal_alert`
--

DROP TABLE IF EXISTS `abnormal_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abnormal_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  `src` varchar(50) NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `sample_id` bigint(20) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `file` longblob NOT NULL,
  PRIMARY KEY (`sample_id`,`attachment_id`),
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorized_signatory`
--

DROP TABLE IF EXISTS `authorized_signatory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorized_signatory` (
  `authorized_signatory` varchar(50) NOT NULL,
  PRIMARY KEY (`authorized_signatory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calibration`
--

DROP TABLE IF EXISTS `calibration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `date_of_calibration` date NOT NULL,
  `equipment_name` varchar(50) NOT NULL,
  `purpose` varchar(200) NOT NULL,
  `reagents` varchar(200) NOT NULL,
  `calibrators` varchar(200) NOT NULL,
  `responses` varchar(200) NOT NULL,
  `correlation_function` varchar(200) NOT NULL,
  `quality_check` varchar(200) NOT NULL,
  `detail` varchar(200) NOT NULL,
  `file_attached` longblob NOT NULL,
  `file_attached_name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinician`
--

DROP TABLE IF EXISTS `clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinician` (
  `clinician` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`clinician`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `code`
--

DROP TABLE IF EXISTS `code`;
/*!50001 DROP VIEW IF EXISTS `code`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `code` (
  `code` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `critical_alert`
--

DROP TABLE IF EXISTS `critical_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `critical_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delta_alert`
--

DROP TABLE IF EXISTS `delta_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delta_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `constant_a` float NOT NULL,
  `constant_b` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`constant_a`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detection_limit`
--

DROP TABLE IF EXISTS `detection_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detection_limit` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `environmental-parameter`
--

DROP TABLE IF EXISTS `environmental-parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environmental-parameter` (
  `environmental-parameter` varchar(100) NOT NULL,
  `acceptable` varchar(100) NOT NULL,
  PRIMARY KEY (`environmental-parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `environmental-parameter-monitor`
--

DROP TABLE IF EXISTS `environmental-parameter-monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environmental-parameter-monitor` (
  `environmental-parameter` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `observation` varchar(50) NOT NULL,
  `observer` varchar(30) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`environmental-parameter`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `equipment` varchar(100) NOT NULL,
  PRIMARY KEY (`equipment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment-log`
--

DROP TABLE IF EXISTS `equipment-log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment-log` (
  `equipment-log` varchar(100) NOT NULL,
  `acceptable` varchar(100) NOT NULL,
  `contract` varchar(20) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY (`equipment-log`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment-log-monitor`
--

DROP TABLE IF EXISTS `equipment-log-monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment-log-monitor` (
  `equipment-log` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `observation` varchar(50) NOT NULL,
  `observer` varchar(30) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`equipment-log`,`time`),
  KEY `equipment-log` (`equipment-log`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `equipment_name`
--

DROP TABLE IF EXISTS `equipment_name`;
/*!50001 DROP VIEW IF EXISTS `equipment_name`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `equipment_name` (
  `equipment_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `equipment_record`
--

DROP TABLE IF EXISTS `equipment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `equipment` varchar(100) NOT NULL,
  `equipment_record_type` varchar(100) NOT NULL,
  `description` varchar(6000) NOT NULL,
  `attach` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment` (`equipment`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment_record_type`
--

DROP TABLE IF EXISTS `equipment_record_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_record_type` (
  `equipment_record_type` varchar(100) NOT NULL,
  `detail` varchar(1000) NOT NULL,
  PRIMARY KEY (`equipment_record_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `result` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_of_examination` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preservative` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `method_of_analysis` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NABL_Accredited` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sample_id`,`id`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination.bak`
--

DROP TABLE IF EXISTS `examination.bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination.bak` (
  `result` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_of_examination` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preservative` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `method_of_analysis` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NABL_Accredited` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sample_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination_track`
--

DROP TABLE IF EXISTS `examination_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination_track` (
  `sample_id` bigint(20) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `event` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`sample_id`,`examination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `sample_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `from` varchar(300) NOT NULL,
  `to` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `greeting` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `sub_subject` varchar(300) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `body` varchar(5000) NOT NULL,
  `closing` varchar(100) NOT NULL,
  `thanks` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `attachment_list` varchar(400) NOT NULL,
  `copy_to` varchar(400) NOT NULL,
  `attachment` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nonconformity_record`
--

DROP TABLE IF EXISTS `nonconformity_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonconformity_record` (
  `nonconformity_ID` bigint(14) NOT NULL,
  `source_of_information` varchar(50) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `control` varchar(1000) NOT NULL,
  `correction` varchar(1000) NOT NULL,
  `prevention` varchar(1000) NOT NULL,
  `current_status` varchar(500) NOT NULL,
  `location_of_detailed_report` varchar(200) NOT NULL,
  PRIMARY KEY (`nonconformity_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preservative`
--

DROP TABLE IF EXISTS `preservative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preservative` (
  `preservative` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile` varchar(50) NOT NULL,
  `T1` int(11) DEFAULT NULL,
  `T2` int(11) DEFAULT NULL,
  `T3` int(11) DEFAULT NULL,
  `T4` int(11) DEFAULT NULL,
  `T5` int(11) DEFAULT NULL,
  `T6` varchar(50) NOT NULL,
  `T7` varchar(50) NOT NULL,
  `T8` varchar(50) NOT NULL,
  `T9` varchar(50) NOT NULL,
  `T10` varchar(10) NOT NULL,
  `sample_type` varchar(30) DEFAULT NULL,
  `preservative` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc`
--

DROP TABLE IF EXISTS `qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc` (
  `equipment_name` varchar(100) NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `repeat_id` int(11) NOT NULL,
  `time_data` datetime NOT NULL,
  `code` varchar(30) NOT NULL DEFAULT '',
  `result` varchar(30) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `lot` varchar(30) NOT NULL,
  PRIMARY KEY (`equipment_name`,`sample_id`,`repeat_id`,`time_data`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_comment`
--

DROP TABLE IF EXISTS `qc_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_comment` (
  `equipment_name` varchar(100) NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `comment` varchar(2000) NOT NULL,
  PRIMARY KEY (`equipment_name`,`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_equipment`
--

DROP TABLE IF EXISTS `qc_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_equipment` (
  `equipment_name` varchar(50) NOT NULL,
  `delimiter` varchar(2) NOT NULL,
  `sample_id_field` int(11) NOT NULL,
  `repeat_id_field` int(11) NOT NULL,
  `date_field` int(11) NOT NULL,
  `date_str` varchar(100) NOT NULL,
  `code_field` int(11) NOT NULL,
  `result_field` int(11) NOT NULL,
  PRIMARY KEY (`equipment_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_target`
--

DROP TABLE IF EXISTS `qc_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_target` (
  `equipment_name` varchar(100) NOT NULL,
  `qc_type` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `lot` varchar(30) NOT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`equipment_name`,`qc_type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr` (
  `name` varchar(50) NOT NULL,
  `qr` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reagent`
--

DROP TABLE IF EXISTS `reagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reagent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reagent_name` varchar(50) NOT NULL,
  `lot` varchar(50) NOT NULL,
  `dop` date NOT NULL,
  `doe` date NOT NULL,
  `prepared_by` varchar(50) NOT NULL,
  `pack_size` int(11) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `reagent_status` varchar(20) NOT NULL,
  `temperature_on_receipt` varchar(10) NOT NULL,
  `dor` date NOT NULL,
  `doo` date NOT NULL,
  `detail` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2088527 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reagent_empty`
--

DROP TABLE IF EXISTS `reagent_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reagent_empty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reagent_name` varchar(50) NOT NULL,
  `lot` varchar(50) NOT NULL,
  `dop` date NOT NULL,
  `doe` date NOT NULL,
  `prepared_by` varchar(50) NOT NULL,
  `pack_size` int(11) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `reagent_status` varchar(20) NOT NULL,
  `temperature_on_receipt` varchar(10) NOT NULL,
  `dor` date NOT NULL,
  `doo` date NOT NULL,
  `detail` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reagent_name`
--

DROP TABLE IF EXISTS `reagent_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reagent_name` (
  `reagent_name` varchar(50) NOT NULL,
  PRIMARY KEY (`reagent_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reagent_status`
--

DROP TABLE IF EXISTS `reagent_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reagent_status` (
  `reagent_status` varchar(50) NOT NULL,
  PRIMARY KEY (`reagent_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reflex_examination`
--

DROP TABLE IF EXISTS `reflex_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reflex_examination` (
  `examination` int(11) NOT NULL,
  `reflex` int(11) NOT NULL,
  `level` varchar(15) NOT NULL,
  PRIMARY KEY (`examination`,`reflex`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refrigerator`
--

DROP TABLE IF EXISTS `refrigerator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refrigerator` (
  `refrigerator` varchar(100) NOT NULL,
  `low_target` float NOT NULL,
  `high_target` float NOT NULL,
  `use` varchar(200) NOT NULL,
  PRIMARY KEY (`refrigerator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refrigerator_temperature`
--

DROP TABLE IF EXISTS `refrigerator_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refrigerator_temperature` (
  `refrigerator` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `temperature` float NOT NULL,
  `observer` varchar(30) NOT NULL,
  `comment` varchar(100) NOT NULL,
  PRIMARY KEY (`refrigerator`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `checked_by` varchar(30) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `checked_at` datetime NOT NULL,
  `complated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51262 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repeat_examination`
--

DROP TABLE IF EXISTS `repeat_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeat_examination` (
  `sample_id` bigint(12) NOT NULL,
  `code` varchar(20) NOT NULL,
  `analysis_time` datetime NOT NULL,
  `result` varchar(200) NOT NULL,
  `previous_result` varchar(200) NOT NULL,
  `previous_result_analysis_time` datetime NOT NULL,
  PRIMARY KEY (`sample_id`,`code`,`analysis_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportable_alert`
--

DROP TABLE IF EXISTS `reportable_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportable_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `sample_id` bigint(12) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinician` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preservative` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_details` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urgent` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sample_receipt_time` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_collection_time` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `diagnosis` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1802105269 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_details`
--

DROP TABLE IF EXISTS `sample_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_details` (
  `sample_details` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_track`
--

DROP TABLE IF EXISTS `sample_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_track` (
  `sample_id` bigint(20) NOT NULL,
  `event` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_type`
--

DROP TABLE IF EXISTS `sample_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_type` (
  `sample_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `starts` datetime NOT NULL,
  `description` varchar(500) NOT NULL,
  `authority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `result` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_of_examination` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `preservative` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `method_of_analysis` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Available` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NABL_Accredited` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TAT` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `instruction_for_patient_preparation` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instruction_for_patient_collected_sample` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `patient_consent` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `required_patient_and_family_info` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `preexamination_storage_requirement` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `maximum_duration_of_sample_collection` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_limit_to_request_as_additional_examination` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `significant_digit` int(11) NOT NULL,
  `reference_interval` varchar(9000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suggestion`
--

DROP TABLE IF EXISTS `suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suggestion` varchar(1000) NOT NULL,
  `user` varchar(50) NOT NULL,
  `action_taken` varchar(1000) NOT NULL,
  `display` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technician` (
  `technician` varchar(50) NOT NULL,
  PRIMARY KEY (`technician`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `urgent`
--

DROP TABLE IF EXISTS `urgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urgent` (
  `urgent` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_data`
--

DROP TABLE IF EXISTS `view_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_data` (
  `id` int(11) NOT NULL,
  `info` varchar(100) NOT NULL,
  `sql` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `code`
--

/*!50001 DROP TABLE IF EXISTS `code`*/;
/*!50001 DROP VIEW IF EXISTS `code`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `code` AS select distinct `scope`.`code` AS `code` from `scope` order by `scope`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `equipment_name`
--

/*!50001 DROP TABLE IF EXISTS `equipment_name`*/;
/*!50001 DROP VIEW IF EXISTS `equipment_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `equipment_name` AS select `qc_equipment`.`equipment_name` AS `equipment_name` from `qc_equipment` order by `qc_equipment`.`equipment_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-16 20:53:59
