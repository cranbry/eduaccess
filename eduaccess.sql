-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2025 at 10:46 PM
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
-- Database: `eduaccess`
--
CREATE DATABASE IF NOT EXISTS `eduaccess` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eduaccess`;

-- --------------------------------------------------------

--
-- Table structure for table `Resources`
--

DROP TABLE IF EXISTS `Resources`;
CREATE TABLE `Resources` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `date_uploaded` date DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `workshop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Resources`
--

INSERT INTO `Resources` (`id`, `title`, `type`, `subject`, `description`, `uploaded_by`, `date_uploaded`, `tutor_id`, `workshop_id`) VALUES
(1, 'Intro to Python', 'PDF', 'Computer Science', 'Beginner-friendly Python guide with exercises.', 'Prof. Smith', '2025-05-04', NULL, NULL),
(3, 'Python Basics', NULL, NULL, 'Introduction to Python with hands-on exercises.', NULL, NULL, NULL, NULL),
(4, 'Learn Python Fast', NULL, NULL, 'A quick Python crash course for beginners.', NULL, NULL, NULL, NULL),
(5, 'BMCC Python Help', 'Video', 'Computer Science', 'Python courses for BMCC students.', 'Dr. Younes', '2025-05-19', NULL, NULL),
(23, 'python bootcamp', 'bootcamp', 'python', 'wedoewi', 'Mouad', '2025-05-12', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Tutors`
--

DROP TABLE IF EXISTS `Tutors`;
CREATE TABLE `Tutors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `availability` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tutors`
--

INSERT INTO `Tutors` (`id`, `name`, `subject`, `availability`, `contact_email`) VALUES
(1, 'Maya Patel', 'Python', 'MWF 10AM-12PM', 'maya.tutor@example.com'),
(5, 'Younes Benkarroum', 'Database', 'MWF 2-4pm', 'ybenkarroum@bmcc.cuny.edu');

-- --------------------------------------------------------

--
-- Table structure for table `Workshops`
--

DROP TABLE IF EXISTS `Workshops`;
CREATE TABLE `Workshops` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Workshops`
--

INSERT INTO `Workshops` (`id`, `topic`, `date`, `location`, `host`, `capacity`) VALUES
(1, 'Python Bootcamp', '2025-05-15', 'Lab 203d', 'CS Club', 25),
(2, 'Accessible Web Design', '2025-05-18', 'Room 105', 'Tech for All', 20),
(5, 'test', '2025-05-14', 'test', 'test', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Resources`
--
ALTER TABLE `Resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Tutors`
--
ALTER TABLE `Tutors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Workshops`
--
ALTER TABLE `Workshops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Resources`
--
ALTER TABLE `Resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tutors`
--
ALTER TABLE `Tutors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Workshops`
--
ALTER TABLE `Workshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
