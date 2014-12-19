-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 19, 2014 at 01:32 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cubetboard-master`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL,
  `password` varchar(32) NOT NULL,
  `active` int(11) NOT NULL,
  `last_message` varchar(140) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `log` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `action_id` int(50) NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=655 ;

--
-- Dumping data for table `activity`
--

REPLACE INTO `activity` (`id`, `user_id`, `log`, `type`, `action_id`, `link`, `timestamp`) VALUES
(635, 166, 'Repined a pin', 'repin', 369, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418282044_config.JPG', '2014-12-11 14:14:43'),
(636, 166, 'Liked a pin  ', 'like', 365, '', '2014-12-12 15:17:12'),
(637, 166, 'Following the board My collections', 'follow_board', 167, '', '2014-12-12 15:17:20'),
(638, 166, 'Added a new image', 'image', 372, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371348_Capture.JPG', '2014-12-12 15:17:48'),
(639, 166, 'Liked a pin  ', 'like', 363, '', '2014-12-12 15:18:14'),
(640, 166, 'Un liked a pin  ', 'like', 363, '', '2014-12-15 16:10:20'),
(641, 166, 'Repined a pin', 'repin', 373, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', '2014-12-16 09:13:36'),
(642, 167, 'Following the board My collections', 'follow_board', 168, '', '2014-12-17 16:40:54'),
(643, 166, 'Following the board My collections', 'follow_board', 169, '', '2014-12-17 16:44:43'),
(644, 167, 'Liked a pin  ', 'like', 371, '', '2014-12-17 16:50:56'),
(645, 167, 'Repined a pin', 'repin', 374, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', '2014-12-17 16:51:27'),
(646, 167, 'Following the board tank', 'follow_board', 174, '', '2014-12-17 16:51:32'),
(647, 166, 'Liked a pin  ', 'like', 375, '', '2014-12-18 14:03:58'),
(648, 166, 'Repined a pin', 'repin', 376, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-18 14:04:11'),
(649, 168, 'Repined a pin', 'repin', 379, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:51:39'),
(650, 168, 'Repined a pin', 'repin', 380, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:53:41'),
(651, 168, 'Repined a pin', 'repin', 381, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:54:49'),
(652, 168, 'Repined a pin', 'repin', 382, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:54:58'),
(653, 168, 'Repined a pin', 'repin', 383, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:55:10'),
(654, 168, 'Liked a pin  ', 'like', 383, '', '2014-12-19 09:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `admin_users`
--

REPLACE INTO `admin_users` (`id`, `username`, `password`) VALUES
(4, 'root', 'c15744ae2bc0bc800b17c7f6a7a89322'),
(5, 'root@gmail.com', 'c15744ae2bc0bc800b17c7f6a7a89322');

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `board_name` varchar(25) NOT NULL,
  `category` varchar(50) NOT NULL,
  `who_can_tag` varchar(25) NOT NULL,
  `collaborator` text NOT NULL,
  `board_title` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `board_position` int(10) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=176 ;

--
-- Dumping data for table `board`
--

REPLACE INTO `board` (`id`, `user_id`, `board_name`, `category`, `who_can_tag`, `collaborator`, `board_title`, `description`, `board_position`, `time_created`, `content`) VALUES
(167, 165, 'My collections', 'Agriculture', 'me', 'Name or Email Address', 'My collections', 'This is my collection', 0, '2012-10-18 06:24:39', ''),
(168, 166, 'My collections', 'coats', '', '', 'My collections', '', 0, '2014-12-18 15:33:08', ''),
(169, 167, 'vehicle', 'vehicle', '', '', 'vehicle', '', 0, '2014-12-18 15:46:12', ''),
(170, 168, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-11 14:22:41', ''),
(171, 169, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-11 14:25:20', ''),
(172, 170, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-12 14:11:31', ''),
(173, 166, 'album hè', 'jeans', '', '', 'album hè', '', 1, '2014-12-17 16:59:10', ''),
(174, 166, 'tank', 'Agriculture', '', '', 'tank', '', 2, '2014-12-18 14:03:10', ''),
(175, 167, 'asdsa', 'Agriculture', '', '', 'asdsa', '', 1, '2014-12-17 16:54:59', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `pin_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `board_id` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `category`
--


-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
CREATE TABLE IF NOT EXISTS `category_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `field` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `category_list`
--

REPLACE INTO `category_list` (`id`, `field`, `name`) VALUES
(39, 'Agriculture', 'Agriculture'),
(40, 'jeans', 'jeans'),
(41, 'coats', 'coats'),
(42, 'vehicle', 'vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ci_sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `pin_id` int(25) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=372 ;

--
-- Dumping data for table `comments`
--

REPLACE INTO `comments` (`id`, `user_id`, `pin_id`, `comments`) VALUES
(364, 166, 368, 'wqewqewqewqe'),
(365, 166, 369, 'kjasdhkjas'),
(366, 166, 363, 'tao nhu len'),
(367, 166, 373, 'asdsadasdsa'),
(368, 166, 375, 'asdsad'),
(369, 167, 375, 'test most comment'),
(370, 167, 363, 'tao nhu shit'),
(371, 168, 375, 'giang 3 hoang 3');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `base_url` text COLLATE utf8_unicode_ci NOT NULL,
  `encryption_key` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_email` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_id` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_key` text COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_secret` text COLLATE utf8_unicode_ci NOT NULL,
  `need_invite` int(10) NOT NULL,
  `tweet_consumer_key` text COLLATE utf8_unicode_ci NOT NULL,
  `tweet_consumer_secret` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `config`
--


-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

DROP TABLE IF EXISTS `email_settings`;
CREATE TABLE IF NOT EXISTS `email_settings` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `all` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_pins` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comments` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `likes` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `repins` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `follows` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `digest` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `news` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `email_settings`
--


-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `is_following` int(25) NOT NULL,
  `is_following_board_id` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1135 ;

--
-- Dumping data for table `follow`
--

REPLACE INTO `follow` (`id`, `user_id`, `is_following`, `is_following_board_id`) VALUES
(1131, 166, 165, 167),
(1132, 167, 166, 168),
(1133, 166, 167, 169),
(1134, 167, 166, 174);

-- --------------------------------------------------------

--
-- Table structure for table `friends_list`
--

DROP TABLE IF EXISTS `friends_list`;
CREATE TABLE IF NOT EXISTS `friends_list` (
  `user_id` int(25) NOT NULL,
  `friend_id` int(25) NOT NULL,
  `connect_by` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends_list`
--


-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

DROP TABLE IF EXISTS `gift`;
CREATE TABLE IF NOT EXISTS `gift` (
  `pin_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `price` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gift`
--


-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `pin_id` int(25) NOT NULL,
  `source_user_id` int(25) NOT NULL,
  `like_user_id` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

REPLACE INTO `likes` (`pin_id`, `source_user_id`, `like_user_id`) VALUES
(365, 165, 166),
(371, 166, 167),
(375, 167, 166),
(383, 168, 168);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `login_attempts`
--


-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
CREATE TABLE IF NOT EXISTS `pins` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `board_id` int(25) NOT NULL,
  `pin_url` text NOT NULL,
  `source_url` text NOT NULL,
  `type` varchar(25) NOT NULL,
  `gift` int(75) NOT NULL,
  `description` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=384 ;

--
-- Dumping data for table `pins`
--

REPLACE INTO `pins` (`id`, `user_id`, `board_id`, `pin_url`, `source_url`, `type`, `gift`, `description`, `time`) VALUES
(363, 165, 167, 'http://staging.cubettech.com/cubetboard/application/assets/pins/165/1350540855_apple.png', '', 'image', 0, 'An expensive choice.', '2012-10-18 06:14:15'),
(364, 165, 167, 'http://staging.cubettech.com/cubetboard/application/assets/pins/165/1350540855_apple.png', '', 'image', 0, 'An expensive choice.', '2012-10-18 08:49:35'),
(365, 165, 167, 'http://staging.cubettech.com/cubetboard/application/assets/pins/165/1350552514_pineapple.jpg', '1', 'image', 7, 'Pine Apple', '2014-12-18 15:33:44'),
(366, 165, 167, 'http://staging.cubettech.com/cubetboard/application/assets/pins/165/1350558569_.jpeg', 'http://www.espnstar.com/home/football/', 'image', 0, 'Lance Armstrong', '2012-10-18 11:09:29'),
(367, 165, 167, 'http://staging.cubettech.com/cubetboard/application/assets/pins/165/1350562848_.jpeg', 'https://www.google.co.in/', 'image', 0, 'Google', '2012-10-18 12:20:48'),
(368, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418282044_config.JPG', '', 'image', 0, 'tesst', '2014-12-11 14:14:04'),
(369, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418282044_config.JPG', '', 'image', 0, 'tesst', '2014-12-11 14:14:43'),
(370, 166, 173, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371348_Capture.JPG', 'http://www.google.com/', 'image', 0, 'test', '2014-12-12 15:02:29'),
(371, 166, 174, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', 'http://www.yorkshireairmuseum.org/wp-content/uploads/2011/12/Chieftain-100-Tank.jpg', 'image', 0, 'tank', '2014-12-12 15:07:11'),
(372, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418372266_.jpeg', 'http://localhost:50/cubetboard-master/user/index/166', 'image', 0, 'giang hoang', '2014-12-12 15:17:48'),
(373, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', 'http://www.yorkshireairmuseum.org/wp-content/uploads/2011/12/Chieftain-100-Tank.jpg', 'image', 0, 'tank', '2014-12-16 09:13:36'),
(374, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', 'http://www.yorkshireairmuseum.org/wp-content/uploads/2011/12/Chieftain-100-Tank.jpg', 'image', 0, 'tank', '2014-12-17 16:51:27'),
(375, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-17 16:54:39'),
(376, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-18 14:04:11'),
(377, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418892709_photo.jpg', 'https://lh6.googleusercontent.com/-6TVOnxDSxSk/AAAAAAAAAAI/AAAAAAAAABc/LtJuheQDUUQ/photo.jpg', 'image', 0, '1198', '2014-12-18 15:51:50'),
(378, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418892763_photo.jpg', 'https://lh4.googleusercontent.com/-mgfCC3VJUNA/AAAAAAAAAAI/AAAAAAAAAAA/NX1IIc6JozY/photo.jpg', 'image', 0, '1098', '2014-12-18 15:52:44'),
(379, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-19 08:51:39'),
(380, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-19 08:53:41'),
(381, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-19 08:54:49'),
(382, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-19 08:54:58'),
(383, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', 'image', 0, 'car 3', '2014-12-19 08:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `repin`
--

DROP TABLE IF EXISTS `repin`;
CREATE TABLE IF NOT EXISTS `repin` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `repin_user_id` int(25) NOT NULL,
  `owner_user_id` int(25) NOT NULL,
  `from_pin_id` int(25) NOT NULL,
  `new_pin_id` int(25) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=116 ;

--
-- Dumping data for table `repin`
--

REPLACE INTO `repin` (`id`, `repin_user_id`, `owner_user_id`, `from_pin_id`, `new_pin_id`, `timestamp`) VALUES
(106, 165, 165, 363, 364, '2012-10-18 08:49:35'),
(107, 166, 166, 368, 369, '2014-12-11 14:14:43'),
(108, 166, 166, 371, 373, '2014-12-16 09:13:36'),
(109, 167, 166, 371, 374, '2014-12-17 16:51:27'),
(110, 166, 167, 375, 376, '2014-12-18 14:04:12'),
(111, 168, 166, 376, 379, '2014-12-19 08:51:39'),
(112, 168, 167, 375, 380, '2014-12-19 08:53:41'),
(113, 168, 168, 380, 381, '2014-12-19 08:54:49'),
(114, 168, 168, 381, 382, '2014-12-19 08:54:58'),
(115, 168, 168, 382, 383, '2014-12-19 08:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `report_pins`
--

DROP TABLE IF EXISTS `report_pins`;
CREATE TABLE IF NOT EXISTS `report_pins` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `pin_id` int(25) NOT NULL,
  `board_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `report_pins`
--


-- --------------------------------------------------------

--
-- Table structure for table `trend`
--

DROP TABLE IF EXISTS `trend`;
CREATE TABLE IF NOT EXISTS `trend` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `pin_id` int(25) NOT NULL,
  `level` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `trend`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `facebook_id` text NOT NULL,
  `twitter_id` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `status` int(11) NOT NULL,
  `verification` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(25) NOT NULL,
  `image` text NOT NULL,
  `connect_by` varchar(25) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notifications` varchar(25) NOT NULL,
  `twitter_post` varchar(25) NOT NULL,
  `facebook_post` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

--
-- Dumping data for table `user`
--

REPLACE INTO `user` (`id`, `username`, `first_name`, `middle_name`, `last_name`, `facebook_id`, `twitter_id`, `password`, `email`, `status`, `verification`, `description`, `location`, `image`, `connect_by`, `time_created`, `time_updated`, `notifications`, `twitter_post`, `facebook_post`) VALUES
(165, '0', 'Web', '', 'Master', '', '', '3651d36e18102d2212db72a364b139b7', 'anoop@cubettech.com', 1, 'done', '', 'Cochin, Kerala', 'http://staging.cubettech.com/cubetboard/application/assets/images/YW5vb3BAY3ViZXR0ZWNoLmNvbQ==.png', 'normal', '2012-10-18 06:58:23', '0000-00-00 00:00:00', '', '0', '0'),
(166, '0', 'giang', '', 'hoang', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc@gmail.com', 1, 'done', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/Z2lhbmdob2FuZ25jQGdtYWlsLmNvbQ==.png', 'normal', '2014-12-12 15:13:26', '0000-00-00 00:00:00', '', '0', '0'),
(167, '0', 'giang 2', '', 'hoang 2', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc2@gmail.com', 1, 'done', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/Z2lhbmdob2FuZ25jMkBnbWFpbC5jb20=.png', 'normal', '2014-12-18 15:25:28', '0000-00-00 00:00:00', '', '0', '0'),
(168, '0', 'giang 3', '', 'hoang 3', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc3@gmail.com', 1, 'done', '', '', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 16:43:30', '0000-00-00 00:00:00', '', '', ''),
(169, '0', 'giang 4', '', 'hoang 4', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc4@gmail.com', 1, 'done', '', '', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 16:43:44', '0000-00-00 00:00:00', '', '', ''),
(170, '0', 'giang', '', 'Vu', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc5@gmail.com', 1, '12', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 17:25:17', '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` text COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_autologin`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `twitter_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gfc_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_profiles`
--

