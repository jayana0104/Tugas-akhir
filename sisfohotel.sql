-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 05:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisfohotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` varchar(10) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`idkamar`, `tipe`, `jumlah`, `harga`, `gambar`) VALUES
('001', 'Superior', 7, 410000, 'Standard.jpg'),
('002', 'Deluxe', 45, 450000, 'Superior.jpg'),
('003', 'Junior Suite', 4, 700000, 'Deluxe.jpg'),
('004', 'Executive', 2, 1200000, 'Junior-Suite.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `idkontak` int(11) NOT NULL,
  `idtamu` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pesanuser` text NOT NULL,
  `pesanadmin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`idkontak`, `idtamu`, `username`, `pesanuser`, `pesanadmin`) VALUES
(1, 1, 'JAY', 'Halooo....', ''),
(2, 2, 'ANA', '', 'Yoooo'),
(3, 3, 'ANAJAY', 'Tesssss...', '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`) VALUES
('petugas01', '123', 'petugas'),
('tamu01', '321', 'tamu');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idpesan` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `norek` varchar(15) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `gambar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idpesan`, `nama`, `jumlah`, `bank`, `norek`, `namarek`, `gambar`) VALUES
('46', 'ANGGA M', 1800000, 'Mandiri', '1111111', 'ANGGA', '2023-05-06 (2).png'),
('47', 'jumadibray', 820000, 'BCA', '0000000000000', 'Jayana', '2023-05-06 (5).png'),
('48', 'jumadibray', 2400000, 'BCA', '3333333333333', 'hotel j&j', '2023-05-06 (6).png'),
('53', 'ranggaaaa', 450000, 'BCA', '2784556565', 'hotel j&j', 'cerita inggris.jpg'),
('55', 'jumadibray', 410000, 'BNI', '3333333333333', 'hotel j&j', 'ga.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `idpesan` int(11) NOT NULL,
  `tglpesan` datetime NOT NULL,
  `batasbayar` datetime NOT NULL,
  `idkamar` varchar(15) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idtamu` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglkeluar` date NOT NULL,
  `lamahari` int(11) NOT NULL DEFAULT 0,
  `totalbayar` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'Pending...'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`idpesan`, `tglpesan`, `batasbayar`, `idkamar`, `tipe`, `harga`, `jumlah`, `idtamu`, `nama`, `alamat`, `telepon`, `tglmasuk`, `tglkeluar`, `lamahari`, `totalbayar`, `status`) VALUES
(45, '2025-01-26 21:03:14', '2025-01-27 02:03:14', '001', 'Superior', 410000, 1, 1, 'JAYANA', 'Jl. KI AGENG TAPA', '089651026532', '2025-01-26', '2025-01-27', 1, 410000, 'Dibatalkan'),
(46, '2025-01-26 21:18:32', '2025-01-27 02:18:32', '002', 'Deluxe', 450000, 2, 15, 'ANGGA M', 'TUMARITIS', '02147856', '2025-01-27', '2025-02-01', 2, 1800000, 'Dibatalkan'),
(47, '2025-01-26 21:34:08', '2025-01-27 02:34:08', '001', 'Superior', 410000, 1, 16, 'jumadibray', 'gmt', '08547544', '2025-01-26', '2025-01-28', 2, 820000, 'Dibatalkan'),
(48, '2025-01-26 21:46:40', '2025-01-27 02:46:40', '004', 'Executive', 1200000, 2, 16, 'jumadibray', 'gmt', '08547544', '2025-01-26', '2025-01-27', 1, 2400000, 'Dibatalkan'),
(49, '2025-01-26 21:50:04', '2025-01-27 02:50:04', '003', 'Junior Suite', 700000, 3, 16, 'jumadibray', 'gmt', '08547544', '2025-01-26', '2025-01-27', 1, 2100000, 'Dibatalkan'),
(50, '2025-01-26 22:03:52', '2025-01-27 03:03:52', '003', 'Junior Suite', 700000, 1, 1, 'JAYANA', 'Jl. KI AGENG TAPA', '089651026532', '2025-01-26', '2025-01-28', 2, 1400000, 'Dibatalkan'),
(51, '2025-01-29 17:16:31', '2025-01-29 22:16:31', '002', 'Deluxe', 450000, 1, 1, 'JAYANA', 'Jl. KI AGENG TAPA', '089651026532', '2025-01-29', '2025-01-30', 1, 450000, 'Dibatalkan'),
(52, '2025-01-29 17:22:16', '2025-01-29 22:22:16', '001', 'Superior', 410000, 1, 16, 'jumadibray', 'gmt', '08547544', '2025-01-29', '2025-01-30', 1, 410000, 'Dibatalkan'),
(53, '2025-01-30 01:19:50', '2025-01-30 06:19:50', '002', 'Deluxe', 450000, 1, 18, 'ranggaaaa', 'jl ciwaringin', '08525455', '2025-01-30', '2025-01-31', 1, 450000, 'Pending...'),
(54, '2025-01-30 02:40:08', '2025-01-30 07:40:08', '002', 'Deluxe', 450000, 3, 16, 'jumadibray', 'gmt', '08547544', '2025-01-30', '2025-02-02', 0, 0, 'Dibatalkan'),
(55, '2025-01-30 02:41:23', '2025-01-30 07:41:23', '001', 'Superior', 410000, 1, 16, 'jumadibray', 'gmt', '08547544', '2025-01-30', '2025-01-31', 1, 410000, 'Dibatalkan'),
(56, '2025-02-01 06:48:09', '2025-02-01 11:48:09', '001', 'Superior', 410000, 2, 16, 'jumadibray', 'gmt', '08547544', '2025-02-01', '2025-02-02', 1, 820000, 'Pending...');

-- --------------------------------------------------------

--
-- Table structure for table `stokkamar`
--

CREATE TABLE `stokkamar` (
  `idkamar` varchar(20) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stokkamar`
--

INSERT INTO `stokkamar` (`idkamar`, `tipe`, `stok`) VALUES
('001', 'Superior', 1),
('002', 'Deluxe', 35),
('003', 'Junior Suite', 0),
('004', 'Executive', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `idtamu` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`idtamu`, `username`, `email`, `nama`, `alamat`, `telepon`, `password`, `foto`) VALUES
(1, 'JAYANA', 'JAYANA@gmail.com', 'JAYANA', 'Jl. KI AGENG TAPA', '089651026532', '202cb962ac59075b964b07152d234b70', 'logo.png'),
(2, 'zay', 'zay_jayena@gmail.com', 'ZAY', 'Jl. abcd', '088111222333', '202cb962ac59075b964b07152d234b70', ''),
(3, 'JAYENA', 'JAYENA1@gmail.com', 'JAYENA', 'Jl....', '1234567777', '202cb962ac59075b964b07152d234b70', ''),
(4, 'ANA', 'ANAKU@gmail.com', 'ANAJAY', 'Jl. KI AGENG TAPA', '088777888999', '202cb962ac59075b964b07152d234b70', ''),
(14, 'jayana', 'ade.jayana12@gmail.com', 'JAYANA1', 'kalibaru', '1010', '202cb962ac59075b964b07152d234b70', ''),
(15, 'ANGGA', 'ANGGA@GMAIL.COM', 'ANGGA M', 'TUMARITIS', '02147856', 'caf1a3dfb505ffed0d024130f58c5cfa', ''),
(16, 'jumadi', 'jumadi@gmail.com', 'jumadibray', 'gmt', '08547544', '202cb962ac59075b964b07152d234b70', ''),
(17, 'jumadi', 'jumadi@gmail.com', 'jumadibray', 'jkj', '0010', '202cb962ac59075b964b07152d234b70', ''),
(18, 'rangga', 'rangga@gmail.com', 'ranggaaaa', 'jl ciwaringin', '08525455', '202cb962ac59075b964b07152d234b70', ''),
(19, 'jumadi', 'jumadi@gmail.com', 'jumadibray', 'jl ageng tapa', '085235586545', '202cb962ac59075b964b07152d234b70', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`idkontak`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idpesan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`idpesan`);

--
-- Indexes for table `stokkamar`
--
ALTER TABLE `stokkamar`
  ADD PRIMARY KEY (`idkamar`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`idtamu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `idkontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `idpesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `idtamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
