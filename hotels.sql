-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2015 at 09:13 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotels`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_navigation`
--

CREATE TABLE IF NOT EXISTS `backend_navigation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_for` text COLLATE utf8_unicode_ci,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `backend_navigation`
--

INSERT INTO `backend_navigation` (`id`, `parent_id`, `label`, `url`, `selected_for`, `sequence`) VALUES
(1, 0, 'Dashboard', 'dashboard/index', NULL, 1),
(2, 0, 'Modules', '', NULL, 3),
(3, 0, 'Settings', '', NULL, 999),
(4, 3, 'Translations', 'locale/index', 'a:4:{i:0;s:10:"locale/add";i:1;s:11:"locale/edit";i:2;s:13:"locale/import";i:3;s:14:"locale/analyse";}', 4),
(5, 3, 'General', 'settings/index', NULL, 1),
(6, 3, 'Advanced', '', NULL, 2),
(7, 6, 'Email', 'settings/email', NULL, 1),
(8, 6, 'SEO', 'settings/seo', NULL, 2),
(9, 3, 'Modules', '', NULL, 6),
(10, 3, 'Themes', '', NULL, 7),
(11, 3, 'Users', 'users/index', 'a:2:{i:0;s:9:"users/add";i:1;s:10:"users/edit";}', 4),
(12, 3, 'Groups', 'groups/index', 'a:2:{i:0;s:10:"groups/add";i:1;s:11:"groups/edit";}', 5),
(13, 9, 'Overview', 'extensions/modules', 'a:2:{i:0;s:24:"extensions/detail_module";i:1;s:24:"extensions/upload_module";}', 1),
(14, 10, 'ThemesSelection', 'extensions/themes', 'a:2:{i:0;s:23:"extensions/upload_theme";i:1;s:23:"extensions/detail_theme";}', 1),
(15, 10, 'Templates', 'extensions/theme_templates', 'a:2:{i:0;s:29:"extensions/add_theme_template";i:1;s:30:"extensions/edit_theme_template";}', 2),
(16, 0, 'Pages', 'pages/index', 'a:2:{i:0;s:9:"pages/add";i:1;s:10:"pages/edit";}', 2),
(17, 9, 'Pages', 'pages/settings', NULL, 2),
(18, 2, 'Search', '', NULL, 1),
(19, 18, 'Statistics', 'search/statistics', NULL, 1),
(20, 18, 'Synonyms', 'search/synonyms', 'a:2:{i:0;s:18:"search/add_synonym";i:1;s:19:"search/edit_synonym";}', 2),
(21, 9, 'Search', 'search/settings', NULL, 3),
(22, 2, 'ContentBlocks', 'content_blocks/index', 'a:2:{i:0;s:18:"content_blocks/add";i:1;s:19:"content_blocks/edit";}', 2),
(23, 2, 'Tags', 'tags/index', 'a:1:{i:0;s:9:"tags/edit";}', 3),
(24, 2, 'Blog', '', NULL, 4),
(25, 24, 'Articles', 'blog/index', 'a:3:{i:0;s:8:"blog/add";i:1;s:9:"blog/edit";i:2;s:21:"blog/import_wordpress";}', 1),
(26, 24, 'Comments', 'blog/comments', 'a:1:{i:0;s:17:"blog/edit_comment";}', 2),
(27, 24, 'Categories', 'blog/categories', 'a:2:{i:0;s:17:"blog/add_category";i:1;s:18:"blog/edit_category";}', 3),
(28, 9, 'Blog', 'blog/settings', NULL, 4),
(29, 2, 'Profiles', '', NULL, 5),
(30, 29, 'Overview', 'profiles/index', 'a:5:{i:0;s:12:"profiles/add";i:1;s:13:"profiles/edit";i:2;s:26:"profiles/add_profile_group";i:3;s:27:"profiles/edit_profile_group";i:4;s:15:"profiles/import";}', 1),
(31, 29, 'Groups', 'profiles/groups', 'a:2:{i:0;s:18:"profiles/add_group";i:1;s:19:"profiles/edit_group";}', 2),
(32, 0, 'Hotels', '', NULL, 6),
(33, 32, 'Hotels', 'hotels/index', 'a:4:{i:0;s:10:"hotels/add";i:1;s:11:"hotels/edit";i:2;s:15:"hotels/room_add";i:3;s:16:"hotels/room_edit";}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `meta_id`, `language`, `title`) VALUES
(1, 7, 'en', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE IF NOT EXISTS `blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` text COLLATE utf8_unicode_ci,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('comment','trackback') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'comment',
  `status` enum('published','moderation','spam') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'moderation',
  `data` text COLLATE utf8_unicode_ci COMMENT 'Serialized array with extra data',
  PRIMARY KEY (`id`),
  KEY `idx_post_id_status` (`post_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` int(11) NOT NULL COMMENT 'The real post id',
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meta_id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `text` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','archived','draft') COLLATE utf8_unicode_ci NOT NULL,
  `publish_on` datetime NOT NULL,
  `created_on` datetime NOT NULL,
  `edited_on` datetime NOT NULL,
  `hidden` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `allow_comments` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `num_comments` int(11) NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `idx_status_language_hidden` (`status`,`language`,`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_blocks`
--

CREATE TABLE IF NOT EXISTS `content_blocks` (
  `id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `extra_id` int(11) NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.tpl',
  `language` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `hidden` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `status` enum('active','archived') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_on` datetime NOT NULL,
  `edited_on` datetime NOT NULL,
  PRIMARY KEY (`revision_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8_unicode_ci COMMENT 'serialized array containing default user module/action rights',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `parameters`) VALUES
(1, 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_rights_actions`
--

CREATE TABLE IF NOT EXISTS `groups_rights_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the module',
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the action',
  `level` double NOT NULL DEFAULT '1' COMMENT 'unix type levels 1, 3, 5 and 7',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=93 ;

--
-- Dumping data for table `groups_rights_actions`
--

INSERT INTO `groups_rights_actions` (`id`, `group_id`, `module`, `action`, `level`) VALUES
(1, 1, 'Dashboard', 'Index', 7),
(2, 1, 'Dashboard', 'AlterSequence', 7),
(3, 1, 'Locale', 'Add', 7),
(4, 1, 'Locale', 'Analyse', 7),
(5, 1, 'Locale', 'Edit', 7),
(6, 1, 'Locale', 'ExportAnalyse', 7),
(7, 1, 'Locale', 'Index', 7),
(8, 1, 'Locale', 'SaveTranslation', 7),
(9, 1, 'Locale', 'Export', 7),
(10, 1, 'Locale', 'Import', 7),
(11, 1, 'Locale', 'Delete', 7),
(12, 1, 'Settings', 'Index', 7),
(13, 1, 'Settings', 'Email', 7),
(14, 1, 'Settings', 'Seo', 7),
(15, 1, 'Settings', 'TestEmailConnection', 7),
(16, 1, 'Users', 'Add', 7),
(17, 1, 'Users', 'Delete', 7),
(18, 1, 'Users', 'Edit', 7),
(19, 1, 'Users', 'Index', 7),
(20, 1, 'Users', 'UndoDelete', 7),
(21, 1, 'Groups', 'Index', 7),
(22, 1, 'Groups', 'Add', 7),
(23, 1, 'Groups', 'Edit', 7),
(24, 1, 'Groups', 'Delete', 7),
(25, 1, 'Extensions', 'Modules', 7),
(26, 1, 'Extensions', 'DetailModule', 7),
(27, 1, 'Extensions', 'InstallModule', 7),
(28, 1, 'Extensions', 'UploadModule', 7),
(29, 1, 'Extensions', 'Themes', 7),
(30, 1, 'Extensions', 'DetailTheme', 7),
(31, 1, 'Extensions', 'InstallTheme', 7),
(32, 1, 'Extensions', 'UploadTheme', 7),
(33, 1, 'Extensions', 'ThemeTemplates', 7),
(34, 1, 'Extensions', 'AddThemeTemplate', 7),
(35, 1, 'Extensions', 'EditThemeTemplate', 7),
(36, 1, 'Extensions', 'DeleteThemeTemplate', 7),
(37, 1, 'Pages', 'GetInfo', 7),
(38, 1, 'Pages', 'Move', 7),
(39, 1, 'Pages', 'Index', 7),
(40, 1, 'Pages', 'Add', 7),
(41, 1, 'Pages', 'Delete', 7),
(42, 1, 'Pages', 'Edit', 7),
(43, 1, 'Pages', 'Settings', 7),
(44, 1, 'Search', 'AddSynonym', 7),
(45, 1, 'Search', 'EditSynonym', 7),
(46, 1, 'Search', 'DeleteSynonym', 7),
(47, 1, 'Search', 'Settings', 7),
(48, 1, 'Search', 'Statistics', 7),
(49, 1, 'Search', 'Synonyms', 7),
(50, 1, 'ContentBlocks', 'Add', 7),
(51, 1, 'ContentBlocks', 'Delete', 7),
(52, 1, 'ContentBlocks', 'Edit', 7),
(53, 1, 'ContentBlocks', 'Index', 7),
(54, 1, 'Tags', 'Autocomplete', 7),
(55, 1, 'Tags', 'Edit', 7),
(56, 1, 'Tags', 'Index', 7),
(57, 1, 'Tags', 'MassAction', 7),
(58, 1, 'Blog', 'AddCategory', 7),
(59, 1, 'Blog', 'Add', 7),
(60, 1, 'Blog', 'Categories', 7),
(61, 1, 'Blog', 'Comments', 7),
(62, 1, 'Blog', 'DeleteCategory', 7),
(63, 1, 'Blog', 'DeleteSpam', 7),
(64, 1, 'Blog', 'Delete', 7),
(65, 1, 'Blog', 'EditCategory', 7),
(66, 1, 'Blog', 'EditComment', 7),
(67, 1, 'Blog', 'Edit', 7),
(68, 1, 'Blog', 'ImportWordpress', 7),
(69, 1, 'Blog', 'Index', 7),
(70, 1, 'Blog', 'MassCommentAction', 7),
(71, 1, 'Blog', 'Settings', 7),
(72, 1, 'Profiles', 'Add', 7),
(73, 1, 'Profiles', 'AddGroup', 7),
(74, 1, 'Profiles', 'AddProfileGroup', 7),
(75, 1, 'Profiles', 'Block', 7),
(76, 1, 'Profiles', 'DeleteGroup', 7),
(77, 1, 'Profiles', 'DeleteProfileGroup', 7),
(78, 1, 'Profiles', 'Delete', 7),
(79, 1, 'Profiles', 'EditGroup', 7),
(80, 1, 'Profiles', 'EditProfileGroup', 7),
(81, 1, 'Profiles', 'Edit', 7),
(82, 1, 'Profiles', 'ExportTemplate', 7),
(83, 1, 'Profiles', 'Groups', 7),
(84, 1, 'Profiles', 'Import', 7),
(85, 1, 'Profiles', 'Index', 7),
(86, 1, 'Profiles', 'MassAction', 7),
(87, 1, 'Hotels', 'Add', 7),
(88, 1, 'Hotels', 'Edit', 7),
(89, 1, 'Hotels', 'Delete', 7),
(90, 1, 'Hotels', 'RoomAdd', 7),
(91, 1, 'Hotels', 'RoomEdit', 7),
(92, 1, 'Hotels', 'RoomDelete', 7);

-- --------------------------------------------------------

--
-- Table structure for table `groups_rights_modules`
--

CREATE TABLE IF NOT EXISTS `groups_rights_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the module',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `groups_rights_modules`
--

INSERT INTO `groups_rights_modules` (`id`, `group_id`, `module`) VALUES
(1, 1, 'Dashboard'),
(2, 1, 'Locale'),
(3, 1, 'Settings'),
(4, 1, 'Users'),
(5, 1, 'Groups'),
(6, 1, 'Extensions'),
(7, 1, 'Pages'),
(8, 1, 'Search'),
(9, 1, 'ContentBlocks'),
(10, 1, 'Tags'),
(11, 1, 'Blog'),
(12, 1, 'Profiles'),
(13, 1, 'Hotels'),
(14, 1, 'Bookings');

-- --------------------------------------------------------

--
-- Table structure for table `groups_settings`
--

CREATE TABLE IF NOT EXISTS `groups_settings` (
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the setting',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'serialized value',
  PRIMARY KEY (`group_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups_settings`
--

INSERT INTO `groups_settings` (`group_id`, `name`, `value`) VALUES
(1, 'dashboard_sequence', 'a:3:{s:8:"Settings";a:1:{s:7:"Analyse";a:4:{s:6:"column";s:4:"left";s:8:"position";i:1;s:6:"hidden";b:0;s:7:"present";b:1;}}s:5:"Users";a:1:{s:10:"Statistics";a:4:{s:6:"column";s:4:"left";s:8:"position";i:2;s:6:"hidden";b:0;s:7:"present";b:1;}}s:4:"Blog";a:1:{s:8:"Comments";a:4:{s:6:"column";s:5:"right";s:8:"position";i:1;s:6:"hidden";b:0;s:7:"present";b:1;}}}');

-- --------------------------------------------------------

--
-- Table structure for table `hooks_queue`
--

CREATE TABLE IF NOT EXISTS `hooks_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `callback` text COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `status` enum('busy','error','queued') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queued',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hooks_subscriptions`
--

CREATE TABLE IF NOT EXISTS `hooks_subscriptions` (
  `event_module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `callback` text COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  UNIQUE KEY `event_module` (`event_module`(100),`event_name`(100),`module`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `title`, `image`, `country`, `city`) VALUES
(1, 'Tonyresort', 'download(6).jpg', 'Lithuania', 'Vilnius'),
(3, 'Kaunas', '36207618.jpg', 'Lithuania', 'Kaunas'),
(4, 'Gaia Village', '211050_xl.jpg', NULL, NULL),
(5, 'Europa Royale', 'big_4ac32e645761a.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotels_rooms`
--

CREATE TABLE IF NOT EXISTS `hotels_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capacity` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hotels_rooms`
--

INSERT INTO `hotels_rooms` (`id`, `capacity`, `title`, `price`, `hotel_id`, `image`, `count`) VALUES
(2, 2, 'Vip', 180, 1, 'vip_ton.jpg', 2),
(3, 2, 'Standart', 100, 1, 'standart_ton.jpg', 6),
(4, 4, 'Family', 200, 1, 'family_ton.jpg', 4),
(5, 2, 'Standart', 50, 3, 'Standard-room.jpg', 10),
(6, 3, 'Delux', 80, 3, 'Delux-room-10-.jpg', 8),
(7, 2, 'Suite', 120, 3, 'Suite-2-.jpg', 6),
(8, 2, 'Executive suite', 160, 3, 'Executive-suite-2-.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `hotels_rooms_bookings`
--

CREATE TABLE IF NOT EXISTS `hotels_rooms_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `room_id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `room_number` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `hotels_rooms_bookings`
--

INSERT INTO `hotels_rooms_bookings` (`id`, `start`, `end`, `room_id`, `client_name`, `client_email`, `room_number`, `date`) VALUES
(17, '2015-10-01', '2015-12-11', 3, 'Andrius Sciukas', 'andrius.eagle@gmail.com', 0, '2015-10-01 20:23:45'),
(18, '2015-10-01', '2015-10-31', 3, 'John Smith', 'email@emails.com', 0, '2015-10-01 20:25:03'),
(19, '2015-10-01', '2015-10-29', 2, 'Harry Potter', 'harry@gmail.com', 0, '2015-10-01 20:30:37'),
(20, '2015-10-01', '2015-10-28', 2, 'Harvy Spencez', 'emailas@mailas.com', 0, '2015-10-01 20:31:21'),
(21, '2015-10-07', '2015-10-19', 3, 'adasdsa', 'andrius@mediainovacijos.lt', 0, '2015-10-02 08:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `locale`
--

CREATE TABLE IF NOT EXISTS `locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `application` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('act','err','lbl','msg') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'lbl',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `edited_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`application`(20),`module`(20),`type`,`name`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1111 ;

--
-- Dumping data for table `locale`
--

INSERT INTO `locale` (`id`, `user_id`, `language`, `application`, `module`, `type`, `name`, `value`, `edited_on`) VALUES
(1, 1, 'en', 'Backend', 'Locale', 'lbl', 'Actions', 'actions', '2015-09-25 08:02:40'),
(2, 1, 'en', 'Backend', 'Locale', 'lbl', 'Add', 'add translation', '2015-09-25 08:02:40'),
(3, 1, 'en', 'Backend', 'Locale', 'lbl', 'Copy', 'copy', '2015-09-25 08:02:40'),
(4, 1, 'en', 'Backend', 'Locale', 'lbl', 'Edited', 'edited', '2015-09-25 08:02:40'),
(5, 1, 'en', 'Backend', 'Locale', 'lbl', 'EN', 'english', '2015-09-25 08:02:40'),
(6, 1, 'en', 'Backend', 'Locale', 'lbl', 'Errors', 'errors', '2015-09-25 08:02:40'),
(7, 1, 'en', 'Backend', 'Locale', 'lbl', 'FR', 'french', '2015-09-25 08:02:40'),
(8, 1, 'en', 'Backend', 'Locale', 'lbl', 'Labels', 'labels', '2015-09-25 08:02:40'),
(9, 1, 'en', 'Backend', 'Locale', 'lbl', 'Messages', 'messages', '2015-09-25 08:02:40'),
(10, 1, 'en', 'Backend', 'Locale', 'lbl', 'NL', 'dutch', '2015-09-25 08:02:40'),
(11, 1, 'en', 'Backend', 'Locale', 'lbl', 'Types', 'types', '2015-09-25 08:02:40'),
(12, 1, 'en', 'Backend', 'Locale', 'msg', 'Added', 'The translation "%1$s" was added.', '2015-09-25 08:02:40'),
(13, 1, 'en', 'Backend', 'Locale', 'msg', 'ConfirmDelete', 'Are you sure you want to delete this translation?', '2015-09-25 08:02:40'),
(14, 1, 'en', 'Backend', 'Locale', 'msg', 'Deleted', 'The translation "%1$s" was deleted.', '2015-09-25 08:02:40'),
(15, 1, 'en', 'Backend', 'Locale', 'msg', 'Edited', 'The translation "%1$s" was saved.', '2015-09-25 08:02:40'),
(16, 1, 'en', 'Backend', 'Locale', 'msg', 'EditTranslation', 'edit translation "%1$s"', '2015-09-25 08:02:40'),
(17, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpActionValue', 'Only use alphanumeric characters (no capitals), - and _ for these translations, because they will be used in URLs.', '2015-09-25 08:02:40'),
(18, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpAddName', 'The English reference for the translation', '2015-09-25 08:02:40'),
(19, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpAddValue', 'The translation', '2015-09-25 08:02:40'),
(20, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpDateField', 'eg. 20/06/2011', '2015-09-25 08:02:40'),
(21, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpEditName', 'The English reference for the translation', '2015-09-25 08:02:40'),
(22, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpEditValue', 'The translation', '2015-09-25 08:02:40'),
(23, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpImageField', 'Only jp(e)g, gif or png-files are allowed.', '2015-09-25 08:02:40'),
(24, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpName', 'The english reference for this translation', '2015-09-25 08:02:40'),
(25, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpTimeField', 'eg. 14:35', '2015-09-25 08:02:40'),
(26, 1, 'en', 'Backend', 'Locale', 'msg', 'HelpValue', 'The translation', '2015-09-25 08:02:40'),
(27, 1, 'en', 'Backend', 'Locale', 'msg', 'Imported', '%1$s translations were imported.', '2015-09-25 08:02:40'),
(28, 1, 'en', 'Backend', 'Locale', 'msg', 'NoItems', 'There are no translations yet. <a href="%1$s">Add the first translation</a>.', '2015-09-25 08:02:40'),
(29, 1, 'en', 'Backend', 'Locale', 'msg', 'NoItemsAnalyse', 'No missing translations were found.', '2015-09-25 08:02:40'),
(30, 1, 'en', 'Backend', 'Locale', 'msg', 'NoItemsFilter', 'There are no translations yet for this filter. <a href="%1$s">Add the first translation</a>.', '2015-09-25 08:02:40'),
(31, 1, 'en', 'Backend', 'Locale', 'msg', 'OverwriteConflicts', 'Overwrite if the translation exists.', '2015-09-25 08:02:40'),
(32, 1, 'en', 'Backend', 'Locale', 'err', 'AlreadyExists', 'This translation already exists.', '2015-09-25 08:02:40'),
(33, 1, 'en', 'Backend', 'Locale', 'err', 'InvalidActionValue', 'The action name contains invalid characters.', '2015-09-25 08:02:40'),
(34, 1, 'en', 'Backend', 'Locale', 'err', 'InvalidXML', 'This is an invalid XML-file.', '2015-09-25 08:02:40'),
(35, 1, 'en', 'Backend', 'Locale', 'err', 'ModuleHasToBeCore', 'The module needs to be core for frontend translations.', '2015-09-25 08:02:40'),
(36, 1, 'en', 'Backend', 'Locale', 'err', 'NoSelection', 'No translations were selected.', '2015-09-25 08:02:40'),
(37, 1, 'en', 'Frontend', 'Core', 'lbl', 'AboutUs', 'about us', '2015-09-25 08:02:40'),
(38, 1, 'en', 'Frontend', 'Core', 'lbl', 'Advertisement', 'advertisement', '2015-09-25 08:02:40'),
(39, 1, 'en', 'Frontend', 'Core', 'lbl', 'Archive', 'archive', '2015-09-25 08:02:40'),
(40, 1, 'en', 'Frontend', 'Core', 'lbl', 'Archives', 'archives', '2015-09-25 08:02:40'),
(41, 1, 'en', 'Frontend', 'Core', 'lbl', 'ArticlesInCategory', 'articles in category', '2015-09-25 08:02:40'),
(42, 1, 'en', 'Frontend', 'Core', 'lbl', 'Avatar', 'avatar', '2015-09-25 08:02:40'),
(43, 1, 'en', 'Frontend', 'Core', 'lbl', 'BirthDate', 'birth date', '2015-09-25 08:02:40'),
(44, 1, 'en', 'Frontend', 'Core', 'lbl', 'Blog', 'blog', '2015-09-25 08:02:40'),
(45, 1, 'en', 'Frontend', 'Core', 'lbl', 'BlogArchive', 'blog archive', '2015-09-25 08:02:40'),
(46, 1, 'en', 'Frontend', 'Core', 'lbl', 'Breadcrumb', 'breadcrumb', '2015-09-25 08:02:40'),
(47, 1, 'en', 'Frontend', 'Core', 'lbl', 'By', 'by', '2015-09-25 08:02:40'),
(48, 1, 'en', 'Frontend', 'Core', 'lbl', 'Categories', 'categories', '2015-09-25 08:02:40'),
(49, 1, 'en', 'Frontend', 'Core', 'lbl', 'Category', 'category', '2015-09-25 08:02:40'),
(50, 1, 'en', 'Frontend', 'Core', 'lbl', 'City', 'city', '2015-09-25 08:02:40'),
(51, 1, 'en', 'Frontend', 'Core', 'lbl', 'Close', 'close', '2015-09-25 08:02:40'),
(52, 1, 'en', 'Frontend', 'Core', 'lbl', 'Comment', 'comment', '2015-09-25 08:02:40'),
(53, 1, 'en', 'Frontend', 'Core', 'lbl', 'CommentedOn', 'commented on', '2015-09-25 08:02:40'),
(54, 1, 'en', 'Frontend', 'Core', 'lbl', 'Comments', 'comments', '2015-09-25 08:02:40'),
(55, 1, 'en', 'Frontend', 'Core', 'lbl', 'Contact', 'contact', '2015-09-25 08:02:40'),
(56, 1, 'en', 'Frontend', 'Core', 'lbl', 'Content', 'content', '2015-09-25 08:02:40'),
(57, 1, 'en', 'Frontend', 'Core', 'lbl', 'Country', 'country', '2015-09-25 08:02:40'),
(58, 1, 'en', 'Frontend', 'Core', 'lbl', 'Date', 'date', '2015-09-25 08:02:40'),
(59, 1, 'en', 'Frontend', 'Core', 'lbl', 'Disclaimer', 'disclaimer', '2015-09-25 08:02:40'),
(60, 1, 'en', 'Frontend', 'Core', 'lbl', 'DisplayName', 'display name', '2015-09-25 08:02:40'),
(61, 1, 'en', 'Frontend', 'Core', 'lbl', 'Email', 'e-mail', '2015-09-25 08:02:40'),
(62, 1, 'en', 'Frontend', 'Core', 'lbl', 'EN', 'English', '2015-09-25 08:02:40'),
(63, 1, 'en', 'Frontend', 'Core', 'lbl', 'EnableJavascript', 'enable javascript', '2015-09-25 08:02:40'),
(64, 1, 'en', 'Frontend', 'Core', 'lbl', 'Faq', 'FAQ', '2015-09-25 08:02:40'),
(65, 1, 'en', 'Frontend', 'Core', 'lbl', 'Feedback', 'feedback', '2015-09-25 08:02:40'),
(66, 1, 'en', 'Frontend', 'Core', 'lbl', 'Female', 'female', '2015-09-25 08:02:40'),
(67, 1, 'en', 'Frontend', 'Core', 'lbl', 'FirstName', 'first name', '2015-09-25 08:02:40'),
(68, 1, 'en', 'Frontend', 'Core', 'lbl', 'FooterNavigation', 'footer navigation', '2015-09-25 08:02:40'),
(69, 1, 'en', 'Frontend', 'Core', 'lbl', 'FR', 'French', '2015-09-25 08:02:40'),
(70, 1, 'en', 'Frontend', 'Core', 'lbl', 'Gender', 'gender', '2015-09-25 08:02:40'),
(71, 1, 'en', 'Frontend', 'Core', 'lbl', 'GoTo', 'go to', '2015-09-25 08:02:40'),
(72, 1, 'en', 'Frontend', 'Core', 'lbl', 'GoToPage', 'go to page', '2015-09-25 08:02:40'),
(73, 1, 'en', 'Frontend', 'Core', 'lbl', 'History', 'history', '2015-09-25 08:02:40'),
(74, 1, 'en', 'Frontend', 'Core', 'lbl', 'IAgree', 'I agree', '2015-09-25 08:02:40'),
(75, 1, 'en', 'Frontend', 'Core', 'lbl', 'IDisagree', 'I disagree', '2015-09-25 08:02:40'),
(76, 1, 'en', 'Frontend', 'Core', 'lbl', 'In', 'in', '2015-09-25 08:02:40'),
(77, 1, 'en', 'Frontend', 'Core', 'lbl', 'InTheCategory', 'in category', '2015-09-25 08:02:40'),
(78, 1, 'en', 'Frontend', 'Core', 'lbl', 'ItemsWithTag', 'items with tag "%1$s"', '2015-09-25 08:02:40'),
(79, 1, 'en', 'Frontend', 'Core', 'lbl', 'Language', 'language', '2015-09-25 08:02:40'),
(80, 1, 'en', 'Frontend', 'Core', 'lbl', 'LastName', 'last name', '2015-09-25 08:02:40'),
(81, 1, 'en', 'Frontend', 'Core', 'lbl', 'Location', 'location', '2015-09-25 08:02:40'),
(82, 1, 'en', 'Frontend', 'Core', 'lbl', 'Login', 'login', '2015-09-25 08:02:40'),
(83, 1, 'en', 'Frontend', 'Core', 'lbl', 'Logout', 'logout', '2015-09-25 08:02:40'),
(84, 1, 'en', 'Frontend', 'Core', 'lbl', 'MainNavigation', 'main navigation', '2015-09-25 08:02:40'),
(85, 1, 'en', 'Frontend', 'Core', 'lbl', 'Male', 'male', '2015-09-25 08:02:40'),
(86, 1, 'en', 'Frontend', 'Core', 'lbl', 'Message', 'message', '2015-09-25 08:02:40'),
(87, 1, 'en', 'Frontend', 'Core', 'lbl', 'More', 'more', '2015-09-25 08:02:40'),
(88, 1, 'en', 'Frontend', 'Core', 'lbl', 'MostReadQuestions', 'Most read questions', '2015-09-25 08:02:40'),
(89, 1, 'en', 'Frontend', 'Core', 'lbl', 'Name', 'name', '2015-09-25 08:02:40'),
(90, 1, 'en', 'Frontend', 'Core', 'lbl', 'NewPassword', 'new password', '2015-09-25 08:02:40'),
(91, 1, 'en', 'Frontend', 'Core', 'lbl', 'VerifyNewPassword', 'verify new password', '2015-09-25 08:02:40'),
(92, 1, 'en', 'Frontend', 'Core', 'err', 'PasswordsDontMatch', 'The passwords differ', '2015-09-25 08:02:40'),
(93, 1, 'en', 'Frontend', 'Core', 'lbl', 'Next', 'next', '2015-09-25 08:02:40'),
(94, 1, 'en', 'Frontend', 'Core', 'lbl', 'NextArticle', 'next article', '2015-09-25 08:02:40'),
(95, 1, 'en', 'Frontend', 'Core', 'lbl', 'NextPage', 'next page', '2015-09-25 08:02:40'),
(96, 1, 'en', 'Frontend', 'Core', 'lbl', 'NL', 'Dutch', '2015-09-25 08:02:40'),
(97, 1, 'en', 'Frontend', 'Core', 'lbl', 'No', 'no', '2015-09-25 08:02:40'),
(98, 1, 'en', 'Frontend', 'Core', 'lbl', 'OldPassword', 'old password', '2015-09-25 08:02:40'),
(99, 1, 'en', 'Frontend', 'Core', 'lbl', 'On', 'on', '2015-09-25 08:02:40'),
(100, 1, 'en', 'Frontend', 'Core', 'lbl', 'Or', 'or', '2015-09-25 08:02:40'),
(101, 1, 'en', 'Frontend', 'Core', 'lbl', 'Pages', 'pages', '2015-09-25 08:02:40'),
(102, 1, 'en', 'Frontend', 'Core', 'lbl', 'Parent', 'parent', '2015-09-25 08:02:40'),
(103, 1, 'en', 'Frontend', 'Core', 'lbl', 'ParentPage', 'parent page', '2015-09-25 08:02:40'),
(104, 1, 'en', 'Frontend', 'Core', 'lbl', 'Password', 'password', '2015-09-25 08:02:40'),
(105, 1, 'en', 'Frontend', 'Core', 'lbl', 'Previous', 'previous', '2015-09-25 08:02:40'),
(106, 1, 'en', 'Frontend', 'Core', 'lbl', 'PreviousArticle', 'previous article', '2015-09-25 08:02:40'),
(107, 1, 'en', 'Frontend', 'Core', 'lbl', 'PreviousPage', 'previous page', '2015-09-25 08:02:40'),
(108, 1, 'en', 'Frontend', 'Core', 'lbl', 'ProfileSettings', 'settings', '2015-09-25 08:02:40'),
(109, 1, 'en', 'Frontend', 'Core', 'lbl', 'Question', 'question', '2015-09-25 08:02:40'),
(110, 1, 'en', 'Frontend', 'Core', 'lbl', 'Questions', 'questions', '2015-09-25 08:02:40'),
(111, 1, 'en', 'Frontend', 'Core', 'lbl', 'RecentArticles', 'recent articles', '2015-09-25 08:02:40'),
(112, 1, 'en', 'Frontend', 'Core', 'lbl', 'RecentComments', 'recent comments', '2015-09-25 08:02:40'),
(113, 1, 'en', 'Frontend', 'Core', 'lbl', 'Register', 'register', '2015-09-25 08:02:40'),
(114, 1, 'en', 'Frontend', 'Core', 'lbl', 'Related', 'related', '2015-09-25 08:02:40'),
(115, 1, 'en', 'Frontend', 'Core', 'lbl', 'RememberMe', 'remember me', '2015-09-25 08:02:40'),
(116, 1, 'en', 'Frontend', 'Core', 'lbl', 'RequiredField', 'required field', '2015-09-25 08:02:40'),
(117, 1, 'en', 'Frontend', 'Core', 'lbl', 'Save', 'save', '2015-09-25 08:02:40'),
(118, 1, 'en', 'Frontend', 'Core', 'lbl', 'Search', 'search', '2015-09-25 08:02:40'),
(119, 1, 'en', 'Frontend', 'Core', 'lbl', 'SearchAgain', 'search again', '2015-09-25 08:02:40'),
(120, 1, 'en', 'Frontend', 'Core', 'lbl', 'SearchTerm', 'searchterm', '2015-09-25 08:02:40'),
(121, 1, 'en', 'Frontend', 'Core', 'lbl', 'Send', 'send', '2015-09-25 08:02:40'),
(122, 1, 'en', 'Frontend', 'Core', 'lbl', 'SenderInformation', 'sender information', '2015-09-25 08:02:40'),
(123, 1, 'en', 'Frontend', 'Core', 'lbl', 'Sent', 'sent', '2015-09-25 08:02:40'),
(124, 1, 'en', 'Frontend', 'Core', 'lbl', 'SentMailings', 'sent mailings', '2015-09-25 08:02:40'),
(125, 1, 'en', 'Frontend', 'Core', 'lbl', 'SentOn', 'sent on', '2015-09-25 08:02:40'),
(126, 1, 'en', 'Frontend', 'Core', 'lbl', 'Settings', 'settings', '2015-09-25 08:02:40'),
(127, 1, 'en', 'Frontend', 'Core', 'lbl', 'Share', 'share', '2015-09-25 08:02:40'),
(128, 1, 'en', 'Frontend', 'Core', 'lbl', 'ShowDirections', 'Show directions', '2015-09-25 08:02:40'),
(129, 1, 'en', 'Frontend', 'Core', 'lbl', 'ShowPassword', 'show password', '2015-09-25 08:02:40'),
(130, 1, 'en', 'Frontend', 'Core', 'lbl', 'Sitemap', 'sitemap', '2015-09-25 08:02:40'),
(131, 1, 'en', 'Frontend', 'Core', 'lbl', 'SkipToContent', 'skip to content', '2015-09-25 08:02:40'),
(132, 1, 'en', 'Frontend', 'Core', 'lbl', 'Start', 'startpoint', '2015-09-25 08:02:40'),
(133, 1, 'en', 'Frontend', 'Core', 'lbl', 'Subnavigation', 'subnavigation', '2015-09-25 08:02:40'),
(134, 1, 'en', 'Frontend', 'Core', 'lbl', 'Subscribe', 'subscribe', '2015-09-25 08:02:40'),
(135, 1, 'en', 'Frontend', 'Core', 'lbl', 'SubscribeToTheRSSFeed', 'subscribe to the RSS feed', '2015-09-25 08:02:40'),
(136, 1, 'en', 'Frontend', 'Core', 'lbl', 'Tags', 'tags', '2015-09-25 08:02:40'),
(137, 1, 'en', 'Frontend', 'Core', 'lbl', 'The', 'the', '2015-09-25 08:02:40'),
(138, 1, 'en', 'Frontend', 'Core', 'lbl', 'Title', 'title', '2015-09-25 08:02:40'),
(139, 1, 'en', 'Frontend', 'Core', 'lbl', 'ToFaqOverview', 'to the FAQ overview', '2015-09-25 08:02:40'),
(140, 1, 'en', 'Frontend', 'Core', 'lbl', 'ToTagsOverview', 'to tags overview', '2015-09-25 08:02:40'),
(141, 1, 'en', 'Frontend', 'Core', 'lbl', 'Unsubscribe', 'unsubscribe', '2015-09-25 08:02:40'),
(142, 1, 'en', 'Frontend', 'Core', 'lbl', 'ViewLargeMap', 'Display large map', '2015-09-25 08:02:40'),
(143, 1, 'en', 'Frontend', 'Core', 'lbl', 'Website', 'website', '2015-09-25 08:02:40'),
(144, 1, 'en', 'Frontend', 'Core', 'lbl', 'With', 'with', '2015-09-25 08:02:40'),
(145, 1, 'en', 'Frontend', 'Core', 'lbl', 'WrittenOn', 'written on', '2015-09-25 08:02:40'),
(146, 1, 'en', 'Frontend', 'Core', 'lbl', 'Wrote', 'wrote', '2015-09-25 08:02:40'),
(147, 1, 'en', 'Frontend', 'Core', 'lbl', 'Yes', 'yes', '2015-09-25 08:02:40'),
(148, 1, 'en', 'Frontend', 'Core', 'lbl', 'YouAreHere', 'you are here', '2015-09-25 08:02:40'),
(149, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourAvatar', 'your avatar', '2015-09-25 08:02:40'),
(150, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourData', 'your data', '2015-09-25 08:02:40'),
(151, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourEmail', 'your e-mail address', '2015-09-25 08:02:40'),
(152, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourLocationData', 'your location', '2015-09-25 08:02:40'),
(153, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourName', 'your name', '2015-09-25 08:02:40'),
(154, 1, 'en', 'Frontend', 'Core', 'lbl', 'YourQuestion', 'your question', '2015-09-25 08:02:40'),
(155, 1, 'en', 'Frontend', 'Core', 'msg', 'ActivationIsSuccess', 'Your profile was activated.', '2015-09-25 08:02:40'),
(156, 1, 'en', 'Frontend', 'Core', 'msg', 'AlsoInteresting', 'Also interesting for you', '2015-09-25 08:02:40'),
(157, 1, 'en', 'Frontend', 'Core', 'msg', 'AskOwnQuestion', 'Didn''t find what you were looking for? Ask your own question!', '2015-09-25 08:02:40'),
(158, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogAllComments', 'All comments on your blog.', '2015-09-25 08:02:40'),
(159, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogCommentInModeration', 'Your comment is awaiting moderation.', '2015-09-25 08:02:40'),
(160, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogCommentIsAdded', 'Your comment was added.', '2015-09-25 08:02:40'),
(161, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogCommentIsSpam', 'Your comment was marked as spam.', '2015-09-25 08:02:40'),
(162, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogEmailNotificationsNewComment', '%1$s commented on <a href="%2$s">%3$s</a>.', '2015-09-25 08:02:40'),
(163, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogEmailNotificationsNewCommentToModerate', '%1$s commented on <a href="%2$s">%3$s</a>. <a href="%4$s">Moderate</a> the comment to publish it.', '2015-09-25 08:02:40'),
(164, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogNoComments', 'Be the first to comment', '2015-09-25 08:02:40'),
(165, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogNoItems', 'There are no articles yet.', '2015-09-25 08:02:40'),
(166, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogNumberOfComments', '%1$s comments', '2015-09-25 08:02:40'),
(167, 1, 'en', 'Frontend', 'Core', 'msg', 'BlogOneComment', '1 comment already', '2015-09-25 08:02:40'),
(168, 1, 'en', 'Frontend', 'Core', 'msg', 'ChangeEmail', 'change your e-mail address', '2015-09-25 08:02:40'),
(169, 1, 'en', 'Frontend', 'Core', 'msg', 'Comment', 'comment', '2015-09-25 08:02:40'),
(170, 1, 'en', 'Frontend', 'Core', 'msg', 'CommentsOn', 'Comments on %1$s', '2015-09-25 08:02:40'),
(171, 1, 'en', 'Frontend', 'Core', 'msg', 'ContactMessageSent', 'Your e-mail was sent.', '2015-09-25 08:02:40'),
(172, 1, 'en', 'Frontend', 'Core', 'msg', 'ContactSubject', 'E-mail via contact form.', '2015-09-25 08:02:40'),
(173, 1, 'en', 'Frontend', 'Core', 'msg', 'CookiesWarning', 'To improve the user experience on this site we use <a href="/disclaimer">cookies</a>.', '2015-09-25 08:02:40'),
(174, 1, 'en', 'Frontend', 'Core', 'msg', 'EN', 'English', '2015-09-25 08:02:40'),
(175, 1, 'en', 'Frontend', 'Core', 'msg', 'EnableJavascript', 'Having javascript enabled is recommended for using this site.', '2015-09-25 08:02:40'),
(176, 1, 'en', 'Frontend', 'Core', 'msg', 'FaqFeedbackSubject', 'There is feedback on "%1$s"', '2015-09-25 08:02:40'),
(177, 1, 'en', 'Frontend', 'Core', 'msg', 'FaqNoItems', 'There are no questions yet.', '2015-09-25 08:02:40'),
(178, 1, 'en', 'Frontend', 'Core', 'msg', 'FaqOwnQuestionSubject', 'A question from %1$s.', '2015-09-25 08:02:40'),
(179, 1, 'en', 'Frontend', 'Core', 'msg', 'Feedback', 'Was this answer helpful?', '2015-09-25 08:02:40'),
(180, 1, 'en', 'Frontend', 'Core', 'msg', 'FeedbackSuccess', 'Your feedback has been sent.', '2015-09-25 08:02:40'),
(181, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPassword', 'Forgot your password?', '2015-09-25 08:02:40'),
(182, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPasswordBody', 'You just requested to reset your password on <a href="%1$s">Fork CMS</a>. Follow the link below to reset your password.<br /><br /><a href="%2$s">%2$s</a>', '2015-09-25 08:02:40'),
(183, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPasswordClosure', 'With kind regards,<br/><br/>The Fork CMS team', '2015-09-25 08:02:40'),
(184, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPasswordIsSuccess', 'In less than ten minutes you will receive an e-mail to reset your password.', '2015-09-25 08:02:40'),
(185, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPasswordSalutation', 'Dear,', '2015-09-25 08:02:40'),
(186, 1, 'en', 'Frontend', 'Core', 'msg', 'ForgotPasswordSubject', 'Forgot your password?', '2015-09-25 08:02:40'),
(187, 1, 'en', 'Frontend', 'Core', 'msg', 'FormBuilderSubject', 'New submission for form "%1$s".', '2015-09-25 08:02:40'),
(188, 1, 'en', 'Frontend', 'Core', 'msg', 'FR', 'French', '2015-09-25 08:02:40'),
(189, 1, 'en', 'Frontend', 'Core', 'msg', 'HelpDateField', 'eg. 20/06/2011', '2015-09-25 08:02:40'),
(190, 1, 'en', 'Frontend', 'Core', 'msg', 'HelpDisplayNameChanges', 'The amount of display name changes is limited to %1$s. You have %2$s change(s) left.', '2015-09-25 08:02:40'),
(191, 1, 'en', 'Frontend', 'Core', 'msg', 'HelpImageField', 'Only jp(e)g, gif or png-files are allowed.', '2015-09-25 08:02:40'),
(192, 1, 'en', 'Frontend', 'Core', 'msg', 'HelpTimeField', 'eg. 14:35', '2015-09-25 08:02:40'),
(193, 1, 'en', 'Frontend', 'Core', 'msg', 'HowToImprove', 'How can we improve this answer?', '2015-09-25 08:02:40'),
(194, 1, 'en', 'Frontend', 'Core', 'msg', 'MoreResults', 'Find more results…', '2015-09-25 08:02:40'),
(195, 1, 'en', 'Frontend', 'Core', 'msg', 'NL', 'Dutch', '2015-09-25 08:02:40'),
(196, 1, 'en', 'Frontend', 'Core', 'msg', 'NoQuestionsInCategory', 'There are no questions in this category.', '2015-09-25 08:02:40'),
(197, 1, 'en', 'Frontend', 'Core', 'msg', 'NoSentMailings', 'So far', '2015-09-25 08:02:40'),
(198, 1, 'en', 'Frontend', 'Core', 'msg', 'NotificationSubject', 'Notification', '2015-09-25 08:02:40'),
(199, 1, 'en', 'Frontend', 'Core', 'msg', 'OtherQuestions', 'Other questions', '2015-09-25 08:02:40'),
(200, 1, 'en', 'Frontend', 'Core', 'msg', 'OwnQuestionSuccess', 'Your question has been sent. We''ll give you an answer as soon as possible.', '2015-09-25 08:02:40'),
(201, 1, 'en', 'Frontend', 'Core', 'msg', 'ProfilesLoggedInAs', 'You are logged on as <a href="%2$s">%1$s</a>.', '2015-09-25 08:02:40'),
(202, 1, 'en', 'Frontend', 'Core', 'msg', 'QuestionsInSameCategory', 'Other questions in this category', '2015-09-25 08:02:40'),
(203, 1, 'en', 'Frontend', 'Core', 'msg', 'RegisterBody', 'You have just registered on the <a href="%1$s">Fork CMS</a> site. To activate your profile you need to follow the link below.<br /><br /><a href="%2$s">%2$s</a>', '2015-09-25 08:02:40'),
(204, 1, 'en', 'Frontend', 'Core', 'msg', 'RegisterClosure', 'With kind regards,<br/><br/>The Fork CMS team', '2015-09-25 08:02:40'),
(205, 1, 'en', 'Frontend', 'Core', 'msg', 'RegisterIsSuccess', 'Welcome! In less than ten minutes you will receive an activation mail. In the mean while you can use the website in a limited form.', '2015-09-25 08:02:40'),
(206, 1, 'en', 'Frontend', 'Core', 'msg', 'RegisterSalutation', 'Dear,', '2015-09-25 08:02:40'),
(207, 1, 'en', 'Frontend', 'Core', 'msg', 'RegisterSubject', 'Activate your Fork CMS-profile', '2015-09-25 08:02:40'),
(208, 1, 'en', 'Frontend', 'Core', 'msg', 'RelatedQuestions', 'Also read', '2015-09-25 08:02:40'),
(209, 1, 'en', 'Frontend', 'Core', 'msg', 'ResendActivationIsSuccess', 'In less than ten minutes you will receive an new activation mail. A simple click on the link and you will be able to log in.', '2015-09-25 08:02:40'),
(210, 1, 'en', 'Frontend', 'Core', 'msg', 'ResetPasswordIsSuccess', 'Your password was saved.', '2015-09-25 08:02:40'),
(211, 1, 'en', 'Frontend', 'Core', 'msg', 'SearchNoItems', 'There were no results.', '2015-09-25 08:02:40'),
(212, 1, 'en', 'Frontend', 'Core', 'msg', 'SubscribeSuccess', 'You have successfully subscribed to the newsletter.', '2015-09-25 08:02:40'),
(213, 1, 'en', 'Frontend', 'Core', 'msg', 'TagsNoItems', 'No tags were used.', '2015-09-25 08:02:40'),
(214, 1, 'en', 'Frontend', 'Core', 'msg', 'UnsubscribeSuccess', 'You have successfully unsubscribed from the newsletter.', '2015-09-25 08:02:40'),
(215, 1, 'en', 'Frontend', 'Core', 'msg', 'UpdateEmailIsSuccess', 'Your e-mail was saved.', '2015-09-25 08:02:40'),
(216, 1, 'en', 'Frontend', 'Core', 'msg', 'UpdatePasswordIsSuccess', 'Your password was saved.', '2015-09-25 08:02:40'),
(217, 1, 'en', 'Frontend', 'Core', 'msg', 'UpdateSettingsIsSuccess', 'The settings were saved.', '2015-09-25 08:02:40'),
(218, 1, 'en', 'Frontend', 'Core', 'msg', 'WelcomeUserX', 'Welcome, %1$s', '2015-09-25 08:02:40'),
(219, 1, 'en', 'Frontend', 'Core', 'msg', 'WrittenBy', 'written by %1$s', '2015-09-25 08:02:40'),
(220, 1, 'en', 'Frontend', 'Core', 'err', 'AlreadySubscribed', 'This e-mail address is already subscribed to the newsletter.', '2015-09-25 08:02:40'),
(221, 1, 'en', 'Frontend', 'Core', 'err', 'AlreadyUnsubscribed', 'This e-mail address is already unsubscribed from the newsletter', '2015-09-25 08:02:40'),
(222, 1, 'en', 'Frontend', 'Core', 'err', 'AuthorIsRequired', 'Author is a required field.', '2015-09-25 08:02:40'),
(223, 1, 'en', 'Frontend', 'Core', 'err', 'CommentTimeout', 'Slow down cowboy', '2015-09-25 08:02:40'),
(224, 1, 'en', 'Frontend', 'Core', 'err', 'ContactErrorWhileSending', 'Something went wrong while trying to send', '2015-09-25 08:02:40'),
(225, 1, 'en', 'Frontend', 'Core', 'err', 'DateIsInvalid', 'Invalid date.', '2015-09-25 08:02:40'),
(226, 1, 'en', 'Frontend', 'Core', 'err', 'DisplayNameExists', 'This display name is in use.', '2015-09-25 08:02:40'),
(227, 1, 'en', 'Frontend', 'Core', 'err', 'DisplayNameIsRequired', 'Display name is a required field.', '2015-09-25 08:02:40'),
(228, 1, 'en', 'Frontend', 'Core', 'err', 'EmailExists', 'This e-mailaddress is in use.', '2015-09-25 08:02:40'),
(229, 1, 'en', 'Frontend', 'Core', 'err', 'EmailIsInvalid', 'Please provide a valid e-mail address.', '2015-09-25 08:02:40'),
(230, 1, 'en', 'Frontend', 'Core', 'err', 'EmailIsRequired', 'E-mail is a required field.', '2015-09-25 08:02:40'),
(231, 1, 'en', 'Frontend', 'Core', 'err', 'EmailIsUnknown', 'This e-mailaddress is unknown in our database.', '2015-09-25 08:02:40'),
(232, 1, 'en', 'Frontend', 'Core', 'err', 'EmailNotInDatabase', 'This e-mail address does not exist in the database.', '2015-09-25 08:02:40'),
(233, 1, 'en', 'Frontend', 'Core', 'err', 'FeedbackIsRequired', 'Please provide feedback.', '2015-09-25 08:02:40'),
(234, 1, 'en', 'Frontend', 'Core', 'err', 'FeedbackSpam', 'Your feedback was marked as spam.', '2015-09-25 08:02:40'),
(235, 1, 'en', 'Frontend', 'Core', 'err', 'FieldIsRequired', 'This field is required.', '2015-09-25 08:02:40'),
(236, 1, 'en', 'Frontend', 'Core', 'err', 'FormError', 'Something went wrong', '2015-09-25 08:02:40'),
(237, 1, 'en', 'Frontend', 'Core', 'err', 'FormTimeout', 'Slow down cowboy', '2015-09-25 08:02:40'),
(238, 1, 'en', 'Frontend', 'Core', 'err', 'InvalidPassword', 'Invalid password.', '2015-09-25 08:02:40'),
(239, 1, 'en', 'Frontend', 'Core', 'err', 'InvalidPrice', 'Please insert a valid price.', '2015-09-25 08:02:40'),
(240, 1, 'en', 'Frontend', 'Core', 'err', 'InvalidURL', 'This is an invalid URL.', '2015-09-25 08:02:40'),
(241, 1, 'en', 'Frontend', 'Core', 'err', 'JPGGIFAndPNGOnly', 'Only jpg, gif, png', '2015-09-25 08:02:40'),
(242, 1, 'en', 'Frontend', 'Core', 'err', 'MessageIsRequired', 'Message is a required field.', '2015-09-25 08:02:40'),
(243, 1, 'en', 'Frontend', 'Core', 'err', 'NameIsRequired', 'Please provide a name.', '2015-09-25 08:02:40'),
(244, 1, 'en', 'Frontend', 'Core', 'err', 'NumericCharactersOnly', 'Only numeric characters are allowed.', '2015-09-25 08:02:40'),
(245, 1, 'en', 'Frontend', 'Core', 'err', 'OwnQuestionSpam', 'Your question was marked as spam.', '2015-09-25 08:02:40'),
(246, 1, 'en', 'Frontend', 'Core', 'err', 'PasswordIsRequired', 'Password is a required field.', '2015-09-25 08:02:40'),
(247, 1, 'en', 'Frontend', 'Core', 'err', 'ProfileIsActive', 'This profile is already activated.', '2015-09-25 08:02:40'),
(248, 1, 'en', 'Frontend', 'Core', 'err', 'ProfilesBlockedLogin', 'Login failed. This profile is blocked.', '2015-09-25 08:02:40'),
(249, 1, 'en', 'Frontend', 'Core', 'err', 'ProfilesDeletedLogin', 'Login failed. This profile has been deleted.', '2015-09-25 08:02:40'),
(250, 1, 'en', 'Frontend', 'Core', 'err', 'ProfilesInactiveLogin', 'Login failed. This profile is not yet activated. <a href="%1$s">Resend activation e-mail</a>.', '2015-09-25 08:02:40'),
(251, 1, 'en', 'Frontend', 'Core', 'err', 'ProfilesInvalidLogin', 'Login failed. Please check your e-mail and your password.', '2015-09-25 08:02:40'),
(252, 1, 'en', 'Frontend', 'Core', 'err', 'QuestionIsRequired', 'Please provide a question.', '2015-09-25 08:02:40'),
(253, 1, 'en', 'Frontend', 'Core', 'err', 'SomethingWentWrong', 'Something went wrong.', '2015-09-25 08:02:40'),
(254, 1, 'en', 'Frontend', 'Core', 'err', 'SubscribeFailed', 'Subscribing failed', '2015-09-25 08:02:40'),
(255, 1, 'en', 'Frontend', 'Core', 'err', 'TermIsRequired', 'The searchterm is required.', '2015-09-25 08:02:40'),
(256, 1, 'en', 'Frontend', 'Core', 'err', 'UnsubscribeFailed', 'Unsubscribing failed', '2015-09-25 08:02:40'),
(257, 1, 'en', 'Frontend', 'Core', 'act', 'Archive', 'archive', '2015-09-25 08:02:40'),
(258, 1, 'en', 'Frontend', 'Core', 'act', 'ArticleCommentsRss', 'comments-on-rss', '2015-09-25 08:02:40'),
(259, 1, 'en', 'Frontend', 'Core', 'act', 'Category', 'category', '2015-09-25 08:02:40'),
(260, 1, 'en', 'Frontend', 'Core', 'act', 'Comment', 'comment', '2015-09-25 08:02:40'),
(261, 1, 'en', 'Frontend', 'Core', 'act', 'Comments', 'comments', '2015-09-25 08:02:40'),
(262, 1, 'en', 'Frontend', 'Core', 'act', 'CommentsRss', 'comments-rss', '2015-09-25 08:02:40'),
(263, 1, 'en', 'Frontend', 'Core', 'act', 'Detail', 'detail', '2015-09-25 08:02:40'),
(264, 1, 'en', 'Frontend', 'Core', 'act', 'Feedback', 'feedback', '2015-09-25 08:02:40'),
(265, 1, 'en', 'Frontend', 'Core', 'act', 'OwnQuestion', 'ask-your-question', '2015-09-25 08:02:40'),
(266, 1, 'en', 'Frontend', 'Core', 'act', 'Preview', 'preview', '2015-09-25 08:02:40'),
(267, 1, 'en', 'Frontend', 'Core', 'act', 'Rss', 'rss', '2015-09-25 08:02:40'),
(268, 1, 'en', 'Frontend', 'Core', 'act', 'Spam', 'spam', '2015-09-25 08:02:40'),
(269, 1, 'en', 'Frontend', 'Core', 'act', 'Subscribe', 'subscribe', '2015-09-25 08:02:40'),
(270, 1, 'en', 'Frontend', 'Core', 'act', 'Success', 'success', '2015-09-25 08:02:40'),
(271, 1, 'en', 'Frontend', 'Core', 'act', 'Unsubscribe', 'unsubscribe', '2015-09-25 08:02:40'),
(272, 1, 'en', 'Backend', 'Core', 'lbl', 'AccountManagement', 'account management', '2015-09-25 08:02:40'),
(273, 1, 'en', 'Backend', 'Core', 'lbl', 'AccountSettings', 'account settings', '2015-09-25 08:02:40'),
(274, 1, 'en', 'Backend', 'Core', 'lbl', 'Activate', 'activate', '2015-09-25 08:02:40'),
(275, 1, 'en', 'Backend', 'Core', 'lbl', 'Active', 'active', '2015-09-25 08:02:40'),
(276, 1, 'en', 'Backend', 'Core', 'lbl', 'Add', 'add', '2015-09-25 08:02:40'),
(277, 1, 'en', 'Backend', 'Core', 'lbl', 'AddBlock', 'add block', '2015-09-25 08:02:40'),
(278, 1, 'en', 'Backend', 'Core', 'lbl', 'AddCategory', 'add category', '2015-09-25 08:02:40'),
(279, 1, 'en', 'Backend', 'Core', 'lbl', 'Address', 'address', '2015-09-25 08:02:40'),
(280, 1, 'en', 'Backend', 'Core', 'lbl', 'EmailAddresses', 'e-mail addresses', '2015-09-25 08:02:40'),
(281, 1, 'en', 'Backend', 'Core', 'lbl', 'AddTemplate', 'add template', '2015-09-25 08:02:40'),
(282, 1, 'en', 'Backend', 'Core', 'lbl', 'Advanced', 'advanced', '2015-09-25 08:02:40'),
(283, 1, 'en', 'Backend', 'Core', 'lbl', 'AllEmailAddresses', 'all e-mail addresses', '2015-09-25 08:02:40'),
(284, 1, 'en', 'Backend', 'Core', 'lbl', 'AllComments', 'all comments', '2015-09-25 08:02:40'),
(285, 1, 'en', 'Backend', 'Core', 'lbl', 'AllowComments', 'allow comments', '2015-09-25 08:02:40'),
(286, 1, 'en', 'Backend', 'Core', 'lbl', 'AllPages', 'all pages', '2015-09-25 08:02:40'),
(287, 1, 'en', 'Backend', 'Core', 'lbl', 'AllQuestions', 'all questions', '2015-09-25 08:02:40'),
(288, 1, 'en', 'Backend', 'Core', 'lbl', 'Amount', 'amount', '2015-09-25 08:02:40'),
(289, 1, 'en', 'Backend', 'Core', 'lbl', 'Analyse', 'analyse', '2015-09-25 08:02:40'),
(290, 1, 'en', 'Backend', 'Core', 'lbl', 'Analysis', 'analysis', '2015-09-25 08:02:40'),
(291, 1, 'en', 'Backend', 'Core', 'lbl', 'Analytics', 'analytics', '2015-09-25 08:02:40'),
(292, 1, 'en', 'Backend', 'Core', 'lbl', 'APIKey', 'API key', '2015-09-25 08:02:40'),
(293, 1, 'en', 'Backend', 'Core', 'lbl', 'APIKeys', 'API keys', '2015-09-25 08:02:40'),
(294, 1, 'en', 'Backend', 'Core', 'lbl', 'APIURL', 'API URL', '2015-09-25 08:02:40'),
(295, 1, 'en', 'Backend', 'Core', 'lbl', 'Application', 'application', '2015-09-25 08:02:40'),
(296, 1, 'en', 'Backend', 'Core', 'lbl', 'Approve', 'approve', '2015-09-25 08:02:40'),
(297, 1, 'en', 'Backend', 'Core', 'lbl', 'Archive', 'archive', '2015-09-25 08:02:40'),
(298, 1, 'en', 'Backend', 'Core', 'lbl', 'Archived', 'archived', '2015-09-25 08:02:40'),
(299, 1, 'en', 'Backend', 'Core', 'lbl', 'Article', 'article', '2015-09-25 08:02:40'),
(300, 1, 'en', 'Backend', 'Core', 'lbl', 'Articles', 'articles', '2015-09-25 08:02:40'),
(301, 1, 'en', 'Backend', 'Core', 'lbl', 'AskOwnQuestion', 'ask own question', '2015-09-25 08:02:40'),
(302, 1, 'en', 'Backend', 'Core', 'lbl', 'At', 'at', '2015-09-25 08:02:40'),
(303, 1, 'en', 'Backend', 'Core', 'lbl', 'Authentication', 'authentication', '2015-09-25 08:02:40'),
(304, 1, 'en', 'Backend', 'Core', 'lbl', 'Author', 'author', '2015-09-25 08:02:40'),
(305, 1, 'en', 'Backend', 'Core', 'lbl', 'Avatar', 'avatar', '2015-09-25 08:02:40'),
(306, 1, 'en', 'Backend', 'Core', 'lbl', 'Average', 'average', '2015-09-25 08:02:40'),
(307, 1, 'en', 'Backend', 'Core', 'lbl', 'Back', 'back', '2015-09-25 08:02:40'),
(308, 1, 'en', 'Backend', 'Core', 'lbl', 'Backend', 'backend', '2015-09-25 08:02:40'),
(309, 1, 'en', 'Backend', 'Core', 'lbl', 'BG', 'Bulgarian', '2015-09-25 08:02:40'),
(310, 1, 'en', 'Backend', 'Core', 'lbl', 'Block', 'block', '2015-09-25 08:02:40'),
(311, 1, 'en', 'Backend', 'Core', 'lbl', 'Blog', 'blog', '2015-09-25 08:02:40'),
(312, 1, 'en', 'Backend', 'Core', 'lbl', 'Bounces', 'bounces', '2015-09-25 08:02:40'),
(313, 1, 'en', 'Backend', 'Core', 'lbl', 'BounceType', 'bounce type', '2015-09-25 08:02:40'),
(314, 1, 'en', 'Backend', 'Core', 'lbl', 'BrowserNotSupported', 'browser not supported', '2015-09-25 08:02:40'),
(315, 1, 'en', 'Backend', 'Core', 'lbl', 'By', 'by', '2015-09-25 08:02:40'),
(316, 1, 'en', 'Backend', 'Core', 'lbl', 'Campaigns', 'campaigns', '2015-09-25 08:02:40'),
(317, 1, 'en', 'Backend', 'Core', 'lbl', 'Cancel', 'cancel', '2015-09-25 08:02:40'),
(318, 1, 'en', 'Backend', 'Core', 'lbl', 'Categories', 'categories', '2015-09-25 08:02:40'),
(319, 1, 'en', 'Backend', 'Core', 'lbl', 'Category', 'category', '2015-09-25 08:02:40'),
(320, 1, 'en', 'Backend', 'Core', 'lbl', 'ChangeEmail', 'change e-mail', '2015-09-25 08:02:40'),
(321, 1, 'en', 'Backend', 'Core', 'lbl', 'ChangePassword', 'change password', '2015-09-25 08:02:40'),
(322, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseALanguage', 'choose a language', '2015-09-25 08:02:40'),
(323, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseAModule', 'choose a module', '2015-09-25 08:02:40'),
(324, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseAnApplication', 'choose an application', '2015-09-25 08:02:40'),
(325, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseATemplate', 'choose a template', '2015-09-25 08:02:40'),
(326, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseAType', 'choose a type', '2015-09-25 08:02:40'),
(327, 1, 'en', 'Backend', 'Core', 'lbl', 'ChooseContent', 'choose content', '2015-09-25 08:02:40'),
(328, 1, 'en', 'Backend', 'Core', 'lbl', 'City', 'city', '2015-09-25 08:02:40'),
(329, 1, 'en', 'Backend', 'Core', 'lbl', 'ClientSettings', 'client settings', '2015-09-25 08:02:40'),
(330, 1, 'en', 'Backend', 'Core', 'lbl', 'CN', 'Chinese', '2015-09-25 08:02:40'),
(331, 1, 'en', 'Backend', 'Core', 'lbl', 'Comment', 'comment', '2015-09-25 08:02:40'),
(332, 1, 'en', 'Backend', 'Core', 'lbl', 'Comments', 'comments', '2015-09-25 08:02:40'),
(333, 1, 'en', 'Backend', 'Core', 'lbl', 'ConfirmPassword', 'confirm password', '2015-09-25 08:02:40'),
(334, 1, 'en', 'Backend', 'Core', 'lbl', 'Contact', 'contact', '2015-09-25 08:02:40'),
(335, 1, 'en', 'Backend', 'Core', 'lbl', 'ContactForm', 'contact form', '2015-09-25 08:02:40'),
(336, 1, 'en', 'Backend', 'Core', 'lbl', 'Content', 'content', '2015-09-25 08:02:40'),
(337, 1, 'en', 'Backend', 'Core', 'lbl', 'ContentBlocks', 'content blocks', '2015-09-25 08:02:40'),
(338, 1, 'en', 'Backend', 'Core', 'lbl', 'Copy', 'copy', '2015-09-25 08:02:40'),
(339, 1, 'en', 'Backend', 'Core', 'lbl', 'Core', 'core', '2015-09-25 08:02:40'),
(340, 1, 'en', 'Backend', 'Core', 'lbl', 'Country', 'country', '2015-09-25 08:02:40'),
(341, 1, 'en', 'Backend', 'Core', 'lbl', 'Created', 'created', '2015-09-25 08:02:40'),
(342, 1, 'en', 'Backend', 'Core', 'lbl', 'CreatedOn', 'created on', '2015-09-25 08:02:40'),
(343, 1, 'en', 'Backend', 'Core', 'lbl', 'Cronjob', 'cronjob', '2015-09-25 08:02:40'),
(344, 1, 'en', 'Backend', 'Core', 'lbl', 'Cronjobs', 'cronjobs', '2015-09-25 08:02:40'),
(345, 1, 'en', 'Backend', 'Core', 'lbl', 'CS', 'Czech', '2015-09-25 08:02:40'),
(346, 1, 'en', 'Backend', 'Core', 'lbl', 'CSV', 'CSV', '2015-09-25 08:02:40'),
(347, 1, 'en', 'Backend', 'Core', 'lbl', 'CurrentPassword', 'current password', '2015-09-25 08:02:40'),
(348, 1, 'en', 'Backend', 'Core', 'lbl', 'CustomURL', 'custom URL', '2015-09-25 08:02:40'),
(349, 1, 'en', 'Backend', 'Core', 'lbl', 'Dashboard', 'dashboard', '2015-09-25 08:02:40'),
(350, 1, 'en', 'Backend', 'Core', 'lbl', 'Date', 'date', '2015-09-25 08:02:40'),
(351, 1, 'en', 'Backend', 'Core', 'lbl', 'DateAndTime', 'date and time', '2015-09-25 08:02:40'),
(352, 1, 'en', 'Backend', 'Core', 'lbl', 'DateFormat', 'date format', '2015-09-25 08:02:40'),
(353, 1, 'en', 'Backend', 'Core', 'lbl', 'DE', 'German', '2015-09-25 08:02:40'),
(354, 1, 'en', 'Backend', 'Core', 'lbl', 'Dear', 'dear', '2015-09-25 08:02:40'),
(355, 1, 'en', 'Backend', 'Core', 'lbl', 'DebugMode', 'debug mode', '2015-09-25 08:02:40'),
(356, 1, 'en', 'Backend', 'Core', 'lbl', 'Default', 'default', '2015-09-25 08:02:40'),
(357, 1, 'en', 'Backend', 'Core', 'lbl', 'Delete', 'delete', '2015-09-25 08:02:40'),
(358, 1, 'en', 'Backend', 'Core', 'lbl', 'Description', 'description', '2015-09-25 08:02:40'),
(359, 1, 'en', 'Backend', 'Core', 'lbl', 'Details', 'details', '2015-09-25 08:02:40'),
(360, 1, 'en', 'Backend', 'Core', 'lbl', 'Developer', 'developer', '2015-09-25 08:02:40'),
(361, 1, 'en', 'Backend', 'Core', 'lbl', 'Domains', 'domains', '2015-09-25 08:02:40'),
(362, 1, 'en', 'Backend', 'Core', 'lbl', 'Done', 'done', '2015-09-25 08:02:40'),
(363, 1, 'en', 'Backend', 'Core', 'lbl', 'Draft', 'draft', '2015-09-25 08:02:40'),
(364, 1, 'en', 'Backend', 'Core', 'lbl', 'Drafts', 'drafts', '2015-09-25 08:02:40'),
(365, 1, 'en', 'Backend', 'Core', 'lbl', 'Edit', 'edit', '2015-09-25 08:02:40'),
(366, 1, 'en', 'Backend', 'Core', 'lbl', 'EditedOn', 'edited on', '2015-09-25 08:02:40'),
(367, 1, 'en', 'Backend', 'Core', 'lbl', 'Editor', 'editor', '2015-09-25 08:02:40'),
(368, 1, 'en', 'Backend', 'Core', 'lbl', 'EditProfile', 'edit profile', '2015-09-25 08:02:40'),
(369, 1, 'en', 'Backend', 'Core', 'lbl', 'EditTemplate', 'edit template', '2015-09-25 08:02:40'),
(370, 1, 'en', 'Backend', 'Core', 'lbl', 'EL', 'Greek', '2015-09-25 08:02:40'),
(371, 1, 'en', 'Backend', 'Core', 'lbl', 'Email', 'e-mail', '2015-09-25 08:02:40'),
(372, 1, 'en', 'Backend', 'Core', 'lbl', 'EN', 'English', '2015-09-25 08:02:40'),
(373, 1, 'en', 'Backend', 'Core', 'lbl', 'EnableModeration', 'enable moderation', '2015-09-25 08:02:40'),
(374, 1, 'en', 'Backend', 'Core', 'lbl', 'EndDate', 'end date', '2015-09-25 08:02:40'),
(375, 1, 'en', 'Backend', 'Core', 'lbl', 'Error', 'error', '2015-09-25 08:02:40'),
(376, 1, 'en', 'Backend', 'Core', 'lbl', 'ES', 'Spanish', '2015-09-25 08:02:40'),
(377, 1, 'en', 'Backend', 'Core', 'lbl', 'Example', 'example', '2015-09-25 08:02:40'),
(378, 1, 'en', 'Backend', 'Core', 'lbl', 'Execute', 'execute', '2015-09-25 08:02:40'),
(379, 1, 'en', 'Backend', 'Core', 'lbl', 'ExitPages', 'exit pages', '2015-09-25 08:02:40'),
(380, 1, 'en', 'Backend', 'Core', 'lbl', 'Export', 'export', '2015-09-25 08:02:40'),
(381, 1, 'en', 'Backend', 'Core', 'lbl', 'Extensions', 'extensions', '2015-09-25 08:02:40'),
(382, 1, 'en', 'Backend', 'Core', 'lbl', 'ExtraMetaTags', 'extra metatags', '2015-09-25 08:02:40'),
(383, 1, 'en', 'Backend', 'Core', 'lbl', 'Faq', 'FAQ', '2015-09-25 08:02:40'),
(384, 1, 'en', 'Backend', 'Core', 'lbl', 'Feedback', 'feedback', '2015-09-25 08:02:40'),
(385, 1, 'en', 'Backend', 'Core', 'lbl', 'File', 'file', '2015-09-25 08:02:40'),
(386, 1, 'en', 'Backend', 'Core', 'lbl', 'Filename', 'filename', '2015-09-25 08:02:40'),
(387, 1, 'en', 'Backend', 'Core', 'lbl', 'FilterCommentsForSpam', 'filter comments for spam', '2015-09-25 08:02:40'),
(388, 1, 'en', 'Backend', 'Core', 'lbl', 'Follow', 'follow', '2015-09-25 08:02:40'),
(389, 1, 'en', 'Backend', 'Core', 'lbl', 'For', 'for', '2015-09-25 08:02:40'),
(390, 1, 'en', 'Backend', 'Core', 'lbl', 'ForgotPassword', 'forgot password', '2015-09-25 08:02:40'),
(391, 1, 'en', 'Backend', 'Core', 'lbl', 'FormBuilder', 'formbuilder', '2015-09-25 08:02:40'),
(392, 1, 'en', 'Backend', 'Core', 'lbl', 'FR', 'French', '2015-09-25 08:02:40'),
(393, 1, 'en', 'Backend', 'Core', 'lbl', 'From', 'from', '2015-09-25 08:02:40'),
(394, 1, 'en', 'Backend', 'Core', 'lbl', 'Frontend', 'frontend', '2015-09-25 08:02:40'),
(395, 1, 'en', 'Backend', 'Core', 'lbl', 'General', 'general', '2015-09-25 08:02:40'),
(396, 1, 'en', 'Backend', 'Core', 'lbl', 'GeneralSettings', 'general settings', '2015-09-25 08:02:40'),
(397, 1, 'en', 'Backend', 'Core', 'lbl', 'Generate', 'generate', '2015-09-25 08:02:40'),
(398, 1, 'en', 'Backend', 'Core', 'lbl', 'GoToPage', 'go to page', '2015-09-25 08:02:40'),
(399, 1, 'en', 'Backend', 'Core', 'lbl', 'Group', 'group', '2015-09-25 08:02:40'),
(400, 1, 'en', 'Backend', 'Core', 'lbl', 'GroupMap', 'general map: all locations', '2015-09-25 08:02:40'),
(401, 1, 'en', 'Backend', 'Core', 'lbl', 'Groups', 'groups', '2015-09-25 08:02:40'),
(402, 1, 'en', 'Backend', 'Core', 'lbl', 'Height', 'height', '2015-09-25 08:02:40'),
(403, 1, 'en', 'Backend', 'Core', 'lbl', 'Hidden', 'hidden', '2015-09-25 08:02:40'),
(404, 1, 'en', 'Backend', 'Core', 'lbl', 'Home', 'home', '2015-09-25 08:02:40'),
(405, 1, 'en', 'Backend', 'Core', 'lbl', 'HU', 'Hungarian', '2015-09-25 08:02:40'),
(406, 1, 'en', 'Backend', 'Core', 'lbl', 'Image', 'image', '2015-09-25 08:02:40'),
(407, 1, 'en', 'Backend', 'Core', 'lbl', 'Images', 'images', '2015-09-25 08:02:40'),
(408, 1, 'en', 'Backend', 'Core', 'lbl', 'Import', 'import', '2015-09-25 08:02:40'),
(409, 1, 'en', 'Backend', 'Core', 'lbl', 'ImportNoun', 'import', '2015-09-25 08:02:40'),
(410, 1, 'en', 'Backend', 'Core', 'lbl', 'In', 'in', '2015-09-25 08:02:40'),
(411, 1, 'en', 'Backend', 'Core', 'lbl', 'Index', 'index', '2015-09-25 08:02:40'),
(412, 1, 'en', 'Backend', 'Core', 'lbl', 'IndividualMap', 'widget: individual map', '2015-09-25 08:02:40'),
(413, 1, 'en', 'Backend', 'Core', 'lbl', 'Interface', 'interface', '2015-09-25 08:02:40'),
(414, 1, 'en', 'Backend', 'Core', 'lbl', 'InterfacePreferences', 'interface preferences', '2015-09-25 08:02:40'),
(415, 1, 'en', 'Backend', 'Core', 'lbl', 'IP', 'IP', '2015-09-25 08:02:40'),
(416, 1, 'en', 'Backend', 'Core', 'lbl', 'IT', 'Italian', '2015-09-25 08:02:40'),
(417, 1, 'en', 'Backend', 'Core', 'lbl', 'ItemsPerPage', 'items per page', '2015-09-25 08:02:40'),
(418, 1, 'en', 'Backend', 'Core', 'lbl', 'JA', 'Japanese', '2015-09-25 08:02:40'),
(419, 1, 'en', 'Backend', 'Core', 'lbl', 'Keyword', 'keyword', '2015-09-25 08:02:40'),
(420, 1, 'en', 'Backend', 'Core', 'lbl', 'Keywords', 'keywords', '2015-09-25 08:02:40'),
(421, 1, 'en', 'Backend', 'Core', 'lbl', 'Label', 'label', '2015-09-25 08:02:40'),
(422, 1, 'en', 'Backend', 'Core', 'lbl', 'LandingPages', 'landing pages', '2015-09-25 08:02:40'),
(423, 1, 'en', 'Backend', 'Core', 'lbl', 'Language', 'language', '2015-09-25 08:02:40'),
(424, 1, 'en', 'Backend', 'Core', 'lbl', 'Languages', 'languages', '2015-09-25 08:02:40'),
(425, 1, 'en', 'Backend', 'Core', 'lbl', 'LastEdited', 'last edited', '2015-09-25 08:02:40'),
(426, 1, 'en', 'Backend', 'Core', 'lbl', 'LastEditedOn', 'last edited on', '2015-09-25 08:02:40'),
(427, 1, 'en', 'Backend', 'Core', 'lbl', 'LastFailedLoginAttempt', 'last failed login attempt', '2015-09-25 08:02:40'),
(428, 1, 'en', 'Backend', 'Core', 'lbl', 'LastLogin', 'last login', '2015-09-25 08:02:40'),
(429, 1, 'en', 'Backend', 'Core', 'lbl', 'LastPasswordChange', 'last password change', '2015-09-25 08:02:40'),
(430, 1, 'en', 'Backend', 'Core', 'lbl', 'LastSaved', 'last saved', '2015-09-25 08:02:40'),
(431, 1, 'en', 'Backend', 'Core', 'lbl', 'LatestComments', 'latest comments', '2015-09-25 08:02:40'),
(432, 1, 'en', 'Backend', 'Core', 'lbl', 'Layout', 'layout', '2015-09-25 08:02:40'),
(433, 1, 'en', 'Backend', 'Core', 'lbl', 'LineEnding', 'line ending', '2015-09-25 08:02:40'),
(434, 1, 'en', 'Backend', 'Core', 'lbl', 'Loading', 'loading', '2015-09-25 08:02:40'),
(435, 1, 'en', 'Backend', 'Core', 'lbl', 'Locale', 'locale', '2015-09-25 08:02:40'),
(436, 1, 'en', 'Backend', 'Core', 'lbl', 'Location', 'location', '2015-09-25 08:02:40'),
(437, 1, 'en', 'Backend', 'Core', 'lbl', 'Login', 'login', '2015-09-25 08:02:40'),
(438, 1, 'en', 'Backend', 'Core', 'lbl', 'LoginBox', 'login box', '2015-09-25 08:02:40'),
(439, 1, 'en', 'Backend', 'Core', 'lbl', 'LoginDetails', 'login details', '2015-09-25 08:02:40'),
(440, 1, 'en', 'Backend', 'Core', 'lbl', 'Logout', 'logout', '2015-09-25 08:02:40'),
(441, 1, 'en', 'Backend', 'Core', 'lbl', 'LongDateFormat', 'long date format', '2015-09-25 08:02:40'),
(442, 1, 'en', 'Backend', 'Core', 'lbl', 'LT', 'Lithuanian', '2015-09-25 08:02:40'),
(443, 1, 'en', 'Backend', 'Core', 'lbl', 'Mailmotor', 'mailmotor', '2015-09-25 08:02:40'),
(444, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorClicks', 'clicks', '2015-09-25 08:02:40'),
(445, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorGroups', 'groups', '2015-09-25 08:02:40'),
(446, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorLatestMailing', 'last sent mailing', '2015-09-25 08:02:40'),
(447, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorOpened', 'opened', '2015-09-25 08:02:40'),
(448, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorSendDate', 'send date', '2015-09-25 08:02:40'),
(449, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorSent', 'sent', '2015-09-25 08:02:40'),
(450, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorStatistics', 'statistics', '2015-09-25 08:02:40'),
(451, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorSubscriptions', 'subscriptions', '2015-09-25 08:02:40'),
(452, 1, 'en', 'Backend', 'Core', 'lbl', 'MailmotorUnsubscriptions', 'unsubscriptions', '2015-09-25 08:02:40'),
(453, 1, 'en', 'Backend', 'Core', 'lbl', 'MainContent', 'main content', '2015-09-25 08:02:40'),
(454, 1, 'en', 'Backend', 'Core', 'lbl', 'MarkAsSpam', 'mark as spam', '2015-09-25 08:02:40'),
(455, 1, 'en', 'Backend', 'Core', 'lbl', 'Marketing', 'marketing', '2015-09-25 08:02:40'),
(456, 1, 'en', 'Backend', 'Core', 'lbl', 'Meta', 'meta', '2015-09-25 08:02:40'),
(457, 1, 'en', 'Backend', 'Core', 'lbl', 'MetaData', 'metadata', '2015-09-25 08:02:40'),
(458, 1, 'en', 'Backend', 'Core', 'lbl', 'MetaInformation', 'meta information', '2015-09-25 08:02:40'),
(459, 1, 'en', 'Backend', 'Core', 'lbl', 'MetaNavigation', 'meta navigation', '2015-09-25 08:02:40'),
(460, 1, 'en', 'Backend', 'Core', 'lbl', 'Moderate', 'moderate', '2015-09-25 08:02:40'),
(461, 1, 'en', 'Backend', 'Core', 'lbl', 'Moderation', 'moderation', '2015-09-25 08:02:40'),
(462, 1, 'en', 'Backend', 'Core', 'lbl', 'Module', 'module', '2015-09-25 08:02:40'),
(463, 1, 'en', 'Backend', 'Core', 'lbl', 'Modules', 'modules', '2015-09-25 08:02:40'),
(464, 1, 'en', 'Backend', 'Core', 'lbl', 'ModuleSettings', 'module settings', '2015-09-25 08:02:40'),
(465, 1, 'en', 'Backend', 'Core', 'lbl', 'More', 'more', '2015-09-25 08:02:40'),
(466, 1, 'en', 'Backend', 'Core', 'lbl', 'MostReadQuestions', 'most read questions', '2015-09-25 08:02:40'),
(467, 1, 'en', 'Backend', 'Core', 'lbl', 'Move', 'move', '2015-09-25 08:02:40'),
(468, 1, 'en', 'Backend', 'Core', 'lbl', 'MoveToModeration', 'move to moderation', '2015-09-25 08:02:40'),
(469, 1, 'en', 'Backend', 'Core', 'lbl', 'MoveToPublished', 'move to published', '2015-09-25 08:02:40'),
(470, 1, 'en', 'Backend', 'Core', 'lbl', 'MoveToSpam', 'move to spam', '2015-09-25 08:02:40'),
(471, 1, 'en', 'Backend', 'Core', 'lbl', 'Name', 'name', '2015-09-25 08:02:40'),
(472, 1, 'en', 'Backend', 'Core', 'lbl', 'Navigation', 'navigation', '2015-09-25 08:02:40'),
(473, 1, 'en', 'Backend', 'Core', 'lbl', 'NavigationTitle', 'navigation title', '2015-09-25 08:02:40'),
(474, 1, 'en', 'Backend', 'Core', 'lbl', 'Never', 'never', '2015-09-25 08:02:40'),
(475, 1, 'en', 'Backend', 'Core', 'lbl', 'NewPassword', 'new password', '2015-09-25 08:02:40'),
(476, 1, 'en', 'Backend', 'Core', 'lbl', 'News', 'news', '2015-09-25 08:02:40'),
(477, 1, 'en', 'Backend', 'Core', 'lbl', 'Newsletters', 'mailings', '2015-09-25 08:02:40'),
(478, 1, 'en', 'Backend', 'Core', 'lbl', 'Next', 'next', '2015-09-25 08:02:40'),
(479, 1, 'en', 'Backend', 'Core', 'lbl', 'NextPage', 'next page', '2015-09-25 08:02:40'),
(480, 1, 'en', 'Backend', 'Core', 'lbl', 'Nickname', 'publication name', '2015-09-25 08:02:40'),
(481, 1, 'en', 'Backend', 'Core', 'lbl', 'NL', 'Dutch', '2015-09-25 08:02:40'),
(482, 1, 'en', 'Backend', 'Core', 'lbl', 'None', 'none', '2015-09-25 08:02:40'),
(483, 1, 'en', 'Backend', 'Core', 'lbl', 'NoPreviousLogin', 'no previous login', '2015-09-25 08:02:40'),
(484, 1, 'en', 'Backend', 'Core', 'lbl', 'NoTheme', 'no theme', '2015-09-25 08:02:40'),
(485, 1, 'en', 'Backend', 'Core', 'lbl', 'Notifications', 'notifications', '2015-09-25 08:02:40'),
(486, 1, 'en', 'Backend', 'Core', 'lbl', 'Number', 'number', '2015-09-25 08:02:40'),
(487, 1, 'en', 'Backend', 'Core', 'lbl', 'NumberFormat', 'number format', '2015-09-25 08:02:40'),
(488, 1, 'en', 'Backend', 'Core', 'lbl', 'NumberOfPositions', 'number of positions', '2015-09-25 08:02:40'),
(489, 1, 'en', 'Backend', 'Core', 'lbl', 'Numbers', 'numbers', '2015-09-25 08:02:40'),
(490, 1, 'en', 'Backend', 'Core', 'lbl', 'OK', 'OK', '2015-09-25 08:02:40'),
(491, 1, 'en', 'Backend', 'Core', 'lbl', 'Or', 'or', '2015-09-25 08:02:40'),
(492, 1, 'en', 'Backend', 'Core', 'lbl', 'Overview', 'overview', '2015-09-25 08:02:40'),
(493, 1, 'en', 'Backend', 'Core', 'lbl', 'Page', 'page', '2015-09-25 08:02:40'),
(494, 1, 'en', 'Backend', 'Core', 'lbl', 'Pages', 'pages', '2015-09-25 08:02:40'),
(495, 1, 'en', 'Backend', 'Core', 'lbl', 'PageTitle', 'pagetitle', '2015-09-25 08:02:40'),
(496, 1, 'en', 'Backend', 'Core', 'lbl', 'Pageviews', 'pageviews', '2015-09-25 08:02:40'),
(497, 1, 'en', 'Backend', 'Core', 'lbl', 'Pagination', 'pagination', '2015-09-25 08:02:40'),
(498, 1, 'en', 'Backend', 'Core', 'lbl', 'Password', 'password', '2015-09-25 08:02:40'),
(499, 1, 'en', 'Backend', 'Core', 'lbl', 'PasswordStrength', 'password strength', '2015-09-25 08:02:40'),
(500, 1, 'en', 'Backend', 'Core', 'lbl', 'PerDay', 'per day', '2015-09-25 08:02:40'),
(501, 1, 'en', 'Backend', 'Core', 'lbl', 'Permissions', 'permissions', '2015-09-25 08:02:40'),
(502, 1, 'en', 'Backend', 'Core', 'lbl', 'Person', 'person', '2015-09-25 08:02:40'),
(503, 1, 'en', 'Backend', 'Core', 'lbl', 'PersonalInformation', 'personal information', '2015-09-25 08:02:40'),
(504, 1, 'en', 'Backend', 'Core', 'lbl', 'Persons', 'people', '2015-09-25 08:02:40'),
(505, 1, 'en', 'Backend', 'Core', 'lbl', 'PerVisit', 'per visit', '2015-09-25 08:02:40'),
(506, 1, 'en', 'Backend', 'Core', 'lbl', 'PingBlogServices', 'ping blogservices', '2015-09-25 08:02:40'),
(507, 1, 'en', 'Backend', 'Core', 'lbl', 'PL', 'Polish', '2015-09-25 08:02:40'),
(508, 1, 'en', 'Backend', 'Core', 'lbl', 'Port', 'port', '2015-09-25 08:02:40'),
(509, 1, 'en', 'Backend', 'Core', 'lbl', 'Position', 'position', '2015-09-25 08:02:40'),
(510, 1, 'en', 'Backend', 'Core', 'lbl', 'Positions', 'positions', '2015-09-25 08:02:40'),
(511, 1, 'en', 'Backend', 'Core', 'lbl', 'Preview', 'preview', '2015-09-25 08:02:40');
INSERT INTO `locale` (`id`, `user_id`, `language`, `application`, `module`, `type`, `name`, `value`, `edited_on`) VALUES
(512, 1, 'en', 'Backend', 'Core', 'lbl', 'Previous', 'previous', '2015-09-25 08:02:40'),
(513, 1, 'en', 'Backend', 'Core', 'lbl', 'PreviousPage', 'previous page', '2015-09-25 08:02:40'),
(514, 1, 'en', 'Backend', 'Core', 'lbl', 'PreviousVersions', 'previous versions', '2015-09-25 08:02:40'),
(515, 1, 'en', 'Backend', 'Core', 'lbl', 'Price', 'price', '2015-09-25 08:02:40'),
(516, 1, 'en', 'Backend', 'Core', 'lbl', 'Profile', 'profile', '2015-09-25 08:02:40'),
(517, 1, 'en', 'Backend', 'Core', 'lbl', 'Profiles', 'profiles', '2015-09-25 08:02:40'),
(518, 1, 'en', 'Backend', 'Core', 'lbl', 'Publish', 'publish', '2015-09-25 08:02:40'),
(519, 1, 'en', 'Backend', 'Core', 'lbl', 'Published', 'published', '2015-09-25 08:02:40'),
(520, 1, 'en', 'Backend', 'Core', 'lbl', 'PublishedArticles', 'published articles', '2015-09-25 08:02:40'),
(521, 1, 'en', 'Backend', 'Core', 'lbl', 'PublishedOn', 'published on', '2015-09-25 08:02:40'),
(522, 1, 'en', 'Backend', 'Core', 'lbl', 'PublishOn', 'publish on', '2015-09-25 08:02:40'),
(523, 1, 'en', 'Backend', 'Core', 'lbl', 'QuantityNo', 'no', '2015-09-25 08:02:40'),
(524, 1, 'en', 'Backend', 'Core', 'lbl', 'Questions', 'questions', '2015-09-25 08:02:40'),
(525, 1, 'en', 'Backend', 'Core', 'lbl', 'RecentArticlesFull', 'recent articles (full)', '2015-09-25 08:02:40'),
(526, 1, 'en', 'Backend', 'Core', 'lbl', 'RecentArticlesList', 'recent articles (list)', '2015-09-25 08:02:40'),
(527, 1, 'en', 'Backend', 'Core', 'lbl', 'RecentComments', 'recent comments', '2015-09-25 08:02:40'),
(528, 1, 'en', 'Backend', 'Core', 'lbl', 'RecentlyEdited', 'recently edited', '2015-09-25 08:02:40'),
(529, 1, 'en', 'Backend', 'Core', 'lbl', 'RecentVisits', 'recent visits', '2015-09-25 08:02:40'),
(530, 1, 'en', 'Backend', 'Core', 'lbl', 'ReferenceCode', 'reference code', '2015-09-25 08:02:40'),
(531, 1, 'en', 'Backend', 'Core', 'lbl', 'Referrer', 'referrer', '2015-09-25 08:02:40'),
(532, 1, 'en', 'Backend', 'Core', 'lbl', 'Register', 'register', '2015-09-25 08:02:40'),
(533, 1, 'en', 'Backend', 'Core', 'lbl', 'Related', 'related', '2015-09-25 08:02:40'),
(534, 1, 'en', 'Backend', 'Core', 'lbl', 'RepeatPassword', 'repeat password', '2015-09-25 08:02:40'),
(535, 1, 'en', 'Backend', 'Core', 'lbl', 'ReplyTo', 'reply-to', '2015-09-25 08:02:40'),
(536, 1, 'en', 'Backend', 'Core', 'lbl', 'RequiredField', 'required field', '2015-09-25 08:02:40'),
(537, 1, 'en', 'Backend', 'Core', 'lbl', 'ResendActivation', 'resend activation e-mail', '2015-09-25 08:02:40'),
(538, 1, 'en', 'Backend', 'Core', 'lbl', 'ResetAndSignIn', 'reset and sign in', '2015-09-25 08:02:40'),
(539, 1, 'en', 'Backend', 'Core', 'lbl', 'ResetPassword', 'reset password', '2015-09-25 08:02:40'),
(540, 1, 'en', 'Backend', 'Core', 'lbl', 'ResetYourPassword', 'reset your password', '2015-09-25 08:02:40'),
(541, 1, 'en', 'Backend', 'Core', 'lbl', 'RO', 'Romanian', '2015-09-25 08:02:40'),
(542, 1, 'en', 'Backend', 'Core', 'lbl', 'RSSFeed', 'RSS feed', '2015-09-25 08:02:40'),
(543, 1, 'en', 'Backend', 'Core', 'lbl', 'RU', 'Russian', '2015-09-25 08:02:40'),
(544, 1, 'en', 'Backend', 'Core', 'lbl', 'Save', 'save', '2015-09-25 08:02:40'),
(545, 1, 'en', 'Backend', 'Core', 'lbl', 'SaveDraft', 'save draft', '2015-09-25 08:02:40'),
(546, 1, 'en', 'Backend', 'Core', 'lbl', 'Scripts', 'scripts', '2015-09-25 08:02:40'),
(547, 1, 'en', 'Backend', 'Core', 'lbl', 'Search', 'search', '2015-09-25 08:02:40'),
(548, 1, 'en', 'Backend', 'Core', 'lbl', 'SearchAgain', 'search again', '2015-09-25 08:02:40'),
(549, 1, 'en', 'Backend', 'Core', 'lbl', 'SearchForm', 'search form', '2015-09-25 08:02:40'),
(550, 1, 'en', 'Backend', 'Core', 'lbl', 'Send', 'send', '2015-09-25 08:02:40'),
(551, 1, 'en', 'Backend', 'Core', 'lbl', 'SendingEmails', 'sending e-mails', '2015-09-25 08:02:40'),
(552, 1, 'en', 'Backend', 'Core', 'lbl', 'SentMailings', 'sent mailings', '2015-09-25 08:02:40'),
(553, 1, 'en', 'Backend', 'Core', 'lbl', 'SentOn', 'sent on', '2015-09-25 08:02:40'),
(554, 1, 'en', 'Backend', 'Core', 'lbl', 'SEO', 'SEO', '2015-09-25 08:02:40'),
(555, 1, 'en', 'Backend', 'Core', 'lbl', 'Server', 'server', '2015-09-25 08:02:40'),
(556, 1, 'en', 'Backend', 'Core', 'lbl', 'Settings', 'settings', '2015-09-25 08:02:40'),
(557, 1, 'en', 'Backend', 'Core', 'lbl', 'ShortDateFormat', 'short date format', '2015-09-25 08:02:40'),
(558, 1, 'en', 'Backend', 'Core', 'lbl', 'SignIn', 'log in', '2015-09-25 08:02:40'),
(559, 1, 'en', 'Backend', 'Core', 'lbl', 'SignOut', 'sign out', '2015-09-25 08:02:40'),
(560, 1, 'en', 'Backend', 'Core', 'lbl', 'Sitemap', 'sitemap', '2015-09-25 08:02:40'),
(561, 1, 'en', 'Backend', 'Core', 'lbl', 'SMTP', 'SMTP', '2015-09-25 08:02:40'),
(562, 1, 'en', 'Backend', 'Core', 'lbl', 'SortAscending', 'sort ascending', '2015-09-25 08:02:40'),
(563, 1, 'en', 'Backend', 'Core', 'lbl', 'SortDescending', 'sort descending', '2015-09-25 08:02:40'),
(564, 1, 'en', 'Backend', 'Core', 'lbl', 'SortedAscending', 'sorted ascending', '2015-09-25 08:02:40'),
(565, 1, 'en', 'Backend', 'Core', 'lbl', 'SortedDescending', 'sorted descending', '2015-09-25 08:02:40'),
(566, 1, 'en', 'Backend', 'Core', 'lbl', 'Source', 'source', '2015-09-25 08:02:40'),
(567, 1, 'en', 'Backend', 'Core', 'lbl', 'Spam', 'spam', '2015-09-25 08:02:40'),
(568, 1, 'en', 'Backend', 'Core', 'lbl', 'SpamFilter', 'spamfilter', '2015-09-25 08:02:40'),
(569, 1, 'en', 'Backend', 'Core', 'lbl', 'SplitCharacter', 'split character', '2015-09-25 08:02:40'),
(570, 1, 'en', 'Backend', 'Core', 'lbl', 'StartDate', 'start date', '2015-09-25 08:02:40'),
(571, 1, 'en', 'Backend', 'Core', 'lbl', 'Statistics', 'statistics', '2015-09-25 08:02:40'),
(572, 1, 'en', 'Backend', 'Core', 'lbl', 'Status', 'status', '2015-09-25 08:02:40'),
(573, 1, 'en', 'Backend', 'Core', 'lbl', 'Street', 'street', '2015-09-25 08:02:40'),
(574, 1, 'en', 'Backend', 'Core', 'lbl', 'Strong', 'strong', '2015-09-25 08:02:40'),
(575, 1, 'en', 'Backend', 'Core', 'lbl', 'Subpages', 'subpages', '2015-09-25 08:02:40'),
(576, 1, 'en', 'Backend', 'Core', 'lbl', 'SubscribeForm', 'subscribe form', '2015-09-25 08:02:40'),
(577, 1, 'en', 'Backend', 'Core', 'lbl', 'Subscriptions', 'subscriptions', '2015-09-25 08:02:40'),
(578, 1, 'en', 'Backend', 'Core', 'lbl', 'Summary', 'summary', '2015-09-25 08:02:40'),
(579, 1, 'en', 'Backend', 'Core', 'lbl', 'Surname', 'surname', '2015-09-25 08:02:40'),
(580, 1, 'en', 'Backend', 'Core', 'lbl', 'SV', 'Swedish', '2015-09-25 08:02:40'),
(581, 1, 'en', 'Backend', 'Core', 'lbl', 'Synonym', 'synonym', '2015-09-25 08:02:40'),
(582, 1, 'en', 'Backend', 'Core', 'lbl', 'Synonyms', 'synonyms', '2015-09-25 08:02:40'),
(583, 1, 'en', 'Backend', 'Core', 'lbl', 'TagCloud', 'tagcloud', '2015-09-25 08:02:40'),
(584, 1, 'en', 'Backend', 'Core', 'lbl', 'Tags', 'tags', '2015-09-25 08:02:40'),
(585, 1, 'en', 'Backend', 'Core', 'lbl', 'Template', 'template', '2015-09-25 08:02:40'),
(586, 1, 'en', 'Backend', 'Core', 'lbl', 'Templates', 'templates', '2015-09-25 08:02:40'),
(587, 1, 'en', 'Backend', 'Core', 'lbl', 'Term', 'term', '2015-09-25 08:02:40'),
(588, 1, 'en', 'Backend', 'Core', 'lbl', 'Text', 'text', '2015-09-25 08:02:40'),
(589, 1, 'en', 'Backend', 'Core', 'lbl', 'Themes', 'themes', '2015-09-25 08:02:40'),
(590, 1, 'en', 'Backend', 'Core', 'lbl', 'ThemesSelection', 'theme selection', '2015-09-25 08:02:40'),
(591, 1, 'en', 'Backend', 'Core', 'lbl', 'Till', 'till', '2015-09-25 08:02:40'),
(592, 1, 'en', 'Backend', 'Core', 'lbl', 'TimeFormat', 'time format', '2015-09-25 08:02:40'),
(593, 1, 'en', 'Backend', 'Core', 'lbl', 'Timezone', 'timezone', '2015-09-25 08:02:40'),
(594, 1, 'en', 'Backend', 'Core', 'lbl', 'Title', 'title', '2015-09-25 08:02:40'),
(595, 1, 'en', 'Backend', 'Core', 'lbl', 'Titles', 'titles', '2015-09-25 08:02:40'),
(596, 1, 'en', 'Backend', 'Core', 'lbl', 'To', 'to', '2015-09-25 08:02:40'),
(597, 1, 'en', 'Backend', 'Core', 'lbl', 'Today', 'today', '2015-09-25 08:02:40'),
(598, 1, 'en', 'Backend', 'Core', 'lbl', 'ToStep', 'to step', '2015-09-25 08:02:40'),
(599, 1, 'en', 'Backend', 'Core', 'lbl', 'TR', 'Turkish', '2015-09-25 08:02:40'),
(600, 1, 'en', 'Backend', 'Core', 'lbl', 'TrafficSources', 'traffic sources', '2015-09-25 08:02:40'),
(601, 1, 'en', 'Backend', 'Core', 'lbl', 'Translation', 'translation', '2015-09-25 08:02:40'),
(602, 1, 'en', 'Backend', 'Core', 'lbl', 'Translations', 'translations', '2015-09-25 08:02:40'),
(603, 1, 'en', 'Backend', 'Core', 'lbl', 'Type', 'type', '2015-09-25 08:02:40'),
(604, 1, 'en', 'Backend', 'Core', 'lbl', 'UK', 'Ukrainian', '2015-09-25 08:02:40'),
(605, 1, 'en', 'Backend', 'Core', 'lbl', 'UnsubscribeForm', 'unsubscribe form', '2015-09-25 08:02:40'),
(606, 1, 'en', 'Backend', 'Core', 'lbl', 'Unsubscriptions', 'unsubscriptions', '2015-09-25 08:02:40'),
(607, 1, 'en', 'Backend', 'Core', 'lbl', 'UpdateFilter', 'update filter', '2015-09-25 08:02:40'),
(608, 1, 'en', 'Backend', 'Core', 'lbl', 'URL', 'URL', '2015-09-25 08:02:40'),
(609, 1, 'en', 'Backend', 'Core', 'lbl', 'UsedIn', 'used in', '2015-09-25 08:02:40'),
(610, 1, 'en', 'Backend', 'Core', 'lbl', 'Userguide', 'userguide', '2015-09-25 08:02:40'),
(611, 1, 'en', 'Backend', 'Core', 'lbl', 'Username', 'username', '2015-09-25 08:02:40'),
(612, 1, 'en', 'Backend', 'Core', 'lbl', 'Users', 'users', '2015-09-25 08:02:40'),
(613, 1, 'en', 'Backend', 'Core', 'lbl', 'UseThisDraft', 'use this draft', '2015-09-25 08:02:40'),
(614, 1, 'en', 'Backend', 'Core', 'lbl', 'UseThisVersion', 'use this version', '2015-09-25 08:02:40'),
(615, 1, 'en', 'Backend', 'Core', 'lbl', 'Value', 'value', '2015-09-25 08:02:40'),
(616, 1, 'en', 'Backend', 'Core', 'lbl', 'Versions', 'versions', '2015-09-25 08:02:40'),
(617, 1, 'en', 'Backend', 'Core', 'lbl', 'View', 'view', '2015-09-25 08:02:40'),
(618, 1, 'en', 'Backend', 'Core', 'lbl', 'ViewReport', 'view report', '2015-09-25 08:02:40'),
(619, 1, 'en', 'Backend', 'Core', 'lbl', 'VisibleOnSite', 'visible on site', '2015-09-25 08:02:40'),
(620, 1, 'en', 'Backend', 'Core', 'lbl', 'Visitors', 'visitors', '2015-09-25 08:02:40'),
(621, 1, 'en', 'Backend', 'Core', 'lbl', 'VisitWebsite', 'visit website', '2015-09-25 08:02:40'),
(622, 1, 'en', 'Backend', 'Core', 'lbl', 'WaitingForModeration', 'waiting for moderation', '2015-09-25 08:02:40'),
(623, 1, 'en', 'Backend', 'Core', 'lbl', 'Weak', 'weak', '2015-09-25 08:02:40'),
(624, 1, 'en', 'Backend', 'Core', 'lbl', 'WebmasterEmail', 'e-mail webmaster', '2015-09-25 08:02:40'),
(625, 1, 'en', 'Backend', 'Core', 'lbl', 'Website', 'website', '2015-09-25 08:02:40'),
(626, 1, 'en', 'Backend', 'Core', 'lbl', 'WebsiteTitle', 'website title', '2015-09-25 08:02:40'),
(627, 1, 'en', 'Backend', 'Core', 'lbl', 'Weight', 'weight', '2015-09-25 08:02:40'),
(628, 1, 'en', 'Backend', 'Core', 'lbl', 'WhichModule', 'which module', '2015-09-25 08:02:40'),
(629, 1, 'en', 'Backend', 'Core', 'lbl', 'WhichWidget', 'which widget', '2015-09-25 08:02:40'),
(630, 1, 'en', 'Backend', 'Core', 'lbl', 'Widget', 'widget', '2015-09-25 08:02:40'),
(631, 1, 'en', 'Backend', 'Core', 'lbl', 'Widgets', 'widgets', '2015-09-25 08:02:40'),
(632, 1, 'en', 'Backend', 'Core', 'lbl', 'Width', 'width', '2015-09-25 08:02:40'),
(633, 1, 'en', 'Backend', 'Core', 'lbl', 'WithSelected', 'with selected', '2015-09-25 08:02:40'),
(634, 1, 'en', 'Backend', 'Core', 'lbl', 'ZH', 'Chinese', '2015-09-25 08:02:40'),
(635, 1, 'en', 'Backend', 'Core', 'lbl', 'Zip', 'zip code', '2015-09-25 08:02:40'),
(636, 1, 'en', 'Backend', 'Core', 'msg', 'ACT', 'action', '2015-09-25 08:02:40'),
(637, 1, 'en', 'Backend', 'Core', 'msg', 'Added', 'The item was added.', '2015-09-25 08:02:40'),
(638, 1, 'en', 'Backend', 'Core', 'msg', 'AddedCategory', 'The category "%1$s" was added.', '2015-09-25 08:02:40'),
(639, 1, 'en', 'Backend', 'Core', 'msg', 'AllAddresses', 'All addresses sorted by subscription date.', '2015-09-25 08:02:40'),
(640, 1, 'en', 'Backend', 'Core', 'msg', 'BG', 'Bulgarian', '2015-09-25 08:02:40'),
(641, 1, 'en', 'Backend', 'Core', 'msg', 'ChangedOrderSuccessfully', 'Changed order successfully.', '2015-09-25 08:02:40'),
(642, 1, 'en', 'Backend', 'Core', 'msg', 'ClickToEdit', 'Click to edit', '2015-09-25 08:02:40'),
(643, 1, 'en', 'Backend', 'Core', 'msg', 'CN', 'Chinese', '2015-09-25 08:02:40'),
(644, 1, 'en', 'Backend', 'Core', 'msg', 'CommentDeleted', 'The comment was deleted.', '2015-09-25 08:02:40'),
(645, 1, 'en', 'Backend', 'Core', 'msg', 'CommentMovedModeration', 'The comment was moved to moderation.', '2015-09-25 08:02:40'),
(646, 1, 'en', 'Backend', 'Core', 'msg', 'CommentMovedPublished', 'The comment was published.', '2015-09-25 08:02:40'),
(647, 1, 'en', 'Backend', 'Core', 'msg', 'CommentMovedSpam', 'The comment was marked as spam.', '2015-09-25 08:02:40'),
(648, 1, 'en', 'Backend', 'Core', 'msg', 'CommentsDeleted', 'The comments were deleted.', '2015-09-25 08:02:40'),
(649, 1, 'en', 'Backend', 'Core', 'msg', 'CommentsMovedModeration', 'The comments were moved to moderation.', '2015-09-25 08:02:40'),
(650, 1, 'en', 'Backend', 'Core', 'msg', 'CommentsMovedPublished', 'The comments were published.', '2015-09-25 08:02:40'),
(651, 1, 'en', 'Backend', 'Core', 'msg', 'CommentsMovedSpam', 'The comments were marked as spam.', '2015-09-25 08:02:40'),
(652, 1, 'en', 'Backend', 'Core', 'msg', 'CommentsToModerate', '%1$s comment(s) to moderate.', '2015-09-25 08:02:40'),
(653, 1, 'en', 'Backend', 'Core', 'msg', 'ConfigurationError', 'Some settings aren''t configured yet:', '2015-09-25 08:02:40'),
(654, 1, 'en', 'Backend', 'Core', 'msg', 'ConfirmDelete', 'Are you sure you want to delete the item "%1$s"?', '2015-09-25 08:02:40'),
(655, 1, 'en', 'Backend', 'Core', 'msg', 'ConfirmDeleteCategory', 'Are you sure you want to delete the category "%1$s"?', '2015-09-25 08:02:40'),
(656, 1, 'en', 'Backend', 'Core', 'msg', 'ConfirmMassDelete', 'Are your sure you want to delete this/these item(s)?', '2015-09-25 08:02:40'),
(657, 1, 'en', 'Backend', 'Core', 'msg', 'ConfirmMassSpam', 'Are your sure you want to mark this/these item(s) as spam?', '2015-09-25 08:02:40'),
(658, 1, 'en', 'Backend', 'Core', 'msg', 'DE', 'German', '2015-09-25 08:02:40'),
(659, 1, 'en', 'Backend', 'Core', 'msg', 'Deleted', 'The item was deleted.', '2015-09-25 08:02:40'),
(660, 1, 'en', 'Backend', 'Core', 'msg', 'DeletedCategory', 'The category "%1$s" was deleted.', '2015-09-25 08:02:40'),
(661, 1, 'en', 'Backend', 'Core', 'msg', 'EditCategory', 'edit category "%1$s"', '2015-09-25 08:02:40'),
(662, 1, 'en', 'Backend', 'Core', 'msg', 'EditComment', 'edit comment', '2015-09-25 08:02:40'),
(663, 1, 'en', 'Backend', 'Core', 'msg', 'Edited', 'The item was saved.', '2015-09-25 08:02:40'),
(664, 1, 'en', 'Backend', 'Core', 'msg', 'EditedCategory', 'The category "%1$s" was saved.', '2015-09-25 08:02:40'),
(665, 1, 'en', 'Backend', 'Core', 'msg', 'EditorImagesWithoutAlt', 'There are images without an alt-attribute.', '2015-09-25 08:02:40'),
(666, 1, 'en', 'Backend', 'Core', 'msg', 'EditorInvalidLinks', 'There are invalid links.', '2015-09-25 08:02:40'),
(667, 1, 'en', 'Backend', 'Core', 'msg', 'EditorSelectInternalPage', 'Select internal page', '2015-09-25 08:02:40'),
(668, 1, 'en', 'Backend', 'Core', 'msg', 'EN', 'English', '2015-09-25 08:02:40'),
(669, 1, 'en', 'Backend', 'Core', 'msg', 'ERR', 'error', '2015-09-25 08:02:40'),
(670, 1, 'en', 'Backend', 'Core', 'msg', 'ES', 'Spanish', '2015-09-25 08:02:40'),
(671, 1, 'en', 'Backend', 'Core', 'msg', 'ForgotPassword', 'Forgot password?', '2015-09-25 08:02:40'),
(672, 1, 'en', 'Backend', 'Core', 'msg', 'FR', 'French', '2015-09-25 08:02:40'),
(673, 1, 'en', 'Backend', 'Core', 'msg', 'HelpAvatar', 'A square picture produces the best results.', '2015-09-25 08:02:40'),
(674, 1, 'en', 'Backend', 'Core', 'msg', 'HelpBlogger', 'Select the file that you exported from <a href="http://blogger.com">Blogger</a>.', '2015-09-25 08:02:40'),
(675, 1, 'en', 'Backend', 'Core', 'msg', 'HelpDrafts', 'Here you can see your draft. These are temporary versions.', '2015-09-25 08:02:40'),
(676, 1, 'en', 'Backend', 'Core', 'msg', 'HelpEmailFrom', 'E-mails sent from the CMS use these settings.', '2015-09-25 08:02:40'),
(677, 1, 'en', 'Backend', 'Core', 'msg', 'HelpEmailTo', 'Notifications from the CMS are sent here.', '2015-09-25 08:02:40'),
(678, 1, 'en', 'Backend', 'Core', 'msg', 'HelpFileFieldWithMaxFileSize', 'Only files with the extension %1$s are allowed, maximum file size: %2$s.', '2015-09-25 08:02:40'),
(679, 1, 'en', 'Backend', 'Core', 'msg', 'HelpForgotPassword', 'Below enter your e-mail. You will receive an e-mail containing instructions on how to get a new password.', '2015-09-25 08:02:40'),
(680, 1, 'en', 'Backend', 'Core', 'msg', 'HelpImageFieldWithMaxFileSize', 'Only jp(e)g, gif or png-files are allowed, maximum filesize: %1$s.', '2015-09-25 08:02:40'),
(681, 1, 'en', 'Backend', 'Core', 'msg', 'HelpMaxFileSize', 'maximum filesize: %1$s', '2015-09-25 08:02:40'),
(682, 1, 'en', 'Backend', 'Core', 'msg', 'HelpMetaCustom', 'These custom metatags will be placed in the <code><head></code> section of the page.', '2015-09-25 08:02:40'),
(683, 1, 'en', 'Backend', 'Core', 'msg', 'HelpMetaDescription', 'Briefly summarize the content. This summary is shown in the results of search engines.', '2015-09-25 08:02:40'),
(684, 1, 'en', 'Backend', 'Core', 'msg', 'HelpMetaKeywords', 'Choose a number of wellthought terms that describe the content. From an SEO point of view, these do not longer present an added value though.', '2015-09-25 08:02:40'),
(685, 1, 'en', 'Backend', 'Core', 'msg', 'HelpMetaURL', 'Replace the automaticly generated URL by a custom one.', '2015-09-25 08:02:40'),
(686, 1, 'en', 'Backend', 'Core', 'msg', 'HelpNickname', 'The name you want to be published as (e.g. as the author of an article).', '2015-09-25 08:02:40'),
(687, 1, 'en', 'Backend', 'Core', 'msg', 'HelpPageTitle', 'The title in the browser window (<code>&lt;title&gt;</code>).', '2015-09-25 08:02:40'),
(688, 1, 'en', 'Backend', 'Core', 'msg', 'HelpResetPassword', 'Provide your new password.', '2015-09-25 08:02:40'),
(689, 1, 'en', 'Backend', 'Core', 'msg', 'HelpRevisions', 'The last saved versions are kept here. The current version will only be overwritten when you save your changes.', '2015-09-25 08:02:40'),
(690, 1, 'en', 'Backend', 'Core', 'msg', 'HelpRSSDescription', 'Briefly describe what kind of content the RSS feed will contain.', '2015-09-25 08:02:40'),
(691, 1, 'en', 'Backend', 'Core', 'msg', 'HelpRSSTitle', 'Provide a clear title for the RSS feed.', '2015-09-25 08:02:40'),
(692, 1, 'en', 'Backend', 'Core', 'msg', 'HelpSMTPServer', 'Mailserver that should be used for sending e-mails.', '2015-09-25 08:02:40'),
(693, 1, 'en', 'Backend', 'Core', 'msg', 'HU', 'Hungarian', '2015-09-25 08:02:40'),
(694, 1, 'en', 'Backend', 'Core', 'msg', 'Imported', 'The data was imported.', '2015-09-25 08:02:40'),
(695, 1, 'en', 'Backend', 'Core', 'msg', 'IT', 'Italian', '2015-09-25 08:02:40'),
(696, 1, 'en', 'Backend', 'Core', 'msg', 'LBL', 'label', '2015-09-25 08:02:40'),
(697, 1, 'en', 'Backend', 'Core', 'msg', 'LoginFormForgotPasswordSuccess', '<strong>Mail sent.</strong> Please check your inbox!', '2015-09-25 08:02:40'),
(698, 1, 'en', 'Backend', 'Core', 'msg', 'MSG', 'message', '2015-09-25 08:02:40'),
(699, 1, 'en', 'Backend', 'Core', 'msg', 'NL', 'Dutch', '2015-09-25 08:02:40'),
(700, 1, 'en', 'Backend', 'Core', 'msg', 'NoAkismetKey', 'If you want to enable the spam-protection you should <a href="%1$s">configure</a> an Akismet-key.', '2015-09-25 08:02:40'),
(701, 1, 'en', 'Backend', 'Core', 'msg', 'NoComments', 'There are no comments in this category yet.', '2015-09-25 08:02:40'),
(702, 1, 'en', 'Backend', 'Core', 'msg', 'NoEmailaddresses', 'No email addresses.', '2015-09-25 08:02:40'),
(703, 1, 'en', 'Backend', 'Core', 'msg', 'NoFeedback', 'There is no feedback yet.', '2015-09-25 08:02:40'),
(704, 1, 'en', 'Backend', 'Core', 'msg', 'NoItems', 'There are no items yet.', '2015-09-25 08:02:40'),
(705, 1, 'en', 'Backend', 'Core', 'msg', 'NoKeywords', 'There are no keywords yet.', '2015-09-25 08:02:40'),
(706, 1, 'en', 'Backend', 'Core', 'msg', 'NoPublishedComments', 'There are no published comments.', '2015-09-25 08:02:40'),
(707, 1, 'en', 'Backend', 'Core', 'msg', 'NoReferrers', 'There are no referrers yet.', '2015-09-25 08:02:40'),
(708, 1, 'en', 'Backend', 'Core', 'msg', 'NoRevisions', 'There are no previous versions yet.', '2015-09-25 08:02:40'),
(709, 1, 'en', 'Backend', 'Core', 'msg', 'NoSentMailings', 'No mailings have been sent yet.', '2015-09-25 08:02:40'),
(710, 1, 'en', 'Backend', 'Core', 'msg', 'NoSubscriptions', 'No one subscribed to the mailinglist yet.', '2015-09-25 08:02:40'),
(711, 1, 'en', 'Backend', 'Core', 'msg', 'NoTags', 'You didn''t add tags yet.', '2015-09-25 08:02:40'),
(712, 1, 'en', 'Backend', 'Core', 'msg', 'NoUnsubscriptions', 'No one unsubscribed from from the mailinglist yet.', '2015-09-25 08:02:40'),
(713, 1, 'en', 'Backend', 'Core', 'msg', 'NoUsage', 'Not yet used.', '2015-09-25 08:02:40'),
(714, 1, 'en', 'Backend', 'Core', 'msg', 'NowEditing', 'now editing', '2015-09-25 08:02:40'),
(715, 1, 'en', 'Backend', 'Core', 'msg', 'PasswordResetSuccess', 'Your password has been changed.', '2015-09-25 08:02:40'),
(716, 1, 'en', 'Backend', 'Core', 'msg', 'PL', 'Polish', '2015-09-25 08:02:40'),
(717, 1, 'en', 'Backend', 'Core', 'msg', 'Redirecting', 'You are being redirected.', '2015-09-25 08:02:40'),
(718, 1, 'en', 'Backend', 'Core', 'msg', 'ResetYourPasswordMailContent', 'Reset your password by clicking the link below. If you didn''t ask for this, you can ignore this message.', '2015-09-25 08:02:40'),
(719, 1, 'en', 'Backend', 'Core', 'msg', 'ResetYourPasswordMailSubject', 'Change your password', '2015-09-25 08:02:40'),
(720, 1, 'en', 'Backend', 'Core', 'msg', 'RU', 'Russian', '2015-09-25 08:02:40'),
(721, 1, 'en', 'Backend', 'Core', 'msg', 'Saved', 'The changes were saved.', '2015-09-25 08:02:40'),
(722, 1, 'en', 'Backend', 'Core', 'msg', 'SavedAsDraft', '"%1$s" saved as draft.', '2015-09-25 08:02:40'),
(723, 1, 'en', 'Backend', 'Core', 'msg', 'SequenceSaved', 'Sequence saved', '2015-09-25 08:02:40'),
(724, 1, 'en', 'Backend', 'Core', 'msg', 'TR', 'Turkish', '2015-09-25 08:02:40'),
(725, 1, 'en', 'Backend', 'Core', 'msg', 'UsingADraft', 'You''re using a draft.', '2015-09-25 08:02:40'),
(726, 1, 'en', 'Backend', 'Core', 'msg', 'UsingARevision', 'You''re using an older version. Save to overwrite the current version.', '2015-09-25 08:02:40'),
(727, 1, 'en', 'Backend', 'Core', 'msg', 'ValuesAreChanged', 'Changes will be lost.', '2015-09-25 08:02:40'),
(728, 1, 'en', 'Backend', 'Core', 'err', 'ActionNotAllowed', 'You have insufficient rights for this action.', '2015-09-25 08:02:40'),
(729, 1, 'en', 'Backend', 'Core', 'err', 'AddingCategoryFailed', 'Something went wrong.', '2015-09-25 08:02:40'),
(730, 1, 'en', 'Backend', 'Core', 'err', 'AddTagBeforeSubmitting', 'Add the tag before submitting.', '2015-09-25 08:02:40'),
(731, 1, 'en', 'Backend', 'Core', 'err', 'AkismetKey', 'Akismet API-key is not yet configured. <a href="%1$s">Configure</a>', '2015-09-25 08:02:40'),
(732, 1, 'en', 'Backend', 'Core', 'err', 'AlphaNumericCharactersOnly', 'Only alphanumeric characters are allowed.', '2015-09-25 08:02:40'),
(733, 1, 'en', 'Backend', 'Core', 'err', 'AlterSequenceFailed', 'Alter sequence failed.', '2015-09-25 08:02:40'),
(734, 1, 'en', 'Backend', 'Core', 'err', 'AuthorIsRequired', 'Please provide an author.', '2015-09-25 08:02:40'),
(735, 1, 'en', 'Backend', 'Core', 'err', 'BrowserNotSupported', '<p>You''re using an older browser that is not supported by Fork CMS. Use one of the following alternatives:</p><ul><li><a href="http://www.firefox.com/">Firefox</a>: a very good browser with a lot of free extensions.</li><li><a href="http://www.apple.com/safari">Safari</a>: one of the fastest and most advanced browsers. Good for Mac users.</li><li><a href="http://www.google.com/chrome">Chrome</a>: Google''s browser - also very fast.</li><li><a href="http://www.microsoft.com/windows/products/winfamily/ie/default.mspx">Internet Explorer*</a>: update to the latest version of Internet Explorer.</li></ul>', '2015-09-25 08:02:40'),
(736, 1, 'en', 'Backend', 'Core', 'err', 'CookiesNotEnabled', 'You need to enable cookies in order to use Fork CMS. Activate cookies and refresh this page.', '2015-09-25 08:02:40'),
(737, 1, 'en', 'Backend', 'Core', 'err', 'DateIsInvalid', 'Invalid date.', '2015-09-25 08:02:40'),
(738, 1, 'en', 'Backend', 'Core', 'err', 'DateRangeIsInvalid', 'Invalid date range.', '2015-09-25 08:02:40'),
(739, 1, 'en', 'Backend', 'Core', 'err', 'DebugModeIsActive', 'Debug-mode is active.', '2015-09-25 08:02:40'),
(740, 1, 'en', 'Backend', 'Core', 'err', 'EmailAlreadyExists', 'This e-mailaddress is in use.', '2015-09-25 08:02:40'),
(741, 1, 'en', 'Backend', 'Core', 'err', 'EmailIsInvalid', 'Please provide a valid e-mailaddress.', '2015-09-25 08:02:40'),
(742, 1, 'en', 'Backend', 'Core', 'err', 'EmailIsRequired', 'Please provide a valid e-mailaddress.', '2015-09-25 08:02:40'),
(743, 1, 'en', 'Backend', 'Core', 'err', 'EmailIsUnknown', 'This e-mailaddress is not in our database.', '2015-09-25 08:02:40'),
(744, 1, 'en', 'Backend', 'Core', 'err', 'EndDateIsInvalid', 'Invalid end date.', '2015-09-25 08:02:40'),
(745, 1, 'en', 'Backend', 'Core', 'err', 'ErrorWhileSendingEmail', 'Error while sending email.', '2015-09-25 08:02:40'),
(746, 1, 'en', 'Backend', 'Core', 'err', 'ExtensionNotAllowed', 'Invalid file type. (allowed: %1$s)', '2015-09-25 08:02:40'),
(747, 1, 'en', 'Backend', 'Core', 'err', 'FieldIsRequired', 'This field is required.', '2015-09-25 08:02:40'),
(748, 1, 'en', 'Backend', 'Core', 'err', 'ForkAPIKeys', 'Fork API-keys are not configured.', '2015-09-25 08:02:40'),
(749, 1, 'en', 'Backend', 'Core', 'err', 'FormError', 'Something went wrong', '2015-09-25 08:02:40'),
(750, 1, 'en', 'Backend', 'Core', 'err', 'GoogleMapsKey', 'Google maps API-key is not configured. <a href="%1$s">Configure</a>', '2015-09-25 08:02:40'),
(751, 1, 'en', 'Backend', 'Core', 'err', 'InvalidAPIKey', 'Invalid API key.', '2015-09-25 08:02:40'),
(752, 1, 'en', 'Backend', 'Core', 'err', 'InvalidDomain', 'Invalid domain.', '2015-09-25 08:02:40'),
(753, 1, 'en', 'Backend', 'Core', 'err', 'InvalidEmailPasswordCombination', 'Your e-mail and password combination is incorrect. <a href="#" rel="forgotPasswordHolder" class="toggleBalloon">Did you forget your password?</a>', '2015-09-25 08:02:40'),
(754, 1, 'en', 'Backend', 'Core', 'err', 'InvalidInteger', 'Invalid number.', '2015-09-25 08:02:40'),
(755, 1, 'en', 'Backend', 'Core', 'err', 'InvalidName', 'Invalid name.', '2015-09-25 08:02:40'),
(756, 1, 'en', 'Backend', 'Core', 'err', 'InvalidNumber', 'Invalid number.', '2015-09-25 08:02:40'),
(757, 1, 'en', 'Backend', 'Core', 'err', 'InvalidParameters', 'Invalid parameters.', '2015-09-25 08:02:40'),
(758, 1, 'en', 'Backend', 'Core', 'err', 'InvalidURL', 'Invalid URL.', '2015-09-25 08:02:40'),
(759, 1, 'en', 'Backend', 'Core', 'err', 'InvalidValue', 'Invalid value.', '2015-09-25 08:02:40'),
(760, 1, 'en', 'Backend', 'Core', 'err', 'JavascriptNotEnabled', 'To use Fork CMS, javascript needs to be enabled. Activate javascript and refresh this page.', '2015-09-25 08:02:40'),
(761, 1, 'en', 'Backend', 'Core', 'err', 'JPGGIFAndPNGOnly', 'Only jpg, gif, png', '2015-09-25 08:02:40'),
(762, 1, 'en', 'Backend', 'Core', 'err', 'ModuleNotAllowed', 'You have insufficient rights for this module.', '2015-09-25 08:02:40'),
(763, 1, 'en', 'Backend', 'Core', 'err', 'NameIsRequired', 'Please provide a name.', '2015-09-25 08:02:40'),
(764, 1, 'en', 'Backend', 'Core', 'err', 'NicknameIsRequired', 'Please provide a publication name.', '2015-09-25 08:02:40'),
(765, 1, 'en', 'Backend', 'Core', 'err', 'NoCommentsSelected', 'No comments were selected.', '2015-09-25 08:02:40'),
(766, 1, 'en', 'Backend', 'Core', 'err', 'NoItemsSelected', 'No items were selected.', '2015-09-25 08:02:40'),
(767, 1, 'en', 'Backend', 'Core', 'err', 'NoModuleLinked', 'Cannot generate URL. Create a page that has this module linked to it.', '2015-09-25 08:02:40'),
(768, 1, 'en', 'Backend', 'Core', 'err', 'NonExisting', 'This item doesn''t exist.', '2015-09-25 08:02:40'),
(769, 1, 'en', 'Backend', 'Core', 'err', 'NoSelection', 'No items were selected.', '2015-09-25 08:02:40'),
(770, 1, 'en', 'Backend', 'Core', 'err', 'NoTemplatesAvailable', 'The selected theme does not yet have templates. Please create at least one template first.', '2015-09-25 08:02:40'),
(771, 1, 'en', 'Backend', 'Core', 'err', 'PasswordIsRequired', 'Please provide a password.', '2015-09-25 08:02:40'),
(772, 1, 'en', 'Backend', 'Core', 'err', 'PasswordRepeatIsRequired', 'Please repeat the desired password.', '2015-09-25 08:02:40'),
(773, 1, 'en', 'Backend', 'Core', 'err', 'PasswordsDontMatch', 'The passwords differ', '2015-09-25 08:02:40'),
(774, 1, 'en', 'Backend', 'Core', 'err', 'RobotsFileIsNotOK', 'robots.txt will block search-engines.', '2015-09-25 08:02:40'),
(775, 1, 'en', 'Backend', 'Core', 'err', 'RSSTitle', 'Blog RSS title is not configured. <a href="%1$s">Configure</a>', '2015-09-25 08:02:40'),
(776, 1, 'en', 'Backend', 'Core', 'err', 'SettingsForkAPIKeys', 'The Fork API-keys are not configured.', '2015-09-25 08:02:40'),
(777, 1, 'en', 'Backend', 'Core', 'err', 'SomethingWentWrong', 'Something went wrong.', '2015-09-25 08:02:40'),
(778, 1, 'en', 'Backend', 'Core', 'err', 'StartDateIsInvalid', 'Invalid start date.', '2015-09-25 08:02:40'),
(779, 1, 'en', 'Backend', 'Core', 'err', 'SurnameIsRequired', 'Please provide a last name.', '2015-09-25 08:02:40'),
(780, 1, 'en', 'Backend', 'Core', 'err', 'TimeIsInvalid', 'Invalid time.', '2015-09-25 08:02:40'),
(781, 1, 'en', 'Backend', 'Core', 'err', 'TitleIsRequired', 'Provide a title.', '2015-09-25 08:02:40'),
(782, 1, 'en', 'Backend', 'Core', 'err', 'TooManyLoginAttempts', 'Too many login attempts. Click the forgot password link if you forgot your password.', '2015-09-25 08:02:40'),
(783, 1, 'en', 'Backend', 'Core', 'err', 'URLAlreadyExists', 'This URL already exists.', '2015-09-25 08:02:40'),
(784, 1, 'en', 'Backend', 'Core', 'err', 'ValuesDontMatch', 'The values don''t match.', '2015-09-25 08:02:40'),
(785, 1, 'en', 'Backend', 'Core', 'err', 'XMLFilesOnly', 'Only XMl files are allowed.', '2015-09-25 08:02:40'),
(786, 1, 'en', 'Backend', 'Dashboard', 'lbl', 'AllStatistics', 'all statistics', '2015-09-25 08:02:41'),
(787, 1, 'en', 'Backend', 'Dashboard', 'lbl', 'TopKeywords', 'top keywords', '2015-09-25 08:02:41'),
(788, 1, 'en', 'Backend', 'Dashboard', 'lbl', 'TopReferrers', 'top referrers', '2015-09-25 08:02:41'),
(789, 1, 'en', 'Backend', 'Dashboard', 'msg', 'EditYourDashboard', 'Personalize your dashboard', '2015-09-25 08:02:41'),
(790, 1, 'en', 'Backend', 'Dashboard', 'msg', 'HelpEditDashboard', 'Personalize your dashboard by dragging the boxes in the way you want. Close the boxes to remove them.', '2015-09-25 08:02:41'),
(791, 1, 'en', 'Backend', 'Dashboard', 'msg', 'WillBeEnabledOnSave', 'This widget wil be reenabled on save.', '2015-09-25 08:02:41'),
(792, 1, 'en', 'Backend', 'Settings', 'lbl', 'AdminIds', 'admin ids', '2015-09-25 08:02:41'),
(793, 1, 'en', 'Backend', 'Settings', 'lbl', 'ApplicationId', 'application id', '2015-09-25 08:02:41'),
(794, 1, 'en', 'Backend', 'Settings', 'lbl', 'ApplicationSecret', 'app secret', '2015-09-25 08:02:41'),
(795, 1, 'en', 'Backend', 'Settings', 'lbl', 'Cookies', 'cookies', '2015-09-25 08:02:41'),
(796, 1, 'en', 'Backend', 'Settings', 'lbl', 'LicenseKey', 'License key', '2015-09-25 08:02:41'),
(797, 1, 'en', 'Backend', 'Settings', 'lbl', 'LicenseName', 'License name', '2015-09-25 08:02:41'),
(798, 1, 'en', 'Backend', 'Settings', 'lbl', 'MaximumHeight', 'maximum height', '2015-09-25 08:02:41'),
(799, 1, 'en', 'Backend', 'Settings', 'lbl', 'MaximumWidth', 'maximum width', '2015-09-25 08:02:41'),
(800, 1, 'en', 'Backend', 'Settings', 'lbl', 'SEOSettings', 'SEO settings', '2015-09-25 08:02:41'),
(801, 1, 'en', 'Backend', 'Settings', 'lbl', 'SmtpSecureLayer', 'security', '2015-09-25 08:02:41'),
(802, 1, 'en', 'Backend', 'Settings', 'msg', 'ConfigurationError', 'Some settings are not yet configured.', '2015-09-25 08:02:41'),
(803, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpAPIKeys', 'Access codes for webservices.', '2015-09-25 08:02:41'),
(804, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpCkfinderMaximumHeight', 'Configure the maximum height (in pixels) of uploaded images. If an uploaded image is larger, it gets scaled down proportionally. Set to 0 to disable this feature.', '2015-09-25 08:02:41'),
(805, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpCkfinderMaximumWidth', 'Configure the maximum width (in pixels) of uploaded images. If an uploaded image is larger, it gets scaled down proportionally. Set to 0 to disable this feature.', '2015-09-25 08:02:41'),
(806, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpCookies', 'There are several laws in Europe about the use of cookies. With this Cookie-bar you fulfill the most strict law.', '2015-09-25 08:02:41'),
(807, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpDateFormatLong', 'Format that''s used on overview and detail pages.', '2015-09-25 08:02:41'),
(808, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpDateFormatShort', 'This format is mostly used in table overviews.', '2015-09-25 08:02:41'),
(809, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpDomains', 'Enter the domains on which this website can be reached. (Split domains with linebreaks.)', '2015-09-25 08:02:41'),
(810, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpEmailWebmaster', 'Send CMS notifications to this e-mailaddress.', '2015-09-25 08:02:41'),
(811, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpFacebookAdminIds', 'Either Facebook user IDs or a Facebook Platform application ID that administers this website.', '2015-09-25 08:02:41'),
(812, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpFacebookApiKey', 'The API key of your Facebook application.', '2015-09-25 08:02:41'),
(813, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpFacebookApplicationId', 'The id of your Facebook application', '2015-09-25 08:02:41'),
(814, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpFacebookApplicationSecret', 'The secret of your Facebook application.', '2015-09-25 08:02:41'),
(815, 1, 'en', 'Backend', 'Settings', 'lbl', 'TwitterSiteName', 'twitter username', '2015-09-25 08:02:41'),
(816, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpLanguages', 'Select the languages that are accessible for visitors.', '2015-09-25 08:02:41'),
(817, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpNumberFormat', 'This format is used to display numbers on the website.', '2015-09-25 08:02:41'),
(818, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpRedirectLanguages', 'Select the languages that people may automatically be redirected to based upon their browser language.', '2015-09-25 08:02:41'),
(819, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpScriptsFoot', 'Paste code that needs to be loaded at the end of the <code><body></code> tag here.', '2015-09-25 08:02:41'),
(820, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpScriptsFootLabel', 'End of <code>&lt;body&gt;</code> script(s)', '2015-09-25 08:02:41'),
(821, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpScriptsHead', 'Paste code that needs to be loaded in the <code>&lt;head&gt;</code> section here.', '2015-09-25 08:02:41'),
(822, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpScriptsHeadLabel', '<code>&lt;head&gt;</code> script(s)', '2015-09-25 08:02:41'),
(823, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpSendingEmails', 'You can send emails in 2 ways. By using PHP''s built-in mail method or via SMTP. We advise you to use SMTP', '2015-09-25 08:02:41'),
(824, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpSEONoodp', 'Opt out of the <a href="http://www.dmoz.org/" class="targetBlank">open directory project</a> override.', '2015-09-25 08:02:41'),
(825, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpSEONoydir', 'Opt out of the Yahoo! Directory override.', '2015-09-25 08:02:41'),
(826, 1, 'en', 'Backend', 'Settings', 'msg', 'HelpTimeFormat', 'This format is used to display dates on the website.', '2015-09-25 08:02:41'),
(827, 1, 'en', 'Backend', 'Settings', 'msg', 'NoAdminIds', 'No admin ids yet.', '2015-09-25 08:02:41'),
(828, 1, 'en', 'Backend', 'Settings', 'msg', 'SendTestMail', 'send test email', '2015-09-25 08:02:41'),
(829, 1, 'en', 'Backend', 'Settings', 'msg', 'SEONoFollowInComments', 'add <code>rel="nofollow"</code> on links inside a comment', '2015-09-25 08:02:41'),
(830, 1, 'en', 'Backend', 'Settings', 'msg', 'ShowCookieBar', 'show the cookie bar', '2015-09-25 08:02:41'),
(831, 1, 'en', 'Backend', 'Settings', 'msg', 'TestMessage', 'this is just a test', '2015-09-25 08:02:41'),
(832, 1, 'en', 'Backend', 'Settings', 'msg', 'TestWasSent', 'The test email was sent.', '2015-09-25 08:02:41'),
(833, 1, 'en', 'Backend', 'Settings', 'err', 'PortIsRequired', 'Port is required.', '2015-09-25 08:02:41'),
(834, 1, 'en', 'Backend', 'Settings', 'err', 'ServerIsRequired', 'Server is required.', '2015-09-25 08:02:41'),
(835, 0, 'en', 'Backend', 'Users', 'lbl', 'Add', 'add user', '2015-09-25 08:02:41'),
(836, 0, 'en', 'Backend', 'Users', 'msg', 'Added', 'The user "%1$s" was added.', '2015-09-25 08:02:41'),
(837, 0, 'en', 'Backend', 'Users', 'msg', 'ConfirmDelete', 'Are your sure you want to delete the user "%1$s"?', '2015-09-25 08:02:41'),
(838, 0, 'en', 'Backend', 'Users', 'msg', 'Deleted', 'The user "%1$s" was deleted.', '2015-09-25 08:02:41'),
(839, 0, 'en', 'Backend', 'Users', 'msg', 'Edited', 'The settings for "%1$s" were saved.', '2015-09-25 08:02:41'),
(840, 0, 'en', 'Backend', 'Users', 'msg', 'EditUser', 'edit user "%1$s"', '2015-09-25 08:02:41'),
(841, 0, 'en', 'Backend', 'Users', 'msg', 'HelpActive', 'Enable CMS access for this account.', '2015-09-25 08:02:41'),
(842, 0, 'en', 'Backend', 'Users', 'msg', 'HelpAPIAccess', 'Enable API access for this account.', '2015-09-25 08:02:41'),
(843, 0, 'en', 'Backend', 'Users', 'msg', 'HelpStrongPassword', 'Strong passwords consist of a combination of capitals', '2015-09-25 08:02:41'),
(844, 0, 'en', 'Backend', 'Users', 'msg', 'Restored', 'The user "%1$s" is restored.', '2015-09-25 08:02:41'),
(845, 0, 'en', 'Backend', 'Users', 'err', 'CantChangeGodsEmail', 'You can''t change the emailaddres of the GOD-user.', '2015-09-25 08:02:41'),
(846, 0, 'en', 'Backend', 'Users', 'err', 'CantDeleteGod', 'You can''t delete the GOD-user.', '2015-09-25 08:02:41'),
(847, 0, 'en', 'Backend', 'Users', 'err', 'EmailWasDeletedBefore', 'A user with this emailaddress was deleted. <a href="%1$s">Restore this user</a>.', '2015-09-25 08:02:41'),
(848, 0, 'en', 'Backend', 'Users', 'err', 'NonExisting', 'This user doesn''t exist.', '2015-09-25 08:02:41'),
(849, 1, 'en', 'Backend', 'Groups', 'lbl', 'Action', 'action', '2015-09-25 08:02:42'),
(850, 1, 'en', 'Backend', 'Groups', 'lbl', 'AddGroup', 'add group', '2015-09-25 08:02:42'),
(851, 1, 'en', 'Backend', 'Groups', 'lbl', 'Checkbox', ' ', '2015-09-25 08:02:42'),
(852, 1, 'en', 'Backend', 'Groups', 'lbl', 'DisplayWidgets', 'widgets to display', '2015-09-25 08:02:42'),
(853, 1, 'en', 'Backend', 'Groups', 'lbl', 'NumUsers', 'number of users', '2015-09-25 08:02:42'),
(854, 1, 'en', 'Backend', 'Groups', 'lbl', 'Presets', 'presets', '2015-09-25 08:02:42'),
(855, 1, 'en', 'Backend', 'Groups', 'lbl', 'SetPermissions', 'set permissions', '2015-09-25 08:02:42'),
(856, 1, 'en', 'Backend', 'Groups', 'msg', 'Added', '"%1$s" has been added.', '2015-09-25 08:02:42'),
(857, 1, 'en', 'Backend', 'Groups', 'msg', 'Deleted', '"%1$s" has been deleted.', '2015-09-25 08:02:42'),
(858, 1, 'en', 'Backend', 'Groups', 'msg', 'Edited', 'changes for "%1$s" has been saved.', '2015-09-25 08:02:42'),
(859, 1, 'en', 'Backend', 'Groups', 'msg', 'NoUsers', 'This group does not contain any users.', '2015-09-25 08:02:42'),
(860, 1, 'en', 'Backend', 'Groups', 'msg', 'NoWidgets', 'There are no widgets available.', '2015-09-25 08:02:42'),
(861, 1, 'en', 'Backend', 'Groups', 'err', 'GroupAlreadyExists', 'This group already exists.', '2015-09-25 08:02:42'),
(862, 1, 'en', 'Backend', 'Extensions', 'msg', 'AddedTemplate', 'The template "%1$s" was added.', '2015-09-25 08:02:42'),
(863, 1, 'en', 'Backend', 'Extensions', 'msg', 'ConfirmDeleteTemplate', 'Are your sure you want to delete the template "%1$s"?', '2015-09-25 08:02:42'),
(864, 1, 'en', 'Backend', 'Extensions', 'msg', 'ConfirmModuleInstall', 'Are you sure you want to install the module "%1$s"?', '2015-09-25 08:02:42'),
(865, 1, 'en', 'Backend', 'Extensions', 'msg', 'ConfirmThemeInstall', 'Are you sure you want to install this theme?', '2015-09-25 08:02:42'),
(866, 1, 'en', 'Backend', 'Extensions', 'msg', 'CronjobsInfo', '                      <p>              Cronjobs periodically, on a set timeframe, perform a call to script.<br />              Cronjobs can be executed either through commandline as well as over your webserver.<br />              When setting cronjobs on servers with several Fork CMS installations try to spread the execution by changing the minutes parameter.            </p>            <p>              Commandline: <small>php %1$s/backend/cronjob module=<i>module</i> action=<i>action</i></small><br />              Webserver: <small>/usr/bin/wget -O - --quiet --timeout=1440 "%2$s/backend/cronjob?module=<i>module</i>&action=<i>action</i>"</small>            </p>      	       	', '2015-09-25 08:02:42'),
(867, 1, 'en', 'Backend', 'Extensions', 'msg', 'DeletedTemplate', 'The template "%1$s" was deleted.', '2015-09-25 08:02:42'),
(868, 1, 'en', 'Backend', 'Extensions', 'msg', 'EditedTemplate', 'The template "%1$s" was saved.', '2015-09-25 08:02:42'),
(869, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpInstallableThemes', 'Click a theme to install it.', '2015-09-25 08:02:42'),
(870, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpOverwrite', '<strong>Attention!</strong> Checking this checkbox will cause the content of every page to be reset to the defaults chosen here-above.', '2015-09-25 08:02:42'),
(871, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpPositionsLayout', '<strong>A visual representation to be used in the pages-module.</strong><ul><li>Add a row: use <strong>[]</strong></li><li>Reflect a position: use <strong>position name</strong></li><li>Reflect a non-editable area: use <strong>/</strong></li></ul><p>If you want a position to display wider or higher in it''s graphical representation, repeat the position multiple times (both horizontal and vertical, but the shape should form a rectangle)</p><strong>A template could look like the chart below:</strong><pre>[  /   ,  /   ,  /   ,  /   ,  top ],<br />[  /   ,  /   ,  /   ,  /   ,  /   ],<br />[ left , main , main , main , right],<br />[bottom,bottom,bottom,bottom,bottom]</pre>', '2015-09-25 08:02:42'),
(872, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpTemplateFormat', 'e.g. [left,main,right],[/,main,/]', '2015-09-25 08:02:42'),
(873, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpTemplateLocation', 'Put your templates in the <code>Core/Layout/Templates</code> folder of your theme.', '2015-09-25 08:02:42'),
(874, 1, 'en', 'Backend', 'Extensions', 'msg', 'HelpThemes', 'Select the theme you wish to use.', '2015-09-25 08:02:42'),
(875, 1, 'en', 'Backend', 'Extensions', 'msg', 'InformationFileCouldNotBeLoaded', 'A info.xml file is present but it could not be loaded. Verify if the content is valid XML.', '2015-09-25 08:02:42'),
(876, 1, 'en', 'Backend', 'Extensions', 'msg', 'InformationFileIsEmpty', 'A info.xml file is present but its either empty or it does not contain valuable information.', '2015-09-25 08:02:42'),
(877, 1, 'en', 'Backend', 'Extensions', 'msg', 'InformationFileIsMissing', 'There is no information available.', '2015-09-25 08:02:42'),
(878, 1, 'en', 'Backend', 'Extensions', 'msg', 'InformationModuleIsNotInstalled', 'This module is not yet installed.', '2015-09-25 08:02:42'),
(879, 1, 'en', 'Backend', 'Extensions', 'msg', 'InformationThemeIsNotInstalled', 'This theme is not yet installed.', '2015-09-25 08:02:42'),
(880, 1, 'en', 'Backend', 'Extensions', 'msg', 'Module', 'module "%1$s"', '2015-09-25 08:02:42'),
(881, 1, 'en', 'Backend', 'Extensions', 'msg', 'ModuleInstalled', 'The module "%1$s" was installed.', '2015-09-25 08:02:42'),
(882, 1, 'en', 'Backend', 'Extensions', 'msg', 'ModulesNotWritable', 'We do not have write rights to the modules folders. Check if you have write rights on the modules folders in all applications.', '2015-09-25 08:02:42'),
(883, 1, 'en', 'Backend', 'Extensions', 'msg', 'ModulesWarnings', 'There are some warnings for following module(s)', '2015-09-25 08:02:42'),
(884, 1, 'en', 'Backend', 'Extensions', 'msg', 'NoModulesInstalled', 'No modules installed.', '2015-09-25 08:02:42'),
(885, 1, 'en', 'Backend', 'Extensions', 'msg', 'NoThemes', 'No themes available.', '2015-09-25 08:02:42'),
(886, 1, 'en', 'Backend', 'Extensions', 'msg', 'PathToTemplate', 'Path to template', '2015-09-25 08:02:42'),
(887, 1, 'en', 'Backend', 'Extensions', 'msg', 'TemplateInUse', 'This template is in use.', '2015-09-25 08:02:42'),
(888, 1, 'en', 'Backend', 'Extensions', 'msg', 'Theme', 'theme "%1$s"', '2015-09-25 08:02:42'),
(889, 1, 'en', 'Backend', 'Extensions', 'msg', 'ThemeInstalled', 'The theme "%1$s" was installed.', '2015-09-25 08:02:42'),
(890, 1, 'en', 'Backend', 'Extensions', 'msg', 'ThemesNotWritable', 'We do not have write rights to the themes folder. Check if you have write rights on the themes folders in the frontend-application.', '2015-09-25 08:02:42'),
(891, 1, 'en', 'Backend', 'Extensions', 'msg', 'ZipArchiveIsMissing', '        	Your server is missing the required PHP "<a href="http://be2.php.net/manual/en/class.ziparchive.php">ZipArchive</a>" class. Fork CMS needs this class to be able to unpack your uploaded module.<br /><br />			<ul>				<li>Contact your server administrator with the above message.</li>				<li>Or unpack the ZIP archive on your computer and upload the folders manually (most likely via FTP) to your website root.</li>			</ul>		', '2015-09-25 08:02:42'),
(892, 1, 'en', 'Backend', 'Extensions', 'msg', 'ZlibIsMissing', '        	Your server is missing the required PHP "<a href="http://www.php.net/manual/en/book.zlib.php">Zlib</a>" extension. Fork CMS needs this extension to be able to unpack your uploaded module.<br /><br />			<ul>				<li>Contact your server administrator with the above message.</li>				<li>Or unpack the ZIP archive on your computer and upload the folders manually (most likely via FTP) to your website root.</li>			</ul>		', '2015-09-25 08:02:42'),
(893, 1, 'en', 'Backend', 'Extensions', 'lbl', 'AddPosition', 'add position', '2015-09-25 08:02:42'),
(894, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Authors', 'authors', '2015-09-25 08:02:42'),
(895, 1, 'en', 'Backend', 'Extensions', 'lbl', 'DeletePosition', 'delete position', '2015-09-25 08:02:42'),
(896, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Events', 'events (hooks)', '2015-09-25 08:02:42'),
(897, 1, 'en', 'Backend', 'Extensions', 'lbl', 'FindModules', 'find modules', '2015-09-25 08:02:42'),
(898, 1, 'en', 'Backend', 'Extensions', 'lbl', 'FindThemes', 'find themes', '2015-09-25 08:02:42'),
(899, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Install', 'install', '2015-09-25 08:02:42'),
(900, 1, 'en', 'Backend', 'Extensions', 'lbl', 'InstallableModules', 'not installed modules', '2015-09-25 08:02:42'),
(901, 1, 'en', 'Backend', 'Extensions', 'lbl', 'InstallableThemes', 'not installed themes', '2015-09-25 08:02:42'),
(902, 1, 'en', 'Backend', 'Extensions', 'lbl', 'InstalledModules', 'installed modules', '2015-09-25 08:02:42'),
(903, 1, 'en', 'Backend', 'Extensions', 'lbl', 'InstalledThemes', 'installed themes', '2015-09-25 08:02:42'),
(904, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Overwrite', 'overwrite', '2015-09-25 08:02:42'),
(905, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Theme', 'theme', '2015-09-25 08:02:42'),
(906, 1, 'en', 'Backend', 'Extensions', 'lbl', 'UploadModule', 'upload module', '2015-09-25 08:02:42'),
(907, 1, 'en', 'Backend', 'Extensions', 'lbl', 'UploadTheme', 'upload theme', '2015-09-25 08:02:42'),
(908, 1, 'en', 'Backend', 'Extensions', 'lbl', 'Version', 'version', '2015-09-25 08:02:42'),
(909, 1, 'en', 'Backend', 'Extensions', 'err', 'AlreadyInstalled', '"%1$s" is already installed.', '2015-09-25 08:02:42'),
(910, 1, 'en', 'Backend', 'Extensions', 'err', 'CorruptedFile', 'The uploaded file is not a valid ZIP file and could not be extracted.', '2015-09-25 08:02:42'),
(911, 1, 'en', 'Backend', 'Extensions', 'err', 'CronjobsNotSet', 'Not all cronjobs are set.', '2015-09-25 08:02:42'),
(912, 1, 'en', 'Backend', 'Extensions', 'err', 'DeleteTemplate', 'You can''t delete this template.', '2015-09-25 08:02:42'),
(913, 1, 'en', 'Backend', 'Extensions', 'err', 'DuplicatePositionName', 'Position %s is duplicated.', '2015-09-25 08:02:42'),
(914, 1, 'en', 'Backend', 'Extensions', 'err', 'FileContentsIsUseless', 'We could not find a module in the uploaded file. Verify the contents.', '2015-09-25 08:02:42'),
(915, 1, 'en', 'Backend', 'Extensions', 'err', 'FileIsEmpty', 'The file is empty. Verify the contents.', '2015-09-25 08:02:42'),
(916, 1, 'en', 'Backend', 'Extensions', 'err', 'TemplateFileNotFound', 'The template file is missing.', '2015-09-25 08:02:42'),
(917, 1, 'en', 'Backend', 'Extensions', 'err', 'InvalidTemplateSyntax', 'Invalid syntax.', '2015-09-25 08:02:42'),
(918, 1, 'en', 'Backend', 'Extensions', 'err', 'LibraryFileAlreadyExists', 'The library-file "%1$s" already existed by another module. This module may not function properly.', '2015-09-25 08:02:42'),
(919, 1, 'en', 'Backend', 'Extensions', 'err', 'ModuleAlreadyExists', 'The module "%1$s" already exists, you can not upload it again.', '2015-09-25 08:02:42'),
(920, 1, 'en', 'Backend', 'Extensions', 'err', 'NoAlphaNumPositionName', 'Position %s is not alphanumerical.', '2015-09-25 08:02:42'),
(921, 1, 'en', 'Backend', 'Extensions', 'err', 'NoInformationFile', 'We could not find an info.xml file for "%1$s".', '2015-09-25 08:02:42'),
(922, 1, 'en', 'Backend', 'Extensions', 'err', 'NoInstallerFile', 'We could not find an installer for the module "%1$s".', '2015-09-25 08:02:42'),
(923, 1, 'en', 'Backend', 'Extensions', 'err', 'NonExistingPositionName', 'Position %s is not defined.', '2015-09-25 08:02:42'),
(924, 1, 'en', 'Backend', 'Extensions', 'err', 'NoThemes', 'No themes available.', '2015-09-25 08:02:42'),
(925, 1, 'en', 'Backend', 'Extensions', 'err', 'ReservedPositionName', 'Position %s is reserved.', '2015-09-25 08:02:42'),
(926, 1, 'en', 'Backend', 'Extensions', 'err', 'ThemeAlreadyExists', 'The theme "%1$s" already exists, you can not upload it again.', '2015-09-25 08:02:42');
INSERT INTO `locale` (`id`, `user_id`, `language`, `application`, `module`, `type`, `name`, `value`, `edited_on`) VALUES
(927, 1, 'en', 'Backend', 'Extensions', 'err', 'ThemeNameDoesntMatch', 'The theme''s folder name doesn''t match the theme name in info.xml.', '2015-09-25 08:02:42'),
(928, 1, 'en', 'Backend', 'Pages', 'lbl', 'Add', 'add page', '2015-09-25 08:02:42'),
(929, 1, 'en', 'Backend', 'Pages', 'lbl', 'ChangeTemplate', 'Change template', '2015-09-25 08:02:42'),
(930, 1, 'en', 'Backend', 'Pages', 'lbl', 'DeleteBlock', 'delete block', '2015-09-25 08:02:42'),
(931, 1, 'en', 'Backend', 'Pages', 'lbl', 'EditModuleContent', 'edit module content', '2015-09-25 08:02:42'),
(932, 1, 'en', 'Backend', 'Pages', 'lbl', 'ExternalLink', 'external link', '2015-09-25 08:02:42'),
(933, 1, 'en', 'Backend', 'Pages', 'lbl', 'ExtraTypeBlock', 'module', '2015-09-25 08:02:42'),
(934, 1, 'en', 'Backend', 'Pages', 'lbl', 'ExtraTypeWidget', 'widget', '2015-09-25 08:02:42'),
(935, 1, 'en', 'Backend', 'Pages', 'lbl', 'Fallback', 'Unassigned blocks', '2015-09-25 08:02:42'),
(936, 1, 'en', 'Backend', 'Pages', 'lbl', 'Footer', 'footer navigation', '2015-09-25 08:02:42'),
(937, 1, 'en', 'Backend', 'Pages', 'lbl', 'InternalLink', 'internal link', '2015-09-25 08:02:42'),
(938, 1, 'en', 'Backend', 'Pages', 'lbl', 'MainNavigation', 'main navigation', '2015-09-25 08:02:42'),
(939, 1, 'en', 'Backend', 'Pages', 'lbl', 'Meta', 'meta navigation', '2015-09-25 08:02:42'),
(940, 1, 'en', 'Backend', 'Pages', 'lbl', 'Navigation', 'navigation', '2015-09-25 08:02:42'),
(941, 1, 'en', 'Backend', 'Pages', 'lbl', 'Redirect', 'redirect', '2015-09-25 08:02:42'),
(942, 1, 'en', 'Backend', 'Pages', 'lbl', 'Root', 'single pages', '2015-09-25 08:02:42'),
(943, 1, 'en', 'Backend', 'Pages', 'lbl', 'SentMailings', 'sent mailings', '2015-09-25 08:02:42'),
(944, 1, 'en', 'Backend', 'Pages', 'lbl', 'SubscribeForm', 'subscribe form', '2015-09-25 08:02:42'),
(945, 1, 'en', 'Backend', 'Pages', 'lbl', 'UnsubscribeForm', 'unsubscribe form', '2015-09-25 08:02:42'),
(946, 1, 'en', 'Backend', 'Pages', 'msg', 'Added', 'The page "%1$s" was added.', '2015-09-25 08:02:42'),
(947, 1, 'en', 'Backend', 'Pages', 'msg', 'AllowChildren', 'This page can have subpages.', '2015-09-25 08:02:42'),
(948, 1, 'en', 'Backend', 'Pages', 'msg', 'AllowDelete', 'This page can be deleted.', '2015-09-25 08:02:42'),
(949, 1, 'en', 'Backend', 'Pages', 'msg', 'AllowEdit', 'This page can be edited.', '2015-09-25 08:02:42'),
(950, 1, 'en', 'Backend', 'Pages', 'msg', 'AllowMove', 'The position of this page can be changed.', '2015-09-25 08:02:42'),
(951, 1, 'en', 'Backend', 'Pages', 'msg', 'BlockAttached', 'The module <strong>%1$s</strong> is attached to this section.', '2015-09-25 08:02:42'),
(952, 1, 'en', 'Backend', 'Pages', 'msg', 'ConfirmDelete', 'Are your sure you want to delete the page "%1$s"?', '2015-09-25 08:02:42'),
(953, 1, 'en', 'Backend', 'Pages', 'msg', 'ConfirmDeleteBlock', 'Are your sure you want to delete this block?', '2015-09-25 08:02:42'),
(954, 1, 'en', 'Backend', 'Pages', 'msg', 'ContentSaveWarning', '<p><strong>Important:</strong> This content will not be updated until the page has been saved.</p>', '2015-09-25 08:02:42'),
(955, 1, 'en', 'Backend', 'Pages', 'msg', 'CopyAdded', 'Copy added', '2015-09-25 08:02:42'),
(956, 1, 'en', 'Backend', 'Pages', 'msg', 'Deleted', 'The page "%1$s" was deleted.', '2015-09-25 08:02:42'),
(957, 1, 'en', 'Backend', 'Pages', 'msg', 'Edited', 'The page "%1$s" was saved.', '2015-09-25 08:02:42'),
(958, 1, 'en', 'Backend', 'Pages', 'msg', 'FallbackInfo', '<p><strong>Not every block could automatically be assigned to a position.</strong></p><p>Blocks that were added to positions that are not available in this template, are shown here. Default blocks from the previous template that are not present in the current template are also displayed here.<br />You can easily drag them to the desired position.</p><p>These blocks will disappear after saving the page or selecting another template.</p>', '2015-09-25 08:02:42'),
(959, 1, 'en', 'Backend', 'Pages', 'msg', 'HelpBlockContent', 'What kind of content do you want to show here?', '2015-09-25 08:02:42'),
(960, 1, 'en', 'Backend', 'Pages', 'msg', 'HelpExternalRedirect', 'Use this if you need to redirect a menu-item to an external website.', '2015-09-25 08:02:42'),
(961, 1, 'en', 'Backend', 'Pages', 'msg', 'HelpInternalRedirect', 'Use this if you need to redirect a menu-item to another page on this website.', '2015-09-25 08:02:42'),
(962, 1, 'en', 'Backend', 'Pages', 'msg', 'HelpMetaNavigation', 'Extra topnavigation (above/below the menu) on every page.', '2015-09-25 08:02:42'),
(963, 1, 'en', 'Backend', 'Pages', 'msg', 'HelpNavigationTitle', 'The title that is shown in the menu.', '2015-09-25 08:02:42'),
(964, 1, 'en', 'Backend', 'Pages', 'msg', 'HomeNoBlock', 'A module can''t be linked to the homepage.', '2015-09-25 08:02:42'),
(965, 1, 'en', 'Backend', 'Pages', 'msg', 'IsAction', 'Use this page as a module action.', '2015-09-25 08:02:42'),
(966, 1, 'en', 'Backend', 'Pages', 'msg', 'MetaNavigation', 'Enable metanavigation for this website.', '2015-09-25 08:02:42'),
(967, 1, 'en', 'Backend', 'Pages', 'msg', 'ModuleBlockAlreadyLinked', 'A module has already been linked to this page.', '2015-09-25 08:02:42'),
(968, 1, 'en', 'Backend', 'Pages', 'msg', 'PageIsMoved', 'The page "%1$s" was moved.', '2015-09-25 08:02:42'),
(969, 1, 'en', 'Backend', 'Pages', 'msg', 'RichText', 'Editor', '2015-09-25 08:02:42'),
(970, 1, 'en', 'Backend', 'Pages', 'msg', 'TemplateChangeWarning', '<strong>Warning:</strong> Changing the template can cause existing content to be in another place or no longer be shown.', '2015-09-25 08:02:42'),
(971, 1, 'en', 'Backend', 'Pages', 'msg', 'WidgetAttached', 'The widget <strong>%1$s</strong> is attached to this section.', '2015-09-25 08:02:42'),
(972, 1, 'en', 'Backend', 'Pages', 'err', 'CantAdd2Blocks', 'It isn''t possible to link 2 (or more) modules to the same page.', '2015-09-25 08:02:42'),
(973, 1, 'en', 'Backend', 'Pages', 'err', 'CantBeMoved', 'Page can''t be moved.', '2015-09-25 08:02:42'),
(974, 1, 'en', 'Backend', 'Pages', 'err', 'HomeCantHaveBlocks', 'You can''t link a module to the homepage.', '2015-09-25 08:02:42'),
(975, 1, 'en', 'Backend', 'Search', 'msg', 'AddedSynonym', 'The synonym for the searchterm "%1$s" was added.', '2015-09-25 08:02:43'),
(976, 1, 'en', 'Backend', 'Search', 'msg', 'ConfirmDeleteSynonym', 'Are you sure you want to delete the synonyms for the searchterm "%1$s"?', '2015-09-25 08:02:43'),
(977, 1, 'en', 'Backend', 'Search', 'msg', 'DeletedSynonym', 'The synonym for the searchterm "%1$s" was deleted.', '2015-09-25 08:02:43'),
(978, 1, 'en', 'Backend', 'Search', 'msg', 'EditedSynonym', 'The synonym for the searchterm "%1$s" was saved.', '2015-09-25 08:02:43'),
(979, 1, 'en', 'Backend', 'Search', 'msg', 'HelpWeight', 'The default weight is 1. Increase the value to increase the importance of results from a specific module.', '2015-09-25 08:02:43'),
(980, 1, 'en', 'Backend', 'Search', 'msg', 'HelpWeightGeneral', 'Define the importance of each module in search results here.', '2015-09-25 08:02:43'),
(981, 1, 'en', 'Backend', 'Search', 'msg', 'HelpSitelinksSearchBox', 'You can find more info in <a href="https://developers.google.com/webmasters/richsnippets/sitelinkssearch">Googles official documentation</a>.', '2015-09-25 08:02:43'),
(982, 1, 'en', 'Backend', 'Search', 'msg', 'IncludeInSearch', 'Include in search results?', '2015-09-25 08:02:43'),
(983, 1, 'en', 'Backend', 'Search', 'msg', 'NoStatistics', 'There are no statistics yet.', '2015-09-25 08:02:43'),
(984, 1, 'en', 'Backend', 'Search', 'msg', 'NoSynonyms', 'There are no synonyms yet. <a href="%1$s">Add the first synonym</a>.', '2015-09-25 08:02:43'),
(985, 1, 'en', 'Backend', 'Search', 'msg', 'NoSynonymsBox', 'There are no synonyms yet.', '2015-09-25 08:02:43'),
(986, 1, 'en', 'Backend', 'Search', 'lbl', 'AddSynonym', 'add synonym', '2015-09-25 08:02:43'),
(987, 1, 'en', 'Backend', 'Search', 'lbl', 'DeleteSynonym', 'delete synonym', '2015-09-25 08:02:43'),
(988, 1, 'en', 'Backend', 'Search', 'lbl', 'EditSynonym', 'edit synonym', '2015-09-25 08:02:43'),
(989, 1, 'en', 'Backend', 'Search', 'lbl', 'ItemsForAutocomplete', 'Items in autocomplete (search results: search term suggestions)', '2015-09-25 08:02:43'),
(990, 1, 'en', 'Backend', 'Search', 'lbl', 'ItemsForAutosuggest', 'Items in autosuggest (search widget: results)', '2015-09-25 08:02:43'),
(991, 1, 'en', 'Backend', 'Search', 'lbl', 'ModuleWeight', 'module weight', '2015-09-25 08:02:43'),
(992, 1, 'en', 'Backend', 'Search', 'lbl', 'SearchedOn', 'searched on', '2015-09-25 08:02:43'),
(993, 1, 'en', 'Backend', 'Search', 'lbl', 'UseSitelinksSearchBox', 'Enable Googles Sitelinks Search Box.', '2015-09-25 08:02:43'),
(994, 1, 'en', 'Backend', 'Search', 'err', 'SynonymIsRequired', 'Synonyms are required.', '2015-09-25 08:02:43'),
(995, 1, 'en', 'Backend', 'Search', 'err', 'TermExists', 'Synonyms for this searchterm already exist.', '2015-09-25 08:02:43'),
(996, 1, 'en', 'Backend', 'Search', 'err', 'TermIsRequired', 'The searchterm is required.', '2015-09-25 08:02:43'),
(997, 1, 'en', 'Backend', 'Search', 'err', 'WeightNotNumeric', 'Het gewicht moet numeriek zijn', '2015-09-25 08:02:43'),
(998, 1, 'en', 'Backend', 'ContentBlocks', 'lbl', 'Add', 'add content block', '2015-09-25 08:02:43'),
(999, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'Added', 'The content block "%1$s" was added.', '2015-09-25 08:02:43'),
(1000, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'ConfirmDelete', 'Are your sure you want to delete the content block "%1$s"?', '2015-09-25 08:02:43'),
(1001, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'Deleted', 'The content block "%1$s" was deleted.', '2015-09-25 08:02:43'),
(1002, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'EditContentBlock', 'edit content block "%1$s"', '2015-09-25 08:02:43'),
(1003, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'Edited', 'The content block "%1$s" was saved.', '2015-09-25 08:02:43'),
(1004, 1, 'en', 'Backend', 'ContentBlocks', 'msg', 'NoTemplate', 'No template', '2015-09-25 08:02:43'),
(1005, 1, 'en', 'Backend', 'Tags', 'msg', 'Deleted', 'The selected tag(s) was/were deleted.', '2015-09-25 08:02:43'),
(1006, 1, 'en', 'Backend', 'Tags', 'msg', 'Edited', 'The tag "%1$s" was saved.', '2015-09-25 08:02:43'),
(1007, 1, 'en', 'Backend', 'Tags', 'msg', 'EditTag', 'edit tag "%1$s"', '2015-09-25 08:02:43'),
(1008, 1, 'en', 'Backend', 'Tags', 'msg', 'NoItems', 'There are no tags yet.', '2015-09-25 08:02:43'),
(1009, 1, 'en', 'Backend', 'Tags', 'err', 'NonExisting', 'This tag doesn''t exist.', '2015-09-25 08:02:43'),
(1010, 1, 'en', 'Backend', 'Tags', 'err', 'NoSelection', 'No tags were selected.', '2015-09-25 08:02:43'),
(1011, 1, 'en', 'Backend', 'Tags', 'err', 'TagAlreadyExists', 'This tag already exists.', '2015-09-25 08:02:43'),
(1012, 1, 'en', 'Backend', 'Blog', 'lbl', 'Add', 'add article', '2015-09-25 08:02:44'),
(1013, 1, 'en', 'Backend', 'Blog', 'lbl', 'WordpressFilter', 'filter', '2015-09-25 08:02:44'),
(1014, 1, 'en', 'Backend', 'Blog', 'msg', 'Added', 'The article "%1$s" was added.', '2015-09-25 08:02:44'),
(1015, 1, 'en', 'Backend', 'Blog', 'msg', 'ArticlesFor', 'Articles for "%1$s"', '2015-09-25 08:02:44'),
(1016, 1, 'en', 'Backend', 'Blog', 'msg', 'CommentOnWithURL', 'Comment on: <a href="%1$s">%2$s</a>', '2015-09-25 08:02:44'),
(1017, 1, 'en', 'Backend', 'Blog', 'msg', 'ConfirmDelete', 'Are your sure you want to delete the article "%1$s"?', '2015-09-25 08:02:44'),
(1018, 1, 'en', 'Backend', 'Blog', 'msg', 'DeleteAllSpam', 'Delete all spam:', '2015-09-25 08:02:44'),
(1019, 1, 'en', 'Backend', 'Blog', 'msg', 'Deleted', 'The selected articles were deleted.', '2015-09-25 08:02:44'),
(1020, 1, 'en', 'Backend', 'Blog', 'msg', 'DeletedSpam', 'All spam-comments were deleted.', '2015-09-25 08:02:44'),
(1021, 1, 'en', 'Backend', 'Blog', 'msg', 'EditArticle', 'edit article "%1$s"', '2015-09-25 08:02:44'),
(1022, 1, 'en', 'Backend', 'Blog', 'msg', 'EditCommentOn', 'edit comment on "%1$s"', '2015-09-25 08:02:44'),
(1023, 1, 'en', 'Backend', 'Blog', 'msg', 'Edited', 'The article "%1$s" was saved.', '2015-09-25 08:02:44'),
(1024, 1, 'en', 'Backend', 'Blog', 'msg', 'EditedComment', 'The comment was saved.', '2015-09-25 08:02:44'),
(1025, 1, 'en', 'Backend', 'Blog', 'msg', 'FollowAllCommentsInRSS', 'Follow all comments in a RSS feed: <a href="%1$s">%1$s</a>.', '2015-09-25 08:02:44'),
(1026, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpMeta', 'Show the meta information for this blogpost in the RSS feed (category)', '2015-09-25 08:02:44'),
(1027, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpPingServices', 'Let various blogservices know when you''ve posted a new article.', '2015-09-25 08:02:44'),
(1028, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpSpamFilter', 'Enable the built-in spamfilter (Akismet) to help avoid spam comments.', '2015-09-25 08:02:44'),
(1029, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpSummary', 'Write an introduction or summary for long articles. It will be shown on the homepage or the article overview.', '2015-09-25 08:02:44'),
(1030, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpWordpress', 'Hier kan je een export bestand vanuit een wordpress site uploaden.', '2015-09-25 08:02:44'),
(1031, 1, 'en', 'Backend', 'Blog', 'msg', 'HelpWordpressFilter', 'De zoekterm die in bestaande blogposts in een link voor moet komen, alvorens wij de link kunnen omzetten naar een actieve link op de fork blog module.', '2015-09-25 08:02:44'),
(1032, 1, 'en', 'Backend', 'Blog', 'msg', 'NoCategoryItems', 'There are no categories yet. <a href="%1$s">Create the first category</a>.', '2015-09-25 08:02:44'),
(1033, 1, 'en', 'Backend', 'Blog', 'msg', 'NoItems', 'There are no articles yet. <a href="%1$s">Write the first article</a>.', '2015-09-25 08:02:44'),
(1034, 1, 'en', 'Backend', 'Blog', 'msg', 'NotifyByEmailOnNewComment', 'Notify by email when there is a new comment.', '2015-09-25 08:02:44'),
(1035, 1, 'en', 'Backend', 'Blog', 'msg', 'NotifyByEmailOnNewCommentToModerate', 'Notify by email when there is a new comment to moderate.', '2015-09-25 08:02:44'),
(1036, 1, 'en', 'Backend', 'Blog', 'msg', 'NumItemsInRecentArticlesFull', 'Number of articles in the recent articles (full) widget', '2015-09-25 08:02:44'),
(1037, 1, 'en', 'Backend', 'Blog', 'msg', 'NumItemsInRecentArticlesList', 'Number of articles in the recent articles (list) widget', '2015-09-25 08:02:44'),
(1038, 1, 'en', 'Backend', 'Blog', 'msg', 'ShowImageForm', 'The user can upload a file.', '2015-09-25 08:02:44'),
(1039, 1, 'en', 'Backend', 'Blog', 'msg', 'ShowOnlyItemsInCategory', 'Show only articles for:', '2015-09-25 08:02:44'),
(1040, 1, 'en', 'Backend', 'Blog', 'err', 'DeleteCategoryNotAllowed', 'It is not allowed to delete the category "%1$s".', '2015-09-25 08:02:44'),
(1041, 1, 'en', 'Backend', 'Blog', 'err', 'RSSDescription', 'Blog RSS description is not yet provided. <a href="%1$s">Configure</a>', '2015-09-25 08:02:44'),
(1042, 1, 'en', 'Backend', 'Blog', 'err', 'XMLFilesOnly', 'Only XML files can be uploaded.', '2015-09-25 08:02:44'),
(1043, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Active', 'active', '2015-09-25 08:02:44'),
(1044, 1, 'en', 'Backend', 'Profiles', 'lbl', 'AddGroup', 'add group', '2015-09-25 08:02:44'),
(1045, 1, 'en', 'Backend', 'Profiles', 'lbl', 'AddMembership', 'add membership', '2015-09-25 08:02:44'),
(1046, 1, 'en', 'Backend', 'Profiles', 'lbl', 'AddToGroup', 'add to a group', '2015-09-25 08:02:44'),
(1047, 1, 'en', 'Backend', 'Profiles', 'lbl', 'BirthDate', 'birth date', '2015-09-25 08:02:44'),
(1048, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Blocked', 'blocked', '2015-09-25 08:02:44'),
(1049, 1, 'en', 'Backend', 'Profiles', 'lbl', 'City', 'city', '2015-09-25 08:02:44'),
(1050, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Country', 'country', '2015-09-25 08:02:44'),
(1051, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Deleted', 'deleted', '2015-09-25 08:02:44'),
(1052, 1, 'en', 'Backend', 'Profiles', 'lbl', 'DisplayName', 'display name', '2015-09-25 08:02:44'),
(1053, 1, 'en', 'Backend', 'Profiles', 'lbl', 'EditGroup', 'edit group', '2015-09-25 08:02:44'),
(1054, 1, 'en', 'Backend', 'Profiles', 'lbl', 'EditMembership', 'edit membership', '2015-09-25 08:02:44'),
(1055, 1, 'en', 'Backend', 'Profiles', 'lbl', 'ExpiresOn', 'expires on', '2015-09-25 08:02:44'),
(1056, 1, 'en', 'Backend', 'Profiles', 'lbl', 'ExportTemplate', 'download import template', '2015-09-25 08:02:44'),
(1057, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Female', 'female', '2015-09-25 08:02:44'),
(1058, 1, 'en', 'Backend', 'Profiles', 'lbl', 'FirstName', 'first name', '2015-09-25 08:02:44'),
(1059, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Gender', 'gender', '2015-09-25 08:02:44'),
(1060, 1, 'en', 'Backend', 'Profiles', 'lbl', 'GroupName', 'group name', '2015-09-25 08:02:44'),
(1061, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Groups', 'groups', '2015-09-25 08:02:44'),
(1062, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Inactive', 'inactive', '2015-09-25 08:02:44'),
(1063, 1, 'en', 'Backend', 'Profiles', 'lbl', 'LastName', 'last name', '2015-09-25 08:02:44'),
(1064, 1, 'en', 'Backend', 'Profiles', 'lbl', 'LoginBox', 'login box', '2015-09-25 08:02:44'),
(1065, 1, 'en', 'Backend', 'Profiles', 'lbl', 'LoginLink', 'login link', '2015-09-25 08:02:44'),
(1066, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Male', 'male', '2015-09-25 08:02:44'),
(1067, 1, 'en', 'Backend', 'Profiles', 'lbl', 'MembersCount', 'members count', '2015-09-25 08:02:44'),
(1068, 1, 'en', 'Backend', 'Profiles', 'lbl', 'RegisteredOn', 'registered on', '2015-09-25 08:02:44'),
(1069, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Unblock', 'unblock', '2015-09-25 08:02:44'),
(1070, 1, 'en', 'Backend', 'Profiles', 'lbl', 'Undelete', 'undelete', '2015-09-25 08:02:44'),
(1071, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmBlock', 'Are you sure you want to block "%1$s"?', '2015-09-25 08:02:44'),
(1072, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmDelete', 'Are you sure you want to delete "%1$s"?', '2015-09-25 08:02:44'),
(1073, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmDeleteGroup', 'Are you sure you want to delete the group "%1$s"?', '2015-09-25 08:02:44'),
(1074, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmMassAddToGroup', 'Are you sure you want to add these profiles to the following group?', '2015-09-25 08:02:44'),
(1075, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmProfileGroupDelete', 'Are you sure you want to delete this profile from the group "%1$s"?', '2015-09-25 08:02:44'),
(1076, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmUnblock', 'Are you sure you want to unblock "%1$s"?', '2015-09-25 08:02:44'),
(1077, 1, 'en', 'Backend', 'Profiles', 'msg', 'ConfirmUndelete', 'Are you sure you want to undelete "%1$s"?', '2015-09-25 08:02:44'),
(1078, 1, 'en', 'Backend', 'Profiles', 'msg', 'GroupAdded', 'The group was added.', '2015-09-25 08:02:44'),
(1079, 1, 'en', 'Backend', 'Profiles', 'msg', 'GroupSaved', 'The group was saved.', '2015-09-25 08:02:44'),
(1080, 1, 'en', 'Backend', 'Profiles', 'msg', 'MembershipAdded', 'The group membership was added.', '2015-09-25 08:02:44'),
(1081, 1, 'en', 'Backend', 'Profiles', 'msg', 'MembershipDeleted', 'The group membership was deleted.', '2015-09-25 08:02:44'),
(1082, 1, 'en', 'Backend', 'Profiles', 'msg', 'MembershipSaved', 'The group membership was saved.', '2015-09-25 08:02:44'),
(1083, 1, 'en', 'Backend', 'Profiles', 'msg', 'NoGroups', 'There are no groups yet.', '2015-09-25 08:02:44'),
(1084, 1, 'en', 'Backend', 'Profiles', 'msg', 'OverwriteExisting', 'Overwrite existing profiles?', '2015-09-25 08:02:44'),
(1085, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfileAddedToGroup', 'The profile was added to the group.', '2015-09-25 08:02:44'),
(1086, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfileBlocked', 'The profiel "%1$s" was blocked.', '2015-09-25 08:02:44'),
(1087, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfileDeleted', 'The profile was deleted.', '2015-09-25 08:02:44'),
(1088, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfilesAddedToGroup', 'The profiles are added to the group.', '2015-09-25 08:02:44'),
(1089, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfilesImported', 'There have been added %1$s profiles, %2$s already existed and are not updated.', '2015-09-25 08:02:44'),
(1090, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfilesImportedAndUpdated', 'There have been added %1$s profiles, %2$s already existed and are updated.', '2015-09-25 08:02:44'),
(1091, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfileUnblocked', 'The profiel "%1$s" was unblocked.', '2015-09-25 08:02:44'),
(1092, 1, 'en', 'Backend', 'Profiles', 'msg', 'ProfileUndeleted', 'The profiel "%1$s" was undeleted.', '2015-09-25 08:02:44'),
(1093, 1, 'en', 'Backend', 'Profiles', 'msg', 'Saved', 'The profiel "%1$s" was saved.', '2015-09-25 08:02:44'),
(1094, 1, 'en', 'Backend', 'Profiles', 'err', 'DisplayNameExists', 'This display name is in use.', '2015-09-25 08:02:44'),
(1095, 1, 'en', 'Backend', 'Profiles', 'err', 'DisplayNameIsRequired', 'Display name is a required field.', '2015-09-25 08:02:44'),
(1096, 1, 'en', 'Backend', 'Profiles', 'err', 'EmailExists', 'This e-mailaddress is in use.', '2015-09-25 08:02:44'),
(1097, 1, 'en', 'Backend', 'Profiles', 'err', 'GroupIsRequired', 'Group is a required field.', '2015-09-25 08:02:44'),
(1098, 1, 'en', 'Backend', 'Profiles', 'err', 'GroupNameExists', 'This group name is in use.', '2015-09-25 08:02:44'),
(1099, 1, 'en', 'Backend', 'Profiles', 'err', 'NoGroupSelected', 'You must select a group to perfom this action.', '2015-09-25 08:02:44'),
(1100, 1, 'en', 'Backend', 'Profiles', 'err', 'NoProfilesSelected', 'You must select minimum 1 profile to perfom this action.', '2015-09-25 08:02:44'),
(1101, 1, 'en', 'Backend', 'Profiles', 'err', 'UnknownAction', 'Unknown action.', '2015-09-25 08:02:44'),
(1102, 1, 'en', 'Frontend', 'Core', 'act', 'Room', 'room', '2015-10-01 15:40:24'),
(1103, 1, 'en', 'Frontend', 'Core', 'act', 'Rooms', 'rooms', '2015-10-01 15:40:49'),
(1104, 1, 'en', 'Backend', 'Core', 'lbl', 'Hotels', 'hotels', '2015-10-01 20:43:22'),
(1105, 1, 'en', 'Backend', 'Core', 'lbl', 'Rooms', 'rooms', '2015-10-01 20:43:43'),
(1106, 1, 'en', 'Backend', 'Core', 'lbl', 'NoRooms', 'no rooms', '2015-10-01 20:44:03'),
(1107, 1, 'en', 'Backend', 'Core', 'lbl', 'RoomCount', ' Number of rooms', '2015-10-01 20:52:13'),
(1108, 1, 'en', 'Backend', 'Core', 'lbl', 'Hotel', 'hotel', '2015-10-01 20:52:33'),
(1109, 1, 'en', 'Backend', 'Core', 'lbl', 'RoomSettings', 'room settings', '2015-10-01 20:52:53'),
(1110, 1, 'en', 'Backend', 'Core', 'lbl', 'Capacity', 'capacity', '2015-10-01 20:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `meta`
--

CREATE TABLE IF NOT EXISTS `meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords_overwrite` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_overwrite` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_overwrite` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_overwrite` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `custom` text CHARACTER SET utf8 COMMENT 'used for custom meta-information',
  `data` text COLLATE utf8_unicode_ci COMMENT 'used for extra meta-information',
  PRIMARY KEY (`id`),
  KEY `idx_url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Meta-information' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `meta`
--

INSERT INTO `meta` (`id`, `keywords`, `keywords_overwrite`, `description`, `description_overwrite`, `title`, `title_overwrite`, `url`, `url_overwrite`, `custom`, `data`) VALUES
(1, 'Home', 'N', 'Home', 'N', 'Home', 'N', 'home', 'N', NULL, NULL),
(2, 'Sitemap', 'N', 'Sitemap', 'N', 'Sitemap', 'N', 'sitemap', 'N', NULL, NULL),
(3, 'Disclaimer', 'N', 'Disclaimer', 'N', 'Disclaimer', 'N', 'disclaimer', 'N', NULL, 'a:2:{s:9:"seo_index";s:7:"noindex";s:10:"seo_follow";s:8:"nofollow";}'),
(4, '404', 'N', '404', 'N', '404', 'N', '404', 'N', NULL, NULL),
(7, 'Default', 'N', 'Default', 'N', 'Default', 'N', 'default', 'N', NULL, NULL),
(8, 'Blog', 'N', 'Blog', 'N', 'Blog', 'N', 'blog', 'N', NULL, NULL),
(22, 'Home', 'N', 'Home', 'N', 'Home', 'N', 'home', 'N', NULL, NULL),
(20, 'Hotels-api', 'N', 'Hotels-api', 'N', 'Hotels-api', 'N', 'hotels-api', 'N', NULL, NULL),
(21, 'Bookings', 'N', 'Bookings', 'N', 'Bookings', 'N', 'bookings', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'unique module name',
  `installed_on` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`name`, `installed_on`) VALUES
('Core', '2015-09-25 08:02:39'),
('Authentication', '2015-09-25 08:02:39'),
('Dashboard', '2015-09-25 08:02:39'),
('Error', '2015-09-25 08:02:39'),
('Locale', '2015-09-25 08:02:40'),
('Settings', '2015-09-25 08:02:41'),
('Users', '2015-09-25 08:02:41'),
('Groups', '2015-09-25 08:02:42'),
('Extensions', '2015-09-25 08:02:42'),
('Pages', '2015-09-25 08:02:42'),
('Search', '2015-09-25 08:02:43'),
('ContentBlocks', '2015-09-25 08:02:43'),
('Tags', '2015-09-25 08:02:43'),
('Blog', '2015-09-25 08:02:44'),
('Profiles', '2015-09-25 08:02:44'),
('Hotels', '2015-09-25 08:34:51'),
('Bookings', '2015-09-30 17:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `modules_extras`
--

CREATE TABLE IF NOT EXISTS `modules_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for the extra.',
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name of the module this extra belongs to.',
  `type` enum('homepage','block','widget') COLLATE utf8_unicode_ci NOT NULL COMMENT 'The type of the block.',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The label for this extra. It will be used for displaying purposes.',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci COMMENT 'A serialized value with the optional parameters',
  `hidden` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'Should the extra be shown in the backend?',
  `sequence` int(11) NOT NULL COMMENT 'The sequence in the backend.',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The possible extras' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `modules_extras`
--

INSERT INTO `modules_extras` (`id`, `module`, `type`, `label`, `action`, `data`, `hidden`, `sequence`) VALUES
(1, 'Search', 'widget', 'SearchForm', 'Form', NULL, 'N', 2001),
(2, 'Search', 'block', 'Search', NULL, NULL, 'N', 2000),
(3, 'Pages', 'widget', 'Sitemap', 'Sitemap', NULL, 'N', 1),
(4, 'Pages', 'widget', 'Navigation', 'PreviousNextNavigation', NULL, 'N', 2),
(5, 'Pages', 'widget', 'Subpages', 'Subpages', 'a:1:{s:8:"template";s:19:"SubpagesDefault.tpl";}', 'N', 2),
(6, 'Tags', 'block', 'Tags', NULL, NULL, 'N', 30),
(7, 'Tags', 'widget', 'TagCloud', 'TagCloud', NULL, 'N', 31),
(8, 'Tags', 'widget', 'Related', 'Related', NULL, 'N', 32),
(9, 'Blog', 'block', 'Blog', NULL, NULL, 'N', 1000),
(10, 'Blog', 'widget', 'RecentComments', 'RecentComments', NULL, 'N', 1001),
(11, 'Blog', 'widget', 'Categories', 'Categories', NULL, 'N', 1002),
(12, 'Blog', 'widget', 'Archive', 'Archive', NULL, 'N', 1003),
(13, 'Blog', 'widget', 'RecentArticlesFull', 'RecentArticlesFull', NULL, 'N', 1004),
(14, 'Blog', 'widget', 'RecentArticlesList', 'RecentArticlesList', NULL, 'N', 1005),
(15, 'Profiles', 'block', 'Activate', 'Activate', NULL, 'N', 5000),
(16, 'Profiles', 'block', 'ForgotPassword', 'ForgotPassword', NULL, 'N', 5001),
(17, 'Profiles', 'block', 'Dashboard', NULL, NULL, 'N', 5002),
(18, 'Profiles', 'block', 'Login', 'Login', NULL, 'N', 5003),
(19, 'Profiles', 'block', 'Logout', 'Logout', NULL, 'N', 5004),
(20, 'Profiles', 'block', 'ChangeEmail', 'ChangeEmail', NULL, 'N', 5005),
(21, 'Profiles', 'block', 'ChangePassword', 'ChangePassword', NULL, 'N', 5006),
(22, 'Profiles', 'block', 'Settings', 'Settings', NULL, 'N', 5007),
(23, 'Profiles', 'block', 'Register', 'Register', NULL, 'N', 5008),
(24, 'Profiles', 'block', 'ResetPassword', 'ResetPassword', NULL, 'N', 5008),
(25, 'Profiles', 'block', 'ResendActivation', 'ResendActivation', NULL, 'N', 5009),
(26, 'Profiles', 'widget', 'LoginBox', 'LoginBox', NULL, 'N', 5010),
(27, 'Profiles', 'widget', 'LoginLink', 'LoginLink', NULL, 'N', 5011),
(28, 'Hotels', 'block', 'HotelApi', NULL, NULL, 'N', 6000),
(29, 'Bookings', 'block', 'Bookings', NULL, NULL, 'N', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `modules_settings`
--

CREATE TABLE IF NOT EXISTS `modules_settings` (
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the module',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the setting',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'serialized value',
  PRIMARY KEY (`module`(25),`name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules_settings`
--

INSERT INTO `modules_settings` (`module`, `name`, `value`) VALUES
('Core', 'languages', 'a:1:{i:0;s:2:"en";}'),
('Core', 'active_languages', 'a:1:{i:0;s:2:"en";}'),
('Core', 'redirect_languages', 'a:1:{i:0;s:2:"en";}'),
('Core', 'default_language', 's:2:"en";'),
('Core', 'interface_languages', 'a:1:{i:0;s:2:"en";}'),
('Core', 'default_interface_language', 's:2:"en";'),
('Core', 'theme', 's:6:"triton";'),
('Core', 'akismet_key', 's:0:"";'),
('Core', 'google_maps_key', 's:0:"";'),
('Core', 'max_num_revisions', 'i:20;'),
('Core', 'site_domains', 'a:0:{}'),
('Core', 'site_html_header', 's:0:"";'),
('Core', 'site_html_footer', 's:0:"";'),
('Core', 'date_format_short', 's:5:"j.n.Y";'),
('Core', 'date_formats_short', 'a:24:{i:0;s:5:"j/n/Y";i:1;s:5:"j-n-Y";i:2;s:5:"j.n.Y";i:3;s:5:"n/j/Y";i:4;s:5:"n/j/Y";i:5;s:5:"n/j/Y";i:6;s:5:"d/m/Y";i:7;s:5:"d-m-Y";i:8;s:5:"d.m.Y";i:9;s:5:"m/d/Y";i:10;s:5:"m-d-Y";i:11;s:5:"m.d.Y";i:12;s:5:"j/n/y";i:13;s:5:"j-n-y";i:14;s:5:"j.n.y";i:15;s:5:"n/j/y";i:16;s:5:"n-j-y";i:17;s:5:"n.j.y";i:18;s:5:"d/m/y";i:19;s:5:"d-m-y";i:20;s:5:"d.m.y";i:21;s:5:"m/d/y";i:22;s:5:"m-d-y";i:23;s:5:"m.d.y";}'),
('Core', 'date_format_long', 's:7:"l j F Y";'),
('Core', 'date_formats_long', 'a:14:{i:0;s:5:"j F Y";i:1;s:7:"D j F Y";i:2;s:7:"l j F Y";i:3;s:6:"j F, Y";i:4;s:8:"D j F, Y";i:5;s:8:"l j F, Y";i:6;s:5:"d F Y";i:7;s:6:"d F, Y";i:8;s:5:"F j Y";i:9;s:7:"D F j Y";i:10;s:7:"l F j Y";i:11;s:6:"F d, Y";i:12;s:8:"D F d, Y";i:13;s:8:"l F d, Y";}'),
('Core', 'time_format', 's:3:"H:i";'),
('Core', 'time_formats', 'a:4:{i:0;s:3:"H:i";i:1;s:5:"H:i:s";i:2;s:5:"g:i a";i:3;s:5:"g:i A";}'),
('Core', 'number_format', 's:11:"dot_nothing";'),
('Core', 'number_formats', 'a:6:{s:13:"comma_nothing";s:8:"10000,25";s:11:"dot_nothing";s:8:"10000.25";s:9:"dot_comma";s:9:"10,000.25";s:9:"comma_dot";s:9:"10.000,25";s:9:"dot_space";s:8:"10000.25";s:11:"comma_space";s:9:"10 000,25";}'),
('Core', 'mailer_from', 'a:2:{s:4:"name";s:8:"Fork CMS";s:5:"email";s:17:"info@hotel.dev.lt";}'),
('Core', 'mailer_to', 'a:2:{s:4:"name";s:8:"Fork CMS";s:5:"email";s:17:"info@hotel.dev.lt";}'),
('Core', 'mailer_reply_to', 'a:2:{s:4:"name";s:8:"Fork CMS";s:5:"email";s:17:"info@hotel.dev.lt";}'),
('Core', 'smtp_server', 's:0:"";'),
('Core', 'smtp_port', 's:0:"";'),
('Core', 'smtp_username', 's:0:"";'),
('Core', 'smtp_password', 's:0:"";'),
('Core', 'site_title_en', 's:6:"Hotels";'),
('Core', 'fork_api_public_key', 's:32:"9242730dd293b08e9b896d037c525a6d";'),
('Core', 'fork_api_private_key', 's:32:"ea01ed51c3f1ee2ac20e183fa2a48e77";'),
('Core', 'ping_services', 'a:2:{s:8:"services";a:3:{i:0;a:3:{s:3:"url";s:27:"http://rpc.weblogs.com/RPC2";s:4:"port";i:80;s:4:"type";s:8:"extended";}i:1;a:3:{s:3:"url";s:30:"http://rpc.pingomatic.com/RPC2";s:4:"port";i:80;s:4:"type";s:8:"extended";}i:2;a:3:{s:3:"url";s:39:"http://blogsearch.google.com/ping/RPC2 ";s:4:"port";i:80;s:4:"type";s:8:"extended";}}s:4:"date";i:1443168159;}'),
('Core', 'ckfinder_license_name', 's:8:"Fork CMS";'),
('Core', 'ckfinder_license_key', 's:34:"VNA6-BP17-T7D3-CP1B-EMJF-X7Q3-5THF";'),
('Users', 'default_group', 'i:1;'),
('Users', 'date_formats', 'a:4:{i:0;s:5:"j/n/Y";i:1;s:5:"d/m/Y";i:2;s:5:"j F Y";i:3;s:6:"F j, Y";}'),
('Users', 'time_formats', 'a:4:{i:0;s:3:"H:i";i:1;s:5:"H:i:s";i:2;s:5:"g:i a";i:3;s:5:"g:i A";}'),
('Pages', 'default_template', 'i:3;'),
('Pages', 'meta_navigation', 'b:0;'),
('Search', 'overview_num_items', 'i:10;'),
('Search', 'validate_search', 'b:1;'),
('ContentBlocks', 'max_num_revisions', 'i:20;'),
('Blog', 'allow_comments', 'b:1;'),
('Blog', 'requires_akismet', 'b:1;'),
('Blog', 'spamfilter', 'b:0;'),
('Blog', 'moderation', 'b:1;'),
('Blog', 'ping_services', 'b:1;'),
('Blog', 'overview_num_items', 'i:10;'),
('Blog', 'recent_articles_full_num_items', 'i:3;'),
('Blog', 'recent_articles_list_num_items', 'i:5;'),
('Blog', 'max_num_revisions', 'i:20;'),
('Blog', 'rss_meta_en', 'b:1;'),
('Blog', 'rss_title_en', 's:3:"RSS";'),
('Blog', 'rss_description_en', 's:0:"";'),
('Profiles', 'allow_gravatar', 'b:1;'),
('Core', 'facebook_admin_ids', 'N;'),
('Core', 'facebook_app_id', 'N;'),
('Core', 'facebook_app_secret', 'N;'),
('Core', 'ckfinder_image_max_width', 's:4:"1600";'),
('Core', 'ckfinder_image_max_height', 's:4:"1200";'),
('Core', 'show_cookie_bar', 'b:0;');

-- --------------------------------------------------------

--
-- Table structure for table `modules_tags`
--

CREATE TABLE IF NOT EXISTS `modules_tags` (
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_id` int(11) NOT NULL,
  `other_id` int(11) NOT NULL,
  PRIMARY KEY (`module`,`tag_id`,`other_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL COMMENT 'the real page_id',
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'which user has created this page?',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'the parent_id for the page ',
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT 'the template to use',
  `meta_id` int(11) NOT NULL COMMENT 'linked meta information',
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'language of the content',
  `type` enum('home','root','page','meta','footer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'root' COMMENT 'page, header, footer, ...',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'title that will be used in the navigation',
  `navigation_title_overwrite` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'should we override the navigation title',
  `hidden` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'is the page hidden?',
  `status` enum('active','archive','draft') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active' COMMENT 'is this the active, archive or draft version',
  `publish_on` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci COMMENT 'serialized array that may contain type specific parameters',
  `created_on` datetime NOT NULL,
  `edited_on` datetime NOT NULL,
  `allow_move` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `allow_children` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `allow_edit` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `allow_delete` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `idx_id_status_hidden_language` (`id`,`status`,`hidden`,`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `revision_id`, `user_id`, `parent_id`, `template_id`, `meta_id`, `language`, `type`, `title`, `navigation_title`, `navigation_title_overwrite`, `hidden`, `status`, `publish_on`, `data`, `created_on`, `edited_on`, `allow_move`, `allow_children`, `allow_edit`, `allow_delete`, `sequence`) VALUES
(1, 1, 1, 0, 4, 1, 'en', 'page', 'Home', 'Home', 'N', 'N', 'archive', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'N', 'Y', 'Y', 'N', 0),
(2, 2, 1, 0, 3, 2, 'en', 'footer', 'Sitemap', 'Sitemap', 'N', 'N', 'archive', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 'Y', 'Y', 'Y', 0),
(3, 3, 1, 0, 3, 3, 'en', 'footer', 'Disclaimer', 'Disclaimer', 'N', 'N', 'archive', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 'Y', 'Y', 'Y', 1),
(404, 4, 1, 0, 3, 4, 'en', 'root', '404', '404', 'N', 'N', 'archive', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'N', 'Y', 'Y', 'N', 0),
(407, 7, 1, 1, 3, 8, 'en', 'page', 'Blog', 'Blog', 'N', 'N', 'archive', '2015-09-25 08:02:44', NULL, '2015-09-25 08:02:44', '2015-09-25 08:02:44', 'Y', 'Y', 'Y', 'Y', 0),
(1, 21, 1, 0, 4, 22, 'en', 'page', 'Home', 'Home', 'N', 'N', 'archive', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-10-01 19:31:13', 'N', 'Y', 'Y', 'N', 0),
(2, 22, 1, 0, 3, 2, 'en', 'footer', 'Sitemap', 'Sitemap', 'N', 'N', 'active', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 'Y', 'Y', 'Y', 0),
(3, 23, 1, 0, 3, 3, 'en', 'footer', 'Disclaimer', 'Disclaimer', 'N', 'N', 'active', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 'Y', 'Y', 'Y', 1),
(404, 24, 1, 0, 3, 4, 'en', 'root', '404', '404', 'N', 'N', 'active', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'N', 'Y', 'Y', 'N', 0),
(407, 25, 1, 1, 3, 20, 'en', 'page', 'Hotels-api', 'Hotels-api', 'N', 'N', 'active', '2015-09-25 08:02:44', NULL, '2015-09-25 08:02:44', '2015-09-29 19:45:50', 'Y', 'Y', 'Y', 'Y', 0),
(419, 26, 1, 1, 3, 21, 'en', 'page', 'Bookings', 'Bookings', 'N', 'N', 'active', '2015-09-30 17:23:26', NULL, '2015-09-30 17:23:26', '2015-09-30 17:23:26', 'Y', 'Y', 'Y', 'Y', 1),
(1, 27, 1, 0, 4, 22, 'en', 'page', 'Home', 'Home', 'N', 'N', 'active', '2015-09-25 08:02:42', NULL, '2015-09-25 08:02:42', '2015-10-01 19:31:13', 'N', 'Y', 'Y', 'N', 0),
(407, 19, 1, 1, 3, 20, 'en', 'page', 'Hotels-api', 'Hotels-api', 'N', 'N', 'archive', '2015-09-25 08:02:44', NULL, '2015-09-25 08:02:44', '2015-09-29 19:45:50', 'Y', 'Y', 'Y', 'Y', 0),
(419, 20, 1, 1, 3, 21, 'en', 'page', 'Bookings', 'Bookings', 'N', 'N', 'archive', '2015-09-30 17:23:26', NULL, '2015-09-30 17:23:26', '2015-09-30 17:23:26', 'Y', 'Y', 'Y', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_blocks`
--

CREATE TABLE IF NOT EXISTS `pages_blocks` (
  `revision_id` int(11) NOT NULL COMMENT 'The ID of the page that contains this block.',
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extra_id` int(11) DEFAULT NULL COMMENT 'The linked extra.',
  `html` text COLLATE utf8_unicode_ci COMMENT 'if this block is HTML this field should contain the real HTML.',
  `created_on` datetime NOT NULL,
  `edited_on` datetime NOT NULL,
  `visible` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL,
  KEY `idx_rev_status` (`revision_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages_blocks`
--

INSERT INTO `pages_blocks` (`revision_id`, `position`, `extra_id`, `html`, `created_on`, `edited_on`, `visible`, `sequence`) VALUES
(1, 'main', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id magna. Proin euismod vestibulum tortor. Vestibulum eget nisl. Donec interdum quam at nunc. In laoreet orci sit amet sem. In sed metus ac nunc blandit ultricies. Maecenas sed tortor. Sed velit velit, mollis quis, ultricies tincidunt, dictum ac, felis. Integer hendrerit consectetur libero. Duis sem. Mauris tellus justo, sollicitudin at, vehicula eget, auctor vel, odio. Proin mattis. Mauris mollis elit sit amet lectus. Vestibulum in tortor sodales elit sollicitudin gravida. Integer scelerisque sollicitudin velit. Aliquam erat volutpat. Sed ut nisl congue justo pharetra accumsan.</p>', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(1, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(2, 'main', NULL, '<p>Take a look at all the pages in our website:</p>', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(2, 'main', 3, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 1),
(2, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(3, 'main', NULL, '<p><strong>This website is property of [Bedrijfsnaam].</strong></p>\n<p><strong>Contact info:</strong><br />[Bedrijfsnaam]<br /> [Straatnaam] [Nummer]<br /> [Postcode] [Gemeente]</p>\n<p><strong>Adres maatschappelijk zetel:</strong><br />[Maatschappelijke zetel]<br /> [Straatnaam] [Nummer]<br /> [Postcode] [Gemeente]</p>\n<p>Telefoon:<br />E-mail:</p>\n<p>Ondernemingsnummer: BTW BE 0 [BTW-nummer]</p>\n<p>De toezichthoudende autoriteit: (wanneer uw activiteit aan een vergunningsstelsel is onderworpen)</p>\n<p>By accessing and using the website, you have expressly agreed to the following general conditions.</p>\n<h3>Intellectual property rights</h3>\n<p>The contents of this site, including trade marks, logos, drawings, data, product or company names, texts, images, etc. are protected by intellectual property rights and belong to [Bedrijfsnaam] or entitled third parties.</p>\n<h3>Liability limitation</h3>\n<p>The information on the website is general in nature. It is not adapted to personal or specific circumstances and can therefore not be regarded as personal, professional or judicial advice for the user.</p>\n<p>[Bedrijfsnaam] does everything in its power to ensure that the information made available is complete, correct, accurate and updated. However, despite these efforts inaccuracies may occur when providing information. If the information provided contains inaccuracies or if specific information on or via the site is unavailable, [Bedrijfsnaam] shall make the greatest effort to ensure that this is rectified as soon as possible.</p>\n<p>[Bedrijfsnaam] cannot be held responsible for direct or indirect damage caused by the use of the information on this site.&nbsp;  The site manager should be contacted if the user has noticed any inaccuracies in the information provided by the site.</p>\n<p>The contents of the site (including links) may be adjusted, changed or extended at any time without any announcement or advance notice. [Bedrijfsnaam] gives no guarantees for the smooth operation of the website and cannot be held responsible in any way for the poor operation or temporary unavailability of the website or for any type of damage, direct or indirect, which may occur due to the access to or use of the website.</p>\n<p>[Bedrijfsnaam] can in no case be held liable, directly or indirectly, specifically or otherwise, vis-&agrave;-vis anyone for any damage attributable to the use of this site or any other one, in particular as the result of links or hyperlinks including, but not limited to, any loss, work interruption, damage of the user&rsquo;s programs or other data on the computer system, hardware, software or otherwise.</p>\n<p>The website may contain hyperlinks to websites or pages of third parties or refer to these indirectly. The placing of links on these websites or pages shall not imply in any way the implicit approval of the contents thereof.&nbsp;  [Bedrijfsnaam] expressly declares that it has no authority over the contents or over other features of these websites and can in no case be held responsible for the contents or features thereof or for any other type of damage resulting from their use.</p>\n<h3>Applicable legislation and competent courts</h3>\n<p>This site is governed by Belgian law. Only the courts of the district of Ghent are competent to settle any disputes.</p>\n<h3>Privacy policy</h3>\n<p>[Bedrijfsnaam] believes that your privacy is important. While most of the information on this site is available without having to ask the user for personal information,&nbsp; the user may be asked for some personal details.&nbsp;&nbsp; This information will only be used to ensure a better service.&nbsp;&nbsp; (e.g. for our customer database, to keep users informed of our activities, etc.). The user may, free of charge and on request, always prevent the use of his personal details for the purposes of direct marketing. In this regard, the user should contact [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf]. Your personal details will never been transferred to any third parties (if this should occur, you will be informed).</p>\n<p>In accordance with the law on the processing of personal data of 8 December 1992, the user has the legal right to examine and possibly correct any of his/her personal details. Subject to proof of identity (copy of the user&rsquo;s identity card), you can via a written, dated and signed request to [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf], receive free of charge a written statement of the user&rsquo;s personal details.&nbsp; If necessary, you may also ask for any incorrect, incomplete or irrelevant data to be adjusted.</p>\n<p>[Bedrijfsnaam] can collect non-personal anonymous or aggregate data such as browser type, IP address or operating system in use or the domain name of the website that led you to and from our website, ensuring optimum effectiveness of our website for all users.</p>\n<h3>The use of cookies</h3>\n<p>During a visit to the site, cookies may be placed on the hard drive of your computer. This is only in order to ensure that our site is geared to the needs of users returning to our website. These tiny files known as cookies are not used to ascertain the surfing habits of the visitor on other websites. Your internet browser enables you to disable these cookies, receive a warning when a cookie has been installed or have the cookies removed from your hard disc.&nbsp; For this purpose, consult the help function of your internet browser.</p>', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(3, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(4, 'main', NULL, '<iframe src="http://notfound-static.fwebservices.be/404/index.html" width="100%" height="650" frameborder="0"></iframe>\n<p>This page doesn''t exist or is not accessible at this time. Take a look at the sitemap:</p>\n', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(4, 'main', 3, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 1),
(4, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(7, 'main', 9, '', '2015-09-25 08:02:44', '2015-09-25 08:02:44', 'Y', 0),
(7, 'top', 1, '', '2015-09-25 08:02:44', '2015-09-25 08:02:44', 'Y', 0),
(21, 'main', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id magna. Proin euismod vestibulum tortor. Vestibulum eget nisl. Donec interdum quam at nunc. In laoreet orci sit amet sem. In sed metus ac nunc blandit ultricies. Maecenas sed tortor. Sed velit velit, mollis quis, ultricies tincidunt, dictum ac, felis. Integer hendrerit consectetur libero. Duis sem. Mauris tellus justo, sollicitudin at, vehicula eget, auctor vel, odio. Proin mattis. Mauris mollis elit sit amet lectus. Vestibulum in tortor sodales elit sollicitudin gravida. Integer scelerisque sollicitudin velit. Aliquam erat volutpat. Sed ut nisl congue justo pharetra accumsan.</p>', '2015-10-01 19:31:13', '2015-10-01 19:31:13', 'Y', 0),
(19, 'main', 28, NULL, '2015-09-29 19:45:50', '2015-09-29 19:45:50', 'Y', 0),
(20, 'main', 29, NULL, '2015-09-30 17:23:26', '2015-09-30 17:23:26', 'Y', 0),
(22, 'main', NULL, '<p>Take a look at all the pages in our website:</p>', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(22, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(22, 'main', 3, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 1),
(23, 'main', NULL, '<p><strong>This website is property of [Bedrijfsnaam].</strong></p>\n<p><strong>Contact info:</strong><br />[Bedrijfsnaam]<br /> [Straatnaam] [Nummer]<br /> [Postcode] [Gemeente]</p>\n<p><strong>Adres maatschappelijk zetel:</strong><br />[Maatschappelijke zetel]<br /> [Straatnaam] [Nummer]<br /> [Postcode] [Gemeente]</p>\n<p>Telefoon:<br />E-mail:</p>\n<p>Ondernemingsnummer: BTW BE 0 [BTW-nummer]</p>\n<p>De toezichthoudende autoriteit: (wanneer uw activiteit aan een vergunningsstelsel is onderworpen)</p>\n<p>By accessing and using the website, you have expressly agreed to the following general conditions.</p>\n<h3>Intellectual property rights</h3>\n<p>The contents of this site, including trade marks, logos, drawings, data, product or company names, texts, images, etc. are protected by intellectual property rights and belong to [Bedrijfsnaam] or entitled third parties.</p>\n<h3>Liability limitation</h3>\n<p>The information on the website is general in nature. It is not adapted to personal or specific circumstances and can therefore not be regarded as personal, professional or judicial advice for the user.</p>\n<p>[Bedrijfsnaam] does everything in its power to ensure that the information made available is complete, correct, accurate and updated. However, despite these efforts inaccuracies may occur when providing information. If the information provided contains inaccuracies or if specific information on or via the site is unavailable, [Bedrijfsnaam] shall make the greatest effort to ensure that this is rectified as soon as possible.</p>\n<p>[Bedrijfsnaam] cannot be held responsible for direct or indirect damage caused by the use of the information on this site.&nbsp;  The site manager should be contacted if the user has noticed any inaccuracies in the information provided by the site.</p>\n<p>The contents of the site (including links) may be adjusted, changed or extended at any time without any announcement or advance notice. [Bedrijfsnaam] gives no guarantees for the smooth operation of the website and cannot be held responsible in any way for the poor operation or temporary unavailability of the website or for any type of damage, direct or indirect, which may occur due to the access to or use of the website.</p>\n<p>[Bedrijfsnaam] can in no case be held liable, directly or indirectly, specifically or otherwise, vis-&agrave;-vis anyone for any damage attributable to the use of this site or any other one, in particular as the result of links or hyperlinks including, but not limited to, any loss, work interruption, damage of the user&rsquo;s programs or other data on the computer system, hardware, software or otherwise.</p>\n<p>The website may contain hyperlinks to websites or pages of third parties or refer to these indirectly. The placing of links on these websites or pages shall not imply in any way the implicit approval of the contents thereof.&nbsp;  [Bedrijfsnaam] expressly declares that it has no authority over the contents or over other features of these websites and can in no case be held responsible for the contents or features thereof or for any other type of damage resulting from their use.</p>\n<h3>Applicable legislation and competent courts</h3>\n<p>This site is governed by Belgian law. Only the courts of the district of Ghent are competent to settle any disputes.</p>\n<h3>Privacy policy</h3>\n<p>[Bedrijfsnaam] believes that your privacy is important. While most of the information on this site is available without having to ask the user for personal information,&nbsp; the user may be asked for some personal details.&nbsp;&nbsp; This information will only be used to ensure a better service.&nbsp;&nbsp; (e.g. for our customer database, to keep users informed of our activities, etc.). The user may, free of charge and on request, always prevent the use of his personal details for the purposes of direct marketing. In this regard, the user should contact [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf]. Your personal details will never been transferred to any third parties (if this should occur, you will be informed).</p>\n<p>In accordance with the law on the processing of personal data of 8 December 1992, the user has the legal right to examine and possibly correct any of his/her personal details. Subject to proof of identity (copy of the user&rsquo;s identity card), you can via a written, dated and signed request to [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf], receive free of charge a written statement of the user&rsquo;s personal details.&nbsp; If necessary, you may also ask for any incorrect, incomplete or irrelevant data to be adjusted.</p>\n<p>[Bedrijfsnaam] can collect non-personal anonymous or aggregate data such as browser type, IP address or operating system in use or the domain name of the website that led you to and from our website, ensuring optimum effectiveness of our website for all users.</p>\n<h3>The use of cookies</h3>\n<p>During a visit to the site, cookies may be placed on the hard drive of your computer. This is only in order to ensure that our site is geared to the needs of users returning to our website. These tiny files known as cookies are not used to ascertain the surfing habits of the visitor on other websites. Your internet browser enables you to disable these cookies, receive a warning when a cookie has been installed or have the cookies removed from your hard disc.&nbsp; For this purpose, consult the help function of your internet browser.</p>', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(23, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(24, 'main', NULL, '<iframe src="http://notfound-static.fwebservices.be/404/index.html" width="100%" height="650" frameborder="0"></iframe>\n<p>This page doesn''t exist or is not accessible at this time. Take a look at the sitemap:</p>\n', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(24, 'top', 1, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 0),
(24, 'main', 3, '', '2015-09-25 08:02:42', '2015-09-25 08:02:42', 'Y', 1),
(25, 'main', 28, NULL, '2015-09-29 19:45:50', '2015-09-29 19:45:50', 'Y', 0),
(26, 'main', 29, NULL, '2015-09-30 17:23:26', '2015-09-30 17:23:26', 'Y', 0),
(27, 'main', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id magna. Proin euismod vestibulum tortor. Vestibulum eget nisl. Donec interdum quam at nunc. In laoreet orci sit amet sem. In sed metus ac nunc blandit ultricies. Maecenas sed tortor. Sed velit velit, mollis quis, ultricies tincidunt, dictum ac, felis. Integer hendrerit consectetur libero. Duis sem. Mauris tellus justo, sollicitudin at, vehicula eget, auctor vel, odio. Proin mattis. Mauris mollis elit sit amet lectus. Vestibulum in tortor sodales elit sollicitudin gravida. Integer scelerisque sollicitudin velit. Aliquam erat volutpat. Sed ut nisl congue justo pharetra accumsan.</p>', '2015-10-01 19:31:13', '2015-10-01 19:31:13', 'Y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive','deleted','blocked') COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registered_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles_groups`
--

CREATE TABLE IF NOT EXISTS `profiles_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles_groups_rights`
--

CREATE TABLE IF NOT EXISTS `profiles_groups_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `starts_on` datetime DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id__group__id__expires_on` (`profile_id`,`group_id`,`expires_on`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles_sessions`
--

CREATE TABLE IF NOT EXISTS `profiles_sessions` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile_id` int(11) NOT NULL,
  `secret_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`session_id`,`profile_id`),
  KEY `fk_profiles_sessions_profiles1` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles_settings`
--

CREATE TABLE IF NOT EXISTS `profiles_settings` (
  `profile_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`,`profile_id`),
  KEY `fk_profiles_settings_profiles1` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_id` int(11) NOT NULL,
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`module`,`other_id`,`field`,`language`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Search index';

--
-- Dumping data for table `search_index`
--

INSERT INTO `search_index` (`module`, `other_id`, `field`, `value`, `language`, `active`) VALUES
('Pages', 1, 'title', 'Home', 'en', 'Y'),
('Pages', 1, 'text', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id magna. Proin euismod vestibulum tortor. Vestibulum eget nisl. Donec interdum quam at nunc. In laoreet orci sit amet sem. In sed metus ac nunc blandit ultricies. Maecenas sed tortor. Sed velit velit, mollis quis, ultricies tincidunt, dictum ac, felis. Integer hendrerit consectetur libero. Duis sem. Mauris tellus justo, sollicitudin at, vehicula eget, auctor vel, odio. Proin mattis. Mauris mollis elit sit amet lectus. Vestibulum in tortor sodales elit sollicitudin gravida. Integer scelerisque sollicitudin velit. Aliquam erat volutpat. Sed ut nisl congue justo pharetra accumsan.', 'en', 'Y'),
('Pages', 2, 'title', 'Sitemap', 'en', 'Y'),
('Pages', 2, 'text', 'Take a look at all the pages in our website:  ', 'en', 'Y'),
('Pages', 3, 'title', 'Disclaimer', 'en', 'Y'),
('Pages', 3, 'text', 'This website is property of [Bedrijfsnaam].\nContact info:[Bedrijfsnaam] [Straatnaam] [Nummer] [Postcode] [Gemeente]\nAdres maatschappelijk zetel:[Maatschappelijke zetel] [Straatnaam] [Nummer] [Postcode] [Gemeente]\nTelefoon:E-mail:\nOndernemingsnummer: BTW BE 0 [BTW-nummer]\nDe toezichthoudende autoriteit: (wanneer uw activiteit aan een vergunningsstelsel is onderworpen)\nBy accessing and using the website, you have expressly agreed to the following general conditions.\nIntellectual property rights\nThe contents of this site, including trade marks, logos, drawings, data, product or company names, texts, images, etc. are protected by intellectual property rights and belong to [Bedrijfsnaam] or entitled third parties.\nLiability limitation\nThe information on the website is general in nature. It is not adapted to personal or specific circumstances and can therefore not be regarded as personal, professional or judicial advice for the user.\n[Bedrijfsnaam] does everything in its power to ensure that the information made available is complete, correct, accurate and updated. However, despite these efforts inaccuracies may occur when providing information. If the information provided contains inaccuracies or if specific information on or via the site is unavailable, [Bedrijfsnaam] shall make the greatest effort to ensure that this is rectified as soon as possible.\n[Bedrijfsnaam] cannot be held responsible for direct or indirect damage caused by the use of the information on this site.&nbsp;  The site manager should be contacted if the user has noticed any inaccuracies in the information provided by the site.\nThe contents of the site (including links) may be adjusted, changed or extended at any time without any announcement or advance notice. [Bedrijfsnaam] gives no guarantees for the smooth operation of the website and cannot be held responsible in any way for the poor operation or temporary unavailability of the website or for any type of damage, direct or indirect, which may occur due to the access to or use of the website.\n[Bedrijfsnaam] can in no case be held liable, directly or indirectly, specifically or otherwise, vis-&agrave;-vis anyone for any damage attributable to the use of this site or any other one, in particular as the result of links or hyperlinks including, but not limited to, any loss, work interruption, damage of the user&rsquo;s programs or other data on the computer system, hardware, software or otherwise.\nThe website may contain hyperlinks to websites or pages of third parties or refer to these indirectly. The placing of links on these websites or pages shall not imply in any way the implicit approval of the contents thereof.&nbsp;  [Bedrijfsnaam] expressly declares that it has no authority over the contents or over other features of these websites and can in no case be held responsible for the contents or features thereof or for any other type of damage resulting from their use.\nApplicable legislation and competent courts\nThis site is governed by Belgian law. Only the courts of the district of Ghent are competent to settle any disputes.\nPrivacy policy\n[Bedrijfsnaam] believes that your privacy is important. While most of the information on this site is available without having to ask the user for personal information,&nbsp; the user may be asked for some personal details.&nbsp;&nbsp; This information will only be used to ensure a better service.&nbsp;&nbsp; (e.g. for our customer database, to keep users informed of our activities, etc.). The user may, free of charge and on request, always prevent the use of his personal details for the purposes of direct marketing. In this regard, the user should contact [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf]. Your personal details will never been transferred to any third parties (if this should occur, you will be informed).\nIn accordance with the law on the processing of personal data of 8 December 1992, the user has the legal right to examine and possibly correct any of his/her personal details. Subject to proof of identity (copy of the user&rsquo;s identity card), you can via a written, dated and signed request to [Bedrijfsnaam], [Adres bedrijf] or via [Email adres bedrijf], receive free of charge a written statement of the user&rsquo;s personal details.&nbsp; If necessary, you may also ask for any incorrect, incomplete or irrelevant data to be adjusted.\n[Bedrijfsnaam] can collect non-personal anonymous or aggregate data such as browser type, IP address or operating system in use or the domain name of the website that led you to and from our website, ensuring optimum effectiveness of our website for all users.\nThe use of cookies\nDuring a visit to the site, cookies may be placed on the hard drive of your computer. This is only in order to ensure that our site is geared to the needs of users returning to our website. These tiny files known as cookies are not used to ascertain the surfing habits of the visitor on other websites. Your internet browser enables you to disable these cookies, receive a warning when a cookie has been installed or have the cookies removed from your hard disc.&nbsp; For this purpose, consult the help function of your internet browser. ', 'en', 'Y'),
('Pages', 404, 'title', '404', 'en', 'Y'),
('Pages', 404, 'text', '\nThis page doesn''t exist or is not accessible at this time. Take a look at the sitemap:\n  ', 'en', 'Y'),
('Pages', 1, 'tags', '', 'en', 'Y'),
('Pages', 407, 'tags', '', 'en', 'Y'),
('Pages', 407, 'title', 'Hotels-api', 'en', 'Y'),
('Pages', 407, 'text', ' ', 'en', 'Y'),
('Pages', 419, 'tags', '', 'en', 'Y'),
('Pages', 419, 'title', 'Bookings', 'en', 'Y'),
('Pages', 419, 'text', ' ', 'en', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `search_modules`
--

CREATE TABLE IF NOT EXISTS `search_modules` (
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `searchable` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `search_modules`
--

INSERT INTO `search_modules` (`module`, `searchable`, `weight`) VALUES
('Pages', 'Y', 1),
('Blog', 'Y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `search_statistics`
--

CREATE TABLE IF NOT EXISTS `search_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `num_results` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `search_synonyms`
--

CREATE TABLE IF NOT EXISTS `search_synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `synonym` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`term`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `themes_templates`
--

CREATE TABLE IF NOT EXISTS `themes_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for the template.',
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The name of the theme.',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The label for the template, will be used for displaying purposes.',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Filename for the template.',
  `active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'Is this template active (as in: will it be used).',
  `data` text COLLATE utf8_unicode_ci COMMENT 'A serialized array with data that is specific for this template (eg.: names for the blocks).',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The possible templates' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `themes_templates`
--

INSERT INTO `themes_templates` (`id`, `theme`, `label`, `path`, `active`, `data`) VALUES
(1, 'core', 'Default', 'Core/Layout/Templates/Default.tpl', 'Y', 'a:2:{s:6:"format";s:6:"[main]";s:5:"names";a:1:{i:0;s:4:"main";}}'),
(2, 'core', 'Home', 'Core/Layout/Templates/Home.tpl', 'Y', 'a:2:{s:6:"format";s:6:"[main]";s:5:"names";a:1:{i:0;s:4:"main";}}'),
(3, 'triton', 'Default', 'Core/Layout/Templates/Default.tpl', 'Y', 'a:4:{s:6:"format";s:21:"[left,main,main,main]";s:5:"names";a:2:{i:0;s:4:"main";i:1;s:4:"left";}s:14:"default_extras";a:2:{s:4:"main";a:0:{}s:4:"left";a:0:{}}s:17:"default_extras_en";a:2:{s:4:"main";a:0:{}s:4:"left";a:0:{}}}'),
(4, 'triton', 'Home', 'Core/Layout/Templates/Home.tpl', 'Y', 'a:4:{s:6:"format";s:21:"[main,main,main,main]";s:5:"names";a:1:{i:0;s:4:"main";}s:14:"default_extras";a:1:{s:4:"main";a:0:{}}s:17:"default_extras_en";a:1:{s:4:"main";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'will be case-sensitive',
  `active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y' COMMENT 'is this user active?',
  `deleted` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT 'is the user deleted?',
  `is_god` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The backend users' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `active`, `deleted`, `is_god`) VALUES
(1, 'andrius@mediainovacijos.lt', '3c9ebb778c457cf5c94876fb4a1893c15073824a', 'Y', 'N', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`group_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_sessions`
--

CREATE TABLE IF NOT EXISTS `users_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_session_id_secret_key` (`session_id`(100),`secret_key`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users_sessions`
--

INSERT INTO `users_sessions` (`id`, `user_id`, `session_id`, `secret_key`, `date`) VALUES
(7, 1, '40fv3c5goqe7etq8c4gu3hqhg4', '3c812fa47de4835e4a7fa22cba565ffa194f4a9f', '2015-10-22 12:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `users_settings`
--

CREATE TABLE IF NOT EXISTS `users_settings` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'name of the setting',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'serialized value',
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_settings`
--

INSERT INTO `users_settings` (`user_id`, `name`, `value`) VALUES
(1, 'nickname', 's:8:"Fork CMS";'),
(1, 'name', 's:4:"Fork";'),
(1, 'surname', 's:3:"CMS";'),
(1, 'interface_language', 's:2:"en";'),
(1, 'date_format', 's:5:"j F Y";'),
(1, 'time_format', 's:3:"H:i";'),
(1, 'datetime_format', 's:9:"j F Y H:i";'),
(1, 'number_format', 's:11:"dot_nothing";'),
(1, 'password_key', 's:13:"5604ffa1dc9e8";'),
(1, 'password_strength', 's:7:"average";'),
(1, 'current_password_change', 'i:1443168161;'),
(1, 'avatar', 's:7:"god.jpg";'),
(1, 'dashboard_sequence', 'a:3:{s:8:"Settings";a:1:{s:7:"Analyse";a:4:{s:6:"column";s:4:"left";s:8:"position";i:1;s:6:"hidden";b:0;s:7:"present";b:1;}}s:5:"Users";a:1:{s:10:"Statistics";a:4:{s:6:"column";s:4:"left";s:8:"position";i:2;s:6:"hidden";b:0;s:7:"present";b:1;}}s:4:"Blog";a:1:{s:8:"Comments";a:4:{s:6:"column";s:5:"right";s:8:"position";i:1;s:6:"hidden";b:0;s:7:"present";b:1;}}}'),
(1, 'current_login', 'i:1445517261;'),
(1, 'last_failed_login_attempt', 'i:1443546453;'),
(1, 'last_login', 'i:1444982846;');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotels_rooms`
--
ALTER TABLE `hotels_rooms`
  ADD CONSTRAINT `hotels_rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
