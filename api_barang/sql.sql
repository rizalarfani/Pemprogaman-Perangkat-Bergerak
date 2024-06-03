-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tugas_ppb_inventori
CREATE DATABASE IF NOT EXISTS `tugas_ppb_inventori` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `tugas_ppb_inventori`;

-- Dumping structure for table tugas_ppb_inventori.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` char(25) COLLATE armscii8_bin DEFAULT NULL,
  `nama_barang` varchar(80) COLLATE armscii8_bin DEFAULT NULL,
  `satuan` char(7) COLLATE armscii8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table tugas_ppb_inventori.barang: ~5 rows (approximately)
REPLACE INTO `barang` (`kode_barang`, `nama_barang`, `satuan`) VALUES
	('BRG-0001', 'Lemari', 'unit'),
	('BRG-0002', 'Televisi LCD 45 INC', 'unit'),
	('BRG-0003', 'Komputer', 'unit'),
	('BRG0005', 'Leptop Lenavo', 'unit'),
	('brg0005', 'Monitor Dell H2016HV', 'unit');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
