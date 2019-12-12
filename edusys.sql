-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 11:48 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edusys`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

CREATE TABLE `tblaccount` (
  `accountid` int(10) NOT NULL,
  `Username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ID_Role` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblaccount`
--

INSERT INTO `tblaccount` (`accountid`, `Username`, `Password`, `ID_Role`) VALUES
(51, 'lim', '123', 1),
(52, 'Joker', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `IDCat` int(11) NOT NULL,
  `Cat_Name` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`IDCat`, `Cat_Name`) VALUES
(1, 'Information Technology'),
(2, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `ID_Course` int(11) NOT NULL,
  `Course_Name` varchar(200) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `ID_Cat` int(11) NOT NULL,
  `ID_Trainer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`ID_Course`, `Course_Name`, `Description`, `ID_Cat`, `ID_Trainer`) VALUES
(1, 'Database', 'Introduction database', 1, 1),
(2, 'Web Design and Development', 'Build web based on using HTML, CSS, JS, PHP...', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcoursedetail`
--

CREATE TABLE `tblcoursedetail` (
  `ID_Course` int(11) NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Descriptioin` varchar(200) CHARACTER SET utf8 NOT NULL,
  `ID_Trainee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblrole`
--

CREATE TABLE `tblrole` (
  `ID_Role` int(10) NOT NULL,
  `Role_Name` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrole`
--

INSERT INTO `tblrole` (`ID_Role`, `Role_Name`) VALUES
(1, 'Admin'),
(2, 'Trainer'),
(3, 'Trainee');

-- --------------------------------------------------------

--
-- Table structure for table `tbltopic`
--

CREATE TABLE `tbltopic` (
  `ID_Topic` int(11) NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 NOT NULL,
  `ID_Course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltopic`
--

INSERT INTO `tbltopic` (`ID_Topic`, `Title`, `Description`, `ID_Course`) VALUES
(3, 'Assignment 1', 'Submit Assignment 1', 1),
(4, 'Assignment 2', 'Submit Assignment 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbltrainee`
--

CREATE TABLE `tbltrainee` (
  `IDTrainee` int(11) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Address` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltrainee`
--

INSERT INTO `tbltrainee` (`IDTrainee`, `Name`, `Email`, `Phone`, `Address`) VALUES
(1, 'Nguyen Bat Khai', 'khainb@gmail.com', '0964695956', 'Ha Noi'),
(2, 'Nguyen Thanh Tung', 'tungnt@gmail.com', '0369529518', 'Ha Noi');

-- --------------------------------------------------------

--
-- Table structure for table `tbltrainer`
--

CREATE TABLE `tbltrainer` (
  `IDTrainer` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(11) CHARACTER SET utf8 NOT NULL,
  `Address` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltrainer`
--

INSERT INTO `tbltrainer` (`IDTrainer`, `Name`, `Email`, `Phone`, `Address`) VALUES
(1, 'Nguyá»…n Pháº¡m ThÃ¡i SÆ¡n', 'jokerboy1412@gmail.com', '0355832199', 'NgÃµ 165 DÆ°Æ¡ng Quáº£ng HÃ m'),
(2, 'VÅ© Máº¡nh Tiáº¿n', 'tienvmgch@fpt.edu.vn', '0367087904', 'NgÃµ 165 DÆ°Æ¡ng Quáº£ng HÃ m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD PRIMARY KEY (`accountid`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`IDCat`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`ID_Course`),
  ADD KEY `ID_Trainer` (`ID_Trainer`),
  ADD KEY `ID_Cat` (`ID_Cat`);

--
-- Indexes for table `tblcoursedetail`
--
ALTER TABLE `tblcoursedetail`
  ADD KEY `ID_Trainee` (`ID_Trainee`),
  ADD KEY `ID_Course` (`ID_Course`);

--
-- Indexes for table `tblrole`
--
ALTER TABLE `tblrole`
  ADD PRIMARY KEY (`ID_Role`);

--
-- Indexes for table `tbltopic`
--
ALTER TABLE `tbltopic`
  ADD PRIMARY KEY (`ID_Topic`),
  ADD KEY `ID_Course` (`ID_Course`);

--
-- Indexes for table `tbltrainee`
--
ALTER TABLE `tbltrainee`
  ADD PRIMARY KEY (`IDTrainee`);

--
-- Indexes for table `tbltrainer`
--
ALTER TABLE `tbltrainer`
  ADD PRIMARY KEY (`IDTrainer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `accountid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `IDCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `ID_Course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblrole`
--
ALTER TABLE `tblrole`
  MODIFY `ID_Role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltopic`
--
ALTER TABLE `tbltopic`
  MODIFY `ID_Topic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbltrainee`
--
ALTER TABLE `tbltrainee`
  MODIFY `IDTrainee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbltrainer`
--
ALTER TABLE `tbltrainer`
  MODIFY `IDTrainer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbltopic`
--
ALTER TABLE `tbltopic`
  ADD CONSTRAINT `tbltopic_ibfk_1` FOREIGN KEY (`ID_Course`) REFERENCES `tblcourse` (`ID_Course`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
