-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2022 at 02:16 PM
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
-- Database: `tp3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `email` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`email`, `mdp`) VALUES
('hacen@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `choix`
--

CREATE TABLE `choix` (
  `numSpecialite` int(11) NOT NULL,
  `specialite` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `choix`
--

INSERT INTO `choix` (`numSpecialite`, `specialite`) VALUES
(1, 'GL'),
(2, 'SITW'),
(3, 'STIC');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `numE` int(11) NOT NULL,
  `nomE` varchar(50) NOT NULL,
  `prenomE` varchar(50) NOT NULL,
  `moyenneE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`numE`, `nomE`, `prenomE`, `moyenneE`) VALUES
(4, 'foura', 'oussama', 20),
(6, 'hacen', 'barboucha', 18.5),
(7, 'hacen', 'barboucha', 18.5),
(8, 'mourad', 'yaou', 18.5),
(9, 'daoui', 'ibrahim', 18.5),
(10, 'mourad', 'yaou', 18.5),
(11, 'daoui', 'ibrahim', 18.5);

-- --------------------------------------------------------

--
-- Table structure for table `voeux`
--

CREATE TABLE `voeux` (
  `numV` int(11) NOT NULL,
  `voeux1` varchar(50) NOT NULL,
  `voeux2` varchar(50) NOT NULL,
  `voeux3` varchar(50) NOT NULL,
  `numE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voeux`
--

INSERT INTO `voeux` (`numV`, `voeux1`, `voeux2`, `voeux3`, `numE`) VALUES
(3, 'GL', 'SITW', 'STIC', 4),
(6, 'GL', 'SITW', 'STIC', 9),
(8, 'SITW', 'GL', 'STIC', 7),
(9, 'STIC', 'SITW', 'GL', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`numSpecialite`),
  ADD UNIQUE KEY `specialite` (`specialite`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`numE`);

--
-- Indexes for table `voeux`
--
ALTER TABLE `voeux`
  ADD PRIMARY KEY (`numV`),
  ADD UNIQUE KEY `numE` (`numE`),
  ADD KEY `voeux1_specialite_fk` (`voeux1`),
  ADD KEY `voeux2_specialite_fk` (`voeux2`),
  ADD KEY `voeux3_specialite_fk` (`voeux3`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choix`
--
ALTER TABLE `choix`
  MODIFY `numSpecialite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `numE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `voeux`
--
ALTER TABLE `voeux`
  MODIFY `numV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `voeux`
--
ALTER TABLE `voeux`
  ADD CONSTRAINT `numE_voeux_fk` FOREIGN KEY (`numE`) REFERENCES `etudiant` (`numE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voeux1_specialite_fk` FOREIGN KEY (`voeux1`) REFERENCES `choix` (`specialite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voeux2_specialite_fk` FOREIGN KEY (`voeux2`) REFERENCES `choix` (`specialite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voeux3_specialite_fk` FOREIGN KEY (`voeux3`) REFERENCES `choix` (`specialite`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
