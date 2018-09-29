/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-28 16:00:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lg_banner`
-- ----------------------------
DROP TABLE IF EXISTS `lg_banner`;
CREATE TABLE `lg_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `img_src` varchar(100) NOT NULL COMMENT '图片地址',
  `link_url` varchar(60) NOT NULL COMMENT '链接地址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型 1：商品 2：专题',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：显示 0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_banner
-- ----------------------------
INSERT INTO `lg_banner` VALUES ('8', 'banner3', '20171220/cd468730f9ceeb86eedab6616106e626.jpg', 'tongpankt.com', '1', '', '1', '1');
INSERT INTO `lg_banner` VALUES ('6', 'banner2', '20180403/62f786fd3fed88b4b383324f71c3695d.png', 'google.com', '1', '', '2', '1');
INSERT INTO `lg_banner` VALUES ('10', 'banner4', '20180403/bbeb0917651386dfb9a1e1a42a811e62.png', 'asdfasdf', '1', '', '3', '1');

-- ----------------------------
-- Table structure for `lg_cart`
-- ----------------------------
DROP TABLE IF EXISTS `lg_cart`;
CREATE TABLE `lg_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` mediumint(9) NOT NULL COMMENT '用户id',
  `goods_id` mediumint(9) NOT NULL COMMENT '商品id',
  `goods_num` mediumint(9) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `selected` tinyint(1) NOT NULL DEFAULT '1' COMMENT '选中状态：0未选中 1已选中',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_cart
-- ----------------------------
INSERT INTO `lg_cart` VALUES ('1', '1', '11', '13', '1');
INSERT INTO `lg_cart` VALUES ('2', '1', '9', '3', '1');

-- ----------------------------
-- Table structure for `lg_cate`
-- ----------------------------
DROP TABLE IF EXISTS `lg_cate`;
CREATE TABLE `lg_cate` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(30) NOT NULL COMMENT '栏目名称',
  `thumb` varchar(60) NOT NULL COMMENT '缩略图',
  `pid` smallint(6) NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `description` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_cate
-- ----------------------------
INSERT INTO `lg_cate` VALUES ('1', '女装', '20180403/0bc819fcbe734800270456ff975b88e8.png', '0', '50', '漂亮的女装');
INSERT INTO `lg_cate` VALUES ('2', '毛衫', '20180403/87ca067eaabc6efcc85af0fa17bb8fe5.jpg', '1', '50', '漂亮的毛衫');
INSERT INTO `lg_cate` VALUES ('3', '裙装', '20180403/ad25b2d2c1a3372221585561c123d01f.jpg', '1', '50', '好看的裙装');
INSERT INTO `lg_cate` VALUES ('4', '外套', '20180403/aefbb738e7ad6372b06af10fceb3b6ca.jpg', '1', '50', '');
INSERT INTO `lg_cate` VALUES ('5', '套装', '20180403/1d73a0d8cb2473eddb271fc9ee1927d1.jpg', '1', '50', '');
INSERT INTO `lg_cate` VALUES ('6', '裤装', '20180403/402832cf72774557eb2ba3ef4d0297fa.jpg', '1', '50', '');
INSERT INTO `lg_cate` VALUES ('7', '特色', '20180403/bbc2b064cc783ea26604758e541c78a0.jpg', '1', '50', '');
INSERT INTO `lg_cate` VALUES ('8', '男装', '20180403/dd1a14afe3c173142f2f7a29ecaaf18c.png', '0', '50', '');

-- ----------------------------
-- Table structure for `lg_collect`
-- ----------------------------
DROP TABLE IF EXISTS `lg_collect`;
CREATE TABLE `lg_collect` (
  `goods_id` mediumint(9) NOT NULL COMMENT '商品id',
  `uid` mediumint(9) NOT NULL COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_collect
-- ----------------------------
INSERT INTO `lg_collect` VALUES ('11', '1');
INSERT INTO `lg_collect` VALUES ('9', '1');

-- ----------------------------
-- Table structure for `lg_goods`
-- ----------------------------
DROP TABLE IF EXISTS `lg_goods`;
CREATE TABLE `lg_goods` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(60) NOT NULL COMMENT '商品名称',
  `thumb` varchar(60) NOT NULL COMMENT '缩略图',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价',
  `sale_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '库存量',
  `des_img` varchar(60) NOT NULL COMMENT '详情描述图',
  `weight` float NOT NULL COMMENT '重量',
  `weight_unit` char(2) NOT NULL COMMENT '重量单位 g,kg',
  `cate_id` smallint(6) NOT NULL COMMENT '所属栏目',
  `spe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_goods
-- ----------------------------
INSERT INTO `lg_goods` VALUES ('1', '圆领T-shirt', '20180506/9b7e2d68515cbbf14f33b821393f0e79.png', '100.00', '180.00', '0', '100', '20180506/e36b4cc7c0765f30e72bd2c002aacb46.png', '1', 'kg', '4', null);
INSERT INTO `lg_goods` VALUES ('2', '蓝色条纹衬衫', '20180510/45d989a112bc8eb137c70eb585482808.png', '200.00', '280.00', '0', '120', '20180510/fa4826c52bf2e6425f3fba30c41af9eb.png', '1', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('3', '时尚花裙', '20180510/c30dc5290b81e6a12b5781d5f3447cce.png', '220.00', '300.00', '0', '120', '20180510/3ad24a370a9f05e620813312a5ae80e4.png', '1', 'kg', '3', null);
INSERT INTO `lg_goods` VALUES ('4', '绿色t-shirt', '20180510/53497b4a5e71824ae292775c35cfaabc.png', '200.00', '260.00', '0', '200', '20180510/074b68f54a0c4dd0953af88e65f9546e.png', '1', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('5', '毛衫1', '20180510/0642f0121e18877cbef06fb26ea16a10.png', '120.00', '300.00', '0', '100', '20180510/2c7474e3872f15f9922f70ab07601fb6.png', '111', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('6', '毛衫2', '20180510/52afe4aaebf71be568c0a55901fe0924.png', '220.00', '400.00', '0', '100', '20180510/202ae7ec6afed30b7e646751e39639da.jpg', '111', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('7', '毛衫3', '20180510/c30327cdd8ace718c2d50d21f328052c.png', '300.00', '500.00', '0', '100', '20180518/5312873b1c4fb68d0bca0a5a2c4095c3.png', '1', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('8', '毛衫4', '20180510/6e4a0c69d1ff72841ce66a0b3053ea63.png', '300.00', '600.00', '0', '100', '20180510/d534c91f560fe64c66e10647c8235d2f.png', '1', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('9', '毛衫5', '20180510/768e0a2e0e767dcd245c716b312a3172.png', '400.00', '700.00', '0', '100', '20180510/3aede2cc88534b0decaa9dc7d836f966.png', '1', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('10', '毛衫6', '20180510/dcf7d1fe4fdbb4ca50c2c65aa3e3661f.png', '600.00', '800.00', '0', '100', '20180510/f97f2f2b5c663ee0e2defe55bb2c42bd.png', '1', 'kg', '0', null);
INSERT INTO `lg_goods` VALUES ('11', '毛衫7', '20180510/be9752a9de29e009f88c7975192177db.png', '400.00', '700.00', '0', '100', '20180518/2ec02d2695274a4a9e8a081fba4bfe82.png', '100', 'kg', '2', null);
INSERT INTO `lg_goods` VALUES ('13', 'test', '', '32.00', '23.00', '0', '23', '', '12', 'kg', '3', '1--2');

-- ----------------------------
-- Table structure for `lg_goods_spe`
-- ----------------------------
DROP TABLE IF EXISTS `lg_goods_spe`;
CREATE TABLE `lg_goods_spe` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `spe_id` smallint(5) unsigned NOT NULL COMMENT '所属专题'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_goods_spe
-- ----------------------------
INSERT INTO `lg_goods_spe` VALUES ('12', '1');
INSERT INTO `lg_goods_spe` VALUES ('12', '2');

-- ----------------------------
-- Table structure for `lg_photos`
-- ----------------------------
DROP TABLE IF EXISTS `lg_photos`;
CREATE TABLE `lg_photos` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `img_src` varchar(60) NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_photos
-- ----------------------------
INSERT INTO `lg_photos` VALUES ('1', '20180506/cd172f2788c78dc5226d7d05249b1f36.png', '1');
INSERT INTO `lg_photos` VALUES ('2', '20180506/6dea256e49ed26dc7979b856081b15ba.png', '1');
INSERT INTO `lg_photos` VALUES ('3', '20180510/588f7adbcf9a109e6dc9ab0e1792a0bb.png', '2');
INSERT INTO `lg_photos` VALUES ('4', '20180510/660e8bfb5c2cf5f06834c4070f7ff12b.png', '3');
INSERT INTO `lg_photos` VALUES ('5', '20180510/499dad27d457363354e0460ce9a5800d.png', '4');
INSERT INTO `lg_photos` VALUES ('6', '20180510/b76b8592be01ba8f20f4cfe4db36d36b.jpg', '5');
INSERT INTO `lg_photos` VALUES ('7', '20180510/e89e770051f43053640d4312777e4fb7.jpg', '5');
INSERT INTO `lg_photos` VALUES ('8', '20180510/9d527dc71e54e98e7073bed4c09437b8.jpg', '6');
INSERT INTO `lg_photos` VALUES ('9', '20180510/2248ad99a97f0b1f24ab89a53f43b39d.jpg', '6');
INSERT INTO `lg_photos` VALUES ('10', '20180510/fb60af003e35a62780d1795c92b0180c.jpg', '7');
INSERT INTO `lg_photos` VALUES ('11', '20180510/e6a237e27a1cc9c43be57fa9aa0297e6.jpg', '7');
INSERT INTO `lg_photos` VALUES ('12', '20180510/c1adde50a6620270d461ef4cb06aa1c3.png', '8');
INSERT INTO `lg_photos` VALUES ('13', '20180510/c8b33a0d9bc3f91ca47f7f60693b46c3.png', '8');
INSERT INTO `lg_photos` VALUES ('14', '20180510/534915403ff55dd6c30a63cb58f0195e.jpg', '9');
INSERT INTO `lg_photos` VALUES ('15', '20180510/218f07c6cf0214e5f0acdf567d92487c.jpg', '9');
INSERT INTO `lg_photos` VALUES ('16', '20180510/9ab9e1239259d1e0b3e5995c6e052d11.jpg', '10');
INSERT INTO `lg_photos` VALUES ('17', '20180510/25a7fa8e8f6308d68e454491a5f45cd7.jpg', '10');
INSERT INTO `lg_photos` VALUES ('18', '20180510/76f9d65e2302c597f90cb2c53fcbd9b2.jpg', '10');
INSERT INTO `lg_photos` VALUES ('19', '20180510/a01f5fa9790af4ab5c40fac02bb9fc91.jpg', '11');
INSERT INTO `lg_photos` VALUES ('20', '20180510/7268ecfdd4156c3a9c5409628014a6ce.jpg', '11');
INSERT INTO `lg_photos` VALUES ('21', '20180917/8b53eb90a1ac418b146d36750712ad35.jpg', '12');
INSERT INTO `lg_photos` VALUES ('22', '20180917/978074e61a1da781cadf488bc65894fb.jpg', '12');
INSERT INTO `lg_photos` VALUES ('23', '20180917/b592a19cd9876f34df7f005efbcb6801.jpg', '12');
INSERT INTO `lg_photos` VALUES ('24', '20180917/b12f245161db64db3293fcd931ec6561.png', '12');

-- ----------------------------
-- Table structure for `lg_special`
-- ----------------------------
DROP TABLE IF EXISTS `lg_special`;
CREATE TABLE `lg_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `spe_name` varchar(60) NOT NULL COMMENT '专题名称',
  `spe_img` varchar(60) NOT NULL COMMENT '专题图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_special
-- ----------------------------
INSERT INTO `lg_special` VALUES ('1', '热卖女装', '20180917\\49ca4fa39f72dafed64ebbb51253a1e1.jpg');
INSERT INTO `lg_special` VALUES ('2', '热卖男装', '20180917/1c165c32fc345a860b44b28f874a1777.jpg');

-- ----------------------------
-- Table structure for `lg_user`
-- ----------------------------
DROP TABLE IF EXISTS `lg_user`;
CREATE TABLE `lg_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(30) NOT NULL COMMENT '昵称',
  `head_src` varchar(150) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费',
  `reg_time` int(10) NOT NULL COMMENT '注册时间',
  `token` varchar(32) NOT NULL,
  `token_time` int(10) NOT NULL,
  `openid` varchar(100) NOT NULL COMMENT '微信返回openid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lg_user
-- ----------------------------
INSERT INTO `lg_user` VALUES ('1', '雨巷诗人', 'https://wx.qlogo.cn/mmopen/vi_32/F5TLpZ2HYSvwBooX5BbGPIK9N6xrAN4QomZYUvXVyiaoiaDqTmyjT4sLWAKRicEE1RjaWYNmmo90Z1OZibAM5IRAeQ/132', '0.00', '0.00', '1527833551', 'F3x7sPhkRYY5WHtkjI7x4eKGN0IfBdRa', '1529833279', 'oQSoM0bpgXtThRfwxwVmLzuO4U-E');

-- ----------------------------
-- Table structure for `mylaravel_user`
-- ----------------------------
DROP TABLE IF EXISTS `mylaravel_user`;
CREATE TABLE `mylaravel_user` (
  `user_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(22) CHARACTER SET utf8 DEFAULT NULL,
  `user_pwd` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mylaravel_user
-- ----------------------------
INSERT INTO `mylaravel_user` VALUES ('1', '1', '1');
INSERT INTO `mylaravel_user` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for `sl_action`
-- ----------------------------
DROP TABLE IF EXISTS `sl_action`;
CREATE TABLE `sl_action` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) NOT NULL DEFAULT '',
  `objectID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` varchar(255) NOT NULL,
  `project` mediumint(9) NOT NULL,
  `actor` varchar(30) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` text NOT NULL,
  `read` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_action
-- ----------------------------
INSERT INTO `sl_action` VALUES ('1', 'user', '1', ',0,', '0', 'admin', 'login', '2018-08-15 15:55:40', '', '', '0');
INSERT INTO `sl_action` VALUES ('2', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-13 14:26:33', '', '', '0');
INSERT INTO `sl_action` VALUES ('3', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-14 13:35:38', '', '', '0');
INSERT INTO `sl_action` VALUES ('4', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-17 14:49:00', '', '', '0');
INSERT INTO `sl_action` VALUES ('5', 'product', '1', ',1,', '0', 'admin', 'opened', '2018-09-17 17:20:41', '', '', '0');
INSERT INTO `sl_action` VALUES ('6', 'project', '1', ',1,', '1', 'admin', 'opened', '2018-09-17 17:35:38', '', '', '0');
INSERT INTO `sl_action` VALUES ('7', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-18 08:52:38', '', '', '0');
INSERT INTO `sl_action` VALUES ('8', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-18 08:58:32', '', '', '0');
INSERT INTO `sl_action` VALUES ('9', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-18 08:58:32', '', '', '0');
INSERT INTO `sl_action` VALUES ('10', 'todo', '1', ',0,', '0', 'admin', 'opened', '2018-09-18 09:27:32', '', '', '0');
INSERT INTO `sl_action` VALUES ('11', 'user', '1', ',0,', '0', 'admin', 'logout', '2018-09-18 11:21:52', '', '', '0');
INSERT INTO `sl_action` VALUES ('12', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-18 13:27:40', '', '', '0');
INSERT INTO `sl_action` VALUES ('13', 'user', '1', ',0,', '0', 'admin', 'logout', '2018-09-18 16:47:34', '', '', '0');
INSERT INTO `sl_action` VALUES ('14', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-18 16:47:36', '', '', '0');
INSERT INTO `sl_action` VALUES ('15', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-19 08:44:56', '', '', '0');
INSERT INTO `sl_action` VALUES ('16', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-19 13:11:49', '', '', '0');
INSERT INTO `sl_action` VALUES ('17', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-20 13:44:02', '', '', '0');
INSERT INTO `sl_action` VALUES ('18', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-21 13:13:20', '', '', '0');
INSERT INTO `sl_action` VALUES ('19', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-25 08:50:24', '', '', '0');
INSERT INTO `sl_action` VALUES ('20', 'user', '1', ',0,', '0', 'admin', 'login', '2018-09-26 08:45:37', '', '', '0');

-- ----------------------------
-- Table structure for `sl_branch`
-- ----------------------------
DROP TABLE IF EXISTS `sl_branch`;
CREATE TABLE `sl_branch` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_branch
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_bug`
-- ----------------------------
DROP TABLE IF EXISTS `sl_bug`;
CREATE TABLE `sl_bug` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toTask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toStory` mediumint(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `os` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(30) NOT NULL DEFAULT '',
  `hardware` varchar(30) NOT NULL,
  `found` varchar(30) NOT NULL DEFAULT '',
  `steps` text NOT NULL,
  `status` enum('active','resolved','closed') NOT NULL DEFAULT 'active',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `activatedCount` smallint(6) NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `openedBuild` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `resolvedBy` varchar(30) NOT NULL DEFAULT '',
  `resolution` varchar(30) NOT NULL DEFAULT '',
  `resolvedBuild` varchar(30) NOT NULL DEFAULT '',
  `resolvedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `duplicateBug` mediumint(8) unsigned NOT NULL,
  `linkBug` varchar(255) NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `caseVersion` smallint(6) NOT NULL DEFAULT '1',
  `result` mediumint(8) unsigned NOT NULL,
  `testtask` mediumint(8) unsigned NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_bug
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_build`
-- ----------------------------
DROP TABLE IF EXISTS `sl_build`;
CREATE TABLE `sl_build` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(150) NOT NULL,
  `scmPath` char(255) NOT NULL,
  `filePath` char(255) NOT NULL,
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `builder` char(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_build
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_burn`
-- ----------------------------
DROP TABLE IF EXISTS `sl_burn`;
CREATE TABLE `sl_burn` (
  `project` mediumint(8) unsigned NOT NULL,
  `date` date NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY (`project`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_burn
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_case`
-- ----------------------------
DROP TABLE IF EXISTS `sl_case`;
CREATE TABLE `sl_case` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(30) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `precondition` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `type` char(30) NOT NULL DEFAULT '1',
  `stage` varchar(255) NOT NULL,
  `howRun` varchar(30) NOT NULL,
  `scriptedBy` varchar(30) NOT NULL,
  `scriptedDate` date NOT NULL,
  `scriptStatus` varchar(30) NOT NULL,
  `scriptLocation` varchar(255) NOT NULL,
  `status` char(30) NOT NULL DEFAULT '1',
  `frequency` enum('1','2','3') NOT NULL DEFAULT '1',
  `order` tinyint(30) unsigned NOT NULL DEFAULT '0',
  `openedBy` char(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `lastEditedBy` char(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linkCase` varchar(255) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_case
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_casestep`
-- ----------------------------
DROP TABLE IF EXISTS `sl_casestep`;
CREATE TABLE `sl_casestep` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(3) unsigned NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `expect` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_casestep
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_company`
-- ----------------------------
DROP TABLE IF EXISTS `sl_company`;
CREATE TABLE `sl_company` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(120) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `fax` char(20) DEFAULT NULL,
  `address` char(120) DEFAULT NULL,
  `zipcode` char(10) DEFAULT NULL,
  `website` char(120) DEFAULT NULL,
  `backyard` char(120) DEFAULT NULL,
  `guest` enum('1','0') NOT NULL DEFAULT '0',
  `admins` char(255) DEFAULT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_company
-- ----------------------------
INSERT INTO `sl_company` VALUES ('1', 'Silergy', null, null, null, null, null, null, '0', ',admin,', '0');

-- ----------------------------
-- Table structure for `sl_config`
-- ----------------------------
DROP TABLE IF EXISTS `sl_config`;
CREATE TABLE `sl_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner` char(30) NOT NULL DEFAULT '',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL DEFAULT '',
  `key` char(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`owner`,`module`,`section`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_config
-- ----------------------------
INSERT INTO `sl_config` VALUES ('1', 'system', 'common', 'global', 'version', '1.0.0');
INSERT INTO `sl_config` VALUES ('2', 'system', 'common', 'global', 'flow', 'full');
INSERT INTO `sl_config` VALUES ('3', 'system', 'common', 'global', 'sn', 'bdcb97a893e6fc25c110f8e7e235f62b');
INSERT INTO `sl_config` VALUES ('35', 'system', 'mail', '', 'fromName', '');
INSERT INTO `sl_config` VALUES ('34', 'system', 'mail', '', 'fromAddress', '');
INSERT INTO `sl_config` VALUES ('33', 'system', 'mail', '', 'mta', 'sendcloud');
INSERT INTO `sl_config` VALUES ('32', 'system', 'mail', '', 'turnon', '1');
INSERT INTO `sl_config` VALUES ('31', 'system', 'mail', 'sendcloud', 'secretKey', '32');
INSERT INTO `sl_config` VALUES ('30', 'system', 'mail', 'sendcloud', 'accessKey', '32');

-- ----------------------------
-- Table structure for `sl_cron`
-- ----------------------------
DROP TABLE IF EXISTS `sl_cron`;
CREATE TABLE `sl_cron` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(20) NOT NULL,
  `h` varchar(20) NOT NULL,
  `dom` varchar(20) NOT NULL,
  `mon` varchar(20) NOT NULL,
  `dow` varchar(20) NOT NULL,
  `command` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `buildin` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL,
  `lastTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_cron
-- ----------------------------
INSERT INTO `sl_cron` VALUES ('1', '*', '*', '*', '*', '*', '', '监控定时任务', 'zentao', '1', 'normal', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('2', '30', '23', '*', '*', '*', 'moduleName=project&methodName=computeburn', '更新燃尽图', 'zentao', '1', 'normal', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('3', '0', '1', '*', '*', '*', 'moduleName=report&methodName=remind', '每日任务提醒', 'zentao', '1', 'normal', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('4', '*/5', '*', '*', '*', '*', 'moduleName=svn&methodName=run', '同步SVN', 'zentao', '1', 'stop', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('5', '*/5', '*', '*', '*', '*', 'moduleName=git&methodName=run', '同步GIT', 'zentao', '1', 'stop', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('6', '30', '0', '*', '*', '*', 'moduleName=backup&methodName=backup', '备份数据和附件', 'zentao', '1', 'normal', '0000-00-00 00:00:00');
INSERT INTO `sl_cron` VALUES ('7', '*/5', '*', '*', '*', '*', 'moduleName=mail&methodName=asyncSend', '异步发信', 'zentao', '1', 'normal', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `sl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sl_dept`;
CREATE TABLE `sl_dept` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL,
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` char(30) NOT NULL DEFAULT '',
  `function` char(255) NOT NULL DEFAULT '',
  `manager` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_dept
-- ----------------------------
INSERT INTO `sl_dept` VALUES ('1', '南阳', '0', ',1,', '1', '10', '', '', '');
INSERT INTO `sl_dept` VALUES ('2', '邓州', '1', ',1,2,', '2', '10', '', '', '');

-- ----------------------------
-- Table structure for `sl_doc`
-- ----------------------------
DROP TABLE IF EXISTS `sl_doc`;
CREATE TABLE `sl_doc` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `lib` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `views` smallint(5) unsigned NOT NULL,
  `addedBy` varchar(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_doc
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_doclib`
-- ----------------------------
DROP TABLE IF EXISTS `sl_doclib`;
CREATE TABLE `sl_doclib` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_doclib
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_effort`
-- ----------------------------
DROP TABLE IF EXISTS `sl_effort`;
CREATE TABLE `sl_effort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` char(30) NOT NULL DEFAULT '',
  `todo` enum('1','0') NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('1','2','3') NOT NULL DEFAULT '1',
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_effort
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_extension`
-- ----------------------------
DROP TABLE IF EXISTS `sl_extension`;
CREATE TABLE `sl_extension` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `code` varchar(30) NOT NULL,
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `license` text NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'extension',
  `site` varchar(150) NOT NULL,
  `zentaoCompatible` varchar(100) NOT NULL,
  `installedTime` datetime NOT NULL,
  `depends` varchar(100) NOT NULL,
  `dirs` text NOT NULL,
  `files` text NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `name` (`name`),
  KEY `addedTime` (`installedTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_extension
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_file`
-- ----------------------------
DROP TABLE IF EXISTS `sl_file`;
CREATE TABLE `sl_file` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pathname` char(50) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL DEFAULT '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extra` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_file
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_group`
-- ----------------------------
DROP TABLE IF EXISTS `sl_group`;
CREATE TABLE `sl_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `role` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  `acl` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_group
-- ----------------------------
INSERT INTO `sl_group` VALUES ('1', 'Administrator', 'admin', 'for administrator', '');
INSERT INTO `sl_group` VALUES ('2', 'Developer', 'dev', 'for developers', '');
INSERT INTO `sl_group` VALUES ('3', 'tester', 'qa', 'for testers', '');
INSERT INTO `sl_group` VALUES ('4', 'Project manager', 'pm', 'for project managers', '');
INSERT INTO `sl_group` VALUES ('5', 'Product manager', 'po', 'for product managers', '');
INSERT INTO `sl_group` VALUES ('6', 'Technical director', 'td', 'for technical director', '');
INSERT INTO `sl_group` VALUES ('7', 'Product director', 'pd', 'for product director', '');
INSERT INTO `sl_group` VALUES ('8', 'Quality director', 'qd', 'for quality director', '');
INSERT INTO `sl_group` VALUES ('9', 'Top manager', 'top', 'for top manager', '');
INSERT INTO `sl_group` VALUES ('10', 'Others', '', 'for others', '');
INSERT INTO `sl_group` VALUES ('11', 'guest', 'guest', 'For guest', '');

-- ----------------------------
-- Table structure for `sl_grouppriv`
-- ----------------------------
DROP TABLE IF EXISTS `sl_grouppriv`;
CREATE TABLE `sl_grouppriv` (
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` char(30) NOT NULL DEFAULT '',
  `method` char(30) NOT NULL DEFAULT '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_grouppriv
-- ----------------------------
INSERT INTO `sl_grouppriv` VALUES ('1', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('1', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('1', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('1', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('1', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'admin', 'checkDB');
INSERT INTO `sl_grouppriv` VALUES ('1', 'admin', 'checkWeak');
INSERT INTO `sl_grouppriv` VALUES ('1', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'admin', 'safe');
INSERT INTO `sl_grouppriv` VALUES ('1', 'api', 'debug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('1', 'api', 'sql');
INSERT INTO `sl_grouppriv` VALUES ('1', 'backup', 'backup');
INSERT INTO `sl_grouppriv` VALUES ('1', 'backup', 'change');
INSERT INTO `sl_grouppriv` VALUES ('1', 'backup', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'backup', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'backup', 'restore');
INSERT INTO `sl_grouppriv` VALUES ('1', 'branch', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'branch', 'manage');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('1', 'company', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'checkBugFree');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'checkConfig');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'checkRedmine');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'convertBugFree');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'convertRedmine');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'execute');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'selectSource');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'setBugfree');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'setConfig');
INSERT INTO `sl_grouppriv` VALUES ('1', 'convert', 'setRedmine');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'toggle');
INSERT INTO `sl_grouppriv` VALUES ('1', 'cron', 'turnon');
INSERT INTO `sl_grouppriv` VALUES ('1', 'custom', 'flow');
INSERT INTO `sl_grouppriv` VALUES ('1', 'custom', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'custom', 'restore');
INSERT INTO `sl_grouppriv` VALUES ('1', 'custom', 'set');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dept', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dept', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dept', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dept', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dept', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dev', 'api');
INSERT INTO `sl_grouppriv` VALUES ('1', 'dev', 'db');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'extend');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'newPage');
INSERT INTO `sl_grouppriv` VALUES ('1', 'editor', 'save');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'deactivate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'erase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'install');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'uninstall');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'upgrade');
INSERT INTO `sl_grouppriv` VALUES ('1', 'extension', 'upload');
INSERT INTO `sl_grouppriv` VALUES ('1', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('1', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('1', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('1', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('1', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'copy');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'manageMember');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'managePriv');
INSERT INTO `sl_grouppriv` VALUES ('1', 'group', 'manageView');
INSERT INTO `sl_grouppriv` VALUES ('1', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'batchDelete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'detect');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'reset');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'save');
INSERT INTO `sl_grouppriv` VALUES ('1', 'mail', 'test');
INSERT INTO `sl_grouppriv` VALUES ('1', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'order');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('1', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'batchedit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'manageMembers');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'manageProducts');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'order');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'putoff');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'start');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'suspend');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'unlinkMember');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('1', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'changeStatus');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('1', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('1', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('1', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('1', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('1', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('1', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('1', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchChangeBranch');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchChangePlan');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchChangeStage');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'batchReview');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'change');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'review');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('1', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('1', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('1', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'batchDelete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'confirmChange');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'exportTemplet');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'import');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'showImport');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'batchAssign');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'batchRun');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'close');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'linkcase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'runcase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'start');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'unlinkcase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('1', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('1', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'create');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'unlock');
INSERT INTO `sl_grouppriv` VALUES ('1', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('2', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'build', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('2', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('2', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('2', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('2', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('2', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('2', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('2', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('2', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('2', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('2', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('2', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('2', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('2', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('2', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('2', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('2', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('2', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('2', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('2', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('2', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('2', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('2', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('2', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('3', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('3', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('3', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('3', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('3', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('3', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('3', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('3', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('3', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('3', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('3', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('3', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('3', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('3', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('3', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('3', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('3', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('3', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('3', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('3', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('3', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'confirmChange');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'exportTemplet');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'import');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'showImport');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'batchAssign');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'batchRun');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'close');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'linkcase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'runcase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'start');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'unlinkcase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('3', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('3', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('4', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('4', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('4', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('4', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('4', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('4', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('4', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('4', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('4', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('4', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('4', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('4', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('4', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'batchedit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'close');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'manageMembers');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'manageProducts');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'order');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'putoff');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'start');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'suspend');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'unlinkMember');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('4', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('4', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('4', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('4', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('4', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('4', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('4', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('4', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('4', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('4', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('4', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('4', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('4', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('4', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'batchAssign');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('4', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('4', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('4', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('4', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('5', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('5', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('5', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('5', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('5', 'branch', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'branch', 'manage');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('5', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('5', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('5', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('5', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('5', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('5', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('5', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('5', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('5', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'close');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'order');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('5', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'batchedit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'close');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'manageMembers');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'manageProducts');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'order');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'putoff');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'start');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'suspend');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'unlinkMember');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('5', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'changeStatus');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('5', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('5', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('5', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('5', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('5', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('5', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('5', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchChangeBranch');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchChangePlan');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchChangeStage');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'batchReview');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'change');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'close');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'lblChange');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'review');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('5', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('5', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('5', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('5', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('5', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('5', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('5', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('5', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('6', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('6', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('6', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('6', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('6', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('6', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('6', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('6', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('6', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('6', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('6', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('6', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('6', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'batchedit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'close');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'manageMembers');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'manageProducts');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'order');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'putoff');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'start');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'suspend');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'unlinkMember');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('6', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('6', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('6', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('6', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('6', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('6', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('6', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('6', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('6', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('6', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('6', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('6', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('6', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('6', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('6', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('6', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('6', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('6', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('7', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('7', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('7', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('7', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('7', 'branch', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'branch', 'manage');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('7', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('7', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('7', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('7', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('7', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('7', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('7', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('7', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('7', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'close');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'order');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('7', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'manageProducts');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'batchUnlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'batchUnlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'changeStatus');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'linkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'linkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'unlinkBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'unlinkStory');
INSERT INTO `sl_grouppriv` VALUES ('7', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('7', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('7', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('7', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('7', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('7', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('7', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchChangeBranch');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchChangePlan');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchChangeStage');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'batchReview');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'change');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'close');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'review');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('7', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('7', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('7', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('7', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('7', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('7', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('7', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('7', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('8', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('8', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('8', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('8', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchConfirm');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'batchResolve');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'confirmBug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'deleteTemplate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'resolve');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'saveTemplate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'build', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'build', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'build', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('8', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('8', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('8', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('8', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('8', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('8', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('8', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('8', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('8', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'importBug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'importtask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('8', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('8', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('8', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('8', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('8', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('8', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'lblChange');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('8', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('8', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'assignTo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'batchAssignTo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'batchClose');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'cancel');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'close');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'pause');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'restart');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'start');
INSERT INTO `sl_grouppriv` VALUES ('8', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'batchDelete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'confirmChange');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'confirmStoryChange');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'createBug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'exportTemplet');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'import');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'showImport');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'batchAssign');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'batchRun');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'close');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'linkcase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'runcase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'start');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'unlinkcase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('8', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'browseTask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'fix');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('8', 'tree', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('8', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('9', 'action', 'hideAll');
INSERT INTO `sl_grouppriv` VALUES ('9', 'action', 'hideOne');
INSERT INTO `sl_grouppriv` VALUES ('9', 'action', 'trash');
INSERT INTO `sl_grouppriv` VALUES ('9', 'action', 'undelete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'admin', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('9', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'bug', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('9', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('9', 'company', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'dept', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'dept', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'dept', 'manageChild');
INSERT INTO `sl_grouppriv` VALUES ('9', 'dept', 'updateOrder');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'create');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'createLib');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'deleteLib');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'editLib');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'extension', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'extension', 'obtain');
INSERT INTO `sl_grouppriv` VALUES ('9', 'extension', 'structure');
INSERT INTO `sl_grouppriv` VALUES ('9', 'file', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('9', 'file', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'file', 'uploadImages');
INSERT INTO `sl_grouppriv` VALUES ('9', 'git', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('9', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('9', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('9', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'project');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'story');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('9', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'project');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('9', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'burnData');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'computeBurn');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('9', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'release', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('9', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('9', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('9', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('9', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('9', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('9', 'search', 'select');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'report');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'review');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'story', 'zeroCase');
INSERT INTO `sl_grouppriv` VALUES ('9', 'svn', 'apiSync');
INSERT INTO `sl_grouppriv` VALUES ('9', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('9', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'report');
INSERT INTO `sl_grouppriv` VALUES ('9', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testcase', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('9', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('9', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'create');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'deleteContacts');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'manageContacts');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'unlock');
INSERT INTO `sl_grouppriv` VALUES ('9', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'action', 'editComment');
INSERT INTO `sl_grouppriv` VALUES ('10', 'api', 'getModel');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'activate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'close');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'create');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('10', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('10', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('10', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'changePassword');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'editProfile');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'task');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('10', 'my', 'unbind');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('10', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('10', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('10', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('10', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('10', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('10', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('10', 'search', 'deleteQuery');
INSERT INTO `sl_grouppriv` VALUES ('10', 'search', 'saveQuery');
INSERT INTO `sl_grouppriv` VALUES ('10', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('10', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'task', 'deleteEstimate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'task', 'editEstimate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'batchCreate');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'batchEdit');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'batchFinish');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'create');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'delete');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'edit');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'export');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'finish');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'import2Today');
INSERT INTO `sl_grouppriv` VALUES ('10', 'todo', 'view');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('10', 'user', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'bug', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'bug', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'bug', 'report');
INSERT INTO `sl_grouppriv` VALUES ('11', 'bug', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'build', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'company', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'company', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('11', 'company', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'company', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'doc', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'doc', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'doc', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'file', 'download');
INSERT INTO `sl_grouppriv` VALUES ('11', 'git', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('11', 'git', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('11', 'group', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'index', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'misc', 'ping');
INSERT INTO `sl_grouppriv` VALUES ('11', 'my', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'roadmap');
INSERT INTO `sl_grouppriv` VALUES ('11', 'product', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'productplan', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'productplan', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'build');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'burn');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'doc');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'grouptask');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'story');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'task');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'team');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'testtask');
INSERT INTO `sl_grouppriv` VALUES ('11', 'project', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'qa', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'release', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'release', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'bugAssign');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'bugCreate');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'productSummary');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'projectDeviation');
INSERT INTO `sl_grouppriv` VALUES ('11', 'report', 'workload');
INSERT INTO `sl_grouppriv` VALUES ('11', 'search', 'buildForm');
INSERT INTO `sl_grouppriv` VALUES ('11', 'search', 'buildQuery');
INSERT INTO `sl_grouppriv` VALUES ('11', 'story', 'tasks');
INSERT INTO `sl_grouppriv` VALUES ('11', 'story', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'svn', 'cat');
INSERT INTO `sl_grouppriv` VALUES ('11', 'svn', 'diff');
INSERT INTO `sl_grouppriv` VALUES ('11', 'task', 'recordEstimate');
INSERT INTO `sl_grouppriv` VALUES ('11', 'task', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testcase', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testcase', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testcase', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testcase', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'browse');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'cases');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'groupCase');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'index');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'results');
INSERT INTO `sl_grouppriv` VALUES ('11', 'testtask', 'view');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'bug');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'dynamic');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'profile');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'project');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'story');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'task');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'testCase');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'testTask');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'todo');
INSERT INTO `sl_grouppriv` VALUES ('11', 'user', 'view');

-- ----------------------------
-- Table structure for `sl_history`
-- ----------------------------
DROP TABLE IF EXISTS `sl_history`;
CREATE TABLE `sl_history` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field` varchar(30) NOT NULL DEFAULT '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_history
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_lang`
-- ----------------------------
DROP TABLE IF EXISTS `sl_lang`;
CREATE TABLE `sl_lang` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `system` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`,`module`,`section`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_mailqueue`
-- ----------------------------
DROP TABLE IF EXISTS `sl_mailqueue`;
CREATE TABLE `sl_mailqueue` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `toList` varchar(255) NOT NULL,
  `ccList` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `addedBy` char(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `sendTime` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `failReason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_mailqueue
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_module`
-- ----------------------------
DROP TABLE IF EXISTS `sl_module`;
CREATE TABLE `sl_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(60) NOT NULL DEFAULT '',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_module
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_product`
-- ----------------------------
DROP TABLE IF EXISTS `sl_product`;
CREATE TABLE `sl_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'normal',
  `status` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `PO` varchar(30) NOT NULL,
  `QD` varchar(30) NOT NULL,
  `RD` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdVersion` varchar(20) NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_product
-- ----------------------------
INSERT INTO `sl_product` VALUES ('1', '饼干', '213', 'branch', 'normal', '2121', 'admin', 'admin', 'admin', 'open', '', 'admin', '2018-09-17 17:20:40', '1.0.0', '5', '0');

-- ----------------------------
-- Table structure for `sl_productplan`
-- ----------------------------
DROP TABLE IF EXISTS `sl_productplan`;
CREATE TABLE `sl_productplan` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `title` varchar(90) NOT NULL,
  `desc` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_productplan
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_project`
-- ----------------------------
DROP TABLE IF EXISTS `sl_project`;
CREATE TABLE `sl_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `isCat` enum('1','0') NOT NULL DEFAULT '0',
  `catID` mediumint(8) unsigned NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sprint',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `days` smallint(5) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `statge` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `pri` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `openedVersion` varchar(20) NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `canceledBy` varchar(30) NOT NULL DEFAULT '',
  `canceledDate` int(10) unsigned NOT NULL DEFAULT '0',
  `PO` varchar(30) NOT NULL DEFAULT '',
  `PM` varchar(30) NOT NULL DEFAULT '',
  `QD` varchar(30) NOT NULL DEFAULT '',
  `RD` varchar(30) NOT NULL DEFAULT '',
  `team` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project` (`type`,`parent`,`begin`,`end`,`status`,`statge`,`pri`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_project
-- ----------------------------
INSERT INTO `sl_project` VALUES ('1', '0', '0', 'sprint', '0', 'test', '213', '2018-09-17', '2018-10-01', '11', 'wait', '1', '1', 'test', '', '0', '1.0.0', '', '0', '', '0', '', '', '', '', 'test', 'open', '', '5', '0');

-- ----------------------------
-- Table structure for `sl_projectproduct`
-- ----------------------------
DROP TABLE IF EXISTS `sl_projectproduct`;
CREATE TABLE `sl_projectproduct` (
  `project` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`project`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_projectproduct
-- ----------------------------
INSERT INTO `sl_projectproduct` VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for `sl_projectstory`
-- ----------------------------
DROP TABLE IF EXISTS `sl_projectstory`;
CREATE TABLE `sl_projectstory` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(6) NOT NULL DEFAULT '1',
  UNIQUE KEY `project` (`project`,`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_projectstory
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_release`
-- ----------------------------
DROP TABLE IF EXISTS `sl_release`;
CREATE TABLE `sl_release` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` mediumint(8) unsigned NOT NULL,
  `name` char(30) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `leftBugs` text NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'normal',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_release
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_story`
-- ----------------------------
DROP TABLE IF EXISTS `sl_story`;
CREATE TABLE `sl_story` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` text NOT NULL,
  `source` varchar(20) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `estimate` float unsigned NOT NULL,
  `status` enum('','changed','active','draft','closed') NOT NULL DEFAULT '',
  `stage` enum('','wait','planned','projected','developing','developed','testing','tested','verified','released') NOT NULL DEFAULT 'wait',
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `reviewedBy` varchar(255) NOT NULL,
  `reviewedDate` date NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `toBug` mediumint(9) NOT NULL,
  `childStories` varchar(255) NOT NULL,
  `linkStories` varchar(255) NOT NULL,
  `duplicateStory` mediumint(8) unsigned NOT NULL,
  `version` smallint(6) NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`,`module`,`type`,`pri`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_story
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_storyspec`
-- ----------------------------
DROP TABLE IF EXISTS `sl_storyspec`;
CREATE TABLE `sl_storyspec` (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(90) NOT NULL,
  `spec` text NOT NULL,
  `verify` text NOT NULL,
  UNIQUE KEY `story` (`story`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_storyspec
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_storystage`
-- ----------------------------
DROP TABLE IF EXISTS `sl_storystage`;
CREATE TABLE `sl_storystage` (
  `story` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `stage` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_storystage
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_task`
-- ----------------------------
DROP TABLE IF EXISTS `sl_task`;
CREATE TABLE `sl_task` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `estimate` float unsigned NOT NULL,
  `consumed` float unsigned NOT NULL,
  `left` float unsigned NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('wait','doing','done','pause','cancel','closed') NOT NULL DEFAULT 'wait',
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL,
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `estStarted` date NOT NULL,
  `realStarted` date NOT NULL,
  `finishedBy` varchar(30) NOT NULL,
  `finishedDate` datetime NOT NULL,
  `canceledBy` varchar(30) NOT NULL,
  `canceledDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_task
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_taskestimate`
-- ----------------------------
DROP TABLE IF EXISTS `sl_taskestimate`;
CREATE TABLE `sl_taskestimate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `left` float unsigned NOT NULL DEFAULT '0',
  `consumed` float unsigned NOT NULL,
  `account` char(30) NOT NULL DEFAULT '',
  `work` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task` (`task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_taskestimate
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_team`
-- ----------------------------
DROP TABLE IF EXISTS `sl_team`;
CREATE TABLE `sl_team` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `role` char(30) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `days` smallint(5) unsigned NOT NULL,
  `hours` float(2,1) unsigned NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`project`,`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_team
-- ----------------------------
INSERT INTO `sl_team` VALUES ('1', 'admin', '', '2018-09-17', '11', '7.0');

-- ----------------------------
-- Table structure for `sl_testresult`
-- ----------------------------
DROP TABLE IF EXISTS `sl_testresult`;
CREATE TABLE `sl_testresult` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `run` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `caseResult` char(30) NOT NULL,
  `stepResults` text NOT NULL,
  `lastRunner` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `run` (`run`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_testresult
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_testrun`
-- ----------------------------
DROP TABLE IF EXISTS `sl_testrun`;
CREATE TABLE `sl_testrun` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `assignedTo` char(30) NOT NULL DEFAULT '',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task` (`task`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_testrun
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_testtask`
-- ----------------------------
DROP TABLE IF EXISTS `sl_testtask`;
CREATE TABLE `sl_testtask` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(90) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `desc` text NOT NULL,
  `report` text NOT NULL,
  `status` enum('blocked','doing','wait','done') NOT NULL DEFAULT 'wait',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_testtask
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_todo`
-- ----------------------------
DROP TABLE IF EXISTS `sl_todo`;
CREATE TABLE `sl_todo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `date` date NOT NULL,
  `begin` smallint(4) unsigned zerofill NOT NULL,
  `end` smallint(4) unsigned zerofill NOT NULL,
  `type` char(10) NOT NULL,
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` enum('wait','doing','done') NOT NULL DEFAULT 'wait',
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_todo
-- ----------------------------
INSERT INTO `sl_todo` VALUES ('1', 'admin', '2018-09-18', '0930', '1000', 'custom', '0', '3', '23', '23123', 'wait', '0');

-- ----------------------------
-- Table structure for `sl_user`
-- ----------------------------
DROP TABLE IF EXISTS `sl_user`;
CREATE TABLE `sl_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `dept` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `role` char(10) NOT NULL DEFAULT '',
  `realname` char(30) NOT NULL DEFAULT '',
  `nickname` char(60) NOT NULL DEFAULT '',
  `commiter` varchar(100) NOT NULL,
  `avatar` char(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('f','m') NOT NULL DEFAULT 'f',
  `email` char(90) NOT NULL DEFAULT '',
  `skype` char(90) NOT NULL DEFAULT '',
  `qq` char(20) NOT NULL DEFAULT '',
  `yahoo` char(90) NOT NULL DEFAULT '',
  `gtalk` char(90) NOT NULL DEFAULT '',
  `wangwang` char(90) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `phone` char(20) NOT NULL DEFAULT '',
  `address` char(120) NOT NULL DEFAULT '',
  `zipcode` char(10) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `last` int(10) unsigned NOT NULL DEFAULT '0',
  `fails` tinyint(5) NOT NULL DEFAULT '0',
  `locked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ranzhi` char(30) NOT NULL DEFAULT '',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `dept` (`dept`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_user
-- ----------------------------
INSERT INTO `sl_user` VALUES ('1', '1', 'admin', '96e79218965eb72c92a549dd5a330112', 'qa', 'admin', '', '2332', '', '0000-00-00', 'm', 'admin@qq.com', '12', '13', '23', '13', '31', '31', '13', '13', '31', '2018-09-21', '15', '127.0.0.1', '1537922736', '0', '0000-00-00 00:00:00', '', '0');
INSERT INTO `sl_user` VALUES ('2', '2', '211212', '96e79218965eb72c92a549dd5a330112', 'dev', 'lindan', '', '2332', '', '0000-00-00', 'm', '12222@qq.com', '', '', '', '', '', '', '', '', '', '1970-01-14', '0', '', '0', '0', '0000-00-00 00:00:00', '', '0');

-- ----------------------------
-- Table structure for `sl_usercontact`
-- ----------------------------
DROP TABLE IF EXISTS `sl_usercontact`;
CREATE TABLE `sl_usercontact` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `listName` varchar(60) NOT NULL,
  `userList` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_usercontact
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `sl_usergroup`;
CREATE TABLE `sl_usergroup` (
  `account` char(30) NOT NULL DEFAULT '',
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `account` (`account`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_usergroup
-- ----------------------------
INSERT INTO `sl_usergroup` VALUES ('211212', '2');
INSERT INTO `sl_usergroup` VALUES ('admin', '2');
INSERT INTO `sl_usergroup` VALUES ('admin', '3');

-- ----------------------------
-- Table structure for `sl_userquery`
-- ----------------------------
DROP TABLE IF EXISTS `sl_userquery`;
CREATE TABLE `sl_userquery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_userquery
-- ----------------------------

-- ----------------------------
-- Table structure for `sl_usertpl`
-- ----------------------------
DROP TABLE IF EXISTS `sl_usertpl`;
CREATE TABLE `sl_usertpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `type` char(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sl_usertpl
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_group`;
CREATE TABLE `t_admin_group` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `power` text NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_group
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_log`;
CREATE TABLE `t_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(50) NOT NULL,
  `action_type` int(11) unsigned NOT NULL,
  `action_time` int(11) unsigned NOT NULL,
  `admin_ip` varchar(128) NOT NULL,
  `action_arg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id_idx` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `gid` int(10) NOT NULL COMMENT '群组id',
  `last_login_time` int(11) NOT NULL,
  `agent_id` text NOT NULL COMMENT '代理商ID',
  `admin_desc` text COMMENT '账户描述',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_user
-- ----------------------------
INSERT INTO `t_admin_user` VALUES ('2', 'gd_boss', '2b21bb4dedfcacfe1c45bf8a8a238002', '1', '1504250128', '1', '后台开发');
INSERT INTO `t_admin_user` VALUES ('3', 'feader', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '1', '后台开发');
INSERT INTO `t_admin_user` VALUES ('4', 'deo', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '1', '后台开发');
INSERT INTO `t_admin_user` VALUES ('7', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '1', null);
INSERT INTO `t_admin_user` VALUES ('9', 'mahjong', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '1', 'd41d8cd98f00b204e9800998ecf8427e');
INSERT INTO `t_admin_user` VALUES ('17', 'tqfy0_kf', '638856ed594eddd1938ce327c3b94d20', '12', '1502357066', '', '客服');

-- ----------------------------
-- Table structure for `t_agency`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency`;
CREATE TABLE `t_agency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `unionid` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  `uber_agency` varchar(50) NOT NULL COMMENT '上级代理',
  `nick_name` varchar(50) NOT NULL DEFAULT '',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  `register_time` int(11) unsigned NOT NULL,
  `phone_number` varchar(11) NOT NULL DEFAULT '',
  `recharge_dimond` int(11) unsigned NOT NULL DEFAULT '0',
  `recharge_send_dimond` int(11) unsigned NOT NULL DEFAULT '0',
  `recharge_money` int(11) unsigned NOT NULL DEFAULT '0',
  `first_login_time` int(11) NOT NULL COMMENT '首次登陆时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency
-- ----------------------------
INSERT INTO `t_agency` VALUES ('1', 'hg5289', '654321', '', '1', '', '2143215211', null, '1500371877', '421525124', '1596', '0', '2', '1500372970', '1503469240', '');
INSERT INTO `t_agency` VALUES ('2', 'zs1060', '123456', '', '4', 'hg5289', '', '', '1500533200', '', '0', '0', '0', '1502273546', '1502328724', '');
INSERT INTO `t_agency` VALUES ('3', 'bj5512', '53529867', '', '3', 'zs1060', '', null, '1500533212', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('4', 'hg7189', '54404517', '', '1', '', '', null, '1500968254', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('5', 'hg5984', '48789144', '', '1', '', '', null, '1501742925', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('6', 'zs0401', '66446462', '', '2', 'hg5984', '', null, '1501743467', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('7', 'zs4163', '27075922', '', '2', 'hg5984', '', null, '1501743471', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('8', 'zs9310', '13113154', '', '2', 'hg5984', '', null, '1501743473', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('9', 'zs7280', '76687650', '', '2', 'hg5984', '', null, '1501743474', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('10', 'zs0078', '60091104', '', '2', 'hg5984', '', null, '1501743476', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('11', 'zs0593', '27503098', '', '2', 'hg5984', '', null, '1501743478', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('12', 'zs3514', '98271847', '', '2', 'hg5984', '', null, '1501743479', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('13', 'zs4714', '43599535', '', '2', 'hg5984', '', null, '1501743480', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('14', 'zs2923', '40166250', '', '2', 'hg5984', '', null, '1501743481', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('15', 'zs8743', '13588437', '', '2', 'hg5984', '', null, '1501743482', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('16', 'zs4948', '37938461', '', '2', 'hg5984', '', null, '1501743484', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('17', 'zs6117', '55413097', '', '2', 'hg5984', '', null, '1501743485', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('18', 'zs6420', '24390941', '', '2', 'hg5984', '', null, '1501743486', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('19', 'zs7768', '55431615', '', '2', 'hg5984', '', null, '1501743487', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('20', 'zs1553', '15406656', '', '2', 'hg5984', '', null, '1501743488', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('21', 'zs1517', '94997047', '', '2', 'hg5984', '', null, '1501743489', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('22', 'zs8055', '60701621', '', '2', 'hg5984', '', null, '1501743490', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('23', 'zs3036', '03287577', '', '2', 'hg5984', '', null, '1501743491', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('24', 'zs0198', '66396301', '', '2', 'hg5984', '', null, '1501743493', '', '0', '0', '0', '0', '0', '');
INSERT INTO `t_agency` VALUES ('25', 'zs2767', '14926476', '', '2', 'hg5984', '', null, '1501743494', '', '0', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `t_agency_and_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency_and_user`;
CREATE TABLE `t_agency_and_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agency_id` varchar(20) NOT NULL COMMENT '代理uid',
  `unionid` varchar(50) NOT NULL COMMENT '微信用户unionid',
  `agent_ip` varchar(50) NOT NULL,
  `action_time` int(11) NOT NULL COMMENT '插入记录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unionid` (`unionid`),
  KEY `unionid_2` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency_and_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_agency_bank_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency_bank_info`;
CREATE TABLE `t_agency_bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '代理的uid',
  `weixin` varchar(50) NOT NULL COMMENT '微信',
  `alipay` varchar(50) NOT NULL COMMENT '支付宝',
  `opening_bank` varchar(50) NOT NULL COMMENT '开户行',
  `branch` varchar(100) NOT NULL COMMENT '分行',
  `bank_name` varchar(20) NOT NULL COMMENT '开户名',
  `bank_account` varchar(100) NOT NULL COMMENT '开户账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency_bank_info
-- ----------------------------
INSERT INTO `t_agency_bank_info` VALUES ('1', 'hg5289', '11', '2', '3', '4', '5', '6');

-- ----------------------------
-- Table structure for `t_agency_get_dimond_back_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency_get_dimond_back_log`;
CREATE TABLE `t_agency_get_dimond_back_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auid` varchar(50) NOT NULL COMMENT '推广代理的uid',
  `buid` varchar(50) NOT NULL COMMENT '购买者的uid（玩家或代理）',
  `buyername` varchar(50) NOT NULL COMMENT '购买的名字（玩家呢称/代理uid）',
  `utype` int(1) NOT NULL COMMENT '1是玩家，2是代理',
  `buy_dimond_num` int(11) NOT NULL COMMENT '购买的房卡（钻石）数',
  `dimond_back_num` int(11) NOT NULL COMMENT '返的房卡（钻石）',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency_get_dimond_back_log
-- ----------------------------
INSERT INTO `t_agency_get_dimond_back_log` VALUES ('1', '326', '4', '非得', '1', '1', '0', '1500982361');
INSERT INTO `t_agency_get_dimond_back_log` VALUES ('2', '326', '4', '非得', '1', '1', '0', '1500982719');
INSERT INTO `t_agency_get_dimond_back_log` VALUES ('3', '326', '4', '非得', '1', '1', '0', '1500982778');
INSERT INTO `t_agency_get_dimond_back_log` VALUES ('4', '2', '1', '南宫云', '1', '1', '0', '1500983092');
INSERT INTO `t_agency_get_dimond_back_log` VALUES ('5', '2', '1', '南宫云', '1', '1', '0', '1500983146');

-- ----------------------------
-- Table structure for `t_agency_sell_to_agency`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency_sell_to_agency`;
CREATE TABLE `t_agency_sell_to_agency` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sell_agency_uid` varchar(64) DEFAULT NULL,
  `buy_agency_uid` varchar(64) DEFAULT NULL,
  `dimond_num` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency_sell_to_agency
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ban_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_ban_log`;
CREATE TABLE `t_ban_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action_time` int(11) NOT NULL COMMENT '动作时间',
  `action_type` int(1) NOT NULL COMMENT '动作类型0是默认，1是封，2是解',
  `handler` varchar(50) NOT NULL COMMENT '操作者',
  `uid` varchar(100) NOT NULL COMMENT '玩家id',
  `content` varchar(50) NOT NULL COMMENT '动作描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ban_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_data_count`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_count`;
CREATE TABLE `t_data_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_time` varchar(50) NOT NULL,
  `register` int(11) NOT NULL,
  `total_charge_money` varchar(14) NOT NULL,
  `total_cost_dimond` int(11) NOT NULL,
  `acu` float(4,1) NOT NULL COMMENT '日平均在线人数',
  `aacu` float(4,1) NOT NULL COMMENT '实时平均在线人数',
  `uv` float(4,1) NOT NULL COMMENT '当日登录帐号数',
  `pu` float(4,1) NOT NULL COMMENT '付费用户数：充值付费过的用户',
  `all_reg` int(10) NOT NULL COMMENT '历史注册总量',
  `dau` float(4,1) NOT NULL COMMENT '日活跃用户数',
  `dau_apa` int(10) NOT NULL COMMENT '日活跃付费账号',
  `mau` float(4,1) NOT NULL COMMENT '月活跃用户数',
  `mau_apa` int(10) NOT NULL COMMENT '月活跃付费账号',
  `dts` float(10,1) NOT NULL COMMENT '用户平均在线时长（日）',
  `dul` float(4,1) NOT NULL COMMENT '日用户流失率',
  `mul` float(4,1) NOT NULL COMMENT '月用户流失率',
  `rhyl` float(4,1) NOT NULL COMMENT '活跃率',
  `marpu` int(10) NOT NULL COMMENT '月付费用户',
  `darpu` int(10) NOT NULL COMMENT '日付费用户',
  `dau_reg_ffl` float(4,1) NOT NULL COMMENT '日注册用户付费率',
  `dau_avg_online_ffl` float(4,1) NOT NULL COMMENT '日平均在线付费率',
  `dau_nv_ffl` float(4,1) NOT NULL COMMENT '日活跃用户付费率',
  `mau_reg_ffl` float(4,1) NOT NULL COMMENT '月注册用户付费率',
  `mau_avg_online_ffl` float(4,1) NOT NULL COMMENT '月平均在线付费率',
  `mau_nv_ffl` float(4,1) NOT NULL COMMENT '月活跃用户付费率',
  `au` int(10) NOT NULL COMMENT '当日登录帐号数',
  `second_retention` float(10,2) NOT NULL,
  `third_retention` float(10,2) NOT NULL,
  `fourth_retention` float(10,2) NOT NULL,
  `fifth_retention` float(10,2) NOT NULL,
  `sixth_retention` float(10,2) NOT NULL,
  `seventh_retention` float(10,2) NOT NULL,
  `fourteenth_retention` float(10,2) NOT NULL,
  `thirty_retention` float(10,2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `action_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_data_count
-- ----------------------------
INSERT INTO `t_data_count` VALUES ('2', '2017-08-17', '0', '0', '0', '4.9', '3.2', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '5.7', '0', '0', '0.0', '0.0', '0.0', '12.0', '3.2', '14.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1503130704', '1504063385');
INSERT INTO `t_data_count` VALUES ('3', '2017-08-23', '5', '0', '0', '5.3', '3.5', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '5.3', '0', '0', '0.0', '0.0', '0.0', '12.0', '3.5', '14.0', '0', '60.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1503656035', '1504061263');
INSERT INTO `t_data_count` VALUES ('4', '2017-08-28', '6', '0', '0', '16.7', '11.1', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '7.7', '0', '0', '0.0', '0.0', '0.0', '18.0', '11.1', '24.0', '0', '16.67', '16.67', '16.67', '0.00', '0.00', '0.00', '0.00', '0.00', '1504061222', '1504340605');
INSERT INTO `t_data_count` VALUES ('5', '2017-08-27', '0', '0', '0', '0.1', '0.0', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '999.9', '0', '0', '0.0', '0.0', '0.0', '18.0', '0.0', '24.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504061222', '1504340605');
INSERT INTO `t_data_count` VALUES ('6', '2017-08-26', '1', '0', '0', '0.2', '0.1', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '640.0', '0', '0', '0.0', '0.0', '0.0', '18.0', '0.1', '24.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504061222', '1504340605');
INSERT INTO `t_data_count` VALUES ('7', '2017-08-25', '6', '0', '0', '25.8', '17.2', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '5.0', '0', '0', '0.0', '0.0', '0.0', '18.0', '17.2', '24.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '33.33', '0.00', '0.00', '1504061222', '1504142443');
INSERT INTO `t_data_count` VALUES ('8', '2017-08-24', '7', '0', '0', '4.5', '3.0', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '6.2', '0', '0', '0.0', '0.0', '0.0', '12.0', '3.0', '14.0', '0', '0.00', '0.00', '0.00', '0.00', '57.14', '57.14', '0.00', '0.00', '1504061222', '1504063385');
INSERT INTO `t_data_count` VALUES ('9', '2017-08-16', '0', '0', '0', '5.3', '3.5', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '5.3', '0', '0', '0.0', '0.0', '0.0', '12.0', '3.5', '14.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504061222', '1504061263');
INSERT INTO `t_data_count` VALUES ('10', '2017-07-31', '0', '0', '0', '5.3', '3.5', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '5.3', '0', '0', '0.0', '0.0', '0.0', '12.0', '3.5', '14.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504061222', '1504061263');
INSERT INTO `t_data_count` VALUES ('11', '2017-08-29', '8', '0', '0', '31.9', '21.3', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '4.0', '0', '0', '0.0', '0.0', '0.0', '18.0', '21.3', '24.0', '0', '100.00', '0.00', '38.46', '0.00', '0.00', '0.00', '0.00', '0.00', '1504062198', '1504340605');
INSERT INTO `t_data_count` VALUES ('12', '2017-08-01', '0', '0', '0', '0.9', '0.6', '14.0', '5.0', '12', '8.0', '0', '0.0', '1', '1967.1', '0.7', '0.0', '31.1', '0', '0', '0.0', '0.0', '0.0', '12.0', '0.6', '14.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504062198', '1504063385');
INSERT INTO `t_data_count` VALUES ('13', '2017-08-30', '13', '0', '0', '64.1', '42.7', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '2.0', '0', '0', '0.0', '0.0', '0.0', '18.0', '42.7', '24.0', '0', '130.77', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504142443', '1504340605');
INSERT INTO `t_data_count` VALUES ('14', '2017-08-18', '4', '0', '0', '45.7', '30.5', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '2.8', '0', '0', '0.0', '0.0', '0.0', '18.0', '30.5', '24.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504142443', '1504142443');
INSERT INTO `t_data_count` VALUES ('15', '2017-08-02', '0', '0', '0', '59.5', '39.7', '24.0', '5.0', '18', '9.0', '0', '0.0', '1', '4402.7', '0.5', '0.0', '2.2', '0', '0', '0.0', '0.0', '0.0', '18.0', '39.7', '24.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504142443', '1504142443');
INSERT INTO `t_data_count` VALUES ('16', '2017-08-31', '1', '0', '0', '1.2', '0.8', '9.0', '5.0', '18', '2.0', '0', '0.0', '0', '2816.4', '0.1', '0.0', '6.7', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504231366', '1504231487');
INSERT INTO `t_data_count` VALUES ('17', '2017-08-19', '5', '0', '0', '1.0', '0.7', '7.0', '5.0', '1', '0.0', '0', '0.0', '0', '0.0', '0.0', '0.0', '0.0', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504231366', '1504231488');
INSERT INTO `t_data_count` VALUES ('18', '2017-08-03', '0', '0', '0', '1.3', '0.9', '0.0', '5.0', '0', '0.0', '0', '0.0', '0', '0.0', '0.0', '0.0', '0.0', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504231366', '1504231488');
INSERT INTO `t_data_count` VALUES ('19', '2017-09-01', '2', '0', '0', '3.3', '2.2', '9.0', '5.0', '19', '6.0', '0', '0.0', '0', '9410.9', '0.3', '0.0', '2.4', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504340605', '1504340605');
INSERT INTO `t_data_count` VALUES ('20', '2017-08-20', '0', '0', '0', '0.0', '0.0', '0.0', '5.0', '3', '0.0', '0', '0.0', '0', '0.0', '0.0', '0.0', '0.0', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504340605', '1504340605');
INSERT INTO `t_data_count` VALUES ('21', '2017-08-04', '0', '0', '0', '1.3', '0.9', '0.0', '5.0', '0', '0.0', '0', '0.0', '0', '0.0', '0.0', '0.0', '0.0', '0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1504340605', '1504340605');

-- ----------------------------
-- Table structure for `t_dimond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_dimond_log`;
CREATE TABLE `t_dimond_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `change_num` int(11) NOT NULL,
  `change_bind_num` int(11) NOT NULL,
  `remain_num` int(11) NOT NULL,
  `remain_bind_num` int(11) unsigned NOT NULL,
  `action_type` int(11) unsigned NOT NULL,
  `action_time` int(11) unsigned NOT NULL,
  `action_arg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dimond_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_everyday_online_time_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_everyday_online_time_log`;
CREATE TABLE `t_everyday_online_time_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `everyday_online_time` int(11) NOT NULL COMMENT '每天在线时间总和（秒）',
  `create_time` int(11) NOT NULL,
  `date_time` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_everyday_online_time_log
-- ----------------------------
INSERT INTO `t_everyday_online_time_log` VALUES ('1', '117791', '26', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('2', '117840', '2589', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('3', '117861', '2594', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('4', '117964', '1', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('5', '117985', '57', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('6', '118483', '303', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('7', '118653', '2623', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('8', '118696', '3114', '1503483827', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('9', '118023', '472', '1503488481', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('10', '117799', '638', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('11', '117814', '621', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('12', '117998', '34', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('13', '118020', '657', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('14', '118114', '22', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('15', '118157', '16', '1503625077', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('16', '117824', '3543', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('17', '117838', '153', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('18', '117854', '138', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('19', '117865', '145', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('20', '117882', '476', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('21', '118088', '1604', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('22', '118296', '5284', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('23', '118297', '26', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('24', '118617', '2019', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('25', '118646', '5290', '1504061222', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('26', '117736', '572', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('27', '117804', '1776', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('28', '117862', '157', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('29', '117887', '103', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('30', '117908', '3911', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('31', '117938', '72', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('32', '117959', '910', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('33', '117961', '3702', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('34', '118000', '883', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('35', '118096', '312', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('36', '118113', '74', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('37', '118151', '89', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('38', '118224', '322', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('39', '118277', '3650', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('40', '118294', '110', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('41', '118419', '94', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('42', '118444', '2810', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('43', '118482', '3359', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('44', '118595', '3303', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('45', '118614', '214', '1504142443', '');
INSERT INTO `t_everyday_online_time_log` VALUES ('46', '134786', '427', '1504162482', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('47', '117736', '639', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('48', '117862', '113', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('49', '117961', '95', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('50', '118020', '64458', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('51', '118088', '86644', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('52', '118208', '15', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('53', '118249', '25', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('54', '118482', '35', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('55', '118614', '63', '1504231487', '2017-08-31');
INSERT INTO `t_everyday_online_time_log` VALUES ('56', '117736', '572', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('57', '117804', '1776', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('58', '117861', '8', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('59', '117862', '157', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('60', '117887', '103', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('61', '117908', '3911', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('62', '117938', '72', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('63', '117959', '910', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('64', '117961', '3702', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('65', '118000', '883', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('66', '118020', '79201', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('67', '118023', '21', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('68', '118088', '11', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('69', '118096', '312', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('70', '118113', '74', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('71', '118151', '89', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('72', '118224', '322', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('73', '118277', '3650', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('74', '118294', '110', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('75', '118419', '94', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('76', '118444', '2810', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('77', '118482', '3359', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('78', '118595', '3303', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('79', '118614', '214', '1504231487', '2017-08-30');
INSERT INTO `t_everyday_online_time_log` VALUES ('80', '117799', '1555', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('81', '117814', '1484', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('82', '117824', '3543', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('83', '117838', '153', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('84', '117854', '138', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('85', '117865', '145', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('86', '117882', '476', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('87', '118020', '5739', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('88', '118023', '84', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('89', '118088', '1604', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('90', '118296', '5284', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('91', '118297', '26', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('92', '118617', '2019', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('93', '118646', '5290', '1504231488', '2017-08-29');
INSERT INTO `t_everyday_online_time_log` VALUES ('94', '117787', '29', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('95', '117799', '4856', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('96', '117814', '4832', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('97', '117848', '36', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('98', '117865', '38', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('99', '118020', '4915', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('100', '118023', '90', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('101', '118088', '6207', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('102', '118106', '60', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('103', '118151', '1034', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('104', '118208', '21', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('105', '118294', '742', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('106', '118419', '768', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('107', '118474', '740', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('108', '118502', '358', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('109', '118568', '1812', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('110', '118614', '115', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('111', '118696', '4', '1504231488', '2017-08-28');
INSERT INTO `t_everyday_online_time_log` VALUES ('112', '118286', '108', '1504231488', '2017-08-27');
INSERT INTO `t_everyday_online_time_log` VALUES ('113', '118286', '61', '1504231488', '2017-08-26');
INSERT INTO `t_everyday_online_time_log` VALUES ('114', '118502', '220', '1504231488', '2017-08-26');
INSERT INTO `t_everyday_online_time_log` VALUES ('115', '117771', '87', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('116', '117887', '3754', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('117', '117908', '8889', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('118', '118088', '61926', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('119', '118097', '3298', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('120', '118113', '9', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('121', '118277', '3370', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('122', '118482', '3356', '1504340605', '2017-09-01');
INSERT INTO `t_everyday_online_time_log` VALUES ('123', '118614', '9', '1504340605', '2017-09-01');

-- ----------------------------
-- Table structure for `t_everyday_total_dimond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_everyday_total_dimond_log`;
CREATE TABLE `t_everyday_total_dimond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` varchar(50) DEFAULT NULL,
  `today_total_dimond` int(10) DEFAULT NULL,
  `write_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_everyday_total_dimond_log
-- ----------------------------
INSERT INTO `t_everyday_total_dimond_log` VALUES ('1', '2017-08-29', '0', '1503936001');
INSERT INTO `t_everyday_total_dimond_log` VALUES ('2', '2017-08-30', '0', '1504022401');
INSERT INTO `t_everyday_total_dimond_log` VALUES ('3', '2017-08-31', '0', '1504108801');
INSERT INTO `t_everyday_total_dimond_log` VALUES ('4', '2017-09-01', '0', '1504195201');

-- ----------------------------
-- Table structure for `t_everyday_user_dimond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_everyday_user_dimond_log`;
CREATE TABLE `t_everyday_user_dimond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` varchar(50) DEFAULT NULL,
  `everyday_total_use` int(10) DEFAULT NULL,
  `write_time` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_everyday_user_dimond_log
-- ----------------------------
INSERT INTO `t_everyday_user_dimond_log` VALUES ('1', '2017-08-29', '0', '1503936001');
INSERT INTO `t_everyday_user_dimond_log` VALUES ('2', '2017-08-30', '0', '1504022401');
INSERT INTO `t_everyday_user_dimond_log` VALUES ('3', '2017-08-31', '0', '1504108801');
INSERT INTO `t_everyday_user_dimond_log` VALUES ('4', '2017-09-01', '0', '1504195201');

-- ----------------------------
-- Table structure for `t_every_month_money_back`
-- ----------------------------
DROP TABLE IF EXISTS `t_every_month_money_back`;
CREATE TABLE `t_every_month_money_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auid` varchar(50) NOT NULL COMMENT '代理uid',
  `back_money` float NOT NULL COMMENT '返现金额',
  `back_date` varchar(50) NOT NULL COMMENT '返现日期',
  `back_create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否结算',
  `back_time` int(11) NOT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_every_month_money_back
-- ----------------------------

-- ----------------------------
-- Table structure for `t_gamer_get_dimond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_gamer_get_dimond_log`;
CREATE TABLE `t_gamer_get_dimond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '推广玩家uid',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '领取状态(0是有可领取，1是已领取)',
  `reward_dimond` int(11) NOT NULL COMMENT '可房卡（钻石）数',
  `get_time` int(11) NOT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gamer_get_dimond_log
-- ----------------------------
INSERT INTO `t_gamer_get_dimond_log` VALUES ('1', '1', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('2', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('3', '118704', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('4', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('5', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('6', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('7', '118704', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('8', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('9', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('10', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('11', '118614', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('12', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('13', '118704', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('14', '118199', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('15', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('16', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('17', '118389', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('18', '117777', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('19', '117777', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('20', '118704', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('21', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('22', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('23', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('24', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('25', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('26', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('27', '117961', '0', '3', '0');
INSERT INTO `t_gamer_get_dimond_log` VALUES ('28', '117961', '0', '3', '0');

-- ----------------------------
-- Table structure for `t_gamer_to_gamer`
-- ----------------------------
DROP TABLE IF EXISTS `t_gamer_to_gamer`;
CREATE TABLE `t_gamer_to_gamer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuid` int(11) NOT NULL COMMENT '推广用户的uid',
  `suid` int(11) NOT NULL COMMENT '受邀请用户的uid',
  `unionid` varchar(100) NOT NULL COMMENT '受邀请用户的微信openid',
  `create_time` int(11) NOT NULL COMMENT '记录生成时间',
  `first_login_time` int(11) NOT NULL COMMENT '受邀用户首次登陆时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid_2` (`unionid`),
  KEY `openid` (`unionid`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gamer_to_gamer
-- ----------------------------
INSERT INTO `t_gamer_to_gamer` VALUES ('1', '118704', '117805', 'o6oGSwmJP4MOYhD3wyNOG1HPoRw4', '1501158490', '1504496985');
INSERT INTO `t_gamer_to_gamer` VALUES ('2', '118389', '118444', 'o6oGSwvxOH-SPgSnNCWUOX16UbNQ', '1501341673', '1504084467');
INSERT INTO `t_gamer_to_gamer` VALUES ('3', '118389', '118113', 'o6oGSwipZld02qN6wKydNWJRCwzE', '1501341693', '1504089865');
INSERT INTO `t_gamer_to_gamer` VALUES ('4', '118199', '0', 'o6oGSwgQcZxRY0vBUuMZN1S_RY38', '1501383616', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('5', '118389', '117961', 'o6oGSwsMzHAzrVH3bKy9vaj6eTDw', '1501392875', '1504067135');
INSERT INTO `t_gamer_to_gamer` VALUES ('6', '118389', '118004', 'o6oGSwgKf9EvAzIhfwxydXwSvUxQ', '1501392949', '1501393038');
INSERT INTO `t_gamer_to_gamer` VALUES ('7', '118199', '117804', 'o6oGSwi760wqDnCVzhfN1QuHDa0Y', '1501429150', '1504057745');
INSERT INTO `t_gamer_to_gamer` VALUES ('9', '118614', '118167', 'o6oGSwnVl_yTeqrsHiWxXkCoXVnk', '1502771401', '1503270616');
INSERT INTO `t_gamer_to_gamer` VALUES ('10', '118614', '0', 'o6oGSwlzLc1pO8Vj0hlixRsMbbCo', '1502771536', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('11', '118614', '0', 'o6oGSwif9tyNIgCoJ3HUz1YAah4A', '1502771557', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('12', '118614', '0', 'o6oGSwrJG7W16gbEKE1cv4g3or50', '1502782708', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('13', '118614', '0', 'o6oGSwp_N5hSEOw7WkdaZV8akGP0', '1502809465', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('14', '117840', '0', 'o6oGSwgFuS96houpSAinG1srIltA', '1502943553', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('18', '117961', '118625', 'o6oGSwvPnbbhaBoN21ljHHcQOqk8', '1504186889', '1504503897');
INSERT INTO `t_gamer_to_gamer` VALUES ('19', '118595', '0', 'o6oGSwjwwF1iVcGYV0K3bE9QzKoM', '1504479409', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('20', '117777', '0', 'o6oGSwlaFC8pgjXw7g9Mff3hFPSw', '1504484864', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('21', '117777', '0', 'o6oGSwlfz4_giP9oNMQp4-Vv1QcM', '1504485796', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('22', '117777', '118590', 'o6oGSwpJlcIso__IsD9fXu0FKEdk', '1504487057', '1504488901');
INSERT INTO `t_gamer_to_gamer` VALUES ('23', '117777', '0', 'o6oGSwgxb5nCbOUGv1VLn-MjFNLg', '1504493115', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('24', '117777', '118132', 'o6oGSwi33aNVNKz7KtxcZQS37oms', '1504495456', '1504495576');
INSERT INTO `t_gamer_to_gamer` VALUES ('25', '117961', '117793', 'o6oGSwkAFf_X3d-s4bgS2R4LeFqM', '1504503819', '1504503958');
INSERT INTO `t_gamer_to_gamer` VALUES ('26', '117961', '117859', 'o6oGSwnIqtVyHo6fs4tbddHzPa64', '1504504391', '1504504477');
INSERT INTO `t_gamer_to_gamer` VALUES ('27', '117961', '117933', 'o6oGSwj4US9V-GdC3_kTSoUbhSgs', '1504504592', '1504505534');
INSERT INTO `t_gamer_to_gamer` VALUES ('28', '117961', '117810', 'o6oGSwr9VfPAaH6nnKYGDYh5LFi8', '1504505274', '1504505402');
INSERT INTO `t_gamer_to_gamer` VALUES ('29', '117961', '0', 'o6oGSwun_KQqB5sGVInbiB8HzPek', '1504505866', '0');
INSERT INTO `t_gamer_to_gamer` VALUES ('30', '117961', '118443', 'o6oGSwjyMNEeUL_ydULBYt_9fRMg', '1504506904', '1504507038');
INSERT INTO `t_gamer_to_gamer` VALUES ('31', '117961', '117730', 'o6oGSwuqU1PKdirvStLSUxbg8oWE', '1504507736', '1504507848');
INSERT INTO `t_gamer_to_gamer` VALUES ('32', '117961', '118358', 'o6oGSwm_qeX4HsFrp2ZVNqN1PVzM', '1504508773', '1504508878');
INSERT INTO `t_gamer_to_gamer` VALUES ('33', '117961', '0', 'o6oGSwr7_g5r5l6eRi0vkSTPG_zI', '1504515542', '0');

-- ----------------------------
-- Table structure for `t_game_room_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_room_log`;
CREATE TABLE `t_game_room_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL COMMENT '房间ID',
  `uids` varchar(100) NOT NULL,
  `action_time` int(11) NOT NULL COMMENT '记录时间',
  `finish_time` int(11) NOT NULL COMMENT '结束时间',
  `play_times` char(10) DEFAULT NULL COMMENT '一局里打了多少盘',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_room_log
-- ----------------------------
INSERT INTO `t_game_room_log` VALUES ('1', '630770', '', '1503562668', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('2', '23163', '', '1503563253', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('3', '808250', '', '1503566370', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('4', '473766', '', '1503663940', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('5', '641023', '117814,118088,118020,117799', '1503886266', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('6', '121542', '118419,118294,118474,118151', '1503903394', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('7', '121542', '118151,118419,118294,118474', '1503903681', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('8', '121542', '118151,118419,118294,118474', '1503903931', '0', '0');
INSERT INTO `t_game_room_log` VALUES ('9', '117285', '118088,118020,117799,117814', '1503991593', '1503991849', '2');
INSERT INTO `t_game_room_log` VALUES ('10', '591382', '118088,118020,117799,117814', '1503991934', '1503992426', '3');
INSERT INTO `t_game_room_log` VALUES ('11', '410763', '118595,118277,118482,117961', '1504078478', '1504081757', '12');
INSERT INTO `t_game_room_log` VALUES ('12', '233401', '118444,118224,118096,117908', '1504085427', '1504085687', '1');
INSERT INTO `t_game_room_log` VALUES ('13', '865801', '117887,118482,118277,118097', '1504246426', '1504249631', '10');

-- ----------------------------
-- Table structure for `t_game_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_user`;
CREATE TABLE `t_game_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(64) NOT NULL COMMENT '用户id',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `openid` varchar(30) DEFAULT NULL COMMENT '微信openid',
  `unionid` varchar(50) DEFAULT NULL,
  `register_time` int(11) unsigned NOT NULL COMMENT '注册时间',
  `dimond` int(11) unsigned NOT NULL COMMENT '余额',
  `sum_dimond` int(11) unsigned NOT NULL COMMENT '累计充值',
  `total_play_times` int(11) NOT NULL COMMENT '总玩牌数',
  `last_login_time` bigint(20) DEFAULT NULL COMMENT '上次登陆时间',
  `last_dimond_charge_time` bigint(20) DEFAULT NULL COMMENT '最近充值时间',
  `reg_ip` varchar(50) DEFAULT NULL COMMENT '账号注册ip',
  `invite_id` varchar(50) DEFAULT NULL,
  `os` varchar(50) NOT NULL COMMENT '操作系统',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `unionid` (`unionid`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_user
-- ----------------------------
INSERT INTO `t_game_user` VALUES ('1', '118269', '非得', 'ofcTU0n8u3q-aMeUXs3jIyitAPi4', 'o6oGSwmoIMzm1foKqz9NCiKMiDvA', '1503050207', '5', '0', '0', '1503050207', null, '::ffff:218.191.199.157', '0', '');
INSERT INTO `t_game_user` VALUES ('2', '117985', 'weka2tega8', 'weka2tega8', 'weka2tega8', '1503050258', '5', '0', '0', '1503562394', null, '::ffff:218.19.99.157', '0', '');
INSERT INTO `t_game_user` VALUES ('3', '118347', 'vincent3', 'vincent3', 'vincent3', '1503050437', '5', '0', '0', '1503280678', null, '::ffff:218.19.99.157', '0', '');
INSERT INTO `t_game_user` VALUES ('4', '117962', 'wyy156', 'wyy156', 'wyy156', '1503062778', '5', '0', '0', '1503125796', null, '::ffff:218.19.99.157', '0', '');
INSERT INTO `t_game_user` VALUES ('5', '118407', 'fjgd', 'fjgd', 'fjgd', '1503110163', '5', '0', '0', '1503130649', null, '::ffff:218.19.99.157', '0', '');
INSERT INTO `t_game_user` VALUES ('6', '118515', '孙鹏', 'ofcTU0oKoihXN5FEmvPOunRlgufE', 'o6oGSwipZld02qN6wKydNWJRCwzE', '1503110736', '5', '0', '0', '1503110736', null, '::ffff:218.19.99.157', '1', '');
INSERT INTO `t_game_user` VALUES ('7', '118023', '琅琊', 'ofcTU0gs5Ny3qnIFvneAET4Vrw5o', 'o6oGSwvxOH-SPgSnNCWUOX16UbNQ', '1503112885', '5', '0', '0', '1504084125', null, '::ffff:218.19.99.157', '1', '');
INSERT INTO `t_game_user` VALUES ('8', '117842', 'k', 'k', 'k', '1503124475', '5', '0', '0', '1503131592', null, '::ffff:218.19.99.157', '0', '');
INSERT INTO `t_game_user` VALUES ('9', '118568', 'l', 'l', 'l', '1503136754', '95', '0', '0', '1503903895', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('10', '118167', '李超出售混凝土13580072139', 'ofcTU0ptsftX8xK7b9LnieYmBGec', 'o6oGSwnVl_yTeqrsHiWxXkCoXVnk', '1503270616', '5', '0', '0', '1503270616', null, '::ffff:120.239.36.121', '1', '');
INSERT INTO `t_game_user` VALUES ('11', '118602', 'Wyyeah', 'ofcTU0i8sNdToC1Y021oVcmbQ4hA', 'o6oGSwg8zVnr3sqhJgXd1fOB6TaM', '1503284179', '5', '0', '0', '1504490664', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('12', '117770', 'wyy152', 'wyy152', 'wyy152', '1503284270', '5', '0', '0', '1503284270', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('13', '118584', 'gdgstest1', 'gdgstest1', 'gdgstest1', '1503284623', '5', '0', '0', '1503303649', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('14', '117841', 'gdgstest2', 'gdgstest2', 'gdgstest2', '1503284645', '5', '0', '0', '1503303649', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('15', '118176', 'gdgstest3', 'gdgstest3', 'gdgstest3', '1503284670', '5', '0', '0', '1503303648', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('16', '118489', 'wyy153', 'wyy153', 'wyy153', '1503287570', '5', '0', '0', '1503287570', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('17', '118072', 'wyy154', 'wyy154', 'wyy154', '1503287571', '5', '0', '0', '1503303455', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('18', '118614', '????????', 'olQ1n0RkZs_5OxCCyfKTvZoBudtA', 'o6oGSwpaE2dpJNrTpqTYBseHkxMo', '1503288011', '5', '0', '0', '1504490722', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('19', '118696', 'vincent', 'vincent', 'vincent', '1503297277', '5', '0', '0', '1503906992', null, '::ffff:119.145.83.191', '0', '');
INSERT INTO `t_game_user` VALUES ('20', '118062', '出来看上帝', 'ofcTU0sp8Vx9iqjnEazYsCRI2Ia0', 'o6oGSwsMzHAzrVH3bKy9vaj6eTDw', '1503311039', '5', '0', '0', '1503447349', null, '::ffff:14.30.233.186', '1', '');
INSERT INTO `t_game_user` VALUES ('21', '118502', 'j', 'j', 'j', '1503369003', '5', '0', '0', '1503903432', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('22', '117964', 'gametest', 'gametest', 'gametest', '1503371727', '5', '0', '0', '1503650145', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('23', '117970', 'gametest1', 'gametest1', 'gametest1', '1503382629', '5', '0', '0', '1503388509', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('24', '118206', 'gametest2', 'gametest2', 'gametest2', '1503382637', '5', '0', '0', '1503387499', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('25', '117972', 'gametest3', 'gametest3', 'gametest3', '1503382641', '5', '0', '0', '1503387488', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('26', '117861', 'vinc', 'vinc', 'vinc', '1504093093', '5', '0', '0', '1504093093', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('27', '117840', 'vin2', 'vin2', 'vin2', '1503478614', '5', '0', '0', '1503577715', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('28', '118653', 'vin3', 'vin3', 'vin3', '1503478619', '5', '0', '0', '1503577718', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('29', '118483', 'vincent1', 'vincent1', 'vincent1', '1503479336', '5', '0', '0', '1503481295', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('30', '117791', 'vincent2', 'vincent2', 'vincent2', '1503479375', '5', '0', '0', '1503479375', null, '::ffff:218.19.98.132', '0', '');
INSERT INTO `t_game_user` VALUES ('31', '117998', '冰封的芯', 'ofcTU0pHDkCftFOE0Mvgfk4Ckc2M', 'o6oGSwgx1a0mjzsyV2v74DUT9J74', '1503539630', '5', '0', '0', '1503539630', null, '::ffff:36.62.130.152', '0', '');
INSERT INTO `t_game_user` VALUES ('32', '118157', 'vin31', 'vin31', 'vin31', '1503559142', '5', '0', '0', '1503559142', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('33', '118088', 'weka1', 'weka1', 'weka1', '1503562615', '5', '0', '0', '1504511394', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('34', '118020', 'weka2', 'weka2', 'weka2', '1503562623', '5', '0', '0', '1504337863', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('35', '117799', 'weka3', 'weka3', 'weka3', '1503562646', '5', '0', '0', '1504319115', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('36', '117814', 'weka4', 'weka4', 'weka4', '1503562661', '5', '0', '0', '1504319182', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('37', '118114', 'wyy158', 'wyy158', 'wyy158', '1503564334', '5', '0', '0', '1503564334', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('38', '117752', 'wyy161', 'wyy161', 'wyy161', '1503650257', '5', '0', '0', '1503650383', null, '::ffff:218.19.98.13', '0', '');
INSERT INTO `t_game_user` VALUES ('39', '117878', 'h', 'h', 'h', '1503662972', '5', '0', '0', '1503670354', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('40', '118106', 'vincent11', 'vincent11', 'vincent11', '1503906998', '5', '0', '0', '1503908247', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('41', '118151', 'qmbetest', 'qmbetest', 'qmbetest', '1503663434', '8', '0', '0', '1504031505', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('42', '118294', 'qmbetest2', 'qmbetest2', 'qmbetest2', '1503663586', '5', '0', '0', '1504085276', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('43', '118474', 'qmbetest3', 'qmbetest3', 'qmbetest3', '1503663627', '5', '0', '0', '1503903361', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('44', '118362', 'qmbetest4', 'qmbetest4', 'qmbetest4', '1503663642', '5', '0', '0', '1503663642', null, '::ffff:119.130.231.219', '0', '');
INSERT INTO `t_game_user` VALUES ('45', '118286', '秋璇', 'ofcTU0q8GZeW7AKvY4ywM8eFPQOo', 'o6oGSwg31VwxvWKm1IFoQ0ZoU0nQ', '1503730504', '5', '0', '0', '1503799531', null, '::ffff:180.126.247.167', '0', '');
INSERT INTO `t_game_user` VALUES ('46', '118419', 'qmbetest1', 'qmbetest1', 'qmbetest1', '1503903332', '5', '0', '0', '1504085272', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('47', '117787', 'a', 'a', 'a', '1503904015', '5', '0', '0', '1503904015', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('48', '117848', 'd', 'd', 'd', '1503904208', '5', '0', '0', '1503904208', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('49', '117865', 'gagdj', 'gagdj', 'gagdj', '1503905864', '5', '0', '0', '1503976877', null, '::ffff:183.42.45.34', '0', '');
INSERT INTO `t_game_user` VALUES ('51', '118208', '更改名字', 'ofcTU0ouzUHteDJymSet3FYVl794', 'o6oGSwmf8ycKk0t3VKRm114B9yY8', '1503910099', '5', '0', '0', '1504147145', null, '::ffff:117.93.219.227', '0', '');
INSERT INTO `t_game_user` VALUES ('52', '117838', 'fhgdtest', 'fhgdtest', 'fhgdtest', '1503954999', '5', '0', '0', '1503954999', null, '::ffff:17.200.11.44', '0', '');
INSERT INTO `t_game_user` VALUES ('53', '117824', 'vincent21', 'vincent21', 'vincent21', '1503976329', '5', '0', '0', '1503987666', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('54', '117854', 'vincent22', 'vincent22', 'vincent22', '1503987551', '5', '0', '0', '1503987551', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('55', '117882', 'vincent23', 'vincent23', 'vincent23', '1503987691', '5', '0', '0', '1503987691', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('56', '118646', 'vv1', 'vv1', 'vv1', '1503998101', '5', '0', '0', '1503998731', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('57', '118296', 'v', 'v', 'v', '1503998103', '5', '0', '0', '1503998731', null, '::ffff:119.130.228.3', '0', '');
INSERT INTO `t_game_user` VALUES ('58', '118617', 'vt', 'vt', 'vt', '1504007621', '5', '0', '0', '1504009647', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('59', '118297', 'v8', 'v8', 'v8', '1504009675', '5', '0', '0', '1504009675', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('60', '117908', '南宫云', 'olQ1n0Z-boEc4VEQesf1g3oKnKD4', 'o6oGSwmJP4MOYhD3wyNOG1HPoRw4', '1504057660', '5', '0', '0', '1504497477', null, '::ffff:119.130.228.100', '1', '');
INSERT INTO `t_game_user` VALUES ('61', '117804', 'L-jiehui', 'olQ1n0eYYP3hkE0F8mpIc-_zFLTY', 'o6oGSwi760wqDnCVzhfN1QuHDa0Y', '1504057745', '5', '0', '0', '1504090246', null, '::ffff:119.130.228.100', '1', '');
INSERT INTO `t_game_user` VALUES ('64', '117938', 'かが????', 'olQ1n0eQY7xVnDzfSUdmLEjRVHLw', 'o6oGSwq9vwPoGvdm-9io5C8A4hvw', '1504076865', '5', '0', '0', '1504079981', null, '::ffff:122.96.227.23', '0', '');
INSERT INTO `t_game_user` VALUES ('65', '118595', '爱喝嘉多宝', 'olQ1n0ZR8YK8UK7_fxkdy5txtfJY', 'o6oGSwjYA4LyZvEE7b4JIPw0dgo0', '1504078136', '5', '0', '0', '1504479376', null, '::ffff:49.83.26.174', '0', '');
INSERT INTO `t_game_user` VALUES ('66', '118277', '点滴生活', 'ofcTU0pvIU9vnf3CmOYEa_Bj9J_E', 'o6oGSwm_fcOaaBDqlmIckX4eETwk', '1504078357', '5', '0', '0', '1504308866', null, '::ffff:49.83.26.174', '0', '');
INSERT INTO `t_game_user` VALUES ('67', '118482', '????尼古拉斯·莱昂纳多·仲·华小', 'olQ1n0bpPvXAPKECcQLW5xLbWPLk', 'o6oGSwtojv26p7cYvkW9b7ZavdBE', '1504078388', '5', '0', '0', '1504249765', null, '::ffff:49.83.26.174', '0', '');
INSERT INTO `t_game_user` VALUES ('69', '118224', 'fhqmbe1', 'fhqmbe1', 'fhqmbe1', '1504085379', '5', '0', '0', '1504085379', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('70', '118096', 'fhqmbe2', 'fhqmbe2', 'fhqmbe2', '1504085391', '5', '0', '0', '1504085391', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('71', '117862', 'Lolita', 'olQ1n0XC1pJTbaMspIEgFP9RP2g0', 'o6oGSwouDsn8c5e9ZifQ41AX7_5s', '1504089350', '5', '0', '0', '1504147561', null, '::ffff:183.42.40.220', '0', '');
INSERT INTO `t_game_user` VALUES ('73', '118000', 'vin', 'vin', 'vin', '1504093020', '5', '0', '0', '1504093108', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('74', '117959', 'vinc1', 'vinc1', 'vinc1', '1504093028', '5', '0', '0', '1504093028', null, '::ffff:119.130.228.100', '0', '');
INSERT INTO `t_game_user` VALUES ('76', '117887', '????A M Y', 'olQ1n0Q1_PzjlZWC9nkUx6iuO85M', 'o6oGSwia2TtL0c3ENF-KssG5OVvc', '1504093096', '5', '0', '0', '1504246375', null, '::ffff:180.126.244.126', '0', '');
INSERT INTO `t_game_user` VALUES ('77', '118249', 'AA  ????Man@味', 'olQ1n0QaTVwX1ty73RqJMZl4YGe0', 'o6oGSwrI_zthho-fJsJ3rT9-L0wo', '1504176083', '5', '0', '0', '1504176083', null, '::ffff:117.136.66.198', '0', '');
INSERT INTO `t_game_user` VALUES ('78', '118097', '青瓜藤', 'olQ1n0cHQi5WO0fGuf39USIavVIw', 'o6oGSws41T5rXe2neIu6zyTNPxhc', '1504246299', '5', '0', '0', '1504246624', null, '::ffff:180.126.248.71', '0', '');
INSERT INTO `t_game_user` VALUES ('79', '117771', '憨厚', 'olQ1n0ceYzgWBFszeNcmSPPzXJyY', 'o6oGSwvapZUHkHLg2xr7i4qhqmCI', '1504273066', '5', '0', '0', '1504273066', null, '::ffff:36.149.228.186', '0', '');
INSERT INTO `t_game_user` VALUES ('80', '118008', '首艺专业假发套定制', 'olQ1n0WjjDmxfgGsVdtQ8pXaC-xI', 'o6oGSwo_bXln9I4mkeYHZDgSYiPA', '1504423518', '5', '0', '0', '1504423518', null, '::ffff:223.67.185.231', '0', '');
INSERT INTO `t_game_user` VALUES ('81', '117777', '我', 'olQ1n0WdMI4D_MSFxzfMsmKwuDb0', 'o6oGSwrGhyZON-ulPtXZVqjE11Hk', '1504482800', '5', '0', '0', '1504482800', null, '::ffff:122.96.43.76', '0', '');
INSERT INTO `t_game_user` VALUES ('82', '118590', '????童童????', 'olQ1n0RXU-IBRTohUIsFa1Wah9Oo', 'o6oGSwpJlcIso__IsD9fXu0FKEdk', '1504488901', '5', '0', '0', '1504489117', null, '::ffff:117.136.66.193', '1', '');
INSERT INTO `t_game_user` VALUES ('83', '117785', '谢谢你', 'olQ1n0ed-QVOHteKNbG2dyH5XrBA', 'o6oGSwtvOVVoL04EJSfq5m8kncik', '1504493281', '5', '0', '0', '1504493281', null, '::ffff:112.3.179.182', '0', '');
INSERT INTO `t_game_user` VALUES ('84', '118132', '晃晃', 'olQ1n0T7Hsde0kvHHuQCehlcI53Q', 'o6oGSwi33aNVNKz7KtxcZQS37oms', '1504495576', '5', '0', '0', '1504495729', null, '::ffff:114.236.54.70', '1', '');
INSERT INTO `t_game_user` VALUES ('86', '118625', '大亨', 'olQ1n0a8doJ3WKKNjkp5Roxld6hY', 'o6oGSwvPnbbhaBoN21ljHHcQOqk8', '1504503897', '5', '0', '0', '1504505615', null, '::ffff:36.149.85.211', '1', '');
INSERT INTO `t_game_user` VALUES ('87', '117793', '局外朲', 'olQ1n0dt24STszKwPivzOvxZX4P4', 'o6oGSwkAFf_X3d-s4bgS2R4LeFqM', '1504503958', '5', '0', '0', '1504505691', null, '::ffff:114.236.23.93', '1', '');
INSERT INTO `t_game_user` VALUES ('88', '117859', '義薄雲天????', 'olQ1n0V1wey1vCsWSaLzLUWSepu4', 'o6oGSwnIqtVyHo6fs4tbddHzPa64', '1504504477', '5', '0', '0', '1504504477', null, '::ffff:49.92.85.51', '1', '');
INSERT INTO `t_game_user` VALUES ('89', '117810', '曾经•的•回忆', 'olQ1n0Q5TeKTKGYH2lXGX20WrB2o', 'o6oGSwr9VfPAaH6nnKYGDYh5LFi8', '1504505402', '5', '0', '0', '1504505542', null, '::ffff:122.192.14.5', '1', '');
INSERT INTO `t_game_user` VALUES ('90', '117933', '石头????爸爸、', 'olQ1n0cXXpOPhMRCa6bYxTuuRQy8', 'o6oGSwj4US9V-GdC3_kTSoUbhSgs', '1504505534', '5', '0', '0', '1504505534', null, '::ffff:60.181.105.93', '1', '');
INSERT INTO `t_game_user` VALUES ('91', '118011', '孙步坤', 'olQ1n0T3gf8wResLzbvYqmNubvkU', 'o6oGSwqAlxV-9qhLHa1y1g6W95ko', '1504505959', '5', '0', '0', '1504507899', null, '::ffff:114.236.61.168', '0', '');
INSERT INTO `t_game_user` VALUES ('92', '117825', 'vino2', 'vino2', 'vino2', '1504505983', '5', '0', '0', '1504505999', null, '::ffff:119.145.82.165', '0', '');
INSERT INTO `t_game_user` VALUES ('93', '118443', '　　　　　　　　', 'olQ1n0UclpRS94t2EzSvQYwGvK2k', 'o6oGSwjyMNEeUL_ydULBYt_9fRMg', '1504507038', '5', '0', '0', '1504517540', null, '::ffff:121.234.69.195', '1', '');
INSERT INTO `t_game_user` VALUES ('94', '117730', 'A天王盖地虎', 'olQ1n0Qtvz4-hlBNyJWhcQGZgycc', 'o6oGSwuqU1PKdirvStLSUxbg8oWE', '1504507848', '5', '0', '0', '1504516795', null, '::ffff:117.93.115.86', '1', '');
INSERT INTO `t_game_user` VALUES ('95', '118358', '????????????', 'olQ1n0fkDmk9qPH3Zi8HZOMs0gmk', 'o6oGSwm_qeX4HsFrp2ZVNqN1PVzM', '1504508878', '5', '0', '0', '1504508878', null, '::ffff:117.136.68.196', '1', '');

-- ----------------------------
-- Table structure for `t_game_user_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_user_login_log`;
CREATE TABLE `t_game_user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) NOT NULL COMMENT '玩家uid',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `create_time` int(11) NOT NULL COMMENT '玩家账号创建时间',
  `action` char(10) DEFAULT NULL COMMENT '动作类型',
  `online_time` int(11) NOT NULL COMMENT '在线时间',
  `last_login_time` int(11) NOT NULL COMMENT '玩家最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_game_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_group`
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '群组id',
  `name` varchar(50) NOT NULL COMMENT '群组名',
  `power` text NOT NULL COMMENT '群组权限',
  `remark` varchar(200) DEFAULT '请填写群组描述' COMMENT '群组描述',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '01-后台开发', '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 74 75 76 77 78 79 80 81 82 83 84 85 90 92 93 98 99 100 101 102 103 104 105 107 108 109 110 113 114 116 117 118 120 121 122 123 124 126 129 131 133 134 135 136 137 138 139 142 143 144 145 147 148 149 150 151 152 153 154 155 156 157 165', ' 后台开发');
INSERT INTO `t_group` VALUES ('2', '02-ADMIN', '1 20 40 60 61 80 81 100', ' Administrator');
INSERT INTO `t_group` VALUES ('3', '03-普通用户', '80 81', ' 普通用户');
INSERT INTO `t_group` VALUES ('12', 'cs', '1 23 24 40 41 80 81 83 103', '客服');

-- ----------------------------
-- Table structure for `t_money_back_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_money_back_log`;
CREATE TABLE `t_money_back_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auid` varchar(50) NOT NULL COMMENT '代理uid',
  `pay_person_num` int(11) NOT NULL COMMENT '推广出来有消费的玩家数',
  `pay_person_dimond_num` int(11) NOT NULL COMMENT '有消费玩家总消费的房卡（钻石）数',
  `get_money` float NOT NULL COMMENT '奖励金额',
  `get_money_time` int(11) NOT NULL COMMENT '统计日期',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '当月推荐玩家消耗的房卡（钻石）是否翻卡（钻）',
  `handle_time` int(11) DEFAULT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_money_back_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_offlineplay_sign_sort`
-- ----------------------------
DROP TABLE IF EXISTS `t_offlineplay_sign_sort`;
CREATE TABLE `t_offlineplay_sign_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unionid` varchar(100) NOT NULL,
  `sign_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_offlineplay_sign_sort
-- ----------------------------

-- ----------------------------
-- Table structure for `t_offline_play`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_play`;
CREATE TABLE `t_offline_play` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `unionid` varchar(100) NOT NULL COMMENT '微信openid',
  `sign` int(1) NOT NULL DEFAULT '0' COMMENT '是否签到',
  `sign_sort` int(11) NOT NULL COMMENT '签到序号',
  `sign_time` int(11) NOT NULL COMMENT '签到时间',
  `create_time` int(11) NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_offline_play
-- ----------------------------

-- ----------------------------
-- Table structure for `t_offline_play_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_offline_play_setting`;
CREATE TABLE `t_offline_play_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL COMMENT '活动结束时间',
  `join_point` int(11) NOT NULL COMMENT '报名积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_offline_play_setting
-- ----------------------------
INSERT INTO `t_offline_play_setting` VALUES ('1', '1500566400', '1504108800', '300');

-- ----------------------------
-- Table structure for `t_online_count_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_online_count_log`;
CREATE TABLE `t_online_count_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `online_count` int(11) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  `year` int(11) unsigned NOT NULL,
  `month` int(11) unsigned NOT NULL,
  `week` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `hour` int(11) unsigned NOT NULL,
  `min` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_online_count_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_online_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_online_log`;
CREATE TABLE `t_online_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `online` int(10) unsigned NOT NULL COMMENT '在线数量',
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=386349 DEFAULT CHARSET=utf8 COMMENT='玩家在线日志表';

-- ----------------------------
-- Records of t_online_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_recharge_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge_log`;
CREATE TABLE `t_recharge_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(200) DEFAULT NULL,
  `alipay_order_id` varchar(100) DEFAULT NULL,
  `order_status` tinyint(4) unsigned DEFAULT '0' COMMENT '订单状态（TRADE_SUCCESS:1, TRADE_FINISHED:2）',
  `uid` varchar(50) DEFAULT NULL,
  `dimond_number` int(11) unsigned DEFAULT NULL,
  `money_number` int(11) unsigned DEFAULT NULL,
  `gift_dimond_number` int(11) unsigned DEFAULT NULL,
  `action_time` int(11) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '订单创建时间',
  `success_time` int(10) unsigned DEFAULT NULL COMMENT '订单Success时间',
  `finish_time` int(10) unsigned DEFAULT NULL COMMENT '订单完成时间',
  `desc` varchar(255) DEFAULT NULL,
  `pay_way` char(20) NOT NULL DEFAULT 'alipay' COMMENT '支付方式',
  PRIMARY KEY (`id`),
  KEY `order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge_log
-- ----------------------------
INSERT INTO `t_recharge_log` VALUES ('1', '20170720094532296698', null, '0', 'hg5289', '1', '1', '0', null, '1500515132', null, null, '购买1钻石，赠送0钻石', 'alipay');
INSERT INTO `t_recharge_log` VALUES ('2', '2017072009461791493', '2017072021001004830237081058', '1', 'hg5289', '1', '1', '0', null, '1500515177', null, '1500515186', '购买1钻石，赠送0钻石', 'alipay');
INSERT INTO `t_recharge_log` VALUES ('5', '20170720100848644596', '4009842001201707201687759671', '1', 'hg5289', '1', '1', '0', null, '1500516528', null, '1500516573', '购买1钻石，赠送0钻石', 'wxpay');
INSERT INTO `t_recharge_log` VALUES ('6', '20170808165806950657', '2017080821001004830274265180', '1', 'hg5289', '300', '1', '0', null, '1502182686', null, '1502182698', '购买300钻石，赠送0钻石', 'alipay');
INSERT INTO `t_recharge_log` VALUES ('7', '20170808165839911969', '4009842001201708085161950037', '1', 'hg5289', '300', '1', '0', null, '1502182719', null, '1502182735', '购买300钻石，赠送0钻石', 'wxpay');
INSERT INTO `t_recharge_log` VALUES ('8', '2017080817053235884', null, '0', 'hg5289', '300', '30000', '0', null, '1502183132', null, null, '购买300钻石，赠送0钻石', 'alipay');
INSERT INTO `t_recharge_log` VALUES ('9', '20170808170535670151', null, '0', 'hg5289', '300', '1', '0', null, '1502183135', null, null, '购买300钻石，赠送0钻石', 'wxpay');

-- ----------------------------
-- Table structure for `t_sell_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sell_log`;
CREATE TABLE `t_sell_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '代理等级',
  `seller_uid` varchar(50) NOT NULL,
  `buyer_uid` varchar(50) NOT NULL,
  `buyer_type` tinyint(3) unsigned DEFAULT NULL,
  `buyer_nickname` varchar(50) DEFAULT '',
  `buyer_name` varchar(50) DEFAULT NULL,
  `dimond_num` int(11) unsigned NOT NULL,
  `action_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sell_log
-- ----------------------------
INSERT INTO `t_sell_log` VALUES ('1', 'hg5289', '4', null, '', '非得', '1', '1500982361');
INSERT INTO `t_sell_log` VALUES ('2', 'hg5289', '117840', null, '', '非得', '1', '1500982719');
INSERT INTO `t_sell_log` VALUES ('3', 'hg5289', '117791', null, '', '非得', '1', '1500982778');
INSERT INTO `t_sell_log` VALUES ('4', 'hg5289', '117985', null, '', '南宫云', '1', '1500983092');
INSERT INTO `t_sell_log` VALUES ('5', 'hg5289', '1', null, '', '南宫云', '1', '1500983146');

-- ----------------------------
-- Table structure for `t_system_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_setting`;
CREATE TABLE `t_system_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `setting_name` char(100) NOT NULL COMMENT '参数名',
  `setting_value` text NOT NULL COMMENT '具体信息',
  `value_introduce` char(100) NOT NULL COMMENT '参数名字解释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_setting
-- ----------------------------
INSERT INTO `t_system_setting` VALUES ('1', 'agency_index_note', '特别提醒，官方给所有代理购卡价格，均为统一价格，童叟无欺！ <br />\r\n如有低于官方的代理价格即为骗子骗款行为，请勿上当! <br />\r\n<br />\r\n为保护1、2代代理利益，淘宝代理请下架所有“烽火掼蛋”房卡链接，违反销售规定的代理，公司有权扣卡并取消代理资格！ <br />\r\n<br />\r\n做好代理的几个方法： <br />\r\n1.在群内备注自己的名字：XX购卡私信我 群主要有担当，有解决问题的能力，群友才能信服，也有归属感。 <br />\r\n2.备注所有微信玩家的游戏ID，关注群内开房玩家，如果不是在自己购买房卡的玩家可以沟通、引导玩家向自己购买，也可以禁止玩家在你的群里开房以免影响消耗。 <br />\r\n3.可以提供游戏ID让客服查询近期只能是否在你这里购买。 <br />\r\n4.通过自己和自己的好友经常转发游戏宣传图片，近期活动图片，战局图片，让你的好友帮你一起壮大群人数。 <br />\r\n5.三四十人的微信群，不能算是稳定的群，尽快到百人群，才算是比较稳定的群。 <br />\r\n---------------------------------------------- <br />\r\n<br />\r\n<br />\r\n代理销售和处罚政策： <br />\r\n---------------------------------------------- <br />\r\n一、代理零售价格表 <br />\r\n12张=30元         （单价不低于2.50元/张） <br />\r\n24张=60元         （单价不低于2.50元/张） <br />\r\n36张=90元         （单价不低于2.50元/张） <br />\r\n50张=120元      （单价不低于2.40元/张） <br />\r\n购卡≥60张以上房卡不低于2.3张/元 <br />\r\n备注：≥60张购卡,销售请要求玩家微信转账，以便客服核实销售截图！ <br />\r\n---------------------------------------------- <br />\r\n二、为维持统一的价格体系，保障代理合理的利润空间，公平竞争，公司将对违反代理规则者严肃处理，具体措施如下： <br />\r\n<br />\r\n1. 代理（1代）任意形式的低价，包括利用赠送、返点（尚未发生但有明显表达），有聊天截图为证，扣除该销售员500张房卡。 <br />\r\n2. 代理（2代）任意形式的低价，包括利用赠送、返点（尚未发生但有明显表达），有聊天截图为证，扣除该销售员200张房卡、 <br />\r\n3. 代理（1代）所属代理（2代）屡次出现销售违规行为，将取消代理（1代）开设代理（2代）权限功能。 <br />\r\n4.屡次破坏以上销售规则的推广员及销售员，直接封存账户，房卡不予退还。 <br />\r\n5.不支持任何淘宝、咸鱼、等其他平台零售房卡。 <br />\r\n---------------------------------------------- <br />\r\n三：举报奖励办法和其他： <br />\r\n1.截图核实后50%扣卡给予举报者。 <br />\r\n2.公司对低价售卡行为零容忍态度，客服将对推广员随时抽样调查。 <br />\r\n3.公司具有此行为的最终解释权 ！ <br />\r\n---------------------------------------------- <br />\r\n特别提醒：所有代理有一个专属链接（http://fhqp.tqfy0.com/game/wx.php?state=xxx-3)，代理可以通过专属链接配合图片不断地推广自己的链接，今后会有更优惠的政策出台！ <br />\r\n<br />\r\n---------------------------------------------- <br />', '代理首页公告');
INSERT INTO `t_system_setting` VALUES ('2', 'get_inviter_buy_persent', '0.05', '从推荐用户购买房卡（钻石）时可获取房卡（钻石）的百分比');
INSERT INTO `t_system_setting` VALUES ('3', 'get_inviter_use_persent', '0.05', '从推荐用户消耗房卡（钻石）时可获取房卡（钻石）的百分比');
INSERT INTO `t_system_setting` VALUES ('4', 'get_inviter_money_persent', '0.02', '从推荐用户消耗房卡（钻石）时可返现的百分比（单位分）');
INSERT INTO `t_system_setting` VALUES ('5', 'interface_port_num', '28085', '请求游戏接口的端口号');
INSERT INTO `t_system_setting` VALUES ('6', 'game_id', '3', '游戏id');
INSERT INTO `t_system_setting` VALUES ('7', 'fx_url', 'http://fhqp.tqfy0.com/game/wx.php?state=', '代理分享url');
INSERT INTO `t_system_setting` VALUES ('8', 'web_url', 'http://houtai.hainanjiuyue.com/houtai/fhgd/', '网站后台的url');
INSERT INTO `t_system_setting` VALUES ('9', 'web_server', 'http://houtai.hainanjiuyue.com', '域名');
INSERT INTO `t_system_setting` VALUES ('10', 'game_notice', '游戏公告2~', '游戏公告');

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------

-- ----------------------------
-- Table structure for `t_test_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_test_log`;
CREATE TABLE `t_test_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_conent` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test_log
-- ----------------------------
INSERT INTO `t_test_log` VALUES ('1', '<xml><appid><![CDATA[wxf09b5c7c01706dde]]></appid>\n<attach><![CDATA[购买1钻石，赠送0钻石]]></attach>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1456967502]]></mch_id>\n<nonce_str><![CDATA[83jeuvkk86ydm94muyymj5vrt4pvwifh]]></nonce_str>\n<openid><![CDATA[o1i_Z1OZhEyGtBRgQ5EfI9O0E9rc]]></openid>\n<out_trade_no><![CDATA[20170720095944931729]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[EC0FDC1B574AC5C0FF72FF553A0EBAF3]]></sign>\n<time_end><![CDATA[20170720100003]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[NATIVE]]></trade_type>\n<transaction_id><![CDATA[4009842001201707201687440229]]></transaction_id>\n</xml>');
INSERT INTO `t_test_log` VALUES ('2', 'Array-1500623623');
INSERT INTO `t_test_log` VALUES ('3', 'Array-1500800082');
INSERT INTO `t_test_log` VALUES ('4', 'Array-1500800642');
INSERT INTO `t_test_log` VALUES ('5', 'Array-1500800787');
INSERT INTO `t_test_log` VALUES ('6', 'Array-1500800792');
INSERT INTO `t_test_log` VALUES ('7', 'Array-1500802027');
INSERT INTO `t_test_log` VALUES ('8', 'Array-1500802521');
INSERT INTO `t_test_log` VALUES ('9', 'Array-1500810351');
INSERT INTO `t_test_log` VALUES ('10', '-3-1500811032');
INSERT INTO `t_test_log` VALUES ('11', '-327-1500864257');
INSERT INTO `t_test_log` VALUES ('12', '-1-1500864367');
INSERT INTO `t_test_log` VALUES ('13', '-1-1500864591');
INSERT INTO `t_test_log` VALUES ('14', '-1-1500864696');
INSERT INTO `t_test_log` VALUES ('15', '-1-1500864734');
INSERT INTO `t_test_log` VALUES ('16', '-1-1500864873');
INSERT INTO `t_test_log` VALUES ('17', '-1-1500953515');
INSERT INTO `t_test_log` VALUES ('18', '-118281-1501157271');
INSERT INTO `t_test_log` VALUES ('19', '-118183-1501158012');
INSERT INTO `t_test_log` VALUES ('20', '-118183-1501158180');
INSERT INTO `t_test_log` VALUES ('21', '-118704-1501158490');
INSERT INTO `t_test_log` VALUES ('22', '-118389-1501341673');
INSERT INTO `t_test_log` VALUES ('23', '-118389-1501341693');
INSERT INTO `t_test_log` VALUES ('24', '-118199-1501383616');
INSERT INTO `t_test_log` VALUES ('25', '-118199-1501383651');
INSERT INTO `t_test_log` VALUES ('26', '-118389-1501392875');
INSERT INTO `t_test_log` VALUES ('27', '-118389-1501392949');
INSERT INTO `t_test_log` VALUES ('28', '-118199-1501429151');
INSERT INTO `t_test_log` VALUES ('29', '-118389-1501548254');
INSERT INTO `t_test_log` VALUES ('30', '-118281-1501723554');
INSERT INTO `t_test_log` VALUES ('31', '-118614-1502771401');
INSERT INTO `t_test_log` VALUES ('32', '-118614-1502771412');
INSERT INTO `t_test_log` VALUES ('33', '-118614-1502771536');
INSERT INTO `t_test_log` VALUES ('34', '-118614-1502771557');
INSERT INTO `t_test_log` VALUES ('35', '-118614-1502771562');
INSERT INTO `t_test_log` VALUES ('36', '-118614-1502782708');
INSERT INTO `t_test_log` VALUES ('37', '-118614-1502782727');
INSERT INTO `t_test_log` VALUES ('38', '-118614-1502809465');
INSERT INTO `t_test_log` VALUES ('39', '-117840-1502943553');
INSERT INTO `t_test_log` VALUES ('40', '-117840-1502944600');
INSERT INTO `t_test_log` VALUES ('41', '-117961-1504170689');
INSERT INTO `t_test_log` VALUES ('42', '-117961-1504170789');
INSERT INTO `t_test_log` VALUES ('43', '-117961-1504186889');
INSERT INTO `t_test_log` VALUES ('44', '-118595-1504479409');
INSERT INTO `t_test_log` VALUES ('45', '-117777-1504484864');
INSERT INTO `t_test_log` VALUES ('46', '-117777-1504485796');
INSERT INTO `t_test_log` VALUES ('47', '-117777-1504487057');
INSERT INTO `t_test_log` VALUES ('48', '-117777-1504487193');
INSERT INTO `t_test_log` VALUES ('49', '-117777-1504493115');
INSERT INTO `t_test_log` VALUES ('50', '-117777-1504495456');
INSERT INTO `t_test_log` VALUES ('51', '-117961-1504503730');
INSERT INTO `t_test_log` VALUES ('52', '-117961-1504503808');
INSERT INTO `t_test_log` VALUES ('53', '-117961-1504503819');
INSERT INTO `t_test_log` VALUES ('54', '-117961-1504503852');
INSERT INTO `t_test_log` VALUES ('55', '-117961-1504504352');
INSERT INTO `t_test_log` VALUES ('56', '-117961-1504504391');
INSERT INTO `t_test_log` VALUES ('57', '-117961-1504504592');
INSERT INTO `t_test_log` VALUES ('58', '-117961-1504505036');
INSERT INTO `t_test_log` VALUES ('59', '-117961-1504505274');
INSERT INTO `t_test_log` VALUES ('60', '-117961-1504505379');
INSERT INTO `t_test_log` VALUES ('61', '-117961-1504505866');
INSERT INTO `t_test_log` VALUES ('62', '-117961-1504506904');
INSERT INTO `t_test_log` VALUES ('63', '-117961-1504507736');
INSERT INTO `t_test_log` VALUES ('64', '-117961-1504507769');
INSERT INTO `t_test_log` VALUES ('65', '-117961-1504508773');
INSERT INTO `t_test_log` VALUES ('66', '-117961-1504508954');
INSERT INTO `t_test_log` VALUES ('67', '-117961-1504515542');
INSERT INTO `t_test_log` VALUES ('68', '-117961-1504515578');
INSERT INTO `t_test_log` VALUES ('69', '-117961-1504515644');

-- ----------------------------
-- Table structure for `t_user_charge_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_charge_order`;
CREATE TABLE `t_user_charge_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) NOT NULL COMMENT '玩家uid',
  `trade_no` varchar(30) NOT NULL COMMENT '交易订单号',
  `order_sn` varchar(20) NOT NULL COMMENT '内部订单id',
  `transaction_id` varchar(30) NOT NULL,
  `price` float(5,2) NOT NULL COMMENT '交易金额',
  `dimond` int(11) NOT NULL COMMENT '房卡（钻石）',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `create_time` int(11) NOT NULL COMMENT '生成时间',
  `finish_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `wx_back_info` varchar(180) NOT NULL COMMENT '微信回调的信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_charge_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_complain`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_complain`;
CREATE TABLE `t_user_complain` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '玩家id',
  `contact_way` varchar(100) NOT NULL COMMENT '联系方式',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `content` text NOT NULL COMMENT '内容',
  `call_back` text NOT NULL COMMENT '回复',
  `handler` varchar(20) NOT NULL COMMENT '处理人',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_complain
-- ----------------------------
INSERT INTO `t_user_complain` VALUES ('1', '1', '', '0', '的发放的徕卡积分', '', '', '1500605493', '0');
INSERT INTO `t_user_complain` VALUES ('2', '1', '', '0', '我lad解放军阿克拉，附近的卡接？', '', '', '1500605537', '0');
INSERT INTO `t_user_complain` VALUES ('3', '20', '', '0', 'Wwwwwww\n', '', '', '1500714614', '0');

-- ----------------------------
-- Table structure for `t_user_dimond_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_dimond_log`;
CREATE TABLE `t_user_dimond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(64) DEFAULT NULL,
  `use_time` bigint(20) DEFAULT NULL,
  `use_dimond` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_dimond_log
-- ----------------------------

-- ----------------------------
-- View structure for `agency_to_ip_user`
-- ----------------------------
DROP VIEW IF EXISTS `agency_to_ip_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mahjong`@`localhost` SQL SECURITY DEFINER VIEW `agency_to_ip_user` AS select `a`.`id` AS `id`,`a`.`agency_id` AS `agency_id`,`a`.`action_time` AS `action_time`,`u`.`uid` AS `uid`,`u`.`username` AS `username`,`u`.`dimond` AS `dimond`,`u`.`sum_dimond` AS `sum_dimond`,`u`.`reg_ip` AS `reg_ip` from (`t_agency_and_user` `a` left join `t_game_user` `u` on((`a`.`agent_ip` = `u`.`reg_ip`))) where ((`u`.`uid` is not null) and (`u`.`username` is not null)) ;

-- ----------------------------
-- View structure for `agency_to_wx_user`
-- ----------------------------
DROP VIEW IF EXISTS `agency_to_wx_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`mahjong`@`localhost` SQL SECURITY DEFINER VIEW `agency_to_wx_user` AS select `a`.`id` AS `id`,`a`.`agency_id` AS `agency_id`,`a`.`unionid` AS `unionid`,`a`.`action_time` AS `action_time`,`u`.`uid` AS `uid`,`u`.`username` AS `username`,`u`.`register_time` AS `register_time`,`u`.`dimond` AS `dimond`,`u`.`sum_dimond` AS `sum_dimond` from (`t_agency_and_user` `a` left join `t_game_user` `u` on((`a`.`unionid` = `u`.`unionid`))) ;
