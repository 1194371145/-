-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 01 月 26 日 09:26
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blog`
--
CREATE DATABASE `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE IF NOT EXISTS `blog_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(60) NOT NULL COMMENT '管理员用户名',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`id`, `username`, `password`, `pass`) VALUES
(1, '1', 'c4ca4238a0b923820dcc509a6f75849b', '2'),
(14, '7', '8f14e45fceea167a5a36dedd4bea2543', '7'),
(13, '6', '1679091c5a880faf6fb5e6087eb1b2dc', '6'),
(6, '2', 'c81e728d9d4c2f636f067f89cc14862c', ''),
(7, '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', ''),
(11, '4', 'a87ff679a2f3e71d9181a67b7542122c', '4'),
(12, '5', '1679091c5a880faf6fb5e6087eb1b2dc', '5');

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE IF NOT EXISTS `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(60) NOT NULL COMMENT '文章标题',
  `desc` varchar(255) NOT NULL COMMENT '文章描述',
  `pic` varchar(100) NOT NULL COMMENT '文章图片',
  `content` text NOT NULL COMMENT '文章内容',
  `cateid` int(11) NOT NULL COMMENT '文章所属栏目ID',
  `time` int(13) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`id`, `title`, `desc`, `pic`, `content`, `cateid`, `time`) VALUES
(2, '航海王启航', '航海王启航游戏', './Public/Uploads/2017-10-16/59e4b1cbe47b8.png', '&lt;p&gt;&lt;strong&gt;航海王启航游戏&lt;/strong&gt;&lt;/p&gt;', 8, 0),
(3, '美女游戏', '美女扑克', './Public/Uploads/2017-10-16/59e4b29b0c22e.png', '&lt;p&gt;&lt;em&gt;233232&lt;/em&gt;&lt;/p&gt;', 2, 0),
(4, '2332', '3232', './Public/Uploads/2017-10-16/59e4ba2a03830.png', '&lt;p&gt;4343&lt;/p&gt;', 4, 0),
(5, '23', '32322', './Public/Uploads/2017-10-16/59e4baa70159d.png', '&lt;p&gt;344343&lt;/p&gt;', 5, 0),
(11, '34', '344343', '', '&lt;p&gt;3443&lt;/p&gt;', 4, 0),
(12, '34', '233232', '', '&lt;p&gt;3443&lt;/p&gt;', 4, 0),
(7, '323', '23232', '', '&lt;p&gt;323232&lt;/p&gt;', 2, 0),
(8, '表单制作', '32343443', './Public/Uploads/2017-10-16/59e4c2cf29409.png', '&lt;p&gt;323232&lt;/p&gt;', 1508164303, 0),
(13, '34', '233232', '', '&lt;p&gt;3443&lt;/p&gt;', 5, 0),
(10, '4334', '4334', './Public/Uploads/2017-10-16/59e4c32ef28aa.png', '&lt;p&gt;545454&lt;/p&gt;', 8, 1508164398);

-- --------------------------------------------------------

--
-- 表的结构 `blog_cate`
--

CREATE TABLE IF NOT EXISTS `blog_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `catename` varchar(60) NOT NULL COMMENT '栏目名称',
  `sort` mediumint(9) NOT NULL COMMENT '栏目排序',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `blog_cate`
--

INSERT INTO `blog_cate` (`id`, `catename`, `sort`, `content`) VALUES
(1, '心情文章', 1, '0'),
(2, '名言散文', 2, '0'),
(3, '网站开发', 3, '0'),
(4, '人文杂志', 4, '0'),
(5, 'php栏目', 5, '0'),
(8, '游戏类', 11, '魅族头条，今日需要你的最美');

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE IF NOT EXISTS `blog_link` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `title` varchar(50) NOT NULL COMMENT '链接标题',
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `desc` varchar(100) NOT NULL COMMENT '链接的描述',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `blog_link`
--

INSERT INTO `blog_link` (`id`, `title`, `url`, `desc`, `sort`) VALUES
(2, 'php中文网', 'www.php.cn', 'php中文网', 1),
(11, '南京政府', 'www.nanjin.cv', '南京省', 5),
(9, '中文国际', 'www.china.com', '中国政府官网', 2),
(8, '百度中文', 'baidu.com', '百度公司', 3),
(10, '新浪官网', 'xinlang.com', '新浪网', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
