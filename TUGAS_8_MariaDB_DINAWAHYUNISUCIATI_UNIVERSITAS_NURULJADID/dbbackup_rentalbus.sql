-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_rental_bus
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `kendaraan`
--

DROP TABLE IF EXISTS `kendaraan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopol` varchar(20) NOT NULL,
  `idmerek` int(11) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `tahunrakit` varchar(5) NOT NULL,
  `seat` int(11) NOT NULL,
  `fasilitas` text NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `status` enum('Bebas','Jalan') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nopol_UNIQUE` (`nopol`),
  KEY `fk_kendaraan_merek` (`idmerek`),
  CONSTRAINT `fk_kendaraan_merek` FOREIGN KEY (`idmerek`) REFERENCES `merek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kendaraan`
--

LOCK TABLES `kendaraan` WRITE;
/*!40000 ALTER TABLE `kendaraan` DISABLE KEYS */;
INSERT INTO `kendaraan` VALUES (1,'B 1111 VGA',1,'NKR 55 CO','2011',11,'Reclining seats,LCD,Multimedia player,Toilet',NULL,'Jalan'),(2,'B 2222 VGA',2,'Dutro Bus 130 MDBL','2011',20,'Reclining seats,LCD','B 2222 VGA.jpg','Bebas'),(3,'B 3333 VGA',2,'R 260','2011',43,'Reclining seats,Foot rests,LCD,Multimedia player,Wireless microphone,Koneksi wifi','B 3333 VGA.jpg','Jalan');
/*!40000 ALTER TABLE `kendaraan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merek`
--

DROP TABLE IF EXISTS `merek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_UNIQUE` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merek`
--

LOCK TABLES `merek` WRITE;
/*!40000 ALTER TABLE `merek` DISABLE KEYS */;
INSERT INTO `merek` VALUES (2,'Hino'),(1,'Isuzu'),(4,'MAN'),(5,'Mercedes Benz'),(3,'Scania');
/*!40000 ALTER TABLE `merek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'Budi','Tanah Baru Depok','123456',''),(2,'Ani','Lenteng Agung','123654',''),(3,'Dewi','Srengseng Sawah','321456',''),(4,'Siti','Kelapa Dua Wetan','654321',''),(5,'Deden','Bambu Apus','876543','');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sopir`
--

DROP TABLE IF EXISTS `sopir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ktp` varchar(30) NOT NULL,
  `sim` varchar(30) NOT NULL,
  `status` enum('Bebas','Jalan') NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sopir`
--

LOCK TABLES `sopir` WRITE;
/*!40000 ALTER TABLE `sopir` DISABLE KEYS */;
INSERT INTO `sopir` VALUES (1,'Alexander','Jakarta','08181111','alexander@gmail.com','12341111','67891111','Jalan','12341111.jpg'),(2,'Andreas','Bekasi','08182222','andreas@gmail.com','12342222','67892222','Bebas','12342222.jpg'),(3,'Bimo','Depok','08183333','bimo@gmail.com','12343333','67893333','Jalan','12343333.jpg');
/*!40000 ALTER TABLE `sopir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idkendaraan` int(11) NOT NULL,
  `perhari` double NOT NULL,
  `overtime` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tarif_kendaraan1` (`idkendaraan`),
  CONSTRAINT `fk_tarif_kendaraan1` FOREIGN KEY (`idkendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,1,1000000,1000000),(2,2,2000000,2100000),(3,3,3000000,3300000);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpelanggan` int(11) NOT NULL,
  `idsopir` int(11) NOT NULL,
  `idkendaraan` int(11) NOT NULL,
  `tglmulai` date NOT NULL,
  `tglselesai` date NOT NULL,
  `lamasewa` int(11) NOT NULL,
  `tglovertime` date DEFAULT NULL,
  `jmlovertime` int(11) DEFAULT NULL,
  `total` double NOT NULL,
  `status` enum('Mulai','Selesai') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sopir_has_kendaraan_sopir1` (`idsopir`),
  KEY `fk_sopir_has_kendaraan_kendaraan1` (`idkendaraan`),
  KEY `fk_transaksi_pelanggan1` (`idpelanggan`),
  CONSTRAINT `fk_sopir_has_kendaraan_kendaraan1` FOREIGN KEY (`idkendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sopir_has_kendaraan_sopir1` FOREIGN KEY (`idsopir`) REFERENCES `sopir` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaksi_pelanggan1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,1,1,1,'2015-06-01','2015-06-05',5,NULL,NULL,5000000,'Selesai'),(2,4,3,2,'2015-07-01','2015-07-03',3,'2015-07-09',6,18600000,'Selesai'),(3,5,3,3,'2015-07-27','2015-07-31',5,'2015-08-01',1,18300000,'Mulai'),(4,2,1,1,'2015-07-19','2015-07-23',5,'2015-07-25',2,7000000,'Mulai'),(5,1,1,1,'2015-07-05','2015-07-08',4,'2015-07-11',3,7000000,'Mulai');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaksi_mulai` AFTER INSERT ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Jalan'
WHERE id = NEW.idkendaraan;
UPDATE sopir SET status = 'Jalan'
WHERE id = NEW.idsopir;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateStatus` AFTER INSERT ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Jalan'
WHERE id = NEW.idkendaraan;
UPDATE sopir SET status = 'Jalan'
WHERE id = NEW.idsopir;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaksi_selesai` AFTER UPDATE ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Bebas'
WHERE id = OLD.idkendaraan;
UPDATE sopir SET status = 'Bebas'
WHERE id = OLD.idsopir;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaksi_batal` AFTER DELETE ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Bebas'
WHERE id = OLD.idkendaraan;
UPDATE sopir SET status = 'Bebas'
WHERE id = OLD.idsopir;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `transaksi_v`
--

DROP TABLE IF EXISTS `transaksi_v`;
/*!50001 DROP VIEW IF EXISTS `transaksi_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `transaksi_v` (
  `id` tinyint NOT NULL,
  `idpelanggan` tinyint NOT NULL,
  `idsopir` tinyint NOT NULL,
  `idkendaraan` tinyint NOT NULL,
  `tglmulai` tinyint NOT NULL,
  `tglselesai` tinyint NOT NULL,
  `lamasewa` tinyint NOT NULL,
  `tglovertime` tinyint NOT NULL,
  `jmlovertime` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `pengemudi` tinyint NOT NULL,
  `customer` tinyint NOT NULL,
  `nopol` tinyint NOT NULL,
  `nama` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `transaksi_v`
--

/*!50001 DROP TABLE IF EXISTS `transaksi_v`*/;
/*!50001 DROP VIEW IF EXISTS `transaksi_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transaksi_v` AS select `t`.`id` AS `id`,`t`.`idpelanggan` AS `idpelanggan`,`t`.`idsopir` AS `idsopir`,`t`.`idkendaraan` AS `idkendaraan`,`t`.`tglmulai` AS `tglmulai`,`t`.`tglselesai` AS `tglselesai`,`t`.`lamasewa` AS `lamasewa`,`t`.`tglovertime` AS `tglovertime`,`t`.`jmlovertime` AS `jmlovertime`,`t`.`total` AS `total`,`t`.`status` AS `status`,`s`.`nama` AS `pengemudi`,`p`.`nama` AS `customer`,`k`.`nopol` AS `nopol`,`m`.`nama` AS `nama` from ((((`transaksi` `t` join `sopir` `s` on(`s`.`id` = `t`.`idsopir`)) join `pelanggan` `p` on(`p`.`id` = `t`.`idpelanggan`)) join `kendaraan` `k` on(`k`.`id` = `t`.`idkendaraan`)) join `merek` `m` on(`m`.`id` = `k`.`idmerek`)) */;
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

-- Dump completed on 2022-10-19 19:23:47
