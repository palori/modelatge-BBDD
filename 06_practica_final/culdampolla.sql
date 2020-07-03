-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: culdampolla
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id_address` int unsigned NOT NULL,
  `carrer` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `numero` int unsigned DEFAULT NULL,
  `pis` int DEFAULT NULL,
  `porta` varchar(4) COLLATE utf8_czech_ci DEFAULT NULL,
  `ciutat` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `codi_postal` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL,
  `pais` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (5001,'carrer1',1,1,'1','Ciutat1','08001','Espanya'),(5002,'carrer2',2,2,'2','Ciutat2','08002','Espanya'),(5003,'carrer3',3,1,'3','Ciutat3','08003','Espanya'),(5004,'carrer4',4,2,'4','Ciutat1','08001','Espanya'),(5005,'carrer5',5,1,'1','Ciutat2','08002','Espanya'),(5006,'carrer6',6,2,'2','Ciutat3','08003','Espanya'),(5007,'carrer1',7,1,'3','Ciutat1','08001','Espanya'),(5008,'carrer2',8,2,'4','Ciutat2','08002','Espanya'),(5009,'carrer3',9,1,'A','Ciutat3','08003','Espanya'),(5010,'carrer4',10,2,'B','Ciutat1','08001','Espanya'),(5011,'carrer5',11,1,'C','Ciutat1','08001','Espanya');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int unsigned NOT NULL,
  `nom` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `id_contacte` int unsigned NOT NULL,
  `recomanat_per_un_client` binary(1) DEFAULT NULL,
  `id_client_recomanador` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fk_clients_contactes1_idx` (`id_contacte`),
  KEY `fk_clients_clients1_idx` (`id_client_recomanador`),
  CONSTRAINT `fk_clients_clients1` FOREIGN KEY (`id_client_recomanador`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_clients_contactes1` FOREIGN KEY (`id_contacte`) REFERENCES `contactes` (`id_contacte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (2001,'Alba',4009,_binary '0',NULL),(2002,'Bernat',4010,_binary '0',NULL),(2003,'Carles',4011,_binary '1',2002);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactes`
--

DROP TABLE IF EXISTS `contactes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactes` (
  `id_contacte` int unsigned NOT NULL,
  `telefon` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL,
  `fax` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `data_registre` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_address` int unsigned NOT NULL,
  PRIMARY KEY (`id_contacte`),
  KEY `fk_contactes_addresses_idx` (`id_address`),
  CONSTRAINT `fk_contactes_addresses` FOREIGN KEY (`id_address`) REFERENCES `addresses` (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactes`
--

LOCK TABLES `contactes` WRITE;
/*!40000 ALTER TABLE `contactes` DISABLE KEYS */;
INSERT INTO `contactes` VALUES (4001,'600600601','','albert@culdampolla.com','2017-07-23 11:10:11',5001),(4002,'600600602','','berta@culdampolla.com','2017-07-23 11:10:11',5002),(4003,'600600603','','clara@culdampolla.com','2017-07-23 11:10:11',5003),(4004,'600600604','','david@culdampolla.com','2017-07-23 11:10:11',5004),(4005,'600600605','930003001','ull@casaulleres.com','2017-07-23 11:10:11',5005),(4006,'600600606','930003002','ull@afagaselchollo.com','2017-07-23 11:10:11',5006),(4007,'600600607','930003003','ull@mercadona.com','2017-07-23 11:10:11',5007),(4008,'600600608','930003004','ull@carglass.com','2017-07-23 11:10:11',5008),(4009,'600600609','','alba@gmail.com','2017-07-23 11:10:11',5009),(4010,'600600610','','bernat@hotmail.com','2017-07-23 11:10:11',5010),(4011,'600600611','','carles@yahoo.com','2017-07-23 11:10:11',5011);
/*!40000 ALTER TABLE `contactes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id_empleat` int unsigned NOT NULL,
  `nom` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `id_contacte` int unsigned NOT NULL,
  `carrec` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_empleat`),
  KEY `fk_empleats_contactes1_idx` (`id_contacte`),
  CONSTRAINT `fk_empleats_contactes1` FOREIGN KEY (`id_contacte`) REFERENCES `contactes` (`id_contacte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1001,'Albert',4001,'Encarregat'),(1002,'Berta',4002,'Dependent'),(1003,'Clara',4003,'Dependent'),(1004,'David',4004,'Dependent');
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduacions`
--

DROP TABLE IF EXISTS `graduacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduacions` (
  `id_graduacio` int unsigned NOT NULL,
  `ull` varchar(1) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'D = dret\nE = esquerre',
  `miopia` float DEFAULT NULL,
  `hipermetropia` float DEFAULT NULL,
  `estigmatisme` float DEFAULT NULL,
  PRIMARY KEY (`id_graduacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduacions`
--

LOCK TABLES `graduacions` WRITE;
/*!40000 ALTER TABLE `graduacions` DISABLE KEYS */;
INSERT INTO `graduacions` VALUES (401,'D',1,0,0),(402,'E',1,0,0),(403,'D',2.5,0,1),(404,'E',3,0,1.5),(405,'D',0,0,2),(406,'E',0,0,1),(407,'D',1,1,1),(408,'E',1,1,1);
/*!40000 ALTER TABLE `graduacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marques`
--

DROP TABLE IF EXISTS `marques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marques` (
  `id_marca` int unsigned NOT NULL,
  `nom` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `id_proveidor` int unsigned NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `fk_marques_proveidors1_idx` (`id_proveidor`),
  CONSTRAINT `fk_marques_proveidors1` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidors` (`id_proveidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marques`
--

LOCK TABLES `marques` WRITE;
/*!40000 ALTER TABLE `marques` DISABLE KEYS */;
INSERT INTO `marques` VALUES (101,'Polo',3001),(102,'Ray Ban',3002),(103,'Afflelou',3002),(104,'Police',3001),(105,'Hacendado',3003),(106,'Clear glass',3001),(107,'Carglass',3004);
/*!40000 ALTER TABLE `marques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montures`
--

DROP TABLE IF EXISTS `montures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `montures` (
  `id_montura` int unsigned NOT NULL,
  `tipus` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'Opcions:\nflotant\npasta\nmetàl·lica',
  `preu` float unsigned DEFAULT NULL,
  `id_marca` int unsigned NOT NULL,
  PRIMARY KEY (`id_montura`),
  KEY `fk_montures_marques1_idx` (`id_marca`),
  CONSTRAINT `fk_montures_marques1` FOREIGN KEY (`id_marca`) REFERENCES `marques` (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montures`
--

LOCK TABLES `montures` WRITE;
/*!40000 ALTER TABLE `montures` DISABLE KEYS */;
INSERT INTO `montures` VALUES (201,'flotant',200,101),(202,'pasta',99,102),(203,'metàl·lica',120,103),(204,'pasta',49.99,105);
/*!40000 ALTER TABLE `montures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidors` (
  `id_proveidor` int unsigned NOT NULL,
  `nom` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `nif` varchar(8) COLLATE utf8_czech_ci DEFAULT NULL,
  `id_contacte` int unsigned NOT NULL,
  PRIMARY KEY (`id_proveidor`),
  KEY `fk_proveidors_contactes1_idx` (`id_contacte`),
  CONSTRAINT `fk_proveidors_contactes1` FOREIGN KEY (`id_contacte`) REFERENCES `contactes` (`id_contacte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidors`
--

LOCK TABLES `proveidors` WRITE;
/*!40000 ALTER TABLE `proveidors` DISABLE KEYS */;
INSERT INTO `proveidors` VALUES (3001,'Casa ulleres','B0003001',4005),(3002,'A gafas el chollo?','B0003002',4006),(3003,'Mercadona','B0003003',4007),(3004,'Carglass','B0003004',4008);
/*!40000 ALTER TABLE `proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id_ullera` int unsigned NOT NULL,
  `preu` float unsigned DEFAULT NULL,
  `id_montura` int unsigned NOT NULL,
  `id_empleat_venedor` int unsigned DEFAULT NULL,
  `id_client` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_ullera`),
  KEY `fk_ulleres_montures1_idx` (`id_montura`),
  KEY `fk_ulleres_empleats1_idx` (`id_empleat_venedor`),
  KEY `fk_ulleres_clients1_idx` (`id_client`),
  CONSTRAINT `fk_ulleres_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_ulleres_empleats1` FOREIGN KEY (`id_empleat_venedor`) REFERENCES `empleats` (`id_empleat`),
  CONSTRAINT `fk_ulleres_montures1` FOREIGN KEY (`id_montura`) REFERENCES `montures` (`id_montura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (601,NULL,201,1001,2001),(602,NULL,202,1002,2001),(603,NULL,203,1003,2002),(604,NULL,204,1001,2003),(605,NULL,201,NULL,NULL),(606,NULL,201,NULL,NULL),(607,NULL,202,NULL,NULL),(608,NULL,203,NULL,NULL),(609,NULL,204,NULL,NULL);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidres`
--

DROP TABLE IF EXISTS `vidres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidres` (
  `id_vidre` int unsigned NOT NULL,
  `color` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `preu` float unsigned DEFAULT NULL,
  `id_marca` int unsigned NOT NULL,
  PRIMARY KEY (`id_vidre`),
  KEY `fk_vidres_marques1_idx` (`id_marca`),
  CONSTRAINT `fk_vidres_marques1` FOREIGN KEY (`id_marca`) REFERENCES `marques` (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidres`
--

LOCK TABLES `vidres` WRITE;
/*!40000 ALTER TABLE `vidres` DISABLE KEYS */;
INSERT INTO `vidres` VALUES (301,'transparent',25,106),(302,'transparent',50,106),(303,'polaritzat',30,106),(304,'polaritzat',60,106),(305,'blau',5,107);
/*!40000 ALTER TABLE `vidres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidres_ulleres`
--

DROP TABLE IF EXISTS `vidres_ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidres_ulleres` (
  `id_vidre_ullera` int unsigned NOT NULL,
  `id_ullera` int unsigned DEFAULT NULL,
  `id_graduacio` int unsigned DEFAULT NULL,
  `id_vidre` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_vidre_ullera`),
  KEY `fk_vidres_ulls_ulleres_ulleres1_idx` (`id_ullera`),
  KEY `fk_vidres_ulls_ulleres_graduacions1_idx` (`id_graduacio`),
  KEY `fk_vidres_ulls_ulleres_vidres1_idx` (`id_vidre`),
  CONSTRAINT `fk_vidres_ulls_ulleres_graduacions1` FOREIGN KEY (`id_graduacio`) REFERENCES `graduacions` (`id_graduacio`),
  CONSTRAINT `fk_vidres_ulls_ulleres_ulleres1` FOREIGN KEY (`id_ullera`) REFERENCES `ulleres` (`id_ullera`),
  CONSTRAINT `fk_vidres_ulls_ulleres_vidres1` FOREIGN KEY (`id_vidre`) REFERENCES `vidres` (`id_vidre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidres_ulleres`
--

LOCK TABLES `vidres_ulleres` WRITE;
/*!40000 ALTER TABLE `vidres_ulleres` DISABLE KEYS */;
INSERT INTO `vidres_ulleres` VALUES (501,601,401,302),(502,601,402,302),(503,602,403,304),(504,602,404,304),(505,603,405,301),(506,603,406,301),(507,604,407,305),(508,604,408,305);
/*!40000 ALTER TABLE `vidres_ulleres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-03  9:12:06
