-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 11:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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
(23, 'admin', '1234', '2024-04-22', 20, 'male', 'dsad', '123', '../id_images/6625e81cb4d34_1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblrecruiter`
--
ALTER TABLE `tblrecruiter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblrecruiter`
--
ALTER TABLE `tblrecruiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
