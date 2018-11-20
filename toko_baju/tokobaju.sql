-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 07:15 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobaju`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` text NOT NULL,
  `kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `qty`, `harga`, `keterangan`, `gambar`, `kategori`) VALUES
(38, 'FJ', 5, 80000, 'Good Times Color Kaos Tangan Pajang Selalu Murah', 'gambar/dua.jpg', 5),
(39, 'GJ', 5, 75000, 'Kain Tisu Bermotif Di Bagian Leher', 'gambar/duabelas.jpg', 5),
(40, 'Gambreng', 8, 75000, 'Kain Tisu Cocok Untuk Kuliah Ukuran X Bebagai Macam Color', 'gambar/sebelas.jpg', 5),
(41, 'Blaster', 8, 110000, 'Kain Kaos Bagian Atas Polos Bagian Bawah Blaster Bagian Lher Bermotif Berbagai Color Ukuran X', 'gambar/tiga.jpg', 2),
(42, 'Gombal', 7, 130000, 'Cocok Untuk Ibu Ibu Pengajian Kais Kaos Disertai Jilbab Yang Serasi Ukuran XL Berbagai Color', 'gambar/satu.jpg', 2),
(43, 'Mukio', 10, 1500000, 'Kain Kertas Cocok Untuk Acara Pernikahan Model Baju Depan Pendek Blakang Panjang Bawahan Bersorak Lebih Elegan .Berbagai Color Ukuran XL', 'gambar/lima.jpg', 2),
(44, 'Maco', 8, 80000, 'Cocok Untuk Olah Raga Model Set Bagian Atas Wadah Kepala Bagian Pinggang Kerutan Bawah Bagian Lutut Kerut', 'gambar/empat.jpg', 6),
(45, 'Setel', 4, 170000, 'Cocok Untuk Pergi Ke Mol Kain Kaos ', 'gambar/enam.jpg', 6),
(46, 'Kentel', 5, 50000, 'Kain Kaos Bawah Kerut Tali Dipinggang', 'gambar/enambelas.jpg', 7),
(47, 'Sasa', 8, 550000, 'Kain Kaos Pinggang Tali Bawah Kerut', 'gambar/limabelas.jpg', 7),
(48, 'Dress', 5, 150000, 'Kain Taplak Atas Renggang Bawah Mekrok', 'gambar/url.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama`, `alamat`, `username`, `password`) VALUES
(4, 'fitri', 'jati', 'fitri', 'fitri'),
(6, 'dian', 'ngawi', 'dian', 'dian'),
(7, 'bintang', 'jl.pabrik tenun', '1605102045', '12345'),
(8, 'siska', 'jl.pabrik tenun', 'sarly', 'sarly');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(2, 'baju muslim'),
(4, 'dress'),
(5, 'atasan'),
(6, 'set'),
(7, 'bawahan');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id`, `id_customer`, `nama_barang`, `harga`, `jumlah_beli`, `total_harga`) VALUES
(3, '4', 'Sasa', 550000, 3, 1650000),
(4, '4', 'Dress', 150000, 1, 150000),
(6, '4', 'Dress', 150000, 1, 150000),
(10, '4', 'Sasa', 550000, 4, 2200000);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `isi_komentar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
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
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
