-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
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
-- Database: `roommate_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `alcoholic` tinyint(1) NOT NULL,
  `smoking` tinyint(1) NOT NULL,
  `nightowl` tinyint(1) NOT NULL,
  `physically_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`id`, `user_id`, `course`, `year`, `alcoholic`, `smoking`, `nightowl`, `physically_active`) VALUES
(4, 29, 'bba', 1, 0, 0, 0, 0),
(5, 30, 'btech', 1, 0, 0, 0, 0),
(6, 31, 'btech', 1, 0, 0, 0, 0),
(7, 32, 'btech', 2, 0, 0, 0, 0),
(8, 33, 'btech', 1, 0, 0, 0, 0),
(9, 34, 'btech', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `outlook_id` varchar(255) NOT NULL,
  `mob_no` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `course` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `alcoholic` tinyint(1) NOT NULL,
  `smoking` tinyint(1) NOT NULL,
  `nightowl` tinyint(1) NOT NULL,
  `physically_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `registration_no`, `email`, `outlook_id`, `mob_no`, `dob`, `course`, `branch`, `year`, `alcoholic`, `smoking`, `nightowl`, `physically_active`) VALUES
(1, 'John Doe', '12345', 'john@example.com', 'john_outlook@example.com', '1234567890', '2000-01-01', '', '', 0, 0, 0, 0, 0),
(2, 'Ravsa', '1122', 'ravi@a', 'ravi@ab', '112233', '2024-04-01', 'btech', 'CSE', 2, 0, 0, 0, 0),
(26, 'John Doe', '12345', 'john@example.com', 'john_outlook@example.com', '1234567890', '2000-01-01', 'BBA', 'Marketing', 1, 0, 0, 0, 0),
(27, 'Ravsa', '1122', 'ravi@a', 'ravi@ab', '2244', '2024-04-05', 'bba', 'Marketing', 1, 0, 0, 0, 0),
(29, 'harsh', '9988', 'harsh@g', 'harsh@gb', '55', '2024-04-06', 'bba', 'Marketing', 1, 0, 0, 0, 0),
(30, 'Ravsa', '1122', 'ravi@a', 'ravi@ab', '112233', '2024-04-01', 'btech', 'CSE', 1, 0, 0, 0, 0),
(31, 'Ravsa', '1122', 'ravi@a', 'ravi@ab', '112233', '2024-04-01', 'btech', 'CSE', 1, 0, 0, 0, 0),
(32, 'Devsa', '229311128', 'help@a', 'help@b', '556', '2024-04-01', 'btech', 'CSE', 2, 0, 0, 0, 0),
(33, 'a', '12ab', 'a@df', 'sdf@sdf', '12', '2024-04-02', 'btech', 'CSE', 1, 0, 0, 0, 0),
(34, 'a', '12ab', 'a@df', 'sdf@sdf', '12', '2024-04-02', 'btech', 'CSE', 1, 0, 0, 0, 0);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `insert_into_preferences` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO preferences (user_id, course, year, alcoholic, smoking, nightowl, physically_active)
    VALUES (NEW.id, NEW.course, NEW.year, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
