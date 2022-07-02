/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : example

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 02/07/2022 10:55:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `lastmodified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `body` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_571gx7oqo5xpmgocegaidlcu9`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org`  (
  `FD_ORG_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门id',
  `FD_ORG_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门名称',
  `FD_ORG_DESC` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门描述及',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FD_PARENT_FD_ORG_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父部门名称',
  PRIMARY KEY (`FD_ORG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `org` VALUES ('12b22dd9e956408fa5cd8e9eace36589', '一级部门2', '一级部门2', '2', 'root');
INSERT INTO `org` VALUES ('1347e65e6b2f401f85c1cf08494d93e6', '二级部门1', '二级部门1', '3', '一级部门1');
INSERT INTO `org` VALUES ('2', '2', '2', '4', '2');
INSERT INTO `org` VALUES ('4', '4', '4', '5', '4');
INSERT INTO `org` VALUES ('6', '6', '6', '6', '6');
INSERT INTO `org` VALUES ('93d132a680774647b13932f3dd36857b', '二级部门2', '二级部门2', '7', '一级部门1');
INSERT INTO `org` VALUES ('adfed97f20fd47d59e1373c7618abb6c', '一级部门1', '一级部门1', '8', 'root');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `FD_PRODUCT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品类型id',
  `FD_PRODUCT_CNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品中文名',
  `FD_PRODUCT_ENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品英文',
  `FD_PRODUCT_ATTR1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品属性1',
  `FD_PRODUCT_ATTR2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品属性2',
  `FD_PRODUCT_ATTR3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品属性3',
  PRIMARY KEY (`FD_PRODUCT_ID`) USING BTREE,
  UNIQUE INDEX `PRODUCT_FD_PRODUCT_CNAME`(`FD_PRODUCT_CNAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('37fae0ce09264b9fac9a183e892d1685', '外贸直租', 'PROD_TYPE_2', '属性1', '属性2', '属性3');
INSERT INTO `product` VALUES ('5db92c6c88514d068d91714e42fcda13', '证券类基金', 'PROD_TYPE_5', '属性1', '属性2', '属性3');
INSERT INTO `product` VALUES ('5e8eaf81c4194098bb23e1b421ec6d32', '内贸直租 ', 'PROD_TYPE_1', '[\"属性1\",\"属性2\"]', '属性2', '属性3');
INSERT INTO `product` VALUES ('9bce4a05e9ca4f448358c9e2d21c4878', '委贷', 'PROD_TYPE_4', '属性1', '属性2', '属性3');
INSERT INTO `product` VALUES ('d897f7fa7da845529cefb639aebebe83', '回租', 'PROD_TYPE_3', '属性1', '属性2', '属性3');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `FD_PROJECT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '项目id',
  `FD_PROJECT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '项目名称',
  `FD_PRODUCT_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品类型id',
  `FD_PROJECT_MANAGER` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '项目经理',
  `FD_PROJECT_AMOUNT` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '金额',
  `FD_PROJECT_RATE` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '收益率',
  `FD_PROJECT_STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ' ' COMMENT '项目状态',
  PRIMARY KEY (`FD_PROJECT_ID`) USING BTREE,
  UNIQUE INDEX `IDX_PROJECT_FD_PROJECT_NAME`(`FD_PROJECT_NAME`) USING BTREE,
  INDEX `IDX_PROJECT_FD_PRODUCT_ID`(`FD_PRODUCT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '项目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('00ac0a775ed24ceb8f5afe78e0b528c0', '测试项目67212126767', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('27d75c81b05a446bbc2d1d48bbf48eb1', '测试项目3', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 12, ' ');
INSERT INTO `project` VALUES ('5520e6ffe569496a83b60286fbe6fe17', '测试项目676767', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('5980187da33d44c39147687c7ac0fb47', '测试项目90', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('5b592536c2604f4cb93a9dec7c166324', '测试项目6721454521264545767', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('6550c3a4723b4c069af9682abe16865f', '测试项目672145452126767', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('95fbee1a304a437eb00877613ff15f63', '测试项目454', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('9919d4dea3a74ee7af689887b06b3fb3', '测试项目2', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 12, '1');
INSERT INTO `project` VALUES ('a4f3e9bbd4fa415f8f74474222d04b57', '测试项目', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');
INSERT INTO `project` VALUES ('ff99d4eaca8e402bb038f107b84effe9', '测试项目4', '5e8eaf81c4194098bb23e1b421ec6d32', '03969336787f423aa4dea82f35a1e708', 100, 1, ' ');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` bigint(20) NOT NULL COMMENT '商品价格',
  `num` int(10) NULL DEFAULT 0 COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (101, 1, 'Apple 苹果 iPhone 12 ', 699900, 1);
INSERT INTO `tb_order` VALUES (102, 2, '雅迪 yadea 新国标电动车', 209900, 1);
INSERT INTO `tb_order` VALUES (103, 3, '骆驼（CAMEL）休闲运动鞋女', 43900, 1);
INSERT INTO `tb_order` VALUES (104, 4, '小米10 双模5G 骁龙865', 359900, 1);
INSERT INTO `tb_order` VALUES (105, 5, 'OPPO Reno3 Pro 双模5G 视频双防抖', 299900, 1);
INSERT INTO `tb_order` VALUES (106, 6, '美的（Midea) 新能效 冷静星II ', 544900, 1);
INSERT INTO `tb_order` VALUES (107, 2, '西昊/SIHOO 人体工学电脑椅子', 79900, 1);
INSERT INTO `tb_order` VALUES (108, 3, '梵班（FAMDBANN）休闲男鞋', 31900, 1);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '柳岩', '湖南省衡阳市');
INSERT INTO `tb_user` VALUES (2, '文二狗', '陕西省西安市');
INSERT INTO `tb_user` VALUES (3, '华沉鱼', '湖北省十堰市');
INSERT INTO `tb_user` VALUES (4, '张必沉', '天津市');
INSERT INTO `tb_user` VALUES (5, '郑爽爽', '辽宁省沈阳市大东区');
INSERT INTO `tb_user` VALUES (6, '范兵兵', '山东省青岛市');

-- ----------------------------
-- Table structure for xs_user
-- ----------------------------
DROP TABLE IF EXISTS `xs_user`;
CREATE TABLE `xs_user`  (
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `LOGIN_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STATUS` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GENDER` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1',
  `MOBILE` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_TYPE` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACCOUNT_EXPIRE_DATE` varchar(14) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PWD_EXPIRE_DATE` varchar(14) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LOCKED` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PWD_REVISE_DATE` varchar(14) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码修改时间',
  `PWD_REVISOR` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码修改人',
  `ARCHIVE_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归档标记',
  `USER_GROUP_ENAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户组',
  `ORG_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT ' ',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  UNIQUE INDEX `XS_USER_LOGIN_NAME_UINDEX`(`LOGIN_NAME`) USING BTREE,
  INDEX `IDX_XS_USER_LOGIN_NAME`(`LOGIN_NAME`) USING BTREE,
  INDEX `IDX_XS_USER_ORG_ID`(`ORG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xs_user
-- ----------------------------
INSERT INTO `xs_user` VALUES ('03969336787f423aa4dea82f35a1e708', 'zfy', '$2a$10$jNb6REWAn5WRNaj.mIbph.AgLKjUcxos9KmyI8oEXLV6RxEnP.h6C', '1', 'zfy', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('06354dee3d6b49699834433d04b40a36', 'ysm', '$2a$10$kxV9bbuqO9EOilPD93/Qv.A.PE37t3486z7noccaW163hYMgAtqPq', '1', 'ysm', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('06bc1d52d26944f4b243144a13dd5bd9', 'zpl4', '$2a$10$xFHR9VCYzjVSzrHUC5OGpeY2jdWL4TWgg2FCk.JPYBqDfNYo1T23q', '1', 'zpl4', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('081f8747f3304bb788a0dda597052743', 'pt1en', '$2a$10$ssHVY09AIeajiIFfrChv6O7pNk6RzMlJ7OyCFDSMIBBpFteDwnCwK', '1', 'pt1en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('0ba83869c9b749c29f50733d20367dbb', 'eaf1', '$2a$10$U.N5kNQBKkPxjJLsBB6cdu.AbMc4JDPrzGi4HLHj7gwq9jwNbTZHy', '1', 'eaf1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('0ce20fef2b71428497129f305d2c6354', 'zpl2en', '$2a$10$U8dnBUumtWp4aGDyBDC6h.EdDu2yMpVx1KhA6KAhdc10B3I0bUNnS', '1', 'zpl2en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('0cf6e379f04047f99e2a8cf3604c19e8', 'kqy', '$2a$10$2vU/6AY44JpUyPS861GP4OiA2TWX0ZlnZQ/zSptzuWvEyNxJ1IEbG', '1', 'kqy', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('10ebf194eef04a349ac0e0cb960d9321', 'lf1en', '$2a$10$hTa6e2M9DsQRYKSB52UAUOhY.TDtXrJ4K9h/KdeKzO6wPeZNaom6a', '1', 'lf1en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('123c71d250a3408ea13dd8de05af6b71', 'lz', '$2a$10$IgQxzE6DJitN1Q1W..alFubWCRyNqOijL2S17aD4cdvRGc561fclG', '1', 'lz', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('134ea0581e3a49e3b88835b02c42f762', 'fjb', '$2a$10$gHhu8.uslQQkSGH4HNrvMulhMSKw7fa9MVN11FJgxFXF5uArRGBhC', '1', 'fjb', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('13f0f730df424027815d754e78252560', 'lf1', '$2a$10$2nU1oGe2tD3WXyX7FwhJd.Br4e0auIawEy4jfioYWCoFoVFkJbLOK', '1', 'lf1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('1552764c846f4eb792bd2bc72333c8ab', 'zhl', '$2a$10$dS0H76F/jKgeMNl5/dvEn.zKhtE4JI8uBbD9/As4HywbCwmErsN6m', '1', 'zhl', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('15b30955d76341eca86b7ada0fedd705', 'kr3', '$2a$10$2TPdiyb7ZJKw0HFvrz4iW.kpzLThHPNk32WAXI5QSct0mJhqfEuwy', '1', 'kr3', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('186b66a4d8a54db08be7d0e76f09d096', 'fly', '$2a$10$YKFMAdKUoD1eCia2eJ5xvujWrd25O4ZqNInnqt2FzlSnFnCiQkEtK', '1', 'fly', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('1ebc43e68ce54422b133adb77e86b2ce', 'hsj', '$2a$10$sIdFHhWQTabo1xMhA9Lk.ebQ4bDUPWlwIgndn3BR2GcO6dCtr3c7m', '1', 'hsj', '1', '11111111111', '14005@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('1f4a106e5f2247c6a7d0c42acb3d947f', 'matosad', '$2a$10$ZUb10RTcUsleivQTf56sSOG.yPxJD/XVWxKd8lNW2.5yIRMrPmxCm', '1', 'matosad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('20271987b5264ecca839fc9dd27c2db0', 'kr3en', '$2a$10$IAQJ6Ak6DhBomPUR9yDjC.YydIo.e1igft7PHmptnbfmOC7gehmvW', '1', 'kr3en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('29f8432dbbe24ad58a467018343ba46c', 'zpl3ad', '$2a$10$r4z5gRpyiUmgR1hu/GzdmuTiSspN.GR.5eb0p1u01/FuEVW15Jvv6', '1', 'zpl3ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('2b5e47285b2d422094913081833dfbea', 'hss', '$2a$10$X5XymMrlOjS5Wvb/zCQVaOjt9309hiSxUXWybRatF9FsqXqOwc84G', '1', 'hss', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('2bf48ec0d1ef4681b244de55a7096222', 'hp', '$2a$10$Wk6xM7wO0U/xh1IwZgZQg.XQhZMD4asQ5uwDPc7lIbzb7jcZi04F2', '1', 'hp', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('2e47a61c55a44d63b14c47e2bd0b8e88', 'fcy', '$2a$10$nefLG4SoxNvcloZvr2W9mOHaHqkFhWCLsFT39V1zT7SxXLv4KCKiu', '1', 'fcy', '1', '11111111111', '111@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('355fe1ac8e4041038014606a747b9990', 'lb', '$2a$10$jzXsHEfHTo7htDrFudybV.VDd8Yn4H0UMHz2vT01Ua.K52WH.GMK2', '1', 'lb', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('35f0f423c1cc4802802cfa4d9b8edaae', 'lhy', '$2a$10$ZBABLe7lLTbPwMqfey8XQO7/zY7uMRd4QsJn/zp0BFoIdyELXmqOy', '1', 'lhy', '1', '12312311414', '11@11.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('38bc1ccbdb1b4ffd9516a7178e55a154', 'zq', '$2a$10$MOoLxDto6ZDfmXdZ0ya3P.ItI9.1Hpuj7L9DqkhBdaHGAyMuL7Osq', '1', 'zq', '1', '11111111111', '111@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('3b4f6ea67d9046eead4f63d81389d0e7', 'rh2ad', '$2a$10$UtSyzFt491XkWSoEX10xwOMC401fTvbB51tYFpxWyuUEMXUY62gqe', '1', 'rh2ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('3d327f58f38a4b108f38d26dcde58ce6', 'wb', '$2a$10$vo3gZYOXua6EhKZGARja1.V2giHdTcR9i36cmBQNMw7u3CxsKz0fu', '1', 'wb', '1', '11111111111', '111@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('3e0c62abfb184630a45b9bf9d3bc1059', 'yh', '$2a$10$k.Bgg.FsBLQHIy6gn95i6OSGkYBRNZCpnKFdLF56llvCQYRGIePJG', '1', 'yh', '2', '18855107335', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('3ed012355db54bea9de36dfc97079f5a', 'develop', '$2a$10$ZdIjzy2iTDjNY5bXa2/WrOLUWQofrFwe7MuSMx1tV8UNpt4ggG6hK', '1', 'develop', '1', '11111111111', '1111@qq.como', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('4487b6cc5b814a0d94ae0e7ddc9766f2', 'lyf', '$2a$10$u61GxIttlv7NI8WTGmxZQe6Cq6WYOy1aHRvwP690unmWZiEF/dn42', '1', 'lyf', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('457b438e84894ae7995a767faefe71b1', 'pt1ad', '$2a$10$dQvnrbK40tzfhWuFZjdW1uaELKVnnJHDTlRQgvEAvscd.5n/fBHFS', '1', 'pt1ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('46200ff6ff4c409f82e2300a6408007a', 'zl', '$2a$10$H7uW3SBmRfxg5pu36TeH6e1mVGoUe4pGI/WMHyrhgnKRaPIpvzs.O', '1', 'zl', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('463c674225584434b4e00b44f9a09b2d', 'zg5678', '$2a$10$rYMI/p3ZOrhXpT7o4RVEl.el.o4zqaENjPiZ1wY24AhD3VE6b3qaS', '1', 'zg5678', '1', '18817632836', '1111@qq.com', 'USER', '20220401', '20220401', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('488c60ff3c4e409896a4e71894e5d1d8', 'hrsg', '$2a$10$ospJYiBcqo.SSRELme6YveI5GTYV6Gx/GPm4kBf/chbZVjes2N9Dy', '1', 'ccc', '1', '12345678901', '1@123.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', 'EAF_HRSG', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('4fd5d5199f4c4d1aab546425faa836a4', 'rhosad', '$2a$10$tYniePKNp0g7rD.vYGZMe.QqQZWG3U5yN1XYisE7YoSHcg0.4/Xsq', '1', 'rhosad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5097b75214594cefbdd48cb2db535489', 'operator', '$2a$10$iq8t2eUB4xHpAuddi4tPTu7/fpNOhxvQs/8yFEvzIqss23rSQnpGy', '1', 'operator', '1', '11111111111', '1400405885@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('50e0d64c573f48af8e28b71daf19dbb2', 'qje', '$2a$10$g6WGd1uy/JGCS.ZRuTZpze6D9CyXys/rf8K3yBuLw2lnc2dXR.TAm', '1', 'qje', '1', '18817632836', '2826879775@qq.com', 'USER', '20220521', '20220521', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('54a6a9eecabd492080e31271d2ad1a4c', 'lf2en', '$2a$10$SNMC9FDJRgVzU/RV1mQ5wuRaLNsEQx2ahNHSQ4yjOlalyoP0GzhaC', '1', 'lf2en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('551946f086f94324a6c5d3a2935acd98', 'fosad', '$2a$10$rBj3ZYMyoig34BB5F35ms.ZcflOPtFF1lhRdrQ3J9.I4XTU/amITq', '1', 'fosad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5534037329c4407d8f7834d2d5e322a9', 'pt1', '$2a$10$O35iSulwNLhJOPvwGxRw1eSd2ne6kwYRIp513Af071k5GtR0aTQ6S', '1', 'pt1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('571ef57731f64fe695af1c1b221eb5a4', 'zpl2ad', '$2a$10$CZpYaGdv1.97qJJu9TQw0.Wy1r/zsAZv5VI5yx6hnP9hSSAF8E/wW', '1', 'zpl2ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('57459817cdf4484993a7be85415920d3', 'zpl1', '$2a$10$rHrw5nC1YD8g4rfPsWjNuugcjADRhoxylZBgbJF88mKRPUIgbHlMa', '1', 'zpl1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5b2d8cf8b04b4f499637adba6aedc1d0', 'rhosen', '$2a$10$Y00chc1vDe3bM6PD1tvBCOB0WyZ.x4.Z1qGuuGHZSfTyl3uHnWS6W', '1', 'rhosen', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5de06ad155ac4eae8d324e3cddc74960', 'ysh', '$2a$10$dhJC8gUTLvvYF8W/DVTiAOoJpux3KokYCmvM/xHOReV/Wz6gCl.3i', '1', 'ysh', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5e21ace3002c4930aa62bf914699c637', 'lfosen', '$2a$10$gAVXOrpgddvyzdm5hFoTzeH3EcmW2/GiyhXK86vM5Ke/lfWQrc01m', '1', 'lfosen', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5f511b9a1c4a4d15bdb49c3db80272ef', 'engineer', '$2a$10$SqToNPgMmU4vapXyAAzqQO5x.7te4NMSLfGQf.xeQ6/7jMALhQh4.', '1', 'engineer', '1', '11111111111', '140040@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('5f66ea20ac294ae38b6f40e172b751a3', 'zg3', '$2a$10$WBxCXIfowWQydBkPnwiyi.wp.N4Sd0JR1/0fVan3RrzS94rha1epm', '1', 'zg3', '1', '18817632836', '11@qq.com', 'USER', '20220328', '20220328', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('6013a6a6783e4ba09ca157db53cac5a3', 'wobo', '$2a$10$Npki8opwtmhYvLZs1GR.k.jy7FZ84BavtxLG.zIaC7nS8.sdmGheC', '1', 'wobo', '1', '18888887335', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('619cf72223a945d89514afa8c087b153', 'zg', '$2a$10$5Mmynapip18My.FtVQcoietuPKsaX2Nhc5qGs4VxcCuoyXIX8j41u', '1', 'zg', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('627dfa0473374decb66b23de1a053579', 'zg1234', '$2a$10$1rk.icAtjVEvaC.d/eRd8Ou0MjYPywNcpO9C/gzmK.KYhckOTO1jq', '1', 'zg1234', '1', '18817632836', '12121@qq.com', 'USER', '20220401', '20220401', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('62c96a4483e64f0d9e2fd1081a1816dd', 'wx', '$2a$10$Z6dyBsHzzl9.A/.9NAA1MumqHxG6edRRU2gngTe6Bz3a9.jeKvABm', '1', 'wx', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('640e93f6062b46be9b01a9d9bd87b975', 'administrator', '$2a$10$/fPpgtCgkMJouYmSXRbBvu2q6eBhUDeI2mYRdcvVfmfn5wt.ZjgtW', '1', 'administrator', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', '20210903170747', 'admin', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('65109d3f18a84dd0989568aefe7247be', 'dyh', '$2a$10$XnMEiyFFM7GK4atpBRsZCuFHbT6FxtNsB.AIxqyMY3J7UbwOKnPSa', '1', 'dyh', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('655a98295b7d4292a46fc772261e7fcf', 'rh1en', '$2a$10$Fufna/Nh7fsDq2u0Go2KJuOoDnRP9V.cxYc87fBOMsJpNRZ7JP2/G', '1', 'rh1en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('67f28ab18c9147399ce03de1bbd56adf', 'fosv', '$2a$10$G2mGfu2t5fMuqmX09X81DO5FZqddoRJXL4WYFHS.g2x7g.nJ29ed2', '1', 'fosv', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('696f1b241ffa49ad9092034437b934cf', 'checkout02', '$2a$10$etUtmt8yztgACbGnIlKIRORRflWJ04oogQXVTcUPTXbacz7/OD6ZC', '1', 'checkout02', '1', '18817632836', '11@qq.com', 'USER', '20220410', '20220410', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('69df564e13ab4a5ca95e1f952440c922', 'zpl1ad', '$2a$10$m41GKUSxaFvYTldLw1DOBeOSLQamEaPMhYcwxlpLhTNtdtrSOzGIu', '1', 'zpl1ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('6a3958c7f73b48409aacd7f082150f86', 'lyz', '$2a$10$zlwBWAzxmB4xrjNxidGxj.xRD.EN5VFZtWFugVFvpbywgj1nGSGJm', '1', 'lyz', '1', '12314231234', '1@1.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('6b59c171555d4a36afd4fa349ef58ece', 'vodad', '$2a$10$ZYSeI5Da2cIaRIga3RcTX.W1yyKiJG6qz.vqJNYi2f.LxYemYnQXS', '1', 'vodad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('6c9d8afb7307432bb40ee23b4f6cb928', 'zpl3en', '$2a$10$lSBCJmB5gE9S7ifXVdCd1.CNK3gjhdFEXmEC57C2FU3oJ3LXctpqG', '1', 'zpl3en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('6fcea71c1cc24f3d862245923cb02f0c', 'iplattsdb', '$2a$10$hhTFg.gSXq8mjTENeoxKcO77YTUtj4uR2HkG7ZZrxrLI0fxPUQIdu', '1', 'iplattsdb', '0', '18727187438', 'tsdb@baosight.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('7094b50d865044ad84a26f0ba3b464eb', 'matosen', '$2a$10$O7APxmfaH/dBdp3BCDiyN.taihJwD.NOcHhyvTRJ0AZF3MPEUKesa', '1', 'matosen', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('74b87aee37244b84a53eb1cf56ecc7d2', 'wsj', '$2a$10$kYkYhKCmS4hz7vFY8IynfO0fotwgs05oznYhRBez5R/ZylYcDb2W2', '1', 'wsj', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('75bb9d1f94f043b1baa6dd3479f52e88', 'wangbo', '$2a$10$O16lyd2mSIpclJQ5nAtc5eUzXHmARgq5lp/urlMgx9gP.6NPCIlIK', '1', 'wangbo', '1', '12345678912', '11@11.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('76cec38f0fe84003851c267c2b874b4c', 'lf2ad', '$2a$10$hB0YBYiVlkZxAO9n1Q7qVOcD8GbhhX.vwAbcr6He0Wc9lGiS5DcBS', '1', 'lf2ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('76d6e21051bb4e02bf63f7bbd4c1dd1c', 'zpl1en', '$2a$10$Z52T5W8grbTmvbzyPsAFze4o1xIOjwJeHMsq9ns6hidN5f0gQrfSq', '1', 'zpl1en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('79b753b733b743c0a6062346c7635602', 'testqjw', '$2a$10$zYrTG841FwBoR4YYH.yR9eXgFolSsgKMp79FkCDccxbEvm3Ilr0e2', '1', 'testqjw', '1', '18817632836', '11@qq.com', 'USER', '20220328', '20220328', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('7ba7e2caf796469ca15f33e64a0e6327', 'zy', '$2a$10$pNHSIg/GB/BwH2ATL/c/peaEBFjPyNFwUua0T1v/2klSgtlyyypgq', '1', 'zy', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('7c16974347fd412c88a6d0e2a30e783a', 'lfosad', '$2a$10$THF/Tr8oiTyOAKTA0hS5B.Nf8UFzAUijrmuCEKL01ofE0JOhYMIxS', '1', 'lfosad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('80a5f7a4ad374c57b58533129dcdcfd6', 'check01', '$2a$10$RVnVdj7rQ0MloemBOZ9HVuiIopRxP95KTLVc3nZba8AAEX3rp7mrG', '1', 'check01', '1', '18817632836', '11@qq.com', 'USER', '20220410', '20220410', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('82e128d5613e440ca4825274baf67cd3', 'steam', '$2a$10$vDuvOvangG08YJp5rhb.mOchDPEd6MHrcjfVmYawD2jLNwweD.kia', '1', 'steam', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('84f6ff631e654d7b9851f8ba3b35104e', 'zwj', '$2a$10$zW4xOr.dwU9l21gphMVfReIQG0/iVZT3WqlzQo.7tQJeVNoekJDkq', '1', 'zwj', '2', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('8823e9c0dd9c440dbd39d4952a884507', 'edge', '$2a$10$iRzQUiIoX7LncSVxCH4Je.htCXrdZmCrPUFz7uqznKMvsZNnK.V1i', '1', 'edge', '0', '13788888888', 'edge@baosight.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', 'operatorGroup', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('8acc9aa7cd5647bb87af1d5adeaa2b84', 'rh2', '$2a$10$wKvrpvYoQcBJsqBRuLVt.uYxlXOkp4yxRCHCtATkUS7GbpY2m3T/G', '1', 'rh2', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('8b42e15d14d74f1e9fb0a271a93cefa2', 'wyx', '$2a$10$mVrVaPJmdyQCkhnvShfwY.SyGeaAts5ioul1ob3ZtSqL10cT7E7WW', '1', 'wyx', '1', '12345678911', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('93ff150e28fd4b53886e29f43736fd3b', 'wangxiao1', '$2a$10$ofBeedyINxebCEqHfJDURu.fdaBwh1sbkZjQg9jLzOea3pCYiZhmy', '1', 'wangxiao1', '1', '18616020522', 'wangxiao@baosight.com', 'USER', '20220331', '20220331', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('95187a7966f34bca9d611369939f3842', 'wangxiao2', '$2a$10$OfN5EKULsW.dG1UMNIKRsuVNlWvWdQb0Jbti02og0Yh7ImRwJx2H.', '1', 'wangxiao2', '1', '18616020522', 'wangxiao@baosight.com', 'USER', '20220331', '20220331', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('9653cccdb0d040fe82f9cb20c3dc67c3', 'lf3', '$2a$10$/zYYYcmDsbppQXoncC6gQujsVNCtJjdqdtexSrlUt2v4OPgf.4c3e', '1', 'lf3', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('9b369c075211450c912fe2d449557ad9', 'kr2', '$2a$10$R/XTCvbF9ecFDEDITLPgzODaKvhuTR2nf.PX0Wwb9..6OO2zn1N9m', '1', 'kr2', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('9e36cc225e1f452f9a10d536e553f034', 'user1', '$2a$10$3PjAtHaHeo6xibwJLnZ9gehlR5JBrxrJBeBvwACMu3hdzxYa1xTVC', '1', 'user1', '1', '18817632836', '2826879775@qq.com', 'USER', '20220529', '20220529', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('9fe72865365943748fb15b7d4e4830a6', 'kxy', '$2a$10$l.lweIZP5zE9/4EVtbibAujXSvRlNCwNX9I7hJPHHgcQQK1VdGat2', '1', 'kxy', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a4206fc90eaf4c19b4cc73f079682c6d', 'qjw3', '$2a$10$PS0yyPf7HJmFZ8r81evlHeLJXb9dSfP96ehRx2tPi48IbKNOjQPOG', '1', 'qjw3', '1', '18817632836', '11@qq.com', 'USER', '20220329', '20220329', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a4a9de85f88d4ce69b79ad79d07cd40a', 'qhc', '$2a$10$SgWkLrhQ/LJ32PhbX70/J.f2FjFMe5.rFvAPLmKE30N.cZxll0B0W', '1', 'qhc', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a4bbe3be78394c7da38479b449f73ac5', 'lf3en', '$2a$10$q21GMRxUAPDxsTMuRg73nudxKYmn3VUBA5Mn2YibcEBlaHs8Up8O2', '1', 'lf3en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a566d7dc71db4ca29ccb92dea011ec7b', 'operatoros', '$2a$10$fcB7rt5bg8X.oh4kW0f8KOHOdJYjVmjMXaUrSJZi9LeQm/JKATBYq', '1', 'operatoros', '1', '11111111111', '1400405885@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a5c82659c9374c719dcdfc912e1071cf', 'tyg', '$2a$10$7HV9L3U7DGvqpsK6prz4QeZJrj5jPjhMXjXy3gDee.JcN0EpVu/Q2', '1', 'tyg', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a5efe1fd86354f1e95e3a804e45b3394', 'user2', '$2a$10$33OtvPJDMT7EOgfDYu4CXOw8lJXocQKxIy1PLUsgZqOJpuOvOabKG', '1', 'user2', '1', '18817632836', '2826879775@qq.com', 'USER', '20220529', '20220529', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a6745795d7a8490abcc1ccebbb431a56', 'lf3ad', '$2a$10$N/O/mRWEz4xTKwPsaN.UlOF9LW/ZoPK5.39bZidvpxGAqvD09PR6i', '1', 'lf3ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('a85f1093e1d84ceb8fb89100276637df', 'steamen', '$2a$10$hx2CwZzMtMiakpGGCZsOiOMaeBF5YG/FAgobMtnpA9VjatkEzJYuG', '1', 'steamen', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('af0cd1784b2d45ef9ff1f3396f47bde7', 'hf', '$2a$10$IWzvFYM5m1g5JUYtEkU8weJvvygDQGxXCN/youOVbSbl0WpLiDKxO', '1', 'hf', '2', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b20484b9371044eba5d6320d03c470d2', 'eaf2en', '$2a$10$ZsePiNHfYvCsK9t5fIUkgunF5MDv6nmDMZMTmK3sYOzUYVY/xAZzC', '1', 'eaf2en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b45363b889ff4a9da291bc176c17d682', 'zpl4ad', '$2a$10$8optlj53s9fXEH7yrWKFWuq0wOd96mHBLKDwD96.oEQlF0GR6lBKW', '1', 'zpl4ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b52f47574abc4d05a55a0fe72797a086', 'rh1ad', '$2a$10$KM503f90LvdiGp0.qPuPIuC6vyc2zfQx0NiDZ5Ag2/2r3CkiG1iN.', '1', 'rh1ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b5711eb07fc84de19e4dec9018700c2c', 'matos', '$2a$10$YGualvBPOlOYXBIt8qpEuOGzAt2eFm9HRYwGh7jKglwRaY9Y.GvB6', '1', 'matos', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b651ac62d9f4432a958e01fe3751a8e6', 'kr3ad', '$2a$10$5eUvyUavFH1YTzBNGg17rOzFqMCjGPcMOA7vZq8q075ehEcT749H2', '1', 'kr3ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('b8ec83b8d17440a497473068774a6504', 'zpl3', '$2a$10$X8ttj5zfXfWUB3POJg7dbuzQd/QaV.7uZG/bzH8gynVROPpu5rUrC', '1', 'zpl3', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('bf0e54962d6348a49bc8b669284e9f4a', 'eaf2ad', '$2a$10$yzpcsqyqUVfTvqFzQk8aJu3.NDlLEEdwo.eAbUAkeCljCdmEGL1bO', '1', 'eaf2ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c2b5955070bc45abb8e264b1a733a974', 'rh2en', '$2a$10$KEltnzWf407A3vRzE03DyumU5OncC8tKsKvGkttjEB/teXAK/.0dq', '1', 'rh2en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c2dc7d78387c4d4eac4da779e6d03a06', 'noauth', '$2a$10$jgW1/bw17dgK8uJ2IH8Xau5FdVDb/B8Zah137RFQuTy7Bt1sGOrSC', '1', '不授权测试', '1', '18817632836', '111@qq.com', 'USER', '20220329', '20220329', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c2e07cedf981483fb5274fbab76502bf', 'fosen', '$2a$10$Kop/PvexW3z77AbW0dj3Eut2nOAhfVB5FHDqQVHI9FF2z3UTzrE2O', '1', 'fosen', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c4862011e06240ed93335f13ef235133', 'vod', '$2a$10$u7OUjZ8196zHVvzJ7TazIO3w2faNR2KgvoEc3EESDQJjd5m4VzSNq', '1', 'vod', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c536ad9d68854a969e0c693754ec7e43', 'wtf', '$2a$10$IOuV3hb9WciqHwzRpjgju.aX4m7DLjxo6c0tovslEluOuJz2N36gq', '1', 'wtf', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c56ba1633def441f8276d19b3d569b74', 'lf2', '$2a$10$MguAFsLpg0Sp/qHr8WbZXulc9x6YYA6rc4wyq1QKQ87tMBmH/wZ4m', '1', 'lf2', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('c5abc3bb1c764586b170b71565a10d7b', 'voden', '$2a$10$wXnEfNs3I0d1qTpYG9ZGIOr8wl3N4Du534JW/9RhNJD6B3emGJdz6', '1', 'voden', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('cb755983547d445197878f2c0c829d56', 'steamad', '$2a$10$ccp4wAs0pkY0FCetMz7fuOsf2m2W8/GW8zk1AGvROQoVVN/9YEYam', '1', 'steamad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('cc88e1fc107e48059025faf39f69aa73', 'rhos', '$2a$10$HKpS.zQ9JVSN9p8dl8omI..JiM24upqLn99qO22CFTpOe9c9soKw6', '1', 'rhos', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('ce598c2143df476fa6a69fa0bd92dcbb', 'yww', '$2a$10$gZWUjVRbPYZrrkE6rGE8qeAr08Flh9S5olctKmIKM4qWFWkb/6NkS', '1', 'yww', '1', '12312341234', '1@q.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d2d7d98c67b64c858f5935caf9330a00', 'ceshi02', '$2a$10$a87sqv62wgvYKX3oDUyPBeyTa0QWVe69piLWykHWOsNgE7RSMmNZO', '1', 'ceshi02', '1', '18817632836', '11@qq.com', 'USER', '20220402', '20220402', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d313cefdf0d34f94b33740d79b811170', 'zpl2', '$2a$10$GymvYDF1EFVp2ePBNnG8VuEQuZR6iUCYNqLpClIQljqZYIqZtSjyK', '1', 'zpl2', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d4af8db0797e4455b2838dd6f28d231f', 'fos', '$2a$10$F.yMLTeKLGX48cufV5s6s.JzTck0miZGiRsqwuN8DZ2SY626m8NZy', '1', 'fos', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d4bcd83dd47d4aec8a8ea2ec06886b2a', 'ljm', '$2a$10$zNj/YP4P5CSpdOiwbEN2peNgLLQlStkucPPzPtFGljA7P8H7txWBO', '1', 'ljm', '2', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d60167ca24424f3b8f6107035df58b42', 'kr2ad', '$2a$10$A2h3vVQZ7wXwpfOxIxzdZ.6kKBkISGvX1ud3dX5f2YOTEFECcnTLm', '1', 'kr2ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d6f2e69108eb4a24bb4916d2e8857204', 'll', '$2a$10$PtbAFCyI7mKf6yqTzxV3ROSkei0EOb5Be7q55QkobTj5j.CXB3iO.', '1', 'll', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d70fbc37e2534861a62dbfd6989978d8', 'phw', '$2a$10$rtoJXRcmmtydYuTxT5RjE.kfBXpLUUivC4E2RGjseRhZwpc/hM56u', '1', 'phw', '1', '11111111111', '111@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d71ae6630f3b4ef9b20894dca338eb90', 'eaf2', '$2a$10$BmpBs5ET/TYRCIfQFBn58OEgzOgQ96FwIX.bIxTTFokRtSI2906Mq', '1', 'eaf2', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('d92b881d109b45ab9994c76a0c3cd9db', 'eaf1ad', '$2a$10$YpnRuwFWTstib7COunNsIei3r93XP9VuPOJApEeI1WUf7MeQhCd9u', '1', 'eaf1ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('dbad1f7fff814e1cb277e0dfadb18981', 'hh', '$2a$10$DcuhkG1oadkWtuKGVsg4xuRW4J0KexbnlJdLYOSv0PUWOV5ncX/bW', '1', 'hh', '1', '11111111111', '11111111111@111.111', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('dbf85f4a0c3e4c8e921e866335c5c6bd', 'zpl4en', '$2a$10$PbjKnGfo8D3jhUBHYayJqe2cnUPURrnpa5HkO4xR9Nesmqi3lmzma', '1', 'zpl4en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('deef54cdb2ad4e50b47ea1bce6c1047e', 'testzg', '$2a$10$37Zn1lr/gnmyjUoKBw/sNeuI4/ZUS7L58woJaQG8TTtczlkMWe.XS', '1', 'testzg', '1', '18817632836', '11@163.com', 'USER', '20220328', '20220328', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('e1aa16530d36433bb0495f175103ff1a', 'll1', '$2a$10$leVK.flepmkgPPsJ/Pb6oeMbRlJvqMRXstLq3TrgqULz3WXJKh53S', '1', 'll1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('e8329c21c71a4f9897ac9570152e33a7', 'lf1ad', '$2a$10$Ad5G6tNOTbpuC6nZwiOp0O51Wj.3HzxB0z1AC8hcCwyaJOe6LklWG', '1', 'lf1ad', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('e9f6bc1a5a3146f08c668fa2d7a1e83d', 'ly', '$2a$10$jBvdgTN/MJJP7ZkbxuaErOJvZp75QsEwDKQWOAuzoBWnBj3WsFhUq', '1', 'ly', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('eb6ce18bd5bf46fbb4651e2ff622c123', 'admin', '$2a$10$wQWOQcpv62kuyy5bB3EavODz7mYpu5VI4VoWZKwPQv.U/KRIGbZXO', '1', 'admin', '0', '18888888888', '1@1.com', 'USER', '20991212', '20991212', '1', '20210825161855', 'admin', '1', 'ADMIN', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('ecd0fb6a0a1c47aeb082b32f681eba31', 'rh1', '$2a$10$cery4UD8hPZHZM9h.ILLvOOlxhX5Qj2vLCYWiNnr8naOryts.APu.', '1', 'rh1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('f04435f1167b48979a2059adccac12a3', 'sxm', '$2a$10$t7A/GaGPjMVb2eKm4718xOl2sPOoA3s9UlxyyVP9ROndU8kEgPtwm', '1', 'sxm', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('f5e6d9d99aa3499dac74ba2437131813', 'lfos', '$2a$10$4WFQ1bbpQ5QfmzR1/3OQt.S74NH81vNx87XYqxpGuypzJ3faqNpn.', '1', 'lfos', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('f7a58ea7ffc4487fbd47b020d1a1eb0a', 'kr2en', '$2a$10$3XT1EVRPUL41/pAjoDpZq.wi8MlNXPkSV3GohgKkmf8mJ0uvGHqY2', '1', 'kr2en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('f7b5909cf569456e95d3f2b3d81322c6', 'ljk', '$2a$10$SlVXyabuNgPciVzyPlVjFO0i/bEdxtUsj79tnC2REbK8lwUe8X2ZS', '1', 'ljk', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('f9218277cdfc45658abd8af2aa02456c', 'eaf1en', '$2a$10$maOBSTPN1Ev2BJGODOQD9OKQlA7qGsalZDv7UpMMPOKVYBcktjHTe', '1', 'eaf1en', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('fa367612c94b4833b00864d4180fe680', 'wudi', '$2a$10$ME/L72pDO6uMH8hzJJB3iOg.L6Qx2pY7jt5lWflsMLEKScO3.28tG', '1', 'wudi', '1', '15700083759', '1056991921@qq.com', 'USER', '20220330', '20220330', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('faecdb8dc33d412f9a5e983eebf10530', 'kry', '$2a$10$qoA0NJ01FAAE/tDQalI0/Ou12cxwlKnzSWGYrMH5z55JklZdoTh8q', '1', 'kry', '1', '12312341234', '111@1.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('fba5d76419fb436ea5155fc5c41bd6a6', 'ZPL1', '$2a$10$PZ66VOVVOfYoqzhzQASLpOSy8EN1jjapy9hug0RhNiodsz.VdZQmS', '1', 'ZPL1', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');
INSERT INTO `xs_user` VALUES ('fd494129fc1f44849dac4a7515edc819', 'wc', '$2a$10$qZ1qNaOg0qcVmJmEYl7nZufVMw1X/WhFPijdNDvCyE8tfrkvhP0Wi', '1', 'wc', '1', '11111111111', '11@qq.com', 'USER', '20991212', '20991212', '1', ' ', ' ', '0', '', '1347e65e6b2f401f85c1cf08494d93e6');

SET FOREIGN_KEY_CHECKS = 1;
