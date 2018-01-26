-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 01 月 24 日 14:01
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zheng`
--
CREATE DATABASE `zheng` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zheng`;

-- --------------------------------------------------------

--
-- 表的结构 `zheng_admin`
--

CREATE TABLE IF NOT EXISTS `zheng_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `zheng_admin`
--

INSERT INTO `zheng_admin` (`id`, `username`, `password`) VALUES
(1, '1', ''),
(2, '2', 'c81e728d9d4c2f636f067f89cc1486'),
(3, '3', 'c81e728d9d4c2f636f067f89cc1486'),
(4, '4', 'a87ff679a2f3e71d9181a67b754212'),
(5, '5', 'e4da3b7fbbce2345d7772b0674a318');

-- --------------------------------------------------------

--
-- 表的结构 `zheng_book`
--

CREATE TABLE IF NOT EXISTS `zheng_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '书名',
  `shuhao` varchar(30) NOT NULL COMMENT '书号',
  `zuoze` varchar(30) NOT NULL COMMENT '作者',
  `chubanshe` varchar(30) NOT NULL COMMENT '出版社',
  `tuijianren` varchar(30) NOT NULL COMMENT '荐书人',
  `tel` int(30) NOT NULL COMMENT '联系方式',
  `addtime` varchar(20) NOT NULL COMMENT '添加时间',
  `type` int(11) NOT NULL COMMENT '类型1为学生。2为老师',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `zheng_book`
--

INSERT INTO `zheng_book` (`id`, `name`, `shuhao`, `zuoze`, `chubanshe`, `tuijianren`, `tel`, `addtime`, `type`) VALUES
(1, '北京喜欢你', 'sumber', '北京', '32342', '3434', 343443, '1508422343', 1),
(2, '老北京故事', '34243', '3434', '454', '54', 54, '1508422361', 1),
(3, '天门时间', '23223', '434334', '4554', '5454', 6565, '1508422404', 1),
(4, '北京房车', '3232', '34', '34', '5454', 3443, '1508422503', 1),
(5, '北方的世界', '32234', '344354', '545454', '54', 5454, '1508422693', 1),
(6, '人民的名义', '32', '34', '34', '54', 65, '1508422975', 1),
(7, '北京欢迎你', '2323', '5454', '6556', '65566', 6556, '1508423123', 2),
(8, '天门时间', '3434', '54', '545465', '6565', 6565, '1508424903', 1),
(10, '北京欢迎你', '3443', '3434', '4334', '4554', 54, '1508425348', 1),
(11, '老师修炼手册', '欲s112', '老油条', '光三大学', '段位', 2147483647, '1508483902', 1),
(15, '老师的页面', '3232', '43234', '43', '34', 54, '1508571014', 2),
(13, '美特斯邦威', '老师推荐', '3223', '3443', '3443', 54544554, '1508568570', 2),
(14, '精彩人生', '23', '3223', '23', '23', 23, '1508568688', 1),
(16, '老师你好', '3223', '34', '34', '34', 54, '1508571118', 2),
(17, '43', '43', '34', '34', '34', 43, '1508660070', 2),
(18, '2332', '4343', '34', '34', '43', 34, '1508677847', 1),
(19, '我啥都想看', 'ww323', '3223', '23423', '34432', 3223, '1508677944', 1),
(20, '4334', '5454', '54', '54', '54', 54, '1508678670', 1),
(23, '23', '23', '32', '34', '23', 34, '1508680122', 1),
(24, '2323', '3232', '2323', '23', '23', 23, '1508682816', 1),
(27, '1111', '111', '222', '333', '444', 5555, '1508720865', 1),
(28, ' 北京欢迎你', '3232', '23', '23', '23', 23, '1508732360', 1),
(29, '北京喜欢', '3223', '23', '32', '233', 23, '1508732602', 1),
(30, '43434', '343456454', '45', '5454', '54', 45, '1508733272', 1),
(31, '54', '656565', '7676', '67', '67678', 78, '1508733287', 2),
(32, '3434', '54', '6', '5665', '65', 4554, '1508733777', 2),
(33, '34', '45', '45', '45', '43', 2147483647, '1508767833', 1),
(34, '4554', '4554', '54', '4545', '5454', 2147483647, '1508768109', 1),
(35, '4544', '23', '3434', '34433434', '343434', 2147483647, '1508768135', 1),
(36, '235454', '32', '34', '34', '34', 2147483647, '1508768505', 1),
(37, '34344', '3434', '34', '3434', '3443', 2147483647, '1508769118', 1),
(38, '111', '111', '111', '111', '111', 2147483647, '1509325364', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
