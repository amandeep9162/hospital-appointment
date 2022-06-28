-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2022 at 02:55 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wwwmadaa_scheduler_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `date_sched` datetime NOT NULL,
  `ailment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `date_sched`, `ailment`, `status`, `date_created`) VALUES
(1, 1, '2022-04-28 01:30:00', '', 0, '2022-04-28 13:22:00'),
(2, 2, '2022-04-28 03:10:00', '', 0, '2022-04-28 04:34:14'),
(3, 3, '2022-04-29 03:50:00', '', 0, '2022-04-29 05:14:16'),
(4, 4, '2022-05-02 02:27:00', '', 0, '2022-05-02 04:01:28'),
(5, 5, '2022-05-03 11:40:00', '', 0, '2022-05-03 00:48:20'),
(6, 6, '2022-05-04 11:20:00', '', 0, '2022-05-03 01:59:19'),
(7, 7, '2022-05-04 11:10:00', '', 0, '2022-05-03 01:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(50) NOT NULL,
  `name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`) VALUES
(1, 'Doctor1 (OPD)'),
(2, 'Doctor2 (Radiology)');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `location` text,
  `description` text,
  `max_a_day` int(5) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location`, `description`, `max_a_day`, `date_created`, `date_updated`) VALUES
(1, 'Vaccination Location 1, Sample City, Negros Occidental', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus accumsan ac justo consequat dignissim. Nam eget pretium nisl, at tempor velit. Sed vel nisl a metus porta placerat in in neque. Praesent aliquam nisi nisl, eget porta lacus iaculis ac. Fusce dignissim et nibh vel euismod. Vestibulum eget enim metus. Ut faucibus, lectus facilisis eleifend dignissim, ligula lorem porttitor elit, eu placerat odio urna quis augue. Proin rutrum, enim in auctor rhoncus, turpis ipsum rutrum sem, nec varius purus nisi at dolor. Donec porta turpis vel erat iaculis, eget consequat mauris dapibus. Nullam euismod quam sagittis nisl maximus auctor. Duis turpis nisi, condimentum eget interdum ut, ultricies non turpis. Donec auctor a mi at commodo. Vivamus ultrices venenatis orci, vel venenatis sem pharetra ac. Ut scelerisque lorem sed purus facilisis lacinia.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 500, '2021-06-28 09:52:13', '2021-06-28 09:52:39'),
(4, 'Sample location  2', '&lt;p&gt;Sample only&lt;/p&gt;', 100, '2021-06-28 16:19:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_list`
--

CREATE TABLE `patient_list` (
  `id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_list`
--

INSERT INTO `patient_list` (`id`, `name`, `date_created`) VALUES
(1, 'Amandeep singh', '2022-04-28 13:22:00'),
(2, 'test', '2022-04-28 04:34:14'),
(3, 'Amandeep singh', '2022-04-29 05:14:16'),
(4, 'benu', '2022-05-02 04:01:28'),
(5, 'Amandeep singh', '2022-05-03 00:48:20'),
(6, 'Amandeep singh', '2022-05-03 01:59:19'),
(7, 'Amandeep singh', '2022-05-03 01:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `patient_meta`
--

CREATE TABLE `patient_meta` (
  `patient_id` int(30) NOT NULL,
  `meta_field` text,
  `meta_value` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_meta`
--

INSERT INTO `patient_meta` (`patient_id`, `meta_field`, `meta_value`, `date_created`) VALUES
(1, 'id', '', '2022-04-28 13:22:00'),
(1, 'patient_id', '', '2022-04-28 13:22:00'),
(1, 'name', 'Amandeep singh', '2022-04-28 13:22:00'),
(1, 'email', 'amandeep9162@gmail.com', '2022-04-28 13:22:00'),
(1, 'contact', '9915034645', '2022-04-28 13:22:00'),
(1, 'gender', 'Male', '2022-04-28 13:22:00'),
(1, 'age', '29', '2022-04-28 13:22:00'),
(1, 'doctor', '1', '2022-04-28 13:22:00'),
(1, 'specialty', '1', '2022-04-28 13:22:00'),
(1, 'time', '13:00,16:00', '2022-04-28 13:22:00'),
(1, 'remarks', 'ds asd asd as adasdas', '2022-04-28 13:22:00'),
(2, 'id', '', '2022-04-28 04:34:14'),
(2, 'patient_id', '', '2022-04-28 04:34:14'),
(2, 'name', 'test', '2022-04-28 04:34:14'),
(2, 'email', 'amandeep9162@gmail.com', '2022-04-28 04:34:14'),
(2, 'contact', '9915034645', '2022-04-28 04:34:14'),
(2, 'gender', 'Male', '2022-04-28 04:34:14'),
(2, 'age', '29', '2022-04-28 04:34:14'),
(2, 'doctor', '1', '2022-04-28 04:34:14'),
(2, 'specialty', '1', '2022-04-28 04:34:14'),
(2, 'time', '13:00,16:00', '2022-04-28 04:34:14'),
(2, 'remarks', 'testing', '2022-04-28 04:34:14'),
(3, 'id', '', '2022-04-29 05:14:16'),
(3, 'patient_id', '', '2022-04-29 05:14:16'),
(3, 'name', 'Amandeep singh', '2022-04-29 05:14:16'),
(3, 'email', 'amandeep9162@gmail.com', '2022-04-29 05:14:16'),
(3, 'contact', '9915034645', '2022-04-29 05:14:16'),
(3, 'gender', 'Male', '2022-04-29 05:14:16'),
(3, 'age', '44', '2022-04-29 05:14:16'),
(3, 'doctor', '1', '2022-04-29 05:14:16'),
(3, 'time', '13:00,16:00', '2022-04-29 05:14:16'),
(3, 'remarks', ' g gdf gfg dfg fdg fdg fd gfdg df g', '2022-04-29 05:14:16'),
(4, 'id', '', '2022-05-02 04:01:28'),
(4, 'patient_id', '', '2022-05-02 04:01:28'),
(4, 'name', 'benu', '2022-05-02 04:01:28'),
(4, 'email', 'benunayyar01@gmail.com', '2022-05-02 04:01:28'),
(4, 'contact', '7009451453', '2022-05-02 04:01:28'),
(4, 'gender', 'Female', '2022-05-02 04:01:28'),
(4, 'age', '33', '2022-05-02 04:01:28'),
(4, 'doctor', '1', '2022-05-02 04:01:28'),
(4, 'time', '13:00,16:00', '2022-05-02 04:01:28'),
(4, 'remarks', ' gdfg dfgdfgdfg', '2022-05-02 04:01:28'),
(5, 'id', '', '2022-05-03 00:48:20'),
(5, 'patient_id', '', '2022-05-03 00:48:20'),
(5, 'name', 'Amandeep singh', '2022-05-03 00:48:20'),
(5, 'email', 'amandeep9162@gmail.com', '2022-05-03 00:48:20'),
(5, 'contact', '9915034645', '2022-05-03 00:48:20'),
(5, 'gender', 'Male', '2022-05-03 00:48:20'),
(5, 'age', '33', '2022-05-03 00:48:20'),
(5, 'doctor', '1', '2022-05-03 00:48:20'),
(5, 'time', '18:30,19:30', '2022-05-03 00:48:20'),
(5, 'date_scheds', '22-05-03 6:50PM', '2022-05-03 00:48:20'),
(5, 'remarks', 'asd asdasd asd asd asasd', '2022-05-03 00:48:20'),
(6, 'id', '', '2022-05-03 01:59:19'),
(6, 'patient_id', '', '2022-05-03 01:59:19'),
(6, 'name', 'Amandeep singh', '2022-05-03 01:59:19'),
(6, 'email', 'amandeep9162@gmail.com', '2022-05-03 01:59:19'),
(6, 'contact', '9915034645', '2022-05-03 01:59:19'),
(6, 'gender', 'Male', '2022-05-03 01:59:19'),
(6, 'age', '22', '2022-05-03 01:59:19'),
(6, 'doctor', '1', '2022-05-03 01:59:19'),
(6, 'time', '11:00,14:00', '2022-05-03 01:59:19'),
(6, 'remarks', ' s da sds d asd', '2022-05-03 01:59:19'),
(7, 'id', '', '2022-05-03 01:59:51'),
(7, 'patient_id', '', '2022-05-03 01:59:51'),
(7, 'name', 'Amandeep singh', '2022-05-03 01:59:51'),
(7, 'email', 'amandeep9162@gmail.com', '2022-05-03 01:59:51'),
(7, 'contact', '9915034645', '2022-05-03 01:59:51'),
(7, 'gender', 'Male', '2022-05-03 01:59:51'),
(7, 'age', '22', '2022-05-03 01:59:51'),
(7, 'doctor', '2', '2022-05-03 01:59:51'),
(7, 'time', '11:00,14:00', '2022-05-03 01:59:51'),
(7, 'remarks', 'dds sds das sa asdas', '2022-05-03 01:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_settings`
--

CREATE TABLE `schedule_settings` (
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_settings`
--

INSERT INTO `schedule_settings` (`meta_field`, `meta_value`, `date_create`) VALUES
('day_schedule', 'Monday,Tuesday,Wednesday,Thursday,Friday', '2022-05-02 04:05:31'),
('morning_schedule', '11:00,14:00', '2022-05-02 04:05:31'),
('afternoon_schedule', '18:30,19:30', '2022-05-02 04:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(50) NOT NULL,
  `name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `name`) VALUES
(1, 'opd');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Madaan Hospital Appointment'),
(6, 'short_name', 'Madaan  Hospital '),
(11, 'logo', 'uploads/1650949380_512x512logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1650872760_coronavirus-doctor-working-hospital-copy-text-background-banner-doctors-hospitals-fighting-male-protective-suit-mask-178767520.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(6, 'George', 'Wilson', 'gwilson', 'd40242fb23c45206fadee4e2418f274f', 'uploads/1630598640_male.png', NULL, 0, '2021-09-03 00:04:40', '2021-09-03 00:07:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_list`
--
ALTER TABLE `patient_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_meta`
--
ALTER TABLE `patient_meta`
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient_list`
--
ALTER TABLE `patient_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient_meta`
--
ALTER TABLE `patient_meta`
  ADD CONSTRAINT `patient_meta_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
