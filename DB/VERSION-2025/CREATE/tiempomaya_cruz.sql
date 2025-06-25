-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tiempomaya
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `cruz`
--

DROP TABLE IF EXISTS `cruz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cruz` (
  `nacimiento` int NOT NULL,
  `izquierdo` int NOT NULL,
  `derecho` int NOT NULL,
  `destino` int NOT NULL,
  `concepcion` int DEFAULT NULL,
  PRIMARY KEY (`nacimiento`),
  KEY `izquierdo` (`izquierdo`),
  KEY `derecho` (`derecho`),
  KEY `destino` (`destino`),
  KEY `concepcion` (`concepcion`),
  CONSTRAINT `cruz_ibfk_1` FOREIGN KEY (`nacimiento`) REFERENCES `nahual` (`idweb`),
  CONSTRAINT `cruz_ibfk_2` FOREIGN KEY (`izquierdo`) REFERENCES `nahual` (`idweb`),
  CONSTRAINT `cruz_ibfk_3` FOREIGN KEY (`derecho`) REFERENCES `nahual` (`idweb`),
  CONSTRAINT `cruz_ibfk_4` FOREIGN KEY (`destino`) REFERENCES `nahual` (`idweb`),
  CONSTRAINT `cruz_ibfk_5` FOREIGN KEY (`concepcion`) REFERENCES `nahual` (`idweb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 22:08:01
