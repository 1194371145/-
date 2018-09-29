/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-28 15:59:58
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
