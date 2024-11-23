-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2024 at 07:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `preschooldb`
--
CREATE DATABASE IF NOT EXISTS `preschooldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `preschooldb`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(120) DEFAULT NULL,
  `AdminuserName` varchar(20) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  `UserType` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `AdminuserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`, `UserType`) VALUES
(2, 'Admin', 'admin', 1234596321, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2023-03-16 18:30:00', 1),
(3, 'Anuj kumar', 'akr305', 1234567891, 'ak@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2023-03-16 18:30:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblclasses`
--

DROP TABLE IF EXISTS `tblclasses`;
CREATE TABLE IF NOT EXISTS `tblclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherId` int(10) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `ageGroup` varchar(150) DEFAULT NULL,
  `classTiming` varchar(120) DEFAULT NULL,
  `capacity` varchar(10) DEFAULT NULL,
  `feacturePic` varchar(255) DEFAULT NULL,
  `addedBy` varchar(150) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `teacherId`, `className`, `ageGroup`, `classTiming`, `capacity`, `feacturePic`, `addedBy`, `postingDate`) VALUES
(1, 1, 'Art and Drawing', '3-4 Year', '11-12 PM', '20', '5a202841bcc60530918a7523a5848cd31679164973.jpg', 'admin', '2023-03-18 18:42:53'),
(2, 2, 'Dance', '2-3 Year', '12-1 PM', '25', 'f73fd44701a97d0ca929f3ff41dca5171679165124.jpg', 'admin', '2023-03-18 18:45:24'),
(3, 3, 'Language and Speaking', '4-5 Year', '12-1 PM', '30', 'be498647266a2b65d6f1660ec7fe4ad61679249810.jpg', 'admin', '2023-03-18 18:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `tblenrollment`
--

DROP TABLE IF EXISTS `tblenrollment`;
CREATE TABLE IF NOT EXISTS `tblenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollmentNumber` bigint(12) DEFAULT NULL,
  `fatherName` varchar(120) DEFAULT NULL,
  `motherName` varchar(120) DEFAULT NULL,
  `parentmobNo` bigint(12) DEFAULT NULL,
  `parentEmail` varchar(150) DEFAULT NULL,
  `childName` varchar(150) DEFAULT NULL,
  `childAge` varchar(200) DEFAULT NULL,
  `enrollProgram` varchar(255) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `enrollStatus` varchar(100) DEFAULT NULL,
  `officialRemark` mediumtext DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblenrollment`
--

INSERT INTO `tblenrollment` (`id`, `enrollmentNumber`, `fatherName`, `motherName`, `parentmobNo`, `parentEmail`, `childName`, `childAge`, `enrollProgram`, `message`, `postingDate`, `enrollStatus`, `officialRemark`, `updationDate`, `userid`) VALUES
(1, 4562123651, 'Amit Kumar', 'Garima Singh', 1425362514, 'akt@test.com', 'Anika', '2-3 Year', 'PlayGroup-1.8 to 3 years', ' We want enrollment', '2023-03-21 02:06:43', 'Accepted', 'Enrollment of the child accepted.', '2023-03-21 02:55:43', NULL),
(2, 784123651, 'Ajay ', 'Sunita ', 7852145220, 'sunot@test.com', 'Anvi', '3-4 Year', 'Junior KG- 3.5 to 5 years', 'Enrollment for  kg3.5to5 year programm', '2023-03-21 02:09:33', 'Rejected', 'All seats are full.', '2023-03-21 03:00:16', NULL),
(3, 7857665463, 'Sanjeev', 'Pallavi', 452145623, 'abc@test.com', 'Rahul', '2-3 Year', 'Nursery-2.5 to 4 years', 'NA', '2023-03-21 03:48:25', NULL, NULL, '2023-03-21 03:50:07', NULL),
(4, 493477266, 'Sushil', 'Amita', 5236520145, 'ahd@test.com', 'Tanvi', '3-4 Year', 'Junior KG- 3.5 to 5 years', 'Looking for enrollment', '2023-03-21 03:49:55', NULL, NULL, NULL, NULL),
(5, 851293119, 'Atul k Singh', 'Ritu', 6321456203, 'rkt@test.com', 'Avisha', '2-3 Year', 'Nursery-2.5 to 4 years', ' We want to enroll our daughter for pres nursery ', '2023-03-21 04:01:25', 'Accepted', 'Enrollment accepted', '2023-03-21 04:01:55', NULL),
(6, 161852279, 'father', 'mother@gmail.com', 7894561230, 'oarent@gmail.com', 'child', '2-3 Year', 'PlayGroup-1.8 to 3 years', 'Test message', '2024-11-22 07:48:07', NULL, NULL, NULL, 0),
(7, 967573329, 'father', 'mother@gmail.com', 7894561230, 'parent@gmail.com', 'child', '18 Month-3 Year', 'Senior KG- 4.5 to 6 years', 'test message', '2024-11-22 07:49:45', NULL, NULL, NULL, 5),
(8, 191496008, 'father', 'mother', 7894561230, 'parent@gmail.cpm', 'child', '18 Month-3 Year', 'Nursery-2.5 to 4 years', 'test', '2024-11-22 09:33:03', NULL, NULL, NULL, 5),
(9, 182481057, 'Salim', 'afshin', 7894561230, 'afshin@gmail.com', 'fareeha', '2-3 Year', 'Senior KG- 4.5 to 6 years', 'test', '2024-11-23 05:47:40', 'Accepted', 'Accepted', '2024-11-23 05:48:29', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

DROP TABLE IF EXISTS `tblpage`;
CREATE TABLE IF NOT EXISTS `tblpage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About us', 'Playschool helps in building a strong foundation in social, pre-academics, and general life skills. It helps in the development of a child’s emotional and personal growth and provides opportunities for children to learn in ways that sheerly interests them and develop a strong sense of curiosity. Consequently, it helps in building a positive association with inquisitive learning in the form of fun activities and guided play. \r\n\r\nPlayschool is important for your child as it helps in making the child habitual of the routine. The child also becomes aware of himself/herself and develops motor and cognitive skills. Playschools further enable the child to receive individual attention as the school has a very low student-to-teacher ratio. According to the report, only 48% of poor children who were born in 2001 \"started school ready to learn, compared to 75% of children from middle-income families.\"\r\n\r\nAdditionally, the amount of time parents of various socioeconomic statuses spend reading to their children has changed since the 1960s and 1970s. Parents with higher education read to their kids for up to an additional 30 minutes per day between 2010 and 2012, which adds up by the time the kids enter kindergarten.The kids are given the ‘right’ toys to play with according to their age of development which helps them to develop and learn the things that can be implemented or transferred onto them, such as changing the clothes of the doll, feeding the doll, etc. Some more benefits of playschool are mentioned below: ', NULL, NULL, '2023-03-21 01:33:20'),
(2, 'contactus', 'Contact Us', '#890 CFG Apartment, Mayur Vihar, Delhi-India.', 'lrmsinfo@test.com', 1234567890, '2021-07-04 06:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblteachers`
--

DROP TABLE IF EXISTS `tblteachers`;
CREATE TABLE IF NOT EXISTS `tblteachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `teacherEmail` varchar(255) DEFAULT NULL,
  `teacherMobileNo` bigint(11) DEFAULT NULL,
  `teacherSubject` varchar(255) DEFAULT NULL,
  `teacherPic` varchar(255) DEFAULT NULL,
  `AddedBy` varchar(120) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblteachers`
--

INSERT INTO `tblteachers` (`id`, `fullName`, `teacherEmail`, `teacherMobileNo`, `teacherSubject`, `teacherPic`, `AddedBy`, `regDate`) VALUES
(1, 'Amit Kumar Singh', 'amitk@gmail.com', 1231231231, 'Art Drawing', 'ddc01577479ff46e6d42027edc5fba5c1679016943.jpg', 'admin', '2023-03-17 01:35:43'),
(2, 'Ms. Divya', 'divya@test.com', 1425362514, 'Dance', '06940303f580ef89805d5242166fb8671679017065.jpg', 'admin', '2023-03-17 01:37:45'),
(3, 'Amit Singh', 'amkt12334@test.com', 1232123210, 'Language & Speaking', 'ddc01577479ff46e6d42027edc5fba5c1679277564.jpg', 'admin', '2023-03-17 01:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitor`
--

DROP TABLE IF EXISTS `tblvisitor`;
CREATE TABLE IF NOT EXISTS `tblvisitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gurdianName` varchar(220) DEFAULT NULL,
  `gurdianEmail` varchar(220) DEFAULT NULL,
  `childName` varchar(225) DEFAULT NULL,
  `childAge` varchar(120) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `officeRemark` mediumtext DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `visitTime` varchar(220) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblvisitor`
--

INSERT INTO `tblvisitor` (`id`, `gurdianName`, `gurdianEmail`, `childName`, `childAge`, `message`, `officeRemark`, `status`, `visitTime`, `postingDate`, `updationDate`) VALUES
(1, 'Rahul Singh', 'rahul12@gmail.com', 'Anik', '2-3 Year', 'I want to visit the school for my son.', 'Visited the school. they want to enroll their 2 year old daughter.', 'Visited', '2023-03-24T10:30', '2023-03-20 01:55:18', '2023-03-21 03:22:20'),
(2, 'Rahul Kumar', 'rahulk@test.com', 'Amit', '3-4 Year', 'NA', NULL, NULL, '2023-03-23T12:30', '2023-03-21 03:59:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'karan', '$2y$10$5EgvTLzvhb9lA1KDW2tdReeEiUxbHmivEpScVR5Hrap6qOyLZmJ7u', '2024-10-18 06:47:46'),
(2, 'afshin', '$2y$10$2d98JadmGdaVgaWW5ZK4pezKMkbOmvxegEI5.DaWWupchU86DF5FG', '2024-10-18 07:10:11'),
(4, 'Rohan', '$2y$10$I1E6gLD4ulOrmGwo8mgx4O2h4/gcA0Wm16JfzyXHm8LasEhoZ/tcO', '2024-10-18 07:17:23'),
(5, 'admin', '$2y$10$rn4vvLU2rVlBCdDmiEwQtOaU9feUdnu4lHtVjY7mky7g2q31biRoW', '2024-11-22 12:43:14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
