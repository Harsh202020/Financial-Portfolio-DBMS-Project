CREATE DATABASE  IF NOT EXISTS `investors_portfolio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `investors_portfolio`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: investors_portfolio
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `asset_class` varchar(50) NOT NULL,
  `market_cap` float DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `liquidity_level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`asset_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES ('Bonds',1200000000,'Low','Low'),('Fixed Deposits',500000000,'Low','Low'),('Mutual Funds',800000000,'Medium','Medium'),('Stocks',1500000000,'High','High');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonds`
--

DROP TABLE IF EXISTS `bonds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonds` (
  `bond_id` int NOT NULL,
  `bond_name` varchar(255) DEFAULT NULL,
  `investment_id` int DEFAULT NULL,
  `invested_amount` decimal(15,2) DEFAULT NULL,
  `tenure_in_months` int DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `maturity_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bond_id`),
  KEY `investment_id` (`investment_id`),
  CONSTRAINT `bonds_ibfk_1` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonds`
--

LOCK TABLES `bonds` WRITE;
/*!40000 ALTER TABLE `bonds` DISABLE KEYS */;
INSERT INTO `bonds` VALUES (1,'Sovereign Gold Bond',7,450000.00,60,7.50,'Moderate','2021-06-11 18:30:00','2026-06-11 18:30:00'),(2,'Government Savings Bond',10,400000.00,48,6.80,'Low','2022-09-24 18:30:00','2026-09-24 18:30:00'),(3,'Corporate Bond A',15,300000.00,36,8.00,'High','2019-02-07 18:30:00','2022-02-07 18:30:00'),(4,'Sovereign Gold Bond',21,250000.00,60,7.50,'Moderate','2022-09-11 18:30:00','2027-09-11 18:30:00'),(5,'Government Savings Bond',24,350000.00,48,6.80,'Low','2020-10-04 18:30:00','2024-10-04 18:30:00'),(6,'Corporate Bond B',36,600000.00,36,8.20,'High','2020-02-24 18:30:00','2023-02-24 18:30:00'),(7,'Corporate Bond C',43,400000.00,36,8.20,'High','2021-04-18 18:30:00','2024-04-18 18:30:00'),(8,'Corporate Bond D',48,450000.00,48,7.90,'Moderate','2022-10-08 18:30:00','2026-10-08 18:30:00'),(9,'Corporate Bond E',66,150000.00,60,7.20,'Moderate','2021-11-04 18:30:00','2026-11-04 18:30:00'),(10,'Government Savings Bond',71,300000.00,60,7.00,'Low','2023-03-24 18:30:00','2028-03-24 18:30:00');
/*!40000 ALTER TABLE `bonds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_deposits`
--

DROP TABLE IF EXISTS `fixed_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_deposits` (
  `fd_id` int NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `investment_id` int DEFAULT NULL,
  `amount_invested` decimal(15,2) DEFAULT NULL,
  `tenure_in_months` int DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `maturity_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`fd_id`),
  KEY `investment_id` (`investment_id`),
  CONSTRAINT `fixed_deposits_ibfk_1` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_deposits`
--

LOCK TABLES `fixed_deposits` WRITE;
/*!40000 ALTER TABLE `fixed_deposits` DISABLE KEYS */;
INSERT INTO `fixed_deposits` VALUES (1,'State Bank of India',3,750000.00,60,6.50,'Low','2020-07-17 18:30:00','2025-07-17 18:30:00'),(2,'HDFC Bank',6,200000.00,48,6.25,'Low','2021-11-04 18:30:00','2025-11-04 18:30:00'),(3,'ICICI Bank',12,350000.00,36,6.00,'Low','2020-12-19 18:30:00','2023-12-19 18:30:00'),(4,'Bank of Baroda',18,400000.00,60,6.75,'Low','2019-11-18 18:30:00','2024-11-18 18:30:00'),(5,'Axis Bank',22,700000.00,48,6.40,'Low','2021-03-02 18:30:00','2025-03-02 18:30:00'),(6,'Punjab National Bank',27,450000.00,36,6.30,'Low','2022-05-21 18:30:00','2025-05-21 18:30:00'),(7,'State Bank of India',30,400000.00,60,6.50,'Low','2020-01-09 18:30:00','2025-01-09 18:30:00'),(8,'HDFC Bank',33,500000.00,48,6.20,'Low','2021-08-26 18:30:00','2025-08-26 18:30:00'),(9,'ICICI Bank',39,600000.00,36,6.10,'Low','2019-06-12 18:30:00','2022-06-12 18:30:00'),(10,'Bank of Baroda',42,250000.00,60,6.50,'Low','2021-12-06 18:30:00','2026-12-06 18:30:00'),(11,'Axis Bank',45,350000.00,48,6.25,'Low','2020-03-26 18:30:00','2024-03-26 18:30:00'),(12,'Punjab National Bank',49,800000.00,60,6.80,'Low','2021-06-02 18:30:00','2026-06-02 18:30:00'),(13,'State Bank of India',53,150000.00,36,6.10,'Low','2021-02-09 18:30:00','2024-02-09 18:30:00'),(14,'HDFC Bank',59,150000.00,48,6.30,'Low','2020-04-11 18:30:00','2024-04-11 18:30:00'),(15,'ICICI Bank',64,200000.00,36,6.20,'Low','2021-06-09 18:30:00','2024-06-09 18:30:00'),(16,'Bank of Baroda',68,300000.00,60,6.50,'Low','2020-04-17 18:30:00','2025-04-17 18:30:00'),(17,'Axis Bank',72,150000.00,48,6.30,'Low','2020-03-10 18:30:00','2024-03-10 18:30:00'),(18,'Punjab National Bank',77,100000.00,36,6.00,'Low','2022-05-21 18:30:00','2025-05-21 18:30:00'),(19,'State Bank of India',82,300000.00,60,6.40,'Low','2020-10-12 18:30:00','2025-10-12 18:30:00');
/*!40000 ALTER TABLE `fixed_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investments`
--

DROP TABLE IF EXISTS `investments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investments` (
  `investment_id` int NOT NULL,
  `investor_id` int DEFAULT NULL,
  `asset_class` varchar(50) DEFAULT NULL,
  `amount_invested` decimal(15,2) DEFAULT NULL,
  `date_invested` date DEFAULT NULL,
  PRIMARY KEY (`investment_id`),
  KEY `investor_id` (`investor_id`),
  KEY `asset_class` (`asset_class`),
  CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`investor_id`) REFERENCES `investor` (`investor_id`),
  CONSTRAINT `investments_ibfk_2` FOREIGN KEY (`asset_class`) REFERENCES `assets` (`asset_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investments`
--

LOCK TABLES `investments` WRITE;
/*!40000 ALTER TABLE `investments` DISABLE KEYS */;
INSERT INTO `investments` VALUES (1,1,'Stocks',1000000.00,'2020-01-15'),(2,2,'Mutual Funds',500000.00,'2019-03-11'),(3,3,'Fixed Deposits',750000.00,'2020-07-18'),(4,4,'Stocks',300000.00,'2021-04-25'),(5,5,'Mutual Funds',600000.00,'2022-08-15'),(6,6,'Fixed Deposits',200000.00,'2021-11-05'),(7,7,'Bonds',450000.00,'2021-06-12'),(8,8,'Stocks',900000.00,'2023-01-17'),(9,9,'Mutual Funds',250000.00,'2020-03-14'),(10,10,'Bonds',400000.00,'2022-09-25'),(11,11,'Stocks',700000.00,'2022-10-30'),(12,12,'Fixed Deposits',350000.00,'2020-12-20'),(13,13,'Mutual Funds',550000.00,'2023-04-10'),(14,14,'Stocks',800000.00,'2023-05-25'),(15,15,'Bonds',300000.00,'2019-02-08'),(16,16,'Mutual Funds',650000.00,'2021-07-04'),(17,17,'Stocks',200000.00,'2020-02-12'),(18,18,'Fixed Deposits',400000.00,'2019-11-19'),(19,19,'Mutual Funds',900000.00,'2022-01-09'),(20,20,'Stocks',500000.00,'2021-06-06'),(21,21,'Bonds',250000.00,'2022-09-12'),(22,22,'Fixed Deposits',700000.00,'2021-03-03'),(23,23,'Stocks',600000.00,'2023-02-14'),(24,24,'Bonds',350000.00,'2020-10-05'),(25,25,'Mutual Funds',800000.00,'2022-12-20'),(26,26,'Stocks',300000.00,'2023-04-18'),(27,27,'Fixed Deposits',450000.00,'2022-05-22'),(28,28,'Mutual Funds',550000.00,'2021-06-16'),(29,29,'Stocks',700000.00,'2023-07-23'),(30,30,'Fixed Deposits',400000.00,'2020-01-10'),(31,31,'Mutual Funds',600000.00,'2022-09-11'),(32,32,'Stocks',250000.00,'2020-12-31'),(33,33,'Fixed Deposits',500000.00,'2021-08-27'),(34,34,'Mutual Funds',300000.00,'2022-07-01'),(35,35,'Stocks',400000.00,'2021-09-15'),(36,36,'Bonds',600000.00,'2020-02-25'),(37,37,'Mutual Funds',900000.00,'2021-11-09'),(38,38,'Stocks',700000.00,'2023-04-11'),(39,39,'Fixed Deposits',600000.00,'2019-06-13'),(40,40,'Mutual Funds',800000.00,'2022-05-14'),(41,41,'Stocks',600000.00,'2023-03-20'),(42,42,'Fixed Deposits',250000.00,'2021-12-07'),(43,43,'Bonds',400000.00,'2021-04-19'),(44,44,'Stocks',500000.00,'2023-01-22'),(45,45,'Fixed Deposits',350000.00,'2020-03-27'),(46,46,'Mutual Funds',900000.00,'2023-07-30'),(47,47,'Stocks',300000.00,'2020-05-16'),(48,48,'Bonds',450000.00,'2022-10-09'),(49,49,'Fixed Deposits',800000.00,'2021-06-03'),(50,50,'Stocks',100000.00,'2020-01-15'),(51,50,'Mutual Funds',50000.00,'2021-06-11'),(52,50,'Bonds',50000.00,'2022-03-15'),(53,51,'Fixed Deposits',150000.00,'2021-02-10'),(54,51,'Stocks',200000.00,'2022-08-05'),(55,51,'Mutual Funds',100000.00,'2023-01-14'),(56,52,'Stocks',400000.00,'2020-07-01'),(57,52,'Mutual Funds',300000.00,'2021-09-23'),(58,52,'Bonds',200000.00,'2022-11-10'),(59,53,'Fixed Deposits',150000.00,'2020-04-12'),(60,53,'Stocks',100000.00,'2023-07-15'),(61,54,'Mutual Funds',200000.00,'2021-05-21'),(62,54,'Stocks',200000.00,'2022-11-10'),(63,55,'Stocks',300000.00,'2020-09-15'),(64,55,'Fixed Deposits',200000.00,'2021-06-10'),(65,55,'Mutual Funds',200000.00,'2022-08-19'),(66,56,'Bonds',150000.00,'2021-11-05'),(67,56,'Stocks',200000.00,'2023-01-20'),(68,57,'Fixed Deposits',300000.00,'2020-04-18'),(69,57,'Stocks',250000.00,'2022-06-15'),(70,58,'Stocks',500000.00,'2021-07-10'),(71,58,'Bonds',300000.00,'2023-03-25'),(72,59,'Fixed Deposits',150000.00,'2020-03-11'),(73,59,'Mutual Funds',150000.00,'2022-09-09'),(74,60,'Stocks',350000.00,'2020-05-16'),(75,60,'Mutual Funds',300000.00,'2022-11-17'),(76,61,'Bonds',100000.00,'2020-01-11'),(77,61,'Fixed Deposits',100000.00,'2022-05-22'),(78,62,'Stocks',250000.00,'2020-08-18'),(79,62,'Mutual Funds',150000.00,'2023-04-10'),(80,63,'Mutual Funds',500000.00,'2021-09-22'),(81,63,'Stocks',400000.00,'2023-06-19'),(82,64,'Fixed Deposits',300000.00,'2020-10-13'),(83,64,'Stocks',200000.00,'2022-12-14');
/*!40000 ALTER TABLE `investments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investor` (
  `investor_id` int NOT NULL,
  `investor_name` varchar(255) DEFAULT NULL,
  `invested_amount` float DEFAULT NULL,
  `current_value` float DEFAULT NULL,
  `returns` float DEFAULT NULL,
  `risk_profile` varchar(100) DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES (1,'Aarav Sharma',1000000,6000000,500,'High',9876543210,'aarav.sharma@example.com'),(2,'Vivaan Patel',500000,475000,-5,'Medium',9876543211,'vivaan.patel@example.com'),(3,'Aditya Verma',750000,1300000,73.33,'Low',9876543212,'aditya.verma@example.com'),(4,'Sai Kumar',300000,900000,200,'High',9876543213,'sai.kumar@example.com'),(5,'Reyansh Gupta',600000,900000,50,'Medium',9876543214,'reyansh.gupta@example.com'),(6,'Krishna Iyer',200000,210000,5,'Low',9876543215,'krishna.iyer@example.com'),(7,'Aarohi Singh',450000,540000,20,'Medium',9876543216,'aarohi.singh@example.com'),(8,'Kabir Joshi',900000,600000,-33.33,'High',9876543217,'kabir.joshi@example.com'),(9,'Diya Reddy',250000,340000,36,'Low',9876543218,'diya.reddy@example.com'),(10,'Karan Mehta',400000,360000,-10,'Medium',9876543219,'karan.mehta@example.com'),(11,'Simran Kapoor',700000,900000,28.57,'High',9876543220,'simran.kapoor@example.com'),(12,'Rohit Sethi',350000,380000,8.57,'Low',9876543221,'rohit.sethi@example.com'),(13,'Neha Bansal',550000,770000,40,'Medium',9876543222,'neha.bansal@example.com'),(14,'Ananya Nair',800000,1600000,100,'High',9876543223,'ananya.nair@example.com'),(15,'Nishant Choudhury',300000,315000,5,'Low',9876543224,'nishant.choudhury@example.com'),(16,'Riya Saxena',650000,450000,-30.77,'Medium',9876543225,'riya.saxena@example.com'),(17,'Tarun Rao',200000,240000,20,'High',9876543226,'tarun.rao@example.com'),(18,'Siddharth Rani',400000,410000,2.5,'Low',9876543227,'siddharth.rani@example.com'),(19,'Ravi Yadav',900000,2000000,122.22,'Medium',9876543228,'ravi.yadav@example.com'),(20,'Pooja Jain',500000,1100000,120,'High',9876543229,'pooja.jain@example.com'),(21,'Kavya Bhattacharya',250000,300000,20,'Low',9876543230,'kavya.bhattacharya@example.com'),(22,'Mohit Ghosh',700000,740000,5.71,'Medium',9876543231,'mohit.ghosh@example.com'),(23,'Sanya Malhotra',600000,620000,3.33,'High',9876543232,'sanya.malhotra@example.com'),(24,'Anuj Khanna',350000,370000,5.71,'Low',9876543233,'anuj.khanna@example.com'),(25,'Tanya Agarwal',800000,840000,5,'Medium',9876543234,'tanya.agarwal@example.com'),(26,'Vikas Soni',300000,315000,5,'High',9876543235,'vikas.soni@example.com'),(27,'Priya Sharma',450000,470000,4.44,'Low',9876543236,'priya.sharma@example.com'),(28,'Ajay Bhatia',550000,580000,5.45,'Medium',9876543237,'ajay.bhatia@example.com'),(29,'Chaitanya Tripathi',700000,800000,14.29,'High',9876543238,'chaitanya.tripathi@example.com'),(30,'Kriti Patel',400000,440000,10,'Low',9876543239,'kriti.patel@example.com'),(31,'Gaurav Joshi',600000,700000,16.67,'Medium',9876543240,'gaurav.joshi@example.com'),(32,'Tanvi Sahu',250000,350000,40,'High',9876543241,'tanvi.sahu@example.com'),(33,'Bharat Dubey',500000,1000000,100,'Low',9876543242,'bharat.dubey@example.com'),(34,'Sneha Singh',300000,310000,3.33,'Medium',9876543243,'sneha.singh@example.com'),(35,'Harman Thakur',400000,380000,-5,'High',9876543244,'harman.thakur@example.com'),(36,'Neeraj Ahuja',600000,630000,5,'Low',9876543245,'neeraj.ahuja@example.com'),(37,'Rohan Khanna',900000,750000,-16.67,'Medium',9876543246,'rohan.khanna@example.com'),(38,'Aditi Gupta',700000,1000000,42.86,'High',9876543247,'aditi.gupta@example.com'),(39,'Vijay Reddy',600000,780000,30,'Low',9876543248,'vijay.reddy@example.com'),(40,'Shivani Yadav',800000,400000,-50,'Medium',9876543249,'shivani.yadav@example.com'),(41,'Amit Sethi',600000,640000,6.67,'High',9876543250,'amit.sethi@example.com'),(42,'Diksha Jain',250000,260000,4,'Low',9876543251,'diksha.jain@example.com'),(43,'Suraj Singh',400000,410000,2.5,'Medium',9876543252,'suraj.singh@example.com'),(44,'Parul Sharma',500000,480000,-4,'High',9876543253,'parul.sharma@example.com'),(45,'Kabir Yadav',350000,350000,0,'Low',9876543254,'kabir.yadav@example.com'),(46,'Vinay Choudhury',900000,1000000,11.11,'Medium',9876543255,'vinay.choudhury@example.com'),(47,'Neha Gupta',300000,290000,-3.33,'High',9876543256,'neha.gupta@example.com'),(48,'Ananya Khanna',450000,460000,2.22,'Low',9876543257,'ananya.khanna@example.com'),(49,'Rohit Mehta',800000,850000,6.25,'Medium',9876543258,'rohit.mehta@example.com'),(50,'Krishna Reddy',200000,300000,50,'Medium',9876543215,'krishna.reddy@example.com'),(51,'Meera Joshi',450000,675000,50,'Low',9876543216,'meera.joshi@example.com'),(52,'Arjun Nair',900000,1800000,100,'High',9876543217,'arjun.nair@example.com'),(53,'Isha Singh',250000,262500,5,'Medium',9876543218,'isha.singh@example.com'),(54,'Devansh Roy',400000,460000,15,'Low',9876543219,'devansh.roy@example.com'),(55,'Aditi Desai',700000,805000,15,'Medium',9876543220,'aditi.desai@example.com'),(56,'Rohan Mishra',350000,490000,40,'High',9876543221,'rohan.mishra@example.com'),(57,'Naina Agarwal',550000,770000,40,'Medium',9876543222,'naina.agarwal@example.com'),(58,'Kavya Mehta',800000,1040000,30,'Low',9876543223,'kavya.mehta@example.com'),(59,'Aarohi Chauhan',300000,420000,40,'High',9876543224,'aarohi.chauhan@example.com'),(60,'Tanmay Singh',650000,845000,30,'Medium',9876543225,'tanmay.singh@example.com'),(61,'Pranav Sharma',200000,270000,35,'Low',9876543226,'pranav.sharma@example.com'),(62,'Saanvi Rao',400000,480000,20,'Medium',9876543227,'saanvi.rao@example.com'),(63,'Ayaan Malik',900000,1350000,50,'High',9876543228,'ayaan.malik@example.com'),(64,'Ritika Kapoor',500000,575000,15,'Low',9876543229,'ritika.kapoor@example.com');
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutual_funds`
--

DROP TABLE IF EXISTS `mutual_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutual_funds` (
  `fund_name` varchar(255) DEFAULT NULL,
  `fund_type` varchar(100) DEFAULT NULL,
  `fund_manager` varchar(100) DEFAULT NULL,
  `investment_id` int DEFAULT NULL,
  `invested_amount` float DEFAULT NULL,
  `no_of_units` float DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `returns` decimal(15,2) DEFAULT NULL,
  `current_value` float DEFAULT NULL,
  `date_of_investment` timestamp NULL DEFAULT NULL,
  KEY `investment_id` (`investment_id`),
  CONSTRAINT `mutual_funds_ibfk_1` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutual_funds`
--

LOCK TABLES `mutual_funds` WRITE;
/*!40000 ALTER TABLE `mutual_funds` DISABLE KEYS */;
INSERT INTO `mutual_funds` VALUES ('HDFC Equity Fund','Equity','Rakesh Shah',2,500000,2000,'High',12.50,560000,'2019-03-10 18:30:00'),('SBI Bluechip Fund','Bluechip','Anjali Mehta',5,600000,1800,'Moderate',8.75,650000,'2022-08-14 18:30:00'),('Axis Long Term Equity Fund','Tax Saver','Vikram Joshi',9,250000,900,'High',10.30,275000,'2020-03-13 18:30:00'),('Kotak Standard Multicap Fund','Multicap','Shalini Singh',13,550000,1400,'Moderate',9.20,610000,'2023-04-09 18:30:00'),('ICICI Prudential Value Discovery Fund','Value','Rajesh Rao',16,650000,1600,'Moderate',11.10,720000,'2021-07-03 18:30:00'),('Mirae Asset Large Cap Fund','Large Cap','Sneha Kapoor',19,900000,2000,'Moderate',8.90,975000,'2022-01-08 18:30:00'),('HDFC Balanced Advantage Fund','Balanced','Priya Verma',25,800000,1500,'Low',7.60,860000,'2022-12-19 18:30:00'),('UTI Flexi Cap Fund','Flexi Cap','Alok Tandon',28,550000,1200,'Moderate',9.40,600000,'2021-06-15 18:30:00'),('Franklin India Smaller Companies Fund','Small Cap','Meera Nair',31,600000,1700,'High',12.00,670000,'2022-09-10 18:30:00'),('Nippon India Growth Fund','Mid Cap','Kiran Rao',34,300000,900,'Moderate',8.30,325000,'2022-06-30 18:30:00'),('Canara Robeco Emerging Equities','Equity','Sachin Kumar',37,900000,2000,'High',10.00,990000,'2021-11-08 18:30:00'),('DSP Tax Saver Fund','Tax Saver','Varun Desai',40,800000,1700,'Moderate',7.80,860000,'2022-05-13 18:30:00'),('IDFC Core Equity Fund','Core Equity','Nidhi Agarwal',46,900000,1800,'High',11.50,985000,'2023-07-29 18:30:00'),('Principal Emerging Bluechip Fund','Emerging Bluechip','Rajat Mehra',51,100000,350,'High',12.75,112750,'2023-01-13 18:30:00'),('Sundaram Large Cap Fund','Large Cap','Nishant Jain',55,200000,600,'Moderate',9.60,219200,'2022-08-18 18:30:00'),('Tata Mid Cap Growth Fund','Mid Cap','Kavita Rathi',61,150000,450,'Moderate',10.20,165300,'2021-05-20 18:30:00'),('LIC MF Index Fund','Index Fund','Harish Chandra',73,150000,500,'Low',6.50,159750,'2022-09-08 18:30:00'),('Motilal Oswal Focused 25 Fund','Focused','Amit Kapoor',75,300000,1000,'High',13.20,339600,'2022-11-16 18:30:00'),('Aditya Birla Sun Life Equity Fund','Equity','Siddharth Shukla',79,150000,450,'Moderate',8.10,162150,'2023-04-09 18:30:00'),('Invesco India Contra Fund','Contra','Arjun Sinha',80,500000,1250,'High',9.75,547500,'2021-09-21 18:30:00');
/*!40000 ALTER TABLE `mutual_funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_name` varchar(255) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `investment_id` int DEFAULT NULL,
  `invested_amount` float DEFAULT NULL,
  `no_of_share` int DEFAULT NULL,
  `risk_level` varchar(50) DEFAULT NULL,
  `returns` decimal(15,2) DEFAULT NULL,
  `current_value` float DEFAULT NULL,
  `date_of_investment` timestamp NULL DEFAULT NULL,
  KEY `investment_id` (`investment_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES ('Reliance Industries','Energy',1,1000000,100,'Medium',150000.00,1150000,'2020-01-14 18:30:00'),('Tata Consultancy Services','IT',4,300000,20,'Low',60000.00,360000,'2021-04-24 18:30:00'),('Infosys','IT',8,900000,50,'Medium',180000.00,1080000,'2023-01-16 18:30:00'),('HDFC Bank','Banking',11,700000,30,'Low',105000.00,805000,'2022-10-29 18:30:00'),('ICICI Bank','Banking',14,800000,25,'Low',120000.00,920000,'2023-05-24 18:30:00'),('Asian Paints','Consumer Goods',17,200000,15,'Low',30000.00,230000,'2020-02-11 18:30:00'),('Bharti Airtel','Telecom',20,500000,100,'Medium',75000.00,575000,'2021-06-05 18:30:00'),('Larsen & Toubro','Infrastructure',23,600000,20,'High',90000.00,690000,'2023-02-13 18:30:00'),('Bajaj Finance','Finance',26,300000,10,'High',45000.00,345000,'2023-04-17 18:30:00'),('State Bank of India','Banking',29,700000,40,'Medium',105000.00,805000,'2023-07-22 18:30:00'),('Mahindra & Mahindra','Automobile',32,250000,25,'Medium',37500.00,287500,'2020-12-30 18:30:00'),('UltraTech Cement','Construction',35,400000,10,'High',60000.00,460000,'2021-09-14 18:30:00'),('HCL Technologies','IT',38,700000,35,'Medium',105000.00,805000,'2023-04-10 18:30:00'),('Wipro','IT',41,600000,30,'Low',90000.00,690000,'2023-03-19 18:30:00'),('Axis Bank','Banking',44,500000,25,'Medium',75000.00,575000,'2023-01-21 18:30:00'),('Maruti Suzuki','Automobile',47,300000,15,'High',45000.00,345000,'2020-05-15 18:30:00'),('Hindustan Unilever','Consumer Goods',50,100000,10,'Low',15000.00,115000,'2020-01-14 18:30:00'),('ITC','Consumer Goods',54,200000,30,'Low',30000.00,230000,'2022-08-04 18:30:00'),('Adani Enterprises','Conglomerate',56,400000,20,'High',60000.00,460000,'2020-06-30 18:30:00'),('NTPC','Energy',60,350000,50,'Medium',52500.00,402500,'2020-05-15 18:30:00'),('Coal India','Mining',63,300000,100,'Medium',45000.00,345000,'2020-09-14 18:30:00'),('Power Grid Corporation','Energy',67,200000,60,'Low',30000.00,230000,'2023-01-19 18:30:00'),('JSW Steel','Steel',69,250000,80,'Medium',37500.00,287500,'2022-06-14 18:30:00'),('Reliance Industries','Energy',70,500000,100,'Moderate',10.50,550000,'2021-07-09 18:30:00'),('Grasim Industries','Conglomerate',74,350000,40,'High',52500.00,402500,'2020-05-15 18:30:00'),('Tata Steel','Steel',78,250000,35,'Medium',37500.00,287500,'2020-08-17 18:30:00'),('IndusInd Bank','Banking',81,400000,20,'High',60000.00,460000,'2023-06-18 18:30:00'),('Sun Pharmaceuticals','Pharmaceutical',83,200000,25,'Low',30000.00,230000,'2022-12-13 18:30:00');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `roll_no` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  PRIMARY KEY (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'amit sharma','b.tech',95),(2,'Neha Gupta','B.sc',90);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27 10:08:09
