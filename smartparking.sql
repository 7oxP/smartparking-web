-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2023 at 09:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `id_kartu` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jam_masuk` datetime NOT NULL,
  `jam_keluar` datetime NOT NULL,
  `nopol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `id_kartu`, `tgl_masuk`, `jam_masuk`, `jam_keluar`, `nopol`) VALUES
(1, 123, '2023-06-08', '2023-06-15 11:32:21', '2023-06-15 11:32:21', 'B13221'),
(5, 232, '2023-12-01', '2023-12-02 23:23:23', '2023-12-02 23:23:23', 'B12332');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_topup`
--

CREATE TABLE `riwayat_topup` (
  `id` int(11) NOT NULL,
  `id_kartu` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` int(10) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saldo_user`
--

CREATE TABLE `saldo_user` (
  `id` int(11) NOT NULL,
  `id_kartu` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `saldo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_topup`
--
ALTER TABLE `riwayat_topup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saldo_user`
--
ALTER TABLE `saldo_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `riwayat_topup`
--
ALTER TABLE `riwayat_topup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `saldo_user`
--
ALTER TABLE `saldo_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
