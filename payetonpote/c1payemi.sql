-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 17, 2019 at 01:43 PM
-- Server version: 10.3.13-MariaDB-1:10.3.13+maria~bionic
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c1payemi`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` varchar(32) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`id`, `title`, `content`, `created_at`, `updated_at`, `goal`, `name`) VALUES
('3fcfddf67f3a2678d76e02d3c33cbe5e', 'Cadeau anniversaire 30 ans', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam', NULL, NULL, 560, 'Chris'),
('4a9c41f36b2c275d8b44dcb1b5f200a8', 'Vacances au soleil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ', NULL, NULL, 10000, 'Mireille'),
('8ae86fbe53fd922262b26de1fc1bc133', 'Achat d\'une guitare', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ', NULL, NULL, 300, 'Alex'),
('a07c09d66d58b87d09f3a20b63de6710', 'Anniversaire à Disney  de Lola', 'Pour fêter en famille comme il se doit les 10 ans de Lola !!!!', NULL, NULL, 1200, 'Emilie'),
('b769f31a838eb7442e257ae122f53f11', 'Achat d\'un camping cars', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ', NULL, NULL, 60000, 'Amanda');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190702125839', '2019-07-02 13:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `campaign_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `name`, `email`, `campaign_id`) VALUES
(13, 'Lucas', 'okdreszg@20.kj', 'a07c09d66d58b87d09f3a20b63de6710'),
(14, 'Angélique', 'aezaraer@10.50', 'a07c09d66d58b87d09f3a20b63de6710'),
(16, 'zaza', 'azreze@10.sdeq', 'a07c09d66d58b87d09f3a20b63de6710'),
(17, 'Christophe', 'chri@lom.30', 'a07c09d66d58b87d09f3a20b63de6710'),
(21, 'Chris', 'chris@lo.20', 'a07c09d66d58b87d09f3a20b63de6710'),
(33, 'Antho', 'Anthoi.lol@1.b', '3fcfddf67f3a2678d76e02d3c33cbe5e'),
(34, 'Amandine', 'amandoine@koi.fr', 'a07c09d66d58b87d09f3a20b63de6710'),
(35, 'Alexis', 'alex.c@lolo.3', '3fcfddf67f3a2678d76e02d3c33cbe5e'),
(36, 'ret', 'ezt @bhjgh.2', '3fcfddf67f3a2678d76e02d3c33cbe5e'),
(37, 'Nico', 'nico@lol.l', '3fcfddf67f3a2678d76e02d3c33cbe5e');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `hide_identity` tinyint(1) DEFAULT NULL,
  `hide_amount` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `created_at`, `updated_at`, `participant_id`, `hide_identity`, `hide_amount`) VALUES
(13, 50, NULL, NULL, 13, NULL, NULL),
(14, 100, NULL, NULL, 14, NULL, NULL),
(16, 10, NULL, NULL, 16, 0, 0),
(17, 60, NULL, NULL, 17, 0, 0),
(21, 10, NULL, NULL, 21, 0, 0),
(33, 20, NULL, NULL, 33, 1, 1),
(34, 100, NULL, NULL, 34, 0, 0),
(35, 20, NULL, NULL, 35, 0, 0),
(36, 150, NULL, NULL, 36, 0, 0),
(37, 150, NULL, NULL, 37, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_participant_campaign1_idx` (`campaign_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_participant1_idx` (`participant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B11F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_6D28840D9D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
