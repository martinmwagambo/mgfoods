-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 07:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `email`) VALUES
(9, 'admin', 'mgfoods', 'admin@mgfoods.com');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `email` varchar(96) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_items_id` int(10) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` varchar(30) NOT NULL,
  `icon_url` varchar(50) NOT NULL,
  `cat_desc` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `icon_url`, `cat_desc`, `date_added`, `date_modified`) VALUES
(138, 'Fast Food', 'img/icons/chips.png', 'Fast Food', '2023-07-19 23:16:25', '2023-07-19 20:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_access` tinyint(1) NOT NULL DEFAULT 1,
  `verify_key` text DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact`
--

CREATE TABLE `customer_contact` (
  `address_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `pin` bigint(6) NOT NULL,
  `contact_number` bigint(10) NOT NULL,
  `alternative_contact_number` bigint(10) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int(10) NOT NULL,
  `icon_title` varchar(20) NOT NULL,
  `icon_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `icon_title`, `icon_url`) VALUES
(1, 'bread', 'img/icons/bread.png'),
(2, 'chicken', 'img/icons/chicken.png'),
(3, 'chips', 'img/icons/chips.png'),
(4, 'egg', 'img/icons/egg.png'),
(5, 'fish', 'img/icons/fish.png'),
(6, 'ice', 'img/icons/ice.png'),
(7, 'juice', 'img/icons/juice.png'),
(8, 'noodles', 'img/icons/noodles.png'),
(9, 'soup', 'img/icons/soup.png'),
(10, 'veg', 'img/icons/veg.png');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(12) NOT NULL,
  `item_title` varchar(50) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT 1,
  `cat_id` int(10) NOT NULL,
  `sub_cat_id` int(10) NOT NULL,
  `item_image` varchar(100) NOT NULL DEFAULT 'img/items/noimage.jpg',
  `item_price` double(6,2) NOT NULL,
  `item_limit` bigint(5) NOT NULL DEFAULT 10,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_title`, `isAvailable`, `cat_id`, `sub_cat_id`, `item_image`, `item_price`, `item_limit`, `date_added`, `date_modified`) VALUES
(1, 'Burger', 1, 138, 62, 'img/items/burger-235.png', 200.00, 10, '2023-07-19 23:17:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `email` varchar(96) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`email`, `password`, `date_added`, `date_modified`) VALUES
('admin@mgfoods.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-19 23:15:08', '2023-07-19 20:45:08'),
('guest@swadesh.com', '', '2019-12-20 15:28:00', '2019-12-20 15:28:00'),
('staff@mgfoods.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-19 23:15:43', '2023-07-19 20:45:43'),
('swadeshrest@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-03-17 19:48:17', '2020-03-17 19:48:17'),
('wamahigadev@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2022-11-29 23:54:09', '2022-11-29 21:24:09'),
('wanjiruwamahiga@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2022-11-30 00:01:14', '2022-11-29 21:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `login_user_ip`
--

CREATE TABLE `login_user_ip` (
  `id` int(10) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` text NOT NULL,
  `user_agent` text NOT NULL,
  `page_accessed` text DEFAULT NULL,
  `date_accessed` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login_user_ip`
--

INSERT INTO `login_user_ip` (`id`, `email`, `ip`, `user_agent`, `page_accessed`, `date_accessed`) VALUES
(104, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 01:48:38'),
(105, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 01:48:44'),
(107, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 01:50:33'),
(109, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 14:53:14'),
(110, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 16:50:17'),
(111, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 17:16:00'),
(112, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 17:39:26'),
(113, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 17:43:33'),
(114, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 17:44:11'),
(115, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-01 18:49:56'),
(116, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-01 18:51:17'),
(117, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 18:54:15'),
(119, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-01 19:07:19'),
(120, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-01 19:08:12'),
(122, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY3', '2020-01-01 19:40:37'),
(123, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY3', '2020-01-01 23:12:24'),
(124, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 00:07:45'),
(125, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 00:09:31'),
(127, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 00:12:25'),
(128, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-02 00:12:38'),
(129, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-02 00:16:36'),
(130, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-02 00:31:46'),
(131, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-02 00:32:35'),
(132, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:36:10'),
(133, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:36:13'),
(134, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:48:13'),
(135, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2&cart=MzMzMzY2', '2020-01-02 00:48:56'),
(136, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:57:40'),
(137, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:57:41'),
(138, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:58:05'),
(139, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:58:56'),
(140, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:59:21'),
(141, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY2', '2020-01-02 00:59:25'),
(142, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 12:57:07'),
(143, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 12:57:10'),
(144, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 12:57:55'),
(145, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:03:59'),
(146, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-02 13:04:12'),
(147, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:08:43'),
(148, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:08:44'),
(149, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:08:48'),
(150, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:09:52'),
(151, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:11:50'),
(152, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:13:34'),
(153, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:13:38'),
(154, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:14:26'),
(155, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:14:31'),
(156, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:16:54'),
(157, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 13:17:36'),
(158, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 16:50:48'),
(159, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 16:50:50'),
(160, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-02 16:50:52'),
(161, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzYz', '2020-01-02 19:11:29'),
(162, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzYz', '2020-01-02 19:11:49'),
(163, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY3', '2020-01-05 10:54:05'),
(164, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY3', '2020-01-05 10:54:06'),
(165, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY3', '2020-01-05 11:38:17'),
(166, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-05 18:09:09'),
(167, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-05 18:09:10'),
(168, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-05 18:09:14'),
(169, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3&reduce=MzMzMzU3', '2020-01-05 18:15:17'),
(170, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3&reduce=MzMzMzU3', '2020-01-05 18:15:21'),
(171, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-05 18:18:06'),
(172, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzU3', '2020-01-05 18:18:10'),
(173, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:41:14'),
(174, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:41:19'),
(175, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:41:49'),
(176, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:41:51'),
(177, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:41:55'),
(179, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 17:58:01'),
(180, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:58:37'),
(181, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:58:40'),
(182, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0&cart=MzMzMzY0', '2020-01-07 17:58:51'),
(183, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:58:52'),
(184, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0&cart=MzMzMzY0', '2020-01-07 17:58:54'),
(185, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:58:55'),
(186, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 17:58:59'),
(188, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 17:59:47'),
(189, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:03:55'),
(191, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:04:47'),
(192, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:06:29'),
(193, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:06:31'),
(195, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:07:40'),
(196, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:07:41'),
(197, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:08:29'),
(199, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:11:39'),
(201, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:18:53'),
(202, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:19:14'),
(203, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:19:14'),
(204, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:19:18'),
(206, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:21:15'),
(208, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:41:47'),
(209, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:42:50'),
(210, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:42:51'),
(211, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:43:14'),
(212, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:47:17'),
(214, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:47:42'),
(216, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:48:23'),
(217, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:50:53'),
(219, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:51:47'),
(220, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:54:56'),
(221, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:55:13'),
(222, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0&cart=MzMzMzY0', '2020-01-07 18:55:15'),
(223, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:55:15'),
(224, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0&cart=MzMzMzY0', '2020-01-07 18:55:17'),
(225, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:55:17'),
(226, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:55:50'),
(227, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:56:05'),
(229, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:56:23'),
(230, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:58:04'),
(231, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0&cart=MzMzMzY0', '2020-01-07 18:58:20'),
(232, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:58:20'),
(233, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 18:58:33'),
(235, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 18:59:35'),
(237, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:01:01'),
(239, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:08:43'),
(240, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:17:23'),
(241, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:17:26'),
(242, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:17:40'),
(243, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:17:43'),
(245, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:18:32'),
(246, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY0', '2020-01-07 19:20:36'),
(247, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:21:01'),
(248, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:21:25'),
(249, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:21:30'),
(251, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:24:21'),
(253, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:28:07'),
(254, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 19:29:12'),
(256, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:30:10'),
(258, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:30:57'),
(260, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-07 19:32:42'),
(262, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:16:38'),
(263, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:16:41'),
(264, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:16:45'),
(265, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 20:16:53'),
(266, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:18:36'),
(267, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:18:44'),
(268, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:19:07'),
(269, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:19:28'),
(270, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1&cart=MzMzMzY1', '2020-01-07 20:19:37'),
(271, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 20:19:43'),
(272, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 20:19:52'),
(273, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 20:20:57'),
(274, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 20:21:24'),
(275, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:19:05'),
(276, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:19:09'),
(277, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:19:27'),
(278, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:19:33'),
(279, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:30:40'),
(280, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:40:03'),
(281, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/item.php?itid=MzMzMzY1', '2020-01-07 21:40:07'),
(283, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/cart.php?', '2020-01-10 16:40:23'),
(284, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/cart.php?', '2020-01-10 16:40:27'),
(286, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-10 17:01:27'),
(288, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-10 17:02:17'),
(290, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/checkout.php?', '2020-01-10 19:46:07'),
(292, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-10 19:47:02'),
(294, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/cart.php?', '2020-01-10 19:47:34'),
(296, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0', '/swadesh/index.php?', '2020-01-10 19:48:14'),
(298, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/index.php?', '2020-01-14 21:41:26'),
(299, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/swadesh/index.php?', '2020-01-22 18:15:06'),
(300, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/index.php?', '2020-02-18 11:31:52'),
(302, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/index.php?', '2020-02-19 20:00:18'),
(303, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/admin/index.php?view_orders', '2020-02-19 21:44:55'),
(304, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/admin/index.php?view_orders', '2020-02-21 19:25:47'),
(306, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/index.php?', '2020-02-23 15:22:30'),
(307, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/item.php?itid=MzMzMzU1', '2020-02-23 15:25:27'),
(308, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/item.php?itid=MzMzMzU1', '2020-02-23 15:25:27'),
(309, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/item.php?itid=MzMzMzU1', '2020-02-23 15:25:31'),
(310, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/cart.php?', '2020-02-23 15:32:37'),
(311, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/cart.php?', '2020-02-23 15:32:38'),
(312, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0', '/swadesh/cart.php?', '2020-02-23 15:32:41'),
(314, 'guest@swadesh.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-24 19:37:40'),
(316, 'guest@swadesh.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-24 20:01:06'),
(318, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-25 20:20:54'),
(320, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-26 17:00:18'),
(322, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '/swadesh/admin/index.php?prod&add_prod=1', '2020-02-27 01:09:40'),
(324, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-27 18:30:23'),
(325, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/register.php?', '2020-02-27 18:45:04'),
(326, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/login.php?', '2020-02-27 18:45:04'),
(329, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-27 18:55:24'),
(331, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/register.php?', '2020-02-27 19:50:46'),
(332, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/login.php?', '2020-02-27 19:53:18'),
(334, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/login.php?', '2020-02-27 20:10:23'),
(336, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-27 20:11:43'),
(337, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-27 20:11:47'),
(339, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-02-29 21:30:24'),
(341, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-03-01 12:04:12'),
(343, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/index.php?', '2020-03-02 21:33:42'),
(344, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/admin/index.php?', '2020-03-05 01:00:34'),
(345, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/admin/login.php?', '2020-03-05 01:00:49'),
(346, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/admin/login.php?', '2020-03-05 01:04:35'),
(347, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/admin/login.php?', '2020-03-05 01:23:33'),
(348, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0', '/swadesh/admin/login.php?', '2020-03-05 01:23:56'),
(349, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-15 18:08:21'),
(350, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-15 18:08:35'),
(351, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-15 20:09:39'),
(352, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/logout.php?', '2020-03-15 20:43:11'),
(353, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-15 20:43:11'),
(355, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 00:08:51'),
(356, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 00:31:49'),
(357, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 01:12:53'),
(358, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/index.php?', '2020-03-16 13:53:25'),
(359, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 14:58:54'),
(360, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 15:03:40'),
(361, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-16 17:17:52'),
(362, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/staff/login.php?', '2020-03-16 17:21:13'),
(363, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/index.php?', '2020-03-17 14:38:21'),
(364, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/index.php?', '2020-03-17 15:17:20'),
(366, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/index.php?', '2020-03-17 15:25:36'),
(368, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-17 15:28:20'),
(371, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/index.php?', '2020-03-17 17:54:03'),
(373, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/admin/login.php?', '2020-03-17 19:42:59'),
(374, 'swadeshrest@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0', '/swadesh/index.php?', '2020-03-17 19:49:34'),
(375, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-29 23:46:47'),
(376, 'swadeshrest@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-29 23:53:22'),
(377, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-29 23:53:39'),
(378, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/register.php?key=MnlCcUdmOFNpTmdZRGRtejFIdWo=&s=2&email=d2FuamlydXdhbWFoaWdhQGdtYWlsLmNvbQ==', '2022-11-30 00:01:35'),
(379, 'wanjiruwamahiga@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 00:02:00'),
(380, 'wanjiruwamahiga@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 00:02:46'),
(381, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/admin/login.php?', '2022-11-30 00:23:18'),
(382, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/staff/login.php?', '2022-11-30 00:23:41'),
(383, 'swadeshrest@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 01:05:25'),
(384, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 01:51:38'),
(385, 'wanjiruwamahiga@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 01:51:55'),
(386, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 18:59:13'),
(387, 'wanjiruwamahiga@gmail.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '/restaurant-order-website/index.php?', '2022-11-30 18:59:49'),
(388, 'guest@swadesh.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', '/mgfoods/cart.php?', '2023-07-19 23:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `op_id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_received`
--

CREATE TABLE `orders_received` (
  `order_id` bigint(20) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `amount` double(6,2) NOT NULL,
  `order_status` text NOT NULL,
  `order_date` datetime NOT NULL,
  `order_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_type` text NOT NULL,
  `address_id` int(10) NOT NULL,
  `cust_instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `order_payment_id` int(10) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `txnid` varchar(100) NOT NULL,
  `txnstatus` varchar(15) NOT NULL,
  `banktxnid` varchar(110) NOT NULL,
  `bankname` varchar(30) NOT NULL,
  `checksumhash` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `pin_codes` bigint(6) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`pin_codes`, `available`) VALUES
(575001, 1),
(575002, 1),
(575003, 1),
(575004, 1),
(575005, 1),
(575006, 1),
(575007, 1),
(575008, 1),
(575010, 1),
(575011, 1),
(575013, 1),
(575014, 1),
(575015, 1),
(575016, 1),
(575019, 1),
(575028, 1),
(575029, 1),
(575030, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(96) NOT NULL,
  `login_access` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `email`, `login_access`) VALUES
(7, 'staff', 'mgfoods', 'staff@mgfoods.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `sub_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `sub_cat_title` varchar(30) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`sub_cat_id`, `cat_id`, `sub_cat_title`, `date_added`, `date_modified`) VALUES
(62, 138, 'Burger', '2023-07-19 23:16:31', '2023-07-19 20:46:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `ADMIN_EMAIL_FK` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `email` (`email`,`session_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_items_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`,`item_id`),
  ADD KEY `CART_ITEMS_ITEMID_FK` (`item_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`) USING BTREE,
  ADD UNIQUE KEY `cat_title` (`cat_title`),
  ADD KEY `CAT_ICON_URL_FK` (`icon_url`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `CUST_EMAIL_FK` (`email`);

--
-- Indexes for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD PRIMARY KEY (`address_id`),
  ADD UNIQUE KEY `contact_number` (`contact_number`),
  ADD KEY `CUST_CONTACT_FK` (`customer_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `icon_url` (`icon_url`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `ITEM_CATID_FK` (`cat_id`),
  ADD KEY `ITEM_SUB_CATID_FK` (`sub_cat_id`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Indexes for table `login_user_ip`
--
ALTER TABLE `login_user_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`op_id`),
  ADD KEY `product_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders_received`
--
ALTER TABLE `orders_received`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `ORD_REC_CUSTID_FK` (`customer_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`order_payment_id`,`checksumhash`,`txnid`) USING BTREE,
  ADD KEY `ORD_PAY_ORDID_FK` (`order_id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`pin_codes`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `STAFF_EMAIL_FK` (`email`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`sub_cat_id`) USING BTREE,
  ADD UNIQUE KEY `sub_cat_title` (`sub_cat_title`,`cat_id`) USING BTREE,
  ADD KEY `SUBCAT_PK` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_items_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `customer_contact`
--
ALTER TABLE `customer_contact`
  MODIFY `address_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333375;

--
-- AUTO_INCREMENT for table `login_user_ip`
--
ALTER TABLE `login_user_ip`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `op_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders_received`
--
ALTER TABLE `orders_received`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2106078742;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `order_payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `sub_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `ADMIN_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `CART_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `customers` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `CART_ITEMS_CARTID_FK` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CART_ITEMS_ITEMID_FK` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `CAT_ICON_URL_FK` FOREIGN KEY (`icon_url`) REFERENCES `icons` (`icon_url`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `CUST_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD CONSTRAINT `CUST_CONTACT_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `ITEM_CATID_FK` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `ITEM_SUB_CATID_FK` FOREIGN KEY (`sub_cat_id`) REFERENCES `subcategories` (`sub_cat_id`);

--
-- Constraints for table `login_user_ip`
--
ALTER TABLE `login_user_ip`
  ADD CONSTRAINT `USERIP_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ORD_PROD_ITEMID_FK` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ORD_PROD_ORDID_FK` FOREIGN KEY (`order_id`) REFERENCES `orders_received` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders_received`
--
ALTER TABLE `orders_received`
  ADD CONSTRAINT `ORD_REC_ADDRID_FK` FOREIGN KEY (`address_id`) REFERENCES `customer_contact` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ORD_REC_CUSTID_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `ORD_PAY_ORDID_FK` FOREIGN KEY (`order_id`) REFERENCES `orders_received` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `STAFF_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `SUBCAT_PK` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
