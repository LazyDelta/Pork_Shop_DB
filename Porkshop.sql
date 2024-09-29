-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for porkshop
CREATE DATABASE IF NOT EXISTS `porkshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `porkshop`;

-- Dumping structure for table porkshop.orderdetail
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `orderdetailId` int(11) NOT NULL AUTO_INCREMENT,
  `order_group_id` varchar(255) NOT NULL,
  `orderId` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `status` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`orderdetailId`),
  KEY `FK_orderdetail_userdata` (`userId`),
  KEY `FK_orderdetail_orders` (`orderId`),
  CONSTRAINT `FK_orderdetail_orders` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetail_userdata` FOREIGN KEY (`userId`) REFERENCES `userdata` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table porkshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT 0,
  `productId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderId`),
  KEY `FK_order_userdata` (`userId`),
  KEY `FK_order_product` (`productId`),
  CONSTRAINT `FK_order_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_userdata` FOREIGN KEY (`userId`) REFERENCES `userdata` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table porkshop.product
CREATE TABLE IF NOT EXISTS `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productType` varchar(20) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table porkshop.userdata
CREATE TABLE IF NOT EXISTS `userdata` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '0',
  `confirmPassword` varchar(20) NOT NULL DEFAULT '0',
  `permission` int(1) NOT NULL,
  `tel_number` varchar(50) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
