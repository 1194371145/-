/*
Navicat MySQL Data Transfer

Source Server         : 测试服
Source Server Version : 50718
Source Host           : 103.37.45.129:40203
Source Database       : caigo

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-08-31 16:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wx_admin
-- ----------------------------
DROP TABLE IF EXISTS `wx_admin`;
CREATE TABLE `wx_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(30) NOT NULL COMMENT '角色名',
  `tel` varchar(11) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `addtime` varchar(11) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of wx_admin
-- ----------------------------
INSERT INTO `wx_admin` VALUES ('10', 'boss', '13782920546', '6c88b3ae19794f51826c597f4174bd88', '1534318425');
INSERT INTO `wx_admin` VALUES ('11', 'admin', '13333333333', '14e1b600b1fd579f47433b88e8d85291', '1534390113');
INSERT INTO `wx_admin` VALUES ('12', 'admin1', '13333333333', '70873e8580c9900986939611618d7b1e', '1534391832');
INSERT INTO `wx_admin` VALUES ('13', 'admin3', '13333333333', '14e1b600b1fd579f47433b88e8d85291', '1534507064');
INSERT INTO `wx_admin` VALUES ('14', 'admindai', '13333333333', '63ee451939ed580ef3c4b6f0109d1fd0', '1534652030');

-- ----------------------------
-- Table structure for wx_adress
-- ----------------------------
DROP TABLE IF EXISTS `wx_adress`;
CREATE TABLE `wx_adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL COMMENT '用户id',
  `name` varchar(60) NOT NULL COMMENT '姓名',
  `country` varchar(60) NOT NULL COMMENT '县城',
  `province` varchar(60) NOT NULL COMMENT '省',
  `city` varchar(60) NOT NULL COMMENT '市',
  `address` varchar(300) NOT NULL COMMENT '详细地址',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `tel` char(12) NOT NULL COMMENT '固话',
  `zipcode` char(10) NOT NULL COMMENT '邮编',
  `sign_building` varchar(300) NOT NULL COMMENT '地址别名',
  `best_time` varchar(200) NOT NULL COMMENT '最佳送货时间',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_adress
-- ----------------------------

-- ----------------------------
-- Table structure for wx_adverbanner
-- ----------------------------
DROP TABLE IF EXISTS `wx_adverbanner`;
CREATE TABLE `wx_adverbanner` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) NOT NULL COMMENT '插播广告',
  `addtime` varchar(255) NOT NULL,
  `updtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_adverbanner
-- ----------------------------
INSERT INTO `wx_adverbanner` VALUES ('11', 'public/uploads/20180829/1d01b5e5531dc8b051d365d1cdc75f42.jpg', '1535530139', '1535530139');

-- ----------------------------
-- Table structure for wx_advertise
-- ----------------------------
DROP TABLE IF EXISTS `wx_advertise`;
CREATE TABLE `wx_advertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) NOT NULL COMMENT '广告名',
  `link` varchar(32) NOT NULL COMMENT '链接',
  `thumb` varchar(255) NOT NULL COMMENT '广告图',
  `addtime` varchar(30) NOT NULL COMMENT '修改时间',
  `updtime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_advertise
-- ----------------------------

-- ----------------------------
-- Table structure for wx_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_group`;
CREATE TABLE `wx_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_auth_group
-- ----------------------------
INSERT INTO `wx_auth_group` VALUES ('1', '管理员', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27');
INSERT INTO `wx_auth_group` VALUES ('2', '操作员', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19');
INSERT INTO `wx_auth_group` VALUES ('3', '财务管理员', '1', '25,26,27');

-- ----------------------------
-- Table structure for wx_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_group_access`;
CREATE TABLE `wx_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_auth_group_access
-- ----------------------------
INSERT INTO `wx_auth_group_access` VALUES ('6', '1');
INSERT INTO `wx_auth_group_access` VALUES ('7', '1');
INSERT INTO `wx_auth_group_access` VALUES ('8', '2');
INSERT INTO `wx_auth_group_access` VALUES ('9', '2');
INSERT INTO `wx_auth_group_access` VALUES ('10', '1');
INSERT INTO `wx_auth_group_access` VALUES ('11', '3');
INSERT INTO `wx_auth_group_access` VALUES ('12', '3');
INSERT INTO `wx_auth_group_access` VALUES ('13', '3');
INSERT INTO `wx_auth_group_access` VALUES ('14', '2');

-- ----------------------------
-- Table structure for wx_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `wx_auth_rule`;
CREATE TABLE `wx_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(9) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(5) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_auth_rule
-- ----------------------------
INSERT INTO `wx_auth_rule` VALUES ('1', 'user/lst', '用户管理', '1', '1', '', '0', '0', '50');
INSERT INTO `wx_auth_rule` VALUES ('2', 'user/check', '用户审核', '1', '1', '', '1', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('3', 'user/alllst', '用户列表', '1', '1', '', '1', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('4', 'user/level', '用户级别', '1', '1', '', '1', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('11', 'admin/admlst', '角色管理', '1', '1', '', '1', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('10', 'admin/opinion', '用户反馈', '1', '1', '', '1', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('9', 'goods/lst', '父产品管理', '1', '1', '', '0', '0', '50');
INSERT INTO `wx_auth_rule` VALUES ('12', 'goods/goodslst', '产品管理', '1', '1', '', '9', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('13', 'goods/prices', '产品价格查看', '1', '1', '', '9', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('14', 'goods/goodscate', '产品分类管理', '1', '1', '', '9', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('15', 'order/lst', '订单管理', '1', '1', '', '0', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('16', 'order/count', '订单汇总', '1', '1', '', '15', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('17', 'order/checklst', '订单审核', '1', '1', '', '15', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('18', 'order/postlst', '配送管理', '1', '1', '', '15', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('19', 'order/timelst', '配送时间管理', '1', '1', '', '15', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('20', 'index/lst', '主页管理', '1', '1', '', '0', '0', '50');
INSERT INTO `wx_auth_rule` VALUES ('21', 'index/gonggao', '公告管理', '1', '1', '', '20', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('22', 'index/banner', '轮播广告管理', '1', '1', '', '20', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('23', 'index/news', '热点广告', '1', '1', '', '20', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('24', 'index/brisban', '插播广告管理', '1', '1', '', '20', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('25', 'caiwu/lst', '财务管理', '1', '1', '', '0', '0', '50');
INSERT INTO `wx_auth_rule` VALUES ('26', 'caiwu/zhangdan', '账单数据', '1', '1', '', '25', '1', '50');
INSERT INTO `wx_auth_rule` VALUES ('27', 'caiwu/count', '账单图表', '1', '1', '', '25', '1', '50');

-- ----------------------------
-- Table structure for wx_cart
-- ----------------------------
DROP TABLE IF EXISTS `wx_cart`;
CREATE TABLE `wx_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `goods_name` varchar(40) NOT NULL COMMENT '商品名称',
  `price` varchar(30) NOT NULL COMMENT '购物车价格',
  `goods_num` varchar(30) NOT NULL COMMENT '购物车数量',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `pic` varchar(255) NOT NULL COMMENT '商品图',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_cart
-- ----------------------------
INSERT INTO `wx_cart` VALUES ('160', '23', '猪肉', '10', '1', '24', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');
INSERT INTO `wx_cart` VALUES ('163', '24', '萝卜', '4', '1', '27', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');

-- ----------------------------
-- Table structure for wx_cate
-- ----------------------------
DROP TABLE IF EXISTS `wx_cate`;
CREATE TABLE `wx_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '产品栏目id',
  `catename` varchar(30) NOT NULL COMMENT '栏目名字',
  `pid` mediumint(9) NOT NULL COMMENT '父类id',
  `pic` varchar(255) NOT NULL COMMENT '栏目缩略图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of wx_cate
-- ----------------------------
INSERT INTO `wx_cate` VALUES ('50', '测试', '0', 'public/uploads/20180829/85c3fae326a750a76f253aa3228b63f6.png');
INSERT INTO `wx_cate` VALUES ('37', '蔬菜瓜果', '0', 'public/uploads/20180829/48a7d9ac5ea4cf30327f340de90109eb.png');
INSERT INTO `wx_cate` VALUES ('38', '豆制精品', '0', 'public/uploads/20180829/26b03cded94bf91cbe0ac771cba5984b.png');
INSERT INTO `wx_cate` VALUES ('39', '米面速食', '0', 'public/uploads/20180829/44a7833272bd173e225010e4051f9b43.png');
INSERT INTO `wx_cate` VALUES ('40', '调味佐料', '0', 'public/uploads/20180829/a8ae5c1ebf9f260949916ac552ec7cbb.png');
INSERT INTO `wx_cate` VALUES ('51', '测试内的', '50', 'public/uploads/20180829/85c3fae326a750a76f253aa3228b63f6.png');
INSERT INTO `wx_cate` VALUES ('46', '胡萝卜根类', '37', 'public/uploads/20180829/a64431e8cfb88c88edf0a91e6e67538d.png');
INSERT INTO `wx_cate` VALUES ('47', '山药薯芋类', '37', 'public/uploads/20180829/08cee28247f8b716d9afd60ed5b0031f.png');
INSERT INTO `wx_cate` VALUES ('48', '葱蒜类', '37', 'public/uploads/20180829/ec5b6d323034cb0266750f1b09b9c156.png');
INSERT INTO `wx_cate` VALUES ('49', '白菜类', '37', 'public/uploads/20180829/85c3fae326a750a76f253aa3228b63f6.png');

-- ----------------------------
-- Table structure for wx_deliverytime
-- ----------------------------
DROP TABLE IF EXISTS `wx_deliverytime`;
CREATE TABLE `wx_deliverytime` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '配送时间id',
  `time` varchar(255) NOT NULL COMMENT '配送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_deliverytime
-- ----------------------------
INSERT INTO `wx_deliverytime` VALUES ('1', '早餐');
INSERT INTO `wx_deliverytime` VALUES ('2', '午餐');
INSERT INTO `wx_deliverytime` VALUES ('3', '晚餐');
INSERT INTO `wx_deliverytime` VALUES ('8', '夜宵');

-- ----------------------------
-- Table structure for wx_goods
-- ----------------------------
DROP TABLE IF EXISTS `wx_goods`;
CREATE TABLE `wx_goods` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(30) NOT NULL COMMENT '产品名称',
  `shop_num` varchar(30) NOT NULL COMMENT '产品剩余数量数量',
  `detail` text NOT NULL COMMENT '产品详细',
  `mfrs` varchar(255) NOT NULL COMMENT '产地',
  `shelf` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架；为1时上架；0时不上架',
  `hot_selling` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否热销；为1时不热销，为2时热销',
  `sales_volume` varchar(30) DEFAULT NULL COMMENT '销售数量',
  `cate_id` mediumint(9) NOT NULL COMMENT '产品栏目id',
  `addtime` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL COMMENT '商品主图',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_goods
-- ----------------------------
INSERT INTO `wx_goods` VALUES ('29', '测试', '29', '测试', '测试', '1', '1', null, '51', '1535527558', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '克');
INSERT INTO `wx_goods` VALUES ('27', '萝卜', '83', '测试', '鹿寨', '1', '1', null, '46', '1535527502', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_goods` VALUES ('28', '山药', '85', '测试', '鹿寨', '1', '1', null, '47', '1535527558', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');

-- ----------------------------
-- Table structure for wx_level
-- ----------------------------
DROP TABLE IF EXISTS `wx_level`;
CREATE TABLE `wx_level` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `levname` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '用户级别名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of wx_level
-- ----------------------------
INSERT INTO `wx_level` VALUES ('9', '教师餐线');
INSERT INTO `wx_level` VALUES ('8', '乡镇线');
INSERT INTO `wx_level` VALUES ('7', '城镇线');

-- ----------------------------
-- Table structure for wx_news
-- ----------------------------
DROP TABLE IF EXISTS `wx_news`;
CREATE TABLE `wx_news` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '热点id',
  `title` varchar(60) NOT NULL COMMENT '热点名',
  `content` text NOT NULL COMMENT '热点详细',
  `addtime` varchar(30) NOT NULL COMMENT '修改日期',
  `updtime` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `alick` int(255) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_news
-- ----------------------------

-- ----------------------------
-- Table structure for wx_opinion
-- ----------------------------
DROP TABLE IF EXISTS `wx_opinion`;
CREATE TABLE `wx_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '意见id',
  `user_id` mediumint(30) NOT NULL COMMENT '用户id',
  `content` text NOT NULL COMMENT '反馈详细',
  `addtime` varchar(32) NOT NULL COMMENT '用户反馈日期',
  `optel` varchar(255) NOT NULL COMMENT '反馈电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for wx_order
-- ----------------------------
DROP TABLE IF EXISTS `wx_order`;
CREATE TABLE `wx_order` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `out_trade_no` char(16) NOT NULL COMMENT '订单号',
  `user_id` mediumint(9) NOT NULL COMMENT '下单用户id',
  `order_total_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态: 0:待审核 1:已确认 2:申请退款 3:退款成功',
  `post_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态 0:未发货 1:已发货 2:已收货',
  `order_name` varchar(30) DEFAULT NULL COMMENT '收货人',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `order_time` int(10) NOT NULL COMMENT '下单时间',
  `deliverytime_id` varchar(255) NOT NULL COMMENT '配送方式id',
  `post_time` varchar(255) DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_order
-- ----------------------------
INSERT INTO `wx_order` VALUES ('103', '1535528089143961', '22', '142.00', '1', '1', null, null, '1535528089', '1', '1535528850');
INSERT INTO `wx_order` VALUES ('104', '1535528203429470', '22', '132.00', '1', '1', null, null, '1535528203', '2', '1535528853');
INSERT INTO `wx_order` VALUES ('105', '1535528508147162', '21', '34.00', '1', '1', null, null, '1535528508', '1', '1535528855');
INSERT INTO `wx_order` VALUES ('106', '1535528568695041', '21', '92.00', '1', '1', null, null, '1535528568', '3', '1535528858');
INSERT INTO `wx_order` VALUES ('107', '1535534185542805', '23', '9.00', '0', '0', null, null, '1535534185', '2', null);
INSERT INTO `wx_order` VALUES ('108', '1535534783917399', '23', '9.00', '0', '0', null, null, '1535534783', '1', null);
INSERT INTO `wx_order` VALUES ('109', '1535534790734157', '23', '6.00', '0', '0', null, null, '1535534790', '3', null);
INSERT INTO `wx_order` VALUES ('110', '1535535709678412', '23', '2.00', '0', '0', null, null, '1535535709', '8', null);
INSERT INTO `wx_order` VALUES ('111', '1535535853823513', '23', '6.00', '1', '0', null, null, '1535535853', '3', null);
INSERT INTO `wx_order` VALUES ('114', '1535685261123860', '2', '0.00', '0', '0', null, null, '1535685261', '1', null);
INSERT INTO `wx_order` VALUES ('113', '1535612049939181', '23', '10.00', '1', '1', null, null, '1535612049', '1', '1535612106');
INSERT INTO `wx_order` VALUES ('115', '1535687694114230', '24', '2.00', '0', '0', null, null, '1535687694', '2', null);

-- ----------------------------
-- Table structure for wx_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `wx_order_goods`;
CREATE TABLE `wx_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(9) NOT NULL COMMENT '商品id',
  `goods_name` varchar(150) NOT NULL COMMENT '商品名',
  `aprice` varchar(255) NOT NULL COMMENT '本店价',
  `goods_num` mediumint(9) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `order_id` mediumint(9) NOT NULL COMMENT '所属订单',
  `pic` varchar(255) DEFAULT NULL COMMENT '订单图',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_order_goods
-- ----------------------------
INSERT INTO `wx_order_goods` VALUES ('153', '24', '猪肉', '10', '7', '103', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('152', '25', '鱼肉', '6', '3', '103', 'public/uploads/20180829/152322ffc02264abcbe26e63ab30250c.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('151', '26', '鸡肉', '9', '5', '103', 'public/uploads/20180829/0ecd8baeb7f1287ec8df55d3def7cfa8.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('150', '27', '萝卜', '3', '3', '103', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('154', '27', '萝卜', '3', '4', '104', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('155', '28', '山药', '2', '7', '104', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('156', '25', '鱼肉', '6', '6', '104', 'public/uploads/20180829/152322ffc02264abcbe26e63ab30250c.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('157', '24', '猪肉', '10', '7', '104', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('158', '27', '萝卜', '4', '1', '105', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('159', '26', '鸡肉', '10', '1', '105', 'public/uploads/20180829/0ecd8baeb7f1287ec8df55d3def7cfa8.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('160', '25', '鱼肉', '8', '1', '105', 'public/uploads/20180829/152322ffc02264abcbe26e63ab30250c.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('161', '24', '猪肉', '12', '1', '105', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('162', '27', '萝卜', '4', '4', '106', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('163', '28', '山药', '3', '4', '106', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('164', '25', '鱼肉', '8', '2', '106', 'public/uploads/20180829/152322ffc02264abcbe26e63ab30250c.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('165', '24', '猪肉', '12', '4', '106', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('166', '26', '鸡肉', '9', '1', '107', 'public/uploads/20180829/0ecd8baeb7f1287ec8df55d3def7cfa8.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('167', '27', '萝卜', '3', '3', '108', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('168', '28', '山药', '2', '3', '109', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('169', '28', '山药', '2', '1', '110', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('170', '27', '萝卜', '3', '2', '111', 'public/uploads/20180829/5183d73704f536581b2e3bb6fa1df675.jpg', '斤');
INSERT INTO `wx_order_goods` VALUES ('175', '29', '测试', '2', '1', '115', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '克');
INSERT INTO `wx_order_goods` VALUES ('174', '24', '猪肉', '10', '1', '113', 'public/uploads/20180829/726c97c83bb027d2402f758916232b41.jpg', '斤');

-- ----------------------------
-- Table structure for wx_prices
-- ----------------------------
DROP TABLE IF EXISTS `wx_prices`;
CREATE TABLE `wx_prices` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `mprice` varchar(30) DEFAULT NULL COMMENT '产品价格',
  `mlevel_id` mediumint(9) NOT NULL COMMENT '等级id',
  `goods_id` mediumint(20) NOT NULL COMMENT '商品对应id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_prices
-- ----------------------------
INSERT INTO `wx_prices` VALUES ('150', '10', '7', '24');
INSERT INTO `wx_prices` VALUES ('151', '12', '8', '24');
INSERT INTO `wx_prices` VALUES ('152', '10', '9', '24');
INSERT INTO `wx_prices` VALUES ('153', '6', '7', '25');
INSERT INTO `wx_prices` VALUES ('154', '8', '8', '25');
INSERT INTO `wx_prices` VALUES ('155', '6', '9', '25');
INSERT INTO `wx_prices` VALUES ('156', '9', '7', '26');
INSERT INTO `wx_prices` VALUES ('157', '10', '8', '26');
INSERT INTO `wx_prices` VALUES ('158', '9', '9', '26');
INSERT INTO `wx_prices` VALUES ('159', '3', '7', '27');
INSERT INTO `wx_prices` VALUES ('160', '4', '8', '27');
INSERT INTO `wx_prices` VALUES ('161', '3', '9', '27');
INSERT INTO `wx_prices` VALUES ('162', '2', '7', '28');
INSERT INTO `wx_prices` VALUES ('163', '3', '8', '28');
INSERT INTO `wx_prices` VALUES ('164', '2', '9', '28');
INSERT INTO `wx_prices` VALUES ('165', '2', '7', '29');
INSERT INTO `wx_prices` VALUES ('166', '2', '8', '29');
INSERT INTO `wx_prices` VALUES ('167', '2', '9', '29');

-- ----------------------------
-- Table structure for wx_proclamation
-- ----------------------------
DROP TABLE IF EXISTS `wx_proclamation`;
CREATE TABLE `wx_proclamation` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(60) NOT NULL COMMENT '公告名',
  `content` text NOT NULL COMMENT '公告详情',
  `addtime` varchar(30) NOT NULL COMMENT '修改日期',
  `updtime` varchar(60) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of wx_proclamation
-- ----------------------------

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `tel` varchar(11) NOT NULL COMMENT '用户电话号码',
  `password` char(32) NOT NULL COMMENT '用户密码',
  `checktime` varchar(30) DEFAULT NULL COMMENT '提交时间(审核时间)',
  `checktype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态;0未审核，1已通过，2未通过',
  `addtime` varchar(30) NOT NULL COMMENT '添加时间',
  `city` text COMMENT '用户地址',
  `levelid` mediumint(30) DEFAULT '1' COMMENT '用户等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户管理登录表';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('21', '四排中学', '18978077101', '14e1b600b1fd579f47433b88e8d85291', '1535526407', '2', '1535526307', '广西-柳州市-鹿寨县-四排乡', '8');
INSERT INTO `wx_user` VALUES ('22', '鹿寨中学', '18648858683', '14e1b600b1fd579f47433b88e8d85291', '1535526428', '1', '1535526358', '广西-柳州市-鹿寨县-鹿寨镇', '7');
INSERT INTO `wx_user` VALUES ('23', 'FFFF', '13067710635', '14e1b600b1fd579f47433b88e8d85291', '1535533860', '1', '1535533831', '北京-朝阳区-三环以内', '9');
INSERT INTO `wx_user` VALUES ('24', '美女', '17681806508', '14e1b600b1fd579f47433b88e8d85291', '1535533860', '1', '1535687192', '广西-柳州市-鹿寨县-鹿寨镇', '8');
