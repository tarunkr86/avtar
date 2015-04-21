-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.50-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema avtar
--

CREATE DATABASE IF NOT EXISTS avtar;
USE avtar;

--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `qualifier` varchar(45) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `primaryPhone` varchar(45) DEFAULT NULL,
  `secondaryPhone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`,`name`,`notes`,`url`,`city`,`country`,`province`,`qualifier`,`street1`,`street2`,`postalCode`,`fax`,`primaryPhone`,`secondaryPhone`,`mobile`) VALUES 
 (15,'Source Pundit InfoSystem','IT And Recruitent Oil & Gass.','http://www.sourcepundit.com','New Delhi','India','Mo',NULL,'Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','110076','8802725282','8802725282','8802725282','8802725282');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `company_attributes`
--

DROP TABLE IF EXISTS `company_attributes`;
CREATE TABLE `company_attributes` (
  `attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `attribute_key` varchar(255) DEFAULT NULL,
  KEY `FK_company_attributes_attribute_id` (`attribute_id`),
  CONSTRAINT `FK_company_attributes_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_attributes`
--

/*!40000 ALTER TABLE `company_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_attributes` ENABLE KEYS */;


--
-- Definition of table `company_location`
--

DROP TABLE IF EXISTS `company_location`;
CREATE TABLE `company_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `qualifier` varchar(255) DEFAULT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_company_location_company_id` (`company_id`),
  CONSTRAINT `FK_company_location_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_location`
--

/*!40000 ALTER TABLE `company_location` DISABLE KEYS */;
INSERT INTO `company_location` (`id`,`abbreviation`,`location_type`,`name`,`city`,`country`,`postal_code`,`state`,`qualifier`,`street1`,`street2`,`company_id`) VALUES 
 (4,'abbreation','Office','Sarita Vihar H Pocket New Delhi','New Delhi','India','110076','Delhi','BUSINESS','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J',NULL),
 (6,'abbreation','Office','Okhla','New Delhi','India','110072','Delhi',NULL,'Line 1','Line 2',NULL),
 (7,'abbreation','Office','Noida','New Delhi','India','110076','Delhi','BUSINESS','Line 1.','Line 2',NULL),
 (10,'Loc 1','Office','Greater Noida','New Delhi','India','110099','Delhi',NULL,'Line 1','Line 2',NULL),
 (20,'abb','Office.','Fridabad','New Delhi','India','110099','Delhi','BUSINESS','Line 1','Line 2',NULL),
 (21,'bang','Office','Banglore','Banglore','India','890988','MP','BUSINESS','Line 2','Line 2',NULL),
 (22,'Mub-HR','Office','Mumbai','Mumbai','India','909897','Maharastra','BUSINESS','Andheri','Line 2',NULL);
/*!40000 ALTER TABLE `company_location` ENABLE KEYS */;


--
-- Definition of table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`id`,`email`,`name`,`phoneNumber`) VALUES 
 (1,'tarun.kumar@sourcepundit.com','Tarun kumar','8802725282'),
 (2,'vivek.jain@sourcepundit.com','Vivek Jain','9810923463'),
 (3,'chandan.sypyal@sourcepundit.com','Chandan Sypyal','9582205377'),
 (4,'e.p.soumya@sourcepundit.com','E.P.Soumya','971561159231'),
 (5,'jitendra.dash@sourcepundit.com','Jitendra Kumar Dash','9968825257'),
 (6,'paramvir.malik@sourcepundit.com','Paramvir Singh malik','9555452517'),
 (7,'sandeep.sharma@sourcepundit.com','Sandeep Sharma','9650224509'),
 (10,'shashank.gupta@sourcepundit.com','Shashank Gupta','9999613640'),
 (11,'priti.kumari@sourcepundit.com','Priti Kumari','7827120790'),
 (12,'swarnlata.sharma@sourcepundit.com','Swarnlata Sharma','8809890981'),
 (13,'sonakshi.rana@sourcepundit.com','Sonakshi Rana','9901989092'),
 (14,'rohit.pratap@gmail.com','Rohit Pratap','7798098987'),
 (15,'anil.kabera@yahoo.com','Anil Kaberaa','8809090982'),
 (16,'raj.tomer@gmail.com','Raj Kumar Tomer','8809098762'),
 (17,'ravi.raj@sourcepundit.com','Ravi Raj','8809098762');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(255) DEFAULT NULL,
  `department_code` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_department_company_id` (`company_id`),
  CONSTRAINT `FK_department_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`,`abbreviation`,`department_code`,`email_address`,`name`,`company_id`) VALUES 
 (1,'Dept1','DHR','manager@sp.com','Department one',NULL),
 (2,'Dept2','DHR','manager@sp.com','Department two',NULL),
 (3,'Dept-IT','DIT','manager@sp.com','Department three',NULL),
 (4,'abbr','Dept f4','manager@sp.com','Department four',NULL),
 (5,'abbreation','Dept-5','manager@sp.com','Department five',NULL),
 (6,'abbr','Dept 6','manager@sp.com','Department 6',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `department_location`
--

DROP TABLE IF EXISTS `department_location`;
CREATE TABLE `department_location` (
  `department_id` bigint(20) NOT NULL,
  `company_location_id` bigint(20) NOT NULL,
  PRIMARY KEY (`department_id`,`company_location_id`),
  KEY `FK_department_location_company_location_id` (`company_location_id`),
  CONSTRAINT `FK_department_location_company_location_id` FOREIGN KEY (`company_location_id`) REFERENCES `company_location` (`id`),
  CONSTRAINT `FK_department_location_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_location`
--

/*!40000 ALTER TABLE `department_location` DISABLE KEYS */;
INSERT INTO `department_location` (`department_id`,`company_location_id`) VALUES 
 (1,4),
 (2,4),
 (3,4),
 (4,4),
 (5,4),
 (6,4),
 (1,6),
 (2,6),
 (3,6),
 (4,6),
 (5,6),
 (6,6),
 (1,7),
 (2,7),
 (3,7),
 (4,7),
 (5,7),
 (6,7),
 (1,10),
 (2,10),
 (3,10),
 (4,10),
 (5,10),
 (6,10),
 (1,20),
 (2,20),
 (3,20),
 (4,20),
 (5,20),
 (6,20),
 (1,21),
 (2,21),
 (3,21),
 (4,21),
 (5,21),
 (6,21),
 (1,22),
 (2,22),
 (3,22),
 (4,22),
 (5,22),
 (6,22);
/*!40000 ALTER TABLE `department_location` ENABLE KEYS */;


--
-- Definition of table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_user`
--

/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` (`id`,`email`,`enabled`,`name`,`password`,`user_role`) VALUES 
 (1,'rajiv.chhatwal@sourcepundit.com','true','Rajiv Chhatwal','admin','ROLE_ADMIN');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
