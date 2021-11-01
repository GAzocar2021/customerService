-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2021 at 06:14 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `nid` varchar(15) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Índice 2` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `nid`, `created_at`, `updated_at`) VALUES
(1, 'Pedro', '123', '2021-10-31 02:47:19', NULL),
(2, 'Juan', '456', '2021-10-31 20:23:03', NULL),
(5, 'Luis', '789', '2021-10-31 21:17:29', NULL),
(6, 'Jose', '12', '2021-10-31 21:17:52', NULL),
(7, 'Tulio', '345', '2021-10-31 21:25:40', NULL),
(8, 'Pablo', '678', '2021-10-31 22:23:28', NULL),
(9, 'Carlos', '901', '2021-10-31 22:42:18', NULL),
(10, 'Alfredo', '234', '2021-10-31 23:45:32', NULL),
(12, 'Kelvin', '890', '2021-10-31 23:53:50', NULL),
(13, 'Jesus', '159', '2021-10-31 23:54:52', NULL),
(14, 'Antonio', '260', '2021-10-31 23:56:05', NULL),
(15, 'Francisco', '357', '2021-10-31 23:57:46', NULL),
(16, 'Jhon', '240', '2021-11-01 00:26:46', NULL),
(17, 'Manuel', '168', '2021-11-01 00:27:38', NULL),
(18, 'Gabriel', '13545985', '2021-11-01 00:28:03', NULL),
(19, 'Paul', '7521', '2021-11-01 00:30:04', NULL),
(20, 'Gustavo', '95156', '2021-11-01 00:30:22', NULL),
(21, 'Gregorio', '985259', '2021-11-01 00:31:06', NULL),
(22, 'Victor', '3215865', '2021-11-01 00:31:23', NULL),
(23, 'Marcos', '4424', '2021-11-01 00:31:52', NULL),
(24, 'Moises', '365412', '2021-11-01 00:40:01', NULL),
(25, 'Alfonso', '7415', '2021-11-01 00:41:42', NULL),
(26, 'Pepe', '142451', '2021-11-01 00:43:31', NULL),
(27, 'Frank', '98564', '2021-11-01 00:44:42', NULL),
(28, 'Cristian', '451247', '2021-11-01 00:47:01', NULL),
(29, 'Christopher', '65474112', '2021-11-01 00:50:34', NULL),
(30, 'Rey', '745124', '2021-11-01 00:52:29', NULL),
(31, 'Roberto', '7451624', '2021-11-01 01:04:28', NULL),
(32, 'Cristiano', '74148', '2021-11-01 01:12:57', NULL),
(33, 'Paolo', '52141', '2021-11-01 01:24:15', NULL),
(34, 'Mario', '75219632', '2021-11-01 01:36:30', NULL),
(35, 'Luigi', '6215852', '2021-11-01 01:36:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_queue`
--

DROP TABLE IF EXISTS `customer_queue`;
CREATE TABLE IF NOT EXISTS `customer_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CUSTOMER_IDX` (`customer_id`),
  KEY `FK_QUEUE_IDX` (`queue_id`),
  KEY `FK_STATUS_IDX` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `customer_queue`
--

TRUNCATE TABLE `customer_queue`;
--
-- Dumping data for table `customer_queue`
--

INSERT INTO `customer_queue` (`id`, `customer_id`, `queue_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '2021-10-31 02:47:39', '2021-11-01 04:26:15'),
(2, 2, 2, 2, '2021-10-31 21:11:29', '2021-11-01 02:41:28'),
(3, 5, 1, 3, '2021-10-31 21:18:26', '2021-11-01 04:26:25'),
(4, 6, 1, 3, '2021-10-31 21:18:43', '2021-11-01 04:26:18'),
(5, 7, 2, 3, '2021-10-31 21:25:41', '2021-11-01 04:26:23'),
(6, 8, 1, 3, '2021-10-31 22:23:28', '2021-11-01 04:26:20'),
(7, 9, 1, 3, '2021-10-31 22:42:18', '2021-11-01 05:39:58'),
(9, 15, 1, 2, '2021-10-31 23:57:46', '2021-11-01 04:25:50'),
(10, 16, 1, 3, '2021-11-01 00:26:46', '2021-11-01 05:40:38'),
(11, 17, 1, 3, '2021-11-01 00:27:38', '2021-11-01 05:40:28'),
(12, 18, 1, 3, '2021-11-01 00:28:03', '2021-11-01 05:40:01'),
(13, 19, 1, 3, '2021-11-01 00:30:05', '2021-11-01 05:40:26'),
(14, 20, 1, 3, '2021-11-01 00:30:23', '2021-11-01 05:40:04'),
(15, 21, 1, 3, '2021-11-01 00:31:06', '2021-11-01 05:40:14'),
(16, 22, 1, 3, '2021-11-01 00:31:23', '2021-11-01 05:40:06'),
(17, 23, 1, 3, '2021-11-01 00:31:52', '2021-11-01 05:40:09'),
(18, 24, 1, 3, '2021-11-01 00:40:01', '2021-11-01 05:40:12'),
(19, 29, 2, 3, '2021-11-01 00:50:34', '2021-11-01 05:40:17'),
(20, 30, 2, 3, '2021-11-01 00:52:29', '2021-11-01 05:40:20'),
(21, 31, 2, 3, '2021-11-01 01:04:28', '2021-11-01 05:40:22'),
(22, 32, 1, 3, '2021-11-01 01:12:57', '2021-11-01 05:40:31'),
(23, 33, 1, 2, '2021-11-01 01:24:15', '2021-11-01 00:00:00'),
(24, 34, 1, 2, '2021-11-01 01:36:30', '2021-11-01 01:38:37'),
(25, 35, 2, 3, '2021-11-01 01:36:38', '2021-11-01 05:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `queue`
--

TRUNCATE TABLE `queue`;
--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'COLA 1', '2021-10-31 02:46:11', NULL),
(2, 'COLA 2', '2021-10-31 02:46:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `status`
--

TRUNCATE TABLE `status`;
--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'EN ESPERA', '2021-10-31 02:45:24', NULL),
(2, 'ATENDIDO', '2021-10-31 02:45:36', NULL),
(3, 'ELIMINADO', '2021-10-31 02:45:51', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_queue`
--
ALTER TABLE `customer_queue`
  ADD CONSTRAINT `FK_CUSTOMER_IDX` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_QUEUE_IDX` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_STATUS_IDX` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
