-- MySQL dump 10.15  Distrib 10.0.22-MariaDB, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: biochemistry
-- ------------------------------------------------------
-- Server version	10.0.22-MariaDB-0+deb8u1

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
-- Dumping data for table `Inventory_record`
--

LOCK TABLES `Inventory_record` WRITE;
/*!40000 ALTER TABLE `Inventory_record` DISABLE KEYS */;
INSERT INTO `Inventory_record` VALUES (1,'','Resin','Mixed Bed Non Rechargable 5 Liter Resin for DI water plant','Hi Media -- Mehulbhai\r\nACE Enterprise -- Pragnesh bhai\r\n'),(2,'','sfsdrgf','gfsgs','hfdg'),(3,'Reagent','','',''),(4,'Reagent','12313','12313','13221354');
/*!40000 ALTER TABLE `Inventory_record` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `abnormal_alert`
--

LOCK TABLES `abnormal_alert` WRITE;
/*!40000 ALTER TABLE `abnormal_alert` DISABLE KEYS */;
INSERT INTO `abnormal_alert` VALUES ('ADA','Blood(Serum,Plasma)','more_than',15,'Clinician_Opinion'),('ADA','CSF','more_than',15,'Clinician_Opinion'),('ALB','Blood(Serum,Plasma)','less_than',3.5,'Tietz_5th_edition'),('ALB','Blood(Serum,Plasma)','more_than',5.2,'Tietz_5th_edition'),('ALP','Blood(Serum,Plasma)','more_than',128,'Tietz_5th_edition'),('ALT','Blood(Serum,Plasma)','more_than',45,'Tietz_5th_edition'),('AMY','Blood(Serum,Plasma)','more_than',100,'Tietz_5th_edition'),('CAL','Blood(Serum,Plasma)','less_than',8.6,'Tietz_5th_edition'),('CAL','Blood(Serum,Plasma)','more_than',10.2,'Tietz_5th_edition'),('CCR','Urine','more_than',0.2,''),('CHO','Blood(Serum,Plasma)','more_than',200,'Tietz_5th_edition'),('CHOH','Blood(Serum,Plasma)','less_than',40,'Tietz_5th_edition'),('CHOL','Blood(Serum,Plasma)','more_than',130,'Tietz_5th_edition'),('CHOV','Blood(Serum,Plasma)','more_than',30,'Tietz_5th_edition'),('CKMB','Blood(Serum,Plasma)','more_than',24,'Kit_Literature'),('CL','Blood(Serum,Plasma)','less_than',98,'Tietz_5th_edition'),('CL','Blood(Serum,Plasma)','more_than',107,'Tietz_5th_edition'),('CR','Blood(Serum,Plasma)','more_than',1.3,'Tietz_5th_edition'),('DBIL','Blood(Serum,Plasma)','more_than',0.2,'Tietz_5th_edition'),('FT4','Blood(Serum,Plasma)','less_than',10.3,'Tietz_5th_edition'),('FT4','Blood(Serum,Plasma)','more_than',34.7,'Tietz_5th_edition'),('GLC','Blood(Serum,Plasma)','less_than',74,'Tietz_5th_edition'),('GLC','Blood(Serum,Plasma)','more_than',100,'Tietz_5th_edition'),('GLC','CSF','less_than',40,'Tietz_5th_edition'),('GLC','CSF','more_than',70,'Tietz_5th_edition'),('IBIL','Blood(Serum,Plasma)','more_than',2,'Tietz_5th_edition'),('IRON','Blood(Serum,Plasma)','less_than',41,'Harper_29th_edition'),('IRON','Blood(Serum,Plasma)','more_than',141,'Harper_29th_edition'),('K','Blood(Serum,Plasma)','less_than',3.5,'Tietz_5th_edition'),('K','Blood(Serum,Plasma)','more_than',5.1,'Tietz_5th_edition'),('LDH','Blood(Serum,Plasma)','more_than',360,'Tietz_5th_edition'),('LI','Blood(Serum,Plasma)','more_than',1.2,'Tietz_5th_edition'),('LIP','Blood(Serum,Plasma)','more_than',5,'Ref_Litrature'),('MPR','CSF','less_than',15,'Tietz_5th_edition'),('MPR','CSF','more_than',40,'Tietz_5th_edition'),('NA','Blood(Serum,Plasma)','less_than',136,'Tietz_5th_edition'),('NA','Blood(Serum,Plasma)','more_than',145,'Tietz_5th_edition'),('TBIL','Blood(Serum,Plasma)','more_than',2,'Tietz_5th_edition'),('TG','Blood(Serum,Plasma)','more_than',150,'Tietz_5th_edition'),('TIBC','Blood(Serum,Plasma)','less_than',251,'Harper_29th_edition'),('TIBC','Blood(Serum,Plasma)','more_than',406,'Harper_29th_edition'),('TP','Blood(Serum,Plasma)','less_than',6.4,'Tietz_5th_edition'),('TP','Blood(Serum,Plasma)','more_than',8.3,'Tietz_5th_edition'),('TPO','Blood(Serum,Plasma)','more_than',30,'Kit_Literature'),('TSH','Blood(Serum,Plasma)','less_than',0.4,'Tietz_5th_edition'),('TSH','Blood(Serum,Plasma)','more_than',4.2,'Tietz_5th_edition'),('UA','Blood(Serum,Plasma)','more_than',7.2,'Tietz_5th_edition'),('URE','Blood(Serum,Plasma)','less_than',13,'Tietz_5th_edition'),('URE','Blood(Serum,Plasma)','more_than',43,'Tietz_4th_edition');
/*!40000 ALTER TABLE `abnormal_alert` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `authorized_signatory`
--

LOCK TABLES `authorized_signatory` WRITE;
/*!40000 ALTER TABLE `authorized_signatory` DISABLE KEYS */;
INSERT INTO `authorized_signatory` VALUES ('Dr.Alok_Assis.Prof. (Final Report)'),('Dr.Bakshi_Tutor(Final Report)'),('Dr.Dipti_Resident(Interim Report)'),('Dr.Gupta_Tutor(Final Report)'),('Dr.Khushbu_Resident(Interim Report)'),('Dr.M.Bariya_Assis. Prof.(Final Report)'),('Dr.Piyush_Assis. Prof.(Final Report)'),('Dr.Puneet_Assoc. Prof.(Final Report)'),('Dr.Riddhi_Resident(Interim Report)'),('Dr.Rohan Rana_Tutor(Final Report)'),('Dr.S.M.Patel_Head & Prof.(Final Report)'),('Dr.Sarita Patel_Assis.Prof. (Final Report)'),('Dr.Sarita_Tutor(Final  Report)');
/*!40000 ALTER TABLE `authorized_signatory` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibration`
--

LOCK TABLES `calibration` WRITE;
/*!40000 ALTER TABLE `calibration` DISABLE KEYS */;
/*!40000 ALTER TABLE `calibration` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `clinician`
--

LOCK TABLES `clinician` WRITE;
/*!40000 ALTER TABLE `clinician` DISABLE KEYS */;
INSERT INTO `clinician` VALUES ('ART','ART'),('Dentistry','DENT'),('Emergency Medicine','EMED'),('ENT','ENT'),('Medicine','MED'),('OG','OG'),('Opthalmology','OPTH'),('Orthopaedics','ORTHO'),('Paediatrics','PED'),('Plastic Surgery','PLASTIC'),('Psychiatry','PSYC'),('Skin','SKIN'),('Surgery','SUR'),('TB-Chest','TBCH'),('Unspecified','UNKN');
/*!40000 ALTER TABLE `clinician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinician.old`
--

DROP TABLE IF EXISTS `clinician.old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinician.old` (
  `clinician` varchar(30) NOT NULL,
  PRIMARY KEY (`clinician`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinician.old`
--

LOCK TABLES `clinician.old` WRITE;
/*!40000 ALTER TABLE `clinician.old` DISABLE KEYS */;
INSERT INTO `clinician.old` VALUES ('ART'),('Dentistry'),('Emergency Medicine'),('ENT'),('Medicine'),('OG'),('Opthalmology'),('Orthopaedics'),('Paediatrics'),('Plastic Surgery'),('Psychiatry'),('Skin'),('Surgery'),('TB-Chest'),('Unspecified');
/*!40000 ALTER TABLE `clinician.old` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `critical_alert`
--

LOCK TABLES `critical_alert` WRITE;
/*!40000 ALTER TABLE `critical_alert` DISABLE KEYS */;
INSERT INTO `critical_alert` VALUES ('ALB','Blood(Serum,Plasma)','less_than',1),('ALP','Blood(Serum,Plasma)','more_than',1000),('AMY','Blood(Serum,Plasma)','more_than',400),('CAL','Blood(Serum,Plasma)','less_than',6.5),('CAL','Blood(Serum,Plasma)','more_than',13),('CHE','Blood(Serum,Plasma)','less_than',3000),('CR','Blood(Serum,Plasma)','more_than',3),('GLC','Blood(Serum,Plasma)','less_than',55),('GLC','Blood(Serum,Plasma)','more_than',300),('GLC','CSF','less_than',30),('IBIL','Blood(Serum,Plasma)','more_than',15),('K','Blood(Serum,Plasma)','less_than',3),('K','Blood(Serum,Plasma)','more_than',5.5),('LI','Blood(Serum,Plasma)','more_than',1.5),('NA','Blood(Serum,Plasma)','less_than',129),('NA','Blood(Serum,Plasma)','more_than',160),('TBIL','Blood(Serum,Plasma)','more_than',15),('TG','Blood(Serum,Plasma)','more_than',1000),('TP','Blood(Serum,Plasma)','less_than',3),('UA','Blood(Serum,Plasma)','more_than',10),('URE','Blood(Serum,Plasma)','more_than',100);
/*!40000 ALTER TABLE `critical_alert` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `delta_alert`
--

LOCK TABLES `delta_alert` WRITE;
/*!40000 ALTER TABLE `delta_alert` DISABLE KEYS */;
INSERT INTO `delta_alert` VALUES ('CR','Blood(Serum,Plasma)',0,0.3);
/*!40000 ALTER TABLE `delta_alert` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `detection_limit`
--

LOCK TABLES `detection_limit` WRITE;
/*!40000 ALTER TABLE `detection_limit` DISABLE KEYS */;
INSERT INTO `detection_limit` VALUES ('TBIL','Blood(Serum,Plasma)','less_than',0.2);
/*!40000 ALTER TABLE `detection_limit` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `environmental-parameter`
--

LOCK TABLES `environmental-parameter` WRITE;
/*!40000 ALTER TABLE `environmental-parameter` DISABLE KEYS */;
INSERT INTO `environmental-parameter` VALUES ('Cleanliness','Floor,Plateform,Equipment,Wall,Glass,Ceiling,Toilet should be clean'),('Electrical-Supply','Fan,AC,Light,Plug-points,UPS should be working'),('ERBA XL 640 Room-Temperature','15\'C-30\'C'),('Humidity','less than 80%'),('SERVER Room-Temperature','15\'C-30\'C');
/*!40000 ALTER TABLE `environmental-parameter` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `environmental-parameter-monitor`
--

LOCK TABLES `environmental-parameter-monitor` WRITE;
/*!40000 ALTER TABLE `environmental-parameter-monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `environmental-parameter-monitor` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('11_REFRIGERATOR_HE_78_SAMSUNG'),('12_REFRIGERATOR_HE_78_SAMSUNG'),('13_REFRIGERATOR_HE_78_SAMSUNG'),('5KVA UPS Arrow'),('Centrfuge Remi PR-23 HOSP-EQ-P-138-VCDB-4172'),('Centrfuge Remi PR-23 HOSP-EQ-P-138-VCDB-4173'),('Centrfuge Remi PR-23 HOSP-EQ-P-138-VCDB-4174'),('Centrfuge Remi PR-23 HOSP-EQ-P-138-VCDB-4175'),('Deep freezer(-40) HOSP-EQ-P-136'),('Digital display thermometer'),('Digital Tachometer'),('Digital Thermometer'),('Erba Chem 5 Plus semiauto 1 HOSP-EQ-P-3-1'),('Erba Chem 5 Plus semiauto 2 HOSP-EQ-P-3-2'),('Erba Chem 5 Plus semiauto 3 HOSP-EQ-P-3-3'),('Erba XL-640 HOSP-EQ-P-10'),('HP Server COLL-EQ-P-133'),('Laboratory Fume hood COLL-EQ-P-15'),('Laminar air flow COLL-EQ-P-15'),('Pipettes'),('Prolyte Electrolyte Analyzer HOSP-EQ-P-40-81001755'),('Remi Centrifuge R-8C BL HOSP-EQ-P-50-BCLC-682'),('Remi Centrifuge R-8C BL HOSP-EQ-P-50-HCLC-3959'),('Remi Centrifuge R-8C DX HOSP-EQ-P-50-DBLC-3586'),('Remi Centrifuge R-8C DX HOSP-EQ-P-50-EBLC-5162'),('Remi Cooling Incubator CI-35 HOSP-EQ-P-71-IHC-3182'),('remi quick freezer(-20) Biochemistry: HOSP-EQ-P-138'),('Ricoh Printer MP 2000 L2 COLL EQ P-123-17126750553'),('Ricoh printer MP 2001 L COLL EQ-P-123-E343MB50051'),('Sartorius Loose Weight'),('Shimadzu Analytic Balance HOSP-EQ-P-21Shimadzu Sci'),('SYSTRONICS Digital Electrophoresis power supply HOSP-EQ-P-139-850'),('volumetric flask'),('Water Treatment Plant - Clinical Laboratory'),('Water Treatment Plant - Research Lab'),('Yorco Hot air oven YSI431D HOSP-EQ-P-69-14B5312');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `equipment-log`
--

LOCK TABLES `equipment-log` WRITE;
/*!40000 ALTER TABLE `equipment-log` DISABLE KEYS */;
INSERT INTO `equipment-log` VALUES ('Centrifuge_1_BCLC_682_R_8CBL','Working','AMC','2013-02-05','2014-02-04'),('Centrifuge_5_REMI_RESEARCH_COMPUFUGE_PR_23','Working','No AMC or CMC','0000-00-00','0000-00-00'),('Centrifuge_6_REMI_RESEARCH_COMPUFUGE_PR_23','Working','No AMC or CMC','0000-00-00','0000-00-00'),('Erba Chem 5 Plus semiauto 1','working','CMC','2013-08-23','2014-08-22'),('Erba Chem 5 Plus semiauto 2','working','CMC','2013-08-23','2014-08-22'),('Erba Chem 5 Plus semiauto 3','working','CMC','2013-08-23','2014-08-22'),('Erba_XL_640','Working','Warranty','2011-03-31','2014-03-31');
/*!40000 ALTER TABLE `equipment-log` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `equipment-log-monitor`
--

LOCK TABLES `equipment-log-monitor` WRITE;
/*!40000 ALTER TABLE `equipment-log-monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment-log-monitor` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_record`
--

LOCK TABLES `equipment_record` WRITE;
/*!40000 ALTER TABLE `equipment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_record` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `equipment_record_type`
--

LOCK TABLES `equipment_record_type` WRITE;
/*!40000 ALTER TABLE `equipment_record_type` DISABLE KEYS */;
INSERT INTO `equipment_record_type` VALUES ('a. identity',''),('b. manufacturer , model, serial number',''),('c. contect',''),('d1. date of receiving',''),('d2. date of entering into service',''),('e. location','Clinical Biochemistry Laboratory or Research Laboratory'),('f. condition when received','new, used or reconditioned'),('g. manufacturer’s instructions','See attached user manual'),('h. schedule for preventive maintenance and calibration',''),('i. conformation of initial acceptability for use (initial calibration/verification)','Accepted, See attached report'),('j. conformation of ongoing acceptability for use (ongoing calibration/verification)','Accepted, See attached report'),('k. maintenance aggrement','WarrantyAMC/CMC Period: '),('l. maintenance carried out',''),('m. damage, malfunction, modification, repair','Get help: Senior, User Manual, Engineer\r\n=======================================\r\nIdentification: How did you found it out?\r\nControl further damage to equipment/human/output\r\nCorrect: call engineer\r\n         enter temporary schedule for reminder to followup\r\n         perform root cause analysis\r\n         check quality of correction\r\nplan prevention using RCA'),('n. Schedule of quality check after repair','');
/*!40000 ALTER TABLE `equipment_record_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
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
  PRIMARY KEY (`sample_id`,`id`),
  CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES ('78','mg/dl','Glucose',1,'F:74-100 PP:<140 R:<200','Blood(Serum,Plasma)','Fluoride','GOD-POD endpoint',1,'GLC','','Yes'),('','mg/dl','Bilirubin Direct',7,'0-0.2','Blood(Serum,Plasma)','None','Diazo Reaction in 50mmol/L HCL',2,'DBIL','','Yes'),('','mg/dl','Bilirubin Total',8,'0-2.0','Blood(Serum,Plasma)','None','Diazo Reaction in Caffine',2,'TBIL','','Yes'),('','mg/dl','Billirubin Indirect',9,'0-2.0','Blood(Serum,Plasma)','None','Calculation',2,'IBIL','','Yes');
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (103348),(103349);
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES (100,'','','','2014-07-01','','','','','','','','','','',''),(103,'outword','Department of Biochemistry/Clinical Chemistry\r\n	New civil Hpspital and Government Medical College Surat','Medical Superintendent\r\n	New Civil Hospital Surat\r\n	(Attn: Store Section)','2012-10-09','Respected Sir','Material Resources:Request for Purchase',' Purchase of  microscope for biochemistry laboratory ','','Department of biochemistry needs one Microscope for examination of urine crystal,osazone and Sickle cells.please purchase one microscope.','Yours Sincerely','Thanking you','Professor and Head\r\n	Biochemistry\r\n	NCH and GMC Surat','','',''),(105,'','','','2012-10-29','','','','','','','','','','',''),(106,'','','','2012-10-30','','','','','','','','','','',''),(107,'','','','2012-11-19','','','','','','','','','','',''),(108,'','','','2012-11-27','','','','','','','','','','',''),(109,'outword','Department of Biochemistry/Clinical Chemistry\r\n	New civil Hpspital and Government Medical College Surat','Medical Superintendent\r\n	New Civil Hospital Surat\r\n	(Attn: Store Section)','2015-03-04','Respected Sir','Material Resources:Request for supply-Consumables','Kits and consumables','','jkhgbjk\r\n;ljk;lk;l\r\np\'l\'l\'\r\nl;;\'\r\n\r\n','Yours Sincerely','Thanking you','Professor and Head\r\n	Biochemistry\r\n	NCH and GMC Surat','','','');
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('E0(506)'),('E1(507)'),('E2(508)'),('E4(510)'),('F0(511)'),('F1(512)'),('F2(513)'),('F3(514)'),('F4(515)'),('G0(516)'),('G1(517)'),('G2(518)'),('G3(519)'),('G4(520)'),('H0(521)'),('H1(522)'),('H2(523)'),('H3(524)'),('H4(525)'),('NOW(311)'),('MOW(310)'),('FOW'),('Hemodialysis UNIT(741)'),('SICU(478)'),('MICU(500-2)'),('F3N(503)'),('Trauma Center(472-87)'),('Casualty(446)'),('Unspecified-'),('OPD'),('SwineFluWard(529)'),('LeptoWard(506)'),('E3(509)'),('PrisonerWard(310)'),('G0MICU(500)'),('Special Ward(570-71)'),('J1(527)'),('J2(528)'),('J3(529)'),('J4(530)'),('J0(526)'),('OBICU');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

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
  `location_of_detailed_report` varchar(200) NOT NULL,
  PRIMARY KEY (`nonconformity_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonconformity_record`
--

LOCK TABLES `nonconformity_record` WRITE;
/*!40000 ALTER TABLE `nonconformity_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonconformity_record` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `preservative`
--

LOCK TABLES `preservative` WRITE;
/*!40000 ALTER TABLE `preservative` DISABLE KEYS */;
INSERT INTO `preservative` VALUES ('Fluoride'),('None'),('EDTA'),('30 ml 6M HCl');
/*!40000 ALTER TABLE `preservative` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('24_Hrs_Urinary_Calcium',36,38,84,NULL,NULL,'','','','','','Urine','30 ml 6M HCl'),('24_Hrs_Urinary_Protein',32,37,40,NULL,NULL,'','','','','','Urine','None'),('ALB+TP',11,15,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('ALT+CRE',4,31,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('BIL_NICU',7,9,8,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('CAL+ALB',11,20,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('Calcium_creat_ratio',33,5,62,NULL,NULL,'','','','','','Urine','None'),('CSF_Special',2,17,NULL,NULL,NULL,'','','','','','CSF','None'),('Electrolyte',28,27,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('Glu_only',1,NULL,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma) ','Fluoride'),('L+R+E',4,7,8,9,28,'27','31','','','','Blood(Serum,Plasma)','None'),('L+R+E+alb/tp+cal',4,7,8,9,15,'28','27','11','20','31','Blood(Serum,Plasma)','None'),('LFT',7,8,9,31,NULL,'','','','','','Blood(Serum,Plasma)','None'),('LFT-RFT',4,7,8,9,31,'','','','','','Blood(Serum,Plasma)','None'),('Lipid',13,10,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('MLFT',11,23,15,14,NULL,'','','','','','Blood(Serum,Plasma)','None'),('Peritoneal_Fluid_1',18,19,108,71,54,'22','','','','','Peritoneal fluid','None'),('Peritoneal_Fluid_2',67,78,48,114,101,'','','','','','Peritoneal fluid','None'),('Protein_creat_ratio',32,5,35,NULL,NULL,'','','','','','Urine','None'),('Protein_Electrophoresis',11,15,64,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('RFT',4,NULL,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('urea_only',6,NULL,NULL,NULL,NULL,'','','','','','Blood(Serum,Plasma)','None'),('Z_Critical_Alert',1005,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Examination_Interference',1003,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Examination_Rejection',1002,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Remark',1007,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Sample_Rejection',1001,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Telephonic_Reporting',1004,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL),('Z_Withdrawn_Report',1006,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `qc`
--

LOCK TABLES `qc` WRITE;
/*!40000 ALTER TABLE `qc` DISABLE KEYS */;
/*!40000 ALTER TABLE `qc` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `qc_comment`
--

LOCK TABLES `qc_comment` WRITE;
/*!40000 ALTER TABLE `qc_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `qc_comment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `qc_equipment`
--

LOCK TABLES `qc_equipment` WRITE;
/*!40000 ALTER TABLE `qc_equipment` DISABLE KEYS */;
INSERT INTO `qc_equipment` VALUES ('Erba Chem 5 Plus semiauto 1','',0,0,0,'',0,0),('Erba Chem 5 Plus semiauto 2','',0,0,0,'',0,0),('Erba Chem 5 Plus semiauto 3','',0,0,0,'',0,0),('Erba_XL_640','	',2,9,8,'%m/%d/%Y %H:%i:%S',4,5),('Hormone (ELISA)','',0,0,0,'',0,0),('Miura_300',';',2,5,10,'%Y/%m/%d_%H_%i_%S',4,6),('Prolyte','',0,0,0,'',0,0);
/*!40000 ALTER TABLE `qc_equipment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `qc_target`
--

LOCK TABLES `qc_target` WRITE;
/*!40000 ALTER TABLE `qc_target` DISABLE KEYS */;
INSERT INTO `qc_target` VALUES ('Erba Chem 5 Plus semiauto 1',2,'CHE','RANDOX-938UN','5867','493','Target Value +/- 20 %  (NA)'),('Erba Chem 5 Plus semiauto 1',3,'CHE','RANDOX-716UE','5102','493','Target Value +/- 20 %  (NA)'),('Erba Chem 5 Plus semiauto 1',5,'ADA','Pooled sera_005','17','4',NULL),('Erba Chem 5 Plus semiauto 1',5,'ALT','RANDOX-919UN','36','3','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 1',5,'CR','RANDOX-919UN','1.4','0.1','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',5,'DBIL','RANDOX-919UN','0.8','0.2','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',5,'GLC','RANDOX-919UN','107','3.0','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',5,'TBIL','RANDOX-919UN','1.67','0.1','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',8,'ADA','Pooled sera_005','68','9',''),('Erba Chem 5 Plus semiauto 1',8,'ALT','RANDOX-696UE','112','8','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 1',8,'CR','RANDOX-647UE','4.0','0.2','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',8,'DBIL','RANDOX-696UE','1.5','0.3','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',8,'GLC','RANDOX-919UN','270','8','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 1',8,'TBIL','RANDOX-696UE','4.85','0.3','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 2',5,'ALT','RANDOX-844UN','36','3','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 2',5,'CR','RANDOX-856UN','1.5','0.2','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 2',5,'GLC','RANDOX-856UN','127','6','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 2',8,'ALT','RANDOX-647UE','131','13','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 2',8,'CR','RANDOX-647UE','3.6','0.2','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 2',8,'GLC','RANDOX-647UE','281','13','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',5,'ADA','Pooled sera_005','18','3',NULL),('Erba Chem 5 Plus semiauto 3',5,'ALT','RANDOX-919UN','35','3','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 3',5,'AST','RANDOX-856UN','47','5','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 3',5,'CHE','RANDOX-938UN','5867','567','Target Value +/- 20 %  (NA)'),('Erba Chem 5 Plus semiauto 3',5,'CR','RANDOX-919UN','1.3','0.1','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',5,'DBIL','RANDOX-919UN','0.8','0.2','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',5,'GLC','RANDOX-1008UN','115','3','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',5,'TBIL','RANDOX-919UN','1.8','0.1','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',8,'ADA','Pooled sera_005','51','6',''),('Erba Chem 5 Plus semiauto 3',8,'ALT','RANDOX-696UE','112','8','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 3',8,'AST','RANDOX-647UE','139','14','Target Value +/- 20 %'),('Erba Chem 5 Plus semiauto 3',8,'CHE','RANDOX-716UE','5102','493','Target Value +/- 20 %  (NA)'),('Erba Chem 5 Plus semiauto 3',8,'CR','RANDOX-696UE','3.9','0.2','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',8,'DBIL','RANDOX-696UE','1.5','0.3','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',8,'GLC','RANDOX-765UE','250','8','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba Chem 5 Plus semiauto 3',8,'TBIL','RANDOX-696UE','4.6','0.3','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba_XL_640',5,'ALB','RANDOX-1008UN','4.3','0.2','Target Value +/- 10 %'),('Erba_XL_640',5,'ALP','RANDOX-1008UN','182','13','Target Value +/- 30 %'),('Erba_XL_640',5,'ALT','RANDOX-1008UN','38','3','Target Value +/- 20 %'),('Erba_XL_640',5,'AMY','RANDOX-1008UN','81','6','Target Value +/- 30 %'),('Erba_XL_640',5,'AST','RANDOX-1008UN','37','4','Target Value +/- 20 %'),('Erba_XL_640',5,'CAL','RANDOX-1008UN','9.0','0.3','Target Value +/- 1 mg/dl'),('Erba_XL_640',5,'CHO','RANDOX-1008UN','153','4.0','Target Value +/- 10 %'),('Erba_XL_640',5,'CHOH','RANDOX-1008UN','57','5','Target Value +/- 10 %'),('Erba_XL_640',5,'CL','RANDOX-1008UN','97','2','Target Value +/- 5 %'),('Erba_XL_640',5,'CR','RANDOX-1008UN','1.3','0.1','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba_XL_640',5,'DBIL','RANDOX-1008UN','0.8','0.1','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba_XL_640',5,'GLC','RANDOX-1008UN','115','4','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba_XL_640',5,'IRON','RANDOX-1008UN','106','11','Target value ± 20%'),('Erba_XL_640',5,'K','RANDOX-1008UN','4.0','0.1','Target Value +/- 0.5 mmol/l '),('Erba_XL_640',5,'LDH','RANDOX-1008UN','195','16','Target Value +/- 20 %'),('Erba_XL_640',5,'Li','RANDOX-1008UN','0.99','0.1','Target Value +/- 0.3 mmol/l or +/- 20 % (greater)'),('Erba_XL_640',5,'LIP','Low_pooled sera _010','7','2','Target value ± 20%'),('Erba_XL_640',5,'MPR','RANDOX-919UN','62','6','N/A'),('Erba_XL_640',5,'Na','RANDOX-1008UN','140','3.0','Target Value +/- 4 mmol/l '),('Erba_XL_640',5,'TBIL','RANDOX-1008UN','1.7','0.1','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba_XL_640',5,'TG','RANDOX-1008UN','96','4','Target Value +/- 25 %'),('Erba_XL_640',5,'TIBC','RANDOX-1008UN','252','17','Target value ± 20% for IRON '),('Erba_XL_640',5,'TP','RANDOX-1008UN','5.9','0.2','Target Value +/- 10 %'),('Erba_XL_640',5,'UA','RANDOX-1008UN','5.9','0.2','Target Value +/- 17%'),('Erba_XL_640',5,'URE','RANDOX-1008UN','44.0','3.0','Target Value +/- 9 % or 2 mg/dl'),('Erba_XL_640',8,'ALB','RANDOX-765UE','3.0','0.1','Target Value +/- 10 %'),('Erba_XL_640',8,'ALP','RANDOX-765UE','367','25','Target Value +/- 30 %'),('Erba_XL_640',8,'ALT','RANDOX-765UE','134','8','Target Value +/- 20 %'),('Erba_XL_640',8,'AMY','RANDOX-765UE','281','22','Target Value +/- 30 %'),('Erba_XL_640',8,'AST','RANDOX-765UE','132','15','Target Value +/- 20 %'),('Erba_XL_640',8,'CAL','RANDOX-765UE','12.7','0.4','Target Value +/- 1 mg/dl'),('Erba_XL_640',8,'CHO','RANDOX-765UE','254','7','Target Value +/- 10 %'),('Erba_XL_640',8,'CHOH','RANDOX-765UE','117','10','Target Value +/- 10 %'),('Erba_XL_640',8,'CKMB','RANDOX - 3620CK','137.0','10','Kit Control,SD CLIA 30%'),('Erba_XL_640',8,'CL','RANDOX-647UE','114','3','Target Value +/- 5 %'),('Erba_XL_640',8,'CR','RANDOX-765UE','4.0','0.2','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('Erba_XL_640',8,'DBIL','RANDOX-765UE','1.2','0.2','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba_XL_640',8,'GLC','RANDOX-765UE','282','8','Target Value +/- 10 % or +/- 6 mg/dl (greater)'),('Erba_XL_640',8,'IRON','RANDOX-765UE','208','18','Target value ± 20%'),('Erba_XL_640',8,'K','RANDOX-765UE','6.0','0.15','Target Value +/- 0.5 mmol/l '),('Erba_XL_640',8,'LDH','RANDOX-765UE','366','30','Target Value +/- 20 %'),('Erba_XL_640',8,'Li','RANDOX-765UE','2.16','0.2','Target Value +/- 0.3 mmol/l or +/- 20 % (greater)'),('Erba_XL_640',8,'LIP','High_pooled sera _010','44','5','Target value ± 20%'),('Erba_XL_640',8,'MPR','RANDOX-615UE','47','4','N/A'),('Erba_XL_640',8,'Na','RANDOX-765UE','158','3.0','Target Value +/- 4 mmol/l '),('Erba_XL_640',8,'TBIL','RANDOX-765UE','4.8','0.3','Target Value +/- 20 % or +/- 0.4 mg/dl (greater)'),('Erba_XL_640',8,'TG','RANDOX-765UE','261','9','Target Value +/- 25 %'),('Erba_XL_640',8,'TIBC','RANDOX-765UE','270','17','Target value ± 20% for IRON '),('Erba_XL_640',8,'TP','RANDOX-765UE','4.9','0.2','Target Value +/- 10 %'),('Erba_XL_640',8,'UA','RANDOX-765UE','9.3','0.3','Target Value +/- 17%'),('Erba_XL_640',8,'URE','RANDOX-765UE','110','7','Target Value +/- 9 % or 2 mg/dl'),('Hormone (ELISA)',8,'Free T4','RANDOX-765UE','76.01','6.0','Target Value +/- 3 SD'),('Hormone (ELISA)',8,'TSH','RANDOX-765UE','1.4','0.2','Target Value +/- 3 SD'),('Prolyte',5,'K','RANDOX-919UN','3.81','0.1','Target Value +/- 0.5 mmol/l '),('prolyte',5,'Li','RANDOX-919UN','1.01','0.1','Target Value +/- 0.3 mmol/l or +/- 20 % (greater)'),('Prolyte',5,'NA','RANDOX-919UN','142','3','Target Value +/- 4 mmol/l '),('Prolyte',8,'K','RANDOX-696UE','6.05','0.2','Target Value +/- 0.5 mmol/l '),('Prolyte',8,'Li','RANDOX-696UE','1.97','0.2','Target Value +/- 0.3 mmol/l or +/- 20 % (greater)'),('Prolyte',8,'NA','RANDOX-696UE','157','3.0','Target Value +/- 4 mmol/l '),('SemiAuto Analyser-Star',5,'CR','RANDOX-844UN','1.6','0.3','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)'),('SemiAuto Analyser-Star',8,'CR','RANDOX-615UE','3.9','0.3','Target Value +/- 15 % or +/- 0.3 mg/dl (greater)');
/*!40000 ALTER TABLE `qc_target` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `qr`
--

LOCK TABLES `qr` WRITE;
/*!40000 ALTER TABLE `qr` DISABLE KEYS */;
INSERT INTO `qr` VALUES ('daily use','SELECT `Sample Receipt Date`, count(`Sample ID`) FROM `sample` WHERE `Sample Details - Provided` like \'%Plain%\' group by `Sample Receipt Date` LIMIT 0, 30 ; '),('daily use','SELECT `Sample Receipt Date`, count(`Sample ID`) FROM `sample` WHERE `Sample Details - Provided` like \'%Plain%\'  and `Sample ID`<100000 group by `Sample Receipt Date` LIMIT 0, 30 ; '),('daily use','SELECT `Sample Receipt Date`, count(`Sample ID`) FROM `sample` WHERE `Sample Details - Provided` like \'%Plain%\'  and `Sample ID`<100000 group by `Sample Receipt Date` LIMIT 0, 30 ; '),('find_for_a_date','SELECT name_of_examination,count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like	\"%2009-12-18%\" and sample.sample_id=examination.sample_id group by name_of_examination'),('find_total_for_a_date','SELECT count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like	\"%2009-12-18%\" and sample.sample_id=examination.sample_id '),('find_total_for_a_date','SELECT count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like	\"%2009-12-18%\" and sample.sample_id=examination.sample_id '),('Total Number of Exami. accor. to OPD','SELECT  count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like    \"%-03-11%\" and sample.sample_id=examination.sample_id and `location`=\'OPD\''),('eqas','SELECT ex_code,result FROM `qc` WHERE `qc_id` between 61003000 and 61003999 order by ex_code'),('sd','SELECT `ex_code` , avg(`result`)  FROM `qc` where qc_id between 50912000 and 50912999 group by ex_code '),('qc mix','SELECT * FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) group by qc.ex_code'),('qc_best','SELECT *, result-3*sd , result+3*sd, format((result-target)/sd,1)  FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between result-3*sd and result+3*sd '),('qc_bestttt','SELECT *, result-3*sd , result+3*sd, SUBSTRING(\'XXXXXXXXXoXXXXXXXXXoXXXXXXXXXoXXXXXXXXXX\',1,-10*format((result-target)/sd,1)),  SUBSTRING(\'XXXXXXXXXoXXXXXXXXXoXXXXXXXXXoXXXXXXXXXX\',1,10*format((result-target)/sd,1)), format((result-target)/sd,1)  FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between result-3*sd and result+3*sd '),('bestttt LJ','SELECT *, result-3*sd , result+3*sd, reverse(SUBSTRING(\'XXXXXXXXXoXXXXXXXXXoXXXXXXXXXoXXXXXXXXXX\',1,-10*format((result-target)/sd,1))) Nsd,  SUBSTRING(\'XXXXXXXXXoXXXXXXXXXoXXXXXXXXXoXXXXXXXXXX\',1,10*format((result-target)/sd,1)) Psd, format((result-target)/sd,1)  FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between result-3*sd and result+3*sd '),('qc bbbbbbb lj','SELECT *, result-3*sd , result+3*sd, reverse(SUBSTRING(\'GGGGGGGGG=YYYYYYYYY=OOOOOOOOO=RRRRRRRRRR\',1,-10*format((result-target)/sd,1))) Nsd,  SUBSTRING(\'GGGGGGGGG=YYYYYYYYY=OOOOOOOOO=RRRRRRRRRR\',1,10*format((result-target)/sd,1)) Psd, format((result-target)/sd,1)  FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between result-3*sd and result+3*sd '),('lj with space','SELECT *, result-3*sd , result+3*sd, reverse(concat(\'|\',SPACE(-10*format((result-target)/sd,1)),\'X\')) Nsd,  concat(\'|\',SPACE(10*format((result-target)/sd,1)),\'X\') Psd, format((result-target)/sd,1)  FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between result-3*sd and result+3*sd '),('monthly sd cv 3sd','SELECT qc.ex_code,format(avg(result),2) AVERAGE,target, format(std(result),2) SD ,sd, format((std(result)/avg(result))*100,2)  \'CV%\' FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between target-3*sd and target+3*sd group by qc.ex_code'),('monthly sd cv 4sd','SELECT qc.ex_code,format(avg(result),2) AVERAGE,target, format(std(result),2) SD ,sd, format((std(result)/avg(result))*100,2)  \'CV%\' FROM `qc`, qc_target where qc_id between 80912000 and 80912999  and qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between target-4*sd and target+4*sd group by qc.ex_code'),('all qc cv,sd,avg','qc_type,qc.ex_code,format(avg(result),2) AVERAGE,target Target, format(std(result),2) SD ,sd Target_SD, format((std(result)/avg(result))*100,2)  \'CV%\' FROM `qc`, qc_target where qc.ex_code=qc_target.ex_code and qc_type=format((qc_id/10000000),0) and result between target-4*sd and target+4*sd group by qc.ex_code , qc_type , format(MOD(qc_id/1000,10000),0)'),('monthly tests','SELECT name_of_examination, count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like    \"%2010-05-%\" and sample.sample_id=examination.sample_id group by name_of_examination'),('renumber every month','update sample set sample_id=sample_id+1109000000 where sample_id<200000 '),('Monthly total investigation','SELECT  count(name_of_examination) FROM `sample`,examination WHERE `sample_receipt_time` like    \"%-02-11%\" and sample.sample_id=examination.sample_id'),('remove wrong entry','SELECT * FROM `qc` WHERE `qc_id` like \'%11061010\' and `ex_code`=\'ALP\''),('monthly data best','SELECT ex_code,avg(result) AVERAGE, avg(sd) SD, avg(sd)/avg(result)*(100)  FROM `qc` where qc_id between 511050000 and 511059999  and sd<4 and sd>-4 group by ex_code'),('monthly data best','SELECT ex_code,avg(result) AVERAGE, avg(sd) SD, avg(sd)/avg(result)*(100)  FROM `qc` where qc_id between 511050000 and 511059999  and sd<4 and sd>-4 group by ex_code'),('new qc average','SELECT ex_code,format(avg(result),2) AVERAGE, format(avg(sd),2) SD, format(avg(sd)/avg(result)*(100),2)  FROM `qc` where qc_id between 511050000 and 511059999  and sd<4 and sd>-4 group by ex_code'),('scope','SELECT `name_of_examination`,`Available`,`sample_type`,`preservative`,`details` FROM `scope` WHERE 1'),('monthly test by sample_id','SELECT name_of_examination, count(name_of_examination) FROM `sample`,examination WHERE sample.sample_id between 1106000001 and 1106200001 and sample.sample_id=examination.sample_id group by name_of_examination'),('monthly test by sample_id','SELECT name_of_examination, count(name_of_examination) FROM `sample`,examination WHERE sample.sample_id between 1106000001 and 1106200001 and sample.sample_id=examination.sample_id group by name_of_examination'),('Delta Check','SELECT location, result, sample.sample_id, patient_id, examination.details, code FROM sample, examination WHERE sample.sample_id = examination.sample_id AND patient_id IN (  SELECT patient_id FROM sample WHERE sample.sample_id =4504 ) AND code = \'CR\' ORDER BY `examination`.`details` ASC LIMIT 0 , 30'),('To find qc data of any analyte for any month','select result, target, qc_id, ex_code from qc_xl where qc_id>511120000 and qc_id<512019999 '),('find target and sd','select equipment_name, code,round(sample_id/100000000,0),avg(result),target,std(result),sd,count(code) from qc where equipment_name=\'Erba_XL_640\' group by code,target'),('cumulative QC data','select * from qc  where time_data between \"2013-10-01\" and \"2013-11-30\" and code=\'ALT\' and equipment_name = \"Erba_XL_640\"'),('reverse wrong renumber every month','update sample set sample_id=sample_id-1109000000 where sample_id between \"1109000000\" and \"1109999999\"'),('Diabetic samples of the month','SELECT  name_of_examination,count(name_of_examination) \r\n\r\nFROM `sample`,examination \r\n\r\nWHERE \r\n		`sample_receipt_time` like    \"2015-07-%\" and \r\n        sample.sample_id=examination.sample_id and \r\n        `location`=\'OPD\' and \r\n        code=\'GLC\' and \r\n        (\r\n        	(sample_details=\'Fasting\' and result>126)\r\n        	or\r\n            (sample_details=\'Post_Prendial\' and result>200)\r\n            \r\n        )\r\ngroup by name_of_examination');
/*!40000 ALTER TABLE `qr` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reagent`
--

LOCK TABLES `reagent` WRITE;
/*!40000 ALTER TABLE `reagent` DISABLE KEYS */;
/*!40000 ALTER TABLE `reagent` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `reagent_name`
--

LOCK TABLES `reagent_name` WRITE;
/*!40000 ALTER TABLE `reagent_name` DISABLE KEYS */;
INSERT INTO `reagent_name` VALUES (''),('Adenosine  buffer'),('ALB_BCG'),('ALP_PNPP'),('ALT_UV'),('AMY_CNPG3'),('AST_UV'),('BIL_R2_SA'),('BIL_R3_SN'),('CAL_2'),('CAL_3'),('Cal_Arsenazo'),('CAL_R1_OCPC'),('CAL_R2_AMP'),('CHE_Cholinesterase'),('CHO_CHO'),('CKMB_UV'),('CR_R1_NAOH'),('CR_R2_PICRATE'),('DBIL_R1_HCL'),('Free T4_ELISA'),('GLC_GODPOD'),('HDL DS'),('Iron standard stock solution'),('IRON_R1_THIOSEMICARBAZIDE'),('IRON_R2_FERROZINE'),('LDH_DEA_R1'),('LDH_R1_LL'),('LDH_R2_NAD'),('LIP_TURBIDOMETRY'),('Lithium carbonate stock solution'),('MPR_PR'),('NA_K_STDA_ISE'),('NA_K_STDB_ISE'),('pepsin-ISE cleaning solution'),('QC_5'),('QC_8'),('TBIL_R1_CAFFINE'),('TG_GPO'),('TP_BIURET'),('TSH_ELISA'),('UA_URICASE'),('URE_UREASE');
/*!40000 ALTER TABLE `reagent_name` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `reagent_status`
--

LOCK TABLES `reagent_status` WRITE;
/*!40000 ALTER TABLE `reagent_status` DISABLE KEYS */;
INSERT INTO `reagent_status` VALUES ('calibrated'),('in_use'),('requested'),('uncalibrated'),('used_up');
/*!40000 ALTER TABLE `reagent_status` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `reflex_examination`
--

LOCK TABLES `reflex_examination` WRITE;
/*!40000 ALTER TABLE `reflex_examination` DISABLE KEYS */;
INSERT INTO `reflex_examination` VALUES (4,6,'more_than'),(4,27,'more_than'),(4,28,'more_than'),(8,11,'more_than'),(8,14,'more_than'),(8,15,'more_than'),(8,23,'more_than'),(8,31,'more_than'),(13,10,'more_than'),(13,24,'more_than'),(13,25,'more_than'),(13,26,'more_than'),(20,11,'less_than'),(20,11,'more_than'),(20,109,'less_than'),(20,109,'more_than'),(23,65,'more_than'),(31,8,'more_than'),(31,11,'more_than'),(31,14,'more_than'),(31,15,'more_than'),(31,23,'more_than'),(34,53,'more_than');
/*!40000 ALTER TABLE `reflex_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reflex_examination_old`
--

DROP TABLE IF EXISTS `reflex_examination_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reflex_examination_old` (
  `examination` int(11) NOT NULL,
  `reflex` int(11) NOT NULL,
  PRIMARY KEY (`examination`,`reflex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reflex_examination_old`
--

LOCK TABLES `reflex_examination_old` WRITE;
/*!40000 ALTER TABLE `reflex_examination_old` DISABLE KEYS */;
INSERT INTO `reflex_examination_old` VALUES (4,6),(8,11),(8,14),(8,15),(8,31),(13,10),(13,24),(13,25),(13,26),(20,11),(20,109),(23,65),(31,8),(31,11),(31,14),(31,15),(31,23),(34,53);
/*!40000 ALTER TABLE `reflex_examination_old` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`refrigerator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerator`
--

LOCK TABLES `refrigerator` WRITE;
/*!40000 ALTER TABLE `refrigerator` DISABLE KEYS */;
INSERT INTO `refrigerator` VALUES ('10_REFRIGERATOR_HE_VOLTAS_GLASS_DOOR',2,8),('11_REFRIGERATOR_HE_78_SAMSUNG',2,8),('12_REFRIGERATOR_HE_78_SAMSUNG',2,8),('13_REFRIGERATOR_HE_78_SAMSUNG',2,8),('1_REFRIGERATOR_HE_76_GODREJ_COLD_GOLD_DELUX',2,8),('2_REFRIGERATOR_HE_136_VOLTAS_GLASS_DOOR',2,8),('3_REFRIGERATOR_HE_76_VIDEOCON_310',2,8),('4_REFRIGERATOR_HE_76_GODREJ_COLD_GOLD_DELUX',2,8),('6_REFRIGERATOR_HE_136_DEEP_FREEZER_(-40)',-25,-35),('7_REFRIGERATOR_HE_138_REMI_DEEP_FREEZER_(-20)',-20,-18),('8_REFRIGERATOR_HE_VOLTAS_GLASS_DOOR',2,8),('9_REFRIGERATOR_HE_VOLTAS_GLASS_DOOR',2,8);
/*!40000 ALTER TABLE `refrigerator` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `refrigerator_temperature`
--

LOCK TABLES `refrigerator_temperature` WRITE;
/*!40000 ALTER TABLE `refrigerator_temperature` DISABLE KEYS */;
/*!40000 ALTER TABLE `refrigerator_temperature` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `repeat_examination`
--

LOCK TABLES `repeat_examination` WRITE;
/*!40000 ALTER TABLE `repeat_examination` DISABLE KEYS */;
/*!40000 ALTER TABLE `repeat_examination` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `reportable_alert`
--

LOCK TABLES `reportable_alert` WRITE;
/*!40000 ALTER TABLE `reportable_alert` DISABLE KEYS */;
INSERT INTO `reportable_alert` VALUES ('ALB','Blood(Serum,Plasma)','less_than',0.5),('ALB','Blood(Serum,Plasma)','more_than',10),('ALP','Blood(Serum,Plasma)','more_than',3000),('AMY','Blood(Serum,Plasma)','more_than',5000),('CAL','Blood(Serum,Plasma)','less_than',3),('CAL','Blood(Serum,Plasma)','more_than',15),('CR','Blood(Serum,Plasma)','less_than',0.1),('CR','Blood(Serum,Plasma)','more_than',40),('DBIL','Blood(Serum,Plasma)','more_than',50),('GLC','Blood(Serum,Plasma)','less_than',5),('GLC','Blood(Serum,Plasma)','more_than',1500),('GLC','CSF','more_than',1500),('IBIL','Blood(Serum,Plasma)','more_than',50),('IRON','Blood(Serum,Plasma)','more_than',750),('K','Blood(Serum,Plasma)','less_than',1),('K','Blood(Serum,Plasma)','more_than',7.5),('LI','Blood(Serum,Plasma)','more_than',3),('NA','Blood(Serum,Plasma)','less_than',80),('NA','Blood(Serum,Plasma)','more_than',200),('TBIL','Blood(Serum,Plasma)','more_than',50),('TG','Blood(Serum,Plasma)','more_than',1500),('TIBC','Blood(Serum,Plasma)','more_than',750),('TP','Blood(Serum,Plasma)','less_than',1),('TP','Blood(Serum,Plasma)','more_than',15),('UA','Blood(Serum,Plasma)','more_than',20),('URE','Blood(Serum,Plasma)','more_than',400);
/*!40000 ALTER TABLE `reportable_alert` ENABLE KEYS */;
UNLOCK TABLES;

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
  `sex_age` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_receipt_time` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sample_collection_time` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `diagnosis` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` VALUES (1,'SUR/16/00012345','Nimesh','ART','2','FOW','Blood(Serum,Plasma)','Fluoride','Fasting','N','verified','','2016-09-05 19:38:22','2016-09-05 19:38:22','','',''),(2,'SUR/16/00012345','Nimesh','ART','2','FOW','Blood(Serum,Plasma)','None','Fasting','N','entered',NULL,'2016-09-05 19:38:22','2016-09-05 19:38:22',NULL,'','');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sample_details`
--

LOCK TABLES `sample_details` WRITE;
/*!40000 ALTER TABLE `sample_details` DISABLE KEYS */;
INSERT INTO `sample_details` VALUES ('Random'),('Fasting'),('Post_Prendial'),('Leuteal'),('GTT1'),('GTT3'),('GTT2');
/*!40000 ALTER TABLE `sample_details` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `sample_type`
--

LOCK TABLES `sample_type` WRITE;
/*!40000 ALTER TABLE `sample_type` DISABLE KEYS */;
INSERT INTO `sample_type` VALUES ('Blood(Serum,Plasma)'),('Urine'),('CSF'),('pleural fluid'),('Blood(Whole)'),('Nasal Secretion'),('Peritoneal fluid'),('vitreous fluid');
/*!40000 ALTER TABLE `sample_type` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `result` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `reference_interval` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope`
--

LOCK TABLES `scope` WRITE;
/*!40000 ALTER TABLE `scope` DISABLE KEYS */;
INSERT INTO `scope` VALUES (NULL,'mg/dl','Glucose',1,'F:74-100 PP:<140 R:<200','Blood(Serum,Plasma)','Fluoride','GOD-POD endpoint',NULL,'GLC','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,'<Glucose>\r\n<Fasting>\r\n\r\n	<Impaired_Fasting_Glucose>\r\n		<from>\r\n			110\r\n		</from>\r\n		<to>\r\n			125\r\n		</to>\r\n	</Impaired_Fasting_Glucose>\r\n	\r\n	<Diabetes_Mellitus>\r\n		<greater_than>\r\n			126\r\n		</greater_than>\r\n	</Diabetes_Mellitus>\r\n	\r\n</Fasting>\r\n<Post-prandial>\r\n	\r\n	<Impaired_Glucose_Tolerance>\r\n		<from>\r\n			140\r\n		</from>\r\n		<to>\r\n			199\r\n		</to>\r\n	</Impaired_Glucose_Tolerance>\r\n	\r\n	<Diabetes_Mellitus>\r\n		<greater_than>\r\n			200\r\n		</greater_than>\r\n	</Diabetes_Mellitus>\r\n\r\n</Post-prandial>\r\n\r\n</Glucose>\r\n \r\n \r\n \r\n \r\n'),(NULL,'mg/dl','Glucose',2,'40-70','CSF','Fluoride','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Glucose',3,'40-70','CSF','None','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Creatinine',4,'0.6-1.3','Blood(Serum,Plasma)','None','Jaffe two point',NULL,'CR','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Creatinine',5,'N/A','Urine','None','Jaffe two point',NULL,'CR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Urea',6,'13-43','Blood(Serum,Plasma)','None','Urease  GLDH',NULL,'URE','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Bilirubin Direct',7,'0-0.2','Blood(Serum,Plasma)','None','Diazo Reaction in 50mmol/L HCL',NULL,'DBIL','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Bilirubin Total',8,'0-2.0','Blood(Serum,Plasma)','None','Diazo Reaction in Caffine',NULL,'TBIL','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Billirubin Indirect',9,'0-2.0','Blood(Serum,Plasma)','None','Calculation',NULL,'IBIL','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Triglycerides',10,'<150','Blood(Serum,Plasma)','None','Lipase  GHO - POD',NULL,'TG','Yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Albumin',11,'3.5-5.2','Blood(Serum,Plasma)','None','BCG',NULL,'ALB','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'U/L','CK-MB',12,'0-24','Blood(Serum,Plasma)','None','Immunoinhibition  kinetic',NULL,'CKMB','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Cholesterol Total',13,'<200','Blood(Serum,Plasma)','None','CHOD - POD',NULL,'CHO','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Alkaline Phosphatase',14,'42-128','Blood(Serum,Plasma)','None','PnPP with AMP buffer',NULL,'ALP','Yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',15,'6.4-8.3','Blood(Serum,Plasma)','None','Biuret',NULL,'TP','yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Total Protein',16,'15-40','CSF','None','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Total Protein',17,'15-40','CSF','Fluoride','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Total Protein',18,'N/A','Peritoneal fluid','None','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'gm/dl','Total Protein',19,'N/A','Peritoneal fluid','None','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Calcium',20,'8.6-10.2','Blood(Serum,Plasma)','None','Arsenazo III',NULL,'CAL','Yes','Yes','Ward: 12 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Uric Acid',21,'2.6-7.2','Blood(Serum,Plasma)','None','Uricase  POD',NULL,'UA','Yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'U/L','Amylase',22,'N/A','Peritoneal fluid','None','CNPG',NULL,'AMY','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Amylase',23,'28-100','Blood(Serum,Plasma)','None','CNPG',NULL,'AMY','Yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','HDL-Cholesterol',24,'>40','Blood(Serum,Plasma)','None','Dextransulphate-Mg2+precipitat',NULL,'CHOH','yes','Yes','Ward: 24 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','VLDL - Cholesterol',25,'<30','Blood(Serum,Plasma)','None','Calculation',NULL,'CHOV','yes','Yes','Ward: 12 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','LDL - Cholesterol',26,'<130','Blood(Serum,Plasma)','None','Calculation',NULL,'CHOL','yes','Yes','Ward: 12 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mmol/l','Na+',27,'136-145','Blood(Serum,Plasma)','None','ISE',NULL,'NA','Yes','Yes','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','','Request as additional examination within 2 hours of collection',2,''),(NULL,'mmol/l','K+',28,'3.5-5.1','Blood(Serum,Plasma)','None','ISE',NULL,'K','yes','Yes','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 2 hours of collection','Request as additional examination within 2 hours of collection',2,''),(NULL,'mmol/l','Li+',29,'0.5-1.2','Blood(Serum,Plasma)','None','ISE',NULL,'LI','yes','No','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 2 hours of collection','Request as additional examination within 2 hours of collection',2,''),(NULL,'N/A','Ketones',30,'N/A','Blood(Serum,Plasma)','None','Qualitative  nitroprusside',NULL,'KTO','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','ALT',31,'<45','Blood(Serum,Plasma)','None','L-Alanine  LDH  UV Kinetic',NULL,'ALT','Yes','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Total Protein',32,'N/A','Urine','None','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Calcium',33,'N/A','Urine','None','Arsenazo III',NULL,'CAL','yes','No','Ward: 12 hours, OPD:24 hours',NULL,'','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'microU/ml','TSH',34,'0.4-4.2','Blood(Serum,Plasma)','None','ELISA',NULL,'TSH','yes','No','7 days','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'N/A','Protein/Creatinine',35,'< 0.1','Urine','None','Calculation',NULL,NULL,'yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Calcium',36,'N/A','Urine','30 ml 6M HCl','Arsenazo III',NULL,'CAL','yes','No','Ward: 12 hours, OPD:24 hours','Send a plastic container with around 4 liters volume. It will be washed by the laboratory and approproate preservative will be added and returned for sample collection.','Do not throw away preservative liquid. Discard 8.00 am urine. There after collect urine in the container till 8 am next morning. Include last 8 am urine in container. Keep in refrigerator in between','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'ml/day','Urine Output',37,'N/A','Urine','None','Volumetric measurement',NULL,NULL,'yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','Discard 8.00 am urine. collect till 8.00 am next day. Include last urine at 8.00 am next day. store in refrigerator in between collection.','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'ml/day','Urine Output',38,'N/A','Urine','30 ml 6M HCl','Volumetric measurement',NULL,NULL,'yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','There is preservative inside.Donot discard it. Discard 8.00 am urine. collect till 8.00 am next day. Include last urine at 8.00 am next day. store in refrigerator in between collection.','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Albumin',39,'N/A','CSF','None','BCG',NULL,'ALB','No','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/day','Total Protein',40,'<150','Urine','None','Calculation',NULL,NULL,'yes','No','Ward: 4 hours, OPD:24 hours','','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'U/L','Amylase',41,'N/A','CSF','None','CNPG',NULL,'AMY','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Lipase',42,'N/A','CSF','None','Turbidometry',NULL,'LIP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Creatinine',43,'N/A','vitreous fluid','None','Jaffe two point',NULL,'CR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Urea',45,'N/A','vitreous fluid','None','Urease  GLDH',NULL,'URE','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mmol/l','Na+',46,'N/A','vitreous fluid','None','ISE',NULL,'NA','Yes','No','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 2 hours of collection','Request as additional examination within 2 hours of collection',0,''),(NULL,'mmol/l','K+',47,'N/A','vitreous fluid','None','ISE',NULL,'K','yes','No','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 2 hours of collection','Request as additional examination within 2 hours of collection',0,''),(NULL,'mg/dl','Triglycerides',48,'N/A','Peritoneal fluid','None','Lipase  GHO - POD',NULL,'TG','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Calcium',50,'N/A','vitreous fluid','None','Arsenazo III',NULL,'CAL','Yes','No','Ward: 12 hours, OPD:24 hours','Send a plastic container with around 4 liters volume. It will be washed by the laboratory and approproate preservative will be added and returned for sample collection.','Do not throw away preservative liquid. Discard 8.00 am urine. There after collect urine in the container till 8 am next morning. Include last 8 am urine in container. Keep in refrigerator in between','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','LDH',51,'N/A','vitreous fluid','None','LDH UV Kinetic',NULL,'LDH','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Glucose',52,'N/A','vitreous fluid','None','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'pmol/L','Free T4',53,'10.3-34.7','Blood(Serum,Plasma)','None','ELISA',NULL,'FT4','Yes','No','7 days','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Glucose',54,'N/A','Peritoneal fluid','None','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample immediately after collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Lipase',55,'N/A','pleural fluid','None','Turbidometry',NULL,'LIP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Amylase',56,'N/A','pleural fluid','None','CNPG',NULL,'AMY','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'IU/ml','TPOAb',58,'<30','Blood(Serum,Plasma)','None','ELISA',NULL,'TPO','no','No','7 days','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',60,'N/A','Urine','None','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mmol/l','Cl-',61,'98-107','Blood(Serum,Plasma)','None','ISE',NULL,'CL','no','Yes','Ward: 2 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Calcium/Creatinine Ratio',62,'<0.2(Adults)','Urine','None','Calculation',NULL,'CCR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Ketones',63,'N/A','Urine','None','Nitroprusside',NULL,'KTO','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Protein Electrophoresis',64,'N/A','Blood(Serum,Plasma)','None','Agarose pH 8.6 Veronal Buffer',NULL,'PRE','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Lipase',65,'0-5','Blood(Serum,Plasma)','None','Turbidometry',NULL,'LIP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/ml','Adenosine Deaminase',66,'<15','Blood(Serum,Plasma)','None','Berthelot',NULL,'ADA','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/ml','Adenosine Deaminase',67,'N/A','Peritoneal fluid','None','Berthelot',NULL,'ADA','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','LDH',68,'<360','Blood(Serum,Plasma)','None','LDH UV Kinetic',NULL,'LDH','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/L','CRP',69,'<6','Blood(Serum,Plasma)','None','Latex turbidimetry',NULL,'CRPT','no','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/L','CRP',70,'N/A','Other','None','Latex turbidimetry',NULL,'CRPT','no','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','LDH',71,'N/A','Peritoneal fluid','None','LDH UV Kinetic',NULL,'LDH','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Bence Jones protein',74,'N/A','Urine','None','Heat Precipitation',NULL,'BJP','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','HB Electrophoresis',75,'N/A','Blood(Whole)','EDTA','agarose gel PH 8.6,TEB buffer',NULL,'HE','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','Sometimes results of same examination in parents and siblings is requested by the laboratory ','transport and store at ambient temperature if can be examined within 4 hours. Else store at 2-8 degree C. Do not freeze. Examined within 3 days.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Dithionite Test for HbS',76,'N/A','Blood(Whole)','EDTA','Dithionite',NULL,'DTS','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','Sometimes results of same examination in parents and siblings is requested by the laboratory ','transport and store at ambient temperature if can be examined within 4 hours. Else store at 2-8 degree C. Do not freeze. Examined within 3 days.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Cholesterol Total',78,'N/A','Peritoneal fluid','None','CHOD - POD',NULL,'CHO','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/ml','Adenosine Deaminase',79,'>15','CSF','None','Berthelot',NULL,'ADA','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','LDH',80,'N/A','CSF','None','LDH UV Kinetic',NULL,'LDH','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Benedict\'s Test',81,'N/A','Urine','None','Benedict\'s reaction',NULL,'BDT','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','paper chromatography',82,'N/A','Blood(Serum,Plasma)','None','butenol,acetic acid,water',NULL,'PCHRO','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/day','Calcium',84,'N/A','Urine','30 ml 6M HCl','Calculation',NULL,'DCAL','yes','No','Ward: 12 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','','Send sample within 4 hours of collection','',1,''),(NULL,'mg/dl','Glucose',89,'N/A','Other','Fluoride','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Cholinesterase',90,'3700-13000','Blood(Serum,Plasma)','None','Butyrylcholinesterase',NULL,'CHE','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'ng/ml','Ferritin',92,'32-500','Blood(Serum,Plasma)','None','ELISA',NULL,'FRT','no','No','Ward: 4 hours, OPD:24 hours','No specific instruction','','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','paper chromatography',98,'N/A','Urine','None','butenol,acetic acid,water',NULL,'PCHRO','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'%','HbA1c',99,'<6.5','Blood(Whole)','EDTA','Latex immunoturbidimetry',NULL,'HbA1c','no','no','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature if can be examined within 4 hours. Else store at 2-8 degree C. Do not freeze. Examined within 3 days.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Lipase',101,'N/A','Peritoneal fluid','None','Turbidometry',NULL,'LIP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'N/A','Protein Electrophoresis',102,'N/A','Urine','None','Agarose pH 8.6 Veronal Buffer',NULL,'PRE','yes','No','72 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'ug/dl','Iron',103,'41-141','Blood(Serum,Plasma)','None','Ferrozine',NULL,'IRON','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'ug/dl','TIBC',104,'251-406','Blood(Serum,Plasma)','None','Ferrozine,MgCO3',NULL,'TIBC','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',105,'0.015-0.040','CSF','None','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',106,'0.015-0.040','CSF','Fluoride','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','AST',107,'<35','Blood(Serum,Plasma)','None','L-Aspartate  MDH  UV Kinetic',NULL,'AST','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Albumin',108,'N/A','Peritoneal fluid','None','BCG',NULL,'ALB','No','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Corrected Calcium',109,'8.6 - 10.2','Blood(Serum,Plasma)','None','Equation: 0.8x(4-Alb)+obtained',NULL,'CCAL','yes','No','Ward: 12 hours, OPD:24 hours','Send a plastic container with around 4 liters volume. It will be washed by the laboratory and approproate preservative will be added and returned for sample collection.','Do not throw away preservative liquid. Discard 8.00 am urine. There after collect urine in the container till 8 am next morning. Include last 8 am urine in container. Keep in refrigerator in between','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',1,''),(NULL,'mg/dl','Total Protein',110,'N/A','Nasal Secretion','None','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Glucose',111,'NA','Nasal Secretion','None','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',112,'NA','Nasal Secretion','None','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Albumin',113,'N/A','Nasal Secretion','None','BCG',NULL,'ALB','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/L','Alkaline Phosphatase',114,'N/A','Peritoneal fluid','None','PnPP with AMP buffer',NULL,'ALP','No','Yes','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','LDH',118,'N/A','pleural fluid','None','LDH UV Kinetic',NULL,'LDH','Yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Glucose',119,'N/A','pleural fluid','fluoride','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample immediately after collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Total Protein',120,'N/A','pleural fluid','None','Biuret',NULL,'TP','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Total Protein',121,'N/A','pleural fluid','None','pyrogallol red',NULL,'MPR','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'gm/dl','Albumin',122,'N/A','pleural fluid','None','BCG',NULL,'ALB','No','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'U/ml','Adenosine Deaminase',123,'N/A','pleural fluid','None','Berthelot',NULL,'ADA','yes','No','24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,'mg/dl','Glucose',124,'N/A','pleural fluid','None','GOD-POD endpoint',NULL,'GLC','yes','No','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample immediately after collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Sample_Rejection',1001,NULL,'','','',NULL,'SR','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Examination_Rejection',1002,NULL,'','','',NULL,'ER','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Examination_Interference',1003,NULL,'','','',NULL,'EI','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Telephonic_Reporting',1004,NULL,'','','',NULL,'TR','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Critical_Alert',1005,NULL,'','','',NULL,'CRT','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Withdrawn_Report',1006,NULL,'','','',NULL,'WR','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Remark',1007,NULL,'','','',NULL,'RMR','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,''),(NULL,NULL,'Z_Attachment',1008,NULL,'','','',NULL,'ATC','yes','','Ward: 4 hours, OPD:24 hours','No specific instruction','No specific instruction','No written consent required','None','transport and store at ambient temperature. Store separated serum/plasma at <(-20 degree C) if can not be examined within maximum duration of sample collection.','Send sample within 4 hours of collection','Request as additional examination within 4 hours of collection',0,'');
/*!40000 ALTER TABLE `scope` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (''),('verified'),('entered'),('centrifuged'),('analysed'),('verification failed');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestion`
--

LOCK TABLES `suggestion` WRITE;
/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES ('1'),('2'),('3'),('4'),('5'),('6'),('A'),('B'),('-');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `urgent`
--

LOCK TABLES `urgent` WRITE;
/*!40000 ALTER TABLE `urgent` DISABLE KEYS */;
INSERT INTO `urgent` VALUES ('N'),('Y');
/*!40000 ALTER TABLE `urgent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_data`
--

DROP TABLE IF EXISTS `view_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_data` (
  `id` int(11) NOT NULL,
  `info` varchar(50) NOT NULL,
  `sql` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_data`
--

LOCK TABLES `view_data` WRITE;
/*!40000 ALTER TABLE `view_data` DISABLE KEYS */;
INSERT INTO `view_data` VALUES (1,'XL-640 QC Targets and QC','SELECT * FROM `qc_target` where equipment_name=\'Erba_XL_640\' order by `equipment_name`,`code`,`qc_type`'),(2,'Abnormal Ranges','select * from abnormal_alert order by code,sample_type'),(3,'Critical Ranges','select * from critical_alert order by code,sample_type'),(4,'Reportable Ranges','select * from reportable_alert order by code,sample_type'),(7,'Last Ward ID','select max(sample_id) from sample where sample_id between 1 and 15000'),(8,'Last OPD ID','select max(sample_id) from sample where sample_id between 100000 and 115000'),(9,'Todays samples','select sample_id,status,sample_receipt_time from sample where date(sysdate())=date(sample_receipt_time)'),(10,'Yesterday samples','select sample_id,status,sample_receipt_time from sample where date(subdate(sysdate(),1))=date(sample_receipt_time)'),(11,'TAT for Today','select sample.sample_id, code,sample_receipt_time as  Received ,substr(examination.details,1,19)  as Analysis_complated, timediff(substr(examination.details,1,19),sample_receipt_time) as TAT from sample,examination where sample.sample_id=examination.sample_id and date(sysdate())=date(sample_receipt_time) order by TAT desc'),(12,'TAT for Yesterday','select sample.sample_id, code,sample_receipt_time as  Received ,substr(examination.details,1,19)  as Analysis_complated, timediff(substr(examination.details,1,19),sample_receipt_time) as TAT from sample,examination where sample.sample_id=examination.sample_id and date(subdate(sysdate(),1))=date(sample_receipt_time) order by TAT desc'),(13,'Today Critical Values ','SELECT sample_receipt_time,sample.sample_id,code,result FROM sample,examination where sample.sample_id=examination.sample_id and id=1005 and date(sysdate())=date(sample_receipt_time) '),(14,'Yesterday Critical Values ','SELECT sample_receipt_time,sample.sample_id,code,result FROM sample,examination where sample.sample_id=examination.sample_id and id=1005 and date(subdate(sysdate(),1))=date(sample_receipt_time)'),(16,'Repeat Examinations','SELECT * FROM repeat_examination order by analysis_time  desc limit 100'),(17,'reagent balance','select reagent_name,reagent_status,sum(pack_size) from reagent group by reagent_name,reagent_status'),(18,'ErbaChem QC targets','SELECT * FROM `qc_target` where equipment_name=\'Erba Chem 5 Plus semiauto 1\' order by `equipment_name`,`code`,`qc_type`');
/*!40000 ALTER TABLE `view_data` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2016-09-06 17:49:00
