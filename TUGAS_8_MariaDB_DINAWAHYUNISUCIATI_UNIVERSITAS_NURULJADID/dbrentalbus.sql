-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2015 at 04:21 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbrentalbus`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE IF NOT EXISTS `kendaraan` (
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
  KEY `fk_kendaraan_merek` (`idmerek`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `nopol`, `idmerek`, `tipe`, `tahunrakit`, `seat`, `fasilitas`, `foto`, `status`) VALUES
(1, 'B 1111 VGA', 1, 'NKR 55 CO', '2011', 11, 'Reclining seats,LCD,Multimedia player,Toilet', NULL, 'Jalan'),
(2, 'B 2222 VGA', 2, 'Dutro Bus 130 MDBL', '2011', 20, 'Reclining seats,LCD', 'B 2222 VGA.jpg', 'Bebas'),
(3, 'B 3333 VGA', 2, 'R 260', '2011', 43, 'Reclining seats,Foot rests,LCD,Multimedia player,Wireless microphone,Koneksi wifi', 'B 3333 VGA.jpg', 'Jalan');

-- --------------------------------------------------------

--
-- Table structure for table `merek`
--

CREATE TABLE IF NOT EXISTS `merek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_UNIQUE` (`nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `merek`
--

INSERT INTO `merek` (`id`, `nama`) VALUES
(2, 'Hino'),
(1, 'Isuzu'),
(4, 'MAN'),
(5, 'Mercedes Benz'),
(3, 'Scania');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `alamat`, `telepon`, `email`) VALUES
(1, 'Budi', 'Tanah Baru Depok', '123456', ''),
(2, 'Ani', 'Lenteng Agung', '123654', ''),
(3, 'Dewi', 'Srengseng Sawah', '321456', ''),
(4, 'Siti', 'Kelapa Dua Wetan', '654321', ''),
(5, 'Deden', 'Bambu Apus', '876543', '');

-- --------------------------------------------------------

--
-- Table structure for table `sopir`
--

CREATE TABLE IF NOT EXISTS `sopir` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sopir`
--

INSERT INTO `sopir` (`id`, `nama`, `alamat`, `telepon`, `email`, `ktp`, `sim`, `status`, `foto`) VALUES
(1, 'Alexander', 'Jakarta', '08181111', 'alexander@gmail.com', '12341111', '67891111', 'Jalan', '12341111.jpg'),
(2, 'Andreas', 'Bekasi', '08182222', 'andreas@gmail.com', '12342222', '67892222', 'Bebas', '12342222.jpg'),
(3, 'Bimo', 'Depok', '08183333', 'bimo@gmail.com', '12343333', '67893333', 'Jalan', '12343333.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE IF NOT EXISTS `tarif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idkendaraan` int(11) NOT NULL,
  `perhari` double NOT NULL,
  `overtime` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tarif_kendaraan1` (`idkendaraan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`id`, `idkendaraan`, `perhari`, `overtime`) VALUES
(1, 1, 1000000, 1000000),
(2, 2, 2000000, 2100000),
(3, 3, 3000000, 3300000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
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
  KEY `fk_transaksi_pelanggan1` (`idpelanggan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `idpelanggan`, `idsopir`, `idkendaraan`, `tglmulai`, `tglselesai`, `lamasewa`, `tglovertime`, `jmlovertime`, `total`, `status`) VALUES
(1, 1, 1, 1, '2015-06-01', '2015-06-05', 5, NULL, NULL, 5000000, 'Selesai'),
(2, 4, 3, 2, '2015-07-01', '2015-07-03', 3, '2015-07-09', 6, 18600000, 'Selesai'),
(3, 5, 3, 3, '2015-07-27', '2015-07-31', 5, '2015-08-01', 1, 18300000, 'Mulai'),
(4, 2, 1, 1, '2015-07-19', '2015-07-23', 5, '2015-07-25', 2, 7000000, 'Mulai'),
(5, 1, 1, 1, '2015-07-05', '2015-07-08', 4, '2015-07-11', 3, 7000000, 'Mulai');

--
-- Triggers `transaksi`
--
DROP TRIGGER IF EXISTS `transaksi_batal`;
DELIMITER //
CREATE TRIGGER `transaksi_batal` AFTER DELETE ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Bebas'
WHERE id = OLD.idkendaraan;
UPDATE sopir SET status = 'Bebas'
WHERE id = OLD.idsopir;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `transaksi_mulai`;
DELIMITER //
CREATE TRIGGER `transaksi_mulai` AFTER INSERT ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Jalan'
WHERE id = NEW.idkendaraan;
UPDATE sopir SET status = 'Jalan'
WHERE id = NEW.idsopir;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `transaksi_selesai`;
DELIMITER //
CREATE TRIGGER `transaksi_selesai` AFTER UPDATE ON `transaksi`
 FOR EACH ROW BEGIN
UPDATE kendaraan SET status = 'Bebas'
WHERE id = OLD.idkendaraan;
UPDATE sopir SET status = 'Bebas'
WHERE id = OLD.idsopir;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `transaksi_v`
--
CREATE TABLE IF NOT EXISTS `transaksi_v` (
`id` int(11)
,`idpelanggan` int(11)
,`idsopir` int(11)
,`idkendaraan` int(11)
,`tglmulai` date
,`tglselesai` date
,`lamasewa` int(11)
,`tglovertime` date
,`jmlovertime` int(11)
,`total` double
,`status` enum('Mulai','Selesai')
,`pengemudi` varchar(45)
,`customer` varchar(45)
,`nopol` varchar(20)
,`nama` varchar(45)
);
-- --------------------------------------------------------

--
-- Structure for view `transaksi_v`
--
DROP TABLE IF EXISTS `transaksi_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi_v` AS select `t`.`id` AS `id`,`t`.`idpelanggan` AS `idpelanggan`,`t`.`idsopir` AS `idsopir`,`t`.`idkendaraan` AS `idkendaraan`,`t`.`tglmulai` AS `tglmulai`,`t`.`tglselesai` AS `tglselesai`,`t`.`lamasewa` AS `lamasewa`,`t`.`tglovertime` AS `tglovertime`,`t`.`jmlovertime` AS `jmlovertime`,`t`.`total` AS `total`,`t`.`status` AS `status`,`s`.`nama` AS `pengemudi`,`p`.`nama` AS `customer`,`k`.`nopol` AS `nopol`,`m`.`nama` AS `nama` from ((((`transaksi` `t` join `sopir` `s` on((`s`.`id` = `t`.`idsopir`))) join `pelanggan` `p` on((`p`.`id` = `t`.`idpelanggan`))) join `kendaraan` `k` on((`k`.`id` = `t`.`idkendaraan`))) join `merek` `m` on((`m`.`id` = `k`.`idmerek`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `fk_kendaraan_merek` FOREIGN KEY (`idmerek`) REFERENCES `merek` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `fk_tarif_kendaraan1` FOREIGN KEY (`idkendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_sopir_has_kendaraan_kendaraan1` FOREIGN KEY (`idkendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sopir_has_kendaraan_sopir1` FOREIGN KEY (`idsopir`) REFERENCES `sopir` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaksi_pelanggan1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
