-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 10 月 27 日 12:00
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `db_oa`
--
CREATE DATABASE `db_oa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_oa`;

-- --------------------------------------------------------

--
-- 表的结构 `sp_dept`
--

CREATE TABLE IF NOT EXISTS `sp_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `sp_dept`
--

INSERT INTO `sp_dept` (`id`, `name`, `pid`, `sort`, `remark`) VALUES
(1, '管理部', 0, 1, '管理部门'),
(2, '技术部', 0, 4, '技术部下辖程序部和设计部'),
(3, '总裁办', 1, 2, '总裁办'),
(4, '财务部', 0, 3, '财务部'),
(5, '程序部', 2, 5, 'null'),
(6, '设计部', 2, 6, '222'),
(7, '运营部', 0, 7, 'null'),
(8, '人事部', 0, 8, 'null'),
(9, '行政部', 0, 9, 'null'),
(10, '运维部', 0, 77, '运维部'),
(11, '竞价部', 0, 55, '竞价部门');

-- --------------------------------------------------------

--
-- 表的结构 `sp_doc`
--

CREATE TABLE IF NOT EXISTS `sp_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `filepath` varchar(20) NOT NULL,
  `filename` varchar(20) NOT NULL,
  `hasfile` varchar(20) NOT NULL,
  `content` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `addtime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sp_doc`
--

INSERT INTO `sp_doc` (`id`, `title`, `filepath`, `filename`, `hasfile`, `content`, `author`, `addtime`) VALUES
(1, '你好，我说', '', '', '', '3434', '4334', '1505974532'),
(2, '问', '', '', '', '3434', '4334', '1505974637'),
(3, '多收款打款玩的', '', '344', '34', '43', '43', ''),
(4, '3232', '', '', '', '我1212121', '233223', '1506047600'),
(5, '322', '', '', '', '&lt;p&gt;3232323232&', '3223', '1506048051'),
(6, '4334', '', '', '', '&lt;p&gt;年后&lt;stron', '3434', '1506048087'),
(7, '呵呵', '', '', '', '&lt;p&gt;&lt;span&gt', '32', '1506048717'),
(8, '233', '', '', '', '&lt;p&gt;2323&lt;/p&', '23', '1506175800'),
(9, '年后', '', '9_thumb_G_1241511871', '1', '&lt;p&gt;3232&lt;/p&', '2332', '1506178457'),
(10, '笨蛋', '/Public/Upload/59c67', '10_thumb_G_124297343', '1', '&lt;p&gt;4343&lt;/p&', '33', '1506178539'),
(11, '林华华', '/Public/Upload/59c70', '10_thumb_G_124297343', '1', '&lt;p&gt;344334&lt;/', '3232', '1506217094'),
(12, '343', '', '', '', '&lt;p&gt;6556665&lt;', '3435', '1506225859'),
(13, '43434', '', '', '', '&lt;p&gt;43&lt;/p&gt', '43434343', '1506226061'),
(14, '6565', '', '', '', '&lt;p&gt;65&lt;/p&gt', '6565', '1506226073');

-- --------------------------------------------------------

--
-- 表的结构 `sp_email`
--

CREATE TABLE IF NOT EXISTS `sp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `file` varchar(255) NOT NULL,
  `hasfile` smallint(1) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `isread` smallint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sp_email`
--

INSERT INTO `sp_email` (`id`, `from_id`, `to_id`, `title`, `file`, `hasfile`, `filename`, `content`, `addtime`, `isread`) VALUES
(1, 11, 5, '4334', '', 0, '', '4334', 1506244064, 0),
(2, 11, 5, '34434', '', 0, '', '4554', 1506244094, 0),
(3, 11, 4, '3434', '', 0, '', '', 1506244447, 0),
(4, 11, 4, '2332', '/Public/Upload/2017-09-24/59c777aab56ce.jpg', 1, '9_thumb_P_1241511871787.jpg', '3223', 1506244522, 0),
(5, 11, 6, '323223', '/Public/Upload/2017-09-24/59c7780fb4377.jpg', 1, '9_P_1241511871575.jpg', '3434', 1506244623, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_knowledge`
--

CREATE TABLE IF NOT EXISTS `sp_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `descripatioh` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(40) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sp_knowledge`
--

INSERT INTO `sp_knowledge` (`id`, `title`, `thumb`, `picture`, `descripatioh`, `content`, `author`, `addtime`) VALUES
(1, '2332', '', '', '', '3434', '4334', 1506226758),
(2, 'niaho', '/Public/Upload/2017-09-24/thumb_59c7325816928.jpg', '/Public/Upload/2017-09-24/59c7325816928.jpg', '', '344343', '344343', 1506226776);

-- --------------------------------------------------------

--
-- 表的结构 `sp_user`
--

CREATE TABLE IF NOT EXISTS `sp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` char(32) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  `truename` varchar(40) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `birthday` date NOT NULL,
  `tel` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sp_user`
--

INSERT INTO `sp_user` (`id`, `username`, `password`, `nickname`, `truename`, `dept_id`, `sex`, `birthday`, `tel`, `email`, `remark`, `addtime`, `role_id`) VALUES
(3, '1', '1', '男神', '钟馗', 3, '男', '2017-09-03', '32', '3232', '323', 122313, 1),
(4, '43', '2332', '2', '李华', 8, '男', '2017-09-05', '2332', '2332@qq.com', '3223', 1505181580, 0),
(5, '43', '2332', '2', '434', 8, '男', '2017-09-05', '2332', '2332@qq.com', '3223', 1505700534, 0),
(6, '43', '2332', '2', '434', 8, '男', '2017-09-05', '2332', '2332@qq.com', '3223', 1505701539, 0),
(7, '43', '2332', '2', '434', 8, '男', '2017-09-05', '2332', '2332@qq.com', '3223', 1505701615, 0),
(10, '3232', '2332', '322323', '李华', 3, '男', '2017-09-14', '32', '32', '32', 1505784426, 0),
(11, '2', '2', '宝宝', '宝宝', 7, '男', '2017-09-06', '32', '2', '3323223', 1505798500, 2),
(12, '', '', '', '', 2, '', '0000-00-00', '', '', '', 0, 0),
(13, '', '', '', '', -1, '男', '0000-00-00', '', '', '', 1505918549, 0),
(14, '', '', '', '', -1, '男', '0000-00-00', '', '', '', 1505918906, 0);

-- --------------------------------------------------------

--
-- 表的结构 `szphp`
--

CREATE TABLE IF NOT EXISTS `szphp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
