-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2024 at 10:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_webakademis_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(10) NOT NULL,
  `ID_Dosen` char(30) NOT NULL,
  `Password_Admin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `ID_Dosen`, `Password_Admin`) VALUES
('admin', 'KO-001N', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `ID_Dosen` char(7) NOT NULL,
  `Nama_Dosen` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`ID_Dosen`, `Nama_Dosen`) VALUES
('KO-001N', 'Ocong');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_Jadwal` int(11) NOT NULL,
  `ID_Dosen` char(7) NOT NULL,
  `ID_Matkul` char(6) NOT NULL,
  `ID_Ruangan` char(10) NOT NULL,
  `Hari` varchar(7) NOT NULL,
  `Jam_Masuk` time NOT NULL,
  `Jam_Keluar` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID_Jadwal`, `ID_Dosen`, `ID_Matkul`, `ID_Ruangan`, `Hari`, `Jam_Masuk`, `Jam_Keluar`) VALUES
(15, 'KO-001N', 'TI0001', 'A022', 'Senin', '07:19:11', '11:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(9) NOT NULL,
  `Nama_Mhs` varchar(30) DEFAULT NULL,
  `Tingkat` char(1) NOT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama_Mhs`, `Tingkat`, `Password`, `Alamat`) VALUES
('12345', 'test', '1', '12345', '12345'),
('150021060', 'vril rizki', '3', '1234', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `ID_Matkul` char(6) NOT NULL,
  `Nama_Matkul` varchar(30) NOT NULL,
  `SKS_Matkul` int(11) NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`ID_Matkul`, `Nama_Matkul`, `SKS_Matkul`, `Semester`) VALUES
('TI0001', 'Ngoding ', 3, 3),
('TI1014', 'DDP', 4, 1),
('TI1022', 'Ilmu Komputer', 2, 1),
('TI2034', 'Pengantar Rekayasa PL', 4, 3),
('TI3123', 'Komputer Grafik', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `ID_Dosen` char(7) NOT NULL,
  `ID_Matkul` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mengajar`
--

INSERT INTO `mengajar` (`ID_Dosen`, `ID_Matkul`) VALUES
('KO-001N', 'TI0001'),
('KO-003N', 'TI1014');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `ID_Matkul` char(6) NOT NULL,
  `NIM` char(9) NOT NULL,
  `Nilai` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`ID_Matkul`, `NIM`, `Nilai`) VALUES
('TI0001', '150021060', 'A'),
('TI1014', '171511001', 'A'),
('TI1022', '171511001', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `ID_Ruangan` char(10) NOT NULL,
  `Nama_Ruangan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`ID_Ruangan`, `Nama_Ruangan`) VALUES
('A022', 'Test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`ID_Dosen`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_Jadwal`),
  ADD KEY `fk_jadwal_mengajar` (`ID_Matkul`,`ID_Dosen`),
  ADD KEY `fk_jadwal_ruangan` (`ID_Ruangan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`ID_Matkul`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`ID_Dosen`,`ID_Matkul`),
  ADD KEY `fk_mengajar_matkul` (`ID_Matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`NIM`,`ID_Matkul`),
  ADD KEY `fk_nilai_matkul` (`ID_Matkul`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`ID_Ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `ID_Jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_jadwal_mengajar` FOREIGN KEY (`ID_Matkul`,`ID_Dosen`) REFERENCES `mengajar` (`ID_Matkul`, `ID_Dosen`),
  ADD CONSTRAINT `fk_jadwal_ruangan` FOREIGN KEY (`ID_Ruangan`) REFERENCES `ruangan` (`ID_Ruangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
