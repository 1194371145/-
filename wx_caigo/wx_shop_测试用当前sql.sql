/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wx_shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-31 16:36:26
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of wx_admin
-- ----------------------------
INSERT INTO `wx_admin` VALUES ('6', '周杰伦', '2147483647', '6', '1533786254');
INSERT INTO `wx_admin` VALUES ('7', '麦可尔', '2147483647', '02aead080a45c9c1b6db45b8d415b5', '1533798715');
INSERT INTO `wx_admin` VALUES ('8', '周杰伦1', '13782920546', '6c88b3ae19794f51826c597f4174bd', '1534210618');
INSERT INTO `wx_admin` VALUES ('9', 'spage', '13382920546', 'b59d7adcd6452fe7fc8d8a0e50d24a', '1534234275');
INSERT INTO `wx_admin` VALUES ('10', '13382920542', '13382920542', '8d0b25bcdb7f1e7ab9a4f92fa6800b90', '1534234974');
INSERT INTO `wx_admin` VALUES ('11', '16638489445', '16638489445', '21c7d8fb5549a58dc2993c092402f03c', '1534730665');

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
INSERT INTO `wx_adress` VALUES ('1', '1', 'tongpan', '太平区', '辽宁省', '阜新市', '短发撒的发发', '15878452564', '2416516', '5465', '撒的发', '明天', '546546@163.com');

-- ----------------------------
-- Table structure for wx_adverbanner
-- ----------------------------
DROP TABLE IF EXISTS `wx_adverbanner`;
CREATE TABLE `wx_adverbanner` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) NOT NULL COMMENT '插播广告',
  `addtime` varchar(255) NOT NULL,
  `updtime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_adverbanner
-- ----------------------------
INSERT INTO `wx_adverbanner` VALUES ('1', '/wx_shop/public\\uploads/20180723\\4dd1947b6fa2db4abd234c68d3dbf3c1.png', '', '');
INSERT INTO `wx_adverbanner` VALUES ('2', 'public/uploads/20180813/b1f5346386c26442c9dc2b61ba7d4149.png', '', '1534132659');
INSERT INTO `wx_adverbanner` VALUES ('5', '/public/uploads/20180813/3df61edf1c863139a83005a5ed6d1f6d.jpg', '1534132397', '');

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
  `updtime` varchar(255) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_advertise
-- ----------------------------
INSERT INTO `wx_advertise` VALUES ('2', '32', '23', '32', '32', '32');
INSERT INTO `wx_advertise` VALUES ('3', 'eeee', 'test', '\\public\\uploads\\20180813\\198a1342953863c0cfdc6de1061c34af.jpg', '1532337217', '');
INSERT INTO `wx_advertise` VALUES ('6', '热巴小姐姐', 'www.baidu.com', '\\public\\uploads\\20180813\\198a1342953863c0cfdc6de1061c34af.jpg', '1533890401', '1533890799');
INSERT INTO `wx_advertise` VALUES ('8', '热巴小姐姐超级可爱', 'www.baidu.com', '\\public\\uploads\\20180813\\198a1342953863c0cfdc6de1061c34af.jpg', '1533895715', '');
INSERT INTO `wx_advertise` VALUES ('9', '热巴地理', 'www.baidu.com', '\\public\\uploads\\20180813\\198a1342953863c0cfdc6de1061c34af.jpg', '1534127868', '');
INSERT INTO `wx_advertise` VALUES ('10', '热巴萝莉', 'www.baidu.com', '\\public\\uploads\\20180813\\198a1342953863c0cfdc6de1061c34af.jpg', '1534127980', '');
INSERT INTO `wx_advertise` VALUES ('11', '热巴萝莉1', 'www.baidu.com', '/public/uploads/20180813/c7bd05220a9ab8d61cc2ce00cd8f4760.jpg', '1534130514', '');
INSERT INTO `wx_advertise` VALUES ('12', '热巴萝莉1112', 'htp://www.baidu.com', '/public/uploads/20180813/022455411c38ca163966ebc8bf47ac3c.jpg', '1534130570', '1534131572');
INSERT INTO `wx_advertise` VALUES ('13', '1-87', 'http://www.baidu.com', '/public/uploads/20180817/070a9be59916875b80685dfb186abc61.png', '1534491976', '1534491976');
INSERT INTO `wx_advertise` VALUES ('14', '1sd', 'http://www.baidu.com', 'public/uploads/20180817/47a8908bc951a0a93875cffae188950a.png', '1534492119', '1534492119');

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
INSERT INTO `wx_auth_group` VALUES ('1', '管理员', '1', '1,2,3,4,5');
INSERT INTO `wx_auth_group` VALUES ('3', '操作员', '1', '1,2,3');
INSERT INTO `wx_auth_group` VALUES ('4', '财务管理员', '1', '5');

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
INSERT INTO `wx_auth_group_access` VALUES ('9', '1');
INSERT INTO `wx_auth_group_access` VALUES ('10', '1');
INSERT INTO `wx_auth_group_access` VALUES ('11', '1');

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
  `unit` varchar(255) NOT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_cart
-- ----------------------------

-- ----------------------------
-- Table structure for wx_cate
-- ----------------------------
DROP TABLE IF EXISTS `wx_cate`;
CREATE TABLE `wx_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '产品栏目id',
  `catename` varchar(30) NOT NULL COMMENT '栏目名字',
  `pid` mediumint(9) NOT NULL COMMENT '父类id',
  `detail` varchar(30) NOT NULL COMMENT '详细',
  `pic` varchar(255) NOT NULL COMMENT '栏目缩略图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

-- ----------------------------
-- Records of wx_cate
-- ----------------------------
INSERT INTO `wx_cate` VALUES ('1', '手机数码', '0', '', '');
INSERT INTO `wx_cate` VALUES ('2', '手机配件', '1', '', '');
INSERT INTO `wx_cate` VALUES ('3', '家电', '0', '', '');
INSERT INTO `wx_cate` VALUES ('4', '冰箱', '3', '', '');
INSERT INTO `wx_cate` VALUES ('21', '空调', '3', '', '/wx_shop/public\\uploads/20180810\\871ed05da6e176492e9a6db989bc8159.jpg');
INSERT INTO `wx_cate` VALUES ('6', '女童鞋', '1', '', '');
INSERT INTO `wx_cate` VALUES ('7', '最佳', '0', '', '');
INSERT INTO `wx_cate` VALUES ('8', '棒棒的', '0', '', '');
INSERT INTO `wx_cate` VALUES ('9', '真的是棒棒哒', '1', '', '');
INSERT INTO `wx_cate` VALUES ('10', '家电子栏目内容', '3', '', '');
INSERT INTO `wx_cate` VALUES ('11', '我是新家电栏目', '3', '', '');

-- ----------------------------
-- Table structure for wx_deliverytime
-- ----------------------------
DROP TABLE IF EXISTS `wx_deliverytime`;
CREATE TABLE `wx_deliverytime` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '配送时间id',
  `time` varchar(255) NOT NULL COMMENT '配送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_deliverytime
-- ----------------------------
INSERT INTO `wx_deliverytime` VALUES ('1', '早餐');
INSERT INTO `wx_deliverytime` VALUES ('2', '午餐');
INSERT INTO `wx_deliverytime` VALUES ('3', '晚餐');

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
  `sales_volume` varchar(30) NOT NULL COMMENT '销售数量',
  `cate_id` mediumint(9) NOT NULL COMMENT '产品栏目id',
  `addtime` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL COMMENT '商品主图',
  `unit` varchar(255) NOT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_goods
-- ----------------------------
INSERT INTO `wx_goods` VALUES ('10', '美人鱼', '323214', '', '北京市', '6', '1', '9', '2', '1532485602', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '斤');
INSERT INTO `wx_goods` VALUES ('9', '尖山辣椒', '1994', 'test2', 'test2', '1', '1', '18', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '克');
INSERT INTO `wx_goods` VALUES ('11', '超人', '29995', 'test', 't', '1', '1', '5', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '克');
INSERT INTO `wx_goods` VALUES ('1', '萝卜', '2337', 'test', 'mfrs', '1', '1', '2', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '千克');
INSERT INTO `wx_goods` VALUES ('2', '白萝卜', '9', 'test', 'mfrs', '1', '1', '23', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '瓦');
INSERT INTO `wx_goods` VALUES ('3', '美萝卜', '23', 'test', 'mfrs', '1', '1', '9', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '克');
INSERT INTO `wx_goods` VALUES ('4', '葱', '300', '太辣了', '北京市杭州县', '1', '1', '2', '2', '1532399635', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '瓦');
INSERT INTO `wx_goods` VALUES ('5', '千张', '300', '问问', '1', '1', '1', '2', '2', '', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '1');
INSERT INTO `wx_goods` VALUES ('6', '馓子', '2000', '辣气', '北京省', '1', '1', '', '2', '', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '毫米');
INSERT INTO `wx_goods` VALUES ('7', '白子画', '3000', '大武汉', '2好', '1', '1', '', '2', '', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '');
INSERT INTO `wx_goods` VALUES ('8', '凯撒', '3828', 'vn', 'aj', '1', '1', '', '2', '', 'public/uploads/20180829/8d52cf00bda97743584b09e631b8d4de.jpg', '');

-- ----------------------------
-- Table structure for wx_level
-- ----------------------------
DROP TABLE IF EXISTS `wx_level`;
CREATE TABLE `wx_level` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `levname` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '用户级别名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of wx_level
-- ----------------------------
INSERT INTO `wx_level` VALUES ('1', '普通');
INSERT INTO `wx_level` VALUES ('2', '高级');
INSERT INTO `wx_level` VALUES ('3', '特级');
INSERT INTO `wx_level` VALUES ('4', '终极');

-- ----------------------------
-- Table structure for wx_news
-- ----------------------------
DROP TABLE IF EXISTS `wx_news`;
CREATE TABLE `wx_news` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '热点id',
  `title` varchar(60) NOT NULL COMMENT '热点名',
  `content` text NOT NULL COMMENT '热点详细',
  `addtime` varchar(30) NOT NULL COMMENT '修改日期',
  `updtime` varchar(255) NOT NULL COMMENT '更新时间',
  `alick` varchar(255) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_news
-- ----------------------------
INSERT INTO `wx_news` VALUES ('1', '苹果', '苹果诞生于2018年', '1531386241', '', '0', 'public/uploads/20180820/2287d6bad05c07ae293c880b5f8a94da.png');
INSERT INTO `wx_news` VALUES ('2', '联想', '联想成立于2019年。现在吧还是算了', '1531386901', '', '0', 'public/uploads/20180820/2287d6bad05c07ae293c880b5f8a94da.png');
INSERT INTO `wx_news` VALUES ('3', '最早的1', '最早的', '1468314901', '', '0', 'public/uploads/20180820/2287d6bad05c07ae293c880b5f8a94da.png');
INSERT INTO `wx_news` VALUES ('5', '詹姆斯', '詹姆斯没有大腿，詹姆斯最帅最潮最浪最酷最好最la', '1534131763', '1534131882', '2', 'public/uploads/20180820/2287d6bad05c07ae293c880b5f8a94da.png');
INSERT INTO `wx_news` VALUES ('6', '323232', '2332323323232232332', '1534752912', '1534752912', '', 'public/uploads/20180820/2287d6bad05c07ae293c880b5f8a94da.png');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_opinion
-- ----------------------------
INSERT INTO `wx_opinion` VALUES ('1', '2', '1212132132323', '1532313644', '');
INSERT INTO `wx_opinion` VALUES ('2', '1', '2121', '1532313644', '');
INSERT INTO `wx_opinion` VALUES ('4', '0', '13382920546', '', '323232233232');
INSERT INTO `wx_opinion` VALUES ('5', '0', '13382920546', '', '323232233232');
INSERT INTO `wx_opinion` VALUES ('6', '0', '', '1532482653', '');
INSERT INTO `wx_opinion` VALUES ('7', '8', 'eeeeee', '1532483117', '340233232');
INSERT INTO `wx_opinion` VALUES ('8', '8', 'eeeeee222', '1532485049', '340233232');
INSERT INTO `wx_opinion` VALUES ('9', '11', '反对一切反抗革命的实力', '1532950846', '13782920544');
INSERT INTO `wx_opinion` VALUES ('10', '11', '反对一切反抗革命的实力', '1532950985', '13782920544');

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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_order
-- ----------------------------
INSERT INTO `wx_order` VALUES ('95', '1535685285475206', '2', '1.00', '0', '0', null, null, '1535685285', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_order_goods
-- ----------------------------
INSERT INTO `wx_order_goods` VALUES ('106', '2', '白萝卜', '1', '1', '95', '', '瓦');

-- ----------------------------
-- Table structure for wx_prices
-- ----------------------------
DROP TABLE IF EXISTS `wx_prices`;
CREATE TABLE `wx_prices` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `mprice` varchar(30) NOT NULL COMMENT '产品价格',
  `mlevel_id` mediumint(9) NOT NULL COMMENT '等级id',
  `goods_id` mediumint(20) NOT NULL COMMENT '商品对应id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_prices
-- ----------------------------
INSERT INTO `wx_prices` VALUES ('100', '4', '4', '5');
INSERT INTO `wx_prices` VALUES ('93', '1', '1', '4');
INSERT INTO `wx_prices` VALUES ('99', '3', '3', '5');
INSERT INTO `wx_prices` VALUES ('98', '2', '2', '5');
INSERT INTO `wx_prices` VALUES ('94', '2', '2', '4');
INSERT INTO `wx_prices` VALUES ('95', '3', '3', '4');
INSERT INTO `wx_prices` VALUES ('96', '4', '4', '4');
INSERT INTO `wx_prices` VALUES ('97', '1', '1', '5');
INSERT INTO `wx_prices` VALUES ('101', '1', '1', '6');
INSERT INTO `wx_prices` VALUES ('102', '2', '2', '6');
INSERT INTO `wx_prices` VALUES ('103', '3', '3', '6');
INSERT INTO `wx_prices` VALUES ('104', '4', '4', '6');
INSERT INTO `wx_prices` VALUES ('106', '1', '1', '1');
INSERT INTO `wx_prices` VALUES ('107', '2', '2', '1');
INSERT INTO `wx_prices` VALUES ('108', '3', '3', '1');
INSERT INTO `wx_prices` VALUES ('109', '4', '4', '1');
INSERT INTO `wx_prices` VALUES ('110', '1', '1', '2');
INSERT INTO `wx_prices` VALUES ('111', '2', '2', '2');
INSERT INTO `wx_prices` VALUES ('112', '3', '3', '2');
INSERT INTO `wx_prices` VALUES ('113', '4', '4', '2');
INSERT INTO `wx_prices` VALUES ('114', '1', '1', '3');
INSERT INTO `wx_prices` VALUES ('115', '2', '2', '3');
INSERT INTO `wx_prices` VALUES ('116', '3', '3', '3');
INSERT INTO `wx_prices` VALUES ('117', '4', '4', '3');
INSERT INTO `wx_prices` VALUES ('118', '1', '1', '7');
INSERT INTO `wx_prices` VALUES ('119', '2', '2', '7');
INSERT INTO `wx_prices` VALUES ('120', '3', '3', '7');
INSERT INTO `wx_prices` VALUES ('121', '4', '4', '7');
INSERT INTO `wx_prices` VALUES ('122', '1', '1', '8');
INSERT INTO `wx_prices` VALUES ('123', '2', '2', '8');
INSERT INTO `wx_prices` VALUES ('124', '3', '3', '8');
INSERT INTO `wx_prices` VALUES ('125', '4', '4', '8');
INSERT INTO `wx_prices` VALUES ('126', '1', '1', '9');
INSERT INTO `wx_prices` VALUES ('127', '2', '2', '9');
INSERT INTO `wx_prices` VALUES ('128', '3', '3', '9');
INSERT INTO `wx_prices` VALUES ('129', '4', '4', '9');
INSERT INTO `wx_prices` VALUES ('130', '1', '1', '10');
INSERT INTO `wx_prices` VALUES ('131', '2', '2', '10');
INSERT INTO `wx_prices` VALUES ('132', '3', '3', '10');
INSERT INTO `wx_prices` VALUES ('133', '4', '4', '10');
INSERT INTO `wx_prices` VALUES ('134', '1', '1', '11');
INSERT INTO `wx_prices` VALUES ('135', '2', '2', '11');
INSERT INTO `wx_prices` VALUES ('136', '3', '3', '11');
INSERT INTO `wx_prices` VALUES ('137', '4', '4', '11');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of wx_proclamation
-- ----------------------------
INSERT INTO `wx_proclamation` VALUES ('1', '1', '1', '11111111', '');
INSERT INTO `wx_proclamation` VALUES ('2', '2', '2', '222222', '');

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(30) NOT NULL COMMENT '用户名',
  `tel` varchar(11) NOT NULL COMMENT '用户电话号码',
  `password` char(32) NOT NULL COMMENT '用户密码',
  `checktime` varchar(30) NOT NULL COMMENT '提交时间(审核时间)',
  `checktype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态;0未审核，1已通过，2未通过',
  `addtime` varchar(30) NOT NULL COMMENT '添加时间',
  `city` text NOT NULL COMMENT '用户地址',
  `levelid` mediumint(30) NOT NULL DEFAULT '1' COMMENT '用户等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户管理登录表';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('1', '白富美', '16638489443', '953496ba8bbe9c68da3b6bffff7b35d3', '1533717329', '1', '', '北京省南阳市京东县', '2');
INSERT INTO `wx_user` VALUES ('2', '八八大发', '13782920546', '6c88b3ae19794f51826c597f4174bd88', '', '1', '', '', '1');
INSERT INTO `wx_user` VALUES ('3', '内女', '13782920547', '744b525cd37abab0d92916603bde0eda', '', '1', '1532418784', '', '1');
INSERT INTO `wx_user` VALUES ('4', 'ss', '13382920546', 'b59d7adcd6452fe7fc8d8a0e50d24ae1', '', '1', '1532419561', '', '1');
INSERT INTO `wx_user` VALUES ('5', '林华华', '13782920544', '4296baf999aab8e41967453b7fa20d86', '1533716959', '1', '1532947413', '北京省南阳市京东县', '2');
INSERT INTO `wx_user` VALUES ('6', '', '13782920555', 'c1f2dfa33cf986c970e1890880e96ac3', '', '0', '1534318902', '', '1');
INSERT INTO `wx_user` VALUES ('7', '梨花', '13782920541', '6c88b3ae19794f51826c597f4174bd88', '1534334748', '1', '1534334748', '北京省河南省新野省', '1');
