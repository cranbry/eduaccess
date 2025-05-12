-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2025 at 04:14 PM
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
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `event_date` date NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Resources`
--

CREATE TABLE `Resources` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `date_uploaded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Resources`
--

INSERT INTO `Resources` (`id`, `title`, `type`, `subject`, `description`, `uploaded_by`, `date_uploaded`) VALUES
(1, 'Intro to Python', 'PDF', 'Computer Science', 'Beginner-friendly Python guide with exercises.', 'Prof. Smith', '2025-05-04'),
(2, 'Advanced Python', 'Video', 'Computer Science', 'Deep dive into Python for experienced coders.', 'Dr. Rivera', '2025-05-04'),
(3, 'Python Basics', NULL, NULL, 'Introduction to Python with hands-on exercises.', NULL, NULL),
(4, 'Learn Python Fast', NULL, NULL, 'A quick Python crash course for beginners.', NULL, NULL),
(5, 'BMCC Python Help', 'Video', 'Computer Science', 'Python courses for BMCC students.', 'Dr. Younes', '2025-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `Tutors`
--

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
(2, 'Leo Gomez', 'Web Development', 'TTh 2PM-4PM', 'leo.dev@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `Workshops`
--

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
(1, 'Python Bootcamp', '2025-05-15', 'Lab 203', 'CS Club', 25),
(2, 'Accessible Web Design', '2025-05-18', 'Room 105', 'Tech for All', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `Events`
--
ALTER TABLE `Events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Resources`
--
ALTER TABLE `Resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Tutors`
--
ALTER TABLE `Tutors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Workshops`
--
ALTER TABLE `Workshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
