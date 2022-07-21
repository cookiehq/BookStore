/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : 65001

 Date: 21/07/2022 14:30:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `b_price` double(8, 2) NULL DEFAULT NULL,
  `b_sales` int(11) NULL DEFAULT NULL,
  `b_inventory` int(11) NULL DEFAULT NULL,
  `b_img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, 'web前端开发技术第三版', '储久良', 30.00, 230, 1000, 'web.png');
INSERT INTO `t_book` VALUES (2, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');
INSERT INTO `t_book` VALUES (3, 'python语言程序设计基础', '朱少民', 23.00, 100, 500, 'python.png');
INSERT INTO `t_book` VALUES (4, '数据仓库与数据挖掘教程', '储久良', 30.00, 230, 1000, 'data.png');
INSERT INTO `t_book` VALUES (5, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');
INSERT INTO `t_book` VALUES (6, 'web前端开发技术第三版', '储久良', 30.00, 230, 1000, 'web.png');
INSERT INTO `t_book` VALUES (7, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');
INSERT INTO `t_book` VALUES (8, 'python语言程序设计基础', '朱少民', 23.00, 100, 500, 'python.png');
INSERT INTO `t_book` VALUES (9, '数据仓库与数据挖掘教程', '储久良', 30.00, 230, 1000, 'data.png');
INSERT INTO `t_book` VALUES (10, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');
INSERT INTO `t_book` VALUES (11, 'web前端开发技术第三版', '储久良', 30.00, 230, 1000, 'web.png');
INSERT INTO `t_book` VALUES (12, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');
INSERT INTO `t_book` VALUES (13, 'python语言程序设计基础', '朱少民', 23.00, 100, 500, 'python.png');
INSERT INTO `t_book` VALUES (14, '数据仓库与数据挖掘教程', '储久良', 30.00, 230, 1000, 'data.png');
INSERT INTO `t_book` VALUES (15, '软件测试方法和技术', '朱少民', 23.00, 100, 500, 'test.png');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NULL DEFAULT NULL,
  `b_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES (19, 1, 3, 26);
INSERT INTO `t_cart` VALUES (20, 1, 2, 26);
INSERT INTO `t_cart` VALUES (25, 2, 1, 26);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '晓晓', '123456', '123@qq.com', '12346789712', '江苏南京');
INSERT INTO `t_user` VALUES (2, 'yxq123', '123456', 'aaa@qq.com', '12456787654', '江苏南京');
INSERT INTO `t_user` VALUES (3, 'yxq234', '123456', '123@qq.com', '1345678932', '南京');
INSERT INTO `t_user` VALUES (5, 'aaaa', '123', '123@qq.com', '88774425461', '南京');
INSERT INTO `t_user` VALUES (6, 'bbbbb', '123', '123@qq.com', '88774425461', '南京');
INSERT INTO `t_user` VALUES (7, 'cc', '123', '123@qq.com', '88774425461', '南京');
INSERT INTO `t_user` VALUES (8, 'yxq123！', '123456', '123@qq.com', '36725378632', '南京');
INSERT INTO `t_user` VALUES (9, 'qqqqq', '123456', '123@qq.com', '12345678904', '南京');
INSERT INTO `t_user` VALUES (10, 'qqqqqq', '123456', '123@qq.com', '12356787641', '南京');
INSERT INTO `t_user` VALUES (11, 'ttttt', '123456', '123@qq.com', '12456768961', '南京');
INSERT INTO `t_user` VALUES (12, 'yxqyxq', '123456', '123@qq.com', '12345678981', '南京');
INSERT INTO `t_user` VALUES (13, 'yuanxiaoqing', '123456', '2214797301@qq.com', '14760880223', '南京');
INSERT INTO `t_user` VALUES (14, 'coco', '123456', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (15, 'cococo', '123456', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (17, 'cccccc', '123456', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (19, 'cococ', '123456', '123@qq.com', '12346789712', '江苏南京');
INSERT INTO `t_user` VALUES (20, 'cocooo', '123456', '2242616069@qq.com', '45364835', '山东');
INSERT INTO `t_user` VALUES (21, 'cocooo1', '123456', '2242616069@qq.com', '45364835', '江苏南京');
INSERT INTO `t_user` VALUES (23, 'auuu23', '123456', '123@122.com', '12346', 'æ±èåäº¬');
INSERT INTO `t_user` VALUES (24, 'sfaasd121', '123456', '123@123.com', '123456789', '江苏南京');
INSERT INTO `t_user` VALUES (25, 'coco123', '123456', '123@123.com', '123456789', '江苏无锡');
INSERT INTO `t_user` VALUES (26, '123456', '123456', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (27, 'faefa232', '123456', '12345@123.com', '123456789', '123');

SET FOREIGN_KEY_CHECKS = 1;
