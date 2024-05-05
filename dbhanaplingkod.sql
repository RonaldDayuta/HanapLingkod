-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2024 at 09:15 AM
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
-- Database: `dbhanaplingkod`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblaccounts`
--

CREATE TABLE `tblaccounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_image` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblaccounts`
--

INSERT INTO `tblaccounts` (`id`, `username`, `password`, `birthdate`, `age`, `sex`, `home_address`, `phone_no`, `email`, `id_image`, `position`) VALUES
(1, 'worker', '1234', '2003-01-27', 21, 'male', 'eqweqe', '123123', 'worker@gmail.com', '../id_images/66264c4f6d33c_Chocolate.png', 'worker'),
(3, 'JohnDoe', 'password123', '1990-05-15', 31, 'male', '123 Main Street', '1234567890', 'johndoe@example.com', 'image.jpg', 'worker'),
(4, 'JaneSmith', 'abc123', '1985-10-20', 36, 'female', '456 Oak Avenue', '0987654321', 'janesmith@example.com', 'photo.png', 'recruiter'),
(5, 'adminnald', '1234', '2003-01-27', 21, 'male', '101 San Guillermo Street. Bayanan, Muntinlupa City', '09461977083', 'adminnald@example.com', '../id_images/6632fa9fd1e83_lemon.jpg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblrecruiter`
--

CREATE TABLE `tblrecruiter` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `id_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblrecruiter`
--

INSERT INTO `tblrecruiter` (`id`, `username`, `password`, `birthdate`, `age`, `sex`, `home_address`, `phone_no`, `id_image`) VALUES
(1, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d58025445_WIN_20230530_16_40_25_Pro.jpg'),
(2, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d59ed35d6_WIN_20230530_16_40_25_Pro.jpg'),
(3, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d5cfada94_WIN_20230530_16_40_25_Pro.jpg'),
(4, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d6f71d461_WIN_20230530_16_40_25_Pro.jpg'),
(5, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d70802be7_WIN_20230530_16_40_37_Pro.jpg'),
(6, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '3123123', '../id_images/6624d795b0caa_WIN_20230530_16_40_37_Pro.jpg'),
(7, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d7e8db254_1.jpg'),
(8, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d8f30b04a_1.jpg'),
(9, 'ronald', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d9262121d_1.jpg'),
(10, 'ronald', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d9cf1cdc6_1.jpg'),
(11, 'paopao', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d9e2474e6_1.jpg'),
(12, 'paopao', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624d9f0e77b5_1.jpg'),
(13, 'siopao', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624da2c35529_1.jpg'),
(14, 'siopao', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624dc1a9da59_1.jpg'),
(15, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624dc3888a6d_1.jpg'),
(16, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624df3604aa9_1.jpg'),
(17, 'admin', '1234', '2024-04-21', 20, 'male', 'dsad', '123123', '../id_images/6624df3816152_1.jpg'),
(18, 'super', '12345', '2024-04-30', 20, 'male', 'dsad', '123123', '../id_images/6624e28a04bc6_1.jpg'),
(19, 'admin', '1234', '2024-04-22', 20, 'male', 'dsad', '123123', '../id_images/6625e3a1bcb5f_1.jpg'),
(20, 'admin', '1234', '2024-04-22', 20, 'male', 'dsad', '123123', '../id_images/6625e491e6fdb_1.jpg'),
(21, 'admin', '1234', '2024-04-22', 20, 'male', 'dsad', '123123', '../id_images/6625e4c0d5164_1.jpg'),
(22, 'ronald', '1234', '2024-04-22', 20, 'male', '101 san guillermo street, bayanan muntinlupa city', '09461977083', '../id_images/6625e524d0ffd_WIN_20240308_15_47_19_Pro.jpg'),
(23, 'admin', '1234', '2024-04-22', 20, 'male', 'dsad', '123', '../id_images/6625e81cb4d34_1.jpg'),
(24, 'asdasd', 'asdasda', '2024-04-01', 2, 'male', 'asdasd', 'aaasdad', '../id_images/66263059d4faa_woman.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblworker`
--

CREATE TABLE `tblworker` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblworker`
--

INSERT INTO `tblworker` (`id`, `username`, `password`, `birthdate`, `age`, `sex`, `home_address`, `phone_no`, `email`, `id_image`) VALUES
(1, 'kap', '1234', '2024-04-22', 21, 'male', 'sdfghj', '0234567', 'kapre@gmail.com', '../id_images/66263beff07a7_woman.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblaccounts`
--
ALTER TABLE `tblaccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrecruiter`
--
ALTER TABLE `tblrecruiter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblworker`
--
ALTER TABLE `tblworker`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblaccounts`
--
ALTER TABLE `tblaccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblrecruiter`
--
ALTER TABLE `tblrecruiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblworker`
--
ALTER TABLE `tblworker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
