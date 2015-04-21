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
-- Definition of table `agency`
--

DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_agency_company_id` (`company_id`),
  KEY `FK_agency_nationality_id` (`nationality_id`) USING BTREE,
  CONSTRAINT `FK_agency_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_agency_nationality_id` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`id`,`purpose`,`nationality`,`name`,`email`,`website`,`phone`,`country`,`address1`,`address2`,`city`,`state`,`zipcode`,`company_id`,`nationality_id`) VALUES 
 (17,'Recruitement','Indian','abc','manager@abc.com','http://www.abc.com','+91-9909098762','INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78),
 (18,'Visa','Indian','pqr','manager@pqr.com','http;//www.pqr.com','6678909890','INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78),
 (19,'Recruitement','Indian','xyz','manager@xyz.com','http://www.xyz.com','5567890986','INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78),
 (20,'Recruitement','Indian','Technip','manager@technip.com','htttp://www.technip.com','8890909872','INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78),
 (21,'Recruitement','Japan','JGC','manager@jgc.com','http://www.jgc.com','8809098787','JAPAN','Line 1','Line 2','Bytk','Hjko','898800',15,78),
 (22,'Recruitement','Japan','Choyda','manager@choyda.com','http://www.choyda.com','8809098984','INDIA','Line 1','Line 2','Hghyg','Delhi','53535',15,78),
 (23,'Recruitement',NULL,'Oxient','manager@oxient.com','http://www.oxient.com','9909098876','1,INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78),
 (24,'Visa',NULL,'HCL','manager@hcl.com','http://www.hcl.com','8809090987','1,INDIA','Line 1','Line 2','New Delhi.','Delhi','110076',15,78);
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;


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
 (15,'Source Pundit infosystem','IT And Recruitent Oil & Gass.','http://www.sourcepundit.com','New Delhi.','India','Mo','BUSINESS','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','110076','8802725284','8802725281','8802725282','8802725282');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_location`
--

/*!40000 ALTER TABLE `company_location` DISABLE KEYS */;
INSERT INTO `company_location` (`id`,`abbreviation`,`location_type`,`name`,`city`,`country`,`postal_code`,`state`,`qualifier`,`street1`,`street2`,`company_id`) VALUES 
 (4,'abbreation','Office','Sarita Vihar H Pocket New Delhi','New Delhi','India','110076','Delhi','BUSINESS','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J','Source Pundit Info Systems Pvt. Ltd. 1, Commercial Complex; Pocket H & J',15),
 (6,'abbreation','Office','Okhla','New Delhi','India','110072','Delhi','BUSINESS','Line 1','Line 2',15),
 (7,'abbreation','Office','Noida','New Delhi','India','110076','Delhi','BUSINESS','Line 1.','Line 2',15),
 (10,'Loc 1','Office','Greater Noida','New Delhi','India','110099','Delhi','BUSINESS','Line 1','Line 2',15),
 (20,'abb','Office.','Fridabad','New Delhi','India','110099','Delhi','BUSINESS','Line 1','Line 2',15),
 (21,'bang','Office','Banglore.','Banglore','India','890988','MP','BUSINESS','Line 2','Line 2',15),
 (22,'Mub-HR','Office','Mumbai','Mumbai','India','909897','Maharastra','BUSINESS','Andheri','Line 2',15),
 (23,'abbreation.','Office','Hedrabad','Hedrabad','India','23456','MP','BUSINESS','Line 1','Line 2',15),
 (24,'abbreation','Office','Puna','Puna','India','454544','MH',NULL,'Line 1','Line 2',15),
 (25,'fdgfd','Office','Channai','dfgd','dfg','3453','dfg',NULL,'dfgd','dfgdf',15),
 (26,'abbreation','Office','Dehradoon','Delradoon','India','45454','Uttaranchal.','BUSINESS','Line 1','Line 2',15),
 (27,'sdfgh','Office','US','sgs','sgs','456346','sgs','BUSINESS','sgs','sgs',15),
 (28,'abb8','Office','Oman','oman','Oman','888888','dsg','BUSINESS','line 1','Line 2',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`,`abbreviation`,`department_code`,`email_address`,`name`,`company_id`) VALUES 
 (1,'Dept-one','DHRR','manager@sp.com','Department 1',15),
 (2,'Dept2','DHR','manager@sp.com','Department 2',15),
 (3,'Dept-IT','DIT-3','manager@sp.com','Department 3',15),
 (4,'abbr','Dept f4','manager@sp.com','Department four',15),
 (5,'abbreation','Dept-5','manager@sp.com','Department five',15),
 (6,'abbr','Dept 6','manager@sp.com','Department six',15),
 (7,'aabr7','Dept 7','manager@sp.com','Department seven',15),
 (8,'abb8','Dept8','manager@sp.com','IT',15),
 (9,'abbr9','Dept 9','manager@sp.com','Department nine',15),
 (10,'abbreation','Dept 10','manager@sp.com','Department Teen',15),
 (11,'abbreation','Dept 11.','manager@sp.com','Department 11',15),
 (12,'abb','Dept 12','manager@sp.com','Department twelve',15),
 (13,'abb-admin','Ad01','manager@sp.com','Department one',15),
 (14,'adm','c01','manager@sp.com','Administrator',15),
 (15,'abb15','dept-15','manager@sp.com','Department 15',15),
 (16,'abb-16','dept-16','manager@sp.com','Department 16',15);
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
 (7,4),
 (8,4),
 (9,4),
 (10,4),
 (11,4),
 (12,4),
 (13,4),
 (14,4),
 (15,4),
 (16,4),
 (1,6),
 (2,6),
 (3,6),
 (4,6),
 (5,6),
 (6,6),
 (7,6),
 (8,6),
 (9,6),
 (10,6),
 (11,6),
 (12,6),
 (13,6),
 (14,6),
 (15,6),
 (16,6),
 (1,7),
 (2,7),
 (3,7),
 (4,7),
 (5,7),
 (6,7),
 (7,7),
 (8,7),
 (9,7),
 (10,7),
 (11,7),
 (12,7),
 (13,7),
 (14,7),
 (15,7),
 (16,7),
 (1,10),
 (2,10),
 (3,10),
 (4,10),
 (5,10),
 (6,10),
 (7,10),
 (8,10),
 (9,10),
 (10,10),
 (11,10),
 (12,10),
 (13,10),
 (14,10),
 (15,10),
 (16,10),
 (1,20),
 (2,20),
 (3,20),
 (4,20),
 (5,20),
 (6,20),
 (7,20),
 (8,20),
 (9,20),
 (10,20),
 (11,20),
 (12,20),
 (13,20),
 (14,20),
 (15,20),
 (16,20),
 (1,21),
 (2,21),
 (3,21),
 (4,21),
 (5,21),
 (6,21),
 (7,21),
 (8,21),
 (9,21),
 (10,21),
 (11,21),
 (12,21),
 (13,21),
 (14,21),
 (15,21),
 (16,21),
 (1,22),
 (2,22),
 (3,22),
 (4,22),
 (5,22),
 (6,22),
 (7,22),
 (8,22),
 (9,22),
 (10,22),
 (11,22),
 (12,22),
 (13,22),
 (14,22),
 (15,22),
 (16,22),
 (1,23),
 (2,23),
 (3,23),
 (4,23),
 (5,23),
 (6,23),
 (7,23),
 (8,23),
 (9,23),
 (10,23),
 (11,23),
 (12,23),
 (13,23),
 (14,23),
 (15,23),
 (16,23),
 (1,24),
 (2,24),
 (3,24),
 (4,24),
 (5,24),
 (8,24),
 (9,24),
 (10,24),
 (11,24),
 (12,24),
 (13,24),
 (14,24),
 (15,24),
 (16,24),
 (1,25),
 (2,25),
 (3,25),
 (4,25),
 (5,25),
 (8,25),
 (9,25),
 (10,25),
 (11,25),
 (12,25),
 (13,25),
 (14,25),
 (15,25),
 (16,25),
 (1,26),
 (2,26),
 (3,26),
 (4,26),
 (5,26),
 (8,26),
 (9,26),
 (11,26),
 (12,26),
 (13,26),
 (14,26),
 (15,26),
 (16,26),
 (1,27),
 (2,27),
 (3,27),
 (8,27),
 (11,27),
 (13,27),
 (14,27),
 (15,27),
 (16,27),
 (1,28),
 (2,28),
 (3,28),
 (11,28),
 (14,28),
 (15,28),
 (16,28);
/*!40000 ALTER TABLE `department_location` ENABLE KEYS */;


--
-- Definition of table `email_category`
--

DROP TABLE IF EXISTS `email_category`;
CREATE TABLE `email_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_category`
--

/*!40000 ALTER TABLE `email_category` DISABLE KEYS */;
INSERT INTO `email_category` (`id`,`name`) VALUES 
 (1,'Human Resorces'),
 (8,'Marketing'),
 (9,'Newsletter'),
 (10,'Seminar'),
 (11,'Purchase'),
 (12,'Partner');
/*!40000 ALTER TABLE `email_category` ENABLE KEYS */;


--
-- Definition of table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_email_template_category_id` (`category_id`),
  CONSTRAINT `FK_email_template_category_id` FOREIGN KEY (`category_id`) REFERENCES `email_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` (`id`,`subject`,`message`,`name`,`category_id`) VALUES 
 (1,'test first templete','Test.','First Email templete.',10),
 (3,'test second templete','test','Second Email Template',1),
 (5,'test third email tem[plate','test','Third Email Template',8),
 (6,'test fourth email tem[plate','test','Fourth Email Template',8),
 (7,'fifth email template subject','test','Fifth Email Template',1),
 (8,'test','test','Sixth Template',1),
 (9,'test','test','Seventh Email Template',1);
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;


--
-- Definition of table `job_type`
--

DROP TABLE IF EXISTS `job_type`;
CREATE TABLE `job_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_type`
--

/*!40000 ALTER TABLE `job_type` DISABLE KEYS */;
INSERT INTO `job_type` (`id`,`name`) VALUES 
 (1,'Admin'),
 (3,'Audit'),
 (4,'HR'),
 (5,'Architect'),
 (6,'Advice worker'),
 (7,'Advertising account planner'),
 (8,'Advertising account executive'),
 (9,'Accounting technician'),
 (10,'Accommodation manager'),
 (11,'Barrister'),
 (12,'Barrister\'s clerk'),
 (13,'Tester'),
 (14,'hdhdh'),
 (15,'dfhdfhd'),
 (16,'ngfngfn'),
 (17,'nfgnf'),
 (18,'uytuytuty'),
 (19,'tutyu'),
 (20,'hdhd'),
 (21,'jfjfj'),
 (22,'tyryr'),
 (23,'fghjgfhf'),
 (24,'fhjf'),
 (25,'fjfjf'),
 (26,'fjf'),
 (28,'kjfkf'),
 (29,'sgsgs'),
 (30,'gsgsg'),
 (31,'gsgsgs'),
 (32,'utyuty'),
 (33,'reert'),
 (34,'rterter'),
 (35,'hgfhjf'),
 (36,'fghfgh'),
 (37,'eye'),
 (38,'tyth'),
 (39,'hdghdh'),
 (40,'gdfgdfg'),
 (41,'sgsgs'),
 (42,'sgsg'),
 (43,'jjj'),
 (44,'dhdfh'),
 (45,'jfjfj'),
 (46,'trrt'),
 (47,'jfgjfg'),
 (48,'lhjlh'),
 (49,'yeyey'),
 (50,'eyeyey'),
 (51,'hdhdhd'),
 (52,'ertyery'),
 (53,'hdhdh'),
 (54,'vbvvb'),
 (55,'reterter'),
 (56,'ggfhgf'),
 (57,'tryry'),
 (58,'erter'),
 (59,'trtret'),
 (60,'trtrb'),
 (61,'nbcc'),
 (62,'bdhdh'),
 (63,'ghdfghdf'),
 (64,'jkjkghk'),
 (66,'ghdghd'),
 (67,'hdhdh'),
 (68,'dhdhd'),
 (69,'dgfsdgfsd'),
 (70,'ssdgsdg'),
 (71,'sdgsdg'),
 (72,'gsdgsdg'),
 (73,'fghfhsfh');
/*!40000 ALTER TABLE `job_type` ENABLE KEYS */;


--
-- Definition of table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
CREATE TABLE `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality`
--

/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` (`id`,`country`,`name`) VALUES 
 (4,'Algeria','Algerian'),
 (5,'Andorra','Andorran'),
 (6,'Angola','Angolan'),
 (7,'Antigua and Barbuda','Antiguans, Barbudans'),
 (8,'Argentina','Argentinean'),
 (9,'Armenia','Armenian'),
 (10,'Australia','Australian'),
 (11,'Austria','Austrian'),
 (12,'Azerbaijan','Azerbaijani'),
 (13,'The Bahamas','Bahamian'),
 (14,'Bahrain','Bahraini'),
 (15,'Bangladesh','Bangladeshi'),
 (16,'Barbados','Barbadian'),
 (17,'Belarus','Belarusian'),
 (18,'Belgium','Belgian'),
 (19,'Belize','Belizean'),
 (20,'Benin','Beninese'),
 (21,'Bhutan','Bhutanese'),
 (22,'Bolivia','Bolivian'),
 (23,'Bosnia and Herzegovina','Bosnian, Herzegovinian'),
 (24,'Botswana','Motswana (singular), Batswana (plural)'),
 (25,'Brazil','Brazilian'),
 (26,'Brunei','Bruneian'),
 (27,'Bulgaria','Bulgarian'),
 (28,'Burkina Faso','Burkinabe'),
 (29,'Burundi','Burundian'),
 (30,'Cambodia','Cambodian'),
 (31,'Cameroon','Cameroonian'),
 (32,'Canada','Canadian'),
 (33,'Cape Verde','Cape Verdian'),
 (34,'Central African Republic','Central African'),
 (35,'Chad','Chadian'),
 (36,'Chile','Chilean'),
 (37,'China','Chinese'),
 (38,'Colombia','Colombian'),
 (39,'Comoros','Comoran'),
 (40,'Congo, Republic of the','Congolese'),
 (41,'Congo, Democratic Republic of the','Congolese'),
 (42,'Costa Rica','Costa Rican'),
 (43,'Cote d\'Ivoire','Ivorian'),
 (44,'Croatia','Croatian'),
 (45,'Cuba','Cuban'),
 (46,'Cyprus','Cypriot'),
 (47,'Czech Republic','Czech'),
 (48,'Denmark','Danish'),
 (49,'Djibouti','Djibouti'),
 (50,'Dominica','Dominican'),
 (51,'Dominican Republic','Dominican'),
 (52,'East Timor','East Timorese'),
 (53,'Ecuador','Ecuadorean'),
 (54,'Egypt','Egyptian'),
 (55,'El Salvador','Salvadoran'),
 (56,'Equatorial Guinea','Equatorial Guinean'),
 (57,'Eritrea','Eritrean'),
 (58,'Estonia','Estonian'),
 (59,'Ethiopia','Ethiopian'),
 (60,'Fiji','Fijian'),
 (61,'Finland','Finnish'),
 (62,'France','French'),
 (63,'Gabon','Gabonese'),
 (64,'The Gambia','Gambian'),
 (65,'Georgia','Georgian'),
 (66,'Germany','German'),
 (67,'Ghana','Ghanaian'),
 (68,'Greece','Greek'),
 (69,'Grenada','Grenadian'),
 (70,'Guatemala','Guatemalan'),
 (71,'Guinea','Guinean'),
 (72,'Guinea-Bissau','Guinea-Bissauan'),
 (73,'Guyana','Guyanese'),
 (74,'Haiti','Haitian'),
 (75,'Honduras','Honduran'),
 (76,'Hungary','Hungarian'),
 (77,'Iceland','Icelander'),
 (78,'India','Indian'),
 (79,'Indonesia','Indonesian'),
 (80,'Iran','Iranian'),
 (81,'Iraq','Iraqi'),
 (82,'Ireland','Irish'),
 (83,'Israel','Israeli'),
 (84,'Italy','Italian'),
 (85,'Jamaica','Jamaican'),
 (86,'Japan','Japanese'),
 (87,'Jordan','Jordanian'),
 (88,'Kazakhstan','Kazakhstani'),
 (89,'Kenya','Kenyan'),
 (90,'Kiribati','I-Kiribati'),
 (91,'Korea, North','North Korean'),
 (92,'Korea, South','South Korean'),
 (93,'Kuwait','Kuwaiti'),
 (94,'Kyrgyz Republic','Kirghiz'),
 (95,'Laos','Laotian'),
 (96,'Latvia','Latvian'),
 (97,'Lebanon','Lebanese'),
 (98,'Lesotho','Mosotho'),
 (99,'Liberia','Liberian'),
 (100,'Libya','Libyan'),
 (101,'Liechtenstein','Liechtensteiner'),
 (102,'Lithuania','Lithuanian'),
 (103,'Luxembourg','Luxembourger'),
 (104,'Macedonia','Macedonian'),
 (105,'Madagascar','Malagasy'),
 (106,'Malawi','Malawian'),
 (107,'Malaysia','Malaysian'),
 (108,'Maldives','Maldivan'),
 (109,'Mali','Malian'),
 (110,'Malta','Maltese'),
 (111,'Marshall Islands','Marshallese'),
 (112,'Mauritania','Mauritanian'),
 (113,'Mauritius','Mauritian'),
 (114,'Mexico','Mexican'),
 (115,'Federated States of Micronesia','Micronesian'),
 (116,'Moldova','Moldovan'),
 (117,'Monaco','Monegasque'),
 (118,'Mongolia','Mongolian'),
 (119,'Morocco','Moroccan'),
 (120,'Mozambique','Mozambican'),
 (121,'Myanmar (Burma)','Burmese'),
 (122,'Namibia','Namibian'),
 (123,'Nauru','Nauruan'),
 (124,'Nepal','Nepalese'),
 (125,'Netherlands','Dutch'),
 (126,'New Zealand','New Zealander'),
 (127,'Nicaragua','Nicaraguan'),
 (128,'Niger','Nigerien'),
 (129,'Nigeria','Nigerian'),
 (130,'Norway','Norwegian'),
 (131,'Oman','Omani'),
 (132,'Pakistan','Pakistani'),
 (133,'Palau','Palauan'),
 (134,'Panama','Panamanian'),
 (135,'Papua New Guinea','Papua New Guinean'),
 (136,'Paraguay','Paraguayan'),
 (137,'Peru','Peruvian'),
 (138,'Philippines','Filipino'),
 (139,'Poland','Polish'),
 (140,'Portugal','Portuguese'),
 (141,'Qatar','Qatari'),
 (142,'Romania','Romanian'),
 (143,'Russia','Russian'),
 (144,'Rwanda','Rwandan'),
 (145,'Saint Kitts and Nevis','Kittian and Nevisian'),
 (146,'Saint Lucia','Saint Lucian'),
 (147,'Samoa','Samoan'),
 (148,'San Marino','Sammarinese'),
 (149,'Sao Tome and Principe','Sao Tomean'),
 (150,'Saudi Arabia','Saudi Arabian'),
 (151,'Senegal','Senegalese'),
 (152,'Serbia and Montenegro','Serbian'),
 (153,'Seychelles','Seychellois'),
 (154,'Sierra Leone','Sierra Leonean'),
 (155,'Singapore','Singaporean'),
 (156,'Slovakia','Slovak'),
 (157,'Slovenia','Slovene'),
 (158,'Solomon Islands','Solomon Islander'),
 (159,'Somalia','Somali'),
 (160,'South Africa','South African'),
 (161,'Spain','Spanish'),
 (162,'Sri Lanka','Sri Lankan'),
 (163,'Sudan','Sudanese'),
 (164,'Suriname','Surinamer'),
 (165,'Swaziland','Swazi'),
 (166,'Sweden','Swedish'),
 (167,'Switzerland','Swiss'),
 (168,'Syria','Syrian'),
 (169,'Taiwan','Taiwanese'),
 (170,'Tajikistan','Tadzhik'),
 (171,'Tanzania','Tanzanian'),
 (172,'Thailand','Thai'),
 (173,'Togo','Togolese'),
 (174,'Tonga','Tongan'),
 (175,'Trinidad and Tobago','Trinidadian'),
 (176,'Tunisia','Tunisian'),
 (177,'Turkey','Turkish'),
 (178,'Turkmenistan','Turkmen'),
 (179,'Tuvalu','Tuvaluan'),
 (180,'Uganda','Ugandan'),
 (181,'Ukraine','Ukrainian'),
 (182,'United Arab Emirates','Emirian'),
 (183,'United Kingdom','British'),
 (184,'United States','American'),
 (185,'Uruguay','Uruguayan'),
 (186,'Uzbekistan','Uzbekistani'),
 (187,'Vanuatu','Ni-Vanuatu'),
 (188,'Vatican City (Holy See)','none'),
 (189,'Venezuela','Venezuelan'),
 (190,'Vietnam','Vietnamese'),
 (191,'Yemen','Yemeni'),
 (192,'Zambia','Zambian'),
 (193,'Zimbabwe','Zimbabwean');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;


--
-- Definition of table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template` longtext,
  `name` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_position_department_id` (`department_id`),
  CONSTRAINT `FK_position_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` (`id`,`template`,`name`,`department_id`) VALUES 
 (11,'exp: 5 year','Piping Engineer',14),
 (12,'exp: 5 year','Driling Engineer',14),
 (13,'exp:8','Stress engineer',14),
 (16,'exp :10 year','Project manager',14),
 (19,'exp 12 years','Testing Engineer',14),
 (20,'exp:8 year','Lead Engineer',14),
 (21,'Exp: minimum 6 year','Instrument Engineer',14),
 (22,'minimum 5 years','Software engineer',14),
 (23,'exp: 4 year','Java developer',14),
 (24,'Exp:5 year','DM administratoor',14),
 (25,'exp:12','Ne work engineer',14);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;


--
-- Definition of table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `assignableRecruiter` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_system_user_department_id` (`department_id`) USING BTREE,
  CONSTRAINT `FK_system_user_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_user`
--

/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` (`id`,`prefix`,`name`,`phone`,`email`,`title`,`department_id`,`assignableRecruiter`,`enabled`,`user_role`,`password`) VALUES 
 (1,'Mr','Rajiv Chhatwal.','8802725282','rajiv.chhatwal@sourcepundit.com','Manager',9,'true','true','ROLE ADMIN','admin'),
 (2,'Mr','Anil Kaberaa','8809890989','akabraa@gmail.com','Manager',11,'true','true','DEPARTMENT MANAGER','ADMIN'),
 (3,'Mr','Vivek jain','8809090982','vivek.jain@sourcepundit.com','Manager',3,'true','true','DEPARTMENT MANAGER','ADMIN'),
 (4,'Mr','Param vir singh','9909090983','paramvirsingh@sourcepundit.com','Executive',11,'true','true','HR TEAM LEADER','ADMIN'),
 (5,'Mr','Jitendra Kumar dash','9909876544','jitendra.dash@sourcepundit.com','Manager',6,'true','true','ROLE ADMIN','ADMIN'),
 (6,'Mr','Lokpal negi','8809098764','lokpal.negi@sourcepundit.com','Executive',3,'true','true','ROLE ADMIN','ADMIN'),
 (7,'Miss','Ishani Dwivedi','9909876763','ishani.dwivedi@sourcepundit.com','Executive',1,'true','true','HR TEAM LEADER','admin'),
 (9,'Miss','Vertika Dwivedi','9908987876','vertika.dwivedi@sourcepundit.com','Executive',1,'true','true','HR TEAM LEADER','admin'),
 (10,'Miss','Priti Kumari','8809890987','priti.kumari@sourcepundit.com','Executive',1,'true','true','HR TEAM LEADER','admin'),
 (11,'Mr','Sandeep sharma','7790909876','sandeep.sharma@sourcepundit.com','Executive',11,'true','true','HR TEAM LEADER','admin'),
 (12,'Miss','Swarnlata sharma','9909898762','swarnlata.sharma@sourcepundit.com','Executive',1,'true','true','HR MANAGER','admin'),
 (13,'Mr','Deepak sharma','8890909878','deepak@sourcepundit.com','Executive',1,'true','true','HR MANAGER','admin'),
 (14,'Miss','Sonakshi Rana','7789098983','sonakshi.rana@sourcepundit.com','Executive',11,'true','true','HR MANAGER','admin'),
 (15,'Mr','Chandan Supyal','8809098765','chandan.supyal@sourcepundit.com','Executive',13,'true','true','HR MANAGER','admin'),
 (16,'Mrs','E.P.Soumya','7798098987','e.p.soumya@sourcepundit.com','Executive',8,'true','true','HR MANAGER','admin'),
 (17,'Mr','Shashank Gupta','8809098981','shashank.gupta@sourcepundit.com','Executive',8,'true','true','HR MANAGER','ADMIN'),
 (18,'Mrs','Arti sharma','5567890980','arti@gmail.com','Executive',1,'true','true','HR TEAM LEADER','admin'),
 (19,'Mrs','Keerti jain','8809090987','keerti@gmail.com','Executive',6,'true','true','HR MANAGER','admin'),
 (20,'Mr','Sorab kumar','6678989092','sorab@gmail.com','Executive',1,'true','true','HR MANAGER','admin'),
 (21,'Mr','Ravi Raj singh','8808987898','ravi.raj@gmail.com','Executive',1,'true','true','HR MANAGER','admin'),
 (22,'Miss','Rajni sharma','8890909876','rajni.sh@gmail.com','Executive',8,'true','true','HR MANAGER','admin'),
 (23,'Mr','Raj Singh','8890989098','raj.singh@gmail.com','Sr Executive',6,'true','true','HR MANAGER','admin'),
 (24,'Miss','Umika hooda','8809098987','umika.hooda@gmail.com','Executive',8,'true','true','HR TEAM LEADER','welcome');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
