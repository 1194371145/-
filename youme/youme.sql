-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 09 月 23 日 22:46
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `youme`
--

-- --------------------------------------------------------

--
-- 表的结构 `ym_admin`
--

CREATE TABLE IF NOT EXISTS `ym_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ym_admin`
--

INSERT INTO `ym_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(5, 'admin2', 'e10adc3949ba59abbe56e057f20f883e'),
(6, 'admin3', 'c33367701511b4f6020ec61ded352059');

-- --------------------------------------------------------

--
-- 表的结构 `ym_article`
--

CREATE TABLE IF NOT EXISTS `ym_article` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `keywords` varchar(150) NOT NULL COMMENT '关键词',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `pic` varchar(100) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击量',
  `cateid` mediumint(9) NOT NULL,
  `time` int(10) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ym_article`
--

INSERT INTO `ym_article` (`id`, `title`, `keywords`, `desc`, `pic`, `content`, `click`, `cateid`, `time`) VALUES
(2, '测试文章2', '测试文章2,花儿', '                                                                        测试文章2                                                                ', '/static/uploads/20160722/f07a874e3ada6273383eb68b5cb90cae.jpg', '<p>测试文章2测试文章2测试文章2测试文章2测试文章2</p>', 33, 9, 1469164846),
(3, '测试文章3', '测试,花儿', '                                                                    ', '', '                                                                        \r\n                                ', 57, 8, 1469174889),
(4, '测试文章4', '测试文章4', '                                    测试文章4                                ', '/static/uploads/20160722/b0b8ed61c5bad2ba7546ff3eb6ef6382.jpg', '<p>测试文章4测试文章4测试文章4</p>', 32, 8, 1469176297),
(5, '测试文章5', '测试,文章', '                                                                                                            测试文章1测试文章1                                                                                                ', '', '<p>测试文章1测试文章1测试文章1测试文章1</p>', 70, 8, 1469271904);

-- --------------------------------------------------------

--
-- 表的结构 `ym_cate`
--

CREATE TABLE IF NOT EXISTS `ym_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `catename` varchar(30) NOT NULL COMMENT '栏目名称',
  `keywords` varchar(150) NOT NULL COMMENT '栏目关键词',
  `desc` text NOT NULL COMMENT '栏目描述',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '栏目类型0：列表 1：留言',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ym_cate`
--

INSERT INTO `ym_cate` (`id`, `catename`, `keywords`, `desc`, `type`) VALUES
(8, '大生活', '大生活', '                       ', 0),
(9, '光影斑斓', '光影斑斓', '光影斑斓        ', 0),
(10, '如是观', '如是观', '如是观                                                                                                                                                                              ', 0),
(17, '留言本', '留言本', '                                    圈圈说                                                                                                                                                                                                     ', 1),
(14, '圈圈说', '圈圈说', '                                                                        留言本                                                                                                                                                                                                                                                 ', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ym_guest`
--

CREATE TABLE IF NOT EXISTS `ym_guest` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `homepage` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `face` varchar(150) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `artid` mediumint(9) NOT NULL DEFAULT '0',
  `pid` mediumint(9) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ym_guest`
--

INSERT INTO `ym_guest` (`id`, `nickname`, `email`, `homepage`, `content`, `face`, `level`, `artid`, `pid`, `time`) VALUES
(1, 'fsadf', 'dfasdf@qq.com', 'www.122.com', 'sdfsdf', '', 1, 0, 0, 1469539481),
(2, 'fsadf2', 'dfasd2f@qq.com', 'www.12222.com', 'sdfsdf2', '', 1, 0, 0, 1469539687),
(3, '童攀', 'tongpan@qq.com', 'www.12222.com', '童攀童攀童攀童攀童攀童攀童攀童攀', '', 1, 0, 0, 1469539721),
(4, '童年', 'tongnian@qq.com', 'www.12222.com', '童年童年童年童年童年童年童年童年童年童年童年童年童年', '', 1, 0, 0, 1469539739),
(5, '天天', 'tongnian@qq.com', 'www.12222.com', '天天天天天天天天天天天天天天天天天天天天', '', 1, 0, 0, 1469539760),
(6, 'dfsd', 'dfasdf@qq.com', 'www.12222.com', 'fasdfsdfsdf', '', 1, 0, 0, 1469542092),
(7, 'dfsd', 'dfasdf@qq.com', 'www.12222.com', 'sdfasdfsdf', '', 1, 0, 0, 1469542468);

-- --------------------------------------------------------

--
-- 表的结构 `ym_link`
--

CREATE TABLE IF NOT EXISTS `ym_link` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '链接标题',
  `desc` varchar(255) NOT NULL COMMENT '链接描述',
  `url` varchar(60) NOT NULL COMMENT '链接地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ym_link`
--

INSERT INTO `ym_link` (`id`, `title`, `desc`, `url`) VALUES
(1, '百度1', '百度百度百度百度百度', 'http://www.baidu.com'),
(2, 'title', 'desc', 'url'),
(4, 'asdf', 'asdf', 'asdf'),
(5, '11', '3', '2'),
(6, 'sdfsadf', 'asdf', 'sdfasdf'),
(8, 'sdfsd', 'asdfsdf', 'sadfsadf');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
