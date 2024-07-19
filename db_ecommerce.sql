-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 19, 2024 at 10:02 AM
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
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga`, `qty`, `foto`, `created_at`, `updated_at`) VALUES
(8, 'guava', 100000, 0, 'guava.png', '2024-07-05 07:50:35', '2024-07-05 07:53:37'),
(9, 'merkurius', 231123, 0, 'merkurius.png', '2024-07-09 07:33:18', '2024-07-17 04:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '', '2024-06-28 03:57:15', '2024-07-12 06:57:31'),
(4, 'Pengguna', '', '2024-06-28 06:21:36', '2024-07-12 06:57:55'),
(16, 'Professional', '', '2024-07-12 07:08:17', '2024-07-12 07:08:17'),
(17, 'Ameteur', '', '2024-07-12 07:37:39', '2024-07-12 07:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `nama_lengkap`, `email`, `password`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'aji', 'aji@gmail.com', '1234', 'jakarta', 0, '2024-07-18 04:07:06', '2024-07-18 04:07:06'),
(2, 'riski', 'riski@gmail.com', '1234', 'jakarta', 1, '2024-07-18 04:07:06', '2024-07-18 04:09:25'),
(3, 'bela abby', 'belabby@gmail.com', '1234', 'jakarta', 0, '2024-07-18 07:07:26', '2024-07-18 07:07:26'),
(4, 'Bela Abby', 'belabby@gmail.com', '1234', 'tangerang', 0, '2024-07-18 07:07:51', '2024-07-18 07:07:51'),
(5, 'sap', 'sapi@gmail.com', '1234', 'Jauh', 0, '2024-07-18 07:20:52', '2024-07-18 07:20:52'),
(6, 'joko', 'joko@gmail.com', '1234', 'deket', 0, '2024-07-18 07:22:12', '2024-07-18 07:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_member`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 0, '2024-07-19 07:05:29', '2024-07-19 07:05:29', 0),
(2, 0, 0, '2024-07-19 07:05:32', '2024-07-19 07:05:32', 0),
(3, 1, 0, '2024-07-19 07:17:33', '2024-07-19 07:17:33', 0),
(4, 1, 0, '2024-07-19 07:18:17', '2024-07-19 07:18:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `email_website` varchar(50) NOT NULL,
  `no_tlp_website` varchar(15) NOT NULL,
  `alamat_website` text NOT NULL,
  `ig` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `email_website`, `no_tlp_website`, `alamat_website`, `ig`, `twitter`, `fb`, `linkedin`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'aji@gmail.com', '0212223', '123123', 'aji', 'https://x.com/?lang=id', 'https://www.facebook.com/?locale=id_ID', 'aji', '', '2024-07-17 07:38:20', '2024-07-18 02:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `nama`, `jabatan`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Aji yusti', 'STi', 'keren bangetsadads', '2024-06-28 08:06:25', '2024-06-28 08:10:05'),
(3, 'asdsad', 'asdsad', 'asdasdsada', '2024-06-28 08:10:09', '2024-06-28 08:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) DEFAULT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama_lengkap`, `email`, `password`, `created_at`, `updated_at`) VALUES
(4, NULL, 'ssddaaasdds', 'admin01@gmail.comsdds', 'f98b12baa34bfe13fa25609a918ab929459cce9b', '2024-06-27 07:44:30', '2024-07-17 01:45:10'),
(5, NULL, '', 'admin@gmail.com', 'd3f55e35f15c920c323d5156d5d83d531c9c8ded', '2024-06-28 02:56:13', '2024-06-28 02:56:13'),
(6, 1, 'aji ajaa', 'aji@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2024-06-28 02:59:29', '2024-07-17 02:09:55'),
(8, NULL, 'asdsadasd', 'admin@gmail.com', 'd3f55e35f15c920c323d5156d5d83d531c9c8ded', '2024-07-05 04:30:29', '2024-07-05 04:30:29'),
(9, NULL, 'Aji Yusti Permana', 'aji@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2024-07-12 06:59:37', '2024-07-12 06:59:37'),
(10, 1, 'FARHAN SYAFIQ RIZQULLOOH', 'ajiasdasdasdsa@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2024-07-12 07:06:41', '2024-07-12 07:10:45'),
(12, 4, 'Bela Abbyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', 'aaaaabela@gmail.commmmmmmmmmmmmmmmmmm', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2024-07-12 07:38:09', '2024-07-12 08:19:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_id_level` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
