-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 08 月 19 日 20:49
-- 服务器版本: 5.5.32
-- PHP 版本: 5.3.10-1ubuntu3.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `yprogrammer`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add resource', 7, 'add_resource'),
(20, 'Can change resource', 7, 'change_resource'),
(21, 'Can delete resource', 7, 'delete_resource'),
(22, 'Can add log entry', 8, 'add_logentry'),
(23, 'Can change log entry', 8, 'change_logentry'),
(24, 'Can delete log entry', 8, 'delete_logentry'),
(25, 'Can add node', 9, 'add_node'),
(26, 'Can change node', 9, 'change_node'),
(27, 'Can delete node', 9, 'delete_node'),
(28, 'Can add user', 10, 'add_user'),
(29, 'Can change user', 10, 'change_user'),
(30, 'Can delete user', 10, 'delete_user'),
(31, 'Can add node follow', 11, 'add_nodefollow'),
(32, 'Can change node follow', 11, 'change_nodefollow'),
(33, 'Can delete node follow', 11, 'delete_nodefollow'),
(34, 'Can add resource collect', 12, 'add_resourcecollect'),
(35, 'Can change resource collect', 12, 'change_resourcecollect'),
(36, 'Can delete resource collect', 12, 'delete_resourcecollect'),
(37, 'Can add node type', 13, 'add_nodetype'),
(38, 'Can change node type', 13, 'change_nodetype'),
(39, 'Can delete node type', 13, 'delete_nodetype'),
(40, 'Can add resource type', 14, 'add_resourcetype'),
(41, 'Can change resource type', 14, 'change_resourcetype'),
(42, 'Can delete resource type', 14, 'delete_resourcetype'),
(43, 'Can add resource comment', 15, 'add_resourcecomment'),
(44, 'Can change resource comment', 15, 'change_resourcecomment'),
(45, 'Can delete resource comment', 15, 'delete_resourcecomment');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$yzr6LTTaDpK2$fwLP6nJmcUrEG7jtJIDjd2KmsQhrNlxbY0gFtorVMMg=', '2013-07-22 13:06:48', 1, 'hustlzp', '', '', 'hustlzp@qq.com', 1, 1, '2013-07-05 13:55:41');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=377 ;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-07-06 02:31:22', 1, 6, '1', 'yprogrammer.com', 2, '已修改 domain 和 name 。'),
(2, '2013-07-06 02:34:48', 1, 7, '1', 'GitHub', 2, '已修改 createTime 。'),
(3, '2013-07-06 02:41:48', 1, 7, '1', 'GitHub', 2, '已修改 content 。'),
(4, '2013-07-06 03:20:11', 1, 9, '1', '代码托管', 1, ''),
(5, '2013-07-06 03:21:10', 1, 7, '1', 'GitHub', 1, ''),
(6, '2013-07-06 03:29:43', 1, 7, '2', 'BitBucket', 1, ''),
(7, '2013-07-06 10:11:39', 1, 9, '2', '代码托管', 1, ''),
(8, '2013-07-06 10:12:07', 1, 9, '1', '代码托管', 3, ''),
(9, '2013-07-06 10:14:19', 1, 9, '2', '代码托管平台', 2, '已修改 title 。'),
(10, '2013-07-06 10:16:33', 1, 9, '2', '代码托管', 2, '已修改 title 。'),
(11, '2013-07-06 10:26:40', 1, 9, '2', 'Git', 2, '已修改 title 和 desc 。 已添加 resource "Git官网". 已变更 type for resource "GitHub". 已变更 type for resource "BitBucket".'),
(12, '2013-07-06 10:45:47', 1, 9, '3', 'Python', 1, ''),
(13, '2013-07-06 11:00:10', 1, 9, '4', 'Bootstrap', 1, ''),
(14, '2013-07-06 11:34:48', 1, 9, '5', 'Python Web 框架', 1, ''),
(15, '2013-07-06 11:40:38', 1, 9, '5', 'Python Web 框架', 2, '已添加 resource "Flask". 已添加 resource "Tornado". 已变更 type for resource "Django".'),
(16, '2013-07-06 11:42:53', 1, 9, '6', 'Nginx', 1, ''),
(17, '2013-07-06 11:46:40', 1, 9, '6', 'Nginx', 2, '已添加 resource "Nginx官方网站". 已添加 resource "Nginx HTTP Server".'),
(18, '2013-07-06 11:53:46', 1, 9, '6', 'Nginx', 2, '已添加 resource "Nginx for Developers: An Introduction".'),
(19, '2013-07-06 12:01:48', 1, 9, '7', 'Linux', 1, ''),
(20, '2013-07-07 01:28:39', 1, 9, '7', 'Linux', 2, '已变更 image_url for resource "鸟哥的私房菜". 已变更 image_url for resource "Linux从入门到精通". 已变更 image_url for resource "Linux Shell脚本攻略".'),
(21, '2013-07-07 01:38:49', 1, 9, '6', 'Nginx', 2, '已变更 image_url for resource "Nginx官方网站". 已变更 image_url for resource "Nginx HTTP Server".'),
(22, '2013-07-07 01:40:49', 1, 9, '5', 'Python Web 框架', 2, '已变更 image_url for resource "Django". 已变更 image_url for resource "Flask". 已变更 image_url for resource "Tornado".'),
(23, '2013-07-07 01:41:42', 1, 9, '4', 'Bootstrap', 2, '已变更 image_url for resource "Bootstrap官网". 已变更 image_url for resource "Bootstrap中文网站".'),
(24, '2013-07-07 01:43:07', 1, 9, '3', 'Python', 2, '已变更 image_url for resource "Learning Python". 已变更 image_url for resource "Python Cookbook". 已变更 image_url for resource "Python官方文档".'),
(25, '2013-07-07 01:54:27', 1, 9, '2', 'Git', 2, '已变更 image_url for resource "GitHub". 已变更 image_url for resource "BitBucket". 已变更 image_url for resource "Git官网".'),
(26, '2013-07-07 02:54:38', 1, 9, '5', 'Python Web 框架', 2, '已变更 type for resource "Django". 已变更 type for resource "Flask". 已变更 type for resource "Tornado".'),
(27, '2013-07-07 02:55:01', 1, 9, '6', 'Nginx', 2, '已变更 type for resource "Nginx for Developers: An Introduction".'),
(28, '2013-07-07 02:55:11', 1, 9, '4', 'Bootstrap', 2, '已变更 type for resource "Bootstrap官网".'),
(29, '2013-07-07 02:55:37', 1, 9, '2', 'Git', 2, '已变更 type for resource "GitHub". 已变更 type for resource "BitBucket". 已变更 type for resource "Git官网".'),
(30, '2013-07-07 02:55:51', 1, 9, '3', 'Python', 2, '已变更 type for resource "Python官方文档".'),
(31, '2013-07-07 04:15:41', 1, 9, '7', 'Linux', 2, '已修改 image_url 。'),
(32, '2013-07-07 04:16:14', 1, 9, '6', 'Nginx', 2, '已修改 image_url 。'),
(33, '2013-07-07 04:20:12', 1, 9, '5', 'Python Web 框架', 2, '已修改 image_url 。 已删除 resource "Tornado".'),
(34, '2013-07-07 04:30:23', 1, 9, '8', 'Flask', 1, ''),
(35, '2013-07-07 04:32:43', 1, 9, '5', 'Python Web 框架', 3, ''),
(36, '2013-07-07 04:49:29', 1, 9, '9', 'Django', 1, ''),
(37, '2013-07-07 05:09:07', 1, 9, '9', 'Django', 2, '已修改 parent_node 。'),
(38, '2013-07-07 10:21:42', 1, 9, '2', 'Git', 2, '已修改 parent_node 和 image_url 。'),
(39, '2013-07-07 10:21:58', 1, 9, '4', 'Bootstrap', 2, '已修改 parent_node 和 image_url 。'),
(40, '2013-07-07 10:23:36', 1, 9, '3', 'Python', 2, '已修改 parent_node 和 image_url 。'),
(41, '2013-07-07 10:24:07', 1, 9, '3', 'Python', 2, '已修改 image_url 。'),
(42, '2013-07-07 12:51:18', 1, 9, '9', 'Django', 2, '已修改 parent_node 。 已变更 type for resource "Django Book中文版".'),
(43, '2013-07-07 12:52:01', 1, 9, '6', 'Nginx', 2, '已修改 parent_node 。 已变更 type for resource "Nginx for Developers: An Introduction".'),
(44, '2013-07-07 12:52:24', 1, 9, '3', 'Python', 2, '已变更 type for resource "Python官方文档".'),
(45, '2013-07-07 12:52:47', 1, 9, '2', 'Git', 2, '已变更 type for resource "GitHub". 已变更 type for resource "BitBucket". 已变更 type for resource "Git官网".'),
(46, '2013-07-08 01:44:08', 1, 9, '9', 'Django', 2, '已修改 desc 。'),
(47, '2013-07-08 01:45:24', 1, 9, '8', 'Flask', 2, '已修改 parent_node 和 desc 。'),
(48, '2013-07-08 01:45:50', 1, 9, '4', 'Bootstrap', 2, '已修改 desc 。'),
(49, '2013-07-08 02:40:58', 1, 9, '3', 'Python', 2, '已修改 desc 。'),
(50, '2013-07-08 02:41:44', 1, 9, '2', 'Git', 2, '已变更 content for resource "GitHub".'),
(51, '2013-07-08 02:48:37', 1, 9, '8', 'Flask', 2, '已修改 desc 。'),
(52, '2013-07-08 02:52:43', 1, 9, '4', 'Bootstrap', 2, '已修改 desc 。'),
(53, '2013-07-08 02:58:09', 1, 9, '2', 'Git', 2, '已修改 desc 。'),
(54, '2013-07-08 02:58:26', 1, 9, '8', 'Flask', 2, '已变更 title for resource "Flask站点合集".'),
(55, '2013-07-08 03:01:56', 1, 9, '3', 'Python', 2, '已变更 content for resource "Learning Python".'),
(56, '2013-07-08 05:22:31', 1, 9, '10', 'Javascript', 1, ''),
(57, '2013-07-08 05:45:26', 1, 9, '10', 'Javascript', 2, '已添加 resource "JavaScript高级程序设计（第3版）". 已添加 resource "CoffeeScript". 已添加 resource "jQuery基础教程（第3版）".'),
(58, '2013-07-08 06:01:03', 1, 9, '10', 'Javascript', 2, '已添加 resource "CoffeeScript程序设计".'),
(59, '2013-07-08 06:03:32', 1, 9, '8', 'Flask', 2, '已添加 resource "The Flask Mega-Tutorial".'),
(60, '2013-07-08 06:05:54', 1, 9, '4', 'Bootstrap', 2, '已添加 resource "Bootswatch".'),
(61, '2013-07-08 06:14:02', 1, 9, '11', '设计', 1, ''),
(62, '2013-07-08 06:17:43', 1, 9, '11', '设计', 2, '已添加 resource "写给大家看的设计书（第3版）". 已添加 resource "设计中的设计 | 全本".'),
(63, '2013-07-08 06:20:15', 1, 9, '2', 'Git', 2, '已添加 resource "Git权威指南".'),
(64, '2013-07-08 06:21:27', 1, 9, '3', 'Python', 2, '已变更 url for resource "Learning Python". 已变更 url for resource "Python Cookbook".'),
(65, '2013-07-08 06:22:15', 1, 9, '6', 'Nginx', 2, '已变更 title 和 url for resource "学习Nginx HTTP Server中文版".'),
(66, '2013-07-08 06:29:19', 1, 9, '7', 'Linux', 2, '已修改 parent_node 。 已变更 url for resource "鸟哥的私房菜". 已变更 url for resource "Linux从入门到精通". 已变更 url for resource "Linux Shell脚本攻略".'),
(67, '2013-07-08 08:05:18', 1, 9, '12', 'CSS', 1, ''),
(68, '2013-07-08 08:05:58', 1, 9, '12', 'CSS', 2, '已变更 title for resource "W3school CSS教程". 已变更 title for resource "W3school CSS3教程".'),
(69, '2013-07-08 08:16:18', 1, 9, '11', '设计', 2, '已添加 resource "Typeland". 已添加 resource "Type is Beautiful". 已添加 resource "http://www.niice.co/".'),
(70, '2013-07-08 08:49:23', 1, 9, '11', '设计', 2, '已添加 resource "NAV80".'),
(71, '2013-07-08 10:11:35', 1, 9, '4', 'Bootstrap', 2, '已添加 resource "Font Awesome".'),
(72, '2013-07-08 10:34:29', 1, 9, '11', '设计', 2, '已变更 title for resource "Niice".'),
(73, '2013-07-08 10:35:17', 1, 9, '10', 'Javascript', 2, '已变更 title for resource "JavaScript高级程序设计". 已变更 title for resource "jQuery基础教程".'),
(74, '2013-07-08 10:35:38', 1, 9, '11', '设计', 2, '已变更 title for resource "写给大家看的设计书".'),
(75, '2013-07-08 15:47:06', 1, 9, '8', 'Flask', 2, '已修改 image_url 。'),
(76, '2013-07-08 15:48:38', 1, 9, '9', 'Django', 2, '已修改 image_url 。'),
(77, '2013-07-08 15:49:53', 1, 9, '6', 'Nginx', 2, '已修改 image_url 。'),
(78, '2013-07-08 15:50:47', 1, 9, '10', 'Javascript', 2, '已修改 image_url 。'),
(79, '2013-07-08 15:52:59', 1, 9, '4', 'Bootstrap', 2, '已修改 image_url 。'),
(80, '2013-07-08 15:55:05', 1, 9, '12', 'CSS', 2, '已修改 image_url 。'),
(81, '2013-07-09 00:53:26', 1, 9, '11', '设计', 2, '已修改 image_url 。'),
(82, '2013-07-09 01:14:56', 1, 9, '10', 'Javascript', 2, '已变更 title for resource "《jQuery基础教程》".'),
(83, '2013-07-09 01:15:49', 1, 9, '11', '设计', 2, '已变更 title for resource "《写给大家看的设计书》". 已变更 title for resource "《设计中的设计 | 全本》".'),
(84, '2013-07-09 01:16:06', 1, 9, '10', 'Javascript', 2, '已变更 title for resource "《JavaScript高级程序设计》". 已变更 title for resource "《CoffeeScript程序设计》".'),
(85, '2013-07-09 01:16:33', 1, 9, '7', 'Linux', 2, '已变更 title for resource "《鸟哥的私房菜》". 已变更 title for resource "《Linux从入门到精通》". 已变更 title for resource "《Linux Shell脚本攻略》".'),
(86, '2013-07-09 01:17:02', 1, 9, '2', 'Git', 2, '已变更 title for resource "《Git权威指南》".'),
(87, '2013-07-09 01:17:26', 1, 9, '3', 'Python', 2, '已变更 title for resource "《Python学习手册》". 已变更 title for resource "《Python Cookbook》".'),
(88, '2013-07-09 01:41:56', 1, 9, '7', 'Linux', 2, '已修改 desc 。'),
(89, '2013-07-09 01:42:18', 1, 9, '4', 'Bootstrap', 2, '已修改 desc 。'),
(90, '2013-07-09 11:42:36', 1, 9, '9', 'Django', 2, '已修改 image_url 。'),
(91, '2013-07-11 05:12:04', 1, 9, '11', '设计', 2, '已变更 title for resource "写给大家看的设计书". 已变更 title for resource "设计中的设计 | 全本".'),
(92, '2013-07-11 05:19:00', 1, 9, '10', 'Javascript', 2, '已变更 title for resource "JavaScript高级程序设计". 已变更 title for resource "jQuery基础教程". 已变更 title for resource "CoffeeScript程序设计".'),
(93, '2013-07-11 05:38:16', 1, 9, '3', 'Python', 2, '已变更 title for resource "Python学习手册". 已变更 title for resource "Python Cookbook".'),
(94, '2013-07-11 05:42:26', 1, 9, '2', 'Git', 2, '已变更 title for resource "Git权威指南".'),
(95, '2013-07-11 05:52:51', 1, 9, '6', 'Nginx', 2, '已变更 title for resource "Nginx官网". 已变更 title for resource "学习Nginx HTTP Server".'),
(96, '2013-07-11 05:53:07', 1, 9, '7', 'Linux', 2, '已变更 title for resource "鸟哥的私房菜". 已变更 title for resource "Linux从入门到精通". 已变更 title for resource "Linux Shell脚本攻略".'),
(97, '2013-07-11 05:53:59', 1, 9, '9', 'Django', 2, '已变更 title for resource "Django中文文档".'),
(98, '2013-07-11 05:54:53', 1, 9, '11', '设计', 2, '已变更 title for resource "设计中的设计".'),
(99, '2013-07-11 06:33:51', 1, 9, '4', 'Bootstrap', 2, '已变更 title for resource "Bootstrap中文".'),
(100, '2013-07-11 06:40:01', 1, 9, '13', 'NodeJs', 1, ''),
(101, '2013-07-11 06:44:32', 1, 9, '2', 'Git', 2, '已变更 title，type 和 url for resource "Pro Git".'),
(102, '2013-07-11 09:04:04', 1, 9, '13', 'NodeJs', 2, '已添加 resource "NodeJs文档". 已添加 resource "CNode社区".'),
(103, '2013-07-11 10:14:34', 1, 9, '12', 'CSS', 2, '已添加 resource "LESS CSS".'),
(104, '2013-07-11 10:19:23', 1, 9, '13', 'NodeJs', 2, '已添加 resource "ExpressJs". 已添加 resource "Moment".'),
(105, '2013-07-11 10:37:06', 1, 9, '14', '创业', 1, ''),
(106, '2013-07-11 10:38:57', 1, 9, '14', '创业', 2, '已修改 image_url 。'),
(107, '2013-07-11 10:43:51', 1, 9, '14', '创业', 2, '已添加 resource "GuruDigger".'),
(108, '2013-07-11 10:47:25', 1, 9, '14', '创业', 2, '没有字段被修改。'),
(109, '2013-07-11 10:47:57', 1, 9, '14', '创业', 2, '已修改 image_url 。'),
(110, '2013-07-11 10:50:59', 1, 9, '11', '设计', 2, '已添加 resource "Favicon Generator".'),
(111, '2013-07-11 10:57:02', 1, 9, '10', 'Javascript', 2, '已添加 resource "jQuery文档".'),
(112, '2013-07-11 10:58:13', 1, 9, '11', '设计', 2, '已添加 resource "easyicon".'),
(113, '2013-07-11 11:02:40', 1, 9, '2', 'Git', 2, '已删除 resource "BitBucket".'),
(114, '2013-07-11 11:05:06', 1, 9, '11', '设计', 2, '已变更 title for resource "Easycon".'),
(115, '2013-07-11 11:05:18', 1, 9, '11', '设计', 2, '已变更 title for resource "EasyIcon".'),
(116, '2013-07-11 11:11:09', 1, 9, '15', 'MySQL', 1, ''),
(117, '2013-07-11 11:12:46', 1, 9, '15', 'MySQL', 2, '没有字段被修改。'),
(118, '2013-07-11 11:16:47', 1, 9, '8', 'Flask', 2, '已添加 resource "Jinja2".'),
(119, '2013-07-11 11:17:44', 1, 9, '8', 'Flask', 2, '已变更 url for resource "Jinja2".'),
(120, '2013-07-11 11:20:17', 1, 9, '8', 'Flask', 2, '已添加 resource "http://werkzeug.pocoo.org/docs/".'),
(121, '2013-07-11 11:20:41', 1, 9, '8', 'Flask', 2, '已变更 title for resource "Werkzeug".'),
(122, '2013-07-11 11:24:02', 1, 9, '12', 'CSS', 2, '已变更 title for resource "CSS教程". 已变更 title for resource "CSS3教程".'),
(123, '2013-07-11 11:39:50', 1, 9, '16', 'HTML', 1, ''),
(124, '2013-07-11 11:58:33', 1, 9, '12', 'HTML/CSS', 2, '已修改 title 和 desc 。'),
(125, '2013-07-11 11:58:42', 1, 9, '16', 'HTML', 3, ''),
(126, '2013-07-11 12:01:24', 1, 9, '12', 'HTML/CSS', 2, '已添加 resource "HTML教程".'),
(127, '2013-07-11 12:07:07', 1, 9, '14', '创业', 2, '已添加 resource "Paul Graham".'),
(128, '2013-07-11 12:12:11', 1, 9, '3', 'Python', 2, '已添加 resource "Requests".'),
(129, '2013-07-11 12:21:11', 1, 9, '17', 'PostgreSQL', 1, ''),
(130, '2013-07-11 12:22:58', 1, 9, '17', 'PostgreSQL', 2, '已变更 title 和 type for resource "PostgreSQL官网".'),
(131, '2013-07-11 12:39:49', 1, 9, '18', '社区', 1, ''),
(132, '2013-07-11 13:27:59', 1, 9, '12', 'HTML & CSS', 2, '已修改 title 。'),
(133, '2013-07-11 13:28:27', 1, 9, '12', 'HTML/CSS', 2, '已修改 title 。'),
(134, '2013-07-11 13:31:03', 1, 9, '19', 'MongoDB', 1, ''),
(135, '2013-07-11 14:08:30', 1, 13, '1', '数据存储', 1, ''),
(136, '2013-07-11 14:08:35', 1, 13, '2', '服务器', 1, ''),
(137, '2013-07-11 14:09:12', 1, 13, '3', '编程语言', 1, ''),
(138, '2013-07-11 14:09:21', 1, 13, '4', '后端', 1, ''),
(139, '2013-07-11 14:09:27', 1, 13, '5', '前端', 1, ''),
(140, '2013-07-11 14:09:32', 1, 13, '6', '设计', 1, ''),
(141, '2013-07-11 14:11:25', 1, 9, '19', 'MongoDB', 2, '已修改 type 。'),
(142, '2013-07-11 14:11:33', 1, 9, '17', 'PostgreSQL', 2, '已修改 type 。'),
(143, '2013-07-11 14:11:40', 1, 9, '15', 'MySQL', 2, '已修改 type 。'),
(144, '2013-07-11 14:11:51', 1, 9, '13', 'NodeJs', 2, '已修改 type 。'),
(145, '2013-07-11 14:11:57', 1, 9, '12', 'HTML/CSS', 2, '已修改 type 。'),
(146, '2013-07-11 14:16:37', 1, 9, '11', '视觉设计', 2, '已修改 type 和 title 。'),
(147, '2013-07-11 14:16:44', 1, 9, '10', 'Javascript', 2, '已修改 type 。'),
(148, '2013-07-11 14:16:50', 1, 9, '9', 'Django', 2, '已修改 type 。'),
(149, '2013-07-11 14:16:56', 1, 9, '8', 'Flask', 2, '已修改 type 。'),
(150, '2013-07-11 14:17:34', 1, 9, '7', 'Linux', 2, '已修改 type 。'),
(151, '2013-07-11 14:17:50', 1, 9, '6', 'Nginx', 2, '已修改 type 。'),
(152, '2013-07-11 14:18:43', 1, 13, '7', '开发工具', 1, ''),
(153, '2013-07-11 14:18:53', 1, 9, '2', 'Git', 2, '已修改 type 。'),
(154, '2013-07-11 14:19:02', 1, 9, '7', 'Linux', 2, '已修改 type 。'),
(155, '2013-07-11 14:19:20', 1, 13, '7', '开发环境', 2, '已修改 type 。'),
(156, '2013-07-11 14:22:16', 1, 9, '20', 'VPS', 1, ''),
(157, '2013-07-11 14:40:52', 1, 9, '21', 'Sublime Text 2', 1, ''),
(158, '2013-07-11 14:41:14', 1, 9, '21', 'Sublime Text', 2, '已修改 title 。'),
(159, '2013-07-11 15:00:45', 1, 9, '3', 'Python', 2, '已修改 type 。'),
(160, '2013-07-11 15:04:04', 1, 9, '10', 'Javascript', 2, '已修改 desc 。'),
(161, '2013-07-11 15:04:34', 1, 9, '9', 'Django', 2, '已修改 desc 。'),
(162, '2013-07-11 15:12:06', 1, 9, '22', 'Tornado', 1, ''),
(163, '2013-07-11 15:13:57', 1, 9, '18', '社区', 2, '已修改 type 。'),
(164, '2013-07-11 15:16:06', 1, 9, '23', 'Redis', 1, ''),
(165, '2013-07-11 15:19:20', 1, 9, '8', 'Flask', 2, '已修改 desc 。'),
(166, '2013-07-11 15:20:08', 1, 9, '20', 'VPS', 2, '已修改 desc 。'),
(167, '2013-07-11 15:20:34', 1, 9, '23', 'Redis', 2, '已修改 desc 。'),
(168, '2013-07-11 15:20:38', 1, 9, '22', 'Tornado', 2, '已修改 desc 。'),
(169, '2013-07-11 15:20:42', 1, 9, '21', 'Sublime Text', 2, '已修改 desc 。'),
(170, '2013-07-11 15:20:47', 1, 9, '20', 'VPS', 2, '已修改 desc 。'),
(171, '2013-07-11 15:20:53', 1, 9, '19', 'MongoDB', 2, '已修改 desc 。'),
(172, '2013-07-11 15:21:00', 1, 9, '17', 'PostgreSQL', 2, '已修改 desc 。'),
(173, '2013-07-11 15:21:05', 1, 9, '17', 'PostgreSQL', 2, '没有字段被修改。'),
(174, '2013-07-11 15:21:16', 1, 9, '15', 'MySQL', 2, '已修改 desc 。'),
(175, '2013-07-11 15:21:33', 1, 9, '14', '创业', 2, '已修改 type 和 desc 。'),
(176, '2013-07-11 15:22:26', 1, 9, '9', 'Django', 2, '已修改 desc 。'),
(177, '2013-07-11 15:22:39', 1, 9, '2', 'Git', 2, '已修改 desc 。'),
(178, '2013-07-11 15:22:45', 1, 9, '3', 'Python', 2, '已修改 desc 。'),
(179, '2013-07-11 15:22:59', 1, 9, '4', 'Bootstrap', 2, '已修改 type 和 desc 。'),
(180, '2013-07-11 15:23:05', 1, 9, '6', 'Nginx', 2, '已修改 desc 。'),
(181, '2013-07-11 15:23:15', 1, 9, '7', 'Linux', 2, '已修改 desc 。'),
(182, '2013-07-11 15:23:22', 1, 9, '8', 'Flask', 2, '没有字段被修改。'),
(183, '2013-07-11 15:23:32', 1, 9, '9', 'Django', 2, '已修改 desc 。'),
(184, '2013-07-11 15:23:38', 1, 9, '10', 'Javascript', 2, '已修改 desc 。'),
(185, '2013-07-11 15:23:47', 1, 9, '11', '视觉设计', 2, '已修改 desc 。'),
(186, '2013-07-11 15:24:30', 1, 9, '14', '创业', 2, '已修改 desc 。'),
(187, '2013-07-11 15:24:46', 1, 9, '18', '社区', 2, '已修改 desc 。'),
(188, '2013-07-11 15:26:53', 1, 13, '3', '语言', 2, '已修改 type 。'),
(189, '2013-07-11 15:29:31', 1, 13, '7', '开发&部署', 2, '已修改 type 。'),
(190, '2013-07-11 15:29:46', 1, 13, '7', '开发 & 部署', 2, '已修改 type 。'),
(191, '2013-07-11 15:38:23', 1, 9, '24', 'CoffeeScript', 1, ''),
(192, '2013-07-11 15:39:52', 1, 9, '25', 'jQuery', 1, ''),
(193, '2013-07-11 15:41:47', 1, 9, '12', 'HTML/CSS', 2, '已修改 image_url 。'),
(194, '2013-07-11 15:43:07', 1, 9, '26', 'Vim', 1, ''),
(195, '2013-07-12 00:51:15', 1, 13, '8', '其他', 1, ''),
(196, '2013-07-12 00:51:25', 1, 9, '18', '社区', 2, '已修改 type 。'),
(197, '2013-07-12 00:51:31', 1, 9, '14', '创业', 2, '已修改 type 。'),
(198, '2013-07-12 00:53:16', 1, 9, '6', 'Nginx', 2, '已修改 type 。'),
(199, '2013-07-12 00:53:24', 1, 9, '20', 'VPS', 2, '已修改 type 。'),
(200, '2013-07-12 00:54:35', 1, 13, '7', 'aaa', 2, '已修改 type 。'),
(201, '2013-07-12 00:55:43', 1, 13, '2', '服务器', 3, ''),
(202, '2013-07-12 00:58:32', 1, 9, '11', '设计', 2, '已修改 title 。'),
(203, '2013-07-12 01:01:14', 1, 9, '11', '设计', 2, '已修改 desc 。'),
(204, '2013-07-12 01:02:18', 1, 9, '19', 'MongoDB', 2, '已修改 desc 。'),
(205, '2013-07-12 01:13:18', 1, 9, '27', 'Backbone.js', 1, ''),
(206, '2013-07-12 01:15:21', 1, 9, '27', 'Backbone.js', 2, '已修改 desc 。'),
(207, '2013-07-12 01:16:25', 1, 9, '19', 'MongoDB', 2, '已修改 image_url 。'),
(208, '2013-07-12 01:20:25', 1, 13, '1', '数据库', 2, '已修改 type 。'),
(209, '2013-07-12 01:21:51', 1, 9, '28', '云', 1, ''),
(210, '2013-07-12 01:22:20', 1, 9, '28', '云', 2, '已修改 image_url 。'),
(211, '2013-07-12 01:23:19', 1, 9, '28', '云', 2, '已修改 desc 。'),
(212, '2013-07-12 01:27:08', 1, 9, '3', 'Python', 2, '已变更 desc for resource "Requests".'),
(213, '2013-07-12 01:28:15', 1, 9, '26', 'Vim', 2, '已添加 resource "Vim Tips".'),
(214, '2013-07-12 01:40:52', 1, 9, '23', 'Redis', 2, '已添加 resource "Redis入门指南". 已添加 resource "Redis官网".'),
(215, '2013-07-12 01:44:48', 1, 9, '19', 'MongoDB', 2, '已添加 resource "MongoDB权威指南".'),
(216, '2013-07-12 01:54:07', 1, 9, '14', '创业', 2, '已修改 image_url 。'),
(217, '2013-07-12 01:55:46', 1, 9, '14', '创业', 2, '已修改 image_url 。'),
(218, '2013-07-12 01:59:15', 1, 9, '29', '价值博客', 1, ''),
(219, '2013-07-12 02:06:22', 1, 9, '29', '价值媒体', 2, '已修改 title 。 已添加 resource "酷壳". 已添加 resource "外刊IT评论". 已添加 resource "InfoQ中文".'),
(220, '2013-07-12 02:26:44', 1, 9, '30', '酷站', 1, ''),
(221, '2013-07-12 02:38:12', 1, 9, '29', '价值媒体', 2, '已修改 desc 。 已添加 resource "博客园-精华". 已添加 resource "博客园-知识库".'),
(222, '2013-07-12 03:07:48', 1, 9, '30', '酷站', 2, '已修改 desc 。 已添加 resource "连客". 已添加 resource "http://www.jue.so/". 已添加 resource "http://www.xichuangzhu.com/".'),
(223, '2013-07-12 03:13:16', 1, 9, '30', '酷站', 2, '已修改 desc 。'),
(224, '2013-07-12 03:13:50', 1, 9, '14', '创业', 2, '已修改 desc 。'),
(225, '2013-07-12 03:14:39', 1, 9, '29', '价值媒体', 2, '已变更 type for resource "InfoQ中文".'),
(226, '2013-07-12 03:15:41', 1, 9, '30', '酷站', 2, '已变更 title for resource "觉". 已变更 title 和 type for resource "西窗烛".'),
(227, '2013-07-12 05:34:14', 1, 9, '30', '酷站', 2, '已添加 resource "书格".'),
(228, '2013-07-12 05:46:17', 1, 9, '30', '酷站', 2, '已修改 desc 。 已添加 resource "下厨房". 已添加 resource "Knewone". 已添加 resource "吾志".'),
(229, '2013-07-12 05:48:17', 1, 9, '30', '酷站', 2, '已修改 desc 。 已添加 resource "茴香".'),
(230, '2013-07-12 05:53:12', 1, 9, '30', '酷站', 2, '已修改 desc 。'),
(231, '2013-07-12 05:53:37', 1, 13, '7', '开发/部署', 2, '已修改 type 。'),
(232, '2013-07-12 05:55:16', 1, 9, '29', '价值媒体', 2, '已修改 desc 。'),
(233, '2013-07-12 06:01:19', 1, 9, '29', '价值媒体', 2, '已修改 image_url 。'),
(234, '2013-07-12 06:03:36', 1, 9, '31', '独立博客', 1, ''),
(235, '2013-07-12 06:06:29', 1, 9, '30', '酷站', 2, '已添加 resource "GuruDigger".'),
(236, '2013-07-12 06:07:12', 1, 9, '14', '创业', 2, '已删除 resource "36Kr". 已删除 resource "GuruDigger". 已删除 resource "Paul Graham".'),
(237, '2013-07-12 06:07:43', 1, 9, '14', '创业', 2, '没有字段被修改。'),
(238, '2013-07-12 06:08:10', 1, 9, '29', '价值媒体', 2, '已添加 resource "36Kr".'),
(239, '2013-07-12 06:16:34', 1, 9, '30', '酷站', 2, '已添加 resource "V2EX".'),
(240, '2013-07-12 06:16:39', 1, 9, '18', '社区', 2, '已删除 resource "V2EX".'),
(241, '2013-07-12 06:22:19', 1, 7, '67', '酷壳', 2, '已修改 node 。'),
(242, '2013-07-12 06:25:57', 1, 9, '30', '酷站', 2, '已修改 image_url 。'),
(243, '2013-07-12 06:31:50', 1, 7, '84', '鸸鹋动物园', 1, ''),
(244, '2013-07-12 06:36:43', 1, 7, '85', '坏脾气的小肥', 1, ''),
(245, '2013-07-12 06:39:02', 1, 7, '86', 'XDite', 1, ''),
(246, '2013-07-12 07:39:29', 1, 7, '87', '有趣的', 1, ''),
(247, '2013-07-12 07:46:45', 1, 7, '54', 'jQuery文档', 2, '已修改 node 。'),
(248, '2013-07-12 07:47:02', 1, 7, '28', 'jQuery基础教程', 2, '已修改 node 。'),
(249, '2013-07-12 07:55:07', 1, 9, '24', 'CoffeeScript', 3, ''),
(250, '2013-07-12 07:56:52', 1, 7, '88', 'HTML DOM', 1, ''),
(251, '2013-07-12 08:00:54', 1, 7, '89', 'JavaScript 教程', 1, ''),
(252, '2013-07-12 08:03:17', 1, 7, '50', 'MomentJs', 2, '已修改 title 。'),
(253, '2013-07-12 08:05:11', 1, 7, '90', 'HTML5教程', 1, ''),
(254, '2013-07-12 11:50:41', 1, 9, '28', '云平台', 2, '已修改 title 和 desc 。'),
(255, '2013-07-12 12:32:45', 1, 7, '91', 'ifanr', 1, ''),
(256, '2013-07-12 12:34:07', 1, 7, '92', 'i黑马', 1, ''),
(257, '2013-07-12 12:35:32', 1, 7, '93', 'TECH2IPO创见', 1, ''),
(258, '2013-07-12 12:37:20', 1, 7, '94', 'MongooseJs', 1, ''),
(259, '2013-07-12 12:46:00', 1, 7, '95', 'Calm', 1, ''),
(260, '2013-07-12 12:52:56', 1, 9, '28', '云平台', 2, '已修改 image_url 。'),
(261, '2013-07-12 12:54:09', 1, 9, '28', '云平台', 2, '已修改 image_url 。'),
(262, '2013-07-12 12:57:05', 1, 9, '29', '价值媒体', 2, '已删除 resource "博客园-知识库".'),
(263, '2013-07-12 12:57:57', 1, 9, '29', '媒体', 2, '已修改 title 和 desc 。'),
(264, '2013-07-12 12:58:07', 1, 9, '31', '价值博客', 2, '已修改 title 。'),
(265, '2013-07-12 12:58:23', 1, 7, '70', '博客园-精华', 2, '已修改 node 。'),
(266, '2013-07-12 13:00:51', 1, 9, '10', 'Javascript', 2, '已修改 desc 。'),
(267, '2013-07-12 13:04:39', 1, 9, '31', '价值博客', 2, '已修改 desc 。'),
(268, '2013-07-12 13:08:37', 1, 9, '28', '云平台', 2, '已修改 desc 。'),
(269, '2013-07-12 13:24:27', 1, 9, '28', '云平台', 2, '已修改 desc 。'),
(270, '2013-07-12 14:19:39', 1, 9, '11', '设计', 2, '没有字段被修改。'),
(271, '2013-07-12 14:24:04', 1, 9, '11', '设计', 2, '没有字段被修改。'),
(272, '2013-07-12 14:29:25', 1, 9, '11', '设计', 2, '没有字段被修改。'),
(273, '2013-07-12 14:30:10', 1, 9, '11', '设计', 2, '已添加 resource type "s".'),
(274, '2013-07-12 14:30:25', 1, 9, '11', '设计', 2, '没有字段被修改。'),
(275, '2013-07-12 14:32:17', 1, 9, '11', '设计', 2, '已变更 type for resource type "ss".'),
(276, '2013-07-12 14:32:26', 1, 9, '11', '设计', 2, '已变更 type for resource type "工具".'),
(277, '2013-07-12 14:37:12', 1, 9, '11', '设计', 2, '已添加 resource type "素材". 已添加 resource type "图书". 已添加 resource type "其他".'),
(278, '2013-07-12 16:18:14', 1, 9, '25', 'jQuery', 2, '已添加 resource type "图书". 已变更 type for resource "jQuery基础教程". 已变更 type for resource "jQuery文档".'),
(279, '2013-07-12 16:18:23', 1, 9, '25', 'jQuery', 2, '已变更 type for resource "jQuery基础教程".'),
(280, '2013-07-12 16:19:29', 1, 9, '11', '设计', 2, '已添加 resource type "字体". 已变更 type for resource "Icon Finder". 已变更 type for resource "Reeoo". 已变更 type for resource "Dribbble". 已变更 type for resource "写给大家看的设计书". 已变更 type for resource "设计中的设计". 已变更 type for resource "Typeland". 已变更 type for resource "Type is Beautiful". 已变更 type for resource "Niice". 已变更 type for resource "NAV80". 已变更 type for resource "Favicon Generator". 已变更 type for resource "EasyIcon".'),
(281, '2013-07-12 16:19:42', 1, 9, '11', '设计', 2, '已添加 resource type "灵感".'),
(282, '2013-07-12 16:20:16', 1, 9, '11', '设计', 2, '已变更 type for resource "Reeoo". 已变更 type for resource "Dribbble". 已变更 type for resource "Niice".'),
(283, '2013-07-13 00:59:19', 1, 9, '31', '价值博客', 2, '已添加 resource type "独立博客".'),
(284, '2013-07-13 00:59:32', 1, 9, '31', '价值博客', 2, '已变更 type for resource "酷壳". 已变更 type for resource "博客园-精华". 已变更 type for resource "Paul Graham". 已变更 type for resource "坏脾气的小肥". 已变更 type for resource "XDite".'),
(285, '2013-07-13 01:00:09', 1, 9, '30', '酷站', 2, '已添加 resource type "文化". 已添加 resource type "趣味". 已添加 resource type "社区".'),
(286, '2013-07-13 01:01:23', 1, 9, '30', '酷站', 2, '已添加 resource type "众筹". 已添加 resource type "导购".'),
(287, '2013-07-13 01:02:28', 1, 9, '30', '酷站', 2, '已添加 resource type "美食". 已变更 type for resource "连客". 已变更 type for resource "觉". 已变更 type for resource "西窗烛". 已变更 type for resource "书格". 已变更 type for resource "下厨房". 已变更 type for resource "Knewone". 已变更 type for resource "吾志". 已变更 type for resource "茴香". 已变更 type for resource "GuruDigger". 已变更 type for resource "V2EX". 已变更 type for resource "鸸鹋动物园". 已变更 type for resource "有趣的". 已变更 type for resource "Calm".'),
(288, '2013-07-13 01:03:22', 1, 9, '30', '酷站', 2, '已变更 type for resource type "购物". 已变更 type for resource type "生活". 已变更 type for resource "Knewone".'),
(289, '2013-07-13 01:10:35', 1, 9, '30', '酷站', 2, '已变更 type for resource "下厨房". 已变更 type for resource "吾志".'),
(290, '2013-07-13 01:12:01', 1, 9, '29', '媒体', 2, '已添加 resource type "创业". 已添加 resource type "程序员".'),
(291, '2013-07-13 01:24:36', 1, 9, '29', '媒体', 2, '已变更 type for resource "外刊IT评论". 已变更 type for resource "InfoQ中文". 已变更 type for resource "36Kr". 已变更 type for resource "ifanr". 已变更 type for resource "i黑马". 已变更 type for resource "TECH2IPO创见".'),
(292, '2013-07-13 02:02:52', 1, 9, '11', '设计', 2, '已变更 type for resource "Typeland". 已变更 type for resource "Type is Beautiful".'),
(293, '2013-07-13 02:54:41', 1, 9, '10', 'Javascript', 2, '已添加 resource type "图书". 已添加 resource type "文档". 已添加 resource type "教程". 已变更 type for resource "JavaScript高级程序设计". 已变更 type 和 desc for resource "CoffeeScript". 已变更 type for resource "CoffeeScript程序设计". 已变更 type for resource "HTML DOM". 已变更 type for resource "JavaScript 教程".'),
(294, '2013-07-13 02:55:16', 1, 9, '10', 'Javascript', 2, '已变更 type for resource "JavaScript高级程序设计". 已变更 type for resource "CoffeeScript". 已变更 type for resource "CoffeeScript程序设计". 已变更 type for resource "HTML DOM". 已变更 type for resource "JavaScript 教程".'),
(295, '2013-07-13 02:56:05', 1, 9, '10', 'Javascript', 2, '已修改 desc 。'),
(296, '2013-07-13 02:58:27', 1, 9, '26', 'Vim', 2, '已添加 resource type "教程". 已变更 type for resource "Vim Tips".'),
(297, '2013-07-13 02:58:36', 1, 9, '26', 'Vim', 2, '已变更 type for resource "Vim Tips".'),
(298, '2013-07-13 02:59:01', 1, 9, '23', 'Redis', 2, '已添加 resource type "图书". 已添加 resource type "官网". 已变更 type for resource "Redis入门指南". 已变更 type for resource "Redis官网".'),
(299, '2013-07-13 02:59:10', 1, 9, '23', 'Redis', 2, '已变更 type for resource "Redis入门指南". 已变更 type for resource "Redis官网".'),
(300, '2013-07-13 02:59:36', 1, 9, '19', 'MongoDB', 2, '已添加 resource type "图书". 已变更 type for resource "MongoDB权威指南".'),
(301, '2013-07-13 02:59:42', 1, 9, '19', 'MongoDB', 2, '已变更 type for resource "MongoDB权威指南".'),
(302, '2013-07-13 02:59:55', 1, 9, '17', 'PostgreSQL', 2, '已添加 resource type "官网". 已变更 type for resource "PostgreSQL官网".'),
(303, '2013-07-13 03:00:01', 1, 9, '17', 'PostgreSQL', 2, '已变更 type for resource "PostgreSQL官网".'),
(304, '2013-07-13 03:00:07', 1, 9, '15', 'MySQL', 2, '没有字段被修改。'),
(305, '2013-07-13 03:00:39', 1, 9, '13', 'NodeJs', 2, '已添加 resource type "文档". 已添加 resource type "社区". 已添加 resource type "图书". 已变更 type for resource "NodeJs文档". 已变更 type for resource "CNode社区". 已变更 type for resource "ExpressJs". 已变更 type for resource "MomentJs". 已变更 type for resource "MongooseJs".'),
(306, '2013-07-13 03:01:11', 1, 9, '13', 'NodeJs', 2, '已添加 resource type "框架". 已添加 resource type "类库". 已变更 type for resource "NodeJs文档". 已变更 type for resource "CNode社区". 已变更 type for resource "ExpressJs". 已变更 type for resource "MomentJs". 已变更 type for resource "MongooseJs".'),
(307, '2013-07-13 03:01:32', 1, 9, '13', 'NodeJs', 2, '已变更 type for resource "ExpressJs". 已变更 type for resource "MomentJs". 已变更 type for resource "MongooseJs".'),
(308, '2013-07-13 03:02:16', 1, 9, '12', 'HTML/CSS', 2, '已添加 resource type "教程". 已添加 resource type "技巧". 已添加 resource type "图书". 已变更 type for resource "CSS教程". 已变更 type for resource "CSS3教程". 已变更 type for resource "Modern Clean CSS “Sticky Footer”". 已变更 type for resource "LESS CSS". 已变更 type for resource "HTML教程". 已变更 type for resource "HTML5教程".'),
(309, '2013-07-13 03:02:44', 1, 9, '12', 'HTML/CSS', 2, '已变更 type for resource type "教程+文档". 已变更 type for resource "CSS教程". 已变更 type for resource "CSS3教程". 已变更 type for resource "Modern Clean CSS “Sticky Footer”". 已变更 type for resource "LESS CSS". 已变更 type for resource "HTML教程". 已变更 type for resource "HTML5教程".'),
(310, '2013-07-13 03:04:34', 1, 9, '12', 'HTML/CSS', 2, '已添加 resource type "动态样式语言". 已变更 title for resource "CSS". 已变更 title for resource "CSS3". 已变更 type for resource "LESS CSS". 已变更 title for resource "HTML". 已变更 title for resource "HTML5".'),
(311, '2013-07-13 03:04:42', 1, 9, '12', 'HTML/CSS', 2, '已变更 type for resource "LESS CSS".'),
(312, '2013-07-13 03:06:06', 1, 9, '12', 'HTML/CSS', 2, '已变更 type for resource type "教程". 已变更 desc for resource "CSS". 已变更 desc for resource "CSS3". 已变更 type for resource "Modern Clean CSS “Sticky Footer”". 已变更 desc for resource "HTML".'),
(313, '2013-07-13 03:07:10', 1, 9, '12', 'HTML/CSS', 2, '已变更 type for resource type "CSS预处理器".'),
(314, '2013-07-13 03:08:16', 1, 9, '12', 'HTML/CSS', 2, '已变更 type for resource type "CSS预处理".'),
(315, '2013-07-13 03:09:38', 1, 9, '12', 'HTML/CSS', 2, '已变更 desc for resource "LESS CSS".'),
(316, '2013-07-13 03:10:16', 1, 9, '9', 'Django', 2, '已添加 resource type "资源". 已添加 resource type "文档". 已添加 resource type "文档". 已变更 type for resource "Django中文文档". 已变更 type for resource "Django官网". 已变更 type for resource "Django站点合集".'),
(317, '2013-07-13 03:10:49', 1, 9, '9', 'Django', 2, '已删除 resource type "文档". 已变更 type for resource "Django中文文档". 已变更 type for resource "Django官网". 已变更 type for resource "Django站点合集".'),
(318, '2013-07-13 03:11:49', 1, 9, '9', 'Django', 2, '已变更 type for resource "Django中文文档". 已变更 type for resource "Django官网".'),
(319, '2013-07-13 03:13:30', 1, 9, '8', 'Flask', 2, '已添加 resource type "官网". 已添加 resource type "资源". 已添加 resource type "教程". 已添加 resource type "类库". 已变更 type for resource "Flask官方网站". 已变更 type for resource "Flask站点合集". 已变更 type for resource "The Flask Mega-Tutorial". 已变更 type for resource "Jinja2". 已变更 type for resource "Werkzeug".'),
(320, '2013-07-13 03:13:57', 1, 9, '8', 'Flask', 2, '已变更 type for resource "Flask官方网站". 已变更 type for resource "Flask站点合集". 已变更 type for resource "The Flask Mega-Tutorial". 已变更 type for resource "Jinja2". 已变更 type for resource "Werkzeug".'),
(321, '2013-07-13 03:14:14', 1, 9, '7', 'Linux', 2, '已添加 resource type "图书". 已变更 type for resource "鸟哥的私房菜". 已变更 type for resource "Linux从入门到精通". 已变更 type for resource "Linux Shell脚本攻略".'),
(322, '2013-07-13 03:14:21', 1, 9, '7', 'Linux', 2, '已变更 type for resource "鸟哥的私房菜". 已变更 type for resource "Linux从入门到精通". 已变更 type for resource "Linux Shell脚本攻略".'),
(323, '2013-07-13 03:14:46', 1, 9, '6', 'Nginx', 2, '已添加 resource type "教程". 已添加 resource type "图书". 已添加 resource type "文档". 已变更 type for resource "Nginx官网". 已变更 type for resource "学习Nginx HTTP Server". 已变更 type for resource "Nginx for Developers: An Introduction".'),
(324, '2013-07-13 03:15:04', 1, 9, '6', 'Nginx', 2, '已变更 type for resource "Nginx官网". 已变更 type for resource "学习Nginx HTTP Server". 已变更 type for resource "Nginx for Developers: An Introduction".'),
(325, '2013-07-13 03:15:44', 1, 9, '4', 'Bootstrap', 2, '已添加 resource type "文档". 已添加 resource type "文档". 已添加 resource type "主题". 已添加 resource type "资源". 已变更 type for resource "Bootstrap官网". 已变更 type for resource "Bootstrap中文". 已变更 type for resource "Bootswatch". 已变更 type for resource "Font Awesome".'),
(326, '2013-07-13 03:15:51', 1, 9, '4', 'Bootstrap', 2, '已删除 resource type "文档". 已变更 type for resource "Bootstrap官网". 已变更 type for resource "Bootstrap中文". 已变更 type for resource "Bootswatch". 已变更 type for resource "Font Awesome".'),
(327, '2013-07-13 03:16:05', 1, 9, '4', 'Bootstrap', 2, '已变更 type for resource "Bootswatch". 已变更 type for resource "Font Awesome".'),
(328, '2013-07-13 03:17:20', 1, 9, '3', 'Python', 2, '已添加 resource type "图书". 已添加 resource type "文档". 已添加 resource type "Package". 已变更 type for resource "Python学习手册". 已变更 type for resource "Python Cookbook". 已变更 type for resource "Python官方文档". 已变更 type for resource "Requests".'),
(329, '2013-07-13 03:17:33', 1, 9, '3', 'Python', 2, '已变更 type for resource "Python学习手册". 已变更 type for resource "Python Cookbook". 已变更 type for resource "Python官方文档". 已变更 type for resource "Requests".'),
(330, '2013-07-13 03:18:23', 1, 9, '2', 'Git', 2, '已添加 resource type "托管平台". 已添加 resource type "图书". 已变更 type for resource "GitHub". 已变更 type for resource "Pro Git". 已变更 type for resource "Git权威指南".'),
(331, '2013-07-13 03:18:33', 1, 9, '2', 'Git', 2, '已变更 type for resource "GitHub". 已变更 type for resource "Pro Git". 已变更 type for resource "Git权威指南".'),
(332, '2013-07-13 04:05:18', 1, 9, '4', 'Bootstrap', 2, '已变更 desc for resource "Bootstrap官网".'),
(333, '2013-07-13 04:14:24', 1, 9, '4', 'Bootstrap', 2, '已添加 resource type "类Bootstrap框架".'),
(334, '2013-07-13 04:45:36', 1, 9, '4', 'Bootstrap', 2, '已变更 type for resource type "Bootstrap/类Bootstrap". 已添加 resource "MetroUI".'),
(335, '2013-07-13 04:54:48', 1, 9, '4', 'Bootstrap', 2, '已添加 resource "Foundation".'),
(336, '2013-07-13 08:14:12', 1, 9, '26', 'Editor/IDE', 2, '已修改 title 。'),
(337, '2013-07-13 08:14:45', 1, 9, '26', 'Editor', 2, '已修改 title 。'),
(338, '2013-07-13 08:15:35', 1, 9, '26', 'Vim', 2, '已修改 title 。'),
(339, '2013-07-13 08:53:24', 1, 9, '22', 'Tornado', 2, '已修改 desc 。'),
(340, '2013-07-13 09:07:59', 1, 9, '25', 'jQuery', 2, '已添加 resource type "jQuery/UI组件". 已添加 resource "jQuery UI".'),
(341, '2013-07-13 09:08:15', 1, 9, '25', 'jQuery', 2, '已变更 type for resource "jQuery UI".'),
(342, '2013-07-13 10:31:28', 1, 9, '31', '价值博客', 2, '已添加 resource type "价值博客/博客平台".'),
(343, '2013-07-13 10:31:44', 1, 9, '31', '价值博客', 2, '已变更 type for resource "博客园-精华".'),
(344, '2013-07-13 13:48:37', 1, 9, '10', 'Javascript', 2, '已变更 desc for resource "HTML DOM". 已变更 desc for resource "JavaScript 教程".'),
(345, '2013-07-13 13:50:17', 1, 9, '31', '价值博客', 2, '已修改 desc 。'),
(346, '2013-07-22 13:07:12', 1, 9, '29', '媒体', 2, '已修改 image_url 。'),
(347, '2013-07-22 13:07:45', 1, 9, '31', '价值博客', 2, '已修改 image_url 。'),
(348, '2013-07-23 13:17:19', 1, 7, '100', '浣溪沙', 3, ''),
(349, '2013-07-23 13:39:34', 1, 9, '7', 'Linux', 2, '已添加 resource type "Linux/工具".'),
(350, '2013-07-24 01:11:07', 1, 7, '112', 'Linux', 3, ''),
(351, '2013-07-24 01:11:07', 1, 7, '111', '浣溪沙', 3, ''),
(352, '2013-07-24 01:11:07', 1, 7, '110', '浣溪沙', 3, ''),
(353, '2013-07-24 01:11:07', 1, 7, '109', '价值博客', 3, ''),
(354, '2013-07-24 01:11:07', 1, 7, '108', '价值博客', 3, ''),
(355, '2013-07-24 01:11:07', 1, 7, '107', 'Linux', 3, ''),
(356, '2013-07-24 01:11:07', 1, 7, '106', '浣溪沙', 3, ''),
(357, '2013-07-24 01:11:07', 1, 7, '105', '浣溪沙', 3, ''),
(358, '2013-07-24 01:11:07', 1, 7, '104', 'Linux', 3, ''),
(359, '2013-07-24 01:11:07', 1, 7, '103', '浣溪沙', 3, ''),
(360, '2013-07-24 01:13:11', 1, 9, '25', 'jQuery', 2, '已添加 resource type "jQuery/插件".'),
(361, '2013-07-24 01:13:25', 1, 7, '102', 'Jcrop', 2, '已修改 type 。'),
(362, '2013-07-24 08:58:44', 1, 7, '115', 's', 3, ''),
(363, '2013-07-24 08:58:44', 1, 7, '114', 's', 3, ''),
(364, '2013-07-25 05:20:20', 1, 9, '30', '酷站', 2, '已删除 resource type "酷站/自然". 已删除 resource type "酷站/搜索". 已删除 resource type "酷站/诉讼". 已删除 resource type "酷站/三四". 已删除 resource type "酷站/所". 已删除 resource type "酷站/搜索所". 已删除 resource type "酷站/搜索的".'),
(365, '2013-07-25 10:13:13', 1, 9, '7', 'Linux', 2, '已删除 resource type "Linux/图书".'),
(366, '2013-07-25 10:36:15', 1, 9, '6', 'Nginx', 2, '已删除 resource type "Nginx/教程".'),
(367, '2013-08-06 01:06:48', 1, 9, '30', '酷站', 2, '已删除 resource type "酷站/s". 已删除 resource type "酷站/文化".'),
(368, '2013-08-06 01:14:41', 1, 9, '30', '酷站', 2, '已删除 resource type "酷站/文化". 已删除 resource type "酷站/文化".'),
(369, '2013-08-06 01:22:42', 1, 9, '30', '酷站', 2, '已删除 resource "搜索". 已删除 resource "s". 已删除 resource "s".'),
(370, '2013-08-06 01:49:35', 1, 9, '30', '酷站', 2, '已删除 resource "百度".'),
(371, '2013-08-06 02:09:22', 1, 9, '30', '酷站', 2, '已删除 resource "百度". 已删除 resource "s". 已删除 resource "ss".'),
(372, '2013-08-07 13:09:53', 1, 7, '113', 'HOST700', 2, '已修改 create_time 。'),
(373, '2013-08-07 13:10:14', 1, 7, '113', 'HOST700', 2, '已修改 create_time 。'),
(374, '2013-08-07 13:10:28', 1, 7, '113', 'HOST700', 2, '已修改 create_time 。'),
(375, '2013-08-07 13:10:40', 1, 7, '113', 'HOST700', 2, '已修改 create_time 。'),
(376, '2013-08-07 13:10:48', 1, 7, '113', 'HOST700', 2, '已修改 create_time 。');

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'resource', 'resources', 'resource'),
(8, 'log entry', 'admin', 'logentry'),
(9, 'node', 'resources', 'node'),
(10, 'user', 'users', 'user'),
(11, 'node follow', 'resources', 'nodefollow'),
(12, 'resource collect', 'resources', 'resourcecollect'),
(13, 'node type', 'resources', 'nodetype'),
(14, 'resource type', 'resources', 'resourcetype'),
(15, 'resource comment', 'resources', 'resourcecomment');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4imff25hdjpdrhmosqhaqivdxyuje798', 'N2I1NTg3YWNmNWU0ZmI0NWY5YWQxZTQ1ZjIyNTQ0Y2Q0M2MwODNjYjqAAn1xAShVC3VzZXJfYXZhdGFycQJYngAAAGh0dHBzOi8vc2VjdXJlLmdyYXZhdGFyLmNvbS9hdmF0YXIvY2U3YTE2OWQyYzhjZjIxZjg2MmZjYjUxNzNkNDk0ZWY/ZD1odHRwczovL2EyNDguZS5ha2FtYWkubmV0L2Fzc2V0cy5naXRodWIuY29tJTJGaW1hZ2VzJTJGZ3JhdmF0YXJzJTJGZ3JhdmF0YXItdXNlci00MjAucG5nVQd1c2VyX2lkcQOKAQJVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQFVBHVzZXJxBFgGAAAAeXB0ZXN0dS4=', '2013-08-01 09:14:51'),
('x5iwxxnphzt9dovk69g8nk5o2p9yrwe7', 'ZjMxMDgxOThjYWEwYzQ1NTBjZjkwYTkxNmE5NDY3M2FmM2I5YjM1ZjqAAn1xAShVC3VzZXJfYXZhdGFycQJYngAAAGh0dHBzOi8vc2VjdXJlLmdyYXZhdGFyLmNvbS9hdmF0YXIvYTRhZTllZTIzOWFhNjYxMDllN2E0NGUyZWRiMmQ3NTc/ZD1odHRwczovL2EyNDguZS5ha2FtYWkubmV0L2Fzc2V0cy5naXRodWIuY29tJTJGaW1hZ2VzJTJGZ3JhdmF0YXJzJTJGZ3JhdmF0YXItdXNlci00MjAucG5nVQd1c2VyX2lkcQOKAQFVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVBHVzZXJxBFgHAAAAaHVzdGx6cHUu', '2013-08-20 14:39:41');

-- --------------------------------------------------------

--
-- 表的结构 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'yprogrammer.com', 'yprogrammer.com');

-- --------------------------------------------------------

--
-- 表的结构 `resources_node`
--

CREATE TABLE IF NOT EXISTS `resources_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `desc` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `resources_node`
--

INSERT INTO `resources_node` (`id`, `type_id`, `title`, `image_url`, `desc`, `create_time`) VALUES
(2, 7, 'Git', 'https://secure.gravatar.com/avatar/878a0ea898da1701df8573ed64a5cc9d?s=420&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-org-420.png', '最好的分布式版本控制软件', '2013-07-06 10:08:37'),
(3, 3, 'Python', 'http://astroleaks.lamost.org/wp-content/uploads/2012/03/Logo_Python.png', '简捷而清晰的脚本语言', '2013-07-06 10:27:46'),
(4, 5, 'Bootstrap', 'https://si0.twimg.com/profile_images/2623842034/1c246mhexl0hsiekbwcp.png', '不懂前端也可以独立做界面啦', '2013-07-06 10:47:27'),
(6, 7, 'Nginx', 'http://www.72xit.com/wp-content/uploads/2012/09/nginx.gif', '属于21世纪的Web服务器', '2013-07-06 11:41:32'),
(7, 7, 'Linux', 'http://cdn1.iconfinder.com/data/icons/iconshock_developer/linux.png', '开发环境和部署环境都是它啦', '2013-07-06 11:55:49'),
(8, 4, 'Flask', 'http://flask.pocoo.org/docs/_static/flask.png', 'Python Micro Web Framework', '2013-07-07 04:19:40'),
(9, 4, 'Django', 'http://timg1.tuicool.com/images/topics/b/11130001.png', '最火的Python full-stack框架', '2013-07-07 04:30:53'),
(10, 3, 'Javascript', 'https://github.com/voodootikigod/logo.js/diff_blob/4576aabdc9a12acaccee307fe60f7ae7a125dbdb/js.jpg?raw=true', '世界上误解最深的语言 ', '2013-07-08 05:21:41'),
(11, 6, '设计', 'http://cdn1.iconfinder.com/data/icons/prettyoffice/128/application.png', '不懂设计的程序员不是好CEO', '2013-07-08 06:11:30'),
(12, 5, 'HTML/CSS', 'http://www.sautinsoft.com/images/modern/html5-logo-200x200.png', '超文本标记语言+级联样式表', '2013-07-08 07:54:32'),
(13, 4, 'NodeJs', 'http://cdn-img.easyicon.net/png/10972/1097215.gif', '在服务器端使用Javascript', '2013-07-11 06:39:55'),
(15, 1, 'MySQL', 'http://cdn-img.easyicon.net/png/10692/1069208.gif', '最流行的开源关系数据库', '2013-07-11 11:11:05'),
(17, 1, 'PostgreSQL', 'http://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/220px-Postgresql_elephant.svg.png', '开源关系数据库中的新星', '2013-07-11 12:20:00'),
(19, 1, 'MongoDB', 'http://www.joyent.com/content/07-blog/722-joyent-to-sponsor-and-present-at-mongosv-2012/mongodb-leaf.png', '最流行的NoSQL数据库', '2013-07-11 13:30:37'),
(20, 7, 'VPS', 'http://cdn1.iconfinder.com/data/icons/jigsoar-icons/64/_server.png', '没玩过VPS的趁早了', '2013-07-11 14:21:04'),
(21, 7, 'Sublime Text', 'http://www.daqianduan.com/wp-content/uploads/2012/11/sublime_text.png', '最火的编辑器', '2013-07-11 14:40:45'),
(22, 4, 'Tornado', 'http://www.pythoner.cn/static_m/media/uploads/blog/python_pythoner_cn_2013060827.jpg', '性能最好的Python Web框架', '2013-07-11 15:12:04'),
(23, 1, 'Redis', 'http://www.unixstickers.com/image/cache/data/stickers/redis/redis.sh-600x600.png', '高性能的key-value数据库', '2013-07-11 15:15:11'),
(25, 5, 'jQuery', 'http://www.easyicon.net/api/resize_png_new.php?id=1094520&size=96', '最流行的Javascript库', '2013-07-11 15:39:51'),
(26, 7, 'Vim', 'http://wiki.ubuntu.org.cn/images/thumb/f/f7/Vim_logo.png/200px-Vim_logo.png', '编辑器之神', '2013-07-11 15:43:05'),
(27, 5, 'Backbone.js', 'http://file.mrbool.com/mrbool/articles/MuhammadAzamuddin/BackBoneEvents/BackBoneEvents01.png', '流行的前端MVC框架', '2013-07-12 01:13:15'),
(28, 7, '云平台', 'http://icons.iconarchive.com/icons/visualpharm/icons8-metro-style/512/It-Infrastructure-Cloud-icon.png', '只在此山中，云深不知处', '2013-07-12 01:21:49'),
(29, 8, '媒体', 'https://cdn1.iconfinder.com/data/icons/free-3d-social-icons/png/256x256/RSS.png', '有价值的科技媒体', '2013-07-12 01:59:10'),
(30, 8, '酷站', 'http://cdn-img.easyicon.net/png/11102/1110270.gif', 'Small but beautiful', '2013-07-12 02:26:42'),
(31, 8, '价值博客', 'https://cdn1.iconfinder.com/data/icons/free-3d-social-icons/png/256x256/RSS.png', '阅读需要深度', '2013-07-12 06:02:35');

-- --------------------------------------------------------

--
-- 表的结构 `resources_nodefollow`
--

CREATE TABLE IF NOT EXISTS `resources_nodefollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_nodefollow_6340c63c` (`user_id`),
  KEY `resources_nodefollow_e453c5c5` (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `resources_nodefollow`
--

INSERT INTO `resources_nodefollow` (`id`, `user_id`, `node_id`, `order`, `create_time`) VALUES
(44, 1, 30, 0, '2013-07-12 03:15:17'),
(47, 1, 31, 0, '2013-07-12 07:50:59'),
(49, 1, 11, 0, '2013-07-13 02:25:32'),
(72, 1, 25, 0, '2013-07-20 03:04:06'),
(73, 1, 8, 0, '2013-07-20 03:05:33'),
(76, 1, 29, 0, '2013-07-20 03:06:01'),
(92, 3, 30, 0, '2013-07-21 04:28:25'),
(93, 3, 29, 0, '2013-07-21 04:28:39'),
(97, 3, 23, 0, '2013-07-21 11:16:34'),
(99, 3, 13, 0, '2013-07-21 15:35:18'),
(101, 3, 4, 0, '2013-07-21 15:44:59'),
(102, 3, 25, 0, '2013-07-22 09:49:06'),
(107, 3, 6, 0, '2013-07-22 11:57:28'),
(109, 1, 17, 0, '2013-07-22 13:55:20'),
(111, 1, 23, 0, '2013-07-22 13:55:22'),
(112, 1, 3, 0, '2013-07-22 13:55:23'),
(113, 1, 10, 0, '2013-07-22 13:55:24'),
(114, 1, 9, 0, '2013-07-22 13:55:25'),
(115, 1, 13, 0, '2013-07-22 13:55:27'),
(116, 1, 12, 0, '2013-07-22 13:55:28'),
(117, 1, 2, 0, '2013-07-22 13:55:31'),
(118, 1, 6, 0, '2013-07-22 13:55:32'),
(120, 1, 26, 0, '2013-07-22 13:55:34'),
(121, 1, 20, 0, '2013-07-22 13:55:36'),
(123, 1, 4, 0, '2013-08-05 03:10:38'),
(124, 1, 21, 0, '2013-08-05 09:48:10'),
(125, 1, 7, 0, '2013-08-17 13:09:55');

-- --------------------------------------------------------

--
-- 表的结构 `resources_nodetype`
--

CREATE TABLE IF NOT EXISTS `resources_nodetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `resources_nodetype`
--

INSERT INTO `resources_nodetype` (`id`, `type`) VALUES
(1, '数据库'),
(3, '语言'),
(4, '后端'),
(5, '前端'),
(6, '设计'),
(7, '开发/部署'),
(8, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `resources_resource`
--

CREATE TABLE IF NOT EXISTS `resources_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `rank` float NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL,
  `c_url` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_resource_e453c5c5` (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- 转存表中的数据 `resources_resource`
--

INSERT INTO `resources_resource` (`id`, `node_id`, `creator_id`, `title`, `type_id`, `desc`, `rank`, `url`, `c_url`, `create_time`) VALUES
(3, 2, 1, 'GitHub', 81, '最火的代码托管平台哦！', 0, 'https://github.com', 'https://github.com', '2013-07-06 10:09:09'),
(5, 2, 1, 'Pro Git', 82, 'Git官方网站。比较好的资源包括：电子书《Pro Git》，各平台的Git客户端软件。', 0, 'http://git-scm.com/book', 'git-scm.com/book', '2013-07-06 10:26:22'),
(6, 3, 1, 'Python学习手册', 78, '讲解Python语言比较详细的一本书，缺点是非常罗嗦！', 0, 'http://book.douban.com/subject/6049132/', 'book.douban.com/subject/6049132', '2013-07-06 10:45:41'),
(7, 3, 1, 'Python Cookbook', 78, '关于Python的各种有用技巧的手册，非常赞哦！', 0, 'http://book.douban.com/subject/4828875/', 'book.douban.com/subject/4828875', '2013-07-06 10:45:43'),
(8, 3, 1, 'Python官方文档', 79, '官方文档哦！最权威的啦！包括2个主流稳定版本：2.7和3.3。新手建议看看Tutorial。参考的话主要看Language Reference（语言参考）、Library Reference（类库参考）。还有一个东西不错：PEP（改进Python的各种提案）。', 0, 'http://www.python.org/doc/', 'python.org/doc', '2013-07-06 10:45:45'),
(9, 4, 1, 'Bootstrap官网', 74, '官方网站哦！最新的Bootstrap会在这里新鲜出炉！', 0, 'http://twitter.github.io/bootstrap/', 'twitter.github.io/bootstrap', '2013-07-06 10:51:40'),
(10, 4, 1, 'Bootstrap中文', 74, '最赞的一个中文网站哦！其中还有相当多的与Bootstrap相关的资源！', 0, 'http://www.bootcss.com/', 'bootcss.com', '2013-07-06 10:55:59'),
(14, 6, 1, 'Nginx官网', 73, 'Nginx的官方网站，不过貌似有点寒暄哈！', 0, 'http://wiki.nginx.org/Main', 'wiki.nginx.org/Main', '2013-07-06 11:45:17'),
(15, 6, 1, '学习Nginx HTTP Server', 72, '中文翻译版，新手入门推荐哦！', 0, 'http://book.douban.com/subject/10519268/', 'book.douban.com/subject/10519268', '2013-07-06 11:46:37'),
(16, 6, 1, 'Nginx for Developers: An Introduction', 71, '其实Nginx官网的文档对新手来说，压力会很大。这篇文章让你从零开始！', 0, 'http://carrot.is/coding/nginx_introduction', 'carrot.is/coding/nginx_introduction', '2013-07-06 11:53:43'),
(17, 7, 1, '鸟哥的私房菜', 70, '最具知名度的Linux入门书啦！', 0, 'http://book.douban.com/subject/4889838/', 'book.douban.com/subject/4889838', '2013-07-06 11:57:46'),
(18, 7, 1, 'Linux从入门到精通', 70, '非常适合Linux新手的中文书啦！', 0, 'http://book.douban.com/subject/4189498/', 'book.douban.com/subject/4189498', '2013-07-06 11:58:58'),
(19, 7, 1, 'Linux Shell脚本攻略', 70, '学习Shell编程的一本入门好书哦！', 0, 'http://book.douban.com/subject/6889456/', 'book.douban.com/subject/6889456', '2013-07-06 12:01:47'),
(20, 8, 1, 'Flask官方网站', 66, '文档、扩展、代码片段什么的非常有价值哦！', 0, 'http://flask.pocoo.org/', 'flask.pocoo.org', '2013-07-07 04:30:21'),
(21, 8, 1, 'Flask站点合集', 67, '收集各种使用flask制作的网站哦！有的带GitHub源码哦！', 0, 'http://flasksites.org/', 'flasksites.org', '2013-07-07 04:30:13'),
(22, 9, 1, 'Django中文文档', 64, 'Django Book的中文版哦！翻译接近尾声啦！', 0, 'http://djangobook.py3k.cn/2.0/', 'djangobook.py3k.cn/2.0', '2013-07-07 04:42:14'),
(23, 9, 1, 'Django官网', 64, 'Django官方网站啦！', 0, 'https://www.djangoproject.com/', 'https://www.djangoproject.com', '2013-07-07 04:49:24'),
(24, 9, 1, 'Django站点合集', 63, '不得不说使用Django做的网站真TM多啊！', 0, 'http://www.djangosites.org/', 'djangosites.org', '2013-07-07 04:47:45'),
(26, 10, 1, 'JavaScript高级程序设计', 46, '浓墨重彩的Javascript语言画卷。', 0, 'http://book.douban.com/subject/10546125/', 'book.douban.com/subject/10546125', '2013-07-08 05:26:29'),
(27, 10, 1, 'CoffeeScript', 47, '让编写js变得有趣而高效。', 0, 'http://coffeescript.org/', 'coffeescript.org', '2013-07-08 05:33:12'),
(28, 25, 1, 'jQuery基础教程', 34, '目前为止最好的jQuery学习书籍。', 0, 'http://book.douban.com/subject/10569608/', 'book.douban.com/subject/10569608', '2013-07-08 05:41:09'),
(29, 10, 1, 'CoffeeScript程序设计', 46, '不错的CoffeeScript书籍。', 0, 'http://book.douban.com/subject/20509115/', 'book.douban.com/subject/20509115', '2013-07-08 06:00:41'),
(30, 8, 1, 'The Flask Mega-Tutorial', 68, '非常不错的Flask建站教程。', 0, 'http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world', 'blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world', '2013-07-08 06:02:06'),
(31, 4, 1, 'Bootswatch', 76, '12套非常nice的Bootstrap主题！', 0, 'http://bootswatch.com/', 'bootswatch.com', '2013-07-08 06:05:50'),
(32, 11, 1, 'Icon Finder', 30, '国外非常棒的icon搜索引擎。', 0, 'http://www.iconfinder.com/', 'iconfinder.com', '2013-07-08 06:12:37'),
(33, 11, 1, 'Reeoo', 36, '根据颜色分类的酷站集合。', 0, 'http://reeoo.com/', 'reeoo.com', '2013-07-08 06:13:14'),
(34, 11, 1, 'Dribbble', 36, '设计师的GitHub，你懂的。', 0, 'http://dribbble.com/', 'dribbble.com', '2013-07-08 06:14:00'),
(35, 11, 1, '写给大家看的设计书', 31, '关于设计的入门圣经。', 0, 'http://book.douban.com/subject/3323633/', 'book.douban.com/subject/3323633', '2013-07-08 06:16:11'),
(36, 11, 1, '设计中的设计', 31, '设计不仅仅是外在的表现，也是内在的品味。', 0, 'http://book.douban.com/subject/4230237/', 'book.douban.com/subject/4230237', '2013-07-08 06:17:41'),
(37, 2, 1, 'Git权威指南', 82, '国产Git好书，适合进阶者。', 0, 'http://book.douban.com/subject/6526452/', 'book.douban.com/subject/6526452', '2013-07-08 06:20:06'),
(38, 12, 1, 'CSS', 59, 'CSS教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/css/index.asp', 'w3school.com.cn/css/index.asp', '2013-07-08 07:59:10'),
(39, 12, 1, 'CSS3', 59, 'CSS3教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/css3/index.asp', 'w3school.com.cn/css3/index.asp', '2013-07-08 08:00:30'),
(40, 12, 1, 'Modern Clean CSS “Sticky Footer”', 60, '固定footer的纯CSS实现。', 0, 'http://mystrd.at/modern-clean-css-sticky-footer/', 'mystrd.at/modern-clean-css-sticky-footer', '2013-07-08 08:05:14'),
(41, 11, 1, 'Typeland', 35, '致力于通过数字化的方式复刻古籍字体。', 0, 'http://typeland.com/', 'typeland.com', '2013-07-08 08:10:35'),
(42, 11, 1, 'Type is Beautiful', 35, '一个关于文字设计和视觉文化的网站。', 0, 'http://www.typeisbeautiful.com/', 'typeisbeautiful.com', '2013-07-08 08:12:57'),
(43, 11, 1, 'Niice', 36, '设计灵感搜索引擎。', 0, 'http://www.niice.co/', 'niice.co', '2013-07-08 08:16:09'),
(44, 11, 1, 'NAV80', 23, '设计师网站导航。', 0, 'http://nav80.com/', 'nav80.com', '2013-07-08 08:49:20'),
(45, 4, 1, 'Font Awesome', 77, '非常nice的一套icon font，可与Bootstrap无缝集成。', 0, 'http://fontawesome.io/', 'fontawesome.io', '2013-07-08 10:11:33'),
(46, 13, 1, 'NodeJs文档', 54, 'NodeJs官方文档。', 0, 'http://nodejs.org/api/', 'nodejs.org/api', '2013-07-11 09:04:04'),
(47, 13, 1, 'CNode社区', 55, 'NodeJs中文社区', 0, 'http://cnodejs.org/', 'cnodejs.org', '2013-07-11 09:04:04'),
(48, 12, 1, 'LESS CSS', 62, '最流行的CSS预处理器。', 0, 'http://www.lesscss.net/', 'lesscss.net', '2013-07-11 10:14:34'),
(49, 13, 1, 'ExpressJs', 57, 'Express中文文档', 0, 'http://expressjs.com/', 'expressjs.com', '2013-07-11 10:19:23'),
(50, 13, 1, 'MomentJs', 58, '非常棒的日期处理js类库', 0, 'http://momentjs.com/', 'momentjs.com', '2013-07-11 10:19:23'),
(53, 11, 1, 'Favicon Generator', 23, '非常好用的一款在线icon生成器。', 0, 'http://www.favicon.cc/', 'favicon.cc', '2013-07-11 10:50:59'),
(54, 25, 1, 'jQuery文档', 33, 'jQuery官方文档', 0, 'http://api.jquery.com/', 'api.jquery.com', '2013-07-11 10:57:02'),
(55, 11, 1, 'EasyIcon', 30, '国内出品的图标搜索引擎。', 0, 'http://www.easyicon.net/', 'easyicon.net', '2013-07-11 10:58:13'),
(56, 8, 1, 'Jinja2', 69, '好用到爆的模板引擎！', 0, 'http://jinja.pocoo.org/docs/', 'jinja.pocoo.org/docs', '2013-07-11 11:16:47'),
(57, 8, 1, 'Werkzeug', 69, 'WSGI工具集。', 0, 'http://werkzeug.pocoo.org/docs/', 'werkzeug.pocoo.org/docs', '2013-07-11 11:20:17'),
(58, 12, 1, 'HTML', 59, 'HTML教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/html/index.asp', 'w3school.com.cn/html/index.asp', '2013-07-11 12:01:24'),
(60, 3, 1, 'Requests', 80, '超级棒的Python HTTP库！', 0, 'http://docs.python-requests.org/en/latest/', 'docs.python-requests.org/en/latest', '2013-07-11 12:12:11'),
(61, 17, 1, 'PostgreSQL官网', 53, 'PostgreSQL官方网站', 0, 'http://www.postgresql.org/', 'postgresql.org', '2013-07-11 12:21:11'),
(63, 26, 1, 'Vim Tips', 49, '来自Vim的每日点滴', 0, 'http://vim-tips.com/', 'vim-tips.com', '2013-07-12 01:28:15'),
(64, 23, 1, 'Redis入门指南', 50, '国内第一本关于Redis的书。', 0, 'http://book.douban.com/subject/24522045/', 'book.douban.com/subject/24522045', '2013-07-12 01:40:52'),
(65, 23, 1, 'Redis官网', 51, 'Redis官方网站。', 0, 'http://www.redis.io/', 'redis.io', '2013-07-12 01:40:52'),
(66, 19, 1, 'MongoDB权威指南', 52, '非常好的MongoDB入门书。', 0, 'http://book.douban.com/subject/6068947/', 'book.douban.com/subject/6068947', '2013-07-12 01:44:48'),
(67, 31, 1, '酷壳', 37, '享受编程和技术所带来的快乐。', 0, 'http://coolshell.cn/', 'coolshell.cn', '2013-07-12 02:06:22'),
(68, 29, 1, '外刊IT评论', 45, '翻译外文IT精华。', 0, 'http://www.aqee.net/', 'aqee.net', '2013-07-12 02:06:22'),
(69, 29, 1, 'InfoQ中文', 45, '促进软件开发领域知识与创新的传播', 0, 'http://www.infoq.com/cn/', 'infoq.com/cn', '2013-07-12 02:06:22'),
(70, 31, 1, '博客园-精华', 85, '博客园的精华博文。', 0, 'http://www.cnblogs.com/pick/', 'cnblogs.com/pick', '2013-07-12 02:38:12'),
(72, 30, 1, '连客', 39, '过一个有趣的周末。', 0, 'http://www.linkkk.com/', 'linkkk.com', '2013-07-12 03:07:48'),
(73, 30, 1, '觉', 41, '发起、支持、分享创意项目。', 0, 'http://www.jue.so/', 'jue.so', '2013-07-12 03:07:48'),
(74, 30, 1, '西窗烛', 38, '品味经典文学。', 0, 'http://www.xichuangzhu.com/', 'xichuangzhu.com', '2013-07-12 03:07:48'),
(75, 30, 1, '书格', 38, '有品格的数字古籍图书馆。', 0, 'http://shuge.org/', 'shuge.org', '2013-07-12 05:34:14'),
(76, 30, 1, '下厨房', 43, '唯有爱与美食不可辜负。', 0, 'http://www.xiachufang.com/', 'xiachufang.com', '2013-07-12 05:46:17'),
(77, 30, 1, 'Knewone', 42, 'Geek物品导购。', 0, 'http://knewone.com/', 'knewone.com', '2013-07-12 05:46:17'),
(78, 30, 1, '吾志', 43, '注重隐私、简单轻快的日记本。', 0, 'http://5diary.com/', '5diary.com', '2013-07-12 05:46:17'),
(79, 30, 1, '茴香', 39, '属于你的句子收藏本', 0, 'http://huixiang.im/', 'huixiang.im', '2013-07-12 05:48:17'),
(80, 31, 1, 'Paul Graham', 37, '硅谷创业教父Paul Graham的博客。', 0, 'http://paulgraham.com/articles.html', 'paulgraham.com/articles.html', '2013-07-12 06:03:36'),
(81, 30, 1, 'GuruDigger', 40, '帮助靠谱的互联网产品找到志同道合的创业合作工程师。', 0, 'http://gurudigger.com/', 'gurudigger.com', '2013-07-12 06:06:29'),
(82, 29, 1, '36Kr', 45, '关注互联网创业。', 0, 'http://www.36kr.com/', '36kr.com', '2013-07-12 06:08:10'),
(83, 30, 1, 'V2EX', 40, '国内质量最高的创意论坛。', 0, 'http://www.v2ex.com', 'v2ex.com', '2013-07-12 06:16:34'),
(84, 30, 1, '鸸鹋动物园', 40, '宠物社区。', 0, 'http://www.ermiao.com/', 'ermiao.com', '2013-07-12 06:31:50'),
(85, 31, 1, '坏脾气的小肥', 37, '寂静岭的向阳岸。', 0, 'http://firecacada.blog.163.com/', 'firecacada.blog.163.com', '2013-07-12 06:36:43'),
(86, 31, 1, 'XDite', 37, '台湾ROR资深博主。', 0, 'http://blog.xdite.net/', 'blog.xdite.net', '2013-07-12 06:39:02'),
(87, 30, 1, '有趣的', 40, '清新、温暖的社区。', 0, 'http://youqu.de/', 'youqu.de', '2013-07-12 07:39:29'),
(88, 10, 1, 'HTML DOM', 48, 'HTML DOM教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/htmldom/index.asp', 'w3school.com.cn/htmldom/index.asp', '2013-07-12 07:56:52'),
(89, 10, 1, 'JavaScript 教程', 48, 'JavaScript教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/js/index.asp', 'w3school.com.cn/js/index.asp', '2013-07-12 08:00:54'),
(90, 12, 1, 'HTML5', 59, 'HTML5教程+参考手册，W3school出品。', 0, 'http://www.w3school.com.cn/html5/index.asp', 'w3school.com.cn/html5/index.asp', '2013-07-12 08:05:11'),
(91, 29, 1, 'ifanr', 44, '全景关注移动互联网。', 0, 'http://www.ifanr.com/', 'ifanr.com', '2013-07-12 12:32:45'),
(92, 29, 1, 'i黑马', 44, '找灵感，挖黑马，评热点，超本质。', 0, 'http://www.iheima.com/', 'iheima.com', '2013-07-12 12:34:07'),
(93, 29, 1, 'TECH2IPO创见', 44, '关注互联网创业与科技创业创新。', 0, 'http://tech2ipo.com/', 'tech2ipo.com', '2013-07-12 12:35:32'),
(94, 13, 1, 'MongooseJs', 58, 'Elegant mongodb object modeling for node.js', 0, 'http://mongoosejs.com/', 'mongoosejs.com', '2013-07-12 12:37:20'),
(95, 30, 1, 'Calm', 39, '放松神站！', 0, 'http://www.calm.com/', 'calm.com', '2013-07-12 12:46:00'),
(96, 4, 1, 'MetroUI', 83, 'Win8风格的前端组建集。', 0, 'http://metroui.org.ua/', 'metroui.org.ua', '2013-07-13 04:45:36'),
(97, 4, 1, 'Foundation', 83, '最好的响应式前端框架。', 0, 'http://foundation.zurb.com/', 'foundation.zurb.com', '2013-07-13 04:54:48'),
(98, 25, 1, 'jQuery UI', 84, '基于jQuery的一套Web UI组建集。', 0, 'http://jqueryui.com/', 'jqueryui.com', '2013-07-13 09:07:59'),
(99, 30, 1, '念', 39, '你的理想清单。', 0, 'http://nian.so/', 'nian.so', '2013-07-23 09:48:07'),
(101, 7, 1, '多终端管理器tmux使用详解', 86, '', 0, 'http://www.lampbo.org/others/opensource/tmux-multi-terminal-manager-usage-detail.html', 'lampbo.org/others/opensource/tmux-multi-terminal-manager-usage-detail.html', '2013-07-23 13:40:37'),
(102, 25, 1, 'Jcrop', 87, '最好的图片裁剪jQuery插件', 0, 'http://deepliquid.com/content/Jcrop.html', 'deepliquid.com/content/Jcrop.html', '2013-07-24 00:44:20'),
(113, 20, 1, 'HOST700', 88, '比较稳定的VPS。', 0, 'http://www.host700.com/', 'host700.com', '2013-07-30 13:09:51');

-- --------------------------------------------------------

--
-- 表的结构 `resources_resourcecollect`
--

CREATE TABLE IF NOT EXISTS `resources_resourcecollect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_resourcecollect_6340c63c` (`user_id`),
  KEY `resources_resourcecollect_217f3d22` (`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=185 ;

--
-- 转存表中的数据 `resources_resourcecollect`
--

INSERT INTO `resources_resourcecollect` (`id`, `user_id`, `resource_id`, `order`, `create_time`) VALUES
(6, 1, 45, 0, '2013-07-11 01:52:42'),
(15, 1, 23, 0, '2013-07-11 05:01:14'),
(16, 1, 24, 0, '2013-07-11 05:01:19'),
(17, 1, 22, 0, '2013-07-11 05:01:21'),
(20, 1, 27, 0, '2013-07-11 05:18:39'),
(22, 1, 39, 0, '2013-07-11 05:24:40'),
(23, 1, 40, 0, '2013-07-11 05:24:41'),
(24, 1, 38, 0, '2013-07-11 05:24:42'),
(26, 1, 5, 0, '2013-07-11 05:28:55'),
(28, 1, 3, 0, '2013-07-11 05:28:56'),
(29, 1, 8, 0, '2013-07-11 05:29:02'),
(33, 1, 43, 0, '2013-07-11 05:29:10'),
(34, 1, 42, 0, '2013-07-11 05:29:11'),
(37, 1, 34, 0, '2013-07-11 05:29:16'),
(38, 1, 33, 0, '2013-07-11 05:29:17'),
(41, 1, 20, 0, '2013-07-11 05:51:08'),
(42, 1, 21, 0, '2013-07-11 05:51:09'),
(45, 1, 14, 0, '2013-07-11 05:51:29'),
(49, 1, 31, 0, '2013-07-11 05:58:00'),
(50, 1, 10, 0, '2013-07-11 05:58:01'),
(51, 1, 9, 0, '2013-07-11 05:58:02'),
(52, 1, 46, 0, '2013-07-11 09:04:10'),
(53, 1, 47, 0, '2013-07-11 09:04:12'),
(54, 1, 49, 0, '2013-07-11 10:19:30'),
(55, 1, 50, 0, '2013-07-11 10:19:31'),
(59, 1, 55, 0, '2013-07-11 10:58:30'),
(63, 1, 58, 0, '2013-07-11 12:01:35'),
(65, 1, 48, 0, '2013-07-11 13:56:27'),
(67, 1, 61, 0, '2013-07-11 14:01:09'),
(71, 1, 70, 0, '2013-07-12 03:15:10'),
(73, 1, 67, 0, '2013-07-12 03:15:12'),
(74, 1, 68, 0, '2013-07-12 03:15:13'),
(75, 1, 69, 0, '2013-07-12 03:15:14'),
(77, 1, 74, 0, '2013-07-12 03:15:46'),
(79, 1, 64, 0, '2013-07-12 03:15:50'),
(80, 1, 65, 0, '2013-07-12 03:15:53'),
(83, 1, 76, 0, '2013-07-12 05:46:24'),
(84, 1, 77, 0, '2013-07-12 05:46:25'),
(85, 1, 78, 0, '2013-07-12 05:46:26'),
(88, 1, 81, 0, '2013-07-12 07:30:35'),
(89, 1, 79, 0, '2013-07-12 07:30:36'),
(90, 1, 82, 0, '2013-07-12 07:50:55'),
(91, 1, 86, 0, '2013-07-12 07:50:59'),
(93, 1, 85, 0, '2013-07-12 07:51:01'),
(94, 1, 80, 0, '2013-07-12 07:51:04'),
(104, 1, 36, 0, '2013-07-13 02:48:42'),
(106, 1, 32, 0, '2013-07-13 02:48:57'),
(107, 1, 53, 0, '2013-07-13 02:49:00'),
(108, 1, 35, 0, '2013-07-13 02:49:01'),
(110, 1, 63, 0, '2013-07-13 08:29:42'),
(116, 1, 60, 0, '2013-07-14 06:11:41'),
(119, 3, 89, 0, '2013-07-21 11:18:23'),
(120, 3, 98, 0, '2013-07-21 11:21:39'),
(126, 3, 9, 0, '2013-07-22 10:06:32'),
(128, 3, 16, 0, '2013-07-22 10:20:01'),
(129, 3, 97, 0, '2013-07-22 11:19:57'),
(137, 3, 15, 0, '2013-07-22 11:47:26'),
(150, 1, 83, 0, '2013-07-22 12:23:44'),
(152, 1, 101, 0, '2013-07-23 13:40:37'),
(153, 1, 95, 0, '2013-07-23 15:03:04'),
(167, 1, 99, 0, '2013-07-25 04:29:26'),
(169, 1, 113, 0, '2013-08-05 08:35:00'),
(173, 1, 113, 0, '2013-08-06 01:33:17'),
(174, 1, 28, 0, '2013-08-07 13:20:56'),
(175, 1, 92, 0, '2013-08-07 13:23:08'),
(176, 1, 54, 0, '2013-08-07 13:24:32'),
(177, 1, 19, 0, '2013-08-07 13:25:17'),
(178, 1, 90, 0, '2013-08-07 13:29:59'),
(179, 1, 6, 0, '2013-08-07 13:31:43'),
(182, 1, 97, 0, '2013-08-07 13:48:49'),
(183, 1, 98, 0, '2013-08-07 13:49:08'),
(184, 1, 102, 0, '2013-08-07 13:50:48');

-- --------------------------------------------------------

--
-- 表的结构 `resources_resourcecomment`
--

CREATE TABLE IF NOT EXISTS `resources_resourcecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_resourcecomment_6340c63c` (`user_id`),
  KEY `resources_resourcecomment_217f3d22` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `resources_resourcetype`
--

CREATE TABLE IF NOT EXISTS `resources_resourcetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_resourcetype_e453c5c5` (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- 转存表中的数据 `resources_resourcetype`
--

INSERT INTO `resources_resourcetype` (`id`, `node_id`, `type`) VALUES
(23, 11, '工具'),
(30, 11, '素材'),
(31, 11, '图书'),
(32, 11, '其他'),
(33, 25, '文档'),
(34, 25, '图书'),
(35, 11, '字体'),
(36, 11, '灵感'),
(37, 31, '独立博客'),
(38, 30, '文化'),
(39, 30, '趣味'),
(40, 30, '社区'),
(41, 30, '众筹'),
(42, 30, '购物'),
(43, 30, '生活'),
(44, 29, '创业'),
(45, 29, '程序员'),
(46, 10, '图书'),
(47, 10, '文档'),
(48, 10, '教程'),
(49, 26, '教程'),
(50, 23, '图书'),
(51, 23, '官网'),
(52, 19, '图书'),
(53, 17, '官网'),
(54, 13, '文档'),
(55, 13, '社区'),
(56, 13, '图书'),
(57, 13, '框架'),
(58, 13, '类库'),
(59, 12, '教程'),
(60, 12, '技巧'),
(61, 12, '图书'),
(62, 12, 'CSS预处理'),
(63, 9, '资源'),
(64, 9, '文档'),
(66, 8, '官网'),
(67, 8, '资源'),
(68, 8, '教程'),
(69, 8, '类库'),
(70, 7, '图书'),
(71, 6, '教程'),
(72, 6, '图书'),
(73, 6, '文档'),
(74, 4, '文档'),
(76, 4, '主题'),
(77, 4, '资源'),
(78, 3, '图书'),
(79, 3, '文档'),
(80, 3, 'Package'),
(81, 2, '托管平台'),
(82, 2, '图书'),
(83, 4, '类Bootstrap'),
(84, 25, 'UI组件'),
(85, 31, '博客平台'),
(86, 7, '工具'),
(87, 25, '插件'),
(88, 20, '供应商');

-- --------------------------------------------------------

--
-- 表的结构 `users_user`
--

CREATE TABLE IF NOT EXISTS `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar_url` varchar(200) NOT NULL,
  `blog` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `users_user`
--

INSERT INTO `users_user` (`id`, `name`, `email`, `avatar_url`, `blog`, `location`, `create_time`) VALUES
(1, 'hustlzp', 'hustlzp@qq.com', 'https://secure.gravatar.com/avatar/a4ae9ee239aa66109e7a44e2edb2d757?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png', 'http://hustlzp.com', 'China', '2013-07-08 14:34:58'),
(3, 'yptest', '724475543@qq.com', 'https://secure.gravatar.com/avatar/ce7a169d2c8cf21f862fcb5173d494ef?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png', '', '', '2013-07-20 08:38:27');

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `resources_nodefollow`
--
ALTER TABLE `resources_nodefollow`
  ADD CONSTRAINT `node_id_refs_id_7c148e7c` FOREIGN KEY (`node_id`) REFERENCES `resources_node` (`id`),
  ADD CONSTRAINT `user_id_refs_id_68036169` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- 限制表 `resources_resource`
--
ALTER TABLE `resources_resource`
  ADD CONSTRAINT `node_id_refs_id_43a459cb` FOREIGN KEY (`node_id`) REFERENCES `resources_node` (`id`);

--
-- 限制表 `resources_resourcecollect`
--
ALTER TABLE `resources_resourcecollect`
  ADD CONSTRAINT `resource_id_refs_id_918affa1` FOREIGN KEY (`resource_id`) REFERENCES `resources_resource` (`id`),
  ADD CONSTRAINT `user_id_refs_id_6f98c28e` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- 限制表 `resources_resourcecomment`
--
ALTER TABLE `resources_resourcecomment`
  ADD CONSTRAINT `resource_id_refs_id_52030b3c` FOREIGN KEY (`resource_id`) REFERENCES `resources_resource` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8d6ac48` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- 限制表 `resources_resourcetype`
--
ALTER TABLE `resources_resourcetype`
  ADD CONSTRAINT `node_id_refs_id_03a86401` FOREIGN KEY (`node_id`) REFERENCES `resources_node` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
