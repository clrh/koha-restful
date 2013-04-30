-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: koha_restful_test
-- ------------------------------------------------------
-- Server version	5.1.58-1-log

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
-- Table structure for table `accountlines`
--

DROP TABLE IF EXISTS `accountlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountlines` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `accountno` smallint(6) NOT NULL DEFAULT '0',
  `itemnumber` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(28,6) DEFAULT NULL,
  `description` mediumtext,
  `dispute` mediumtext,
  `accounttype` varchar(5) DEFAULT NULL,
  `amountoutstanding` decimal(28,6) DEFAULT NULL,
  `lastincrement` decimal(28,6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notify_id` int(11) NOT NULL DEFAULT '0',
  `notify_level` int(2) NOT NULL DEFAULT '0',
  `note` text,
  `manager_id` int(11) DEFAULT NULL,
  KEY `acctsborridx` (`borrowernumber`),
  KEY `timeidx` (`timestamp`),
  KEY `itemnumber` (`itemnumber`),
  CONSTRAINT `accountlines_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accountlines_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountlines`
--

LOCK TABLES `accountlines` WRITE;
/*!40000 ALTER TABLE `accountlines` DISABLE KEYS */;
INSERT INTO `accountlines` VALUES (5,1,1,'2013-04-30','5.000000','Rental',NULL,'Rent','0.000000',NULL,'2013-04-30 08:55:38',0,0,NULL,1),(5,2,NULL,'2013-04-30','-5.000000','Payment,thanks',NULL,'Pay','0.000000',NULL,'2013-04-30 08:55:38',0,0,NULL,1);
/*!40000 ALTER TABLE `accountlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountoffsets`
--

DROP TABLE IF EXISTS `accountoffsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountoffsets` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `accountno` smallint(6) NOT NULL DEFAULT '0',
  `offsetaccount` smallint(6) NOT NULL DEFAULT '0',
  `offsetamount` decimal(28,6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `accountoffsets_ibfk_1` (`borrowernumber`),
  CONSTRAINT `accountoffsets_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountoffsets`
--

LOCK TABLES `accountoffsets` WRITE;
/*!40000 ALTER TABLE `accountoffsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountoffsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_logs`
--

DROP TABLE IF EXISTS `action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_logs` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL DEFAULT '0',
  `module` text,
  `action` text,
  `object` int(11) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`action_id`),
  KEY `timestamp` (`timestamp`,`user`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_logs`
--

LOCK TABLES `action_logs` WRITE;
/*!40000 ALTER TABLE `action_logs` DISABLE KEYS */;
INSERT INTO `action_logs` VALUES (1,'2013-04-30 08:34:08',0,'CATALOGUING','ADD',1,'biblio'),(2,'2013-04-30 08:36:01',0,'CATALOGUING','ADD',1,'item'),(3,'2013-04-30 08:36:01',0,'CATALOGUING','MODIFY',1,'$VAR1 = {\n          \'biblioitemnumber\' => \'1\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'1\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000001\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'1\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(4,'2013-04-30 08:36:01',0,'CATALOGUING','ADD',2,'item'),(5,'2013-04-30 08:36:01',0,'CATALOGUING','MODIFY',2,'$VAR1 = {\n          \'biblioitemnumber\' => \'1\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'2\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000002\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'1\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(6,'2013-04-30 08:36:02',0,'CATALOGUING','ADD',3,'item'),(7,'2013-04-30 08:36:02',0,'CATALOGUING','MODIFY',3,'$VAR1 = {\n          \'biblioitemnumber\' => \'1\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'3\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000003\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'1\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(8,'2013-04-30 08:37:27',0,'CATALOGUING','ADD',2,'biblio'),(9,'2013-04-30 08:38:11',0,'CATALOGUING','ADD',4,'item'),(10,'2013-04-30 08:38:11',0,'CATALOGUING','MODIFY',4,'$VAR1 = {\n          \'biblioitemnumber\' => \'2\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'4\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000004\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'2\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(11,'2013-04-30 08:38:11',0,'CATALOGUING','ADD',5,'item'),(12,'2013-04-30 08:38:11',0,'CATALOGUING','MODIFY',5,'$VAR1 = {\n          \'biblioitemnumber\' => \'2\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'5\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000005\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'2\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(13,'2013-04-30 08:38:11',0,'CATALOGUING','ADD',6,'item'),(14,'2013-04-30 08:38:11',0,'CATALOGUING','MODIFY',6,'$VAR1 = {\n          \'biblioitemnumber\' => \'2\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'6\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000006\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'2\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(15,'2013-04-30 08:40:04',0,'CATALOGUING','ADD',3,'biblio'),(16,'2013-04-30 08:40:28',0,'CATALOGUING','ADD',7,'item'),(17,'2013-04-30 08:40:28',0,'CATALOGUING','MODIFY',7,'$VAR1 = {\n          \'biblioitemnumber\' => \'3\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'7\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000007\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'3\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(18,'2013-04-30 08:40:28',0,'CATALOGUING','ADD',8,'item'),(19,'2013-04-30 08:40:28',0,'CATALOGUING','MODIFY',8,'$VAR1 = {\n          \'biblioitemnumber\' => \'3\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'8\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000008\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'3\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(20,'2013-04-30 08:40:28',0,'CATALOGUING','ADD',9,'item'),(21,'2013-04-30 08:40:28',0,'CATALOGUING','MODIFY',9,'$VAR1 = {\n          \'biblioitemnumber\' => \'3\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'9\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000009\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'3\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(22,'2013-04-30 08:42:57',0,'CATALOGUING','ADD',4,'biblio'),(23,'2013-04-30 08:43:11',0,'CATALOGUING','ADD',10,'item'),(24,'2013-04-30 08:43:11',0,'CATALOGUING','MODIFY',10,'$VAR1 = {\n          \'biblioitemnumber\' => \'4\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'10\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000010\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'4\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(25,'2013-04-30 08:43:11',0,'CATALOGUING','ADD',11,'item'),(26,'2013-04-30 08:43:11',0,'CATALOGUING','MODIFY',11,'$VAR1 = {\n          \'biblioitemnumber\' => \'4\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'11\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000011\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'4\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(27,'2013-04-30 08:43:11',0,'CATALOGUING','ADD',12,'item'),(28,'2013-04-30 08:43:11',0,'CATALOGUING','MODIFY',12,'$VAR1 = {\n          \'biblioitemnumber\' => \'4\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'12\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000012\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'4\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(29,'2013-04-30 08:46:40',0,'CATALOGUING','ADD',5,'biblio'),(30,'2013-04-30 08:46:53',0,'CATALOGUING','ADD',13,'item'),(31,'2013-04-30 08:46:53',0,'CATALOGUING','MODIFY',13,'$VAR1 = {\n          \'biblioitemnumber\' => \'5\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'13\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000013\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'5\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(32,'2013-04-30 08:46:53',0,'CATALOGUING','ADD',14,'item'),(33,'2013-04-30 08:46:53',0,'CATALOGUING','MODIFY',14,'$VAR1 = {\n          \'biblioitemnumber\' => \'5\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'14\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000014\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'5\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(34,'2013-04-30 08:46:54',0,'CATALOGUING','ADD',15,'item'),(35,'2013-04-30 08:46:54',0,'CATALOGUING','MODIFY',15,'$VAR1 = {\n          \'biblioitemnumber\' => \'5\',\n          \'restricted\' => undef,\n          \'items.cn_sort\' => \'\',\n          \'wthdrawn\' => \'0\',\n          \'notforloan\' => \'0\',\n          \'replacementpricedate\' => \'2013-04-30\',\n          \'itemnumber\' => \'15\',\n          \'ccode\' => undef,\n          \'itemnotes\' => undef,\n          \'location\' => undef,\n          \'itemcallnumber\' => undef,\n          \'stack\' => undef,\n          \'barcode\' => \'0000000015\',\n          \'itemlost\' => \'0\',\n          \'uri\' => undef,\n          \'materials\' => undef,\n          \'datelastseen\' => \'2013-04-30\',\n          \'price\' => undef,\n          \'issues\' => undef,\n          \'homebranch\' => undef,\n          \'replacementprice\' => undef,\n          \'more_subfields_xml\' => undef,\n          \'cn_source\' => undef,\n          \'booksellerid\' => undef,\n          \'biblionumber\' => \'5\',\n          \'renewals\' => undef,\n          \'holdingbranch\' => \'CPL\',\n          \'damaged\' => \'0\',\n          \'stocknumber\' => undef,\n          \'cn_sort\' => \'\',\n          \'reserves\' => undef,\n          \'enumchron\' => undef,\n          \'datelastborrowed\' => undef,\n          \'dateaccessioned\' => \'2013-04-30\',\n          \'copynumber\' => undef,\n          \'permanent_location\' => undef,\n          \'itype\' => \'BK\',\n          \'paidfor\' => undef,\n          \'onloan\' => undef\n        };\n'),(36,'2013-04-30 08:51:17',0,'MEMBERS','CHANGE PASS',1,''),(37,'2013-04-30 08:52:04',0,'MEMBERS','MODIFY',1,'UPDATE (executed w/ arg: 1)'),(38,'2013-04-30 08:53:46',1,'CATALOGUING','MODIFY',1,'$VAR1 = {\n          \'itemnumber\' => \'1\',\n          \'issues\' => 1,\n          \'datelastborrowed\' => \'2013-04-30\',\n          \'holdingbranch\' => \'MPL\',\n          \'itemlost\' => 0,\n          \'onloan\' => \'2013-05-03\'\n        };\n'),(39,'2013-04-30 08:53:46',1,'CATALOGUING','MODIFY',1,'$VAR1 = {\n          \'itemnumber\' => \'1\',\n          \'datelastseen\' => \'2013-04-30\',\n          \'itemlost\' => 0\n        };\n'),(40,'2013-04-30 08:53:46',1,'CIRCULATION','ISSUE',5,'1'),(41,'2013-04-30 08:55:50',1,'CATALOGUING','MODIFY',2,'$VAR1 = {\n          \'itemnumber\' => \'2\',\n          \'issues\' => 1,\n          \'datelastborrowed\' => \'2013-04-30\',\n          \'holdingbranch\' => \'MPL\',\n          \'itemlost\' => 0,\n          \'onloan\' => \'2013-05-03\'\n        };\n'),(42,'2013-04-30 08:55:50',1,'CATALOGUING','MODIFY',2,'$VAR1 = {\n          \'itemnumber\' => \'2\',\n          \'datelastseen\' => \'2013-04-30\',\n          \'itemlost\' => 0\n        };\n'),(43,'2013-04-30 08:55:50',1,'CIRCULATION','ISSUE',5,'1'),(44,'2013-04-30 08:56:06',1,'CATALOGUING','MODIFY',4,'$VAR1 = {\n          \'itemnumber\' => \'4\',\n          \'issues\' => 1,\n          \'datelastborrowed\' => \'2013-04-30\',\n          \'holdingbranch\' => \'MPL\',\n          \'itemlost\' => 0,\n          \'onloan\' => \'2013-05-03\'\n        };\n'),(45,'2013-04-30 08:56:06',1,'CATALOGUING','MODIFY',4,'$VAR1 = {\n          \'itemnumber\' => \'4\',\n          \'datelastseen\' => \'2013-04-30\',\n          \'itemlost\' => 0\n        };\n'),(46,'2013-04-30 08:56:06',1,'CIRCULATION','ISSUE',5,'2'),(47,'2013-04-30 08:57:40',1,'CATALOGUING','MODIFY',7,'$VAR1 = {\n          \'itemnumber\' => \'7\',\n          \'issues\' => 1,\n          \'datelastborrowed\' => \'2013-04-30\',\n          \'holdingbranch\' => \'MPL\',\n          \'itemlost\' => 0,\n          \'onloan\' => \'2013-05-03\'\n        };\n'),(48,'2013-04-30 08:57:40',1,'CATALOGUING','MODIFY',7,'$VAR1 = {\n          \'itemnumber\' => \'7\',\n          \'datelastseen\' => \'2013-04-30\',\n          \'itemlost\' => 0\n        };\n'),(49,'2013-04-30 08:57:40',1,'CIRCULATION','ISSUE',3,'3'),(50,'2013-04-30 12:37:43',1,'CATALOGUING','ADD',6,'biblio'),(51,'2013-04-30 13:19:34',1,'CATALOGUING','MODIFY',3,'$VAR1 = {\n          \'itemnumber\' => \'3\',\n          \'issues\' => 1,\n          \'datelastborrowed\' => \'2013-04-30\',\n          \'holdingbranch\' => \'MPL\',\n          \'itemlost\' => 0,\n          \'onloan\' => \'2013-05-03\'\n        };\n'),(52,'2013-04-30 13:19:34',1,'CATALOGUING','MODIFY',3,'$VAR1 = {\n          \'itemnumber\' => \'3\',\n          \'datelastseen\' => \'2013-04-30\',\n          \'itemlost\' => 0\n        };\n'),(53,'2013-04-30 13:19:34',1,'CIRCULATION','ISSUE',3,'1');
/*!40000 ALTER TABLE `action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '',
  `externalid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`alertid`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `type` (`type`,`externalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbasket`
--

DROP TABLE IF EXISTS `aqbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbasket` (
  `basketno` int(11) NOT NULL AUTO_INCREMENT,
  `basketname` varchar(50) DEFAULT NULL,
  `note` mediumtext,
  `booksellernote` mediumtext,
  `contractnumber` int(11) DEFAULT NULL,
  `creationdate` date DEFAULT NULL,
  `closedate` date DEFAULT NULL,
  `booksellerid` int(11) NOT NULL DEFAULT '1',
  `authorisedby` varchar(10) DEFAULT NULL,
  `booksellerinvoicenumber` mediumtext,
  `basketgroupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`basketno`),
  KEY `booksellerid` (`booksellerid`),
  KEY `basketgroupid` (`basketgroupid`),
  KEY `contractnumber` (`contractnumber`),
  CONSTRAINT `aqbasket_ibfk_1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `aqbasket_ibfk_2` FOREIGN KEY (`contractnumber`) REFERENCES `aqcontract` (`contractnumber`),
  CONSTRAINT `aqbasket_ibfk_3` FOREIGN KEY (`basketgroupid`) REFERENCES `aqbasketgroups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbasket`
--

LOCK TABLES `aqbasket` WRITE;
/*!40000 ALTER TABLE `aqbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbasket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbasketgroups`
--

DROP TABLE IF EXISTS `aqbasketgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbasketgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `booksellerid` int(11) NOT NULL,
  `deliveryplace` varchar(10) DEFAULT NULL,
  `freedeliveryplace` text,
  `deliverycomment` varchar(255) DEFAULT NULL,
  `billingplace` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booksellerid` (`booksellerid`),
  CONSTRAINT `aqbasketgroups_ibfk_1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbasketgroups`
--

LOCK TABLES `aqbasketgroups` WRITE;
/*!40000 ALTER TABLE `aqbasketgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbasketgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbooksellers`
--

DROP TABLE IF EXISTS `aqbooksellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbooksellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `address1` mediumtext,
  `address2` mediumtext,
  `address3` mediumtext,
  `address4` mediumtext,
  `phone` varchar(30) DEFAULT NULL,
  `accountnumber` mediumtext,
  `othersupplier` mediumtext,
  `currency` varchar(3) NOT NULL DEFAULT '',
  `booksellerfax` mediumtext,
  `notes` mediumtext,
  `bookselleremail` mediumtext,
  `booksellerurl` mediumtext,
  `contact` varchar(100) DEFAULT NULL,
  `postal` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `contpos` varchar(100) DEFAULT NULL,
  `contphone` varchar(100) DEFAULT NULL,
  `contfax` varchar(100) DEFAULT NULL,
  `contaltphone` varchar(100) DEFAULT NULL,
  `contemail` varchar(100) DEFAULT NULL,
  `contnotes` mediumtext,
  `active` tinyint(4) DEFAULT NULL,
  `listprice` varchar(10) DEFAULT NULL,
  `invoiceprice` varchar(10) DEFAULT NULL,
  `gstreg` tinyint(4) DEFAULT NULL,
  `listincgst` tinyint(4) DEFAULT NULL,
  `invoiceincgst` tinyint(4) DEFAULT NULL,
  `gstrate` decimal(6,4) DEFAULT NULL,
  `discount` float(6,4) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `deliverytime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listprice` (`listprice`),
  KEY `invoiceprice` (`invoiceprice`),
  CONSTRAINT `aqbooksellers_ibfk_1` FOREIGN KEY (`listprice`) REFERENCES `currency` (`currency`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqbooksellers_ibfk_2` FOREIGN KEY (`invoiceprice`) REFERENCES `currency` (`currency`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbooksellers`
--

LOCK TABLES `aqbooksellers` WRITE;
/*!40000 ALTER TABLE `aqbooksellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbooksellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgetperiods`
--

DROP TABLE IF EXISTS `aqbudgetperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgetperiods` (
  `budget_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_period_startdate` date NOT NULL,
  `budget_period_enddate` date NOT NULL,
  `budget_period_active` tinyint(1) DEFAULT '0',
  `budget_period_description` mediumtext,
  `budget_period_total` decimal(28,6) DEFAULT NULL,
  `budget_period_locked` tinyint(1) DEFAULT NULL,
  `sort1_authcat` varchar(10) DEFAULT NULL,
  `sort2_authcat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`budget_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgetperiods`
--

LOCK TABLES `aqbudgetperiods` WRITE;
/*!40000 ALTER TABLE `aqbudgetperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgetperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgets`
--

DROP TABLE IF EXISTS `aqbudgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgets` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_parent_id` int(11) DEFAULT NULL,
  `budget_code` varchar(30) DEFAULT NULL,
  `budget_name` varchar(80) DEFAULT NULL,
  `budget_branchcode` varchar(10) DEFAULT NULL,
  `budget_amount` decimal(28,6) DEFAULT '0.000000',
  `budget_encumb` decimal(28,6) DEFAULT '0.000000',
  `budget_expend` decimal(28,6) DEFAULT '0.000000',
  `budget_notes` mediumtext,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `budget_period_id` int(11) DEFAULT NULL,
  `sort1_authcat` varchar(80) DEFAULT NULL,
  `sort2_authcat` varchar(80) DEFAULT NULL,
  `budget_owner_id` int(11) DEFAULT NULL,
  `budget_permission` int(1) DEFAULT '0',
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgets`
--

LOCK TABLES `aqbudgets` WRITE;
/*!40000 ALTER TABLE `aqbudgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqbudgets_planning`
--

DROP TABLE IF EXISTS `aqbudgets_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqbudgets_planning` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) NOT NULL,
  `budget_period_id` int(11) NOT NULL,
  `estimated_amount` decimal(28,6) DEFAULT NULL,
  `authcat` varchar(30) NOT NULL,
  `authvalue` varchar(30) NOT NULL,
  `display` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`plan_id`),
  KEY `aqbudgets_planning_ifbk_1` (`budget_id`),
  CONSTRAINT `aqbudgets_planning_ifbk_1` FOREIGN KEY (`budget_id`) REFERENCES `aqbudgets` (`budget_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqbudgets_planning`
--

LOCK TABLES `aqbudgets_planning` WRITE;
/*!40000 ALTER TABLE `aqbudgets_planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqbudgets_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqcontract`
--

DROP TABLE IF EXISTS `aqcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqcontract` (
  `contractnumber` int(11) NOT NULL AUTO_INCREMENT,
  `contractstartdate` date DEFAULT NULL,
  `contractenddate` date DEFAULT NULL,
  `contractname` varchar(50) DEFAULT NULL,
  `contractdescription` mediumtext,
  `booksellerid` int(11) NOT NULL,
  PRIMARY KEY (`contractnumber`),
  KEY `booksellerid_fk1` (`booksellerid`),
  CONSTRAINT `booksellerid_fk1` FOREIGN KEY (`booksellerid`) REFERENCES `aqbooksellers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqcontract`
--

LOCK TABLES `aqcontract` WRITE;
/*!40000 ALTER TABLE `aqcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqcontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorderdelivery`
--

DROP TABLE IF EXISTS `aqorderdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorderdelivery` (
  `ordernumber` date DEFAULT NULL,
  `deliverynumber` smallint(6) NOT NULL DEFAULT '0',
  `deliverydate` varchar(18) DEFAULT NULL,
  `qtydelivered` smallint(6) DEFAULT NULL,
  `deliverycomments` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorderdelivery`
--

LOCK TABLES `aqorderdelivery` WRITE;
/*!40000 ALTER TABLE `aqorderdelivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorderdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorders`
--

DROP TABLE IF EXISTS `aqorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorders` (
  `ordernumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) DEFAULT NULL,
  `entrydate` date DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `listprice` decimal(28,6) DEFAULT NULL,
  `totalamount` decimal(28,6) DEFAULT NULL,
  `datereceived` date DEFAULT NULL,
  `booksellerinvoicenumber` mediumtext,
  `freight` decimal(28,6) DEFAULT NULL,
  `unitprice` decimal(28,6) DEFAULT NULL,
  `quantityreceived` smallint(6) NOT NULL DEFAULT '0',
  `cancelledby` varchar(10) DEFAULT NULL,
  `datecancellationprinted` date DEFAULT NULL,
  `notes` mediumtext,
  `supplierreference` mediumtext,
  `purchaseordernumber` mediumtext,
  `subscription` tinyint(1) DEFAULT NULL,
  `serialid` varchar(30) DEFAULT NULL,
  `basketno` int(11) DEFAULT NULL,
  `biblioitemnumber` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rrp` decimal(13,2) DEFAULT NULL,
  `ecost` decimal(13,2) DEFAULT NULL,
  `gst` decimal(13,2) DEFAULT NULL,
  `budget_id` int(11) NOT NULL,
  `budgetgroup_id` int(11) NOT NULL,
  `budgetdate` date DEFAULT NULL,
  `sort1` varchar(80) DEFAULT NULL,
  `sort2` varchar(80) DEFAULT NULL,
  `sort1_authcat` varchar(10) DEFAULT NULL,
  `sort2_authcat` varchar(10) DEFAULT NULL,
  `uncertainprice` tinyint(1) DEFAULT NULL,
  `claims_count` int(11) DEFAULT '0',
  `claimed_date` date DEFAULT NULL,
  PRIMARY KEY (`ordernumber`),
  KEY `basketno` (`basketno`),
  KEY `biblionumber` (`biblionumber`),
  KEY `budget_id` (`budget_id`),
  CONSTRAINT `aqorders_ibfk_1` FOREIGN KEY (`basketno`) REFERENCES `aqbasket` (`basketno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aqorders_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorders`
--

LOCK TABLES `aqorders` WRITE;
/*!40000 ALTER TABLE `aqorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aqorders_items`
--

DROP TABLE IF EXISTS `aqorders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aqorders_items` (
  `ordernumber` int(11) NOT NULL,
  `itemnumber` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemnumber`),
  KEY `ordernumber` (`ordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aqorders_items`
--

LOCK TABLES `aqorders_items` WRITE;
/*!40000 ALTER TABLE `aqorders_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `aqorders_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_header`
--

DROP TABLE IF EXISTS `auth_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_header` (
  `authid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authtypecode` varchar(10) NOT NULL DEFAULT '',
  `datecreated` date DEFAULT NULL,
  `datemodified` date DEFAULT NULL,
  `origincode` varchar(20) DEFAULT NULL,
  `authtrees` mediumtext,
  `marc` blob,
  `linkid` bigint(20) DEFAULT NULL,
  `marcxml` longtext NOT NULL,
  PRIMARY KEY (`authid`),
  KEY `origincode` (`origincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_header`
--

LOCK TABLES `auth_header` WRITE;
/*!40000 ALTER TABLE `auth_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_subfield_structure`
--

DROP TABLE IF EXISTS `auth_subfield_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_subfield_structure` (
  `authtypecode` varchar(10) NOT NULL DEFAULT '',
  `tagfield` varchar(3) NOT NULL DEFAULT '',
  `tagsubfield` varchar(1) NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) NOT NULL DEFAULT '',
  `libopac` varchar(255) NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `tab` tinyint(1) DEFAULT NULL,
  `authorised_value` varchar(10) DEFAULT NULL,
  `value_builder` varchar(80) DEFAULT NULL,
  `seealso` varchar(255) DEFAULT NULL,
  `isurl` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(3) NOT NULL DEFAULT '0',
  `linkid` tinyint(1) NOT NULL DEFAULT '0',
  `kohafield` varchar(45) DEFAULT '',
  `frameworkcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`authtypecode`,`tagfield`,`tagsubfield`),
  KEY `tab` (`authtypecode`,`tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_subfield_structure`
--

LOCK TABLES `auth_subfield_structure` WRITE;
/*!40000 ALTER TABLE `auth_subfield_structure` DISABLE KEYS */;
INSERT INTO `auth_subfield_structure` VALUES ('','000','@','fixed length control field','fixed length control field',0,1,0,NULL,NULL,NULL,0,0,0,'',''),('','001','@','control field','control field',0,1,0,'','','',0,0,0,'',''),('','005','@','control field','control field',0,0,0,'','','',0,0,0,'',''),('','015','@','ISADN','ISADN',0,0,0,'','','',0,0,0,'',''),('','035','a','System Control Number','System Control Number',0,0,0,'','','',0,-5,0,'',''),('','035','z','Cancelled or invalid control number','Cancelled or invalid control number',1,0,0,'','','',0,-5,0,'',''),('','100','a','General Processing Data','General Processing Data',0,1,1,'','','',0,-5,0,'',''),('','101','a','Language used by the Entity','Language used by the Entity',0,0,1,'','','',0,-5,0,'',''),('','102','a','Country of Nationality','Country of Nationality',1,0,1,'','','',0,-5,0,'',''),('','102','b','Locality','Locality',1,0,1,'','','',0,-5,0,'',''),('','106','a','One Character Code','One Character Code',0,0,1,'','','',0,-5,0,'',''),('','120','a','Coded data: personal names','Coded data: personal names',0,0,1,'','','',0,-5,0,'',''),('','123','d','Co-ordinates: Westernmost Longitude','Co-ordinates: Westernmost Longitude',0,0,1,'','','',0,-5,0,'',''),('','123','e','Co-ordinates: Easternmost Longitude','Co-ordinates: Easternmost Longitude',0,0,1,'','','',0,-5,0,'',''),('','123','f','Co-ordinates: Nothernmost Latitude','Co-ordinates: Nothernmost Latitude',0,0,1,'','','',0,-5,0,'',''),('','123','g','Co-ordinates: Southernmost Latitude','Co-ordinates: Southernmost Latitude',0,0,1,'','','',0,-5,0,'',''),('','150','a','Name Processing Data','Name Processing Data',0,0,1,'','','',0,-5,0,'',''),('','152','a','Cataloguing Rules','Cataloguing Rules',0,0,1,'','','',0,-5,0,'',''),('','152','b','Subject System','Subject System',0,0,1,'','','',0,-5,0,'',''),('','154','a','Title Processing Data','Title Processing Data',0,0,1,'','','',0,-5,0,'',''),('','160','a','Geographic Area Code','Geographic Area Code',1,0,1,'','','',0,-5,0,'',''),('','200','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'',''),('','200','7','Script','Script',0,0,2,'','','',0,0,0,'',''),('','200','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'',''),('','200','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','200','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,2,'','','',0,0,0,'',''),('','200','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,2,'','','',0,0,0,'',''),('','200','d','Roman Numerals','Roman Numerals',0,0,2,'','','',0,0,0,'',''),('','200','f','Dates','Dates',0,0,2,'','','',0,0,0,'',''),('','200','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,2,'','','',0,0,0,'',''),('','200','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','200','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','200','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','200','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','210','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'',''),('','210','7','Script','Script',0,0,2,'','','',0,0,0,'',''),('','210','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'',''),('','210','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','210','b','Subdivision','Subdivision',1,0,2,'','','',0,0,0,'',''),('','210','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,2,'','','',0,0,0,'',''),('','210','d','Number of Meeting','Number of Meeting',0,0,2,'','','',0,0,0,'',''),('','210','e','Location of Meeting','Location of Meeting',0,0,2,'','','',0,0,0,'',''),('','210','f','Date of Meeting','Date of Meeting',0,0,2,'','','',0,0,0,'',''),('','210','g','Inverted Element','Inverted Element',0,0,2,'','','',0,0,0,'',''),('','210','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,2,'','','',0,0,0,'',''),('','210','j','Form Subdivision','Form Subdivision',0,0,2,'',NULL,'',0,0,0,'',''),('','210','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','210','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','210','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','215','7','Script','Script',0,0,2,'','','',0,0,0,'',''),('','215','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'',''),('','215','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','215','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','215','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','215','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','215','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','216','7','Script','Script',0,0,2,'','','',0,0,0,'',''),('','216','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','216','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','216','c','Qualification','Qualification',1,0,2,'','','',0,0,0,'',''),('','216','f','Dates','Dates',0,0,2,'','','',0,0,0,'',''),('','216','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','216','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','216','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','216','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','220','4','Relator Code','Relator Code',1,0,2,'','','',0,0,0,'',''),('','220','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','220','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','220','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','220','f','Dates','Dates',0,0,2,'','','',0,0,0,'',''),('','220','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','220','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','220','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','220','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','230','7','Script','Script',0,0,2,'','','',0,0,0,'',''),('','230','8','Language of Cataloguing','Language of Cataloguing',0,0,2,'','','',0,0,0,'',''),('','230','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','230','b','General Material Designation','General Material Designation',1,0,2,'','','',0,0,0,'',''),('','230','h','Number of Section or Part','Number of Section or Part',1,0,2,'','','',0,0,0,'',''),('','230','i','Name of Section or Part','Name of Section or Part',1,0,2,'','','',0,0,0,'',''),('','230','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','230','k','Date of Publication','Date of Publication',0,0,2,'','','',0,0,0,'',''),('','230','l','Form Subheading','Form Subheading',0,0,2,'','','',0,0,0,'',''),('','230','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,2,'','','',0,0,0,'',''),('','230','n','Miscellaneous Information','Miscellaneous Information',0,0,2,'',NULL,'',0,0,0,'',''),('','230','q','Version (or Date of Version)','Version (or Date of Version)',0,0,2,'','','',0,0,0,'',''),('','230','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,2,'','','',0,0,0,'',''),('','230','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,2,'','','',0,0,0,'',''),('','230','u','Key (for Music)','Key (for Music)',0,0,2,'','','',0,0,0,'',''),('','230','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,2,'','','',0,0,0,'',''),('','230','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','230','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','230','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','235','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','235','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','235','a','Collective Uniform Title','Collective Uniform Title',0,0,2,'','','',0,0,0,'',''),('','235','b','General Material Designation','General Material Designation',1,0,2,'','','',0,0,0,'',''),('','235','e','Collective Uniform Subtitle','Collective Uniform Subtitle',0,0,2,'','','',0,0,0,'',''),('','235','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','235','k','Date of Publication','Date of Publication',0,0,2,'','','',0,0,0,'',''),('','235','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,2,'','','',0,0,0,'',''),('','235','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,2,'','','',0,0,0,'',''),('','235','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,2,'','','',0,0,0,'',''),('','235','u','Key (for Music)','Key (for Music)',0,0,2,'','','',0,0,0,'',''),('','235','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,2,'','','',0,0,0,'',''),('','235','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','235','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','235','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','240','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','240','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','240','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','240','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','240','t','Title','Title',0,0,2,'','','',0,0,0,'',''),('','240','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','240','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','240','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','245','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','245','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','245','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','245','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','245','t','Title','Title',0,0,2,'','','',0,0,0,'',''),('','245','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','245','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','245','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','250','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','250','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','250','a','Topical Subject','Topical Subject',0,0,2,'','','',0,0,0,'',''),('','250','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','250','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','250','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','250','z','Chronological Subdivision','Chronological Subdivision',0,0,2,'','','',0,0,0,'',''),('','260','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','260','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','260','a','Country','Country',0,0,2,'','','',0,0,0,'',''),('','260','b','State or Province, etc.','State or Province, etc.',0,0,2,'','','',0,0,0,'',''),('','260','c','County','County',0,0,2,'','','',0,0,0,'',''),('','260','d','City','City',0,0,2,'','','',0,0,0,'',''),('','280','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','280','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,2,'','','',0,0,0,'',''),('','280','a','Entry Element','Entry Element',0,0,2,'','','',0,0,0,'',''),('','280','j','Form Subdivision','Form Subdivision',1,0,2,'','','',0,0,0,'',''),('','280','x','Topical Subdivision','Topical Subdivision',1,0,2,'','','',0,0,0,'',''),('','280','y','Geographical Subdivision','Geographical Subdivision',1,0,2,'','','',0,0,0,'',''),('','280','z','Chronological Subdivision','Chronological Subdivision',1,0,2,'','','',0,0,0,'',''),('','300','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','300','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','300','a','Information Note','Information Note',0,0,3,'','','',0,-5,0,'',''),('','305','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','305','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','305','a','Instruction Phrase','Instruction Phrase',1,0,3,'','','',0,-5,0,'',''),('','305','b','Heading Referred','Heading Referred',1,0,3,'','','',0,-5,0,'',''),('','310','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','310','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','310','a','Instruction Phrase','Instruction Phrase',0,0,3,'','','',0,-5,0,'',''),('','310','b','Heading Referred','Heading Referred',1,0,3,'','','',0,-5,0,'',''),('','320','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','320','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'',NULL,'',0,0,0,'',''),('','320','a','General Explanatory Reference Note','General Explanatory Reference Note',1,0,3,'','','',0,-5,0,'',''),('','330','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','330','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','330','a','General Scope Note','General Scope Note',0,0,3,'','','',0,-5,0,'',''),('','340','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','340','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','340','a','Biographical or Activity Note','Biographical or Activity Note',0,0,3,'','','',0,-5,0,'',''),('','356','6','Interfield Linking Data','Interfield Linking Data',0,0,3,'','','',0,-5,0,'',''),('','356','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,3,'','','',0,-5,0,'',''),('','356','a','Geographical Note','Geographical Note',0,0,3,'','','',0,-5,0,'',''),('','400','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','400','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','400','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','400','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'',''),('','400','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','400','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','400','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','400','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','400','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,4,'','','',0,0,0,'',''),('','400','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,4,'','','',0,0,0,'',''),('','400','d','Roman Numerals','Roman Numerals',0,0,4,'','','',0,0,0,'',''),('','400','f','Dates','Dates',0,0,4,'','','',0,0,0,'',''),('','400','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,4,'','','',0,0,0,'',''),('','400','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','400','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','400','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','400','z','Chronological Subdivision','Chronological Subdivision',0,0,4,'','','',0,0,0,'',''),('','410','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','410','2','sub','sub',0,0,4,'','','',0,0,0,'',''),('','410','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','410','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'',''),('','410','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','410','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','410','7','scr','scr',0,0,4,'','','',0,0,0,'',''),('','410','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','410','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','410','b','Subdivision','Subdivision',1,0,4,'','','',0,0,0,'',''),('','410','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,4,'','','',0,0,0,'',''),('','410','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,4,'','','',0,0,0,'',''),('','410','e','Location of Meeting','Location of Meeting',0,0,4,'','','',0,0,0,'',''),('','410','f','Date of Meeting','Date of Meeting',0,0,4,'','','',0,0,0,'',''),('','410','g','Inverted Element','Inverted Element',0,0,4,'','','',0,0,0,'',''),('','410','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,4,'','','',0,0,0,'',''),('','410','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','410','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','410','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','410','z','Chronological Subdivision','Chronological Subdivision',0,0,4,'','','',0,0,0,'',''),('','415','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','415','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','415','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','415','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','415','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','415','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','415','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','415','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','415','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','415','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','415','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','415','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','416','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','416','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','416','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','416','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','416','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','416','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','416','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','416','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','416','c','Qualification','Qualification',1,0,4,'','','',0,0,0,'',''),('','416','f','Dates','Dates',0,0,4,'','','',0,0,0,'',''),('','416','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','416','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','416','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','416','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','420','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','420','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','420','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','420','4','Relator Code','Relator Code',1,0,4,'','','',0,0,0,'',''),('','420','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','420','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','420','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','420','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'',NULL,'',0,0,0,'',''),('','420','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','420','f','Dates','Dates',0,0,4,'','','',0,0,0,'',''),('','420','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','420','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','420','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','420','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','430','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','430','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','430','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','430','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','430','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','430','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','430','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','430','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','430','b','General Material Designation','General Material Designation',1,0,4,'','','',0,0,0,'',''),('','430','h','Number of Section or Part','Number of Section or Part',1,0,4,'','','',0,0,0,'',''),('','430','i','Name of Section or Part','Name of Section or Part',1,0,4,'','','',0,0,0,'',''),('','430','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','430','k','Date of Publication','Date of Publication',0,0,4,'','','',0,0,0,'',''),('','430','l','Form Subheading','Form Subheading',0,0,4,'','','',0,0,0,'',''),('','430','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,4,'','','',0,0,0,'',''),('','430','n','Miscellaneous Information','Miscellaneous Information',0,0,4,'','','',0,0,0,'',''),('','430','q','Version (or Date of Version)','Version (or Date of Version)',0,0,4,'','','',0,0,0,'',''),('','430','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,4,'','','',0,0,0,'',''),('','430','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,4,'','','',0,0,0,'',''),('','430','u','Key (for Music)','Key (for Music)',0,0,4,'','','',0,0,0,'',''),('','430','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,4,'','','',0,0,0,'',''),('','430','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','430','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','430','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','440','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','440','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','440','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','440','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','440','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','440','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','440','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','440','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','440','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','440','t','Title','Title',0,0,4,'','','',0,0,0,'',''),('','440','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','440','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','440','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','445','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','445','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','445','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','445','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','445','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','445','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','445','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','445','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','445','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','445','t','Title','Title',0,0,4,'','','',0,0,0,'',''),('','445','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','445','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','445','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','450','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','450','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','450','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','450','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','450','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','450','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','450','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','450','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','450','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','450','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','450','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','450','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','460','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','460','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','460','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','460','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','460','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','460','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','460','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','460','a','Country','Country',0,0,4,'','','',0,0,0,'',''),('','460','b','State or Province, etc.','State or Province, etc.',0,0,4,'','','',0,0,0,'',''),('','460','c','Country','Country',0,0,4,'','','',0,0,0,'',''),('','460','d','City','City',0,0,4,'','','',0,0,0,'',''),('','480','0','Instruction Phrase','Instruction Phrase',0,0,4,'','','',0,0,0,'',''),('','480','2','Subject System Code','Subject System Code',0,0,4,'','','',0,0,0,'',''),('','480','3','Authority Record Number','Authority Record Number',0,0,4,'','','',0,0,0,'',''),('','480','5','Tracing Control','Tracing Control',0,0,4,'','','',0,0,0,'',''),('','480','6','Interfield Linking Data','Interfield Linking Data',0,0,4,'','','',0,0,0,'',''),('','480','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','480','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,4,'','','',0,0,0,'',''),('','480','a','Entry Element','Entry Element',0,0,4,'','','',0,0,0,'',''),('','480','j','Form Subdivision','Form Subdivision',1,0,4,'','','',0,0,0,'',''),('','480','x','Topical Subdivision','Topical Subdivision',1,0,4,'','','',0,0,0,'',''),('','480','y','Geographical Subdivision','Geographical Subdivision',1,0,4,'','','',0,0,0,'',''),('','480','z','Chronological Subdivision','Chronological Subdivision',1,0,4,'','','',0,0,0,'',''),('','500','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','500','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','500','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','500','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'',''),('','500','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','500','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','500','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','500','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','500','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','500','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,5,'','','',0,0,0,'',''),('','500','c','Additions to Name Other than Dates','Additions to Name Other than Dates',1,0,5,'','','',0,0,0,'',''),('','500','d','Roman Numerals','Roman Numerals',0,0,5,'','','',0,0,0,'',''),('','500','f','Dates','Dates',0,0,5,'','','',0,0,0,'',''),('','500','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,5,'','','',0,0,0,'',''),('','500','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','500','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','500','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','500','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','510','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','510','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','510','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','510','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'',''),('','510','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','510','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','510','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','510','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','510','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','510','b','Subdivision','Subdivision',1,0,5,'','','',0,0,0,'',''),('','510','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,5,'','','',0,0,0,'',''),('','510','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,5,'','','',0,0,0,'',''),('','510','e','Location of Meeting','Location of Meeting',0,0,5,'','','',0,0,0,'',''),('','510','f','Date of Meeting','Date of Meeting',0,0,5,'','','',0,0,0,'',''),('','510','g','Inverted Element','Inverted Element',0,0,5,'','','',0,0,0,'',''),('','510','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,5,'','','',0,0,0,'',''),('','510','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','510','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','510','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','510','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','515','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','515','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','515','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','515','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','515','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','515','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','515','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','515','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','515','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','515','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','515','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','516','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','516','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','516','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','516','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','516','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','516','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','516','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','516','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','516','c','Qualification','Qualification',1,0,5,'','','',0,0,0,'',''),('','516','f','Dates','Dates',0,0,5,'','','',0,0,0,'',''),('','516','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','516','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','516','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','516','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','520','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','520','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','520','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','520','4','Relator Code','Relator Code',1,0,5,'','','',0,0,0,'',''),('','520','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','520','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','520','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','520','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','520','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','520','f','Dates','Dates',0,0,5,'','','',0,0,0,'',''),('','520','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','520','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','520','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','520','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','530','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','530','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','530','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','530','5','tra','tra',0,0,5,'','','',0,0,0,'',''),('','530','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','530','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','530','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','530','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','530','b','General Material Designation','General Material Designation',1,0,5,'','','',0,0,0,'',''),('','530','h','Number of Section or Part','Number of Section or Part',0,0,5,'','','',0,0,0,'',''),('','530','i','Name of Section or Part','Name of Section or Part',1,0,5,'','','',0,0,0,'',''),('','530','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','530','k','Date de Publication','Date de Publication',0,0,5,'','','',0,0,0,'',''),('','530','l','Form Subheading','Form Subheading',0,0,5,'','','',0,0,0,'',''),('','530','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,5,'','','',0,0,0,'',''),('','530','n','Miscellaneous Information','Miscellaneous Information',1,0,5,'','','',0,0,0,'',''),('','530','q','Version (or Date of Version)','Version (or Date of Version)',0,0,5,'','','',0,0,0,'',''),('','530','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,5,'','','',0,0,0,'',''),('','530','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,5,'','','',0,0,0,'',''),('','530','u','Key (for Music)','Key (for Music)',0,0,5,'','','',0,0,0,'',''),('','530','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,5,'','','',0,0,0,'',''),('','530','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','530','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','530','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','540','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','540','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','540','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','540','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','540','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','540','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','540','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','540','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','540','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','540','t','Title','Title',0,0,5,'','','',0,0,0,'',''),('','540','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','540','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','540','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','545','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','545','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','545','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','545','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','545','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','545','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','545','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','545','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','545','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','545','t','Title','Title',0,0,5,'','','',0,0,0,'',''),('','545','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','545','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','545','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','550','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','550','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','550','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','550','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','550','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','550','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','550','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','550','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','550','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','550','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','550','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','550','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','560','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','560','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','560','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','560','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','560','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','560','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','560','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','560','a','Country','Country',0,0,5,'','','',0,0,0,'',''),('','560','b','State or Province, etc.','State or Province, etc.',0,0,5,'','','',0,0,0,'',''),('','560','c','County','County',0,0,5,'','','',0,0,0,'',''),('','560','d','City','City',0,0,5,'','','',0,0,0,'',''),('','580','0','Instruction Phrase','Instruction Phrase',0,0,5,'','','',0,0,0,'',''),('','580','2','Subject System Code','Subject System Code',0,0,5,'','','',0,0,0,'',''),('','580','3','Authority Record Number','Authority Record Number',0,0,5,'','','',0,0,0,'',''),('','580','5','Tracing Control','Tracing Control',0,0,5,'','','',0,0,0,'',''),('','580','6','Interfield Linking Data','Interfield Linking Data',0,0,5,'','','',0,0,0,'',''),('','580','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','580','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,5,'','','',0,0,0,'',''),('','580','a','Entry Element','Entry Element',0,0,5,'','','',0,0,0,'',''),('','580','j','Form Subdivision','Form Subdivision',1,0,5,'','','',0,0,0,'',''),('','580','x','Topical Subdivision','Topical Subdivision',1,0,5,'','','',0,0,0,'',''),('','580','y','Geographical Subdivision','Geographical Subdivision',1,0,5,'','','',0,0,0,'',''),('','580','z','Chronological Subdivision','Chronological Subdivision',1,0,5,'','','',0,0,0,'',''),('','675','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'',''),('','675','a','UDC Number, Single or Beginning of a Range','UDC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'',''),('','675','b','UDC Number, End of a Range','UDC Number, End of a Range',0,0,6,'','','',0,-5,0,'',''),('','675','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'',''),('','675','v','UDC Edition','UDC Edition',0,0,6,'','','',0,-5,0,'',''),('','675','z','Language of Edition','Language of Edition',0,0,6,'','','',0,-5,0,'',''),('','676','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'',''),('','676','a','DDC Number, Single or Beginning of a Range','DDC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'',''),('','676','b','DDC Number, End of a Range','DDC Number, End of a Range',0,0,6,'','','',0,-5,0,'',''),('','676','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'',''),('','676','v','DDC Edition','DDC Edition',0,0,6,'','','',0,-5,0,'',''),('','676','z','Language of Edition','Language of Edition',0,0,6,'','','',0,-5,0,'',''),('','680','3','Authority Code Number (Link to Classification Format)','Authority Code Number (Link to Classification Format)',0,0,6,'','','',0,-5,0,'',''),('','680','a','LC Number, Single or Beginning of a Range','LC Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'',''),('','680','b','LC Number, End of a Range','LC Number, End of a Range',0,0,6,'','','',0,-5,0,'',''),('','680','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'',''),('','686','2','Subject System Code','Subject System Code',0,0,6,'',NULL,'',0,0,0,'',''),('','686','a','Class Number, Single or Beginning of a Range','Class Number, Single or Beginning of a Range',0,0,6,'','','',0,-5,0,'',''),('','686','b','Class Number, End of a Range','Class Number, End of a Range',0,0,6,'','','',0,-5,0,'',''),('','686','c','Explanatory Terms','Explanatory Terms',0,0,6,'','','',0,-5,0,'',''),('','700','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','700','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','700','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'',''),('','700','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','700','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','700','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','700','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,7,'','','',0,-5,0,'',''),('','700','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,7,'','','',0,-5,0,'',''),('','700','d','Roman Numerals','Roman Numerals',0,0,7,'','','',0,-5,0,'',''),('','700','f','Dates','Dates',0,0,7,'','','',0,-5,0,'',''),('','700','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,7,'','','',0,-5,0,'',''),('','700','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','700','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','700','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','700','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','710','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','710','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','710','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'',''),('','710','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','710','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','710','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','710','b','Subdivision','Subdivision',1,0,7,'','','',0,-5,0,'',''),('','710','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,7,'','','',0,-5,0,'',''),('','710','d','Number of Meeting and/or Part of Meeting','Number of Meeting and/or Part of Meeting',0,0,7,'','','',0,-5,0,'',''),('','710','e','Location of Meeting','Location of Meeting',0,0,7,'','','',0,-5,0,'',''),('','710','f','Date of Meeting','Date of Meeting',0,0,7,'','','',0,-5,0,'',''),('','710','g','Inverted Element','Inverted Element',0,0,7,'','','',0,-5,0,'',''),('','710','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,7,'','','',0,-5,0,'',''),('','710','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','710','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','710','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','710','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','715','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','715','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','715','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','715','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','715','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','715','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','715','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','715','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','715','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','716','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','716','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','716','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','716','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','716','a','Entry Element (Data Element)','Entry Element (Data Element)',0,0,7,'','','',0,-5,0,'',''),('','716','c','Qualification','Qualification',1,0,7,'','','',0,-5,0,'',''),('','716','f','Dates','Dates',0,0,7,'','','',0,-5,0,'',''),('','716','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','716','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','716','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','716','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','720','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','720','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','720','4','Relator Code','Relator Code',1,0,7,'','','',0,-5,0,'',''),('','720','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','720','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','720','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','720','f','Dates','Dates',0,0,7,'','','',0,-5,0,'',''),('','720','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','720','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','720','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','720','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','730','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','730','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','730','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','730','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','730','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','730','b','General Material Designation','General Material Designation',1,0,7,'','','',0,-5,0,'',''),('','730','h','Number of Section or Part','Number of Section or Part',1,0,7,'','','',0,-5,0,'',''),('','730','i','Name of Section or Part','Name of Section or Part',1,0,7,'','','',0,-5,0,'',''),('','730','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','730','k','Date of Publication','Date of Publication',0,0,7,'','','',0,-5,0,'',''),('','730','l','Form Subheading','Form Subheading',0,0,7,'','','',0,-5,0,'',''),('','730','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,7,'','','',0,-5,0,'',''),('','730','n','Miscellaneous Information','Miscellaneous Information',0,0,7,'','','',0,-5,0,'',''),('','730','q','Version (or Date of Version)','Version (or Date of Version)',0,0,7,'','','',0,-5,0,'',''),('','730','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,7,'','','',0,-5,0,'',''),('','730','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,7,'','','',0,-5,0,'',''),('','730','u','Key (for Music)','Key (for Music)',0,0,7,'','','',0,-5,0,'',''),('','730','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,7,'','','',0,-5,0,'',''),('','730','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','730','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','730','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','740','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','740','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','740','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','740','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','740','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','740','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','740','t','Title','Title',0,0,7,'','','',0,-5,0,'',''),('','740','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','740','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','740','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','745','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','745','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','745','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','745','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','745','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','745','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','745','t','Title','Title',0,0,7,'','','',0,-5,0,'',''),('','745','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','745','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','745','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','750','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','750','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','750','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','750','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','750','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','750','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','750','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','750','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','750','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','760','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','760','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','760','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','760','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','760','a','Country','Country',0,0,7,'','','',0,-5,0,'',''),('','760','b','State or Province, etc.','State or Province, etc.',0,0,7,'','','',0,-5,0,'',''),('','760','c','County','County',0,0,7,'','','',0,-5,0,'',''),('','760','d','City','City',0,0,7,'','','',0,-5,0,'',''),('','780','2','Subject System Code','Subject System Code',0,0,7,'','','',0,-5,0,'',''),('','780','3','Authority Record Number','Authority Record Number',0,0,7,'','','',0,-5,0,'',''),('','780','7','Script of Cataloguing and Script of the Base Heading','Script of Cataloguing and Script of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','780','8','Language of Cataloguing and Language of the Base Heading','Language of Cataloguing and Language of the Base Heading',0,0,7,'','','',0,-5,0,'',''),('','780','a','Entry Element','Entry Element',0,0,7,'','','',0,-5,0,'',''),('','780','j','Form Subdivision','Form Subdivision',1,0,7,'','','',0,-5,0,'',''),('','780','x','Topical Subdivision','Topical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','780','y','Geographical Subdivision','Geographical Subdivision',1,0,7,'','','',0,-5,0,'',''),('','780','z','Chronological Subdivision','Chronological Subdivision',0,0,7,'','','',0,-5,0,'',''),('','801','a','Country','Country',0,0,8,'','','',0,-5,0,'',''),('','801','b','Agency','Agency',0,0,8,'','','',0,-5,0,'',''),('','801','c','Date of Latest Transaction','Date of Latest Transaction',0,0,8,'','','',0,-5,0,'',''),('','810','a','Citation','Citation',0,0,8,'','','',0,-5,0,'',''),('','810','b','Information Found','Information Found',0,0,8,'','','',0,-5,0,'',''),('','815','a','Citation','Citation',1,0,8,'','','',0,-5,0,'',''),('','820','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'',''),('','825','a','Note Text','Note Text',0,0,8,'','','',0,-5,0,'',''),('','830','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'',''),('','835','a','Note Text','Note Text',1,0,8,'','','',0,-5,0,'',''),('','835','b','Replacement Heading','Replacement Heading',0,0,8,'','','',0,-5,0,'',''),('','835','d','Date of the Transaction','Date of the Transaction',0,0,8,'','','',0,-5,0,'',''),('','836','b','Replaced Heading','Replaced Heading',0,0,8,'','','',0,-5,0,'',''),('','836','d','Date of the Transaction','Date of the Transaction',0,0,8,'','','',0,-5,0,'',''),('','856','a','Host Name','Host Name',1,0,8,'','','',0,-5,0,'',''),('','856','b','Access Number','Access Number',1,0,8,'','','',0,-5,0,'',''),('','856','c','Compression Information','Compression Information',1,0,8,'','','',0,-5,0,'',''),('','856','d','Path','Path',1,0,8,'','','',0,-5,0,'',''),('','856','e','Date and Hour of Consultation and Access (YYYMMDDHHMM)','Date and Hour of Consultation and Access (YYYMMDDHHMM)',0,0,8,'','','',0,-5,0,'',''),('','856','f','Electronic Name','Electronic Name',1,0,8,'','','',0,-5,0,'',''),('','856','g','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,8,'','','',0,-5,0,'',''),('','856','h','Processor of Request','Processor of Request',0,0,8,'','','',0,-5,0,'',''),('','856','i','Instruction','Instruction',1,0,8,'','','',0,-5,0,'',''),('','856','j','Bits per Second','Bits per Second',0,0,8,'','','',0,-5,0,'',''),('','856','k','Password','Password',0,0,8,'','','',0,-5,0,'',''),('','856','l','Login/Logoff','Login/Logoff',0,0,8,'','','',0,-5,0,'',''),('','856','m','Contact for Access Assistance','Contact for Access Assistance',1,0,8,'','','',0,-5,0,'',''),('','856','n','Name of Location of Host in Subfield $a','Name of Location of Host in Subfield $a',0,0,8,'','','',0,-5,0,'',''),('','856','o','Operating System','Operating System',0,0,8,'','','',0,-5,0,'',''),('','856','p','Port','Port',0,0,8,'','','',0,-5,0,'',''),('','856','q','Electronic Format Type','Electronic Format Type',0,0,8,'','','',0,-5,0,'',''),('','856','r','Settings','Settings',0,0,8,'','','',0,-5,0,'',''),('','856','s','File Size','File Size',1,0,8,'','','',0,-5,0,'',''),('','856','t','Terminal Emulation','Terminal Emulation',1,0,8,'','','',0,-5,0,'',''),('','856','u','Uniform Address Locator (URL)','Uniform Address Locator (URL)',0,0,8,'','','',0,-5,0,'',''),('','856','v','Hours Access Method Available','Hours Access Method Available',1,0,8,'','','',0,-5,0,'',''),('','856','w','Record Control Number','Record Control Number',1,0,8,'','','',0,-5,0,'',''),('','856','x','Nonpublic Note','Nonpublic Note',0,0,8,'','','',0,-5,0,'',''),('','856','y','Access Method','Access Method',0,0,8,'','','',0,-5,0,'',''),('','856','z','Public Note','Public Note',1,0,8,'','','',0,-5,0,'',''),('','886','2','System Code','System Code',0,0,8,'','','',0,-5,0,'',''),('','886','a','Tag of the Source Format Field','Tag of the Source Format Field',1,0,8,'','','',0,-5,0,'',''),('','886','b','Indicators and Subfields of the Source Format Field','Indicators and Subfields of the Source Format Field',1,0,8,'','','',0,-5,0,'','');
/*!40000 ALTER TABLE `auth_subfield_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tag_structure`
--

DROP TABLE IF EXISTS `auth_tag_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tag_structure` (
  `authtypecode` varchar(10) NOT NULL DEFAULT '',
  `tagfield` varchar(3) NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) NOT NULL DEFAULT '',
  `libopac` varchar(255) NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `authorised_value` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`authtypecode`,`tagfield`),
  CONSTRAINT `auth_tag_structure_ibfk_1` FOREIGN KEY (`authtypecode`) REFERENCES `auth_types` (`authtypecode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tag_structure`
--

LOCK TABLES `auth_tag_structure` WRITE;
/*!40000 ALTER TABLE `auth_tag_structure` DISABLE KEYS */;
INSERT INTO `auth_tag_structure` VALUES ('','000','Record Label','Record Label',0,1,NULL),('','001','Record Identifier','Record Identifier',0,1,''),('','005','Version Identifier','Version Identifier',0,0,''),('','015','International Standard Authority Data Number (ISADN)','International Standard Authority Data Number (ISADN)',0,0,''),('','035','Other System Control Number','Other System Control Number',0,0,''),('','100','General Processing Data','General Processing Data',0,1,''),('','101','Language of the Entity','Language of the Entity',0,0,''),('','102','Nationality of the Entity','Nationality of the Entity',0,0,''),('','106','Coded Data Field: Personal/Coroprate/Family Name/Trademark Used as Subject Heading','Coded Data Field: Personal/Coroprate/Family Name/Trademark Used as Subject Heading',0,0,''),('','120','Coded Data Field: Personal Name','Coded Data Field: Personal Name',0,0,''),('','123','Coded Data Field: Territorial or Geographical Name','Coded Data Field: Territorial or Geographical Name',1,0,''),('','150','Coded Data Field: Corporate Name','Coded Data Field: Corporate Name',0,0,''),('','152','Rules','Rules',0,0,''),('','154','Coded Data Field: Uniform Titles','Coded Data Field: Uniform Titles',0,0,''),('','160','Geographic Area Code','Geographic Area Code',0,0,''),('','200','Heading - Personal Name','Heading - Personal Name',1,0,''),('','210','Heading - Corporate Body Name','Heading - Corporate Body Name',1,0,''),('','215','Heading - Territorial or Geographical Name','Heading - Territorial or Geographical Name',1,0,''),('','216','Heading - Trademark','Heading - Trademark',1,0,''),('','220','Heading - Family Name','Heading - Family Name',1,0,''),('','230','Heading - Uniform Title','Heading - Uniform Title',1,0,''),('','235','Heading - Collective Uniform Title','Heading - Collective Uniform Title',0,0,''),('','240','Heading - Name/Title','Heading - Name/Title',1,0,''),('','245','Heading - Name/Collective Uniform Title','Heading - Name/Collective Uniform Title',0,0,''),('','250','Heading - Topical Subject','Heading - Topical Subject',1,0,''),('','260','Heading - Place Access','Heading - Place Access',1,0,''),('','280','Heading - Form, Genre or Physical Characteristics','Heading - Form, Genre or Physical Characteristics',0,0,''),('','300','Information Note','Information Note',1,0,''),('','305','Textual See Also Reference Note','Textual See Also Reference Note',1,0,''),('','310','Textual See Reference Note','Textual See Reference Note',1,0,''),('','320','General Explanatory Reference Note','General Explanatory Reference Note',1,0,''),('','330','General Scope Note','General Scope Note',1,0,''),('','340','Biography and Activity Note','Biography and Activity Note',1,0,''),('','356','Geographical Note','Geographical Note',0,0,''),('','400','See Reference Tracing - Personal Name','See Reference Tracing - Personal Name',0,0,''),('','410','See Reference Tracing - Corporate Body Name','See Reference Tracing - Corporate Body Name',1,0,''),('','415','See Reference Tracing - Territorial or Geographical Name','See Reference Tracing - Territorial or Geographical Name',0,0,''),('','416','See Reference Tracing - Trademark','See Reference Tracing - Trademark',1,0,''),('','420','See Reference Tracing - Family Name','See Reference Tracing - Family Name',1,0,''),('','430','See Reference Tracing - Uniform Title','See Reference Tracing - Uniform Title',1,0,''),('','440','See Reference Tracing - Name/Title','See Reference Tracing - Name/Title',0,0,''),('','445','See Reference Tracing - Name/Collective Uniform Title','See Reference Tracing - Name/Collective Uniform Title',1,0,''),('','450','See Reference Tracing - Topical Subject','See Reference Tracing - Topical Subject',1,0,''),('','460','See Reference Tracing - Place Access','See Reference Tracing - Place Access',1,0,''),('','480','See Reference Tracing - Form Genre or Physical Characteristics','See Reference Tracing - Form Genre or Physical Characteristics',0,0,''),('','500','See Also Reference Tracing - Personal Name','See Also Reference Tracing - Personal Name',1,0,''),('','510','See Also Reference Tracing - Corporate Body Name','See Also Reference Tracing - Corporate Body Name',1,0,''),('','515','See Also Reference Tracing - Territorial or Geographical Name','See Also Reference Tracing - Territorial or Geographical Name',1,0,''),('','516','See Also Reference Tracing - Trademark','See Also Reference Tracing - Trademark',1,0,''),('','520','See Also Reference Tracing - Family Name','See Also Reference Tracing - Family Name',1,0,''),('','530','See Also Reference Tracing - Uniform Title','See Also Reference Tracing - Uniform Title',1,0,''),('','540','See Also Reference Tracing - Name/Title','See Also Reference Tracing - Name/Title',1,0,''),('','545','See Also Reference Tracing - Name/Collective Uniform Title','See Also Reference Tracing - Name/Collective Uniform Title',1,0,''),('','550','See Also Reference Tracing - Topical Subject','See Also Reference Tracing - Topical Subject',1,0,''),('','560','See Also Reference Tracing - Place Access','See Also Reference Tracing - Place Access',1,0,''),('','580','See Also Reference Tracing - Form, Genre or Physical Characteristics','See Also Reference Tracing - Form, Genre or Physical Characteristics',1,0,''),('','675','Universal Decimal Classification (UDC)','Universal Decimal Classification (UDC)',1,0,''),('','676','Dewey Decimal Classification (DDC)','Dewey Decimal Classification (DDC)',1,0,''),('','680','Library of Congress Classification (LCC)','Library of Congress Classification (LCC)',1,0,''),('','686','Other Classification Numbers','Other Classification Numbers',1,0,''),('','700','Linking Heading - Personal Name','Linking Heading - Personal Name',1,0,''),('','710','Linking Heading - Corporate Body Name','Linking Heading - Corporate Body Name',1,0,''),('','715','Linking Heading - Territorial or Geographical Name','Linking Heading - Territorial or Geographical Name',1,0,''),('','716','Linking Heading - Trademark','Linking Heading - Trademark',1,0,''),('','720','Linking Heading - Family Name','Linking Heading - Family Name',1,0,''),('','730','Linking Heading - Uniform Title','Linking Heading - Uniform Title',1,0,''),('','740','Linking Heading - Name/title','Linking Heading - Name/title',1,0,''),('','745','Linking Heading - Name/Collective Uniform Title','Linking Heading - Name/Collective Uniform Title',1,0,''),('','750','Linking Heading - Topical Subject','Linking Heading - Topical Subject',1,0,''),('','760','Linking Heading - Place Access','Linking Heading - Place Access',1,0,''),('','780','Linking Heading - Form, Genre or Physical Characteristics','Linking Heading - Form, Genre or Physical Characteristics',1,0,''),('','801','Originating Source','Originating Source',0,0,''),('','810','Source Data Found','Source Data Found',1,0,''),('','815','Source Data Not Found','Source Data Not Found',0,0,''),('','820','Usage or Scope Information','Usage or Scope Information',1,0,''),('','825','Example Under Note','Example Under Note',1,0,''),('','830','General Cataloguer&#039s Note','General Cataloguer&#039s Note',1,0,''),('','835','Deleted Heading Information','Deleted Heading Information',1,0,''),('','836','Replaced Heading Information','Replaced Heading Information',1,0,''),('','856','Electronic Location and Access','Electronic Location and Access',1,0,''),('','886','Data Not Connected From Source Format','Data Not Connected From Source Format',1,0,'');
/*!40000 ALTER TABLE `auth_tag_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_types`
--

DROP TABLE IF EXISTS `auth_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_types` (
  `authtypecode` varchar(10) NOT NULL DEFAULT '',
  `authtypetext` varchar(255) NOT NULL DEFAULT '',
  `auth_tag_to_report` varchar(3) NOT NULL DEFAULT '',
  `summary` mediumtext NOT NULL,
  PRIMARY KEY (`authtypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_types`
--

LOCK TABLES `auth_types` WRITE;
/*!40000 ALTER TABLE `auth_types` DISABLE KEYS */;
INSERT INTO `auth_types` VALUES ('','Default','','');
/*!40000 ALTER TABLE `auth_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorised_values`
--

DROP TABLE IF EXISTS `authorised_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorised_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(10) NOT NULL DEFAULT '',
  `authorised_value` varchar(80) NOT NULL DEFAULT '',
  `lib` varchar(80) DEFAULT NULL,
  `lib_opac` varchar(80) DEFAULT NULL,
  `imageurl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`category`),
  KEY `lib` (`lib`),
  KEY `auth_value_idx` (`authorised_value`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorised_values`
--

LOCK TABLES `authorised_values` WRITE;
/*!40000 ALTER TABLE `authorised_values` DISABLE KEYS */;
INSERT INTO `authorised_values` VALUES (1,'SUGGEST','BSELL','Bestseller',NULL,NULL),(2,'SUGGEST','SCD','Shelf Copy Damaged',NULL,NULL),(3,'SUGGEST','LCL','Library Copy Lost',NULL,NULL),(4,'SUGGEST','AVILL','Available via ILL',NULL,NULL),(5,'LOST','2','Long Overdue (Lost)',NULL,NULL),(6,'LOST','1','Lost',NULL,NULL),(7,'LOST','3','Lost and Paid For',NULL,NULL),(8,'LOST','4','Missing',NULL,NULL),(9,'DAMAGED','1','Damaged',NULL,NULL),(10,'LOC','FIC','Fiction',NULL,NULL),(11,'LOC','CHILD','Children\'s Area',NULL,NULL),(12,'LOC','DISPLAY','On Display',NULL,NULL),(13,'LOC','NEW','New Materials Shelf',NULL,NULL),(14,'LOC','STAFF','Staff Office',NULL,NULL),(15,'LOC','GEN','General Stacks',NULL,NULL),(16,'LOC','AV','Audio Visual',NULL,NULL),(17,'LOC','REF','Reference',NULL,NULL),(18,'LOC','CART','Book Cart',NULL,NULL),(19,'LOC','PROC','Processing Center',NULL,NULL),(20,'CCODE','FIC','Fiction',NULL,NULL),(21,'CCODE','REF','Reference',NULL,NULL),(22,'CCODE','NFIC','Non Fiction',NULL,NULL),(23,'WITHDRAWN','1','Withdrawn',NULL,NULL),(24,'NOT_LOAN','-1','Ordered',NULL,NULL),(25,'NOT_LOAN','1','Not For Loan',NULL,NULL),(26,'NOT_LOAN','2','Staff Collection',NULL,NULL),(27,'RESTRICTED','1','Restricted Access',NULL,NULL),(28,'MANUAL_INV','Copier Fees','.25',NULL,NULL),(29,'BOR_NOTES','ADDR','Address Notes',NULL,NULL),(30,'OPAC_SUG','damaged','The copy on the shelf is damaged','The copy on the shelf is damaged',NULL),(31,'OPAC_SUG','bestseller','Upcoming title by popular author','Upcoming title by popular author',NULL),(32,'REPORT_GRO','CIRC','Circulation',NULL,NULL),(33,'REPORT_GRO','CAT','Catalog',NULL,NULL),(34,'REPORT_GRO','PAT','Patrons',NULL,NULL),(35,'REPORT_GRO','ACQ','Acquisitions',NULL,NULL),(36,'REPORT_GRO','ACC','Accounts',NULL,NULL),(37,'YES_NO','0','No','No',NULL),(38,'YES_NO','1','Yes','Yes',NULL),(39,'YES_NO','0','No','No',NULL),(40,'YES_NO','1','Yes','Yes',NULL);
/*!40000 ALTER TABLE `authorised_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio`
--

DROP TABLE IF EXISTS `biblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio` (
  `biblionumber` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkcode` varchar(4) NOT NULL DEFAULT '',
  `author` mediumtext,
  `title` mediumtext,
  `unititle` mediumtext,
  `notes` mediumtext,
  `serial` tinyint(1) DEFAULT NULL,
  `seriestitle` mediumtext,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` date NOT NULL,
  `abstract` mediumtext,
  PRIMARY KEY (`biblionumber`),
  KEY `blbnoidx` (`biblionumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio`
--

LOCK TABLES `biblio` WRITE;
/*!40000 ALTER TABLE `biblio` DISABLE KEYS */;
INSERT INTO `biblio` VALUES (1,'','J. K. Rowling','Harry Potter and the chamber of secrets',NULL,'Livre en caractères \"large vision\"',0,NULL,NULL,'2013-04-30 08:34:08','2013-04-30',NULL),(2,'','Jack G. Ganssle,...','The art of programming embedded systems',NULL,'Bibliogr. p. 271-274. Index',0,NULL,NULL,'2013-04-30 08:37:27','2013-04-30',NULL),(3,'','Hergé','The black island',NULL,'1993 d\'apr�es la d�eclaration de d�ep�ot l�egal',1,'�The �adventures of Tintin.',NULL,'2013-04-30 08:40:04','2013-04-30',NULL),(4,'','Randal L. Schwartz et Tom Christiansen','Learning Perl',NULL,'Index',0,NULL,NULL,'2013-04-30 08:42:56','2013-04-30',NULL),(5,'','ed. by Paul Chilton and Crispin Aubrey','Nineteen eighty-four in 1984',NULL,NULL,1,'Comedia series',NULL,'2013-04-30 08:46:40','2013-04-30',NULL),(6,'','Aldous Huxley','Brave new world',NULL,NULL,1,'Longman structural readers',NULL,'2013-04-30 12:37:43','2013-04-30',NULL);
/*!40000 ALTER TABLE `biblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblio_framework`
--

DROP TABLE IF EXISTS `biblio_framework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblio_framework` (
  `frameworkcode` varchar(4) NOT NULL DEFAULT '',
  `frameworktext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`frameworkcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblio_framework`
--

LOCK TABLES `biblio_framework` WRITE;
/*!40000 ALTER TABLE `biblio_framework` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblio_framework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioimages`
--

DROP TABLE IF EXISTS `biblioimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioimages` (
  `imagenumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL,
  `mimetype` varchar(15) NOT NULL,
  `imagefile` mediumblob NOT NULL,
  `thumbnail` mediumblob NOT NULL,
  PRIMARY KEY (`imagenumber`),
  KEY `bibliocoverimage_fk1` (`biblionumber`),
  CONSTRAINT `bibliocoverimage_fk1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioimages`
--

LOCK TABLES `biblioimages` WRITE;
/*!40000 ALTER TABLE `biblioimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `biblioimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioitems`
--

DROP TABLE IF EXISTS `biblioitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biblioitems` (
  `biblioitemnumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `volume` mediumtext,
  `number` mediumtext,
  `itemtype` varchar(10) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `issn` varchar(9) DEFAULT NULL,
  `publicationyear` text,
  `publishercode` varchar(255) DEFAULT NULL,
  `volumedate` date DEFAULT NULL,
  `volumedesc` text,
  `collectiontitle` mediumtext,
  `collectionissn` text,
  `collectionvolume` mediumtext,
  `editionstatement` text,
  `editionresponsibility` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `illus` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `notes` mediumtext,
  `size` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `lccn` varchar(25) DEFAULT NULL,
  `marc` longblob,
  `url` varchar(255) DEFAULT NULL,
  `cn_source` varchar(10) DEFAULT NULL,
  `cn_class` varchar(30) DEFAULT NULL,
  `cn_item` varchar(10) DEFAULT NULL,
  `cn_suffix` varchar(10) DEFAULT NULL,
  `cn_sort` varchar(30) DEFAULT NULL,
  `totalissues` int(10) DEFAULT NULL,
  `marcxml` longtext NOT NULL,
  PRIMARY KEY (`biblioitemnumber`),
  KEY `bibinoidx` (`biblioitemnumber`),
  KEY `bibnoidx` (`biblionumber`),
  KEY `isbn` (`isbn`),
  KEY `issn` (`issn`),
  KEY `publishercode` (`publishercode`),
  CONSTRAINT `biblioitems_ibfk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioitems`
--

LOCK TABLES `biblioitems` WRITE;
/*!40000 ALTER TABLE `biblioitems` DISABLE KEYS */;
INSERT INTO `biblioitems` VALUES (1,1,NULL,NULL,NULL,'0786222735',NULL,'2000','Thorndike press',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:34:08',NULL,'464 p.',NULL,'23 cm',NULL,NULL,'00747nam a22002053  45000010002000000100021000020200017000230900006000401000041000461050018000871060006001052000101001112100043002122150024002553000040002796860072003197000055003917020047004468010048004931  a0786222735brel.  aFRb50129199  a1  a20011024d2000    m  y0frey50      ba  a||||z   00|||  ar1 aHarry Potter and the chamber of secretsbTexte impriméefJ. K. Rowlinggill. by Mary Grandprée  aThorndike (Me.)cThorndike pressd2000  a464 p.cill.d23 cm  aLivre en caractères \"large vision\"  a8232Cadre de classement de la Bibliographie nationale fran�caise  313520013aRowlingbJoanne Kathleenf1965-....4070  313750192aGrandpréebMaryf1954-....4440 0aFRbFR-751131015c20011024gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>00747nam a22002053  4500</leader>\n  <controlfield tag=\"001\">1</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">0786222735</subfield>\n    <subfield code=\"b\">rel.</subfield>\n  </datafield>\n  <datafield tag=\"020\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">50129199</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">20011024d2000    m  y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">||||z   00|||</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Harry Potter and the chamber of secrets</subfield>\n    <subfield code=\"b\">Texte imprimée</subfield>\n    <subfield code=\"f\">J. K. Rowling</subfield>\n    <subfield code=\"g\">ill. by Mary Grandprée</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Thorndike (Me.)</subfield>\n    <subfield code=\"c\">Thorndike press</subfield>\n    <subfield code=\"d\">2000</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">464 p.</subfield>\n    <subfield code=\"c\">ill.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"300\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Livre en caractères \"large vision\"</subfield>\n  </datafield>\n  <datafield tag=\"686\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">823</subfield>\n    <subfield code=\"2\">Cadre de classement de la Bibliographie nationale fran�caise</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">13520013</subfield>\n    <subfield code=\"a\">Rowling</subfield>\n    <subfield code=\"b\">Joanne Kathleen</subfield>\n    <subfield code=\"f\">1965-....</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">13750192</subfield>\n    <subfield code=\"a\">Grandprée</subfield>\n    <subfield code=\"b\">Mary</subfield>\n    <subfield code=\"f\">1954-....</subfield>\n    <subfield code=\"4\">440</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">20011024</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n'),(2,2,NULL,NULL,NULL,'0122748808',NULL,'1992','Academic press',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:37:27',NULL,'XIII-279 p.',NULL,'24 cm',NULL,NULL,'00666nam a2200205   45000010002000000100015000020900006000171000041000231050018000641060006000822000081000882100059001692150029002283000032002576060057002896760016003466760014003627000036003768010048004122  a0122748808  a2  a19940609d1992    m  y0frey50      ba  aa   z   00|y|  ar1 aThe art of programming embedded systemsbTexte impriméfJack G. Ganssle,...  aSan DiegoaNew YorkaBostoncAcademic pressdcop. 1992  aXIII-279 p.cill.d24 cm  aBibliogr. p. 271-274. Index  312410613aSyst�emes enfouis (informatique)2rameau  a005.101v22  a005.1v22  312400353aGansslebJack G.4070 0aFRbFR-751131015c19940609gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>00666nam a2200205   4500</leader>\n  <controlfield tag=\"001\">2</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">0122748808</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">2</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19940609d1992    m  y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">a   z   00|y|</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">The art of programming embedded systems</subfield>\n    <subfield code=\"b\">Texte imprimé</subfield>\n    <subfield code=\"f\">Jack G. Ganssle,...</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">San Diego</subfield>\n    <subfield code=\"a\">New York</subfield>\n    <subfield code=\"a\">Boston</subfield>\n    <subfield code=\"c\">Academic press</subfield>\n    <subfield code=\"d\">cop. 1992</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">XIII-279 p.</subfield>\n    <subfield code=\"c\">ill.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"300\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Bibliogr. p. 271-274. Index</subfield>\n  </datafield>\n  <datafield tag=\"606\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12410613</subfield>\n    <subfield code=\"a\">Syst�emes enfouis (informatique)</subfield>\n    <subfield code=\"2\">rameau</subfield>\n  </datafield>\n  <datafield tag=\"676\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">005.101</subfield>\n    <subfield code=\"v\">22</subfield>\n  </datafield>\n  <datafield tag=\"676\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">005.1</subfield>\n    <subfield code=\"v\">22</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12400353</subfield>\n    <subfield code=\"a\">Ganssle</subfield>\n    <subfield code=\"b\">Jack G.</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">19940609</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n'),(3,3,NULL,NULL,NULL,'2203403365',NULL,'1993','Casterman',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:40:04',NULL,'61 p.',NULL,'30 cm',NULL,NULL,'01008nam a2200265   45000010002000000100026000020200017000280900006000451000041000511010008000921050018001001060006001182000101001242100059002252150053002842250036003373000062003734540016004354610040004516860072004917000039005637020043006027020049006458010048006943  a2203403365bbr.d35 F  aFRb09324818  a3  a19930803d1993    a  y0frey50      ba1 cfre  aa   t   00|a|  ar1 aThe black islandbTexte impriméfHergég[transl. by Leslie Lonsdale-Cooper and Michael Turner]  aTournaia[Paris]cCastermand[1993]eImpr. en Belgique  a61 p.cill. en coul., couv. ill. en coul.d30 cm19a�The �adventures of Tintin.  a1993 d\'apr�es la d�eclaration de d�ep�ot l�egal 1tL\'ile noire 0034338074tThe adventures of Tintin.  a8232Cadre de classement de la Bibliographie nationale fran�caise  311907331aHerg�ef1907-19834070  312224326aLonsdale-CooperbLeslie4730  312225236aTurnerbMichael R.f1929-20094730 0aFRbFR-751131015c19930803gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>01008nam a2200265   4500</leader>\n  <controlfield tag=\"001\">3</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">2203403365</subfield>\n    <subfield code=\"b\">br.</subfield>\n    <subfield code=\"d\">35 F</subfield>\n  </datafield>\n  <datafield tag=\"020\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">09324818</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">3</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19930803d1993    a  y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"101\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"c\">fre</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">a   t   00|a|</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">The black island</subfield>\n    <subfield code=\"b\">Texte imprimé</subfield>\n    <subfield code=\"f\">Hergé</subfield>\n    <subfield code=\"g\">[transl. by Leslie Lonsdale-Cooper and Michael Turner]</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Tournai</subfield>\n    <subfield code=\"a\">[Paris]</subfield>\n    <subfield code=\"c\">Casterman</subfield>\n    <subfield code=\"d\">[1993]</subfield>\n    <subfield code=\"e\">Impr. en Belgique</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">61 p.</subfield>\n    <subfield code=\"c\">ill. en coul., couv. ill. en coul.</subfield>\n    <subfield code=\"d\">30 cm</subfield>\n  </datafield>\n  <datafield tag=\"225\" ind1=\"1\" ind2=\"9\">\n    <subfield code=\"a\">�The �adventures of Tintin.</subfield>\n  </datafield>\n  <datafield tag=\"300\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1993 d\'apr�es la d�eclaration de d�ep�ot l�egal</subfield>\n  </datafield>\n  <datafield tag=\"454\" ind1=\" \" ind2=\"1\">\n    <subfield code=\"t\">L\'ile noire</subfield>\n  </datafield>\n  <datafield tag=\"461\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"0\">34338074</subfield>\n    <subfield code=\"t\">The adventures of Tintin.</subfield>\n  </datafield>\n  <datafield tag=\"686\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">823</subfield>\n    <subfield code=\"2\">Cadre de classement de la Bibliographie nationale fran�caise</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">11907331</subfield>\n    <subfield code=\"a\">Herg�e</subfield>\n    <subfield code=\"f\">1907-1983</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12224326</subfield>\n    <subfield code=\"a\">Lonsdale-Cooper</subfield>\n    <subfield code=\"b\">Leslie</subfield>\n    <subfield code=\"4\">730</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12225236</subfield>\n    <subfield code=\"a\">Turner</subfield>\n    <subfield code=\"b\">Michael R.</subfield>\n    <subfield code=\"f\">1929-2009</subfield>\n    <subfield code=\"4\">730</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">19930803</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n'),(4,4,NULL,NULL,NULL,'1565922840',NULL,'1997','O\'Reilly',NULL,NULL,NULL,NULL,NULL,'2nd ed.',NULL,'2013-04-30 08:42:56',NULL,'XXIX- 271 p.',NULL,'24 cm',NULL,NULL,'00681cam a22002173  45000010002000000100020000020900006000221000041000281050018000691060006000872000074000932050012001672100035001792150030002143000010002446060054002547000039003087010037003477020031003848010048004154  a1565922840bbr.  a4  a20010312d1997    m  y0frey50      ba  a||||z   00|||  ar1 aLearning PerlbTexte impriméfRandal L. Schwartz et Tom Christiansen  a2nd ed.  aCambridgecO\'Reillydcop. 1997  aXXIX- 271 p.cill.d24 cm  aIndex  312490649aPerl (langage de programmation)2rameau  312551783aSchwartzbRandal L.4070  312551778aChristiansenbTom4070  312551776aWallbLarry4080 0aFRbFR-751131015c20010312gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>00681cam a22002173  4500</leader>\n  <controlfield tag=\"001\">4</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">1565922840</subfield>\n    <subfield code=\"b\">br.</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">4</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">20010312d1997    m  y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">||||z   00|||</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Learning Perl</subfield>\n    <subfield code=\"b\">Texte imprimé</subfield>\n    <subfield code=\"f\">Randal L. Schwartz et Tom Christiansen</subfield>\n  </datafield>\n  <datafield tag=\"205\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">2nd ed.</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Cambridge</subfield>\n    <subfield code=\"c\">O\'Reilly</subfield>\n    <subfield code=\"d\">cop. 1997</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">XXIX- 271 p.</subfield>\n    <subfield code=\"c\">ill.</subfield>\n    <subfield code=\"d\">24 cm</subfield>\n  </datafield>\n  <datafield tag=\"300\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Index</subfield>\n  </datafield>\n  <datafield tag=\"606\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12490649</subfield>\n    <subfield code=\"a\">Perl (langage de programmation)</subfield>\n    <subfield code=\"2\">rameau</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12551783</subfield>\n    <subfield code=\"a\">Schwartz</subfield>\n    <subfield code=\"b\">Randal L.</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"701\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12551778</subfield>\n    <subfield code=\"a\">Christiansen</subfield>\n    <subfield code=\"b\">Tom</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12551776</subfield>\n    <subfield code=\"a\">Wall</subfield>\n    <subfield code=\"b\">Larry</subfield>\n    <subfield code=\"4\">080</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">20010312</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n'),(5,5,'17',NULL,NULL,'090689042X',NULL,'1983','Comedia | M. Boyars',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:46:40',NULL,'120 p.',NULL,'23 cm',NULL,NULL,'00789nam a2200229   45000010002000000100015000020200017000170900006000341000041000401050018000811060006000992000126001052100047002312150024002782250023003024100017003256060041003426060052003837020041004357020035004768010048005115  a090689042X  aFRb58503098  a5  a19850101d1983    m  y0frey50      ba  a||||z   00|||  ar1 aNineteen eighty-four in 1984bTexte impriméeautonomy, control and communicationfed. by Paul Chilton and Crispin Aubrey  aLondoncComediaaNew YorkcM. Boyarsd1983  a120 p.cill.d23 cm  aComedia seriesv17 0034223840v17  312648074aContr�ole social2rameau  311948491aPolitique de la communication2rameau  312031616aChiltonbPaul Anthony4340  312682533aAubreybCrispin4340 0aFRbFR-751131015c19850101gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>00789nam a2200229   4500</leader>\n  <controlfield tag=\"001\">5</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">090689042X</subfield>\n  </datafield>\n  <datafield tag=\"020\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">58503098</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">5</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19850101d1983    m  y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">||||z   00|||</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Nineteen eighty-four in 1984</subfield>\n    <subfield code=\"b\">Texte imprimé</subfield>\n    <subfield code=\"e\">autonomy, control and communication</subfield>\n    <subfield code=\"f\">ed. by Paul Chilton and Crispin Aubrey</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">London</subfield>\n    <subfield code=\"c\">Comedia</subfield>\n    <subfield code=\"a\">New York</subfield>\n    <subfield code=\"c\">M. Boyars</subfield>\n    <subfield code=\"d\">1983</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">120 p.</subfield>\n    <subfield code=\"c\">ill.</subfield>\n    <subfield code=\"d\">23 cm</subfield>\n  </datafield>\n  <datafield tag=\"225\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Comedia series</subfield>\n    <subfield code=\"v\">17</subfield>\n  </datafield>\n  <datafield tag=\"410\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"0\">34223840</subfield>\n    <subfield code=\"v\">17</subfield>\n  </datafield>\n  <datafield tag=\"606\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12648074</subfield>\n    <subfield code=\"a\">Contr�ole social</subfield>\n    <subfield code=\"2\">rameau</subfield>\n  </datafield>\n  <datafield tag=\"606\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">11948491</subfield>\n    <subfield code=\"a\">Politique de la communication</subfield>\n    <subfield code=\"2\">rameau</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12031616</subfield>\n    <subfield code=\"a\">Chilton</subfield>\n    <subfield code=\"b\">Paul Anthony</subfield>\n    <subfield code=\"4\">340</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12682533</subfield>\n    <subfield code=\"a\">Aubrey</subfield>\n    <subfield code=\"b\">Crispin</subfield>\n    <subfield code=\"4\">340</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">19850101</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n'),(6,6,NULL,NULL,NULL,'0582537851',NULL,'1975','Longman | diffusion A. Colin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-30 12:37:43',NULL,'94 p.',NULL,'20 cm',NULL,NULL,'00833cam a2200217   45000010002000000100028000020200017000300900006000471000041000531050018000941060006001122000093001182100075002112150029002862250040003154100054003556860071004097000045004807020042005258010048005676  a0582537851bBr.d7,50 F  aFRb07600547  a6  a19751209d1975    de y0frey50      ba  a||||j   00|a|  ar1 aBrave new worldbTexte imprim�efAldous Huxleygabridged and simplified by S.H. Burton  aLondoncLongmanaPariscdiffusion A. Colind1975eimpr. �a Hong Kong  a94 p.ccouv. ill.d20 cm  aLongman structural readersiStage 6 0034235397tLongman structural readers. Stage 6v11  a832Cadre de classement de la Bibliographie nationale fran�caise  311908111aHuxleybAldousf1894-19634070  312594062aBurtonbSamuel Holroyd4340 0aFRbFR-751131015c19751209gAFNOR2intermrc',NULL,NULL,NULL,NULL,NULL,'',NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<record\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd\"\n    xmlns=\"http://www.loc.gov/MARC21/slim\">\n\n  <leader>00833cam a2200217   4500</leader>\n  <controlfield tag=\"001\">6</controlfield>\n  <datafield tag=\"010\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">0582537851</subfield>\n    <subfield code=\"b\">Br.</subfield>\n    <subfield code=\"d\">7,50 F</subfield>\n  </datafield>\n  <datafield tag=\"020\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">07600547</subfield>\n  </datafield>\n  <datafield tag=\"090\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">6</subfield>\n  </datafield>\n  <datafield tag=\"100\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">19751209d1975    de y0frey50      ba</subfield>\n  </datafield>\n  <datafield tag=\"105\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">||||j   00|a|</subfield>\n  </datafield>\n  <datafield tag=\"106\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">r</subfield>\n  </datafield>\n  <datafield tag=\"200\" ind1=\"1\" ind2=\" \">\n    <subfield code=\"a\">Brave new world</subfield>\n    <subfield code=\"b\">Texte imprim�e</subfield>\n    <subfield code=\"f\">Aldous Huxley</subfield>\n    <subfield code=\"g\">abridged and simplified by S.H. Burton</subfield>\n  </datafield>\n  <datafield tag=\"210\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">London</subfield>\n    <subfield code=\"c\">Longman</subfield>\n    <subfield code=\"a\">Paris</subfield>\n    <subfield code=\"c\">diffusion A. Colin</subfield>\n    <subfield code=\"d\">1975</subfield>\n    <subfield code=\"e\">impr. �a Hong Kong</subfield>\n  </datafield>\n  <datafield tag=\"215\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">94 p.</subfield>\n    <subfield code=\"c\">couv. ill.</subfield>\n    <subfield code=\"d\">20 cm</subfield>\n  </datafield>\n  <datafield tag=\"225\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">Longman structural readers</subfield>\n    <subfield code=\"i\">Stage 6</subfield>\n  </datafield>\n  <datafield tag=\"410\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"0\">34235397</subfield>\n    <subfield code=\"t\">Longman structural readers. Stage 6</subfield>\n    <subfield code=\"v\">11</subfield>\n  </datafield>\n  <datafield tag=\"686\" ind1=\" \" ind2=\" \">\n    <subfield code=\"a\">83</subfield>\n    <subfield code=\"2\">Cadre de classement de la Bibliographie nationale fran�caise</subfield>\n  </datafield>\n  <datafield tag=\"700\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">11908111</subfield>\n    <subfield code=\"a\">Huxley</subfield>\n    <subfield code=\"b\">Aldous</subfield>\n    <subfield code=\"f\">1894-1963</subfield>\n    <subfield code=\"4\">070</subfield>\n  </datafield>\n  <datafield tag=\"702\" ind1=\" \" ind2=\" \">\n    <subfield code=\"3\">12594062</subfield>\n    <subfield code=\"a\">Burton</subfield>\n    <subfield code=\"b\">Samuel Holroyd</subfield>\n    <subfield code=\"4\">340</subfield>\n  </datafield>\n  <datafield tag=\"801\" ind1=\" \" ind2=\"0\">\n    <subfield code=\"a\">FR</subfield>\n    <subfield code=\"b\">FR-751131015</subfield>\n    <subfield code=\"c\">19751209</subfield>\n    <subfield code=\"g\">AFNOR</subfield>\n    <subfield code=\"2\">intermrc</subfield>\n  </datafield>\n</record>\n');
/*!40000 ALTER TABLE `biblioitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_attribute_types`
--

DROP TABLE IF EXISTS `borrower_attribute_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_attribute_types` (
  `code` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `repeatable` tinyint(1) NOT NULL DEFAULT '0',
  `unique_id` tinyint(1) NOT NULL DEFAULT '0',
  `opac_display` tinyint(1) NOT NULL DEFAULT '0',
  `password_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `staff_searchable` tinyint(1) NOT NULL DEFAULT '0',
  `authorised_value_category` varchar(10) DEFAULT NULL,
  `display_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `category_code` varchar(10) DEFAULT NULL,
  `class` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`),
  KEY `auth_val_cat_idx` (`authorised_value_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_attribute_types`
--

LOCK TABLES `borrower_attribute_types` WRITE;
/*!40000 ALTER TABLE `borrower_attribute_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_attribute_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_attributes`
--

DROP TABLE IF EXISTS `borrower_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_attributes` (
  `borrowernumber` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `attribute` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  KEY `borrowernumber` (`borrowernumber`),
  KEY `code_attribute` (`code`,`attribute`),
  CONSTRAINT `borrower_attributes_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_attributes_ibfk_2` FOREIGN KEY (`code`) REFERENCES `borrower_attribute_types` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_attributes`
--

LOCK TABLES `borrower_attributes` WRITE;
/*!40000 ALTER TABLE `borrower_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_message_preferences`
--

DROP TABLE IF EXISTS `borrower_message_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_message_preferences` (
  `borrower_message_preference_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `categorycode` varchar(10) DEFAULT NULL,
  `message_attribute_id` int(11) DEFAULT '0',
  `days_in_advance` int(11) DEFAULT '0',
  `wants_digest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrower_message_preference_id`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `categorycode` (`categorycode`),
  KEY `message_attribute_id` (`message_attribute_id`),
  CONSTRAINT `borrower_message_preferences_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_preferences_ibfk_2` FOREIGN KEY (`message_attribute_id`) REFERENCES `message_attributes` (`message_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_preferences_ibfk_3` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_message_preferences`
--

LOCK TABLES `borrower_message_preferences` WRITE;
/*!40000 ALTER TABLE `borrower_message_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_message_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_message_transport_preferences`
--

DROP TABLE IF EXISTS `borrower_message_transport_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower_message_transport_preferences` (
  `borrower_message_preference_id` int(11) NOT NULL DEFAULT '0',
  `message_transport_type` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrower_message_preference_id`,`message_transport_type`),
  KEY `message_transport_type` (`message_transport_type`),
  CONSTRAINT `borrower_message_transport_preferences_ibfk_1` FOREIGN KEY (`borrower_message_preference_id`) REFERENCES `borrower_message_preferences` (`borrower_message_preference_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrower_message_transport_preferences_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_message_transport_preferences`
--

LOCK TABLES `borrower_message_transport_preferences` WRITE;
/*!40000 ALTER TABLE `borrower_message_transport_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_message_transport_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowers`
--

DROP TABLE IF EXISTS `borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowers` (
  `borrowernumber` int(11) NOT NULL AUTO_INCREMENT,
  `cardnumber` varchar(16) DEFAULT NULL,
  `surname` mediumtext NOT NULL,
  `firstname` text,
  `title` mediumtext,
  `othernames` mediumtext,
  `initials` text,
  `streetnumber` varchar(10) DEFAULT NULL,
  `streettype` varchar(50) DEFAULT NULL,
  `address` mediumtext NOT NULL,
  `address2` text,
  `city` mediumtext NOT NULL,
  `state` text,
  `zipcode` varchar(25) DEFAULT NULL,
  `country` text,
  `email` mediumtext,
  `phone` text,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` mediumtext,
  `emailpro` text,
  `phonepro` text,
  `B_streetnumber` varchar(10) DEFAULT NULL,
  `B_streettype` varchar(50) DEFAULT NULL,
  `B_address` varchar(100) DEFAULT NULL,
  `B_address2` text,
  `B_city` mediumtext,
  `B_state` text,
  `B_zipcode` varchar(25) DEFAULT NULL,
  `B_country` text,
  `B_email` text,
  `B_phone` mediumtext,
  `dateofbirth` date DEFAULT NULL,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `dateenrolled` date DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL,
  `gonenoaddress` tinyint(1) DEFAULT NULL,
  `lost` tinyint(1) DEFAULT NULL,
  `debarred` date DEFAULT NULL,
  `debarredcomment` varchar(255) DEFAULT NULL,
  `contactname` mediumtext,
  `contactfirstname` text,
  `contacttitle` text,
  `guarantorid` int(11) DEFAULT NULL,
  `borrowernotes` mediumtext,
  `relationship` varchar(100) DEFAULT NULL,
  `ethnicity` varchar(50) DEFAULT NULL,
  `ethnotes` varchar(255) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `userid` varchar(75) DEFAULT NULL,
  `opacnote` mediumtext,
  `contactnote` varchar(255) DEFAULT NULL,
  `sort1` varchar(80) DEFAULT NULL,
  `sort2` varchar(80) DEFAULT NULL,
  `altcontactfirstname` varchar(255) DEFAULT NULL,
  `altcontactsurname` varchar(255) DEFAULT NULL,
  `altcontactaddress1` varchar(255) DEFAULT NULL,
  `altcontactaddress2` varchar(255) DEFAULT NULL,
  `altcontactaddress3` varchar(255) DEFAULT NULL,
  `altcontactstate` text,
  `altcontactzipcode` varchar(50) DEFAULT NULL,
  `altcontactcountry` text,
  `altcontactphone` varchar(50) DEFAULT NULL,
  `smsalertnumber` varchar(50) DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`borrowernumber`),
  UNIQUE KEY `cardnumber` (`cardnumber`),
  KEY `categorycode` (`categorycode`),
  KEY `branchcode` (`branchcode`),
  KEY `userid` (`userid`),
  KEY `guarantorid` (`guarantorid`),
  CONSTRAINT `borrowers_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`),
  CONSTRAINT `borrowers_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowers`
--

LOCK TABLES `borrowers` WRITE;
/*!40000 ALTER TABLE `borrowers` DISABLE KEYS */;
INSERT INTO `borrowers` VALUES (1,'1','Admin','Koha','','','','',NULL,'','','','','','','','','','','','',NULL,NULL,'','','','','','','','',NULL,'MPL','S','2013-04-30','2099-12-31',0,0,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL,'','ISMvKXpXpadDiUoOSoAfww',1,'admin','','','','','','','','','','','','','',NULL,1),(2,'23529000152273','Welch','Marcus',NULL,NULL,'',NULL,NULL,'5601 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MPL','ST','1985-10-24','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'M','42b29d0771f3b7ef',NULL,'23529000152273',NULL,NULL,'0.43609457503641','0.38613959717205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'23529000445172','Daniels','Tanya',NULL,NULL,'',NULL,NULL,'2035 Library Rd.',NULL,'Portland, ME',NULL,'44236',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1966-10-14','MPL','PT','1990-08-22','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000445172',NULL,NULL,'0.62241429148467','0.95365269664084',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,'23529000105040','Dillon','Eva',NULL,NULL,'',NULL,NULL,'8916 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1952-04-03','MPL','PT','1987-07-01','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000105040',NULL,NULL,'0.90102063948384','0.64414513823031',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(5,'23529001000463','Acosta','Edna',NULL,NULL,'',NULL,NULL,'7896 Library Rd.',NULL,'Portland, OR',NULL,'44240',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-04-24','MPL','PT','1990-11-23','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529001000463',NULL,NULL,'0.72642678648832','0.6644830635418',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(6,'23529000591678','Glass','Virgil',NULL,NULL,'',NULL,NULL,'6250 Library Rd.',NULL,'Santa Cruz, CA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1974-06-19','FPL','T','1985-02-13','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,102,NULL,NULL,NULL,NULL,'M','42b29d0771f3b7ef',NULL,'23529000591678',NULL,NULL,'0.1431349889777','0.72222578499673',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,'23529000080862','Middleton','Bobbie',NULL,NULL,'',NULL,NULL,'4619 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1953-07-24','FPL','J','1991-03-13','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,104,NULL,NULL,NULL,NULL,'M','42b29d0771f3b7ef',NULL,'23529000080862',NULL,NULL,'0.18172398878422','0.74194261966454',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(8,'23529000358268','Rivera','Olga',NULL,NULL,'',NULL,NULL,'6058 Library Rd.',NULL,'Mayfield Heights, OH',NULL,'21234',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1979-12-22','CPL','T','1986-04-17','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,112,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000358268',NULL,NULL,'0.16454116270369','0.59687798525847',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(9,'23529000429697','Waters','Annie',NULL,NULL,'',NULL,NULL,'5444 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1932-10-27','FPL','ST','1984-05-07','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000429697',NULL,NULL,'0.49076646891494','0.66319841953292',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10,'23529000068917','Herring','Frances',NULL,NULL,'',NULL,NULL,'4024 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1953-02-13','FPL','PT','1993-03-12','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000068917',NULL,NULL,'0.84369272165344','0.22886838040209',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(11,'23529000065863','Hawkins','Sam',NULL,NULL,'',NULL,NULL,'665 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1924-03-26','FPL','PT','1984-05-09','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000065863',NULL,NULL,'0.61326376778378','0.37971372844625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(12,'23529000878885','Mcknight','Marie',NULL,NULL,'',NULL,NULL,'4241 Library Rd.',NULL,'Centerville, CA',NULL,'44262',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FPL','YA','1990-08-06','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000878885',NULL,NULL,'0.058777369613552','0.15474569346266',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(13,'23529000132291','Edwards','Roy',NULL,NULL,'',NULL,NULL,'9929 Library Rd.',NULL,'Portland, OR',NULL,'44240',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1928-09-09','MPL','PT','1992-03-10','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000132291',NULL,NULL,'0.59739638920631','0.5227448963772',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(14,'23529000035726','Mccullough','Phillip',NULL,NULL,'',NULL,NULL,'410 Library Rd.',NULL,'Portland, ME',NULL,'44236',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1943-11-23','FPL','PT','1986-01-23','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529000035726',NULL,NULL,'0.82153534500071','0.53944206660561',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(15,'23529001203323','Peterson','Gordon',NULL,NULL,'',NULL,NULL,'6285 Library Rd.',NULL,'Springfield, MA',NULL,'44224',NULL,NULL,'(212) 555-1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1963-10-01','FPL','J','1984-09-11','2020-12-31',NULL,NULL,NULL,NULL,'',NULL,NULL,131,NULL,NULL,NULL,NULL,'F','42b29d0771f3b7ef',NULL,'23529001203323',NULL,NULL,'0.23260432875958','0.54469547471469',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_borrower_circ_rules`
--

DROP TABLE IF EXISTS `branch_borrower_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_borrower_circ_rules` (
  `branchcode` varchar(10) NOT NULL,
  `categorycode` varchar(10) NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  PRIMARY KEY (`categorycode`,`branchcode`),
  KEY `branch_borrower_circ_rules_ibfk_2` (`branchcode`),
  CONSTRAINT `branch_borrower_circ_rules_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_borrower_circ_rules_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_borrower_circ_rules`
--

LOCK TABLES `branch_borrower_circ_rules` WRITE;
/*!40000 ALTER TABLE `branch_borrower_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_borrower_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_item_rules`
--

DROP TABLE IF EXISTS `branch_item_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_item_rules` (
  `branchcode` varchar(10) NOT NULL,
  `itemtype` varchar(10) NOT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `returnbranch` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`itemtype`,`branchcode`),
  KEY `branch_item_rules_ibfk_2` (`branchcode`),
  CONSTRAINT `branch_item_rules_ibfk_1` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_item_rules_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_item_rules`
--

LOCK TABLES `branch_item_rules` WRITE;
/*!40000 ALTER TABLE `branch_item_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_item_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transfer_limits`
--

DROP TABLE IF EXISTS `branch_transfer_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transfer_limits` (
  `limitId` int(8) NOT NULL AUTO_INCREMENT,
  `toBranch` varchar(10) NOT NULL,
  `fromBranch` varchar(10) NOT NULL,
  `itemtype` varchar(10) DEFAULT NULL,
  `ccode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`limitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transfer_limits`
--

LOCK TABLES `branch_transfer_limits` WRITE;
/*!40000 ALTER TABLE `branch_transfer_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transfer_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchcategories`
--

DROP TABLE IF EXISTS `branchcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchcategories` (
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `categoryname` varchar(32) DEFAULT NULL,
  `codedescription` mediumtext,
  `categorytype` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchcategories`
--

LOCK TABLES `branchcategories` WRITE;
/*!40000 ALTER TABLE `branchcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `branchname` mediumtext NOT NULL,
  `branchaddress1` mediumtext,
  `branchaddress2` mediumtext,
  `branchaddress3` mediumtext,
  `branchzip` varchar(25) DEFAULT NULL,
  `branchcity` mediumtext,
  `branchstate` mediumtext,
  `branchcountry` text,
  `branchphone` mediumtext,
  `branchfax` mediumtext,
  `branchemail` mediumtext,
  `branchurl` mediumtext,
  `issuing` tinyint(4) DEFAULT NULL,
  `branchip` varchar(15) DEFAULT NULL,
  `branchprinter` varchar(100) DEFAULT NULL,
  `branchnotes` mediumtext,
  `opac_info` text,
  UNIQUE KEY `branchcode` (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('CPL','Centerville','Jefferson Summit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('FPL','Fairview','Hickory Squere',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('MPL','Midway','372 Forest Street',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchrelations`
--

DROP TABLE IF EXISTS `branchrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchrelations` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`categorycode`),
  KEY `branchcode` (`branchcode`),
  KEY `categorycode` (`categorycode`),
  CONSTRAINT `branchrelations_ibfk_1` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchrelations_ibfk_2` FOREIGN KEY (`categorycode`) REFERENCES `branchcategories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchrelations`
--

LOCK TABLES `branchrelations` WRITE;
/*!40000 ALTER TABLE `branchrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchtransfers`
--

DROP TABLE IF EXISTS `branchtransfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchtransfers` (
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `datesent` datetime DEFAULT NULL,
  `frombranch` varchar(10) NOT NULL DEFAULT '',
  `datearrived` datetime DEFAULT NULL,
  `tobranch` varchar(10) NOT NULL DEFAULT '',
  `comments` mediumtext,
  KEY `frombranch` (`frombranch`),
  KEY `tobranch` (`tobranch`),
  KEY `itemnumber` (`itemnumber`),
  CONSTRAINT `branchtransfers_ibfk_1` FOREIGN KEY (`frombranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchtransfers_ibfk_2` FOREIGN KEY (`tobranch`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branchtransfers_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchtransfers`
--

LOCK TABLES `branchtransfers` WRITE;
/*!40000 ALTER TABLE `branchtransfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchtransfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser`
--

DROP TABLE IF EXISTS `browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser` (
  `level` int(11) NOT NULL,
  `classification` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `number` bigint(20) NOT NULL,
  `endnode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser`
--

LOCK TABLES `browser` WRITE;
/*!40000 ALTER TABLE `browser` DISABLE KEYS */;
/*!40000 ALTER TABLE `browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `description` mediumtext,
  `enrolmentperiod` smallint(6) DEFAULT NULL,
  `enrolmentperioddate` date DEFAULT NULL,
  `upperagelimit` smallint(6) DEFAULT NULL,
  `dateofbirthrequired` tinyint(1) DEFAULT NULL,
  `finetype` varchar(30) DEFAULT NULL,
  `bulk` tinyint(1) DEFAULT NULL,
  `enrolmentfee` decimal(28,6) DEFAULT NULL,
  `overduenoticerequired` tinyint(1) DEFAULT NULL,
  `issuelimit` smallint(6) DEFAULT NULL,
  `reservefee` decimal(28,6) DEFAULT NULL,
  `hidelostitems` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`categorycode`),
  UNIQUE KEY `categorycode` (`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('B','Board',99,NULL,17,5,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'P'),('HB','Home Bound',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'A'),('IL','Inter-Library Loan',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'I'),('J','Juvenile',99,NULL,17,5,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'C'),('K','Kid',99,NULL,17,5,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'C'),('L','Library',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'I'),('PT','Patron',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'A'),('S','Staff',99,NULL,999,18,NULL,NULL,'0.000000',0,NULL,'0.000000',0,'S'),('SC','School',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'I'),('ST','Student',99,NULL,999,18,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'A'),('T','Teacher',99,NULL,999,18,NULL,NULL,'0.000000',0,NULL,'0.000000',0,'P'),('YA','Young Adult',99,NULL,17,5,NULL,NULL,'0.000000',1,NULL,'0.000000',0,'C');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL DEFAULT '',
  `city_state` varchar(100) DEFAULT NULL,
  `city_country` varchar(100) DEFAULT NULL,
  `city_zipcode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sort_rules`
--

DROP TABLE IF EXISTS `class_sort_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_sort_rules` (
  `class_sort_rule` varchar(10) NOT NULL DEFAULT '',
  `description` mediumtext,
  `sort_routine` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`class_sort_rule`),
  UNIQUE KEY `class_sort_rule_idx` (`class_sort_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sort_rules`
--

LOCK TABLES `class_sort_rules` WRITE;
/*!40000 ALTER TABLE `class_sort_rules` DISABLE KEYS */;
INSERT INTO `class_sort_rules` VALUES ('dewey','Default filing rules for DDC','Dewey'),('generic','Generic call number filing rules','Generic'),('lcc','Default filing rules for LCC','LCC');
/*!40000 ALTER TABLE `class_sort_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sources`
--

DROP TABLE IF EXISTS `class_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_sources` (
  `cn_source` varchar(10) NOT NULL DEFAULT '',
  `description` mediumtext,
  `used` tinyint(4) NOT NULL DEFAULT '0',
  `class_sort_rule` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`cn_source`),
  UNIQUE KEY `cn_source_idx` (`cn_source`),
  KEY `used_idx` (`used`),
  KEY `class_source_ibfk_1` (`class_sort_rule`),
  CONSTRAINT `class_source_ibfk_1` FOREIGN KEY (`class_sort_rule`) REFERENCES `class_sort_rules` (`class_sort_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sources`
--

LOCK TABLES `class_sources` WRITE;
/*!40000 ALTER TABLE `class_sources` DISABLE KEYS */;
INSERT INTO `class_sources` VALUES ('anscr','ANSCR (Sound Recordings)',0,'generic'),('ddc','Dewey Decimal Classification',1,'dewey'),('lcc','Library of Congress Classification',1,'lcc'),('sudocs','SuDoc Classification (U.S. GPO)',0,'generic'),('udc','Universal Decimal Classification',0,'generic'),('z','Other/Generic Classification Scheme',0,'generic');
/*!40000 ALTER TABLE `class_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `colId` int(11) NOT NULL AUTO_INCREMENT,
  `colTitle` varchar(100) NOT NULL DEFAULT '',
  `colDesc` text NOT NULL,
  `colBranchcode` varchar(4) DEFAULT NULL COMMENT 'branchcode for branch where item should be held.',
  PRIMARY KEY (`colId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_tracking`
--

DROP TABLE IF EXISTS `collections_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_tracking` (
  `ctId` int(11) NOT NULL AUTO_INCREMENT,
  `colId` int(11) NOT NULL DEFAULT '0' COMMENT 'collections.colId',
  `itemnumber` int(11) NOT NULL DEFAULT '0' COMMENT 'items.itemnumber',
  PRIMARY KEY (`ctId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_tracking`
--

LOCK TABLES `collections_tracking` WRITE;
/*!40000 ALTER TABLE `collections_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_batches`
--

DROP TABLE IF EXISTS `creator_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_batches` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) NOT NULL DEFAULT '1',
  `item_number` int(11) DEFAULT NULL,
  `borrower_number` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_code` varchar(10) NOT NULL DEFAULT 'NB',
  `creator` char(15) NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`label_id`),
  KEY `branch_fk_constraint` (`branch_code`),
  KEY `item_fk_constraint` (`item_number`),
  KEY `borrower_fk_constraint` (`borrower_number`),
  CONSTRAINT `creator_batches_ibfk_1` FOREIGN KEY (`borrower_number`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `creator_batches_ibfk_2` FOREIGN KEY (`branch_code`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE,
  CONSTRAINT `creator_batches_ibfk_3` FOREIGN KEY (`item_number`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_batches`
--

LOCK TABLES `creator_batches` WRITE;
/*!40000 ALTER TABLE `creator_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_images`
--

DROP TABLE IF EXISTS `creator_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_images` (
  `image_id` int(4) NOT NULL AUTO_INCREMENT,
  `imagefile` mediumblob,
  `image_name` char(20) NOT NULL DEFAULT 'DEFAULT',
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_name_index` (`image_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_images`
--

LOCK TABLES `creator_images` WRITE;
/*!40000 ALTER TABLE `creator_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_layouts`
--

DROP TABLE IF EXISTS `creator_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_layouts` (
  `layout_id` int(4) NOT NULL AUTO_INCREMENT,
  `barcode_type` char(100) NOT NULL DEFAULT 'CODE39',
  `start_label` int(2) NOT NULL DEFAULT '1',
  `printing_type` char(32) NOT NULL DEFAULT 'BAR',
  `layout_name` char(20) NOT NULL DEFAULT 'DEFAULT',
  `guidebox` int(1) DEFAULT '0',
  `font` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'TR',
  `font_size` int(4) NOT NULL DEFAULT '10',
  `units` char(20) NOT NULL DEFAULT 'POINT',
  `callnum_split` int(1) DEFAULT '0',
  `text_justify` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `format_string` varchar(210) NOT NULL DEFAULT 'barcode',
  `layout_xml` text NOT NULL,
  `creator` char(15) NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_layouts`
--

LOCK TABLES `creator_layouts` WRITE;
/*!40000 ALTER TABLE `creator_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_templates`
--

DROP TABLE IF EXISTS `creator_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creator_templates` (
  `template_id` int(4) NOT NULL AUTO_INCREMENT,
  `profile_id` int(4) DEFAULT NULL,
  `template_code` char(100) NOT NULL DEFAULT 'DEFAULT TEMPLATE',
  `template_desc` char(100) NOT NULL DEFAULT 'Default description',
  `page_width` float NOT NULL DEFAULT '0',
  `page_height` float NOT NULL DEFAULT '0',
  `label_width` float NOT NULL DEFAULT '0',
  `label_height` float NOT NULL DEFAULT '0',
  `top_text_margin` float NOT NULL DEFAULT '0',
  `left_text_margin` float NOT NULL DEFAULT '0',
  `top_margin` float NOT NULL DEFAULT '0',
  `left_margin` float NOT NULL DEFAULT '0',
  `cols` int(2) NOT NULL DEFAULT '0',
  `rows` int(2) NOT NULL DEFAULT '0',
  `col_gap` float NOT NULL DEFAULT '0',
  `row_gap` float NOT NULL DEFAULT '0',
  `units` char(20) NOT NULL DEFAULT 'POINT',
  `creator` char(15) NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`template_id`),
  KEY `template_profile_fk_constraint` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_templates`
--

LOCK TABLES `creator_templates` WRITE;
/*!40000 ALTER TABLE `creator_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `creator_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currency` varchar(10) NOT NULL DEFAULT '',
  `symbol` varchar(5) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rate` float(15,5) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('CAD','$','2013-04-30 08:11:15',1.02207,NULL),('EUR','â‚¬','2013-04-30 08:11:15',0.87400,NULL),('GBP','Â£','2013-04-30 08:11:15',1.99290,NULL),('USD','$','2013-04-30 08:11:15',1.00000,NULL);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_borrower_circ_rules`
--

DROP TABLE IF EXISTS `default_borrower_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_borrower_circ_rules` (
  `categorycode` varchar(10) NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  PRIMARY KEY (`categorycode`),
  CONSTRAINT `borrower_borrower_circ_rules_ibfk_1` FOREIGN KEY (`categorycode`) REFERENCES `categories` (`categorycode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_borrower_circ_rules`
--

LOCK TABLES `default_borrower_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_borrower_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_borrower_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_branch_circ_rules`
--

DROP TABLE IF EXISTS `default_branch_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_branch_circ_rules` (
  `branchcode` varchar(10) NOT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `returnbranch` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branchcode`),
  CONSTRAINT `default_branch_circ_rules_ibfk_1` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_branch_circ_rules`
--

LOCK TABLES `default_branch_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_branch_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_branch_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_branch_item_rules`
--

DROP TABLE IF EXISTS `default_branch_item_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_branch_item_rules` (
  `itemtype` varchar(10) NOT NULL,
  `holdallowed` tinyint(1) DEFAULT NULL,
  `returnbranch` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`itemtype`),
  CONSTRAINT `default_branch_item_rules_ibfk_1` FOREIGN KEY (`itemtype`) REFERENCES `itemtypes` (`itemtype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_branch_item_rules`
--

LOCK TABLES `default_branch_item_rules` WRITE;
/*!40000 ALTER TABLE `default_branch_item_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_branch_item_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_circ_rules`
--

DROP TABLE IF EXISTS `default_circ_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_circ_rules` (
  `singleton` enum('singleton') NOT NULL DEFAULT 'singleton',
  `maxissueqty` int(4) DEFAULT NULL,
  `holdallowed` int(1) DEFAULT NULL,
  `returnbranch` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`singleton`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_circ_rules`
--

LOCK TABLES `default_circ_rules` WRITE;
/*!40000 ALTER TABLE `default_circ_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_circ_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedbiblio`
--

DROP TABLE IF EXISTS `deletedbiblio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedbiblio` (
  `biblionumber` int(11) NOT NULL AUTO_INCREMENT,
  `frameworkcode` varchar(4) NOT NULL DEFAULT '',
  `author` mediumtext,
  `title` mediumtext,
  `unititle` mediumtext,
  `notes` mediumtext,
  `serial` tinyint(1) DEFAULT NULL,
  `seriestitle` mediumtext,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datecreated` date NOT NULL,
  `abstract` mediumtext,
  PRIMARY KEY (`biblionumber`),
  KEY `blbnoidx` (`biblionumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedbiblio`
--

LOCK TABLES `deletedbiblio` WRITE;
/*!40000 ALTER TABLE `deletedbiblio` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedbiblio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedbiblioitems`
--

DROP TABLE IF EXISTS `deletedbiblioitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedbiblioitems` (
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `volume` mediumtext,
  `number` mediumtext,
  `itemtype` varchar(10) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `issn` varchar(9) DEFAULT NULL,
  `publicationyear` text,
  `publishercode` varchar(255) DEFAULT NULL,
  `volumedate` date DEFAULT NULL,
  `volumedesc` text,
  `collectiontitle` mediumtext,
  `collectionissn` text,
  `collectionvolume` mediumtext,
  `editionstatement` text,
  `editionresponsibility` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `illus` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `notes` mediumtext,
  `size` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `lccn` varchar(25) DEFAULT NULL,
  `marc` longblob,
  `url` varchar(255) DEFAULT NULL,
  `cn_source` varchar(10) DEFAULT NULL,
  `cn_class` varchar(30) DEFAULT NULL,
  `cn_item` varchar(10) DEFAULT NULL,
  `cn_suffix` varchar(10) DEFAULT NULL,
  `cn_sort` varchar(30) DEFAULT NULL,
  `totalissues` int(10) DEFAULT NULL,
  `marcxml` longtext NOT NULL,
  PRIMARY KEY (`biblioitemnumber`),
  KEY `bibinoidx` (`biblioitemnumber`),
  KEY `bibnoidx` (`biblionumber`),
  KEY `isbn` (`isbn`),
  KEY `publishercode` (`publishercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedbiblioitems`
--

LOCK TABLES `deletedbiblioitems` WRITE;
/*!40000 ALTER TABLE `deletedbiblioitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedbiblioitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletedborrowers`
--

DROP TABLE IF EXISTS `deletedborrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletedborrowers` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `cardnumber` varchar(16) DEFAULT NULL,
  `surname` mediumtext NOT NULL,
  `firstname` text,
  `title` mediumtext,
  `othernames` mediumtext,
  `initials` text,
  `streetnumber` varchar(10) DEFAULT NULL,
  `streettype` varchar(50) DEFAULT NULL,
  `address` mediumtext NOT NULL,
  `address2` text,
  `city` mediumtext NOT NULL,
  `state` text,
  `zipcode` varchar(25) DEFAULT NULL,
  `country` text,
  `email` mediumtext,
  `phone` text,
  `mobile` varchar(50) DEFAULT NULL,
  `fax` mediumtext,
  `emailpro` text,
  `phonepro` text,
  `B_streetnumber` varchar(10) DEFAULT NULL,
  `B_streettype` varchar(50) DEFAULT NULL,
  `B_address` varchar(100) DEFAULT NULL,
  `B_address2` text,
  `B_city` mediumtext,
  `B_state` text,
  `B_zipcode` varchar(25) DEFAULT NULL,
  `B_country` text,
  `B_email` text,
  `B_phone` mediumtext,
  `dateofbirth` date DEFAULT NULL,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `dateenrolled` date DEFAULT NULL,
  `dateexpiry` date DEFAULT NULL,
  `gonenoaddress` tinyint(1) DEFAULT NULL,
  `lost` tinyint(1) DEFAULT NULL,
  `debarred` date DEFAULT NULL,
  `debarredcomment` varchar(255) DEFAULT NULL,
  `contactname` mediumtext,
  `contactfirstname` text,
  `contacttitle` text,
  `guarantorid` int(11) DEFAULT NULL,
  `borrowernotes` mediumtext,
  `relationship` varchar(100) DEFAULT NULL,
  `ethnicity` varchar(50) DEFAULT NULL,
  `ethnotes` varchar(255) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `opacnote` mediumtext,
  `contactnote` varchar(255) DEFAULT NULL,
  `sort1` varchar(80) DEFAULT NULL,
  `sort2` varchar(80) DEFAULT NULL,
  `altcontactfirstname` varchar(255) DEFAULT NULL,
  `altcontactsurname` varchar(255) DEFAULT NULL,
  `altcontactaddress1` varchar(255) DEFAULT NULL,
  `altcontactaddress2` varchar(255) DEFAULT NULL,
  `altcontactaddress3` varchar(255) DEFAULT NULL,
  `altcontactstate` text,
  `altcontactzipcode` varchar(50) DEFAULT NULL,
  `altcontactcountry` text,
  `altcontactphone` varchar(50) DEFAULT NULL,
  `smsalertnumber` varchar(50) DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  KEY `borrowernumber` (`borrowernumber`),
  KEY `cardnumber` (`cardnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletedborrowers`
--

LOCK TABLES `deletedborrowers` WRITE;
/*!40000 ALTER TABLE `deletedborrowers` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletedborrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleteditems`
--

DROP TABLE IF EXISTS `deleteditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleteditems` (
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `barcode` varchar(20) DEFAULT NULL,
  `dateaccessioned` date DEFAULT NULL,
  `booksellerid` mediumtext,
  `homebranch` varchar(10) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `replacementprice` decimal(8,2) DEFAULT NULL,
  `replacementpricedate` date DEFAULT NULL,
  `datelastborrowed` date DEFAULT NULL,
  `datelastseen` date DEFAULT NULL,
  `stack` tinyint(1) DEFAULT NULL,
  `notforloan` tinyint(1) NOT NULL DEFAULT '0',
  `damaged` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost` tinyint(1) NOT NULL DEFAULT '0',
  `wthdrawn` tinyint(1) NOT NULL DEFAULT '0',
  `itemcallnumber` varchar(255) DEFAULT NULL,
  `issues` smallint(6) DEFAULT NULL,
  `renewals` smallint(6) DEFAULT NULL,
  `reserves` smallint(6) DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT NULL,
  `itemnotes` mediumtext,
  `holdingbranch` varchar(10) DEFAULT NULL,
  `paidfor` mediumtext,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(80) DEFAULT NULL,
  `permanent_location` varchar(80) DEFAULT NULL,
  `onloan` date DEFAULT NULL,
  `cn_source` varchar(10) DEFAULT NULL,
  `cn_sort` varchar(30) DEFAULT NULL,
  `ccode` varchar(10) DEFAULT NULL,
  `materials` varchar(10) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `itype` varchar(10) DEFAULT NULL,
  `more_subfields_xml` longtext,
  `enumchron` text,
  `copynumber` varchar(32) DEFAULT NULL,
  `stocknumber` varchar(32) DEFAULT NULL,
  `marc` longblob,
  PRIMARY KEY (`itemnumber`),
  KEY `delitembarcodeidx` (`barcode`),
  KEY `delitemstocknumberidx` (`stocknumber`),
  KEY `delitembinoidx` (`biblioitemnumber`),
  KEY `delitembibnoidx` (`biblionumber`),
  KEY `delhomebranch` (`homebranch`),
  KEY `delholdingbranch` (`holdingbranch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleteditems`
--

LOCK TABLES `deleteditems` WRITE;
/*!40000 ALTER TABLE `deleteditems` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleteditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethnicity`
--

DROP TABLE IF EXISTS `ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnicity` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnicity`
--

LOCK TABLES `ethnicity` WRITE;
/*!40000 ALTER TABLE `ethnicity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_format`
--

DROP TABLE IF EXISTS `export_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_format` (
  `export_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `marcfields` mediumtext NOT NULL,
  `csv_separator` varchar(2) NOT NULL,
  `field_separator` varchar(2) NOT NULL,
  `subfield_separator` varchar(2) NOT NULL,
  `encoding` varchar(255) NOT NULL,
  PRIMARY KEY (`export_format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used for CSV export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_format`
--

LOCK TABLES `export_format` WRITE;
/*!40000 ALTER TABLE `export_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldmapping`
--

DROP TABLE IF EXISTS `fieldmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `frameworkcode` char(4) NOT NULL DEFAULT '',
  `fieldcode` char(3) NOT NULL,
  `subfieldcode` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldmapping`
--

LOCK TABLES `fieldmapping` WRITE;
/*!40000 ALTER TABLE `fieldmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hold_fill_targets`
--

DROP TABLE IF EXISTS `hold_fill_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hold_fill_targets` (
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `itemnumber` int(11) NOT NULL,
  `source_branchcode` varchar(10) DEFAULT NULL,
  `item_level_request` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemnumber`),
  KEY `bib_branch` (`biblionumber`,`source_branchcode`),
  KEY `hold_fill_targets_ibfk_1` (`borrowernumber`),
  KEY `hold_fill_targets_ibfk_4` (`source_branchcode`),
  CONSTRAINT `hold_fill_targets_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hold_fill_targets_ibfk_4` FOREIGN KEY (`source_branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hold_fill_targets`
--

LOCK TABLES `hold_fill_targets` WRITE;
/*!40000 ALTER TABLE `hold_fill_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hold_fill_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_batches` (
  `import_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `matcher_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `num_biblios` int(11) NOT NULL DEFAULT '0',
  `num_items` int(11) NOT NULL DEFAULT '0',
  `upload_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `overlay_action` enum('replace','create_new','use_template','ignore') NOT NULL DEFAULT 'create_new',
  `nomatch_action` enum('create_new','ignore') NOT NULL DEFAULT 'create_new',
  `item_action` enum('always_add','add_only_for_matches','add_only_for_new','ignore') NOT NULL DEFAULT 'always_add',
  `import_status` enum('staging','staged','importing','imported','reverting','reverted','cleaned') NOT NULL DEFAULT 'staging',
  `batch_type` enum('batch','z3950','webservice') NOT NULL DEFAULT 'batch',
  `file_name` varchar(100) DEFAULT NULL,
  `comments` mediumtext,
  PRIMARY KEY (`import_batch_id`),
  KEY `branchcode` (`branchcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
INSERT INTO `import_batches` VALUES (1,NULL,NULL,NULL,117,0,'2013-04-30 08:30:41','create_new','create_new','always_add','staged','z3950','z3950.bnf.fr',NULL),(2,NULL,NULL,NULL,43,0,'2013-04-30 08:36:50','create_new','create_new','always_add','staged','z3950','lx2.loc.gov',NULL);
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_biblios`
--

DROP TABLE IF EXISTS `import_biblios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_biblios` (
  `import_record_id` int(11) NOT NULL,
  `matched_biblionumber` int(11) DEFAULT NULL,
  `control_number` varchar(25) DEFAULT NULL,
  `original_source` varchar(25) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `author` varchar(80) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `issn` varchar(9) DEFAULT NULL,
  `has_items` tinyint(1) NOT NULL DEFAULT '0',
  KEY `import_biblios_ibfk_1` (`import_record_id`),
  KEY `matched_biblionumber` (`matched_biblionumber`),
  KEY `title` (`title`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `import_biblios_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_biblios`
--

LOCK TABLES `import_biblios` WRITE;
/*!40000 ALTER TABLE `import_biblios` DISABLE KEYS */;
INSERT INTO `import_biblios` VALUES (1,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(2,NULL,NULL,NULL,'Harry Potter �a l\'�ecole des sorciers','J. K. Rowling',NULL,NULL,0),(3,NULL,NULL,NULL,'Harry Potter �a l\'�ecole des sorciers','J. K. Rowling','2070541274',NULL,0),(4,NULL,NULL,NULL,'Harry Potter et la chambre des secrets','J. K. Rowling','2070541290',NULL,0),(5,NULL,NULL,NULL,'Harry Potter et le prisonnier d\'Azkaban','J. K. Rowling','2070541304',NULL,0),(6,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(7,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(8,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(9,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(10,NULL,NULL,NULL,'Harry Potter','J. K. Rowling',NULL,NULL,0),(11,NULL,NULL,NULL,'Harry Potter','Fr�ed�erique Deviller','2842702867',NULL,0),(12,NULL,NULL,NULL,'Harry Potter et la coupe de feu','J. K. Rowling','2070543587',NULL,0),(13,NULL,NULL,NULL,'Harry Potter and the chamber of secrets','J. K. Rowling','0786222735',NULL,0),(14,NULL,NULL,NULL,'Harry Potter and the goblet of fire','J. K. Rowling','0786229276',NULL,0),(15,NULL,NULL,NULL,'Harry Potter and the prisoner of Azkaban','J. K. Rowling','0786222743',NULL,0),(16,NULL,NULL,NULL,'Harry Potter and the sorcerer\'s stone','J. K. Rowling','0786222727',NULL,0),(17,NULL,NULL,NULL,'Harry Potter and the philosopher\'s stone','J. K. Rowling','0747545723',NULL,0),(18,NULL,NULL,NULL,'Harry Potter et la coupe de feu','J. K. Rowling','207054351X',NULL,0),(19,NULL,NULL,NULL,'�L\'�enchantement \"Harry Potter\"','Beno�it Virole','2884490620',NULL,0),(20,NULL,NULL,NULL,'�Die �Zauberwelt der J. K. Rowling',NULL,'3860726161',NULL,0),(21,NULL,NULL,NULL,'�The �art of programming embedded systems','Jack G. Ganssle,...','0122748808',NULL,0),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(33,NULL,NULL,NULL,'�The �art of programming embedded systems','Jack G. Ganssle,...','0122748808',NULL,0),(34,NULL,NULL,NULL,'Tintin, par A. Gennevraye',NULL,NULL,NULL,0),(35,NULL,NULL,NULL,'Tintin Gorrino, por Jordic...',NULL,NULL,NULL,0),(36,NULL,NULL,NULL,'Tintin-Lutin, par Benjamin Rabier et Fred Isly',NULL,NULL,NULL,0),(37,NULL,NULL,NULL,'�Benjamin Rabier. �Tintin, petit poussin',NULL,NULL,NULL,0),(38,NULL,NULL,NULL,'Tintin la roulette',NULL,NULL,NULL,0),(39,NULL,NULL,NULL,'�Die �Tintinnodeen der Plankton-Expedition, von Prof. Dr. Karl Brandt...',NULL,NULL,NULL,0),(40,NULL,NULL,NULL,'Tintinabulum Sophorum oder Fernere gr�undliche Entdeckung der gotselingen gesegneten Br�uderschafft dess l�oblichen Ordens dess ',NULL,NULL,NULL,0),(41,NULL,NULL,NULL,'Tintin et Milou en Am�erique, par Herg�e',NULL,NULL,NULL,0),(42,NULL,NULL,NULL,'Tintin Gorin, par Jordic',NULL,NULL,NULL,0),(43,NULL,NULL,NULL,'Tintin Gorin, por Jordic',NULL,NULL,NULL,0),(44,NULL,NULL,NULL,'�I �Tintinnoidi delle acque di Monaco raccolti d\'all\'Eider nell\'anno 1913, di Leopoldo Rampi',NULL,NULL,NULL,0),(45,NULL,NULL,NULL,'�Jean Roquette. �Tintin et Milou chez les tor�eadors... [2�e �edition]',NULL,NULL,NULL,0),(46,NULL,NULL,NULL,'�Les �Tintinnides de la baie de Cascais, Portugal, par Estela de Sousa e Silva',NULL,NULL,NULL,0),(47,NULL,NULL,NULL,'Coeurs vaillants. [\"puis\" Journal des patronages]',NULL,NULL,NULL,0),(48,NULL,NULL,NULL,'Tintin. Le journal de tous les jeunes et de tous les amis des jeunes',NULL,NULL,NULL,0),(49,NULL,NULL,NULL,'Tintin et Milou. Message aux Coeurs Vaillants',NULL,NULL,NULL,0),(50,NULL,NULL,NULL,'�Les personnages des albums d\'Herg�e dans �Tintin et les oranges bleues . Texte d\'Andr�e Barret. Illustr�e avec les photos du fi',NULL,NULL,NULL,0),(51,NULL,NULL,NULL,'�D\'apr�es les personnages de Herg�e. �Tintin et le myst�ere de la \"Toison d\'or\" . Texte de Andr�e Barret et Remo Forlani...',NULL,NULL,NULL,0),(52,NULL,NULL,NULL,'�Herg�e. Les �Aventures de Tintin...',NULL,NULL,NULL,0),(53,NULL,NULL,NULL,'Tintinel et Galafron . La Naissance de Tintinel. Tintinel empereur. Tintinel en Chine. Tintinel d�etective. Tintinel dans la lun',NULL,NULL,NULL,0),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(57,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(58,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(61,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(66,NULL,NULL,NULL,'Black islanders','Douglas Oliver','0824814347',NULL,0),(67,NULL,NULL,NULL,'�The �black island','Herg�e','2203403365',NULL,0),(68,NULL,NULL,NULL,'�L\'��ile noire | �The �black island','St�ephane Bernasconi, r�eal.',NULL,NULL,0),(69,NULL,NULL,NULL,'Black island','Cuba, groupe voc. et instr. ',NULL,NULL,0),(70,NULL,NULL,NULL,'Black island','Cuba, groupe voc. et instr. ',NULL,NULL,0),(71,NULL,NULL,NULL,'Black Island | Agent sumo mix | Groove armada\'s desert island disc','Cuba, groupe voc. et instr. ',NULL,NULL,0),(72,NULL,NULL,NULL,'Black island | Agent Sumo mix | Groove armada\'s desert island disc','Cuba, groupe voc. et instr. ',NULL,NULL,0),(73,NULL,NULL,NULL,'�Les �aventures de Tintin','St�ephane Bernasconi, r�eal. ',NULL,NULL,0),(74,NULL,NULL,NULL,'�Les �aventures de Tintin','St�ephane Bernasconi, r�eal. ',NULL,NULL,0),(75,NULL,NULL,NULL,'�La �Perla de Catalu�na, historia de Nuestra Se�nora de Monserrate, escrita por el maestro fray Gregorio de Argaiz,...',NULL,NULL,NULL,0),(76,NULL,NULL,NULL,'Perles de ros�ee','par Louis Astouin',NULL,NULL,0),(77,NULL,NULL,NULL,'�La �perlo','[sign�e : Th�eodore Aubanel]',NULL,NULL,0),(78,NULL,NULL,NULL,'�Les �Perles de Genghiskhan, par Hippolyte Auger',NULL,NULL,NULL,0),(79,NULL,NULL,NULL,'Perla, tragicomedia in rima libera, di Simone Balsamino...',NULL,NULL,NULL,0),(80,NULL,NULL,NULL,'Com�edies','Th�eodore de Banville',NULL,NULL,0),(81,NULL,NULL,NULL,'Oeuvres de Th�eodore de Banville',NULL,NULL,NULL,0),(82,NULL,NULL,NULL,'�Une �Perle au front des Vosges,... par Mlle Adolphine Bonnet,...',NULL,NULL,NULL,0),(83,NULL,NULL,NULL,'�La �Perle d\'Antioche, tableau de l\'Orient au IVe si�ecle, par l\'abb�e A. Bayle,...',NULL,NULL,NULL,0),(84,NULL,NULL,NULL,'�Th. Bensa. La �Perle de Savoie, l�egende ni�coise',NULL,NULL,NULL,0),(85,NULL,NULL,NULL,'Perles de la litt�erature fran�caise, par miss Fr�ed�erica Berncastel,...',NULL,NULL,NULL,0),(86,NULL,NULL,NULL,'Domini Bonaventurae Perlustratio in arcana tertii Sententiarum','cura Johannis Beckenhaub',NULL,NULL,0),(87,NULL,NULL,NULL,'�La �perle des jours ou Les avantages du jour du sabbat pour les classes ouvri�eres','par la fille d\'un ouvrier, avec une notice sur la vie de l\'auteur',NULL,NULL,0),(88,NULL,NULL,NULL,'�La �perle des jours ou Les avantages du jour du sabbat pour les classes ouvri�eres','par la fille d\'un ouvrier, avec une notice sur la vie de l\'auteur',NULL,NULL,0),(89,NULL,NULL,NULL,'�La �Perle des jours, ou les Avantages du jour du sabbat pour les classes ouvri�eres...',NULL,NULL,NULL,0),(90,NULL,NULL,NULL,'�Les �Perles de la C�ote d\'azur, la Rivi�ere du cap Roux au torrent Saint-Louis : Monaco, Monte-Carlo, les routes du littoral et',NULL,NULL,NULL,0),(91,NULL,NULL,NULL,'�La �Perle de la vall�ee de la Marne. Ch�ateau de Boursault, par M. Armand Bourgeois',NULL,NULL,NULL,0),(92,NULL,NULL,NULL,'Perles et diamants pour �ecrins, par le R. P. Bourgue,...',NULL,NULL,NULL,0),(93,NULL,NULL,NULL,'�La �Perle d\'Orient, l�egende orientale (1802), par Henri Calland,...',NULL,NULL,NULL,0),(94,NULL,NULL,NULL,'�La �Perle d\'Orient, l�egende orientale (1802), par Henri Calland,...',NULL,NULL,NULL,0),(95,NULL,NULL,NULL,'Introduction �a Perl','Randal L. Schwartz','2841770052',NULL,0),(96,NULL,NULL,NULL,'Introduction �a Perl','Randal L. Schwartz & Tom Christiansen','2841770419',NULL,0),(97,NULL,NULL,NULL,'Learning Perl/Tk',NULL,'1565923146',NULL,0),(98,NULL,NULL,NULL,'Learning Perl','Randal L. Schwartz et Tom Christiansen','1565922840',NULL,0),(99,NULL,NULL,NULL,'Introduction �a Perl','Randal L. Schwartz & Tom Phoenix','284177144X',NULL,0),(100,NULL,NULL,NULL,'Introduction �a Perl','Randal L. Schwartz, Tom Phoenix et Brian D. Foy','284177404X',NULL,0),(101,NULL,NULL,NULL,'Koh�arente Sekund�arstrahlung der R�ontgenstrahlen, unters. an Cu, Ag, Cu-2O und Ag-2O',NULL,NULL,NULL,0),(102,NULL,NULL,NULL,'Kohabitationstermin und Geschlecht des Kindes. Nach den F�allen der Heidelberger Universit�ats-Frauenklinik im Kriegsjahr 1916/1',NULL,NULL,NULL,0),(103,NULL,NULL,NULL,'Koha. Botim shqiptar',NULL,NULL,NULL,0),(104,NULL,NULL,NULL,'Tempo. Edition fran�caise',NULL,NULL,NULL,0),(105,NULL,NULL,NULL,'Tempo. Edizione italiana',NULL,NULL,NULL,0),(106,NULL,NULL,NULL,'[Koha e jon�e]',NULL,NULL,'0399-6697',0),(107,NULL,NULL,NULL,'Koh�arenz und Struktur','Gudula Dinser','3412024759',NULL,0),(108,NULL,NULL,NULL,'Koh�an Gy�orgy, 1910-1966 eml�ekki�allit�asa','[a katal�ogust �ossze�allitotta B. Supka Magdolna]',NULL,NULL,0),(109,NULL,NULL,NULL,'Koh�an Gy�orgy eml�ekki�allit�asa','[a ki�allit�as rendez�oje B. Supka Magdolna]',NULL,NULL,0),(110,NULL,NULL,NULL,'Kohar�a','Kamale�svara','8170281768',NULL,0),(111,NULL,NULL,NULL,'Vepra','Ismail Kadare','221360407X',NULL,0),(112,NULL,NULL,NULL,'Vepra','Ismail Kadare','2213604096',NULL,0),(113,NULL,NULL,NULL,'Coherent optics','W. Lauterborn, T. Kurz, M. Wiesenfeldt','3540583726',NULL,0),(114,NULL,NULL,NULL,'Optique coh�erente','Werner Lauterborn, Thomas Kurz, Martin Wiesenfeldt','2225855226',NULL,0),(115,NULL,NULL,NULL,'35 JAAR KILIMA HAWAIIANS','Kilima Hawaiians',NULL,NULL,0),(116,NULL,NULL,NULL,'KALINA WALTZ | KOHALA MARCH','Palakiko et Paaluhi',NULL,NULL,0),(117,NULL,NULL,NULL,'Hongroise','Kell | Yakovleff',NULL,NULL,0),(118,NULL,NULL,NULL,'DANSES DE RUSSIE N � 1','STREHA (Georges) et ses balala�ikas',NULL,NULL,0),(119,NULL,NULL,NULL,'Kohala March | Honolulu March',NULL,NULL,NULL,0),(120,NULL,NULL,NULL,'Dernier caprice','Ozu Yasujiro, r�eal, sc�enario',NULL,NULL,0),(121,NULL,NULL,NULL,'�George Orwell. �1984 , traduit de l\'anglais par Am�elie Audiberti, roman',NULL,NULL,NULL,0),(122,NULL,NULL,NULL,'1984','par George Orwell',NULL,NULL,0),(123,NULL,NULL,NULL,'1984','George Orwell',NULL,NULL,0),(124,NULL,NULL,NULL,'�George Orwell. �1984 (\"Nineteen eighty-four\"), traduit de l\'anglais par Am�elie Audiberti. Roman. [21e �edition.]',NULL,NULL,NULL,0),(125,NULL,NULL,NULL,'�George Orwell. �1984 [\"Nineteen eighty four\"]. Traduit de l\'anglais par Am�elie Audiberti. Roman',NULL,NULL,NULL,0),(126,NULL,NULL,NULL,'1984','George Orwell',NULL,NULL,0),(127,NULL,NULL,NULL,'1984   ou le R�egne de l\'ambivalence','Fran�cois Brune','2256904040',NULL,0),(128,NULL,NULL,NULL,'�The �1984-1988 French defence programme','[Minist�ere de la d�efense, Service d\'information et de relations publiques des ',NULL,NULL,0),(129,NULL,NULL,NULL,'�Der �Orwell-Staat 1984','Hrsg. Werner Meyer-Larsen','349933044X',NULL,0),(130,NULL,NULL,NULL,'�The �Language of 1984','W. F. Bolton','0631136584',NULL,0),(131,NULL,NULL,NULL,'�The �Orwellian world of Jehovah\'s witness','Heather [and] Gary Botting','0802025374',NULL,0),(132,NULL,NULL,NULL,'Nineteen eighty-four in 1984','ed. by Paul Chilton and Crispin Aubrey','090689042X',NULL,0),(133,NULL,NULL,NULL,'George Orwell\'s \"Nineteen eighty-four\" North Korea',NULL,NULL,NULL,0),(134,NULL,NULL,NULL,'1984 CERN school of computing',NULL,NULL,NULL,0),(135,NULL,NULL,NULL,'1984 CERN school of physics',NULL,NULL,NULL,0),(136,NULL,NULL,NULL,'�The �Future of Nineteen eighty-four','ed. and with an introd. by Ejner J. Jensen','0472080474',NULL,0),(137,NULL,NULL,NULL,'�L\'�Infondazione di Babele, l\'antiutopia','Roberto Bertinetti, Angelo Deidda, Mario Domenichelli',NULL,NULL,0),(138,NULL,NULL,NULL,'1984 investment priorities plan','Board of investments',NULL,NULL,0),(139,NULL,NULL,NULL,'�\" �1984 \" et les pr�esents de l\'univers informationnel','[organis�e par le Centre de cr�eation industrielle] ; textes pr�esent�es par Jea','2858502935',NULL,0),(140,NULL,NULL,NULL,'�L\'��Ame de cristal','Jean-Pierre Devroey','2800408626',NULL,0),(141,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(143,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(144,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(147,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(148,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(149,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(150,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(151,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(152,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(154,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(155,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(156,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(158,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(159,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(160,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `import_biblios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_items` (
  `import_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_record_id` int(11) NOT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `status` enum('error','staged','imported','reverted','ignored') NOT NULL DEFAULT 'staged',
  `marcxml` longtext NOT NULL,
  `import_error` mediumtext,
  PRIMARY KEY (`import_items_id`),
  KEY `import_items_ibfk_1` (`import_record_id`),
  KEY `itemnumber` (`itemnumber`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `import_items_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_record_matches`
--

DROP TABLE IF EXISTS `import_record_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_record_matches` (
  `import_record_id` int(11) NOT NULL,
  `candidate_match_id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  KEY `record_score` (`import_record_id`,`score`),
  CONSTRAINT `import_record_matches_ibfk_1` FOREIGN KEY (`import_record_id`) REFERENCES `import_records` (`import_record_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_record_matches`
--

LOCK TABLES `import_record_matches` WRITE;
/*!40000 ALTER TABLE `import_record_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_record_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_records`
--

DROP TABLE IF EXISTS `import_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_records` (
  `import_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `import_batch_id` int(11) NOT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `record_sequence` int(11) NOT NULL DEFAULT '0',
  `upload_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_date` date DEFAULT NULL,
  `marc` longblob NOT NULL,
  `marcxml` longtext NOT NULL,
  `marcxml_old` longtext NOT NULL,
  `record_type` enum('biblio','auth','holdings') NOT NULL DEFAULT 'biblio',
  `overlay_status` enum('no_match','auto_match','manual_match','match_applied') NOT NULL DEFAULT 'no_match',
  `status` enum('error','staged','imported','reverted','items_reverted','ignored') NOT NULL DEFAULT 'staged',
  `import_error` mediumtext,
  `encoding` varchar(40) NOT NULL DEFAULT '',
  `z3950random` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`import_record_id`),
  KEY `branchcode` (`branchcode`),
  KEY `batch_sequence` (`import_batch_id`,`record_sequence`),
  KEY `batch_id_record_type` (`import_batch_id`,`record_type`),
  CONSTRAINT `import_records_ifbk_1` FOREIGN KEY (`import_batch_id`) REFERENCES `import_batches` (`import_batch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_records`
--

LOCK TABLES `import_records` WRITE;
/*!40000 ALTER TABLE `import_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `borrowernumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `issuingbranch` varchar(18) DEFAULT NULL,
  `returndate` datetime DEFAULT NULL,
  `lastreneweddate` datetime DEFAULT NULL,
  `return` varchar(4) DEFAULT NULL,
  `renewals` tinyint(4) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuedate` datetime DEFAULT NULL,
  KEY `issuesborridx` (`borrowernumber`),
  KEY `bordate` (`borrowernumber`,`timestamp`),
  KEY `issues_ibfk_2` (`itemnumber`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON UPDATE CASCADE,
  CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (5,1,'2013-05-03 23:59:00','MPL',NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:53:46','2013-04-30 10:53:00'),(5,2,'2013-05-03 23:59:00','MPL',NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:55:50','2013-04-30 10:55:00'),(5,4,'2013-05-03 23:59:00','MPL',NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:56:06','2013-04-30 10:56:00'),(3,7,'2013-05-03 23:59:00','MPL',NULL,NULL,NULL,NULL,NULL,'2013-04-30 08:57:40','2013-04-30 10:57:00'),(3,3,'2013-05-03 23:59:00','MPL',NULL,NULL,NULL,NULL,NULL,'2013-04-30 13:19:34','2013-04-30 15:19:00');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuingrules`
--

DROP TABLE IF EXISTS `issuingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuingrules` (
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `itemtype` varchar(10) NOT NULL DEFAULT '',
  `restrictedtype` tinyint(1) DEFAULT NULL,
  `rentaldiscount` decimal(28,6) DEFAULT NULL,
  `reservecharge` decimal(28,6) DEFAULT NULL,
  `fine` decimal(28,6) DEFAULT NULL,
  `finedays` int(11) DEFAULT NULL,
  `firstremind` int(11) DEFAULT NULL,
  `chargeperiod` int(11) DEFAULT NULL,
  `accountsent` int(11) DEFAULT NULL,
  `chargename` varchar(100) DEFAULT NULL,
  `maxissueqty` int(4) DEFAULT NULL,
  `issuelength` int(4) DEFAULT NULL,
  `lengthunit` varchar(10) DEFAULT 'days',
  `hardduedate` date DEFAULT NULL,
  `hardduedatecompare` tinyint(4) NOT NULL DEFAULT '0',
  `renewalsallowed` smallint(6) NOT NULL DEFAULT '0',
  `reservesallowed` smallint(6) NOT NULL DEFAULT '0',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`branchcode`,`categorycode`,`itemtype`),
  KEY `categorycode` (`categorycode`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuingrules`
--

LOCK TABLES `issuingrules` WRITE;
/*!40000 ALTER TABLE `issuingrules` DISABLE KEYS */;
INSERT INTO `issuingrules` VALUES ('*','*',NULL,'0.000000',NULL,'3.000000',5,0,0,NULL,NULL,3,3,'days',NULL,-1,2,3,'*');
/*!40000 ALTER TABLE `issuingrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_circulation_alert_preferences`
--

DROP TABLE IF EXISTS `item_circulation_alert_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_circulation_alert_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) NOT NULL,
  `categorycode` varchar(10) NOT NULL,
  `item_type` varchar(10) NOT NULL,
  `notification` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branchcode` (`branchcode`,`categorycode`,`item_type`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_circulation_alert_preferences`
--

LOCK TABLES `item_circulation_alert_preferences` WRITE;
/*!40000 ALTER TABLE `item_circulation_alert_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_circulation_alert_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemnumber` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `biblioitemnumber` int(11) NOT NULL DEFAULT '0',
  `barcode` varchar(20) DEFAULT NULL,
  `dateaccessioned` date DEFAULT NULL,
  `booksellerid` mediumtext,
  `homebranch` varchar(10) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `replacementprice` decimal(8,2) DEFAULT NULL,
  `replacementpricedate` date DEFAULT NULL,
  `datelastborrowed` date DEFAULT NULL,
  `datelastseen` date DEFAULT NULL,
  `stack` tinyint(1) DEFAULT NULL,
  `notforloan` tinyint(1) NOT NULL DEFAULT '0',
  `damaged` tinyint(1) NOT NULL DEFAULT '0',
  `itemlost` tinyint(1) NOT NULL DEFAULT '0',
  `wthdrawn` tinyint(1) NOT NULL DEFAULT '0',
  `itemcallnumber` varchar(255) DEFAULT NULL,
  `issues` smallint(6) DEFAULT NULL,
  `renewals` smallint(6) DEFAULT NULL,
  `reserves` smallint(6) DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT NULL,
  `itemnotes` mediumtext,
  `holdingbranch` varchar(10) DEFAULT NULL,
  `paidfor` mediumtext,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(80) DEFAULT NULL,
  `permanent_location` varchar(80) DEFAULT NULL,
  `onloan` date DEFAULT NULL,
  `cn_source` varchar(10) DEFAULT NULL,
  `cn_sort` varchar(30) DEFAULT NULL,
  `ccode` varchar(10) DEFAULT NULL,
  `materials` text,
  `uri` varchar(255) DEFAULT NULL,
  `itype` varchar(10) DEFAULT NULL,
  `more_subfields_xml` longtext,
  `enumchron` text,
  `copynumber` varchar(32) DEFAULT NULL,
  `stocknumber` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`itemnumber`),
  UNIQUE KEY `itembarcodeidx` (`barcode`),
  KEY `itemstocknumberidx` (`stocknumber`),
  KEY `itembinoidx` (`biblioitemnumber`),
  KEY `itembibnoidx` (`biblionumber`),
  KEY `homebranch` (`homebranch`),
  KEY `holdingbranch` (`holdingbranch`),
  KEY `itemcallnumber` (`itemcallnumber`),
  KEY `items_location` (`location`),
  KEY `items_ccode` (`ccode`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`biblioitemnumber`) REFERENCES `biblioitems` (`biblioitemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`homebranch`) REFERENCES `branches` (`branchcode`) ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`holdingbranch`) REFERENCES `branches` (`branchcode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,'0000000001','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30','2013-04-30','2013-04-30',NULL,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,'MPL',NULL,'2013-04-30 08:53:46',NULL,NULL,'2013-05-03',NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(2,1,1,'0000000002','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30','2013-04-30','2013-04-30',NULL,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,'MPL',NULL,'2013-04-30 08:55:50',NULL,NULL,'2013-05-03',NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(3,1,1,'0000000003','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30','2013-04-30','2013-04-30',NULL,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,'MPL',NULL,'2013-04-30 13:19:34',NULL,NULL,'2013-05-03',NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(4,2,2,'0000000004','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30','2013-04-30','2013-04-30',NULL,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,'MPL',NULL,'2013-04-30 08:56:06',NULL,NULL,'2013-05-03',NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(5,2,2,'0000000005','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:38:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(6,2,2,'0000000006','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:38:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(7,3,3,'0000000007','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30','2013-04-30','2013-04-30',NULL,0,0,0,0,NULL,1,NULL,NULL,NULL,NULL,'MPL',NULL,'2013-04-30 08:57:40',NULL,NULL,'2013-05-03',NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(8,3,3,'0000000008','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:40:28',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(9,3,3,'0000000009','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:40:28',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(10,4,4,'0000000010','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:43:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(11,4,4,'0000000011','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:43:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(12,4,4,'0000000012','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:43:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(13,5,5,'0000000013','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:46:53',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(14,5,5,'0000000014','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:46:53',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL),(15,5,5,'0000000015','2013-04-30',NULL,NULL,NULL,NULL,'2013-04-30',NULL,'2013-04-30',NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'CPL',NULL,'2013-04-30 08:46:54',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'BK',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtypes`
--

DROP TABLE IF EXISTS `itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtypes` (
  `itemtype` varchar(10) NOT NULL DEFAULT '',
  `description` mediumtext,
  `rentalcharge` double(16,4) DEFAULT NULL,
  `notforloan` smallint(6) DEFAULT NULL,
  `imageurl` varchar(200) DEFAULT NULL,
  `summary` text,
  PRIMARY KEY (`itemtype`),
  UNIQUE KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtypes`
--

LOCK TABLES `itemtypes` WRITE;
/*!40000 ALTER TABLE `itemtypes` DISABLE KEYS */;
INSERT INTO `itemtypes` VALUES ('BK','Books',0.0000,0,'bridge/book.gif',''),('CF','Computer Files',0.0000,0,'bridge/computer_file.gif',''),('CR','Continuing Resources',5.0000,0,'bridge/periodical.gif',''),('MP','Maps',5.0000,0,'bridge/map.gif',''),('MU','Music',5.0000,0,'bridge/sound.gif',''),('MX','Mixed Materials',5.0000,0,'bridge/kit.gif',''),('REF','Reference',0.0000,1,'',''),('VM','Visual Materials',5.0000,1,'bridge/dvd.gif','');
/*!40000 ALTER TABLE `itemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_descriptions`
--

DROP TABLE IF EXISTS `language_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_descriptions` (
  `subtag` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `lang` varchar(25) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`),
  KEY `subtag_type_lang` (`subtag`,`type`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_descriptions`
--

LOCK TABLES `language_descriptions` WRITE;
/*!40000 ALTER TABLE `language_descriptions` DISABLE KEYS */;
INSERT INTO `language_descriptions` VALUES ('opac','i','en','OPAC',1),('opac','i','fr','OPAC',2),('intranet','i','en','Staff Client',3),('intranet','i','fr','????',4),('prog','t','en','Prog',5),('prog','t','fr','Prog',6),('ar','language','ar','&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;',7),('ar','language','en','Arabic',8),('ar','language','fr','Arabe',9),('hy','language','hy','&#1344;&#1377;&#1397;&#1381;&#1408;&#1383;&#1398;',10),('hy','language','en','Armenian',11),('hy','language','fr','Armenian',12),('bg','language','bg','&#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1089;&#1082;&#1080;',13),('bg','language','en','Bulgarian',14),('bg','language','fr','Bulgare',15),('zh','language','zh','&#20013;&#25991;',16),('zh','language','en','Chinese',17),('zh','language','fr','Chinois',18),('cs','language','cs','&#x010D;e&#353;tina',19),('cs','language','en','Czech',20),('cs','language','fr','Tchèque',21),('da','language','da','Dansk',22),('da','language','en','Danish',23),('da','language','fr','Danois',24),('nl','language','nl','Nederlands',25),('nl','language','en','Dutch',26),('nl','language','fr','Néerlandais',27),('en','language','en','English',28),('en','language','fr','Anglais',29),('fi','language','fi','suomi',30),('fi','language','en','Finnish',31),('fr','language','en','French',32),('fr','language','fr','Fran&ccedil;ais',33),('lo','language','lo','&#3742;&#3762;&#3754;&#3762;&#3749;&#3762;&#3751;',34),('lo','language','en','Lao',35),('de','language','de','Deutsch',36),('de','language','en','German',37),('de','language','fr','Allemand',38),('el','language','el','&#949;&#955;&#955;&#951;&#957;&#953;&#954;&#940;',39),('el','language','en','Greek, Modern [1453- ]',40),('el','language','fr','Grec Moderne (Après 1453)',41),('he','language','he','&#1506;&#1489;&#1512;&#1497;&#1514;',42),('he','language','en','Hebrew',43),('he','language','fr','Hébreu',44),('hi','language','hi','&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;',45),('hi','language','en','Hindi',46),('hi','language','fr','Hindi',47),('hu','language','hu','Magyar',48),('hu','language','en','Hungarian',49),('hu','language','fr','Hongrois',50),('id','language','id','Bahasa Indonesia',51),('id','language','en','Indonesian',52),('id','language','fr','Indonésien',53),('it','language','it','Italiano',54),('it','language','en','Italian',55),('it','language','fr','Italien',56),('ja','language','ja','&#26085;&#26412;&#35486;',57),('ja','language','en','Japanese',58),('ja','language','fr','Japonais',59),('ko','language','ko','&#54620;&#44397;&#50612;',60),('ko','language','en','Korean',61),('ko','language','fr','Coréen',62),('la','language','la','Latina',63),('la','language','en','Latin',64),('la','language','fr','Latin',65),('gl','language','gl','Galego',66),('gl','language','en','Galician',67),('nb','language','nb','Norsk bokm&#229;l',68),('nb','language','en','Norwegian bokm&#229;l',69),('nb','language','fr','Norvégien bokm&#229;l',70),('nn','language','nb','Norsk nynorsk',71),('nn','language','nn','Norsk nynorsk',72),('nn','language','en','Norwegian nynorsk',73),('nn','language','fr','Norvégien nynorsk',74),('fa','language','fa','&#1601;&#1575;&#1585;&#1587;&#1609;',75),('fa','language','en','Persian',76),('fa','language','fr','Persan',77),('pl','language','pl','Polski',78),('pl','language','en','Polish',79),('pl','language','fr','Polonais',80),('pt','language','pt','Portugu&ecirc;s',81),('pt','language','en','Portuguese',82),('pt','language','fr','Portugais',83),('ro','language','ro','Rom&acirc;n&#259;',84),('ro','language','en','Romanian',85),('ro','language','fr','Roumain',86),('ru','language','ru','&#1056;&#1091;&#1089;&#1089;&#1082;&#1080;&#1081;',87),('ru','language','en','Russian',88),('ru','language','fr','Russe',89),('sr','language','sr','&#1089;&#1088;&#1087;&#1089;&#1082;&#1080;',90),('sr','language','en','Serbian',91),('es','language','es','Espa&ntilde;ol',92),('es','language','en','Spanish',93),('es','language','fr','Espagnol',94),('sv','language','sv','Svenska',95),('sv','language','en','Swedish',96),('sv','language','fr','Suédois',97),('tet','language','tet','tetun',98),('tet','language','en','Tetum',99),('th','language','th','&#3616;&#3634;&#3625;&#3634;&#3652;&#3607;&#3618;',100),('th','language','en','Thai',101),('th','language','fr','Thaï',102),('tr','language','tr','T&uuml;rk&ccedil;e',103),('tr','language','en','Turkish',104),('tr','language','fr','Turc',105),('uk','language','uk','&#1059;&#1082;&#1088;&#1072;&#1111;&#1085;&#1089;&#1100;&#1082;&#1072;',106),('uk','language','en','Ukranian',107),('uk','language','fr','Ukrainien',108),('ur','language','en','Urdu',109),('ur','language','ur','&#1575;&#1585;&#1583;&#1608;',110),('Arab','script','Arab','&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;',111),('Arab','script','en','Arabic',112),('Arab','script','fr','Arabic',113),('Cyrl','script','Cyrl','????',114),('Cyrl','script','en','Cyrillic',115),('Cyrl','script','fr','Cyrillic',116),('Grek','script','Grek','????',117),('Grek','script','en','Greek',118),('Grek','script','fr','Greek',119),('Hans','script','Hans','Han (Simplified variant)',120),('Hans','script','en','Han (Simplified variant)',121),('Hans','script','fr','Han (Simplified variant)',122),('Hant','script','Hant','Han (Traditional variant)',123),('Hant','script','en','Han (Traditional variant)',124),('Hebr','script','Hebr','Hebrew',125),('Hebr','script','en','Hebrew',126),('Laoo','script','lo','Lao',127),('Laoo','script','en','Lao',128),('CA','region','en','Canada',129),('DK','region','dk','Danmark',130),('FR','region','fr','France',131),('FR','region','en','France',132),('NZ','region','en','New Zealand',133),('GB','region','en','United Kingdom',134),('US','region','en','United States',135);
/*!40000 ALTER TABLE `language_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_rfc4646_to_iso639`
--

DROP TABLE IF EXISTS `language_rfc4646_to_iso639`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_rfc4646_to_iso639` (
  `rfc4646_subtag` varchar(25) DEFAULT NULL,
  `iso639_2_code` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `rfc4646_subtag` (`rfc4646_subtag`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_rfc4646_to_iso639`
--

LOCK TABLES `language_rfc4646_to_iso639` WRITE;
/*!40000 ALTER TABLE `language_rfc4646_to_iso639` DISABLE KEYS */;
INSERT INTO `language_rfc4646_to_iso639` VALUES ('ar','ara',1),('hy','arm',2),('bg','bul',3),('zh','chi',4),('cs','cze',5),('da','dan',6),('nl','dut',7),('en','eng',8),('fi','fin',9),('fr','fre',10),('lo','lao',11),('de','ger',12),('el','gre',13),('he','heb',14),('hi','hin',15),('hu','hun',16),('id','ind',17),('it','ita',18),('ja','jpn',19),('ko','kor',20),('la','lat',21),('gl','glg',22),('nb','nor',23),('nb','nob',24),('nn','nno',25),('fa','per',26),('pl','pol',27),('pt','por',28),('ro','rum',29),('ru','rus',30),('sr','srp',31),('es','spa',32),('sv','swe',33),('tet','tet',34),('th','tha',35),('tr','tur',36),('uk','ukr',37),('ur','urd',38);
/*!40000 ALTER TABLE `language_rfc4646_to_iso639` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_script_bidi`
--

DROP TABLE IF EXISTS `language_script_bidi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_script_bidi` (
  `rfc4646_subtag` varchar(25) DEFAULT NULL,
  `bidi` varchar(3) DEFAULT NULL,
  KEY `rfc4646_subtag` (`rfc4646_subtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_script_bidi`
--

LOCK TABLES `language_script_bidi` WRITE;
/*!40000 ALTER TABLE `language_script_bidi` DISABLE KEYS */;
INSERT INTO `language_script_bidi` VALUES ('Arab','rtl'),('Hebr','rtl');
/*!40000 ALTER TABLE `language_script_bidi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_script_mapping`
--

DROP TABLE IF EXISTS `language_script_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_script_mapping` (
  `language_subtag` varchar(25) DEFAULT NULL,
  `script_subtag` varchar(25) DEFAULT NULL,
  KEY `language_subtag` (`language_subtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_script_mapping`
--

LOCK TABLES `language_script_mapping` WRITE;
/*!40000 ALTER TABLE `language_script_mapping` DISABLE KEYS */;
INSERT INTO `language_script_mapping` VALUES ('ar','Arab'),('he','Hebr');
/*!40000 ALTER TABLE `language_script_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_subtag_registry`
--

DROP TABLE IF EXISTS `language_subtag_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_subtag_registry` (
  `subtag` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `added` date DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `subtag` (`subtag`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_subtag_registry`
--

LOCK TABLES `language_subtag_registry` WRITE;
/*!40000 ALTER TABLE `language_subtag_registry` DISABLE KEYS */;
INSERT INTO `language_subtag_registry` VALUES ('opac','i','OPAC','2005-10-16',1),('intranet','i','Staff Client','2005-10-16',2),('prog','t','Prog','2005-10-16',3),('ar','language','Arabic','2005-10-16',4),('hy','language','Armenian','2005-10-16',5),('bg','language','Bulgarian','2005-10-16',6),('zh','language','Chinese','2005-10-16',7),('cs','language','Czech','2005-10-16',8),('da','language','Danish','2005-10-16',9),('nl','language','Dutch','2005-10-16',10),('en','language','English','2005-10-16',11),('fi','language','Finnish','2005-10-16',12),('fr','language','French','2005-10-16',13),('lo','language','Lao','2005-10-16',14),('de','language','German','2005-10-16',15),('el','language','Greek, Modern [1453- ]','2005-10-16',16),('he','language','Hebrew','2005-10-16',17),('hi','language','Hindi','2005-10-16',18),('hu','language','Hungarian','2005-10-16',19),('id','language','Indonesian','2005-10-16',20),('it','language','Italian','2005-10-16',21),('ja','language','Japanese','2005-10-16',22),('ko','language','Korean','2005-10-16',23),('la','language','Latin','2005-10-16',24),('gl','language','Galician','2005-10-16',25),('nb','language','Norwegian bokm&#229;l','2005-10-16',26),('nn','language','Norwegian nynorsk','2011-02-14',27),('fa','language','Persian','2005-10-16',28),('pl','language','Polish','2005-10-16',29),('pt','language','Portuguese','2005-10-16',30),('ro','language','Romanian','2005-10-16',31),('ru','language','Russian','2005-10-16',32),('sr','language','Serbian','2005-10-16',33),('es','language','Spanish','2005-10-16',34),('sv','language','Swedish','2005-10-16',35),('tet','language','Tetum','2005-10-16',36),('th','language','Thai','2005-10-16',37),('tr','language','Turkish','2005-10-16',38),('uk','language','Ukranian','2005-10-16',39),('ur','language','Urdu','2005-10-16',40),('Arab','script','Arabic','2005-10-16',41),('Cyrl','script','Cyrillic','2005-10-16',42),('Grek','script','Greek','2005-10-16',43),('Hans','script','Han (Simplified variant)','2005-10-16',44),('Hant','script','Han (Traditional variant)','2005-10-16',45),('Hebr','script','Hebrew','2005-10-16',46),('Laoo','script','Lao','2005-10-16',47),('CA','region','Canada','2005-10-16',48),('DK','region','Denmark','2005-10-16',49),('FR','region','France','2005-10-16',50),('NZ','region','New Zealand','2005-10-16',51),('GB','region','United Kingdom','2005-10-16',52),('US','region','United States','2005-10-16',53);
/*!40000 ALTER TABLE `language_subtag_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `module` varchar(20) NOT NULL DEFAULT '',
  `code` varchar(20) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `is_html` tinyint(1) DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`module`,`code`,`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES ('circulation','CHECKIN','','Item Check-in (Digest)',0,'Check-ins','The following items have been checked in:\r\n----\r\n<<biblio.title>>\r\n----\r\nThank you.'),('circulation','CHECKOUT','','Item Check-out (Digest)',0,'Checkouts','The following items have been checked out:\r\n----\r\n<<biblio.title>>\r\n----\r\nThank you for visiting <<branches.branchname>>.'),('circulation','DUE','','Item Due Reminder',0,'Item Due Reminder','Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following item is now due:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)'),('circulation','DUEDGST','','Item Due Reminder (Digest)',0,'Item Due Reminder','You have <<count>> items due'),('circulation','ISSUEQSLIP','','Issue Quick Slip',1,'Issue Quick Slip','<h3><<branches.branchname>></h3>\nChecked out to <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />\n(<<borrowers.cardnumber>>) <br />\n\n<<today>><br />\n\n<h4>Checked Out Today</h4>\n<checkedout>\n<p>\n<<biblio.title>> <br />\nBarcode: <<items.barcode>><br />\nDate due: <<issues.date_due>><br />\n</p>\n</checkedout>'),('circulation','ISSUESLIP','','Issue Slip',1,'Issue Slip','<h3><<branches.branchname>></h3>\nChecked out to <<borrowers.title>> <<borrowers.firstname>> <<borrowers.initials>> <<borrowers.surname>> <br />\n(<<borrowers.cardnumber>>) <br />\n\n<<today>><br />\n\n<h4>Checked Out</h4>\n<checkedout>\n<p>\n<<biblio.title>> <br />\nBarcode: <<items.barcode>><br />\nDate due: <<issues.date_due>><br />\n</p>\n</checkedout>\n\n<h4>Overdues</h4>\n<overdue>\n<p>\n<<biblio.title>> <br />\nBarcode: <<items.barcode>><br />\nDate due: <<issues.date_due>><br />\n</p>\n</overdue>\n\n<hr>\n\n<h4 style=\"text-align: center; font-style:italic;\">News</h4>\n<news>\n<div class=\"newsitem\">\n<h5 style=\"margin-bottom: 1px; margin-top: 1px\"><b><<opac_news.title>></b></h5>\n<p style=\"margin-bottom: 1px; margin-top: 1px\"><<opac_news.new>></p>\n<p class=\"newsfooter\" style=\"font-size: 8pt; font-style:italic; margin-bottom: 1px; margin-top: 1px\">Posted on <<opac_news.timestamp>></p>\n<hr />\n</div>\n</news>'),('circulation','ODUE','','Overdue Notice',0,'Item Overdue','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nAccording to our current records, you have items that are overdue.Your library does not charge late fines, but please return or renew them at the branch below as soon as possible.\n\n<<branches.branchname>>\n<<branches.branchaddress1>>\n<<branches.branchaddress2>> <<branches.branchaddress3>>\nPhone: <<branches.branchphone>>\nFax: <<branches.branchfax>>\nEmail: <<branches.branchemail>>\n\nIf you have registered a password with the library, and you have a renewal available, you may renew online. If an item becomes more than 30 days overdue, you will be unable to use your library card until the item is returned.\n\nThe following item(s) is/are currently overdue:\n\n<item>\"<<biblio.title>>\" by <<biblio.author>>, <<items.itemcallnumber>>, Barcode: <<items.barcode>> Fine: <<items.fine>></item>\n\nThank-you for your prompt attention to this matter.\n\n<<branches.branchname>> Staff\n'),('circulation','PREDUE','','Advance Notice of Item Due',0,'Advance Notice of Item Due','Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following item will be due soon:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)'),('circulation','PREDUEDGST','','Advance Notice of Item Due (Digest)',0,'Advance Notice of Item Due','You have <<count>> items due soon'),('circulation','RESERVESLIP','','Reserve Slip',1,'Reserve Slip','<h5>Date: <<today>></h5>\n\n<h3> Transfer to/Hold in <<branches.branchname>></h3>\n\n<h3><<borrowers.surname>>, <<borrowers.firstname>></h3>\n\n<ul>\n    <li><<borrowers.cardnumber>></li>\n    <li><<borrowers.phone>></li>\n    <li> <<borrowers.address>><br />\n         <<borrowers.address2>><br />\n         <<borrowers.city >>  <<borrowers.zipcode>>\n    </li>\n    <li><<borrowers.email>></li>\n</ul>\n<br />\n<h3>ITEM ON HOLD</h3>\n<h4><<biblio.title>></h4>\n<h5><<biblio.author>></h5>\n<ul>\n   <li><<items.barcode>></li>\n   <li><<items.itemcallnumber>></li>\n   <li><<reserves.waitingdate>></li>\n</ul>\n<p>Notes:\n<pre><<reserves.reservenotes>></pre>\n</p>\n'),('circulation','TRANSFERSLIP','','Transfer Slip',1,'Transfer Slip','<h5>Date: <<today>></h5>\n\n<h3>Transfer to <<branches.branchname>></h3>\n\n<h3>ITEM</h3>\n<h4><<biblio.title>></h4>\n<h5><<biblio.author>></h5>\n<ul>\n   <li><<items.barcode>></li>\n   <li><<items.itemcallnumber>></li>\n</ul>'),('claimacquisition','ACQCLAIM','','Acquisition Claim',0,'Item Not Received','<<aqbooksellers.name>>\r\n<<aqbooksellers.address1>>\r\n<<aqbooksellers.address2>>\r\n<<aqbooksellers.address3>>\r\n<<aqbooksellers.address4>>\r\n<<aqbooksellers.phone>>\r\n\r\n<order>Ordernumber <<aqorders.ordernumber>> (<<biblio.title>>) (<<aqorders.quantity>> ordered) ($<<aqorders.listprice>> each) has not been received.</order>'),('members','ACCTDETAILS','','Account Details Template - DEFAULT',0,'Your new Koha account details.','Hello <<borrowers.title>> <<borrowers.firstname>> <<borrowers.surname>>.\r\n\r\nYour new Koha account details are:\r\n\r\nUser:  <<borrowers.userid>>\r\nPassword: <<borrowers.password>>\r\n\r\nIf you have any problems or questions regarding your account, please contact your Koha Administrator.\r\n\r\nThank you,\r\nKoha Administrator\r\nkohaadmin@yoursite.org'),('reserves','HOLD','','Hold Available for Pickup',0,'Hold Available for Pickup at <<branches.branchname>>','Dear <<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nYou have a hold available for pickup as of <<reserves.waitingdate>>:\r\n\r\nTitle: <<biblio.title>>\r\nAuthor: <<biblio.author>>\r\nCopy: <<items.copynumber>>\r\nLocation: <<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n<<branches.branchaddress3>>\r\n<<branches.branchcity>> <<branches.branchzip>>'),('reserves','HOLDPLACED','','Hold Placed on Item',0,'Hold Placed on Item','A hold has been placed on the following item : <<biblio.title>> (<<biblio.biblionumber>>) by the user <<borrowers.firstname>> <<borrowers.surname>> (<<borrowers.cardnumber>>).'),('reserves','HOLD_PRINT','','Hold Available for Pickup (print notice)',0,'Hold Available for Pickup (print notice)','<<branches.branchname>>\r\n<<branches.branchaddress1>>\r\n<<branches.branchaddress2>>\r\n\r\n\r\nChange Service Requested\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>>\r\n<<borrowers.address>>\r\n<<borrowers.city>> <<borrowers.zipcode>>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n<<borrowers.firstname>> <<borrowers.surname>> <<borrowers.cardnumber>>\r\n\r\nYou have a hold available for pickup as of <<reserves.waitingdate>>:\r\n\r\nTitle: <<biblio.title>>\r\nAuthor: <<biblio.author>>\r\nCopy: <<items.copynumber>>\r\n'),('serial','RLIST','','Routing List',0,'Serial is now available','<<borrowers.firstname>> <<borrowers.surname>>,\r\n\r\nThe following issue is now available:\r\n\r\n<<biblio.title>>, <<biblio.author>> (<<items.barcode>>)\r\n\r\nPlease pick it up at your convenience.'),('suggestions','ACCEPTED','','Suggestion accepted',0,'Purchase suggestion accepted','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nThe library has reviewed your suggestion today. The item will be ordered as soon as possible. You will be notified by mail when the order is completed, and again when the item arrives at the library.\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>'),('suggestions','AVAILABLE','','Suggestion available',0,'Suggested purchase available','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nWe are pleased to inform you that the item you requested is now part of the collection.\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>'),('suggestions','ORDERED','','Suggestion ordered',0,'Suggested item ordered','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nWe are pleased to inform you that the item you requested has now been ordered. It should arrive soon, at which time it will be processed for addition into the collection.\n\nYou will be notified again when the book is available.\n\nIf you have any questions, please email us at <<branches.branchemail>>\n\nThank you,\n\n<<branches.branchname>>'),('suggestions','REJECTED','','Suggestion rejected',0,'Purchase suggestion declined','Dear <<borrowers.firstname>> <<borrowers.surname>>,\n\nYou have suggested that the library acquire <<suggestions.title>> by <<suggestions.author>>.\n\nThe library has reviewed your request today, and has decided not to accept the suggestion at this time.\n\nThe reason given is: <<suggestions.reason>>\n\nIf you have any questions, please email us at <<branches.branchemail>>.\n\nThank you,\n\n<<branches.branchname>>');
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_matchers`
--

DROP TABLE IF EXISTS `marc_matchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_matchers` (
  `matcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `record_type` varchar(10) NOT NULL DEFAULT 'biblio',
  `threshold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matcher_id`),
  KEY `code` (`code`),
  KEY `record_type` (`record_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_matchers`
--

LOCK TABLES `marc_matchers` WRITE;
/*!40000 ALTER TABLE `marc_matchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `marc_matchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_subfield_structure`
--

DROP TABLE IF EXISTS `marc_subfield_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_subfield_structure` (
  `tagfield` varchar(3) NOT NULL DEFAULT '',
  `tagsubfield` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) NOT NULL DEFAULT '',
  `libopac` varchar(255) NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `kohafield` varchar(40) DEFAULT NULL,
  `tab` tinyint(1) DEFAULT NULL,
  `authorised_value` varchar(20) DEFAULT NULL,
  `authtypecode` varchar(20) DEFAULT NULL,
  `value_builder` varchar(80) DEFAULT NULL,
  `isurl` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `frameworkcode` varchar(4) NOT NULL DEFAULT '',
  `seealso` varchar(1100) DEFAULT NULL,
  `link` varchar(80) DEFAULT NULL,
  `defaultvalue` text,
  `maxlength` int(4) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`frameworkcode`,`tagfield`,`tagsubfield`),
  KEY `kohafield_2` (`kohafield`),
  KEY `tab` (`frameworkcode`,`tab`),
  KEY `kohafield` (`frameworkcode`,`kohafield`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_subfield_structure`
--

LOCK TABLES `marc_subfield_structure` WRITE;
/*!40000 ALTER TABLE `marc_subfield_structure` DISABLE KEYS */;
INSERT INTO `marc_subfield_structure` VALUES ('000','@','fixed length control field','fixed length control field',0,1,'',0,'','','unimarc_leader.pl',0,0,'','','',NULL,24),('001','@','control field','control field',0,1,'biblio.biblionumber',-1,'','','',0,0,'','','',NULL,9999),('005','@','control field','control field',0,0,'',0,'','','marc21_field_005.pl',0,0,'','','',NULL,9999),('010','a','Number (ISBN)','Number (ISBN)',0,0,'biblioitems.isbn',0,'','','',0,0,'','','',NULL,9999),('010','b','Qualification','Qualification',0,0,'',0,'','','',0,0,'','','',NULL,9999),('010','d','Terms of availability and/or Price','Terms of availability and/or Price',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('010','z','Erroneous ISBN','Erroneous ISBN',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','a','Number (ISSN)','Number (ISSN)',0,0,'biblioitems.issn',0,'','','',0,0,'','','',NULL,9999),('011','b','Qualification','Qualification',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','d','Terms of availability and/or price','Terms of availability and/or price',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','y','Cancelled ISSN','Cancelled ISSN',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('011','z','Erroneous ISSN','Erroneous ISSN',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('012','2','Fingerprint System Code','Fingerprint System Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('012','5','Institution to Which the Field Applies','Institution to Which the Field Applies',0,1,'',0,'','','',0,-5,'','','',NULL,9999),('012','a','Fingerprint','Fingerprint',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','a','Number (ISMN)','Number (ISMN)',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','b','Qualification','Qualification',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','d','Terms of Availability and/or Price','Terms of Availability and/or Price',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('013','z','Erroneous ISMN','Erroneous ISMN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','2','System Code','System Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','a','Article Identifier','Article Identifier',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('014','z','Erroneous Article Identifier','Erroneous Article Identifier',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('020','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('020','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('020','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('021','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','a','Country Code','Country Code',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','b','Number','Number',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('022','z','Erroneous Number','Erroneous Number',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('040','a','CODEN','CODEN',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('040','z','Erroneous CODEN','Erroneous CODEN',1,0,'',0,'','','',0,-5,'','','',NULL,9999),('071','a','Publisher\'s Number (Sound Recordings and Music)','Publisher\'s Number (Sound Recordings and Music)',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('071','b','Source','Source',0,0,'',0,'','','',0,-5,'','','',NULL,9999),('090','a','Koha biblioitem number (autogenerated)','Koha biblioitem number (autogenerated)',0,0,'biblioitems.biblioitemnumber',9,'','','',0,-5,'',NULL,'','',9999),('099','c','Date of creation (bib. record)','Date of creation (bib. record)',0,0,'biblio.datecreated',0,'','','',0,-5,'',NULL,'','',9999),('099','d','Last modified date (bib. record)','Last modified data (bib. record)',0,0,'biblio.timestamp',0,'','','',0,-5,'',NULL,'','',9999),('100','a','General Processing Data','General Processing Data',0,0,'',1,'','','unimarc_field_100.pl',0,0,'','','',NULL,36),('101','a','Language of the Text, Soundtrack, etc.','Language of the Text, Soundtrack, etc.',1,0,'',1,'LAN','','',0,0,'','','',NULL,9999),('101','b','Language of Intermediate Text when Item is Not Translated from Original','Language of Intermediate Text when Item is Not Translated from Original',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','c','Language of Original Work','Language of Original Work',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','d','Language of Summary','Language of Summary',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','e','Language of Contents Page','Language of Contents Page',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','f','Language of Title Page if Different from Text','Language of Title Page if Different from Text',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','g','Language of Title Proper if Not First Language of Text, Soundtrack, etc.','Language of Title Proper if Not First Language of Text, Soundtrack, etc.',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','h','Language of Libretto, etc.','Language of Libretto, etc.',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','i','Language of Accompainying MAterial (Other than Summaries, Abstracts or Librettos','Language of Accompainying MAterial (Other than Summaries, Abstracts or Librettos',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('101','j','Language of Subtitles','Language of Subtitles',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('102','a','Country of Publication','Country of Publication',1,0,'',1,'COU','','',0,0,'','','',NULL,9999),('102','b','Locality of Publication','Locality of Publication',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('105','a','Monograph Coded Data','Monograph Coded Data',0,0,'',1,'','','',0,0,'','','',NULL,9999),('106','a','Textual Material Data - Physical Medium Designator','Textual Material Data - Physical Medium Designator',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('110','a','Serial Coded Data','Serial Coded Data',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('115','a','Coded Data - General','Coded Data - General',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('115','b','Motion Picture Coded Data - Archivial','Motion Picture Coded Data - Archivial',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('116','a','Coded Data for Graphics','Coded Data for Graphics',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('117','a','Coded Data for Three-Dimensional Artefacts and Realia','Coded Data for Three-Dimensional Artefacts and Realia',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('120','a','Cartographic Material Coded Data: Physical Attributes (General)','Cartographic Material Coded Data: Physical Attributes (General)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('121','a','Cartographic Material Coded Data: Physical Attributes (General)','Cartographic Material Coded Data: Physical Attributes (General)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('121','b','Aerial Photography and Remote Sensing Coded Data: Physical Attributes','Aerial Photography and Remote Sensing Coded Data: Physical Attributes',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('122','a','Time Period, 9999 B.C. to Present','Time Period, 9999 B.C. to Present',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','a','Type of Scale','Type of Scale',0,1,'',1,'','','',0,-5,'','','',NULL,9999),('123','b','Constant Ratio Linear Horizontal Scale','Constant Ratio Linear Horizontal Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','c','Constant Ratio Linear Vertical Scale','Constant Ratio Linear Vertical Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','d','Coordinates - Westernmost Longitude','Coordinates - Westernmost Longitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','e','Coordinates - Easternmost Longitude','Coordinates - Easternmost Longitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','f','Coordinates - Northernmost Latitude','Coordinates - Northernmost Latitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','g','Coordinates - Southernmost Latitude','Coordinates - Southernmost Latitude',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','h','Angular Scale','Angular Scale',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','i','Declination - Northern Limit','Declination - Northern Limit',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','j','Declination - Southern Limit','Declination - Southern Limit',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','k','Right Ascension - Eastern Limits','Right Ascension - Eastern Limits',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','m','Right Ascension - Western Limits','Right Ascension - Western Limits',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','n','Equinox','Equinox',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('123','o','Epoch','Epoch',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','a','Character of Image','Character of Image',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','b','Form of Cartographic Item','Form of Cartographic Item',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','c','Presentation Technique for Photographic or Non-Photographic Image','Presentation Technique for Photographic or Non-Photographic Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','d','Position of Platform for Photographic or Remote Sensing Image','Position of Platform for Photographic or Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','e','Category of Satellite for Remote Sensing Image','Category of Satellite for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','f','Name of Satellite for Remote Sensing Image','Name of Satellite for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('124','g','Recording Technique for Remote Sensing Image','Recording Technique for Remote Sensing Image',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('125','a','Format of Printed Music','Format of Printed Music',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('125','b','Literary Text Indicator (Non-Music Performance)','Literary Text Indicator (Non-Music Performance)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('126','a','Sound Recordings Coded Data (General)','Sound Recordings Coded Data (General)',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('126','b','Sound Recordings Coded Data (Detail)','Sound Recordings Coded Data (Detail)',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('127','a','Duration','Duration',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','a','Form of Composition','Form of Composition',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','b','Instruments or Voices for Ensemble','Instruments or Voices for Ensemble',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('128','c','Instruments or Voices for Soloists','Instruments or Voices for Soloists',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('130','a','Microform Coded Data - Physical Attributes','Microform Coded Data - Physical Attributes',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','a','Spheroid','Spheroid',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','b','Horizontal Datum','Horizontal Datum',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','c','Grid and Referencing System','Grid and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','d','Overlapping and Referencing System','Overlapping and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','e','Secondary Grid and Referencing System','Secondary Grid and Referencing System',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','f','Vertical Datum','Vertical Datum',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','g','unité de mesure pour l\'altitudeUnit of Measurement of Heighting','unité de mesure pour l\'altitudeUnit of Measurement of Heighting',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','h','Contour Interval','Contour Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','i','Supplementary Contour Interval','Supplementary Contour Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','j','Unit of Measurement','Unit of Measurement',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','k','Bathymetric Interval','Bathymetric Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('131','l','Supplementary Bathymetric Interval','Supplementary Bathymetric Interval',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('135','a','Coded Data for Computer Files','Coded Data for Computer Files',0,0,'',1,'','','',0,-5,'','','',NULL,9999),('140','a','Antiquarian Coded Data - General','Antiquarian Coded Data - General',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('141','5','Institution to Which Field Applies','Institution to Which Field Applies',0,1,'',1,'','','',0,-5,'','','',NULL,9999),('141','a','Antiquarian Coded Data - Copy Specific Attributes','Antiquarian Coded Data - Copy Specific Attributes',1,0,'',1,'','','',0,-5,'','','',NULL,9999),('200','5','(*) Nom de institution à laquelle s&#39;applique cette zone','(*) Nom de institution à laquelle s&#39;applique cette zone',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','a','Title Proper','Title Proper',1,1,'biblio.title',2,'','','',0,0,'',NULL,'','',9999),('200','b','General Material Designation','General Material Designation',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','c','Title Proper by Another Author','Title Proper by Another Author',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','d','Paralel Title Proper','Paralel Title Proper',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','e','Other Title Information','Other Title Information',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','f','First Statement of Responsibility','First Statement of Responsibility',0,0,'biblio.author',2,'','','',0,0,'',NULL,'','',9999),('200','g','Subsequent Statement of Responsibility','Subsequent Statement of Responsibility',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','h','Number of a Part','Number of a Part',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','i','Name of a Part','Name of a Part',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','v','Volume Designation','Volume Designation',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('200','z','Language of Paralel Title Proper','Language of Paralel Title Proper',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('205','a','Edition Statement','Edition Statement',0,0,'biblioitems.editionstatement',2,'','','',0,0,'','','',NULL,9999),('205','b','Issue Statement','Issue Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('205','d','Parallel Edition Statement','Parallel Edition Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('205','f','Statement of Responsibility Relating to Edition','Statement of Responsibility Relating to Edition',0,0,'',2,'','','',0,0,'','','',NULL,9999),('205','g','Subsequent Statement of Responsibility Relating to Edition','Subsequent Statement of Responsibility Relating to Edition',0,0,'',2,'','','',0,0,'','','',NULL,9999),('206','a','Mathematical Data Statement','Mathematical Data Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('207','a','Numbering: Dates and Volume Designations','Numbering: Dates and Volume Designations',1,0,'',2,'','','',0,0,'','','',NULL,9999),('207','z','Source of Numbering Information','Source of Numbering Information',1,0,'',2,'','','',0,0,'','','',NULL,9999),('208','a','Printed Music Specific Statement','Printed Music Specific Statement',0,0,'',2,'','','',0,0,'','','',NULL,9999),('208','d','Parallel Printed Music Specific Statemen(s)','Parallel Printed Music Specific Statemen(s)',1,0,'',2,'','','',0,0,'','','',NULL,9999),('210','a','Place of Publication, Distribution, etc.','Place of Publication, Distribution, etc.',1,0,'',2,'','','',0,0,'',NULL,'','',9999),('210','b','Address of Publisher, Distributor, etc.','Address of Publisher, Distributor, etc.',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('210','c','Name of Publisher, Distributor, etc.','Name of Publisher, Distributor, etc.',0,0,'biblioitems.publishercode',2,'','','unimarc_field_210c.pl',0,0,'',NULL,'','',9999),('210','d','Data of Publication, Distribution, etc.','Data of Publication, Distribution, etc.',0,0,'biblioitems.publicationyear',2,'','','',0,0,'',NULL,'','',9999),('210','e','Place of Manifacture','Place of Manifacture',0,0,'',2,'','','',0,0,'',NULL,'','',9999),('210','f','Address of Manifacturer','Address of Manifacturer',1,0,'',2,'','','',0,0,'',NULL,'','',9999),('210','g','Name of Manifacturer','Name of Manifacturer',1,0,'',2,'','','',0,0,'',NULL,'','',9999),('210','h','Data of Manifacture','Data of Manifacture',1,0,'',2,'','','',0,0,'',NULL,'','',9999),('211','a','Date','Date',0,0,'',2,'','','',0,0,'','','',NULL,9999),('215','a','Specific Material Designation and Extent of Item','Specific Material Designation and Extent of Item',0,0,'biblioitems.pages',2,'','','',0,0,'','','',NULL,9999),('215','c','Other Physical Details','Other Physical Details',0,0,'',2,'','','',0,0,'','','',NULL,9999),('215','d','Dimensions','Dimensions',0,0,'biblioitems.size',2,'','','',0,0,'','','',NULL,9999),('215','e','Accompanying Material','Accompanying Material',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','a','Series Title','Series Title',0,0,'biblio.seriestitle',2,'','','unimarc_field_225a.pl',0,0,'','','',NULL,9999),('225','d','Parallel Series Title','Parallel Series Title',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','e','Other Title Information','Other Title Information',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','f','Statement of Responsibility','Statement of Responsibility',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','h','Number of a Part','Number of a Part',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','i','Name of a Part','Name of a Part',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','v','Volume Designation','Volume Designation',0,0,'biblioitems.volume',2,'','','',0,0,'','','',NULL,9999),('225','x','ISSN of a Series','ISSN of a Series',0,0,'',2,'','','',0,0,'','','',NULL,9999),('225','z','Language of Parallel Title','Language of Parallel Title',0,0,'',2,'','','',0,0,'','','',NULL,9999),('230','a','Designation and Extent of File','Designation and Extent of File',0,0,'',2,'','','',0,0,'','','',NULL,9999),('300','a','Text of Note','Text of Note',0,0,'biblio.notes',3,'','','',0,0,'','','',NULL,9999),('301','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('302','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('303','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('304','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('305','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('306','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('307','a','texte de la note','texte de la note',0,0,'',3,'','','',NULL,NULL,'',NULL,NULL,NULL,9999),('308','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('310','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('311','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('312','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('313','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('314','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('315','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('316','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('317','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','5','Institution to Which Field Applies','Institution to Which Field Applies',0,1,'',3,'','','',0,-5,'','','',NULL,9999),('318','a','Action','Action',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','b','Action Identification','Action Identification',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','c','Time of Action','Time of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','d','Action Interval','Action Interval',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','e','Contingency for Action','Contingency for Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','f','Authorization','Authorization',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','h','Jurisdiction','Jurisdiction',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','i','Method of Action','Method of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','j','Site of Action','Site of Action',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','k','Action Agent','Action Agent',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','l','Status','Status',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','n','Extent','Extent',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','o','Type of Unit','Type of Unit',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','p','Nonpublic Note','Nonpublic Note',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('318','r','Public Note','Public Note',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('320','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('321','a','Indexes, Abstracts, References Note','Indexes, Abstracts, References Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('321','b','Dates of Coverage','Dates of Coverage',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('321','x','ISSN','ISSN',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('322','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('323','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('324','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('325','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('326','a','Frequency','Frequency',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('326','b','Dates of Frequency','Dates of Frequency',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('327','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('328','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('330','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('332','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('333','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('336','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('337','a','Text of Note','Text of Note',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','a','Source of Acquisition/Subscription Address','Source of Acquisition/Subscription Address',0,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','b','Stock Number','Stock Number',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','c','Medium','Medium',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('345','d','Terms of Availability','Terms of Availability',1,0,'',3,'','','',0,-5,'','','',NULL,9999),('410','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('410','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('411','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('421','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('422','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('423','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('430','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('431','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('432','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('433','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('434','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('435','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('436','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('437','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('440','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('441','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('442','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('443','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('444','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('445','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('446','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('447','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('448','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('451','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('452','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('453','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('454','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('455','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('456','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('461','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('462','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('463','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('464','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('470','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('481','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('482','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','0','Bibliographic Record Identifier','Bibliographic Record Identifier',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','3','Authority Record Number','Authority Record Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','a','Author','Author',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','c','Place of Publication','Place of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','d','Date of Publication','Date of Publication',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','e','Edition Statement','Edition Statement',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','h','Number of Section or Part','Number of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','i','Name of Section or Part','Name of Section or Part',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','p','Physical Description','Physical Description',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','t','Title','Title',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','u','Uniform Resource Locator (URL)','Uniform Resource Locator (URL)',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','v','Volume Number','Volume Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','x','ISSN','ISSN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','y','ISBN/International Standard Music Number','ISBN/International Standard Music Number',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('488','z','CODEN','CODEN',0,0,'',4,'','','',0,-5,'','','',NULL,9999),('500','2','System Code','System Code',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','3','Authority Code Number','Authority Code Number',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','a','Uniform Title','Uniform Title',0,0,'biblio.unititle',5,'','','',0,0,'','','',NULL,9999),('500','b','General Material Designation','General Material Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','h','Number of Section or Part','Number of Section or Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','i','Name of Section or Part','Name of Section or Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','k','Date of Publication','Date of Publication',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','l','Form Subheading','Form Subheading',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','m','Language (when Part of a Heading)','Language (when Part of a Heading)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','q','Version (or Date of Version)','Version (or Date of Version)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','r','Medium of Performance (for Music)','Medium of Performance (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','s','Numeric Designation (for Music)','Numeric Designation (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','x','Topical Subdivision','Topical Subdivision',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','y','Geographical Subdivision','Geographical Subdivision',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('500','z','Chronological Subdivision','Chronological Subdivision',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','2','System Code','System Code',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','3','Authority Code Number','Authority Code Number',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','a','Collective Uniform Title','Collective Uniform Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','b','General Material Designation','General Material Designation',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','e','Collective Uniform Subtitle','Collective Uniform Subtitle',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','k','Date of Publication','Date of Publication',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','m','Language (when Part of A Heading)','Language (when Part of A Heading)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','r','Medium of Performance (for Music)','Medium of Performance (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','s','Numeric Designation (for Music)','Numeric Designation (for Music)',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','u','Key (for Music)','Key (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','w','Arranged Statement (for Music)','Arranged Statement (for Music)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','x','Topical Subdivision','Topical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','y','Geographical Subdivision','Geographical Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('501','z','Chronological Subdivision','Chronological Subdivision',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','a','Form Heading Proper','Form Heading Proper',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','b','Form Subheading','Form Subheading',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','d','Month and Day','Month and Day',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','e','Surname of Person','Surname of Person',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','f','Forename','Forename',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','h','Personal Name Qualifier','Personal Name Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','i','Ttle of Part','Ttle of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','j','Year','Year',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','k','Numeration (Arabic)','Numeration (Arabic)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','l','Numeration (Roman)','Numeration (Roman)',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','m','Locality','Locality',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('503','n','Institution in Locality','Institution in Locality',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','a','Parallel Title','Parallel Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('510','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('512','a','Cover Title','Cover Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('512','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','a','Added Title - Page Title','Added Title - Page Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('513','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('514','a','Caption Title','Caption Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('514','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('515','a','Running Title','Running Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('516','a','Spine Title','Spine Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('516','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('517','a','Variant Title','Variant Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('517','e','Other Title Information','Other Title Information',0,0,'',5,'','',NULL,0,0,'','','',NULL,9999),('518','a','Title Proper, Variant Title or Uniform Title in Standard Modern Spelling','Title Proper, Variant Title or Uniform Title in Standard Modern Spelling',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','h','Number of Part','Number of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','i','Name of Part','Name of Part',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','j','Volume or Dates Associated with Title','Volume or Dates Associated with Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('518','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','a','Former Title Proper','Former Title Proper',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','e','Other Title Information','Other Title Information',1,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','h','Number of Part','Number of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','i','Name of Part','Name of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','j','Volumes or Dates of Former Title','Volumes or Dates of Former Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','n','Miscellaneous Information','Miscellaneous Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('520','x','ISSN of Former Title','ISSN of Former Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','a','Key Title','Key Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','b','Qualifier','Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','j','Volume or Dates Associated with Key Title','Volume or Dates Associated with Key Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('530','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','a','Abbreviated Title','Abbreviated Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','b','Qualifier','Qualifier',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('531','v','Volume Designation','Volume Designation',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('532','a','Expanded Title','Expanded Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('532','z','Language of Title','Language of Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('540','a','Additional Title Supplied by Cataloguer','Additional Title Supplied by Cataloguer',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','a','Translated Title Supplied by Cataloguer','Translated Title Supplied by Cataloguer',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','e','Other Title Information','Other Title Information',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','h','Number of Part','Number of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','i','Name of Part','Name of Part',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('541','z','Language of Translated Title','Language of Translated Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('545','a','Section Title','Section Title',0,0,'',5,'','','',0,-5,'','','',NULL,9999),('600','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','c','Additions to Name Other than Dates','Additions to Name Other than Dates',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','d','Roman Numerals','Roman Numerals',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','f','Dates','Dates',0,0,'',6,'','','',0,0,'','','',NULL,9999),('600','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('600','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','b','Subdivision (or Name if Entered under Place)','Subdivision (or Name if Entered under Place)',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','d','Number of Meeting','Number of Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','e','Location of Meeting','Location of Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','f','Date of Meeting','Date of Meeting',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','g','Inverted Element','Inverted Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('601','y','Geographical Subdivision','Geographical Subdivision',0,0,'',6,'','','',0,0,'','','',NULL,9999),('601','z','Chronological Subdivision','Chronological Subdivision',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','f','Dates','Dates',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('602','y','Geographical Subdivision','Geographical Subdivision',0,0,'',6,'','','',0,0,'','','',NULL,9999),('602','z','Chronological Subdivision','Chronological Subdivision',0,0,'',6,'','','',0,0,'','','',NULL,9999),('604','1','Linking Data','Linking Data',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','h','Number of Part','Number of Part',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','i','Name of Part','Name of Part',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','k','Date of Publication','Date of Publication',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','l','Form Subheading','Form Subheading',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','m','Language (when Part of Heading)','Language (when Part of Heading)',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','n','Miscellaneous Information','Miscellaneous Information',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','q','Version (or Date of Version)','Version (or Date of Version)',0,0,'',6,'','','',0,0,'','','',NULL,9999),('605','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('605','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('606','2','System Code','System Code',0,0,'',6,'','','',0,0,'',NULL,'','',9999),('606','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'',NULL,'','',9999),('606','9','Koha Internal code','Koha Internal code',0,0,'',6,'','','',0,1,'',NULL,'','',9999),('606','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'',NULL,'','',9999),('606','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'',NULL,'','',9999),('606','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'',NULL,'','',9999),('606','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'',NULL,'','',9999),('607','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('607','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('607','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('607','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('607','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','3','Authority Record Number','Authority Record Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','5','Institution to Which Field Applies','Institution to Which Field Applies',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','a','Entry Element','Entry Element',0,0,'',6,'','','',0,0,'','','',NULL,9999),('608','x','Topical Subdivision','Topical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','y','Geographical Subdivision','Geographical Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('608','z','Chronological Subdivision','Chronological Subdivision',1,0,'',6,'','','',0,0,'','','',NULL,9999),('610','a','Subject Term','Subject Term',0,0,'',6,'','','',0,0,'',NULL,'','',9999),('615','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('615','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('615','a','Subject Category Entry Element Text','Subject Category Entry Element Text',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','m','Subject Category Subdivision Text','Subject Category Subdivision Text',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','n','Subject Category Code','Subject Category Code',1,0,'',6,'','','',0,0,'','','',NULL,9999),('615','x','Subject Category Subdivision Code','Subject Category Subdivision Code',1,0,'',6,'','','',0,0,'','','',NULL,9999),('620','3','Authority Code Number','Authority Code Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','a','Country','Country',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','b','State or Province, etc.','State or Province, etc.',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','c','County','County',0,0,'',6,'','','',0,0,'','','',NULL,9999),('620','d','City','City',0,0,'',6,'','','',0,0,'','','',NULL,9999),('626','a','Make and Model of Machines','Make and Model of Machines',0,0,'',6,'','','',0,0,'','','',NULL,9999),('626','b','Programming Language','Programming Language',0,0,'',6,'','','',0,0,'','','',NULL,9999),('626','c','Operating System','Operating System',0,0,'',6,'','','',0,0,'','','',NULL,9999),('660','a','Geographic Area Code','Geographic Area Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('661','a','Time Period Code','Time Period Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','b','Subject Indicator Number','Subject Indicator Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','c','String','String',0,0,'',6,'','','',0,0,'','','',NULL,9999),('670','e','Reference Indicator Number','Reference Indicator Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('670','z','Language of Terms','Language of Terms',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','a','Number','Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','v','Edition','Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('675','z','Language of Edition','Language of Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('676','a','Number','Number',0,0,'biblioitems.dewey',6,'','','',0,0,'','','',NULL,9999),('676','v','Edition','Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('676','z','Language of Edition','Language of Edition',0,0,'',6,'','','',0,0,'','','',NULL,9999),('680','a','Class Number','Class Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('680','b','Book Number','Book Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('686','2','System Code','System Code',0,0,'',6,'','','',0,0,'','','',NULL,9999),('686','a','Class Number','Class Number',1,0,'',6,'','','',0,0,'','','',NULL,9999),('686','b','Book Number','Book Number',0,0,'',6,'','','',0,0,'','','',NULL,9999),('686','c','Classification Subdivision','Classification Subdivision',0,0,'',6,'','','',0,0,'','','',NULL,9999),('700','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,1,'','','',NULL,9999),('700','a','Entry Element','Entry Element',0,0,'',7,'','PER','',0,0,'','','',NULL,9999),('700','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('700','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('701','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','9','Koha Internal Code','Koha Internal Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','b','Part of Name Other than Entry Element','Part of Name Other than Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','c','Additions to Name Other than Dates','Additions to Name Other than Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','d','Roman Numerals','Roman Numerals',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','g','Expansion of Initials of Forename','Expansion of Initials of Forename',0,0,'',7,'','','',0,0,'','','',NULL,9999),('702','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','b','Subdivision','Subdivision',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','c','Additions to Name or Qualifier','Additions to Name or Qualifier',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','d','Number of Meeting','Number of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('710','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','b','Subdivision','Subdivision',1,0,'',7,'','','',0,0,'','','',NULL,9999),('711','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,'',7,'','','',0,0,'','','',NULL,9999),('711','d','Number of Meeting','Number of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('711','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','4','Relator Code','Relator Code',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','b','Subdivision','Subdivision',1,0,'',7,'','','',0,0,'','','',NULL,9999),('712','c','Additions to Name or Qualifier','Additions to Name or Qualifier',1,0,'',7,'','','',0,0,'','','',NULL,9999),('712','d','Number of Meeting','Number of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','e','Location of Meeting','Location of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','f','Date of Meeting','Date of Meeting',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','g','Inverted Element','Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','h','Part of Name Other than Entry Element and Inverted Element','Part of Name Other than Entry Element and Inverted Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('712','p','Affiliation/Address','Affiliation/Address',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('720','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('720','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('721','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('721','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('721','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('721','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','3','Authority Code Number','Authority Code Number',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','4','Relator Code','Relator Code',1,0,'',7,'','','',0,0,'','','',NULL,9999),('722','a','Entry Element','Entry Element',0,0,'',7,'','','',0,0,'','','',NULL,9999),('722','f','Dates','Dates',0,0,'',7,'','','',0,0,'','','',NULL,9999),('801','2','(*) code du format utilisé','(*) code du format utilisé',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','a','Country','Country',0,1,'',8,'','','',0,-5,'','','',NULL,9999),('801','b','Agency','Agency',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','c','Date of Transaction','Date of Transaction',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('801','g','Cataloguing Rules (Descriptive Conventions)','Cataloguing Rules (Descriptive Conventions)',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('802','a','ISSN Centre Code','ISSN Centre Code',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('830','a','Text of Note','Text of Note',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','a','Host Name','Host Name',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','b','Access Number','Access Number',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','c','Compression Information','Compression Information',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','d','Path','Path',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','e','Data and Hour of Consultation and Access','Data and Hour of Consultation and Access',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','f','Electronic Name','Electronic Name',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','g','Uniform Resource Name (URN)','Uniform Resource Name (URN)',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','h','Processor of Request','Processor of Request',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','i','Instruction','Instruction',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','j','Bits per Second','Bits per Second',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','k','Password','Password',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','l','Logon/login','Logon/login',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','m','Contact for Access Assistance','Contact for Access Assistance',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','n','Location of Host in Subfield $a','Location of Host in Subfield $a',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','o','Operating System','Operating System',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','p','Port','Port',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','q','Electronic Format Type','Electronic Format Type',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','r','Settings','Settings',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','s','File Size','File Size',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','t','Terminal Emulation','Terminal Emulation',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','u','URL','URL',1,0,'biblioitems.url',8,'','','',1,0,'','','',NULL,9999),('856','v','Hours Access Method Available','Hours Access Method Available',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','w','Record Control Number','Record Control Number',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','x','Nonpublic Note','Nonpublic Note',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','y','Access Method','Access Method',0,0,'',8,'','','',0,-5,'','','',NULL,9999),('856','z','Public Note','Public Note',1,0,'',8,'','','',0,-5,'','','',NULL,9999),('942','0','Koha issues (borrowed), all copies','Koha issues (borrowed), all copies',0,0,'biblioitems.totalissues',9,'','','',0,-5,'',NULL,'','',9999),('942','2','Source of classification or shelving scheme','Source of classification or shelving scheme',0,0,'biblioitems.cn_source',9,'','','',0,0,'',NULL,'','',9999),('942','6','Koha normalized classification for sorting','Koha normalized classification for sorting',0,0,'biblioitems.cn_sort',-1,'','','',0,7,'',NULL,'','',9999),('942','c','Koha item type','Koha item type',0,0,'biblioitems.itemtype',9,'itemtypes','','',0,0,'',NULL,'','',9999),('942','s','Serial record flag','Serial record',0,0,'biblio.serial',9,'','','',0,-5,'',NULL,'','',9999),('995','0','Withdrawn status','Withdrawn status',0,0,'items.wthdrawn',10,'','','',0,0,'',NULL,'','',9999),('995','2','Lost status','Lost status',0,0,'items.itemlost',10,'LOST','','',0,0,'',NULL,'','',9999),('995','3','Use restrictions','Use restrictions',0,0,'items.restricted',10,'RESTRICTED','','',0,0,'',NULL,'','',9999),('995','5','Date acquired','Coded location qualifier',0,0,'items.dateaccessioned',10,'','','',0,0,'',NULL,'','',9999),('995','6','Copy number','Copy number',0,0,'items.copynumber',10,'','','',0,0,'',NULL,'','',9999),('995','7','Uniform Resource Identifier','Uniform Resource Identifier',0,0,'items.uri',10,'','','',0,0,'',NULL,'','',9999),('995','9','Internal item number (Koha itemnumber, autogenerated)','Internal itemnumber (Koha itemnumber)',0,0,'items.itemnumber',-1,'','','',0,-5,'',NULL,'','',9999),('995','a','Origin of the item (home branch) (free text)','Origin of item (home branch) (free text)',0,0,'',10,'','','',0,0,'',NULL,'','',9999),('995','b','Origin of item (home branch) (coded)','Origin of item (home branch (coded)',0,0,'items.homebranch',10,'branches','','',0,-1,'',NULL,'','',9999),('995','c','Lending or holding organisation (holding branch) code','Lending or holding organisation (holding branch) code ',0,1,'items.holdingbranch',10,'branches','','',0,0,'',NULL,'','',9999),('995','d','Lending or holding organisation (holding branch) (free text)','Lending or holding organisation (holding branch) (free text)',0,0,'',10,'','','',0,-1,'',NULL,'','',9999),('995','e','Shelving location','Shelving location',0,0,'items.location',10,'LOC','','',0,0,'',NULL,'','',9999),('995','f','Barcode','Barcode',0,0,'items.barcode',10,'','','barcode.pl',0,0,'',NULL,'','',9999),('995','h','Koha collection','Koha collection',0,0,'items.ccode',10,'CCODE','','',0,0,'',NULL,'','',9999),('995','j','Inventory number','Inventory number',0,0,'',10,'','','',0,0,'',NULL,'','',9999),('995','k','Call number (full call number)','Call number (full call number)',0,0,'items.itemcallnumber',10,'','','',0,0,'',NULL,'','',9999),('995','l','Numbering (volume or other part)','Numbering (bound volume or other part)',0,0,'items.materials',10,'','','',0,0,'',NULL,'','',9999),('995','m','Date of loan or deposit','Date of loan or deposit',0,0,'items.datelastborrowed',10,'','','',0,-5,'',NULL,'','',9999),('995','n','Expiration of loan date','Expiration of loan date',0,0,'items.onloan',10,'','','',0,-1,'',NULL,'','',9999),('995','o','Circulation type (not for loan)','Circulation type (not for loan)',0,0,'items.notforloan',10,'','','',0,0,'',NULL,'','',9999),('995','r','Type of item and material','Type of item and material',0,1,'items.itype',10,'itemtypes','','',0,0,'',NULL,'','',9999),('995','u','Copy note','Copy note',0,0,'items.itemnotes',10,'','','',0,0,'',NULL,'','',9999),('995','v','Serial Enumeration / chronology','Serial Enumeration / chronology',0,0,'items.enumchron',10,'','','',0,-1,'',NULL,'','',9999);
/*!40000 ALTER TABLE `marc_subfield_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marc_tag_structure`
--

DROP TABLE IF EXISTS `marc_tag_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marc_tag_structure` (
  `tagfield` varchar(3) NOT NULL DEFAULT '',
  `liblibrarian` varchar(255) NOT NULL DEFAULT '',
  `libopac` varchar(255) NOT NULL DEFAULT '',
  `repeatable` tinyint(4) NOT NULL DEFAULT '0',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `authorised_value` varchar(10) DEFAULT NULL,
  `frameworkcode` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`frameworkcode`,`tagfield`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marc_tag_structure`
--

LOCK TABLES `marc_tag_structure` WRITE;
/*!40000 ALTER TABLE `marc_tag_structure` DISABLE KEYS */;
INSERT INTO `marc_tag_structure` VALUES ('000','Record Label','Record Label',0,1,'',''),('001','Record Identifier','Record Identifier',0,1,'',''),('005','Version Identifier','Version Identifier',0,0,'',''),('010','International Standard Book Number (ISBN)','International Standard Book Number (ISBN)',0,0,'',''),('011','International Standard Serial Number (ISSN)','International Standard Serial Number (ISSN)',0,0,'',''),('012','Fingerprint Identifier','Fingerprint Identifier',0,0,'',''),('013','International Standard Music Number (ISMN)','International Standard Music Number (ISMN)',0,0,'',''),('014','Article Identifier','Article Identifier',0,0,'',''),('020','National Bibliography Number','National Bibliography Number',0,0,'',''),('021','Legal Deposit Number','Legal Deposit Number',0,0,'',''),('022','Government Publication Number','Government Publication Number',0,0,'',''),('040','CODEN (Serials)','CODEN (Serials)',0,0,'',''),('071','Publisher\'s Number (Sound Recordings and Music)','',0,0,'',''),('090','System Control Numbers (Koha)','System Control Numbers (Koha)',0,0,'',''),('099','local dates','',0,0,'',''),('100','General Processing Data','General Processing Data',1,0,'',''),('101','Language of the Item','Language of the Item',1,0,'',''),('102','Country of Publication or Production','Country of Publication or Production',0,0,'',''),('105','Coded Data Field: Textual Material, Monographic','Coded Data Field: Textual Material, Monographic',0,0,'',''),('106','Coded Data Field: Textual Material - Physical Attributes','Coded Data Field: Textual Material - Physical Attributes',0,0,'',''),('110','Coded Data Field: Serials','Coded Data Field: Serials',0,0,'',''),('115','Coded Data Field: Visual Projections, Videorecordings, and Motion Pictures','Coded Data Field: Visual Projections, Videorecordings, and Motion Pictures',0,0,'',''),('116','Coded Data Field: Graphics','Coded Data Field: Graphics',0,0,'',''),('117','Coded Data Field: Three-Dimensional Artefacts and Realia','Coded Data Field: Three-Dimensional Artefacts and Realia',0,0,'',''),('120','Coded Data Field: Cartographic Materials - General','Coded Data Field: Cartographic Materials - General',0,0,'',''),('121','Coded Data Field: Cartographic Materials: Physical Attributes','Coded Data Field: Cartographic Materials: Physical Attributes',0,0,'',''),('122','Coded Data Field: Time Period of Item Content','Coded Data Field: Time Period of Item Content',0,0,'',''),('123','Coded Data Field: Cartographic Materials - Scale and Coordinates','Coded Data Field: Cartographic Materials - Scale and Coordinates',0,0,'',''),('124','Coded Data Field: Cartographic Material - Specific Material Designation Analysis','Coded Data Field: Cartographic Material - Specific Material Designation Analysis',0,0,'',''),('125','Coded Data Field: Sound Recordings and Printed Music','Coded Data Field: Sound Recordings and Printed Music',0,0,'',''),('126','Coded Data Field: Sound Recordings - Physical Attributes','Coded Data Field: Sound Recordings - Physical Attributes',0,0,'',''),('127','Coded Data Field: Duration of Sound Recordings and Printed Music','Coded Data Field: Duration of Sound Recordings and Printed Music',0,0,'',''),('128','Coded Data Field: Music Performances and Scores','Coded Data Field: Music Performances and Scores',0,0,'',''),('130','Coded Data Field: Microforms - Physical Attributes','Coded Data Field: Microforms - Physical Attributes',0,0,'',''),('131','Coded Data Field: Cartographic Materials - Geodetic, Grid and Vertical Measurement','Coded Data Field: Cartographic Materials - Geodetic, Grid and Vertical Measurement',0,0,'',''),('135','Coded Data Field: Computer Files','Coded Data Field: Computer Files',0,0,'',''),('140','Coded Data Field: Antiquarian - General','Coded Data Field: Antiquarian - General',0,0,'',''),('141','Coded Data Field: Antiquarian - Copy Specific Attributes','Coded Data Field: Antiquarian - Copy Specific Attributes',0,0,'',''),('200','Title and Statement of Responsibility','Title and Statement of Responsibility',1,1,'',''),('205','Edition Statement','Edition Statement',0,0,'',''),('206','Material Specific Area: Cartographic Materials - Mathematical Data','Material Specific Area: Cartographic Materials - Mathematical Data',0,0,'',''),('207','Material Specific Area: Serials Numbering','Material Specific Area: Serials Numbering',0,0,'',''),('208','Material Specific Area: Printed Music Specific Statement','Material Specific Area: Printed Music Specific Statement',0,0,'',''),('210','Publication, Distribution, etc.','Publication, Distribution, etc.',0,1,'',''),('211','Projected Publication Date','Projected Publication Date',0,0,'',''),('215','Physical Description','Physical Description',0,0,'',''),('225','Series','Series',0,0,'',''),('230','Material Specific Area: Computer File Characteristics','Material Specific Area: Computer File Characteristics',0,0,'',''),('300','General Notes','General Notes',0,0,'',''),('301','Notes Pertaining to Identification Numbers','Notes Pertaining to Identification Numbers',0,0,'',''),('302','Notes Pertaining to Coded Information','Notes Pertaining to Coded Information',0,0,'',''),('303','Notes Pertaining to Descriptive Information','Notes Pertaining to Descriptive Information',0,0,'',''),('304','Notes Pertaining to Title and Statement of Responsibility','Notes Pertaining to Title and Statement of Responsibility',0,0,'',''),('305','Notes Pertaining to Edition and Bibliographic History','Notes Pertaining to Edition and Bibliographic History',0,0,'',''),('306','Notes Pertaining to Publication, Distribution, etc.','Notes Pertaining to Publication, Distribution, etc.',0,0,'',''),('307','Notes Pertaining to Physical Description','Notes Pertaining to Physical Description',0,0,'',''),('308','Notes Pertaining to Series','Notes Pertaining to Series',0,0,'',''),('310','Notes Pertaining to Binding and Availability','Notes Pertaining to Binding and Availability',0,0,'',''),('311','Notes Pertaining to Linking Fields','Notes Pertaining to Linking Fields',0,0,'',''),('312','Notes Pertaining to Related Titles','Notes Pertaining to Related Titles',0,0,'',''),('313','Notes Pertaining to Subject Access','Notes Pertaining to Subject Access',0,0,'',''),('314','Notes Pertaining to Intellectual Responsibility','Notes Pertaining to Intellectual Responsibility',0,0,'',''),('315','Notes Pertaining to Material (or Type of Publication) Specific Information','Notes Pertaining to Material (or Type of Publication) Specific Information',0,0,'',''),('316','Notes Pertaining to Exemplar','Notes Pertaining to Exemplar',0,0,'',''),('317','Notes Pertaining to Origin of Item','Notes Pertaining to Origin of Item',0,0,'',''),('318','Action Note','Action Note',0,0,'',''),('320','Notes Pertaining to Internal Bibliographies/Notes Pertaining to Indexes','Notes Pertaining to Internal Bibliographies/Notes Pertaining to Indexes',0,0,'',''),('321','Notes Pertaining to External Indexes/ Notes Pertaining References','Notes Pertaining to External Indexes/ Notes Pertaining References',0,0,'',''),('322','Notes Pertaining to Credits (Projected and Video Material and Sound Recordings)','Notes Pertaining to Credits (Projected and Video Material and Sound Recordings)',0,0,'',''),('323','Notes Pertaining to Cast (Projected and Video Material and Sound Recordings)','Notes Pertaining to Cast (Projected and Video Material and Sound Recordings)',0,0,'',''),('324','Notes Pertaining to Original Work','Notes Pertaining to Original Work',0,0,'',''),('325','Notes Pertaining to Reproduction of Work','Notes Pertaining to Reproduction of Work',0,0,'',''),('326','Notes Pertaining to Frequency Statement (Serials)','Notes Pertaining to Frequency Statement (Serials)',0,0,'',''),('327','Notes Pertaining to Content','Notes Pertaining to Content',0,0,'',''),('328','Notes Pertaining to Dissertations (Thesis)','Notes Pertaining to Dissertations (Thesis)',0,0,'',''),('330','Summary or Abstract','Summary or Abstract',0,0,'',''),('332','Preferred Citation of Described Materials','Preferred Citation of Described Materials',0,0,'',''),('333','Notes Pertaining to Users/Intended Audience','Notes Pertaining to Users/Intended Audience',0,0,'',''),('336','Notes Pertaining to Type of Computer File','Notes Pertaining to Type of Computer File',0,0,'',''),('337','Notes Pertaining to Technical Details (Computer Files)','Notes Pertaining to Technical Details (Computer Files)',0,0,'',''),('345','Notes Pertaining to Acquisition Information','Notes Pertaining to Acquisition Information',0,0,'',''),('410','Series','Series',0,0,'',''),('411','Sub-Series','Sub-Series',0,0,'',''),('421','Supplement','Supplement',0,0,'',''),('422','Parent of Supplement','Parent of Supplement',0,0,'',''),('423','Issued with','Issued with',0,0,'',''),('430','Continues','Continues',0,0,'',''),('431','Continues in Part','Continues in Part',0,0,'',''),('432','Supersedes','Supersedes',0,0,'',''),('433','Supersedes in Part','Supersedes in Part',0,0,'',''),('434','Absorbed','Absorbed',0,0,'',''),('435','Absorbed in Part','Absorbed in Part',0,0,'',''),('436','Formed by Merger of ..., ... and ...','Formed by Merger of ..., ... and ...',0,0,'',''),('437','Separated from','Separated from',0,0,'',''),('440','Continued by','Continued by',0,0,'',''),('441','Continued in Part by','Continued in Part by',0,0,'',''),('442','Superseded by','Superseded by',0,0,'',''),('443','Superseded in Part by','Superseded in Part by',0,0,'',''),('444','Absorbed by','Absorbed by',0,0,'',''),('445','Absorbed in Part by','Absorbed in Part by',0,0,'',''),('446','Split into ..., ..., and ...','Split into ..., ..., and ...',0,0,'',''),('447','Merged with ..., ..., and ... to Form','Merged with ..., ..., and ... to Form',0,0,'',''),('448','Changed Back to','Changed Back to',0,0,'',''),('451','Other Edition in the Same Medium','Other Edition in the Same Medium',0,0,'',''),('452','Other Edition in the Another Medium','Other Edition in the Another Medium',0,0,'',''),('453','Translated as','Translated as',0,0,'',''),('454','Translation of','Translation of',0,0,'',''),('455','Reproduction of','Reproduction of',0,0,'',''),('456','Reproduced as','Reproduced as',0,0,'',''),('461','Level (Set)','Level (Set)',0,0,'',''),('462','Level (Subset)','Level (Subset)',0,0,'',''),('463','Level (Piece)','Level (Piece)',0,0,'',''),('464','Level (Piece-Analytic)','Level (Piece-Analytic)',0,0,'',''),('470','Item reviewed','Item reviewed',0,0,'',''),('481','Also Bound in this Volume','Also Bound in this Volume',0,0,'',''),('482','Bound With','Bound With',0,0,'',''),('488','Other Related Work','Other Related Work',0,0,'',''),('500','Uniform Title','Uniform Title',0,0,'',''),('501','Collective Uniform Title','Collective Uniform Title',0,0,'',''),('503','Uniform Conventional Heading','Uniform Conventional Heading',0,0,'',''),('510','Palellel Title Proper','Palellel Title Proper',0,0,'',''),('512','Cover Title','Cover Title',0,0,'',''),('513','Added Title - Page Title','Added Title - Page Title',0,0,'',''),('514','Caption Title','Caption Title',0,0,'',''),('515','Running Title','Running Title',0,0,'',''),('516','Spine Title','Spine Title',0,0,'',''),('517','Other Variant Titles','Other Variant Titles',0,0,'',''),('518','Title in Standard Modern Spelling','Title in Standard Modern Spelling',0,0,'',''),('520','Former Title (Serials)','Former Title (Serials)',0,0,'',''),('530','Key Title (Serials)','Key Title (Serials)',0,0,'',''),('531','Abbreviated Title (Serials)','Abbreviated Title (Serials)',0,0,'',''),('532','Expanded Title','Expanded Title',0,0,'',''),('540','Additional Title Supplied by Cataloguer','Additional Title Supplied by Cataloguer',0,0,'',''),('541','Translated Title Supplied by Cataloguer','Translated Title Supplied by Cataloguer',0,0,'',''),('545','Section Title','Section Title',0,0,'',''),('600','Personal Name Used as Subject','Personal Name Used as Subject',0,0,'',''),('601','Corporate Body Used as Subject','Corporate Body Used as Subject',0,0,'',''),('602','Family Name Used as Subject','Family Name Used as Subject',0,0,'',''),('604','Name and Title Used as Subject','Name and Title Used as Subject',0,0,'',''),('605','Title Used as Subject','Title Used as Subject',0,0,'',''),('606','Topical Name Used as Subject','Topical Name Used as Subject',0,0,'',''),('607','Geographical Name Used as Subject','Geographical Name Used as Subject',0,0,'',''),('608','Form, Genre of Phyisical Characteristics Heading','Form, Genre of Phyisical Characteristics Heading',0,0,'',''),('610','Uncontrolled Subject Terms','Uncontrolled Subject Terms',0,0,'',''),('615','Subject Category','Subject Category',0,0,'',''),('620','Place Access','Place Access',0,0,'',''),('626','Technical Details Access (Computer Files)','Technical Details Access (Computer Files)',0,0,'',''),('660','Geographic Area Code','Geographic Area Code',0,0,'',''),('661','Time Period Code','Time Period Code',0,0,'',''),('670','PRECIS','PRECIS',0,0,'',''),('675','Universal Decimal Classification (UDC)','Universal Decimal Classification (UDC)',0,0,'',''),('676','Dewey Decimal Classification','Dewey Decimal Classification',0,0,'',''),('680','Library of Congress Classification','Library of Congress Classification',0,0,'',''),('686','Other Class Numbers','Other Class Numbers',0,0,'',''),('700','Personal Name - Primary Intellectual Responsibility','Personal Name - Primary Intellectual Responsibility',0,0,'',''),('701','Personal Name - Alternative Intellectual Responsibility','Personal Name - Alternative Intellectual Responsibility',0,0,'',''),('702','Personal Name - Secondary Intellectual Responsibility','Personal Name - Secondary Intellectual Responsibility',0,0,'',''),('710','Corporate Body - Primary Intellectual Responsibility','Corporate Body - Primary Intellectual Responsibility',0,0,'',''),('711','Corporate Body - Alternative Intellectual Responsibility','Corporate Body - Alternative Intellectual Responsibility',0,0,'',''),('712','Corporate Body - Secondary Intellectual Responsibility','Corporate Body - Secondary Intellectual Responsibility',0,0,'',''),('720','Family Name - Primary Intellectual Responsibility','Family Name - Primary Intellectual Responsibility',0,0,'',''),('721','Family Name - Alternative Intellectual Responsibility','Family Name - Alternative Intellectual Responsibility',0,0,'',''),('722','Family Name - Secondary Intellectual Responsibility','Family Name - Secondary Intellectual Responsibility',0,0,'',''),('801','Originating Source','Originating Source',1,0,'',''),('802','ISSN Centre','ISSN Centre',0,0,'',''),('830','General Cataloguer&#039s Note','General Cataloguer&#039s Note',0,0,'',''),('856','Electronic Location and Access','Electronic Location and Access',0,0,'',''),('942','ADDED ENTRY ELEMENTS (KOHA)','ADDED ENTRY ELEMENTS (KOHA)',0,0,'',''),('995','Location and Item Information (Koha)','Location and Item Information (Koha)',0,0,'','');
/*!40000 ALTER TABLE `marc_tag_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchchecks`
--

DROP TABLE IF EXISTS `matchchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchchecks` (
  `matcher_id` int(11) NOT NULL,
  `matchcheck_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_matchpoint_id` int(11) NOT NULL,
  `target_matchpoint_id` int(11) NOT NULL,
  PRIMARY KEY (`matchcheck_id`),
  KEY `matcher_matchchecks_ifbk_1` (`matcher_id`),
  KEY `matcher_matchchecks_ifbk_2` (`source_matchpoint_id`),
  KEY `matcher_matchchecks_ifbk_3` (`target_matchpoint_id`),
  CONSTRAINT `matcher_matchchecks_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchchecks_ifbk_2` FOREIGN KEY (`source_matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchchecks_ifbk_3` FOREIGN KEY (`target_matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchchecks`
--

LOCK TABLES `matchchecks` WRITE;
/*!40000 ALTER TABLE `matchchecks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matcher_matchpoints`
--

DROP TABLE IF EXISTS `matcher_matchpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matcher_matchpoints` (
  `matcher_id` int(11) NOT NULL,
  `matchpoint_id` int(11) NOT NULL,
  KEY `matcher_matchpoints_ifbk_1` (`matcher_id`),
  KEY `matcher_matchpoints_ifbk_2` (`matchpoint_id`),
  CONSTRAINT `matcher_matchpoints_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matcher_matchpoints_ifbk_2` FOREIGN KEY (`matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matcher_matchpoints`
--

LOCK TABLES `matcher_matchpoints` WRITE;
/*!40000 ALTER TABLE `matcher_matchpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `matcher_matchpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoint_component_norms`
--

DROP TABLE IF EXISTS `matchpoint_component_norms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoint_component_norms` (
  `matchpoint_component_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `norm_routine` varchar(50) NOT NULL DEFAULT '',
  KEY `matchpoint_component_norms` (`matchpoint_component_id`,`sequence`),
  CONSTRAINT `matchpoint_component_norms_ifbk_1` FOREIGN KEY (`matchpoint_component_id`) REFERENCES `matchpoint_components` (`matchpoint_component_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoint_component_norms`
--

LOCK TABLES `matchpoint_component_norms` WRITE;
/*!40000 ALTER TABLE `matchpoint_component_norms` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoint_component_norms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoint_components`
--

DROP TABLE IF EXISTS `matchpoint_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoint_components` (
  `matchpoint_id` int(11) NOT NULL,
  `matchpoint_component_id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(3) NOT NULL DEFAULT '',
  `subfields` varchar(40) NOT NULL DEFAULT '',
  `offset` int(4) NOT NULL DEFAULT '0',
  `length` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchpoint_component_id`),
  KEY `by_sequence` (`matchpoint_id`,`sequence`),
  CONSTRAINT `matchpoint_components_ifbk_1` FOREIGN KEY (`matchpoint_id`) REFERENCES `matchpoints` (`matchpoint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoint_components`
--

LOCK TABLES `matchpoint_components` WRITE;
/*!40000 ALTER TABLE `matchpoint_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoint_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchpoints`
--

DROP TABLE IF EXISTS `matchpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchpoints` (
  `matcher_id` int(11) NOT NULL,
  `matchpoint_id` int(11) NOT NULL AUTO_INCREMENT,
  `search_index` varchar(30) NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchpoint_id`),
  KEY `matchpoints_ifbk_1` (`matcher_id`),
  CONSTRAINT `matchpoints_ifbk_1` FOREIGN KEY (`matcher_id`) REFERENCES `marc_matchers` (`matcher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchpoints`
--

LOCK TABLES `matchpoints` WRITE;
/*!40000 ALTER TABLE `matchpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_attributes`
--

DROP TABLE IF EXISTS `message_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_attributes` (
  `message_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_name` varchar(40) NOT NULL DEFAULT '',
  `takes_days` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_attribute_id`),
  UNIQUE KEY `message_name` (`message_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_attributes`
--

LOCK TABLES `message_attributes` WRITE;
/*!40000 ALTER TABLE `message_attributes` DISABLE KEYS */;
INSERT INTO `message_attributes` VALUES (1,'Item_Due',0),(2,'Advance_Notice',1),(4,'Hold_Filled',0),(5,'Item_Check_in',0),(6,'Item_Checkout',0);
/*!40000 ALTER TABLE `message_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_queue`
--

DROP TABLE IF EXISTS `message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `subject` text,
  `content` text,
  `metadata` text,
  `letter_code` varchar(64) DEFAULT NULL,
  `message_transport_type` varchar(20) NOT NULL,
  `status` enum('sent','pending','failed','deleted') NOT NULL DEFAULT 'pending',
  `time_queued` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_address` mediumtext,
  `from_address` mediumtext,
  `content_type` text,
  KEY `message_id` (`message_id`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `message_transport_type` (`message_transport_type`),
  CONSTRAINT `messageq_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messageq_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_queue`
--

LOCK TABLES `message_queue` WRITE;
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_transport_types`
--

DROP TABLE IF EXISTS `message_transport_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_transport_types` (
  `message_transport_type` varchar(20) NOT NULL,
  PRIMARY KEY (`message_transport_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_transport_types`
--

LOCK TABLES `message_transport_types` WRITE;
/*!40000 ALTER TABLE `message_transport_types` DISABLE KEYS */;
INSERT INTO `message_transport_types` VALUES ('email'),('feed'),('print'),('sms');
/*!40000 ALTER TABLE `message_transport_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_transports`
--

DROP TABLE IF EXISTS `message_transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_transports` (
  `message_attribute_id` int(11) NOT NULL,
  `message_transport_type` varchar(20) NOT NULL,
  `is_digest` tinyint(1) NOT NULL DEFAULT '0',
  `letter_module` varchar(20) NOT NULL DEFAULT '',
  `letter_code` varchar(20) NOT NULL DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_attribute_id`,`message_transport_type`,`is_digest`),
  KEY `message_transport_type` (`message_transport_type`),
  KEY `letter_module` (`letter_module`,`letter_code`),
  KEY `message_transports_ibfk_3` (`letter_module`,`letter_code`,`branchcode`),
  CONSTRAINT `message_transports_ibfk_1` FOREIGN KEY (`message_attribute_id`) REFERENCES `message_attributes` (`message_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_transports_ibfk_2` FOREIGN KEY (`message_transport_type`) REFERENCES `message_transport_types` (`message_transport_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_transports_ibfk_3` FOREIGN KEY (`letter_module`, `letter_code`, `branchcode`) REFERENCES `letter` (`module`, `code`, `branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_transports`
--

LOCK TABLES `message_transports` WRITE;
/*!40000 ALTER TABLE `message_transports` DISABLE KEYS */;
INSERT INTO `message_transports` VALUES (5,'email',0,'circulation','CHECKIN',''),(5,'sms',0,'circulation','CHECKIN',''),(6,'email',0,'circulation','CHECKOUT',''),(6,'sms',0,'circulation','CHECKOUT',''),(1,'email',0,'circulation','DUE',''),(1,'sms',0,'circulation','DUE',''),(1,'email',1,'circulation','DUEDGST',''),(1,'sms',1,'circulation','DUEDGST',''),(2,'email',0,'circulation','PREDUE',''),(2,'sms',0,'circulation','PREDUE',''),(2,'email',1,'circulation','PREDUEDGST',''),(2,'sms',1,'circulation','PREDUEDGST',''),(4,'email',0,'reserves','HOLD',''),(4,'sms',0,'reserves','HOLD','');
/*!40000 ALTER TABLE `message_transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `message_type` varchar(1) NOT NULL,
  `message` text NOT NULL,
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `need_merge_authorities`
--

DROP TABLE IF EXISTS `need_merge_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `need_merge_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` bigint(20) NOT NULL,
  `done` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `need_merge_authorities`
--

LOCK TABLES `need_merge_authorities` WRITE;
/*!40000 ALTER TABLE `need_merge_authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `need_merge_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifys`
--

DROP TABLE IF EXISTS `notifys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifys` (
  `notify_id` int(11) NOT NULL DEFAULT '0',
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `itemnumber` int(11) NOT NULL DEFAULT '0',
  `notify_date` date DEFAULT NULL,
  `notify_send_date` date DEFAULT NULL,
  `notify_level` int(1) NOT NULL DEFAULT '0',
  `method` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifys`
--

LOCK TABLES `notifys` WRITE;
/*!40000 ALTER TABLE `notifys` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nozebra`
--

DROP TABLE IF EXISTS `nozebra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nozebra` (
  `server` varchar(20) NOT NULL,
  `indexname` varchar(40) NOT NULL,
  `value` varchar(250) NOT NULL,
  `biblionumbers` longtext NOT NULL,
  KEY `indexname` (`server`,`indexname`),
  KEY `value` (`server`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nozebra`
--

LOCK TABLES `nozebra` WRITE;
/*!40000 ALTER TABLE `nozebra` DISABLE KEYS */;
/*!40000 ALTER TABLE `nozebra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets`
--

DROP TABLE IF EXISTS `oai_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spec` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets`
--

LOCK TABLES `oai_sets` WRITE;
/*!40000 ALTER TABLE `oai_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_biblios`
--

DROP TABLE IF EXISTS `oai_sets_biblios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_biblios` (
  `biblionumber` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  PRIMARY KEY (`biblionumber`,`set_id`),
  KEY `oai_sets_biblios_ibfk_2` (`set_id`),
  CONSTRAINT `oai_sets_biblios_ibfk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oai_sets_biblios_ibfk_2` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_biblios`
--

LOCK TABLES `oai_sets_biblios` WRITE;
/*!40000 ALTER TABLE `oai_sets_biblios` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_biblios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_descriptions`
--

DROP TABLE IF EXISTS `oai_sets_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_descriptions` (
  `set_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  KEY `oai_sets_descriptions_ibfk_1` (`set_id`),
  CONSTRAINT `oai_sets_descriptions_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_descriptions`
--

LOCK TABLES `oai_sets_descriptions` WRITE;
/*!40000 ALTER TABLE `oai_sets_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_sets_mappings`
--

DROP TABLE IF EXISTS `oai_sets_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_sets_mappings` (
  `set_id` int(11) NOT NULL,
  `marcfield` char(3) NOT NULL,
  `marcsubfield` char(1) NOT NULL,
  `marcvalue` varchar(80) NOT NULL,
  KEY `oai_sets_mappings_ibfk_1` (`set_id`),
  CONSTRAINT `oai_sets_mappings_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `oai_sets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_sets_mappings`
--

LOCK TABLES `oai_sets_mappings` WRITE;
/*!40000 ALTER TABLE `oai_sets_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_sets_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_issues`
--

DROP TABLE IF EXISTS `old_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_issues` (
  `borrowernumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `issuingbranch` varchar(18) DEFAULT NULL,
  `returndate` datetime DEFAULT NULL,
  `lastreneweddate` datetime DEFAULT NULL,
  `return` varchar(4) DEFAULT NULL,
  `renewals` tinyint(4) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `issuedate` datetime DEFAULT NULL,
  KEY `old_issuesborridx` (`borrowernumber`),
  KEY `old_issuesitemidx` (`itemnumber`),
  KEY `old_bordate` (`borrowernumber`,`timestamp`),
  CONSTRAINT `old_issues_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_issues_ibfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_issues`
--

LOCK TABLES `old_issues` WRITE;
/*!40000 ALTER TABLE `old_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_reserves`
--

DROP TABLE IF EXISTS `old_reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_reserves` (
  `borrowernumber` int(11) DEFAULT NULL,
  `reservedate` date DEFAULT NULL,
  `biblionumber` int(11) DEFAULT NULL,
  `constrainttype` varchar(1) DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `notificationdate` date DEFAULT NULL,
  `reminderdate` date DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `reservenotes` mediumtext,
  `priority` smallint(6) DEFAULT NULL,
  `found` varchar(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemnumber` int(11) DEFAULT NULL,
  `waitingdate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `lowestPriority` tinyint(1) NOT NULL,
  `suspend` tinyint(1) NOT NULL DEFAULT '0',
  `suspend_until` datetime DEFAULT NULL,
  KEY `old_reserves_borrowernumber` (`borrowernumber`),
  KEY `old_reserves_biblionumber` (`biblionumber`),
  KEY `old_reserves_itemnumber` (`itemnumber`),
  KEY `old_reserves_branchcode` (`branchcode`),
  CONSTRAINT `old_reserves_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_reserves_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `old_reserves_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_reserves`
--

LOCK TABLES `old_reserves` WRITE;
/*!40000 ALTER TABLE `old_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opac_news`
--

DROP TABLE IF EXISTS `opac_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opac_news` (
  `idnew` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `new` text NOT NULL,
  `lang` varchar(25) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expirationdate` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnew`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opac_news`
--

LOCK TABLES `opac_news` WRITE;
/*!40000 ALTER TABLE `opac_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `opac_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overduerules`
--

DROP TABLE IF EXISTS `overduerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overduerules` (
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `categorycode` varchar(10) NOT NULL DEFAULT '',
  `delay1` int(4) DEFAULT NULL,
  `letter1` varchar(20) DEFAULT NULL,
  `debarred1` varchar(1) DEFAULT '0',
  `delay2` int(4) DEFAULT NULL,
  `debarred2` varchar(1) DEFAULT '0',
  `letter2` varchar(20) DEFAULT NULL,
  `delay3` int(4) DEFAULT NULL,
  `letter3` varchar(20) DEFAULT NULL,
  `debarred3` int(1) DEFAULT '0',
  PRIMARY KEY (`branchcode`,`categorycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overduerules`
--

LOCK TABLES `overduerules` WRITE;
/*!40000 ALTER TABLE `overduerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `overduerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patroncards`
--

DROP TABLE IF EXISTS `patroncards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patroncards` (
  `cardid` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(10) NOT NULL DEFAULT '1',
  `borrowernumber` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cardid`),
  KEY `patroncards_ibfk_1` (`borrowernumber`),
  CONSTRAINT `patroncards_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patroncards`
--

LOCK TABLES `patroncards` WRITE;
/*!40000 ALTER TABLE `patroncards` DISABLE KEYS */;
/*!40000 ALTER TABLE `patroncards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patronimage`
--

DROP TABLE IF EXISTS `patronimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patronimage` (
  `cardnumber` varchar(16) NOT NULL,
  `mimetype` varchar(15) NOT NULL,
  `imagefile` mediumblob NOT NULL,
  PRIMARY KEY (`cardnumber`),
  CONSTRAINT `patronimage_fk1` FOREIGN KEY (`cardnumber`) REFERENCES `borrowers` (`cardnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patronimage`
--

LOCK TABLES `patronimage` WRITE;
/*!40000 ALTER TABLE `patronimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `patronimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_offline_operations`
--

DROP TABLE IF EXISTS `pending_offline_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_offline_operations` (
  `operationid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `branchcode` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(10) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `cardnumber` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`operationid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_offline_operations`
--

LOCK TABLES `pending_offline_operations` WRITE;
/*!40000 ALTER TABLE `pending_offline_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_offline_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `module_bit` int(11) NOT NULL DEFAULT '0',
  `code` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_bit`,`code`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`module_bit`) REFERENCES `userflags` (`bit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'circulate_remaining_permissions','Remaining circulation permissions'),(1,'override_renewals','Override blocked renewals'),(6,'modify_holds_priority','Modify holds priority'),(6,'place_holds','Place holds for patrons'),(9,'edit_catalogue','Edit catalog (Modify bibliographic/holdings data)'),(9,'edit_items','Edit Items'),(9,'fast_cataloging','Fast cataloging'),(11,'budget_add_del','Add and delete budgets (but cant modify budgets)'),(11,'budget_manage','Manage budgets'),(11,'budget_modify','Modify budget (can\'t create lines, but can modify existing ones)'),(11,'contracts_manage','Manage contracts'),(11,'group_manage','Manage orders & basketgroups'),(11,'order_manage','Manage orders & basket'),(11,'order_receive','Manage orders & basket'),(11,'period_manage','Manage periods'),(11,'planning_manage','Manage budget plannings'),(11,'vendors_manage','Manage vendors'),(13,'batch_upload_patron_images','Upload patron images in batch or one at a time'),(13,'delete_anonymize_patrons','Delete old borrowers and anonymize circulation history (deletes borrower reading history)'),(13,'edit_calendar','Define days when the library is closed'),(13,'edit_news','Write news for the OPAC and staff interfaces'),(13,'edit_notices','Define notices'),(13,'edit_notice_status_triggers','Set notice/status triggers for overdue items'),(13,'export_catalog','Export bibliographic and holdings data'),(13,'import_patrons','Import patron data'),(13,'inventory','Perform inventory (stocktaking) of your catalog'),(13,'items_batchdel','Perform batch deletion of items'),(13,'items_batchmod','Perform batch modification of items'),(13,'label_creator','Create printable labels and barcodes from catalog and patron data'),(13,'manage_csv_profiles','Manage CSV export profiles'),(13,'manage_staged_marc','Managed staged MARC records, including completing and reversing imports'),(13,'moderate_comments','Moderate patron comments'),(13,'moderate_tags','Moderate patron tags'),(13,'rotating_collections','Manage rotating collections'),(13,'schedule_tasks','Schedule tasks to run'),(13,'stage_marc_import','Stage MARC records into the reservoir'),(13,'upload_local_cover_images','Upload local cover images'),(13,'view_system_logs','Browse the system logs'),(15,'check_expiration','Check the expiration of a serial'),(15,'claim_serials','Claim missing serials'),(15,'create_subscription','Create a new subscription'),(15,'delete_subscription','Delete an existing subscription'),(15,'edit_subscription','Edit an existing subscription'),(15,'receive_serials','Serials receiving'),(15,'renew_subscription','Renew a subscription'),(15,'routing','Routing'),(16,'create_reports','Create SQL Reports'),(16,'execute_reports','Execute SQL reports');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `printername` varchar(40) NOT NULL DEFAULT '',
  `printqueue` varchar(20) DEFAULT NULL,
  `printtype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`printername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers_profile`
--

DROP TABLE IF EXISTS `printers_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers_profile` (
  `profile_id` int(4) NOT NULL AUTO_INCREMENT,
  `printer_name` varchar(40) NOT NULL DEFAULT 'Default Printer',
  `template_id` int(4) NOT NULL DEFAULT '0',
  `paper_bin` varchar(20) NOT NULL DEFAULT 'Bypass',
  `offset_horz` float NOT NULL DEFAULT '0',
  `offset_vert` float NOT NULL DEFAULT '0',
  `creep_horz` float NOT NULL DEFAULT '0',
  `creep_vert` float NOT NULL DEFAULT '0',
  `units` char(20) NOT NULL DEFAULT 'POINT',
  `creator` char(15) NOT NULL DEFAULT 'Labels',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `printername` (`printer_name`,`template_id`,`paper_bin`,`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers_profile`
--

LOCK TABLES `printers_profile` WRITE;
/*!40000 ALTER TABLE `printers_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `rating_value` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`borrowernumber`,`biblionumber`),
  KEY `ratings_ibfk_2` (`biblionumber`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeatable_holidays`
--

DROP TABLE IF EXISTS `repeatable_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeatable_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `weekday` smallint(6) DEFAULT NULL,
  `day` smallint(6) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeatable_holidays`
--

LOCK TABLES `repeatable_holidays` WRITE;
/*!40000 ALTER TABLE `repeatable_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `repeatable_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_dictionary`
--

DROP TABLE IF EXISTS `reports_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `saved_sql` text,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_dictionary`
--

LOCK TABLES `reports_dictionary` WRITE;
/*!40000 ALTER TABLE `reports_dictionary` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserveconstraints`
--

DROP TABLE IF EXISTS `reserveconstraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserveconstraints` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `reservedate` date DEFAULT NULL,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `biblioitemnumber` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserveconstraints`
--

LOCK TABLES `reserveconstraints` WRITE;
/*!40000 ALTER TABLE `reserveconstraints` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserveconstraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `reservedate` date DEFAULT NULL,
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `constrainttype` varchar(1) DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `notificationdate` date DEFAULT NULL,
  `reminderdate` date DEFAULT NULL,
  `cancellationdate` date DEFAULT NULL,
  `reservenotes` mediumtext,
  `priority` smallint(6) DEFAULT NULL,
  `found` varchar(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemnumber` int(11) DEFAULT NULL,
  `waitingdate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `lowestPriority` tinyint(1) NOT NULL,
  `suspend` tinyint(1) NOT NULL DEFAULT '0',
  `suspend_until` datetime DEFAULT NULL,
  KEY `priorityfoundidx` (`priority`,`found`),
  KEY `borrowernumber` (`borrowernumber`),
  KEY `biblionumber` (`biblionumber`),
  KEY `itemnumber` (`itemnumber`),
  KEY `branchcode` (`branchcode`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`branchcode`) REFERENCES `branches` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (5,'2013-04-30',3,'a','MPL',NULL,NULL,NULL,'',1,NULL,'2013-04-30 08:59:07',7,NULL,NULL,0,0,NULL),(3,'2013-04-30',1,'a','MPL',NULL,NULL,NULL,'',1,NULL,'2013-04-30 08:59:41',1,NULL,NULL,0,0,NULL),(3,'2013-04-30',2,'a','MPL',NULL,NULL,NULL,'',1,NULL,'2013-04-30 09:00:23',4,NULL,NULL,0,0,NULL),(3,'2013-04-30',3,'a','MPL',NULL,NULL,NULL,'',2,NULL,'2013-04-30 09:00:53',7,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviewid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `biblionumber` int(11) DEFAULT NULL,
  `review` text,
  `approved` tinyint(4) DEFAULT NULL,
  `datereviewed` datetime DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `reviews_ibfk_1` (`borrowernumber`),
  KEY `reviews_ibfk_2` (`biblionumber`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roadtype`
--

DROP TABLE IF EXISTS `roadtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roadtype` (
  `roadtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `road_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`roadtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roadtype`
--

LOCK TABLES `roadtype` WRITE;
/*!40000 ALTER TABLE `roadtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `roadtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_reports`
--

DROP TABLE IF EXISTS `saved_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `report` longtext,
  `date_run` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_reports`
--

LOCK TABLES `saved_reports` WRITE;
/*!40000 ALTER TABLE `saved_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_sql`
--

DROP TABLE IF EXISTS `saved_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `savedsql` text,
  `last_run` datetime DEFAULT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `boridx` (`borrowernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_sql`
--

LOCK TABLES `saved_sql` WRITE;
/*!40000 ALTER TABLE `saved_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_history` (
  `userid` int(11) NOT NULL,
  `sessionid` varchar(32) NOT NULL,
  `query_desc` varchar(255) NOT NULL,
  `query_cgi` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `userid` (`userid`),
  KEY `sessionid` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Opac search history results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serial`
--

DROP TABLE IF EXISTS `serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serial` (
  `serialid` int(11) NOT NULL AUTO_INCREMENT,
  `biblionumber` varchar(100) NOT NULL DEFAULT '',
  `subscriptionid` varchar(100) NOT NULL DEFAULT '',
  `serialseq` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `planneddate` date DEFAULT NULL,
  `notes` text,
  `publisheddate` date DEFAULT NULL,
  `itemnumber` text,
  `claimdate` date DEFAULT NULL,
  `routingnotes` text,
  PRIMARY KEY (`serialid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serial`
--

LOCK TABLES `serial` WRITE;
/*!40000 ALTER TABLE `serial` DISABLE KEYS */;
/*!40000 ALTER TABLE `serial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialitems`
--

DROP TABLE IF EXISTS `serialitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialitems` (
  `itemnumber` int(11) NOT NULL,
  `serialid` int(11) NOT NULL,
  UNIQUE KEY `serialitemsidx` (`itemnumber`),
  KEY `serialitems_sfk_1` (`serialid`),
  CONSTRAINT `serialitems_sfk_1` FOREIGN KEY (`serialid`) REFERENCES `serial` (`serialid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serialitems_sfk_2` FOREIGN KEY (`itemnumber`) REFERENCES `items` (`itemnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialitems`
--

LOCK TABLES `serialitems` WRITE;
/*!40000 ALTER TABLE `serialitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_throttle`
--

DROP TABLE IF EXISTS `services_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_throttle` (
  `service_type` varchar(10) NOT NULL DEFAULT '',
  `service_count` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_throttle`
--

LOCK TABLES `services_throttle` WRITE;
/*!40000 ALTER TABLE `services_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `a_session` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('727fbe479f6f21be768589168ecb35b8','--- \n_SESSION_ATIME: \'1367328080\'\n_SESSION_CTIME: \'1367325528\'\n_SESSION_ID: 727fbe479f6f21be768589168ecb35b8\n_SESSION_REMOTE_ADDR: 127.0.0.1\nbranch: MPL\nbranchname: Midway\ncardnumber: 1\nemailaddress: \'\'\nfirstname: Koha\nflags: 1\nid: admin\nip: 127.0.0.1\nlasttime: \'1367328080\'\nnumber: 1\nsurname: Admin\n'),('76a8062e231600d90e02aecebe17930c','--- \n_SESSION_ATIME: \'1367312485\'\n_SESSION_CTIME: \'1367311931\'\n_SESSION_ID: 76a8062e231600d90e02aecebe17930c\n_SESSION_REMOTE_ADDR: 127.0.0.1\nbranch: MPL\nbranchname: Midway\ncardnumber: 1\nemailaddress: \'\'\nfirstname: Koha\nflags: 1\nid: admin\nip: 127.0.0.1\nlasttime: \'1367312482\'\nnumber: 1\nsurname: Admin\n'),('f48371226a3333671ba0b7acdf065582','--- \n_SESSION_ATIME: \'1367325463\'\n_SESSION_CTIME: \'1367325463\'\n_SESSION_ID: f48371226a3333671ba0b7acdf065582\n_SESSION_REMOTE_ADDR: 127.0.0.1\nbranch: MPL\nbranchname: Midway\ncardnumber: 1\nemailaddress: \'\'\nfirstname: Koha\nflags: 1\nid: admin\nip: 127.0.0.1\nlasttime: \'1367325463\'\nnumber: 1\nsurname: Admin\n');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_data`
--

DROP TABLE IF EXISTS `social_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_data` (
  `isbn` varchar(30) NOT NULL DEFAULT '',
  `num_critics` int(11) DEFAULT NULL,
  `num_critics_pro` int(11) DEFAULT NULL,
  `num_quotations` int(11) DEFAULT NULL,
  `num_videos` int(11) DEFAULT NULL,
  `score_avg` decimal(5,2) DEFAULT NULL,
  `num_scores` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_data`
--

LOCK TABLES `social_data` WRITE;
/*!40000 ALTER TABLE `social_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_holidays`
--

DROP TABLE IF EXISTS `special_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `day` smallint(6) NOT NULL DEFAULT '0',
  `month` smallint(6) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `isexception` smallint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_holidays`
--

LOCK TABLES `special_holidays` WRITE;
/*!40000 ALTER TABLE `special_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `datetime` datetime DEFAULT NULL,
  `branch` varchar(10) DEFAULT NULL,
  `proccode` varchar(4) DEFAULT NULL,
  `value` double(16,4) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `other` mediumtext,
  `usercode` varchar(10) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `itemtype` varchar(10) DEFAULT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `associatedborrower` int(11) DEFAULT NULL,
  KEY `timeidx` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES ('2013-04-30 10:53:46','MPL',NULL,5.0000,'issue','',NULL,1,'BK',5,NULL),('2013-04-30 10:55:38','MPL','2',5.0000,'payment','',NULL,0,'',5,NULL),('2013-04-30 10:55:50','MPL',NULL,0.0000,'issue','',NULL,2,'BK',5,NULL),('2013-04-30 10:56:06','MPL',NULL,0.0000,'issue','',NULL,4,'BK',5,NULL),('2013-04-30 10:57:40','MPL',NULL,0.0000,'issue','',NULL,7,'BK',3,NULL),('2013-04-30 15:19:34','MPL',NULL,0.0000,'issue','',NULL,3,'BK',3,NULL);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopwords`
--

DROP TABLE IF EXISTS `stopwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stopwords` (
  `word` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopwords`
--

LOCK TABLES `stopwords` WRITE;
/*!40000 ALTER TABLE `stopwords` DISABLE KEYS */;
INSERT INTO `stopwords` VALUES ('a'),('about'),('also'),('an'),('and'),('another'),('any'),('are'),('as'),('at'),('back'),('be'),('because'),('been'),('being'),('but'),('by'),('can'),('could'),('did'),('do'),('each'),('end'),('even'),('for'),('from'),('get'),('go'),('had'),('have'),('he'),('her'),('here'),('his'),('how'),('i'),('if'),('in'),('into'),('is'),('it'),('just'),('may'),('me'),('might'),('much'),('must'),('my'),('no'),('not'),('of'),('off'),('on'),('only'),('or'),('other'),('our'),('out'),('should'),('so'),('some'),('still'),('such'),('than'),('that'),('the'),('their'),('them'),('then'),('there'),('these'),('they'),('this'),('those'),('to'),('too'),('try'),('two'),('under'),('up'),('us'),('was'),('we'),('were'),('what'),('when'),('where'),('which'),('while'),('who'),('why'),('will'),('with'),('within'),('without'),('would'),('you'),('your');
/*!40000 ALTER TABLE `stopwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `subscriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `librarian` varchar(100) DEFAULT '',
  `startdate` date DEFAULT NULL,
  `aqbooksellerid` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `aqbudgetid` int(11) DEFAULT '0',
  `weeklength` int(11) DEFAULT '0',
  `monthlength` int(11) DEFAULT '0',
  `numberlength` int(11) DEFAULT '0',
  `periodicity` tinyint(4) DEFAULT '0',
  `dow` varchar(100) DEFAULT '',
  `numberingmethod` varchar(100) DEFAULT '',
  `notes` mediumtext,
  `status` varchar(100) NOT NULL DEFAULT '',
  `add1` int(11) DEFAULT '0',
  `every1` int(11) DEFAULT '0',
  `whenmorethan1` int(11) DEFAULT '0',
  `setto1` int(11) DEFAULT NULL,
  `lastvalue1` int(11) DEFAULT NULL,
  `add2` int(11) DEFAULT '0',
  `every2` int(11) DEFAULT '0',
  `whenmorethan2` int(11) DEFAULT '0',
  `setto2` int(11) DEFAULT NULL,
  `lastvalue2` int(11) DEFAULT NULL,
  `add3` int(11) DEFAULT '0',
  `every3` int(11) DEFAULT '0',
  `innerloop1` int(11) DEFAULT '0',
  `innerloop2` int(11) DEFAULT '0',
  `innerloop3` int(11) DEFAULT '0',
  `whenmorethan3` int(11) DEFAULT '0',
  `setto3` int(11) DEFAULT NULL,
  `lastvalue3` int(11) DEFAULT NULL,
  `issuesatonce` tinyint(3) NOT NULL DEFAULT '1',
  `firstacquidate` date DEFAULT NULL,
  `manualhistory` tinyint(1) NOT NULL DEFAULT '0',
  `irregularity` text,
  `letter` varchar(20) DEFAULT NULL,
  `numberpattern` tinyint(3) DEFAULT '0',
  `distributedto` text,
  `internalnotes` longtext,
  `callnumber` text,
  `location` varchar(80) DEFAULT '',
  `branchcode` varchar(10) NOT NULL DEFAULT '',
  `hemisphere` tinyint(3) DEFAULT '0',
  `lastbranch` varchar(10) DEFAULT NULL,
  `serialsadditems` tinyint(1) NOT NULL DEFAULT '0',
  `staffdisplaycount` varchar(10) DEFAULT NULL,
  `opacdisplaycount` varchar(10) DEFAULT NULL,
  `graceperiod` int(11) NOT NULL DEFAULT '0',
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`subscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionhistory`
--

DROP TABLE IF EXISTS `subscriptionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionhistory` (
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `subscriptionid` int(11) NOT NULL DEFAULT '0',
  `histstartdate` date DEFAULT NULL,
  `histenddate` date DEFAULT NULL,
  `missinglist` longtext NOT NULL,
  `recievedlist` longtext NOT NULL,
  `opacnote` varchar(150) NOT NULL DEFAULT '',
  `librariannote` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`subscriptionid`),
  KEY `biblionumber` (`biblionumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionhistory`
--

LOCK TABLES `subscriptionhistory` WRITE;
/*!40000 ALTER TABLE `subscriptionhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionroutinglist`
--

DROP TABLE IF EXISTS `subscriptionroutinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionroutinglist` (
  `routingid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `subscriptionid` int(11) NOT NULL,
  PRIMARY KEY (`routingid`),
  UNIQUE KEY `subscriptionid` (`subscriptionid`,`borrowernumber`),
  KEY `subscriptionroutinglist_ibfk_1` (`borrowernumber`),
  CONSTRAINT `subscriptionroutinglist_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriptionroutinglist_ibfk_2` FOREIGN KEY (`subscriptionid`) REFERENCES `subscription` (`subscriptionid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionroutinglist`
--

LOCK TABLES `subscriptionroutinglist` WRITE;
/*!40000 ALTER TABLE `subscriptionroutinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionroutinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions` (
  `suggestionid` int(8) NOT NULL AUTO_INCREMENT,
  `suggestedby` int(11) NOT NULL DEFAULT '0',
  `suggesteddate` date NOT NULL DEFAULT '0000-00-00',
  `managedby` int(11) DEFAULT NULL,
  `manageddate` date DEFAULT NULL,
  `acceptedby` int(11) DEFAULT NULL,
  `accepteddate` date DEFAULT NULL,
  `rejectedby` int(11) DEFAULT NULL,
  `rejecteddate` date DEFAULT NULL,
  `STATUS` varchar(10) NOT NULL DEFAULT '',
  `note` mediumtext,
  `author` varchar(80) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `copyrightdate` smallint(6) DEFAULT NULL,
  `publishercode` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `volumedesc` varchar(255) DEFAULT NULL,
  `publicationyear` smallint(6) DEFAULT '0',
  `place` varchar(255) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `mailoverseeing` smallint(1) DEFAULT '0',
  `biblionumber` int(11) DEFAULT NULL,
  `reason` text,
  `patronreason` text,
  `budgetid` int(11) DEFAULT NULL,
  `branchcode` varchar(10) DEFAULT NULL,
  `collectiontitle` text,
  `itemtype` varchar(30) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `price` decimal(28,6) DEFAULT NULL,
  `total` decimal(28,6) DEFAULT NULL,
  PRIMARY KEY (`suggestionid`),
  KEY `suggestedby` (`suggestedby`),
  KEY `managedby` (`managedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systempreferences`
--

DROP TABLE IF EXISTS `systempreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systempreferences` (
  `variable` varchar(50) NOT NULL DEFAULT '',
  `value` text,
  `options` mediumtext,
  `explanation` text,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systempreferences`
--

LOCK TABLES `systempreferences` WRITE;
/*!40000 ALTER TABLE `systempreferences` DISABLE KEYS */;
INSERT INTO `systempreferences` VALUES ('AcqCreateItem','ordering','ordering|receiving|cataloguing','Define when the item is created : when ordering, when receiving, or in cataloguing module','Choice'),('AcqViewBaskets','user','user|branch|all','Define which baskets a user is allowed to view: his own only, any within his branch or all','Choice'),('AddPatronLists','categorycode','categorycode|category_type','Allow user to choose what list to pick up from when adding patrons','Choice'),('advancedMARCeditor','0','','If ON, the MARC editor won\'t display field/subfield descriptions','YesNo'),('AdvancedSearchTypes','itemtypes','itemtypes|ccode','Select which set of fields comprise the Type limit in the advanced search','Choice'),('AllFinesNeedOverride','1','0','If on, staff will be asked to override every fine, even if it is below noissuescharge.','YesNo'),('AllowAllMessageDeletion','0','','Allow any Library to delete any message','YesNo'),('AllowFineOverride','0','0','If on, staff will be able to issue books to patrons with fines greater than noissuescharge.','YesNo'),('AllowHoldDateInFuture','0','','If set a date field is displayed on the Hold screen of the Staff Interface, allowing the hold date to be set in the future.','YesNo'),('AllowHoldPolicyOverride','0',NULL,'Allow staff to override hold policies when placing holds','YesNo'),('AllowHoldsOnDamagedItems','1','','Allow hold requests to be placed on damaged items','YesNo'),('AllowItemsOnHoldCheckout','0','','Do not generate RESERVE_WAITING and RESERVED warning when checking out items reserved to someone else. This allows self checkouts for those items.','YesNo'),('AllowMultipleCovers','0','1','Allow multiple cover images to be attached to each bibliographic record.','YesNo'),('AllowNotForLoanOverride','0','','If ON, Koha will allow the librarian to loan a not for loan item.','YesNo'),('AllowOnShelfHolds','0','','Allow hold requests to be placed on items that are not on loan','YesNo'),('AllowPKIAuth','None','None|Common Name|emailAddress','Use the field from a client-side SSL certificate to look a user in the Koha database','Choice'),('AllowPurchaseSuggestionBranchChoice','0','1','Allow user to choose branch when making a purchase suggestion','YesNo'),('AllowRenewalLimitOverride','0',NULL,'if ON, allows renewal limits to be overridden on the circulation screen','YesNo'),('AllowSelfCheckReturns','0','','If enabled, patrons may return items through the Web-based Self Checkout','YesNo'),('AlternateHoldingsField','',NULL,'The MARC field/subfield that contains alternate holdings information for bibs taht do not have items attached (e.g. 852abchi for libraries converting from MARC Magician).','free'),('AlternateHoldingsSeparator','',NULL,'The string to use to separate subfields in alternate holdings displays.','free'),('AmazonAssocTag','','','See:  http://aws.amazon.com','free'),('AmazonCoverImages','0','','Display Cover Images in Staff Client from Amazon Web Services','YesNo'),('AmazonEnabled','0','','Turn ON Amazon Content - You MUST set AWSAccessKeyID, AWSPrivateKey, and AmazonAssocTag if enabled','YesNo'),('AmazonLocale','US','US|CA|DE|FR|JP|UK','Use to set the Locale of your Amazon.com Web Services','Choice'),('AmazonReviews','0','','Display Amazon review on staff interface - You MUST set AWSAccessKeyID, AWSPrivateKey, and AmazonAssocTag if enabled','YesNo'),('AmazonSimilarItems','0','','Turn ON Amazon Similar Items feature  - You MUST set AWSAccessKeyID, AWSPrivateKey, and AmazonAssocTag if enabled','YesNo'),('AnonSuggestions','0',NULL,'Set to enable Anonymous suggestions to AnonymousPatron borrowernumber','YesNo'),('AnonymousPatron','0',NULL,'Set the identifier (borrowernumber) of the anonymous patron. Used for Suggestion and reading history privacy',''),('AuthoritiesLog','0','0','If ON, log edit/create/delete actions on authorities.','YesNo'),('authoritysep','--','10','Used to separate a list of authorities in a display. Usually --','free'),('autoBarcode','OFF','incremental|annual|hbyymmincr|OFF','Used to autogenerate a barcode: incremental will be of the form 1, 2, 3; annual of the form 2007-0001, 2007-0002; hbyymmincr of the form HB08010001 where HB=Home Branch','Choice'),('AutoCreateAuthorities','0',NULL,'Automatically create authorities that do not exist when cataloging records.','YesNo'),('AutoEmailOpacUser','0',NULL,'Sends notification emails containing new account details to patrons - when account is created.','YesNo'),('AutoEmailPrimaryAddress','OFF','email|emailpro|B_email|cardnumber|OFF','Defines the default email address where \'Account Details\' emails are sent.','Choice'),('AutoLocation','0',NULL,'If ON, IP authentication is enabled, blocking access to the staff client from unauthorized IP addresses','YesNo'),('AutomaticItemReturn','1',NULL,'If ON, Koha will automatically set up a transfer of this item to its homebranch','YesNo'),('autoMemberNum','1','','If ON, patron number is auto-calculated','YesNo'),('AutoResumeSuspendedHolds','1',NULL,'Allow suspended holds to be automatically resumed by a set date.','YesNo'),('AutoSelfCheckAllowed','0','','For corporate and special libraries which want web-based self-check available from any PC without the need for a manual staff login. Most libraries will want to leave this turned off. If on, requires self-check ID and password to be entered in AutoSelfCheckID and AutoSelfCheckPass sysprefs.','YesNo'),('AutoSelfCheckID','','','Staff ID with circulation rights to be used for automatic web-based self-check. Only applies if AutoSelfCheckAllowed syspref is turned on.','free'),('AutoSelfCheckPass','','','Password to be used for automatic web-based self-check. Only applies if AutoSelfCheckAllowed syspref is turned on.','free'),('AWSAccessKeyID','','','See:  http://aws.amazon.com','free'),('AWSPrivateKey','','','See:  http://aws.amazon.com.  Note that this is required after 2009/08/15 in order to retrieve any enhanced content other than book covers from Amazon.','free'),('Babeltheque','0','','Turn ON Babeltheque content  - See babeltheque.com to subscribe to this service','YesNo'),('Babeltheque_url_js','','','Url for Babeltheque javascript (e.g. http://www.babeltheque.com/bw_XX.js)','Free'),('Babeltheque_url_update','','','Url for Babeltheque update (E.G. http://www.babeltheque.com/.../file.csv.bz2)','Free'),('BakerTaylorBookstoreURL','','','URL template for \"My Libary Bookstore\" links, to which the \"key\" value is appended, and \"https://\" is prepended.  It should include your hostname and \"Parent Number\".  Make this variable empty to turn MLB links off.  Example: ocls.mylibrarybookstore.com/MLB/actions/searchHandler.do?nextPage=bookDetails&parentNum=10923&key=',''),('BakerTaylorEnabled','0','','Enable or disable all Baker & Taylor features.','YesNo'),('BakerTaylorPassword','','','Baker & Taylor Password for Content Cafe (external content)','Free'),('BakerTaylorUsername','','','Baker & Taylor Username for Content Cafe (external content)','Free'),('BasketConfirmations','1','always ask for confirmation.|do not ask for confirmation.','When closing or reopening a basket,','Choice'),('BiblioAddsAuthorities','0',NULL,'If ON, adding a new biblio will check for an existing authority record and create one on the fly if one doesn\'t exist','YesNo'),('BiblioDefaultView','normal','normal|marc|isbd','Choose the default detail view in the catalog; choose between normal, marc or isbd','Choice'),('BorrowerMandatoryField','surname|cardnumber',NULL,'Choose the mandatory fields for a patron\'s account','free'),('borrowerRelationship','father|mother','','Define valid relationships between a guarantor & a guarantee (separated by | or ,)','free'),('BorrowerRenewalPeriodBase','now','dateexpiry|now','Set whether the borrower renewal date should be counted from the dateexpiry or from the current date ','Choice'),('BorrowersLog','1',NULL,'If ON, log edit/create/delete actions on patron data','YesNo'),('BorrowersTitles','Mr|Mrs|Miss|Ms',NULL,'Define appropriate Titles for patrons','free'),('BorrowerUnwantedField','',NULL,'Name the fields you don\'t need to store for a patron\'s account','free'),('BranchTransferLimitsType','ccode','itemtype|ccode','When using branch transfer limits, choose whether to limit by itemtype or collection code.','Choice'),('CalendarFirstDayOfWeek','Sunday','Sunday|Monday','Select the first day of week to use in the calendar.','Choice'),('canreservefromotherbranches','1','','With Independent branches on, can a user from one library place a hold on an item from another library','YesNo'),('casAuthentication','0','','Enable or disable CAS authentication','YesNo'),('casLogout','0','','Does a logout from Koha should also log the user out of CAS?','YesNo'),('casServerUrl','https://localhost:8443/cas','','URL of the cas server','Free'),('CatalogModuleRelink','0',NULL,'If OFF the linker will never replace the authids that are set in the cataloging module.','YesNo'),('CataloguingLog','1',NULL,'If ON, log edit/create/delete actions on bibliographic data. WARNING: this feature is very resource consuming.','YesNo'),('checkdigit','none','none|katipo','If ON, enable checks on patron cardnumber: none or \"Katipo\" style checks','Choice'),('CircAutocompl','1',NULL,'If ON, autocompletion is enabled for the Circulation input','YesNo'),('CircAutoPrintQuickSlip','1',NULL,'Choose what should happen when an empty barcode field is submitted in circulation: Display a print quick slip window or Clear the screen.','YesNo'),('CircControl','ItemHomeLibrary','PickupLibrary|PatronLibrary|ItemHomeLibrary','Specify the agency that controls the circulation and fines policy','Choice'),('COinSinOPACResults','1','','If ON, use COinS in OPAC search results page.  NOTE: this can slow down search response time significantly','YesNo'),('CurrencyFormat','US','US|FR','Determines the display format of currencies. eg: \'36000\' is displayed as \'360 000,00\'  in \'FR\' or \'360,000.00\'  in \'US\'.','Choice'),('dateformat','us','metric|us|iso','Define global date format (us mm/dd/yyyy, metric dd/mm/yyy, ISO yyyy-mm-dd)','Choice'),('DebugLevel','2','0|1|2','Define the level of debugging information sent to the browser when errors are encountered (set to 0 in production). 0=none, 1=some, 2=most','Choice'),('DefaultClassificationSource','ddc',NULL,'Default classification scheme used by the collection. E.g., Dewey, LCC, etc.','ClassSources'),('defaultSortField','relevance','relevance|popularity|call_number|pubdate|acqdate|title|author','Specify the default field used for sorting','Choice'),('defaultSortOrder','dsc','asc|dsc|az|za','Specify the default sort order','Choice'),('delimiter',';',';|tabulation|,|/|\\|#||','Define the default separator character for exporting reports','Choice'),('Display856uAsImage','OFF','OFF|Details|Results|Both','Display the URI in the 856u field as an image, the corresponding Staff Client XSLT option must be on','Choice'),('DisplayClearScreenButton','0','','If set to ON, a clear screen button will appear on the circulation page.','YesNo'),('displayFacetCount','0',NULL,NULL,'YesNo'),('DisplayMultiPlaceHold','1','','Display the ability to place multiple holds or not','YesNo'),('DisplayOPACiconsXSLT','1','','If ON, displays the format, audience, type icons in XSLT MARC21 results and display pages.','YesNo'),('dontmerge','1',NULL,'If ON, modifying an authority record will not update all associated bibliographic records immediately, ask your system administrator to enable the merge_authorities.pl cron job','YesNo'),('EasyAnalyticalRecords','0','','If on, display in the catalogue screens tools to easily setup analytical record relationships','YesNo'),('emailLibrarianWhenHoldIsPlaced','0',NULL,'If ON, emails the librarian whenever a hold is placed','YesNo'),('EnableOpacSearchHistory','1','YesNo','Enable or disable opac search history',''),('EnhancedMessagingPreferences','0','','If ON, allows patrons to select to receive additional messages about items due or nearly due.','YesNo'),('expandedSearchOption','0',NULL,'If ON, set advanced search to be expanded by default','YesNo'),('ExpireReservesMaxPickUpDelay','0','','Enabling this allows holds to expire automatically if they have not been picked by within the time period specified in ReservesMaxPickUpDelay','YesNo'),('ExpireReservesMaxPickUpDelayCharge','0',NULL,'If ExpireReservesMaxPickUpDelay is enabled, and this field has a non-zero value, than a borrower whose waiting hold has expired will be charged this amount.','free'),('ExtendedPatronAttributes','0',NULL,'Use extended patron IDs and attributes','YesNo'),('FacetLabelTruncationLength','20',NULL,'Specify the facet max length in OPAC','Integer'),('FilterBeforeOverdueReport','0','','Do not run overdue report until filter selected','YesNo'),('FineNotifyAtCheckin','0',NULL,'If ON notify librarians of overdue fines on the items they are checking in.','YesNo'),('finesCalendar','noFinesWhenClosed','ignoreCalendar|noFinesWhenClosed','Specify whether to use the Calendar in calculating duedates and fines','Choice'),('FinesLog','1',NULL,'If ON, log fines','YesNo'),('finesMode','test','off|test|production','Choose the fines mode, \'off\', \'test\' (emails admin report) or \'production\' (accrue overdue fines).  Requires accruefines cronjob.','Choice'),('FrameworksLoaded','sysprefs.sql|auth_values.sql|authorities_normal_unimarc.sql|sample_notices.sql|sample_notices_message_transports.sql|stopwords.sql|subtag_registry.sql|unimarc_framework_DEFAULT.sql|userflags.sql|userpermissions.sql',NULL,'Frameworks loaded through webinstaller','choice'),('FRBRizeEditions','0','','If ON, Koha will query one or more ISBN web services for associated ISBNs and display an Editions tab on the details pages','YesNo'),('gist','0','','Default Goods and Services tax rate NOT in %, but in numeric form (0.12 for 12%), set to 0 to disable GST','Integer'),('GoogleJackets','0',NULL,'if ON, displays jacket covers from Google Books API','YesNo'),('hidelostitems','0','','If ON, disables display of\"lost\" items in OPAC.','YesNo'),('HidePatronName','0','','If this is switched on, patron\'s cardnumber will be shown instead of their name on the holds and catalog screens','YesNo'),('hide_marc','0',NULL,'If ON, disables display of MARC fields, subfield codes & indicators (still shows data)','YesNo'),('HomeOrHoldingBranch','holdingbranch','holdingbranch|homebranch','Used by Circulation to determine which branch of an item to check with independent branches on, and by search to determine which branch to choose for availability ','Choice'),('HomeOrHoldingBranchReturn','homebranch','holdingbranch|homebranch','Used by Circulation to determine which branch of an item to check checking-in items','Choice'),('ILS-DI','0','','Enables ILS-DI services at OPAC.','YesNo'),('ILS-DI:AuthorizedIPs','','Restricts usage of ILS-DI to some IPs','.','Free'),('ImageLimit','5','','Limit images stored in the database by the Patron Card image manager to this number.','Integer'),('IndependantBranches','0',NULL,'If ON, increases security between libraries','YesNo'),('InProcessingToShelvingCart','0','','If set, when any item with a location code of PROC is \'checked in\', it\'s location code will be changed to CART.','YesNo'),('insecure','0',NULL,'If ON, bypasses all authentication. Be careful!','YesNo'),('IntranetBiblioDefaultView','normal','normal|marc|isbd|labeled_marc','Choose the default detail view in the staff interface; choose between normal, labeled_marc, marc or isbd','Choice'),('intranetbookbag','1','','If ON, enables display of Cart feature in the intranet','YesNo'),('intranetcolorstylesheet','','50','Define the color stylesheet to use in the Staff Client','free'),('IntranetFavicon','','','Enter a complete URL to an image to replace the default Koha favicon on the Staff client','free'),('IntranetmainUserblock','','70|10','Add a block of HTML that will display on the intranet home page','Textarea'),('IntranetNav','','70|10','Use HTML tabs to add navigational links to the top-hand navigational bar in the Staff Client','Textarea'),('intranetreadinghistory','1','','If ON, Reading History is enabled for all patrons','YesNo'),('intranetstylesheet','','50','Enter a complete URL to use an alternate layout stylesheet in Intranet','free'),('IntranetUserCSS','',NULL,'Add CSS to be included in the intranet in an embedded <style> tag.','free'),('intranetuserjs','','70|10','Custom javascript for inclusion in Intranet','Textarea'),('intranet_includes','includes',NULL,'The includes directory you want for specific look of Koha (includes or includes_npl for example)','Free'),('ISBD','#100||{ 100a }{ 100b }{ 100c }{ 100d }{ 110a }{ 110b }{ 110c }{ 110d }{ 110e }{ 110f }{ 110g }{ 130a }{ 130d }{ 130f }{ 130g }{ 130h }{ 130k }{ 130l }{ 130m }{ 130n }{ 130o }{ 130p }{ 130r }{ 130s }{ 130t }|<br/><br/>\r\n#245||{ 245a }{ 245b }{245f }{ 245g }{ 245k }{ 245n }{ 245p }{ 245s }{ 245h }|\r\n#246||{ : 246i }{ 246a }{ 246b }{ 246f }{ 246g }{ 246n }{ 246p }{ 246h }|\r\n#242||{ = 242a }{ 242b }{ 242n }{ 242p }{ 242h }|\r\n#245||{ 245c }|\r\n#242||{ = 242c }|\r\n#250| - |{ 250a }{ 250b }|\r\n#254|, |{ 254a }|\r\n#255|, |{ 255a }{ 255b }{ 255c }{ 255d }{ 255e }{ 255f }{ 255g }|\r\n#256|, |{ 256a }|\r\n#257|, |{ 257a }|\r\n#258|, |{ 258a }{ 258b }|\r\n#260| - |{ 260a }{ 260b }{ 260c }|\r\n#300| - |{ 300a }{ 300b }{ 300c }{ 300d }{ 300e }{ 300f }{ 300g }|\r\n#306| - |{ 306a }|\r\n#307| - |{ 307a }{ 307b }|\r\n#310| - |{ 310a }{ 310b }|\r\n#321| - |{ 321a }{ 321b }|\r\n#340| - |{ 3403 }{ 340a }{ 340b }{ 340c }{ 340d }{ 340e }{ 340f }{ 340h }{ 340i }|\r\n#342| - |{ 342a }{ 342b }{ 342c }{ 342d }{ 342e }{ 342f }{ 342g }{ 342h }{ 342i }{ 342j }{ 342k }{ 342l }{ 342m }{ 342n }{ 342o }{ 342p }{ 342q }{ 342r }{ 342s }{ 342t }{ 342u }{ 342v }{ 342w }|\r\n#343| - |{ 343a }{ 343b }{ 343c }{ 343d }{ 343e }{ 343f }{ 343g }{ 343h }{ 343i }|\r\n#351| - |{ 3513 }{ 351a }{ 351b }{ 351c }|\r\n#352| - |{ 352a }{ 352b }{ 352c }{ 352d }{ 352e }{ 352f }{ 352g }{ 352i }{ 352q }|\r\n#362| - |{ 362a }{ 351z }|\r\n#440| - |{ 440a }{ 440n }{ 440p }{ 440v }{ 440x }|.\r\n#490| - |{ 490a }{ 490v }{ 490x }|.\r\n#800| - |{ 800a }{ 800b }{ 800c }{ 800d }{ 800e }{ 800f }{ 800g }{ 800h }{ 800j }{ 800k }{ 800l }{ 800m }{ 800n }{ 800o }{ 800p }{ 800q }{ 800r }{ 800s }{ 800t }{ 800u }{ 800v }|.\r\n#810| - |{ 810a }{ 810b }{ 810c }{ 810d }{ 810e }{ 810f }{ 810g }{ 810h }{ 810k }{ 810l }{ 810m }{ 810n }{ 810o }{ 810p }{ 810r }{ 810s }{ 810t }{ 810u }{ 810v }|.\r\n#811| - |{ 811a }{ 811c }{ 811d }{ 811e }{ 811f }{ 811g }{ 811h }{ 811k }{ 811l }{ 811n }{ 811p }{ 811q }{ 811s }{ 811t }{ 811u }{ 811v }|.\r\n#830| - |{ 830a }{ 830d }{ 830f }{ 830g }{ 830h }{ 830k }{ 830l }{ 830m }{ 830n }{ 830o }{ 830p }{ 830r }{ 830s }{ 830t }{ 830v }|.\r\n#500|<br/><br/>|{ 5003 }{ 500a }|\r\n#501|<br/><br/>|{ 501a }|\r\n#502|<br/><br/>|{ 502a }|\r\n#504|<br/><br/>|{ 504a }|\r\n#505|<br/><br/>|{ 505a }{ 505t }{ 505r }{ 505g }{ 505u }|\r\n#506|<br/><br/>|{ 5063 }{ 506a }{ 506b }{ 506c }{ 506d }{ 506u }|\r\n#507|<br/><br/>|{ 507a }{ 507b }|\r\n#508|<br/><br/>|{ 508a }{ 508a }|\r\n#510|<br/><br/>|{ 5103 }{ 510a }{ 510x }{ 510c }{ 510b }|\r\n#511|<br/><br/>|{ 511a }|\r\n#513|<br/><br/>|{ 513a }{513b }|\r\n#514|<br/><br/>|{ 514z }{ 514a }{ 514b }{ 514c }{ 514d }{ 514e }{ 514f }{ 514g }{ 514h }{ 514i }{ 514j }{ 514k }{ 514m }{ 514u }|\r\n#515|<br/><br/>|{ 515a }|\r\n#516|<br/><br/>|{ 516a }|\r\n#518|<br/><br/>|{ 5183 }{ 518a }|\r\n#520|<br/><br/>|{ 5203 }{ 520a }{ 520b }{ 520u }|\r\n#521|<br/><br/>|{ 5213 }{ 521a }{ 521b }|\r\n#522|<br/><br/>|{ 522a }|\r\n#524|<br/><br/>|{ 524a }|\r\n#525|<br/><br/>|{ 525a }|\r\n#526|<br/><br/>|{\\n510i }{\\n510a }{ 510b }{ 510c }{ 510d }{\\n510x }|\r\n#530|<br/><br/>|{\\n5063 }{\\n506a }{ 506b }{ 506c }{ 506d }{\\n506u }|\r\n#533|<br/><br/>|{\\n5333 }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }|\r\n#534|<br/><br/>|{\\n533p }{\\n533a }{\\n533b }{\\n533c }{\\n533d }{\\n533e }{\\n533f }{\\n533m }{\\n533n }{\\n533t }{\\n533x }{\\n533z }|\r\n#535|<br/><br/>|{\\n5353 }{\\n535a }{\\n535b }{\\n535c }{\\n535d }|\r\n#538|<br/><br/>|{\\n5383 }{\\n538a }{\\n538i }{\\n538u }|\r\n#540|<br/><br/>|{\\n5403 }{\\n540a }{ 540b }{ 540c }{ 540d }{\\n520u }|\r\n#544|<br/><br/>|{\\n5443 }{\\n544a }{\\n544b }{\\n544c }{\\n544d }{\\n544e }{\\n544n }|\r\n#545|<br/><br/>|{\\n545a }{ 545b }{\\n545u }|\r\n#546|<br/><br/>|{\\n5463 }{\\n546a }{ 546b }|\r\n#547|<br/><br/>|{\\n547a }|\r\n#550|<br/><br/>|{ 550a }|\r\n#552|<br/><br/>|{ 552z }{ 552a }{ 552b }{ 552c }{ 552d }{ 552e }{ 552f }{ 552g }{ 552h }{ 552i }{ 552j }{ 552k }{ 552l }{ 552m }{ 552n }{ 562o }{ 552p }{ 552u }|\r\n#555|<br/><br/>|{ 5553 }{ 555a }{ 555b }{ 555c }{ 555d }{ 555u }|\r\n#556|<br/><br/>|{ 556a }{ 506z }|\r\n#563|<br/><br/>|{ 5633 }{ 563a }{ 563u }|\r\n#565|<br/><br/>|{ 5653 }{ 565a }{ 565b }{ 565c }{ 565d }{ 565e }|\r\n#567|<br/><br/>|{ 567a }|\r\n#580|<br/><br/>|{ 580a }|\r\n#581|<br/><br/>|{ 5633 }{ 581a }{ 581z }|\r\n#584|<br/><br/>|{ 5843 }{ 584a }{ 584b }|\r\n#585|<br/><br/>|{ 5853 }{ 585a }|\r\n#586|<br/><br/>|{ 5863 }{ 586a }|\r\n#020|<br/><br/><label>ISBN: </label>|{ 020a }{ 020c }|\r\n#022|<br/><br/><label>ISSN: </label>|{ 022a }|\r\n#222| = |{ 222a }{ 222b }|\r\n#210| = |{ 210a }{ 210b }|\r\n#024|<br/><br/><label>Standard No.: </label>|{ 024a }{ 024c }{ 024d }{ 0242 }|\r\n#027|<br/><br/><label>Standard Tech. Report. No.: </label>|{ 027a }|\r\n#028|<br/><br/><label>Publisher. No.: </label>|{ 028a }{ 028b }|\r\n#013|<br/><br/><label>Patent No.: </label>|{ 013a }{ 013b }{ 013c }{ 013d }{ 013e }{ 013f }|\r\n#030|<br/><br/><label>CODEN: </label>|{ 030a }|\r\n#037|<br/><br/><label>Source: </label>|{ 037a }{ 037b }{ 037c }{ 037f }{ 037g }{ 037n }|\r\n#010|<br/><br/><label>LCCN: </label>|{ 010a }|\r\n#015|<br/><br/><label>Nat. Bib. No.: </label>|{ 015a }{ 0152 }|\r\n#016|<br/><br/><label>Nat. Bib. Agency Control No.: </label>|{ 016a }{ 0162 }|\r\n#600|<br/><br/><label>Subjects--Personal Names: </label>|{\\n6003 }{\\n600a}{ 600b }{ 600c }{ 600d }{ 600e }{ 600f }{ 600g }{ 600h }{--600k}{ 600l }{ 600m }{ 600n }{ 600o }{--600p}{ 600r }{ 600s }{ 600t }{ 600u }{--600x}{--600z}{--600y}{--600v}|\r\n#610|<br/><br/><label>Subjects--Corporate Names: </label>|{\\n6103 }{\\n610a}{ 610b }{ 610c }{ 610d }{ 610e }{ 610f }{ 610g }{ 610h }{--610k}{ 610l }{ 610m }{ 610n }{ 610o }{--610p}{ 610r }{ 610s }{ 610t }{ 610u }{--610x}{--610z}{--610y}{--610v}|\r\n#611|<br/><br/><label>Subjects--Meeting Names: </label>|{\\n6113 }{\\n611a}{ 611b }{ 611c }{ 611d }{ 611e }{ 611f }{ 611g }{ 611h }{--611k}{ 611l }{ 611m }{ 611n }{ 611o }{--611p}{ 611r }{ 611s }{ 611t }{ 611u }{--611x}{--611z}{--611y}{--611v}|\r\n#630|<br/><br/><label>Subjects--Uniform Titles: </label>|{\\n630a}{ 630b }{ 630c }{ 630d }{ 630e }{ 630f }{ 630g }{ 630h }{--630k }{ 630l }{ 630m }{ 630n }{ 630o }{--630p}{ 630r }{ 630s }{ 630t }{--630x}{--630z}{--630y}{--630v}|\r\n#648|<br/><br/><label>Subjects--Chronological Terms: </label>|{\\n6483 }{\\n648a }{--648x}{--648z}{--648y}{--648v}|\r\n#650|<br/><br/><label>Subjects--Topical Terms: </label>|{\\n6503 }{\\n650a}{ 650b }{ 650c }{ 650d }{ 650e }{--650x}{--650z}{--650y}{--650v}|\r\n#651|<br/><br/><label>Subjects--Geographic Terms: </label>|{\\n6513 }{\\n651a}{ 651b }{ 651c }{ 651d }{ 651e }{--651x}{--651z}{--651y}{--651v}|\r\n#653|<br/><br/><label>Subjects--Index Terms: </label>|{ 653a }|\r\n#654|<br/><br/><label>Subjects--Facted Index Terms: </label>|{\\n6543 }{\\n654a}{--654b}{--654x}{--654z}{--654y}{--654v}|\r\n#655|<br/><br/><label>Index Terms--Genre/Form: </label>|{\\n6553 }{\\n655a}{--655b}{--655x }{--655z}{--655y}{--655v}|\r\n#656|<br/><br/><label>Index Terms--Occupation: </label>|{\\n6563 }{\\n656a}{--656k}{--656x}{--656z}{--656y}{--656v}|\r\n#657|<br/><br/><label>Index Terms--Function: </label>|{\\n6573 }{\\n657a}{--657x}{--657z}{--657y}{--657v}|\r\n#658|<br/><br/><label>Index Terms--Curriculum Objective: </label>|{\\n658a}{--658b}{--658c}{--658d}{--658v}|\r\n#050|<br/><br/><label>LC Class. No.: </label>|{ 050a }{ / 050b }|\r\n#082|<br/><br/><label>Dewey Class. No.: </label>|{ 082a }{ / 082b }|\r\n#080|<br/><br/><label>Universal Decimal Class. No.: </label>|{ 080a }{ 080x }{ / 080b }|\r\n#070|<br/><br/><label>National Agricultural Library Call No.: </label>|{ 070a }{ / 070b }|\r\n#060|<br/><br/><label>National Library of Medicine Call No.: </label>|{ 060a }{ / 060b }|\r\n#074|<br/><br/><label>GPO Item No.: </label>|{ 074a }|\r\n#086|<br/><br/><label>Gov. Doc. Class. No.: </label>|{ 086a }|\r\n#088|<br/><br/><label>Report. No.: </label>|{ 088a }|','70|10','ISBD','Textarea'),('IssueLog','1',NULL,'If ON, log checkout activity','YesNo'),('IssuingInProcess','0',NULL,'If ON, disables fines if the patron is issuing item that accumulate debt','YesNo'),('item-level_itypes','1','','If ON, enables Item-level Itemtype / Issuing Rules','YesNo'),('itemBarcodeInputFilter','','whitespace|T-prefix|cuecat|libsuite8','If set, allows specification of a item barcode input filter','Choice'),('itemcallnumber','082ab',NULL,'The MARC field/subfield that is used to calculate the itemcallnumber (Dewey would be 082ab or 092ab; LOC would be 050ab or 090ab) could be 852hi from an item record','free'),('KohaAdminEmailAddress','root@localhost','','Define the email address where patron modification requests are sent','free'),('LabelMARCView','standard','standard|economical','Define how a MARC record will display','Choice'),('language','en',NULL,'Set the default language in the staff client.','Languages'),('LetterLog','1',NULL,'If ON, log all notices sent','YesNo'),('LibraryName','','','Define the library name as displayed on the OPAC',''),('LibraryThingForLibrariesEnabled','0','','Enable or Disable Library Thing for Libraries Features','YesNo'),('LibraryThingForLibrariesID','','','See:http://librarything.com/forlibraries/','free'),('LibraryThingForLibrariesTabbedView','0','','Put LibraryThingForLibraries Content in Tabs.','YesNo'),('LinkerKeepStale','0',NULL,'If ON the authority linker will keep existing authority links for headings where it is unable to find a match.','YesNo'),('LinkerModule','Default','Default|FirstMatch|LastMatch','Chooses which linker module to use (see documentation).','Choice'),('LinkerOptions','','','A pipe-separated list of options for the linker.','free'),('LinkerRelink','1',NULL,'If ON the authority linker will relink headings that have previously been linked every time it runs.','YesNo'),('LocalCoverImages','0','1','Display local cover images on intranet details pages.','YesNo'),('MARCAuthorityControlField008','|| aca||aabn           | a|a     d',NULL,NULL,'Textarea'),('marcflavour','UNIMARC','MARC21|UNIMARC','Define global MARC flavor (MARC21 or UNIMARC) used for character encoding','Choice'),('MARCOrgCode','OSt','','Define MARC Organization Code - http://www.loc.gov/marc/organizations/orgshome.html','free'),('MaxFine','9999','','Maximum fine a patron can have for a single late return','Integer'),('maxItemsInSearchResults','20',NULL,'Specify the maximum number of items to display for each result on a page of results','free'),('maxoutstanding','5','','maximum amount withstanding to be able make holds','Integer'),('maxRecordsForFacets','20',NULL,NULL,'Integer'),('maxreserves','50','','Define maximum number of holds a patron can place','Integer'),('memberofinstitution','0',NULL,'If ON, patrons can be linked to institutions','YesNo'),('minPasswordLength','3',NULL,'Specify the minimum length of a patron/staff password','free'),('NewItemsDefaultLocation','','','If set, all new items will have a location of the given Location Code ( Authorized Value type LOC )',''),('noissuescharge','5','','Define maximum amount withstanding before check outs are blocked','Integer'),('noItemTypeImages','0',NULL,'If ON, disables item-type images','YesNo'),('NoticeCSS','',NULL,'Notices CSS url.','free'),('NotifyBorrowerDeparture','30',NULL,'Define number of days before expiry where circulation is warned about patron account expiry','Integer'),('NovelistSelectEnabled','0',NULL,'Enable Novelist Select content.  Requires Novelist Profile and Password','YesNo'),('NovelistSelectPassword',NULL,NULL,'Enable Novelist user Profile','free'),('NovelistSelectProfile',NULL,NULL,'Novelist Select user Password','free'),('NovelistSelectView','tab','tab|above|below|right','Where to display Novelist Select content','Choice'),('NoZebra','0','','If ON, Zebra indexing is turned off, simpler setup, but slower searches. WARNING: using NoZebra on even modest sized collections is very slow.','YesNo'),('NoZebraIndexes','\'title\' => \'130a,210a,222a,240a,243a,245a,245b,246a,246b,247a,247b,250a,250b,440a,830a\',\r\n\'author\' => \'100a,100b,100c,100d,110a,111a,111b,111c,111d,245c,700a,710a,711a,800a,810a,811a\',\r\n\'isbn\' => \'020a\',\r\n\'issn\' => \'022a\',\r\n\'lccn\' => \'010a\',\r\n\'biblionumber\' => \'999c\',\r\n\'itemtype\' => \'942c\',\r\n\'publisher\' => \'260b\',\r\n\'date\' => \'260c\',\r\n\'note\' => \'500a, 501a,504a,505a,508a,511a,518a,520a,521a,522a,524a,526a,530a,533a,538a,541a,546a,555a,556a,562a,563a,583a,585a,582a\',\r\n\'subject\' => \'600*,610*,611*,630*,650*,651*,653*,654*,655*,662*,690*\',\r\n\'dewey\' => \'082\',\r\n\'bc\' => \'952p\',\r\n\'callnum\' => \'952o\',\r\n\'an\' => \'6009,6109,6119\',\r\n\'homebranch\' => \'952a,952c\'','70|10','Enter a specific hash for NoZebra indexes. Enter : \'indexname\' => \'100a,245a,500*\',\'index2\' => \'...\'','Textarea'),('numReturnedItemsToShow','20',NULL,'Number of returned items to show on the check-in page','Integer'),('numSearchResults','20',NULL,'Specify the maximum number of results to display on a page of results','Integer'),('numSearchRSSResults','50',NULL,'Specify the maximum number of results to display on a RSS page of results','Integer'),('OAI-PMH','0',NULL,'if ON, OAI-PMH server is enabled','YesNo'),('OAI-PMH:archiveID','KOHA-OAI-TEST',NULL,'OAI-PMH archive identification','Free'),('OAI-PMH:AutoUpdateSets','0','','Automatically update OAI sets when a bibliographic record is created or updated','YesNo'),('OAI-PMH:ConfFile','',NULL,'If empty, Koha OAI Server operates in normal mode, otherwise it operates in extended mode.','File'),('OAI-PMH:MaxCount','50',NULL,'OAI-PMH maximum number of records by answer to ListRecords and ListIdentifiers queries','Integer'),('OCLCAffiliateID','','','Use with FRBRizeEditions and XISBN. You can sign up for an AffiliateID here: http://www.worldcat.org/wcpa/do/AffiliateUserServices?method=initSelfRegister','free'),('OpacAddMastheadLibraryPulldown','0','','Adds a pulldown menu to select the library to search on the opac masthead.','YesNo'),('OPACAllowHoldDateInFuture','0','','If set, along with the AllowHoldDateInFuture system preference, OPAC users can set the date of a hold to be in the future.','YesNo'),('OpacAllowPublicListCreation','1',NULL,'If set, allows opac users to create public lists','YesNo'),('OpacAllowSharingPrivateLists','0',NULL,'If set, allows opac users to share private lists with other patrons','YesNo'),('OPACAllowUserToChooseBranch','1','1','Allow the user to choose the branch they want to pickup their hold from','YesNo'),('OPACAmazonCoverImages','0','','Display cover images on OPAC from Amazon Web Services','YesNo'),('OPACAmazonEnabled','0','','Turn ON Amazon Content in the OPAC - You MUST set AWSAccessKeyID, AWSPrivateKey, and AmazonAssocTag if enabled','YesNo'),('OPACAmazonReviews','0','','Display Amazon readers reviews on OPAC','YesNo'),('OPACAmazonSimilarItems','0','','Turn ON Amazon Similar Items feature  - You MUST set AWSAccessKeyID, AWSPrivateKey, and AmazonAssocTag if enabled','YesNo'),('OpacAuthorities','1',NULL,'If ON, enables the search authorities link on OPAC','YesNo'),('OPACBaseURL',NULL,NULL,'Specify the Base URL of the OPAC, e.g., opac.mylibrary.com, the http:// will be added automatically by Koha.','Free'),('opacbookbag','1','','If ON, enables display of Cart feature','YesNo'),('OpacBrowser','0',NULL,'If ON, enables subject authorities browser on OPAC (needs to set misc/cronjob/sbuild_browser_and_cloud.pl)','YesNo'),('OpacBrowseResults','1',NULL,'Disable/enable browsing and paging search results from the OPAC detail page.','YesNo'),('OpacCloud','0',NULL,'If ON, enables subject cloud on OPAC','YesNo'),('opaccolorstylesheet','colors.css','','Define an auxiliary stylesheet for OPAC use, to override specified settings from the primary opac.css stylesheet. Enter the filename (if the file is in the server\'s css directory) or a complete URL beginning with http (if the file lives on a remote server).','free'),('opaccredits','','70|10','Define HTML Credits at the bottom of the OPAC page','Textarea'),('OPACdefaultSortField','relevance','relevance|popularity|call_number|pubdate|acqdate|title|author','Specify the default field used for sorting','Choice'),('OPACdefaultSortOrder','dsc','asc|dsc|za|az','Specify the default sort order','Choice'),('OPACDisplay856uAsImage','OFF','OFF|Details|Results|Both','Display the URI in the 856u field as an image, the corresponding OPACXSLT option must be on','Choice'),('OPACDisplayRequestPriority','0','','Show patrons the priority level on holds in the OPAC','YesNo'),('OpacExportOptions','bibtex|dc|marcxml|marc8|utf8|marcstd|mods|ris','','Define export options available on OPAC detail page.','free'),('OpacFavicon','','','Enter a complete URL to an image to replace the default Koha favicon on the OPAC','free'),('OPACFineNoRenewals','100','','Fine limit above which user cannot renew books via OPAC','Integer'),('OPACFinesTab','1','','If OFF the patron fines tab in the OPAC is disabled.','YesNo'),('OPACFRBRizeEditions','0','','If ON, the OPAC will query one or more ISBN web services for associated ISBNs and display an Editions tab on the details pages','YesNo'),('opacheader','','70|10','Add HTML to be included as a custom header in the OPAC','Textarea'),('OpacHiddenItems','','','This syspref allows to define custom rules for hiding specific items at opac. See docs/opac/OpacHiddenItems.txt for more informations.','Textarea'),('OpacHighlightedWords','1','','If Set, then queried words are higlighted in OPAC','YesNo'),('OPACItemHolds','1','','Allow OPAC users to place hold on specific items. If OFF, users can only request next available copy.','YesNo'),('OPACItemsResultsDisplay','statuses','statuses|itemdetails','statuses : show only the status of items in result list. itemdisplay : show full location of items (branch+location+callnumber) as in staff interface','Choice'),('OpacKohaUrl','1',NULL,'Show \'Powered by Koha\' text on OPAC footer.',NULL),('opaclanguages','en',NULL,'Set the default language in the OPAC.','Languages'),('opaclanguagesdisplay','0','','If ON, enables display of Change Language feature on OPAC','YesNo'),('opaclayoutstylesheet','opac.css','','Enter the name of the layout CSS stylesheet to use in the OPAC','free'),('OPACLocalCoverImages','0','1','Display local cover images on OPAC search and details pages.','YesNo'),('OpacMaintenance','0','','If ON, enables maintenance warning in OPAC','YesNo'),('OpacMainUserBlock','Welcome to Koha...\r\n<hr>','70|10','A user-defined block of HTML  in the main content area of the opac main page','Textarea'),('OPACMySummaryHTML','','70|10','Enter the HTML that will appear in a column on the \'my profile\' tab when a user is logged in to the OPAC. Enter {BIBLIONUMBER}, {TITLE}, {AUTHOR}, or {ISBN} in place of their respective variables in the HTML. Leave blank to disable.','Textarea'),('OpacNav','Important links here.','70|10','Use HTML tags to add navigational links to the left-hand navigational bar in OPAC','Textarea'),('OpacNavBottom','Important links here.','70|10','Use HTML tags to add navigational links to the left-hand navigational bar in OPAC','Textarea'),('OPACNoResultsFound','','70|10','Display this HTML when no results are found for a search in the OPAC','Textarea'),('OPACnumSearchResults','20',NULL,'Specify the maximum number of results to display on a page of results','Integer'),('OpacPasswordChange','1',NULL,'If ON, enables patron-initiated password change in OPAC (disable it when using LDAP auth)','YesNo'),('OPACPatronDetails','1','','If OFF the patron details tab in the OPAC is disabled.','YesNo'),('OPACpatronimages','0',NULL,'Enable patron images in the OPAC','YesNo'),('OpacPrivacy','0',NULL,'if ON, allows patrons to define their privacy rules (reading history)','YesNo'),('OpacPublic','1',NULL,'Turn on/off public OPAC','YesNo'),('opacreadinghistory','1','','If ON, enables display of Patron Circulation History in OPAC','YesNo'),('OpacRenewalAllowed','0',NULL,'If ON, users can renew their issues directly from their OPAC account','YesNo'),('OpacRenewalBranch','checkoutbranch','itemhomebranch|patronhomebranch|checkoutbranch|null','Choose how the branch for an OPAC renewal is recorded in statistics','Choice'),('OPACResultsSidebar','','70|10','Define HTML to be included on the search results page, underneath the facets sidebar','Textarea'),('OPACSearchForTitleIn','<li><a  href=\"http://worldcat.org/search?q={TITLE}\" target=\"_blank\">Other Libraries (WorldCat)</a></li>\n<li><a href=\"http://www.scholar.google.com/scholar?q={TITLE}\" target=\"_blank\">Other Databases (Google Scholar)</a></li>\n<li><a href=\"http://www.bookfinder.com/search/?author={AUTHOR}&amp;title={TITLE}&amp;st=xl&amp;ac=qr\" target=\"_blank\">Online Stores (Bookfinder.com)</a></li>\n<li><a href=\"http://openlibrary.org/search/?author=({AUTHOR})&title=({TITLE})\" target=\"_blank\">Open Library (openlibrary.org)</a></li>','70|10','Enter the HTML that will appear in the \'Search for this title in\' box on the detail page in the OPAC.  Enter {TITLE}, {AUTHOR}, or {ISBN} in place of their respective variables in the URL. Leave blank to disable \'More Searches\' menu.','Textarea'),('opacSerialDefaultTab','subscriptions','holdings|serialcollection|subscriptions','Define the default tab for serials in OPAC.','Choice'),('OPACSerialIssueDisplayCount','3','','Number of serial issues to display per subscription in the OPAC','Integer'),('OPACShelfBrowser','1','','Enable/disable Shelf Browser on item details page. WARNING: this feature is very resource consuming on collections with large numbers of items.','YesNo'),('OPACShowCheckoutName','0','','Displays in the OPAC the name of patron who has checked out the material. WARNING: Most sites should leave this off. It is intended for corporate or special sites which need to track who has the item.','YesNo'),('OpacShowRecentComments','0',NULL,'If ON a link to recent comments will appear in the OPAC masthead','YesNo'),('opacsmallimage','','','Enter a complete URL to an image to replace the default Koha logo','free'),('OpacStarRatings','all','disable|all|details',NULL,'Choice'),('opacstylesheet','','','Enter a complete URL to use an alternate layout stylesheet in OPAC','free'),('OpacSuppression','0','','Turn ON the OPAC Suppression feature, requires further setup, ask your system administrator for details','YesNo'),('opacthemes','prog','','Define the current theme for the OPAC interface.','Themes'),('OpacTopissue','0',NULL,'If ON, enables the \'most popular items\' link on OPAC. Warning, this is an EXPERIMENTAL feature, turning ON may overload your server','YesNo'),('OPACURLOpenInNewWindow','0',NULL,'If ON, URLs in the OPAC open in a new window','YesNo'),('OPACUserCSS','',NULL,'Add CSS to be included in the OPAC in an embedded <style> tag.','free'),('opacuserjs','','70|10','Define custom javascript for inclusion in OPAC','Textarea'),('opacuserlogin','1',NULL,'Enable or disable display of user login features','YesNo'),('OPACViewOthersSuggestions','0',NULL,'If ON, allows all suggestions to be displayed in the OPAC','YesNo'),('OPACXSLTDetailsDisplay','','','Enable XSL stylesheet control over details page display on OPAC','Free'),('OPACXSLTResultsDisplay','','','Enable XSL stylesheet control over results page display on OPAC','Free'),('OpenLibraryCovers','0',NULL,'If ON Openlibrary book covers will be show','YesNo'),('OrderPdfFormat','pdfformat::layout3pages','Controls what script is used for printing (basketgroups)','','free'),('OverdueNoticeBcc','','','Email address to bcc outgoing overdue notices sent by email','free'),('OverduesBlockCirc','noblock','noblock|confirmation|block','When checking out an item should overdues block checkout, generate a confirmation dialogue, or allow checkout','Choice'),('patronimages','0',NULL,'Enable patron images for the Staff Client','YesNo'),('PatronsPerPage','20','20','Number of Patrons Per Page displayed by default','Integer'),('previousIssuesDefaultSortOrder','asc','asc|desc','Specify the sort order of Previous Issues on the circulation page','Choice'),('printcirculationslips','1','','If ON, enable printing circulation receipts','YesNo'),('PrintNoticesMaxLines','0','','If greater than 0, sets the maximum number of lines an overdue notice will print. If the number of items is greater than this number, the notice will end with a warning asking the borrower to check their online account for a full list of overdue items.','Integer'),('QueryAutoTruncate','1',NULL,'If ON, query truncation is enabled by default','YesNo'),('QueryFuzzy','1',NULL,'If ON, enables fuzzy option for searches','YesNo'),('QueryRemoveStopwords','0',NULL,'If ON, stopwords listed in the Administration area will be removed from queries','YesNo'),('QueryStemming','1',NULL,'If ON, enables query stemming','YesNo'),('QueryWeightFields','1',NULL,'If ON, enables field weighting','YesNo'),('RandomizeHoldsQueueWeight','0',NULL,'if ON, the holds queue in circulation will be randomized, either based on all location codes, or by the location codes specified in StaticHoldsQueueWeight','YesNo'),('RecordLocalUseOnReturn','0',NULL,'If ON, statistically record returns of unissued items as local use, instead of return','YesNo'),('RenewalPeriodBase','date_due','date_due|now','Set whether the renewal date should be counted from the date_due or from the moment the Patron asks for renewal ','Choice'),('RenewSerialAddsSuggestion','0',NULL,'If ON, adds a new suggestion at serial subscription renewal','YesNo'),('RequestOnOpac','1',NULL,'If ON, globally enables patron holds on OPAC','YesNo'),('ReservesControlBranch','PatronLibrary','ItemHomeLibrary|PatronLibrary','Branch checked for members reservations rights','Choice'),('ReservesMaxPickUpDelay','7','','Define the Maximum delay to pick up an item on hold','Integer'),('ReservesNeedReturns','1','','If ON, a hold placed on an item available in this library must be checked-in, otherwise, a hold on a specific item, that is in the library & available is considered available','YesNo'),('ReturnBeforeExpiry','0',NULL,'If ON, checkout will be prevented if returndate is after patron card expiry','YesNo'),('ReturnLog','1',NULL,'If ON, enables the circulation (returns) log','YesNo'),('ReturnToShelvingCart','0','','If set, when any item is \'checked in\', it\'s location code will be changed to CART.','YesNo'),('reviewson','1','','If ON, enables patron reviews of bibliographic records in the OPAC','YesNo'),('RoutingListAddReserves','1','','If ON the patrons on routing lists are automatically added to holds on the issue.','YesNo'),('RoutingListNote','To change this note edit <a href=\"/cgi-bin/koha/admin/preferences.pl?op=search&searchfield=RoutingListNote#jumped\">RoutlingListNote</a> system preference.','70|10','Define a note to be shown on all routing lists','Textarea'),('RoutingSerials','1',NULL,'If ON, serials routing is enabled','YesNo'),('SearchMyLibraryFirst','0',NULL,'If ON, OPAC searches return results limited by the user\'s library by default if they are logged in','YesNo'),('SelfCheckHelpMessage','','70|10','Enter HTML to include under the basic Web-based Self Checkout instructions on the Help page','Textarea'),('SelfCheckTimeout','120','','Define the number of seconds before the Web-based Self Checkout times out a patron','Integer'),('SessionStorage','mysql','mysql|Pg|tmp','Use database or a temporary file for storing session data','Choice'),('ShelfBrowserUsesCcode','1','0','Use the item collection code when finding items for the shelf browser.','YesNo'),('ShelfBrowserUsesHomeBranch','1','1','Use the item home branch when finding items for the shelf browser.','YesNo'),('ShelfBrowserUsesLocation','1','1','Use the item location when finding items for the shelf browser.','YesNo'),('ShowPatronImageInWebBasedSelfCheck','0','','If ON, displays patron image when a patron uses web-based self-checkout','YesNo'),('ShowReviewer','full','none|full|first|surname|firstandinitial|username','Choose how a commenter\'s identity is presented alongside comments in the OPAC','Choice'),('ShowReviewerPhoto','1','','If ON, photo of reviewer will be shown beside comments in OPAC','YesNo'),('singleBranchMode','0',NULL,'Operate in Single-branch mode, hide branch selection in the OPAC','YesNo'),('SlipCSS','',NULL,'Slips CSS url.','free'),('SMSSendDriver','','','Sets which SMS::Send driver is used to send SMS messages.','free'),('SocialNetworks','1','','Enable/Disable social networks links in opac detail pages','YesNo'),('soundon','0','','Enable circulation sounds during checkin and checkout in the staff interface.  Not supported by all web browsers yet.','YesNo'),('SpecifyDueDate','1','','Define whether to display \"Specify Due Date\" form in Circulation','YesNo'),('SpineLabelAutoPrint','0','','If this setting is turned on, a print dialog will automatically pop up for the quick spine label printer.','YesNo'),('SpineLabelFormat','<itemcallnumber><copynumber>','30|10','This preference defines the format for the quick spine label printer. Just list the fields you would like to see in the order you would like to see them, surrounded by <>, for example <itemcallnumber>.','Textarea'),('SpineLabelShowPrintOnBibDetails','0','','If turned on, a \"Print Label\" link will appear for each item on the bib details page in the staff interface.','YesNo'),('StaffAuthorisedValueImages','1',NULL,'','YesNo'),('staffClientBaseURL','',NULL,'Specify the base URL of the staff client','free'),('StaffSerialIssueDisplayCount','3','','Number of serial issues to display per subscription in the Staff client','Integer'),('StaticHoldsQueueWeight','0',NULL,'Specify a list of library location codes separated by commas -- the list of codes will be traversed and weighted with first values given higher weight for holds fulfillment -- alternatively, if RandomizeHoldsQueueWeight is set, the list will be randomly selective','Integer'),('SubscriptionDuplicateDroppedInput','','','List of fields which must not be rewritten when a subscription is duplicated (Separated by pipe |)','Free'),('SubscriptionHistory','simplified','simplified|full','Define the display preference for serials issue history in OPAC','Choice'),('SubscriptionLog','1',NULL,'If ON, enables subscriptions log','YesNo'),('suggestion','1','','If ON, enables patron suggestions feature in OPAC','YesNo'),('SuspendHoldsIntranet','1','Allow holds to be suspended from the intranet.',NULL,'YesNo'),('SuspendHoldsOpac','1','Allow holds to be suspended from the OPAC.',NULL,'YesNo'),('SyndeticsAuthorNotes','0','','Display Notes about the Author on OPAC from Syndetics','YesNo'),('SyndeticsAwards','0','','Display Awards on OPAC from Syndetics','YesNo'),('SyndeticsClientCode','0','','Client Code for using Syndetics Solutions content','free'),('SyndeticsCoverImages','0','','Display Cover Images from Syndetics','YesNo'),('SyndeticsCoverImageSize','MC','MC|LC','Choose the size of the Syndetics Cover Image to display on the OPAC detail page, MC is Medium, LC is Large','Choice'),('SyndeticsEditions','0','','Display Editions from Syndetics','YesNo'),('SyndeticsEnabled','0','','Turn on Syndetics Enhanced Content','YesNo'),('SyndeticsExcerpt','0','','Display Excerpts and first chapters on OPAC from Syndetics','YesNo'),('SyndeticsReviews','0','','Display Reviews on OPAC from Syndetics','YesNo'),('SyndeticsSeries','0','','Display Series information on OPAC from Syndetics','YesNo'),('SyndeticsSummary','0','','Display Summary Information from Syndetics','YesNo'),('SyndeticsTOC','0','','Display Table of Content information from Syndetics','YesNo'),('TagsEnabled','1','','Enables or disables all tagging features.  This is the main switch for tags.','YesNo'),('TagsExternalDictionary',NULL,'','Path on server to local ispell executable, used to set $Lingua::Ispell::path  This dictionary is used as a \"whitelist\" of pre-allowed tags.',''),('TagsInputOnDetail','1','','Allow users to input tags from the detail page.','YesNo'),('TagsInputOnList','0','','Allow users to input tags from the search results list.','YesNo'),('TagsModeration','0','','Require tags from patrons to be approved before becoming visible.','YesNo'),('TagsShowOnDetail','10','','Number of tags to display on detail page.  0 is off.','Integer'),('TagsShowOnList','6','','Number of tags to display on search results list.  0 is off.','Integer'),('template','prog','','Define the preferred staff interface template','Themes'),('ThingISBN','0','','Use with FRBRizeEditions. If ON, Koha will use the ThingISBN web service in the Editions tab on the detail pages.','YesNo'),('timeout','12000000',NULL,'Inactivity timeout for cookies authentication (in seconds)','Integer'),('todaysIssuesDefaultSortOrder','desc','asc|desc','Specify the sort order of Todays Issues on the circulation page','Choice'),('TraceCompleteSubfields','0','0','Force subject tracings to only match complete subfields.','YesNo'),('TraceSubjectSubdivisions','0','1','Create searches on all subdivisions for subject tracings.','YesNo'),('TransfersMaxDaysWarning','3',NULL,'Define the days before a transfer is suspected of having a problem','Integer'),('TransferWhenCancelAllWaitingHolds','0',NULL,'Transfer items when cancelling all waiting holds','YesNo'),('UNIMARCAuthorsFacetsSeparator',', ',NULL,'UNIMARC authors facets separator','short'),('uppercasesurnames','0',NULL,'If ON, surnames are converted to upper case in patron entry form','YesNo'),('URLLinkText','',NULL,'Text to display as the link anchor in the OPAC','free'),('UseAuthoritiesForTracings','1','0','Use authority record numbers for subject tracings instead of heading strings.','YesNo'),('UseBranchTransferLimits','0','','If ON, Koha will will use the rules defined in branch_transfer_limits to decide if an item transfer should be allowed.','YesNo'),('UseControlNumber','0','','If ON, record control number (w subfields) and control number (001) are used for linking of bibliographic records.','YesNo'),('useDaysMode','Calendar','Calendar|Days|Datedue','Choose the method for calculating due date: select Calendar to use the holidays module, and Days to ignore the holidays module','Choice'),('UseICU','0','1','Tell Koha if ICU indexing is in use for Zebra or not.','YesNo'),('UseTablesortForCirc','0','','If on, use the JQuery tablesort function on the list of current borrower checkouts on the circulation page.  Note that the use of this function may slow down circ for patrons with may checkouts.','YesNo'),('Version','3.0812000',NULL,'The Koha database version. WARNING: Do not change this value manually, it is maintained by the webinstaller',NULL),('viewISBD','1','','Allow display of ISBD view of bibiographic records','YesNo'),('viewLabeledMARC','0','','Allow display of labeled MARC view of bibiographic records','YesNo'),('viewMARC','1','','Allow display of MARC view of bibiographic records','YesNo'),('virtualshelves','1','','If ON, enables Lists management','YesNo'),('WaitingNotifyAtCheckin','0',NULL,'If ON, notify librarians of waiting holds for the patron whose items they are checking in.','YesNo'),('WebBasedSelfCheck','0',NULL,'If ON, enables the web-based self-check system','YesNo'),('XISBN','0','','Use with FRBRizeEditions. If ON, Koha will use the OCLC xISBN web service in the Editions tab on the detail pages. See: http://www.worldcat.org/affiliate/webservices/xisbn/app.jsp','YesNo'),('XISBNDailyLimit','999','','The xISBN Web service is free for non-commercial use when usage does not exceed 1000 requests per day','Integer'),('XSLTDetailsDisplay','','','Enable XSL stylesheet control over details page display on intranet','Free'),('XSLTResultsDisplay','','','Enable XSL stylesheet control over results page display on intranet','Free'),('yuipath','local','local|http://yui.yahooapis.com/2.5.1/build','Insert the path to YUI libraries, choose local if you use koha offline','Choice'),('z3950AuthorAuthFields','701,702,700',NULL,'Define the MARC biblio fields for Personal Name Authorities to fill biblio.author','free'),('z3950NormalizeAuthor','0','','If ON, Personal Name Authorities will replace authors in biblio.author','YesNo');
/*!40000 ALTER TABLE `systempreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `entry` varchar(255) NOT NULL DEFAULT '',
  `weight` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_all`
--

DROP TABLE IF EXISTS `tags_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_all` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowernumber` int(11) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `term` varchar(255) NOT NULL,
  `language` int(4) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `tags_borrowers_fk_1` (`borrowernumber`),
  KEY `tags_biblionumber_fk_1` (`biblionumber`),
  CONSTRAINT `tags_borrowers_fk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tags_biblionumber_fk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_all`
--

LOCK TABLES `tags_all` WRITE;
/*!40000 ALTER TABLE `tags_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_approval`
--

DROP TABLE IF EXISTS `tags_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_approval` (
  `term` varchar(255) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `date_approved` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `weight_total` int(9) NOT NULL DEFAULT '1',
  PRIMARY KEY (`term`),
  KEY `tags_approval_borrowers_fk_1` (`approved_by`),
  CONSTRAINT `tags_approval_borrowers_fk_1` FOREIGN KEY (`approved_by`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_approval`
--

LOCK TABLES `tags_approval` WRITE;
/*!40000 ALTER TABLE `tags_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_index`
--

DROP TABLE IF EXISTS `tags_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_index` (
  `term` varchar(255) NOT NULL,
  `biblionumber` int(11) NOT NULL,
  `weight` int(9) NOT NULL DEFAULT '1',
  PRIMARY KEY (`term`,`biblionumber`),
  KEY `tags_index_biblionumber_fk_1` (`biblionumber`),
  CONSTRAINT `tags_index_term_fk_1` FOREIGN KEY (`term`) REFERENCES `tags_approval` (`term`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tags_index_biblionumber_fk_1` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_index`
--

LOCK TABLES `tags_index` WRITE;
/*!40000 ALTER TABLE `tags_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_holdsqueue`
--

DROP TABLE IF EXISTS `tmp_holdsqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_holdsqueue` (
  `biblionumber` int(11) DEFAULT NULL,
  `itemnumber` int(11) DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `surname` mediumtext NOT NULL,
  `firstname` text,
  `phone` text,
  `borrowernumber` int(11) NOT NULL,
  `cardnumber` varchar(16) DEFAULT NULL,
  `reservedate` date DEFAULT NULL,
  `title` mediumtext,
  `itemcallnumber` varchar(255) DEFAULT NULL,
  `holdingbranch` varchar(10) DEFAULT NULL,
  `pickbranch` varchar(10) DEFAULT NULL,
  `notes` text,
  `item_level_request` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_holdsqueue`
--

LOCK TABLES `tmp_holdsqueue` WRITE;
/*!40000 ALTER TABLE `tmp_holdsqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_holdsqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `borrowernumber` int(11) NOT NULL DEFAULT '0',
  `module_bit` int(11) NOT NULL DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  KEY `user_permissions_ibfk_1` (`borrowernumber`),
  KEY `user_permissions_ibfk_2` (`module_bit`,`code`),
  CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`module_bit`, `code`) REFERENCES `permissions` (`module_bit`, `code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userflags`
--

DROP TABLE IF EXISTS `userflags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userflags` (
  `bit` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(30) DEFAULT NULL,
  `flagdesc` varchar(255) DEFAULT NULL,
  `defaulton` int(11) DEFAULT NULL,
  PRIMARY KEY (`bit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userflags`
--

LOCK TABLES `userflags` WRITE;
/*!40000 ALTER TABLE `userflags` DISABLE KEYS */;
INSERT INTO `userflags` VALUES (0,'superlibrarian','Access to all librarian functions',0),(1,'circulate','Circulate books',0),(2,'catalogue','View Catalog (Librarian Interface)',0),(3,'parameters','Set Koha system parameters',0),(4,'borrowers','Add or modify borrowers',0),(5,'permissions','Set user permissions',0),(6,'reserveforothers','Place and modify holds for patrons',0),(7,'borrow','Borrow books',1),(9,'editcatalogue','Edit Catalog (Modify bibliographic/holdings data)',0),(10,'updatecharges','Update borrower charges',0),(11,'acquisition','Acquisition and/or suggestion management',0),(12,'management','Set library management parameters',0),(13,'tools','Use tools (export, import, barcodes)',0),(14,'editauthorities','Allow to edit authorities',0),(15,'serials','Allow to manage serials subscriptions',0),(16,'reports','Allow to access to the reports module',0),(17,'staffaccess','Modify login / permissions for staff users',0);
/*!40000 ALTER TABLE `userflags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelfcontents`
--

DROP TABLE IF EXISTS `virtualshelfcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelfcontents` (
  `shelfnumber` int(11) NOT NULL DEFAULT '0',
  `biblionumber` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) DEFAULT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `borrowernumber` int(11) DEFAULT NULL,
  KEY `shelfnumber` (`shelfnumber`),
  KEY `biblionumber` (`biblionumber`),
  KEY `shelfcontents_ibfk_3` (`borrowernumber`),
  CONSTRAINT `virtualshelfcontents_ibfk_1` FOREIGN KEY (`shelfnumber`) REFERENCES `virtualshelves` (`shelfnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shelfcontents_ibfk_2` FOREIGN KEY (`biblionumber`) REFERENCES `biblio` (`biblionumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shelfcontents_ibfk_3` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelfcontents`
--

LOCK TABLES `virtualshelfcontents` WRITE;
/*!40000 ALTER TABLE `virtualshelfcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelfcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelfshares`
--

DROP TABLE IF EXISTS `virtualshelfshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelfshares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelfnumber` int(11) NOT NULL,
  `borrowernumber` int(11) DEFAULT NULL,
  `invitekey` varchar(10) DEFAULT NULL,
  `sharedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `virtualshelfshares_ibfk_1` (`shelfnumber`),
  KEY `virtualshelfshares_ibfk_2` (`borrowernumber`),
  CONSTRAINT `virtualshelfshares_ibfk_1` FOREIGN KEY (`shelfnumber`) REFERENCES `virtualshelves` (`shelfnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `virtualshelfshares_ibfk_2` FOREIGN KEY (`borrowernumber`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelfshares`
--

LOCK TABLES `virtualshelfshares` WRITE;
/*!40000 ALTER TABLE `virtualshelfshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelfshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualshelves`
--

DROP TABLE IF EXISTS `virtualshelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualshelves` (
  `shelfnumber` int(11) NOT NULL AUTO_INCREMENT,
  `shelfname` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `category` varchar(1) DEFAULT NULL,
  `sortfield` varchar(16) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `allow_add` tinyint(1) DEFAULT '0',
  `allow_delete_own` tinyint(1) DEFAULT '1',
  `allow_delete_other` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`shelfnumber`),
  KEY `virtualshelves_ibfk_1` (`owner`),
  CONSTRAINT `virtualshelves_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `borrowers` (`borrowernumber`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualshelves`
--

LOCK TABLES `virtualshelves` WRITE;
/*!40000 ALTER TABLE `virtualshelves` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualshelves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z3950servers`
--

DROP TABLE IF EXISTS `z3950servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z3950servers` (
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `db` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` mediumtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checked` smallint(6) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `syntax` varchar(80) DEFAULT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0',
  `icon` text,
  `position` enum('primary','secondary','') NOT NULL DEFAULT 'primary',
  `type` enum('zed','opensearch') NOT NULL DEFAULT 'zed',
  `encoding` text,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z3950servers`
--

LOCK TABLES `z3950servers` WRITE;
/*!40000 ALTER TABLE `z3950servers` DISABLE KEYS */;
INSERT INTO `z3950servers` VALUES ('lx2.loc.gov',210,'LCDB','','','LIBRARY OF CONGRESS',1,1,1,'USMARC',0,NULL,'primary','zed','utf8',''),('z3950.bnf.fr',2211,'TOUT','Z3950','Z3950_BNF','BNF',2,1,0,'UNIMARC',0,NULL,'primary','zed','utf8','');
/*!40000 ALTER TABLE `z3950servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zebraqueue`
--

DROP TABLE IF EXISTS `zebraqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zebraqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biblio_auth_number` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operation` char(20) NOT NULL DEFAULT '',
  `server` char(20) NOT NULL DEFAULT '',
  `done` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `zebraqueue_lookup` (`server`,`biblio_auth_number`,`operation`,`done`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zebraqueue`
--

LOCK TABLES `zebraqueue` WRITE;
/*!40000 ALTER TABLE `zebraqueue` DISABLE KEYS */;
INSERT INTO `zebraqueue` VALUES (1,1,'specialUpdate','biblioserver',0,'2013-04-30 08:34:08'),(2,2,'specialUpdate','biblioserver',0,'2013-04-30 08:37:27'),(3,3,'specialUpdate','biblioserver',0,'2013-04-30 08:40:04'),(4,4,'specialUpdate','biblioserver',0,'2013-04-30 08:42:56'),(5,5,'specialUpdate','biblioserver',0,'2013-04-30 08:46:40'),(6,6,'specialUpdate','biblioserver',0,'2013-04-30 12:37:43');
/*!40000 ALTER TABLE `zebraqueue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-30 15:21:44