-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bazzar_db.package_requirement
CREATE TABLE IF NOT EXISTS `package_requirement` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `products` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bazzar_db.package_requirement: ~0 rows (approximately)
/*!40000 ALTER TABLE `package_requirement` DISABLE KEYS */;
INSERT INTO `package_requirement` (`id`, `name`, `products`) VALUES
	('e55dca10-ac33-464b-98c8-b9ab5f44ca10', 'paket iga bakar', '[{"productId":"d1d8603f-7d0d-4b87-9b7f-851b77b983b6","qty":1}]'),
	('ec62e6e5-9f1f-4a87-bbbc-3597923e906f', 'paket ikan bakar', '[{"productId":"f3d0df14-b8f0-4def-b354-b50d80f1f1ec","qty":5}]');
/*!40000 ALTER TABLE `package_requirement` ENABLE KEYS */;

-- Dumping structure for table bazzar_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `purchase_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `package_requirement_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg9tom0yssc9o9ym389ag9pqu8` (`package_requirement_id`),
  CONSTRAINT `FKg9tom0yssc9o9ym389ag9pqu8` FOREIGN KEY (`package_requirement_id`) REFERENCES `package_requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bazzar_db.product: ~0 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `purchase_price`, `sell_price`, `status`, `stock`, `package_requirement_id`) VALUES
	('219d88c6-b9bb-4746-ad94-350b0c30e1eb', 'paket iga bakar', 20000, 40000, 'PACKAGE', 1, 'e55dca10-ac33-464b-98c8-b9ab5f44ca10'),
	('7498ba09-346c-412c-b334-7acffd8d343d', 'paket ikan bakar', 70000, 80000, 'PACKAGE', 0, 'ec62e6e5-9f1f-4a87-bbbc-3597923e906f'),
	('d1d8603f-7d0d-4b87-9b7f-851b77b983b6', 'bnzz', 300, 500, 'SINGLE', 8, NULL),
	('f3d0df14-b8f0-4def-b354-b50d80f1f1ec', 'bnzzjj', 300, 500, 'SINGLE', 5, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table bazzar_db.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `grand_total` double DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bazzar_db.transaction: ~1 rows (approximately)
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`id`, `date`, `grand_total`, `status`, `user_id`) VALUES
	('6fc601d4-3507-4482-9bda-91a118b381c6', '2020-09-01 16:00:00', 8000, 'CASH', '12345'),
	('c4a885c4-29c3-406c-ba35-23a9c5e319a6', '2020-09-01 16:00:00', 8000, 'CASH', '12345');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- Dumping structure for table bazzar_db.transaction_detail
CREATE TABLE IF NOT EXISTS `transaction_detail` (
  `id` varchar(255) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2nh7hmi2mfurimsk0viq4a127` (`transaction_id`),
  CONSTRAINT `FK2nh7hmi2mfurimsk0viq4a127` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bazzar_db.transaction_detail: ~2 rows (approximately)
/*!40000 ALTER TABLE `transaction_detail` DISABLE KEYS */;
INSERT INTO `transaction_detail` (`id`, `product_id`, `qty`, `total`, `unit_price`, `transaction_id`) VALUES
	('022e7024-ecbd-4d8f-a356-93e35127a65c', '7498ba09-346c-412c-b334-7acffd8d343d', 1, 10000, 10000, 'c4a885c4-29c3-406c-ba35-23a9c5e319a6'),
	('162846f0-957e-4e82-b6d8-1c320723c5db', '219d88c6-b9bb-4746-ad94-350b0c30e1eb', 1, 40000, 40000, '6fc601d4-3507-4482-9bda-91a118b381c6');
/*!40000 ALTER TABLE `transaction_detail` ENABLE KEYS */;

-- Dumping structure for table bazzar_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(255) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table bazzar_db.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `address`, `email`, `name`, `phone_number`) VALUES
	('76fd818b-69bc-49de-b4be-255a307f28aa', 'sdfdsf', 'asdas@test.com', 'asdas', '12233');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
