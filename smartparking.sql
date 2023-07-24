-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2023 at 06:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartparking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `log_kendaraan`
--

CREATE TABLE `log_kendaraan` (
  `id` int(11) NOT NULL,
  `id_kartu` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_keluar` timestamp NOT NULL DEFAULT current_timestamp(),
  `nopol` varchar(10) NOT NULL,
  `isInside` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_kendaraan`
--

INSERT INTO `log_kendaraan` (`id`, `id_kartu`, `nama`, `waktu_masuk`, `waktu_keluar`, `nopol`, `isInside`) VALUES
(18, 123123, 'Joko', '2023-07-24 16:52:37', '2023-07-24 16:55:19', 'B 131234', 0),
(19, 13213, 'Prasetyo', '2023-07-24 16:52:49', '2023-07-24 16:54:14', 'B 13123', 0),
(20, 1341, 'Escobar', '2023-07-24 16:52:54', '2023-07-24 16:53:43', 'B 990912', 0),
(21, 123123, 'Joko', '2023-07-24 16:55:00', '2023-07-24 16:55:19', 'B 131234', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_kartu` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nopol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_kartu`, `nama`, `email`, `nopol`) VALUES
(1, 123123, 'Joko', 'joko@email.com', 'B 131234'),
(2, 13213, 'Prasetyo', 'pras@mail.com', 'B 13123'),
(3, 1341, 'Escobar', 'escobar@mail.com', 'B 990912');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_kendaraan`
--
ALTER TABLE `log_kendaraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_kendaraan`
--
ALTER TABLE `log_kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
