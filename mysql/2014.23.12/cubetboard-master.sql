-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 23, 2014 at 12:42 AM
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

CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `log` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `action_id` int(50) NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=683 ;

--
-- Dumping data for table `activity`
--

REPLACE INTO `activity` (`id`, `user_id`, `log`, `type`, `action_id`, `link`, `timestamp`) VALUES
(635, 166, 'Repined a pin', 'repin', 369, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418282044_config.JPG', '2014-12-11 14:14:43'),
(636, 166, 'Liked a pin  ', 'like', 365, '', '2014-12-12 15:17:12'),
(637, 166, 'Following the board My collections', 'follow_board', 167, '', '2014-12-12 15:17:20'),
(638, 166, 'Added a new image', 'image', 372, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371348_Capture.JPG', '2014-12-12 15:17:48'),
(641, 166, 'Repined a pin', 'repin', 373, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1418371614_Chieftain-100-Tank.jpg', '2014-12-16 09:13:36'),
(642, 167, 'Following the board My collections', 'follow_board', 168, '', '2014-12-17 16:40:54'),
(643, 166, 'Following the board My collections', 'follow_board', 169, '', '2014-12-17 16:44:43'),
(644, 167, 'Liked a pin  ', 'like', 371, '', '2014-12-17 16:50:56'),
(655, 168, 'Liked a pin  ', 'like', 378, '', '2014-12-19 23:40:06'),
(656, 168, 'Liked a pin  ', 'like', 377, '', '2014-12-20 00:03:49'),
(657, 168, 'Liked a pin  ', 'like', 388, '', '2014-12-20 00:15:09'),
(646, 167, 'Following the board tank', 'follow_board', 174, '', '2014-12-17 16:51:32'),
(647, 166, 'Liked a pin  ', 'like', 375, '', '2014-12-18 14:03:58'),
(658, 168, 'Liked a pin  ', 'like', 389, '', '2014-12-20 00:17:03'),
(659, 168, 'Repined a pin', 'repin', 390, 'http://localhost:50/cubetboard-master/application/assets/pins/168/1419009423_Chrysanthemum.jpg', '2014-12-20 00:20:27'),
(649, 168, 'Repined a pin', 'repin', 379, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1418810052_car3.png', '2014-12-19 08:51:39'),
(660, 166, 'Repined a pin', 'repin', 391, 'http://localhost:50/cubetboard-master/application/assets/pins/168/1419009423_Chrysanthemum.jpg', '2014-12-20 00:21:07'),
(661, 166, 'Liked a pin  ', 'like', 392, '', '2014-12-20 00:21:37'),
(662, 166, 'Repined a pin', 'repin', 393, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', '2014-12-20 00:21:48'),
(663, 167, 'Repined a pin', 'repin', 394, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', '2014-12-20 00:22:13'),
(664, 167, 'Liked a pin  ', 'like', 395, '', '2014-12-20 00:26:24'),
(665, 167, 'Liked a pin  ', 'like', 396, '', '2014-12-20 00:26:40'),
(666, 167, 'Liked a pin  ', 'like', 397, '', '2014-12-20 00:26:51'),
(667, 167, 'Liked a pin  ', 'like', 398, '', '2014-12-20 00:27:03'),
(668, 167, 'Liked a pin  ', 'like', 399, '', '2014-12-20 00:28:06'),
(669, 167, 'Liked a pin  ', 'like', 400, '', '2014-12-20 00:28:18'),
(670, 166, 'Liked a pin  ', 'like', 401, '', '2014-12-20 00:41:23'),
(671, 166, 'Liked a pin  ', 'like', 402, '', '2014-12-20 00:41:57'),
(672, 166, 'Liked a pin  ', 'like', 403, '', '2014-12-20 00:42:11'),
(673, 166, 'Liked a pin  ', 'like', 404, '', '2014-12-20 00:42:21'),
(674, 166, 'Liked a pin  ', 'like', 405, '', '2014-12-20 00:42:48'),
(675, 167, 'Liked a pin  ', 'like', 401, '', '2014-12-20 01:14:23'),
(676, 166, 'Repined a pin', 'repin', 406, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010086_Penguins.jpg', '2014-12-20 01:32:00'),
(677, 166, 'Repined a pin', 'repin', 407, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010011_Koala.jpg', '2014-12-20 01:32:29'),
(678, 166, 'Repined a pin', 'repin', 408, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010000_Jellyfish.jpg', '2014-12-20 01:33:04'),
(679, 166, 'Repined a pin', 'repin', 409, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', '2014-12-20 01:33:25'),
(680, 166, 'Repined a pin', 'repin', 410, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419009984_Hydrangeas.jpg', '2014-12-20 01:34:02'),
(681, 166, 'Repined a pin', 'repin', 411, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010023_Lighthouse.jpg', '2014-12-20 01:35:44'),
(682, 166, 'Repined a pin', 'repin', 412, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010023_Lighthouse.jpg', '2014-12-20 01:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=187 ;

--
-- Dumping data for table `board`
--

REPLACE INTO `board` (`id`, `user_id`, `board_name`, `category`, `who_can_tag`, `collaborator`, `board_title`, `description`, `board_position`, `time_created`, `content`) VALUES
(167, 165, 'My collections', 'Agriculture', 'me', 'Name or Email Address', 'My collections', 'This is my collection', 0, '2012-10-18 06:24:39', ''),
(168, 166, 'The other man', 'coats', '', '', 'The other man', '', 1, '2014-12-20 21:29:00', ''),
(169, 167, 'vehicle', 'Agriculture', '', '', 'vehicle', '', 0, '2014-12-20 00:22:28', ''),
(170, 168, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-11 14:22:41', ''),
(171, 169, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-11 14:25:20', ''),
(172, 170, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-12 14:11:31', ''),
(173, 166, 'album hè', 'jeans', '', '', 'album hè', '', 3, '2014-12-20 16:13:18', ''),
(174, 166, 'tank', 'Agriculture', '', '', 'tank', '', 2, '2014-12-20 21:29:00', ''),
(175, 167, 'asdsa', 'Agriculture', '', '', 'asdsa', '', 1, '2014-12-17 16:54:59', ''),
(176, 166, 'animals', 'Agriculture', '', '', 'animals', '', 4, '2014-12-20 15:58:25', ''),
(177, 171, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:31:47', ''),
(178, 172, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:41:17', ''),
(179, 173, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:44:41', ''),
(180, 174, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:45:26', ''),
(181, 175, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:51:41', ''),
(182, 176, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 22:55:28', ''),
(183, 177, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 23:11:02', ''),
(184, 178, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 23:28:11', ''),
(185, 179, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 23:39:58', ''),
(186, 180, 'My collections', 'collection', 'me', 'Name or Email Address', 'My collections', '', 0, '2014-12-22 23:59:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

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
(365, 166, 369, 'kjasdhkjas'),
(367, 166, 373, 'asdsadasdsa'),
(368, 166, 375, 'asdsad'),
(369, 167, 375, 'test most comment'),
(371, 168, 375, 'giang 3 hoang 3');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `config`
--

REPLACE INTO `config` (`id`, `base_url`, `encryption_key`, `admin_email`, `facebook_app_id`, `facebook_app_key`, `facebook_app_secret`, `need_invite`, `tweet_consumer_key`, `tweet_consumer_secret`) VALUES
(2, 'http://localhost:50/cubetboard-master', 'abcd', 'gianghoangnc@gmail.com', '1531732880432370', '1', 'ef5e0c459822155d7f4e1e473026f09f', 0, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

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

CREATE TABLE IF NOT EXISTS `likes` (
  `pin_id` int(25) NOT NULL,
  `source_user_id` int(25) NOT NULL,
  `like_user_id` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

REPLACE INTO `likes` (`pin_id`, `source_user_id`, `like_user_id`) VALUES
(397, 167, 167),
(396, 167, 167),
(395, 167, 167),
(392, 166, 166),
(389, 168, 168),
(388, 168, 168),
(398, 167, 167),
(399, 167, 167),
(400, 167, 167),
(401, 166, 166),
(402, 166, 166),
(403, 166, 166),
(404, 166, 166),
(405, 166, 166),
(401, 166, 167);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

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
  `pin_position_in_board` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=413 ;

--
-- Dumping data for table `pins`
--

REPLACE INTO `pins` (`id`, `user_id`, `board_id`, `pin_url`, `source_url`, `type`, `gift`, `description`, `time`, `pin_position_in_board`) VALUES
(410, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419009984_Hydrangeas.jpg', '', 'image', 0, 'Hydrangeas.jpg', '2014-12-20 16:26:37', 1),
(409, 166, 176, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', '', 'image', 0, 'Desert.jpg', '2014-12-20 01:33:25', 0),
(408, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010000_Jellyfish.jpg', '', 'image', 0, 'Jellyfish.jpg\n', '2014-12-20 16:26:37', 2),
(406, 166, 176, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010086_Penguins.jpg', '', 'image', 0, 'Penguins.jpg', '2014-12-20 01:32:00', 0),
(407, 166, 176, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010011_Koala.jpg', '', 'image', 0, 'Koala.jpg', '2014-12-20 01:32:29', 0),
(404, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010941_10863966_726784100732051_5987779772996869444_o.jpg', '', 'image', 0, 'boots', '2014-12-20 16:26:37', 3),
(405, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010968_10862639_726366964107098_8042984875456043579_o.jpg', '', 'image', 0, 'áo da', '2014-12-20 16:26:37', 4),
(403, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010931_10818416_726784054065389_5289475695902048311_o.jpg', '', 'image', 0, 'shoes', '2014-12-20 16:26:37', 5),
(402, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010917_1780035_726784180732043_8018225441426306163_o.jpg', '', 'image', 0, 'bag', '2014-12-20 16:26:37', 6),
(401, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010883_1799068_726366960773765_2654138182684100448_o.jpg', 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419010883_1799068_726366960773765_2654138182684100448_o.jpg', 'image', 0, 'set, 200k', '2014-12-20 16:26:37', 7),
(399, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010086_Penguins.jpg', '', 'image', 0, 'Penguins.jpg', '2014-12-20 00:28:06', 0),
(400, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010098_Tulips.jpg', '', 'image', 0, 'Tulips.jpg', '2014-12-20 00:28:18', 0),
(398, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010023_Lighthouse.jpg', '', 'image', 0, 'Lighthouse.jpg', '2014-12-20 00:27:03', 0),
(397, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010011_Koala.jpg', '', 'image', 0, 'Koala.jpg', '2014-12-20 00:26:51', 0),
(395, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419009984_Hydrangeas.jpg', '', 'image', 0, 'Hydrangeas.jpg', '2014-12-20 00:26:24', 0),
(396, 167, 169, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010000_Jellyfish.jpg', '', 'image', 0, 'Jellyfish.jpg\r\n', '2014-12-20 00:26:40', 0),
(394, 167, 175, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', 'image', 0, 'Desert.jpg', '2014-12-20 00:22:55', 0),
(389, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/168/1419009423_Chrysanthemum.jpg', '', 'image', 0, 'Chrysanthemum.jpg', '2014-12-20 00:17:03', 0),
(390, 168, 170, 'http://localhost:50/cubetboard-master/application/assets/pins/168/1419009423_Chrysanthemum.jpg', '', 'image', 0, 'Chrysanthemum.jpg', '2014-12-20 00:20:27', 0),
(391, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/168/1419009423_Chrysanthemum.jpg', '', 'image', 0, 'Chrysanthemum.jpg', '2014-12-20 16:26:37', 8),
(392, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', 'image', 0, 'Desert.jpg', '2014-12-20 16:26:37', 9),
(393, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/166/1419009697_Desert.jpg', '', 'image', 0, 'Desert.jpg', '2014-12-20 16:26:37', 10),
(411, 166, 176, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010023_Lighthouse.jpg', '', 'image', 0, 'Lighthouse.jpg', '2014-12-20 01:35:44', 0),
(412, 166, 168, 'http://localhost:50/cubetboard-master/application/assets/pins/167/1419010023_Lighthouse.jpg', '', 'image', 0, 'Lighthouse.jpg', '2014-12-20 16:26:37', 11);

-- --------------------------------------------------------

--
-- Table structure for table `repin`
--

CREATE TABLE IF NOT EXISTS `repin` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `repin_user_id` int(25) NOT NULL,
  `owner_user_id` int(25) NOT NULL,
  `from_pin_id` int(25) NOT NULL,
  `new_pin_id` int(25) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=127 ;

--
-- Dumping data for table `repin`
--

REPLACE INTO `repin` (`id`, `repin_user_id`, `owner_user_id`, `from_pin_id`, `new_pin_id`, `timestamp`) VALUES
(116, 168, 168, 389, 390, '2014-12-20 00:20:27'),
(107, 166, 166, 368, 369, '2014-12-11 14:14:43'),
(108, 166, 166, 371, 373, '2014-12-16 09:13:36'),
(117, 166, 168, 389, 391, '2014-12-20 00:21:07'),
(118, 166, 166, 392, 393, '2014-12-20 00:21:48'),
(111, 168, 166, 376, 379, '2014-12-19 08:51:39'),
(119, 167, 166, 392, 394, '2014-12-20 00:22:13'),
(120, 166, 167, 399, 406, '2014-12-20 01:32:00'),
(121, 166, 167, 397, 407, '2014-12-20 01:32:29'),
(122, 166, 167, 396, 408, '2014-12-20 01:33:04'),
(123, 166, 166, 392, 409, '2014-12-20 01:33:25'),
(124, 166, 167, 395, 410, '2014-12-20 01:34:02'),
(125, 166, 167, 398, 411, '2014-12-20 01:35:44'),
(126, 166, 167, 398, 412, '2014-12-20 01:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `report_pins`
--

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

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `facebook_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `twitter_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `verification` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `connect_by` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notifications` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `twitter_post` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `facebook_post` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=181 ;

--
-- Dumping data for table `user`
--

REPLACE INTO `user` (`id`, `username`, `first_name`, `middle_name`, `last_name`, `facebook_id`, `twitter_id`, `password`, `email`, `status`, `verification`, `description`, `location`, `image`, `connect_by`, `time_created`, `time_updated`, `notifications`, `twitter_post`, `facebook_post`) VALUES
(165, '0', 'Web', '', 'Master', '', '', '3651d36e18102d2212db72a364b139b7', 'anoop@cubettech.com', 1, 'done', '', 'Cochin, Kerala', 'http://staging.cubettech.com/cubetboard/application/assets/images/YW5vb3BAY3ViZXR0ZWNoLmNvbQ==.png', 'normal', '2012-10-18 06:58:23', '0000-00-00 00:00:00', '', '0', '0'),
(166, '0', 'giang', '', 'hoang', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc@gmail.com', 1, 'done', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/Z2lhbmdob2FuZ25jQGdtYWlsLmNvbQ==.png', 'normal', '2014-12-12 15:13:26', '0000-00-00 00:00:00', '', '0', '0'),
(167, '0', 'giang 2', '', 'hoang 2', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc2@gmail.com', 1, 'done', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/Z2lhbmdob2FuZ25jMkBnbWFpbC5jb20=.jpeg', 'normal', '2014-12-20 00:31:51', '0000-00-00 00:00:00', '', '0', '0'),
(168, '0', 'giang 3', '', 'hoang 3', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc3@gmail.com', 1, 'done', '', '', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 16:43:30', '0000-00-00 00:00:00', '', '', ''),
(169, '0', 'giang 4', '', 'hoang 4', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc4@gmail.com', 1, 'done', '', '', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 16:43:44', '0000-00-00 00:00:00', '', '', ''),
(170, '0', 'giang', '', 'Vu', '', '', 'c15744ae2bc0bc800b17c7f6a7a89322', 'gianghoangnc5@gmail.com', 1, '12', '', 'Ha Noi', 'http://localhost:50/cubetboard-master/application/assets/images/User.png', 'normal', '2014-12-17 17:25:17', '0000-00-00 00:00:00', '', '', ''),
(180, '0', 'Vũ Hoàng Giang', '', '', '4974554898188', '', 'd41d8cd98f00b204e9800998ecf8427e', 'sushiboy_156@yahoo.com.vn', 1, 'done', '0', '0', 'https://graph.facebook.com/4974554898188/picture', 'facebook', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

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

