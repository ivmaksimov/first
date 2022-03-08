-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2022 at 04:07 PM
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
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `midle_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `writen_books` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `fk_book_id`, `first_name`, `midle_name`, `last_name`, `country`, `birthday`, `writen_books`) VALUES
(1, 1, 'Michael', 'D.', 'Watkins', 'Canada', '1965-12-06', 11),
(2, 2, 'Napoleon', NULL, 'Hill', 'US', '1975-08-04', 36),
(3, 5, 'Sarah ', 'J.', 'Maas', 'NY US', '1986-03-05', 27),
(4, 6, 'Holly', NULL, 'Black', 'US', '1971-11-10', 38),
(5, 9, 'Ashley', 'Herring', 'Blake', 'US', '1983-04-03', 7);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `title` varchar(55) NOT NULL,
  `genre` varchar(55) NOT NULL,
  `chapters` varchar(55) NOT NULL,
  `date_of_buying` date NOT NULL,
  `start_reading` date NOT NULL,
  `end_reading` date DEFAULT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `fk_publishing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `fk_author_id`, `title`, `genre`, `chapters`, `date_of_buying`, `start_reading`, `end_reading`, `fk_publisher_id`, `fk_publishing_id`) VALUES
(1, 1, 'The First 90 Days', 'Education', '36', '2015-03-04', '2015-03-23', '2015-04-16', 1, 1),
(2, 2, 'Think and Grow Rich', 'Education', '25', '2017-03-09', '2017-03-23', '2017-05-17', 2, 2),
(3, 2, 'Law of Success', 'Self Help', '19', '2006-05-26', '2006-07-12', '2006-10-15', 3, 3),
(4, 1, 'Master Your Next Move', 'Business & Economics', '8', '2019-08-15', '2019-09-22', '2019-10-06', 1, 4),
(5, 3, 'Throne of Glass', 'Fantasy', '18', '2015-02-15', '2016-05-14', '2016-10-04', 4, 5),
(6, 4, 'The Cruel Prince', 'Fantasy - Romance', '21', '2019-12-25', '2020-02-12', '2020-05-09', 5, 6),
(7, 4, 'The Wicked King', 'Fantasy', '33', '2020-05-03', '2020-05-18', '2020-08-04', 5, 7),
(8, 4, 'The Queen of Nothing', 'Fantasy', '34', '2020-01-25', '2020-08-21', '2020-10-12', 6, 8),
(9, 5, 'Delilah Green Doesn\'t Care', 'Romance', '12', '2022-02-25', '2022-02-27', NULL, 7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publishing_house` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publishing_house`, `city`, `country`) VALUES
(1, 'Harvard Business Review Press', 'Boston', 'Massachusetts US'),
(2, 'CreateSpace Independent Publishing', 'Scots Valley', 'Califfornia'),
(3, 'High Roads Media', 'Johnson City', 'Tennessee US'),
(4, 'Bloomsbury', 'London', 'UK'),
(5, ' Little, Brown Books for Young Readers', 'New York City', 'US'),
(6, ' Little, Brown', 'London', 'UK'),
(7, 'Berkley', 'New York City', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `publishing`
--

CREATE TABLE `publishing` (
  `publishing_id` int(11) NOT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `publish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publishing`
--

INSERT INTO `publishing` (`publishing_id`, `fk_publisher_id`, `fk_book_id`, `fk_author_id`, `publish_date`) VALUES
(1, 1, 1, 1, '2013-05-14'),
(2, 2, 2, 2, '2012-05-31'),
(3, 3, 3, 2, '2004-07-26'),
(4, 1, 4, 1, '2019-02-06'),
(5, 4, 5, 3, '2012-08-02'),
(6, 5, 6, 4, '2018-01-02'),
(7, 5, 7, 4, '2019-01-08'),
(8, 6, 8, 4, '2019-11-19'),
(9, 7, 9, 5, '2022-02-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_publishing_id` (`fk_publishing_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `publishing`
--
ALTER TABLE `publishing`
  ADD PRIMARY KEY (`publishing_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_book_id` (`fk_book_id`),
  ADD KEY `fk_author_id` (`fk_author_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_publishing_id`) REFERENCES `publishing` (`publishing_id`);

--
-- Constraints for table `publishing`
--
ALTER TABLE `publishing`
  ADD CONSTRAINT `publishing_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `publishing_ibfk_2` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `publishing_ibfk_3` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
