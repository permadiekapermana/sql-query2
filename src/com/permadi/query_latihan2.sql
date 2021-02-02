-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2021 at 06:26 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `query_latihan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_person`
--

CREATE TABLE `tb_person` (
  `ID_Person` varchar(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Tgl_lahir` date NOT NULL,
  `Tmp_lahir` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `ID_Ayah` varchar(11) DEFAULT NULL,
  `ID_Ibu` varchar(11) DEFAULT NULL,
  `ID_Pasangan` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_person`
--

INSERT INTO `tb_person` (`ID_Person`, `Nama`, `Tgl_lahir`, `Tmp_lahir`, `jenis_kelamin`, `Status`, `ID_Ayah`, `ID_Ibu`, `ID_Pasangan`) VALUES
('Data001', 'Budi', '1967-06-29', 'Bandung', 'Laki-Laki', 'Hidup', NULL, NULL, 'Data002'),
('Data002', 'Santi', '1968-07-28', 'Bandung', 'Perempuan', 'Hidup', NULL, NULL, 'Data001'),
('Data003', 'Rudi', '1989-01-01', 'Bandung', 'Laki-Laki', 'Hidup', 'Data001', 'Data002', NULL),
('Data004', 'Santi', '1989-02-14', 'Bandung', 'Perempuan', 'Hidup', 'Data001', 'Data002', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_person`
--
ALTER TABLE `tb_person`
  ADD PRIMARY KEY (`ID_Person`),
  ADD KEY `ID_Ayah` (`ID_Ayah`,`ID_Ibu`,`ID_Pasangan`),
  ADD KEY `ID_Ibu` (`ID_Ibu`),
  ADD KEY `ID_Pasangan` (`ID_Pasangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_person`
--
ALTER TABLE `tb_person`
  ADD CONSTRAINT `tb_person_ibfk_1` FOREIGN KEY (`ID_Ayah`) REFERENCES `tb_person` (`ID_Person`),
  ADD CONSTRAINT `tb_person_ibfk_2` FOREIGN KEY (`ID_Ibu`) REFERENCES `tb_person` (`ID_Person`),
  ADD CONSTRAINT `tb_person_ibfk_3` FOREIGN KEY (`ID_Pasangan`) REFERENCES `tb_person` (`ID_Person`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
