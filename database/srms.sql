-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
-- 
-- Host: localhost
-- Generation Time: Jan 10, 2018 at 04:35 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`userid`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `name` varchar(30) NOT NULL,
  `rno` int(3) NOT NULL,
  `class` varchar(30) NOT NULL,
  `p1` int(3) NOT NULL,
  `p2` int(3) NOT NULL,
  `p3` int(3) NOT NULL,
  `p4` int(3) NOT NULL,
  `p5` int(3) NOT NULL,
  `marks` int(3) NOT NULL,
  `percentage` float NOT NULL,
  PRIMARY KEY (`name`, `rno`),
  KEY `class` (`class`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`class`) REFERENCES `class` (`name`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`name`, `rno`) REFERENCES `students` (`name`, `rno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `name` varchar(30) NOT NULL,
  `rno` int(3) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`, `rno`),
  KEY `class_name` (`class_name`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_name`) REFERENCES `class` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;