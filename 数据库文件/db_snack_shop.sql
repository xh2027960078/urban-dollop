/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : db_snack_shop

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 11/07/2022 17:09:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `roleIdpre`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2, 'admin', 'admin', 1);

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, '个人信息');
INSERT INTO `admin_menu` VALUES (2, '人员管理');
INSERT INTO `admin_menu` VALUES (4, '订单管理');
INSERT INTO `admin_menu` VALUES (6, '商品管理');

-- ----------------------------
-- Table structure for admin_menu_child
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu_child`;
CREATE TABLE `admin_menu_child`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` int NULL DEFAULT NULL,
  `child_menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_menu_child
-- ----------------------------
INSERT INTO `admin_menu_child` VALUES (1, '用户管理', 2, '/admin/user/mainToUserinfo');
INSERT INTO `admin_menu_child` VALUES (3, '订单管理', 4, '/admin/order/mainToAdminOrder');
INSERT INTO `admin_menu_child` VALUES (5, '商品管理', 6, '/admin/snackinfo/mainToAdminSnackinfo');
INSERT INTO `admin_menu_child` VALUES (7, '个人信息', 1, '/user/mainToAdminuser');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `u_id` int NULL DEFAULT NULL,
  `e_id` int NULL DEFAULT NULL COMMENT '操作员ID',
  `o_time` date NULL DEFAULT NULL,
  `o_type` int NULL DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (84, '201803272559', 12, 2, '2018-03-27', 1);
INSERT INTO `order` VALUES (125, '201811024234', 17, 1, '2018-11-02', 0);
INSERT INTO `order` VALUES (126, '201811045281', 18, 2, '2018-11-04', 0);
INSERT INTO `order` VALUES (127, '201812053444', 19, 2, '2018-12-05', 1);
INSERT INTO `order` VALUES (128, '201812074630', 20, 2, '2018-12-07', 0);
INSERT INTO `order` VALUES (129, '201812075605', 20, NULL, '2018-12-07', -2);
INSERT INTO `order` VALUES (132, '201812078303', 20, 2, '2018-12-07', 1);
INSERT INTO `order` VALUES (133, '202206078903', 21, NULL, '2022-06-07', -2);
INSERT INTO `order` VALUES (134, '202206264457', 22, 2, '2022-06-26', 1);
INSERT INTO `order` VALUES (135, '202206281359', 21, 2, '2022-06-28', 0);
INSERT INTO `order` VALUES (136, '202206298395', 21, 2, '2022-06-29', 0);
INSERT INTO `order` VALUES (137, '202206309935', 21, 2, '2022-06-30', 0);
INSERT INTO `order` VALUES (140, '202207044621', 23, 2, '2022-07-04', 0);
INSERT INTO `order` VALUES (141, '202207053562', 22, 2, '2022-07-05', 1);
INSERT INTO `order` VALUES (142, '202207053642', 22, 2, '2022-07-05', 1);
INSERT INTO `order` VALUES (144, '202207065592', 22, 2, '2022-07-06', 1);
INSERT INTO `order` VALUES (148, '202207103126', 22, NULL, '2022-07-10', -2);
INSERT INTO `order` VALUES (151, '202207107954', 22, NULL, '2022-07-10', -2);
INSERT INTO `order` VALUES (152, '202207109758', 22, NULL, '2022-07-10', -2);
INSERT INTO `order` VALUES (153, '202207103078', 22, NULL, '2022-07-10', -2);
INSERT INTO `order` VALUES (155, '202207104644', 22, 2, '2022-07-10', 1);
INSERT INTO `order` VALUES (156, '202207104213', 22, NULL, '2022-07-10', -2);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_id` int NULL DEFAULT NULL,
  `o_num` int NULL DEFAULT NULL,
  `o_money` double NULL DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (94, '201803272559', 20, 2, 10);
INSERT INTO `orderdetail` VALUES (154, '201811024234', 26, 1, 16);
INSERT INTO `orderdetail` VALUES (155, '201811024234', 25, 1, 1);
INSERT INTO `orderdetail` VALUES (156, '201811045281', 82, 2, 10);
INSERT INTO `orderdetail` VALUES (157, '201812053444', 39, 2, 20);
INSERT INTO `orderdetail` VALUES (158, '201812053444', 32, 3, 10);
INSERT INTO `orderdetail` VALUES (159, '201812074630', 67, 3, 16);
INSERT INTO `orderdetail` VALUES (160, '201812074630', 55, 2, 9);
INSERT INTO `orderdetail` VALUES (161, '201812074630', 39, 1, 20);
INSERT INTO `orderdetail` VALUES (162, '201812075605', 49, 1, 14);
INSERT INTO `orderdetail` VALUES (163, '201812075605', 45, 1, 27);
INSERT INTO `orderdetail` VALUES (164, '201812075605', 30, 1, 8);
INSERT INTO `orderdetail` VALUES (168, '201812078303', 66, 1, 16);
INSERT INTO `orderdetail` VALUES (169, '201812078303', 34, 1, 12);
INSERT INTO `orderdetail` VALUES (170, '202206078903', 81, 1, 2.1);
INSERT INTO `orderdetail` VALUES (171, '202206078903', 40, 2, 12);
INSERT INTO `orderdetail` VALUES (172, '202206264457', 32, 1, 10);
INSERT INTO `orderdetail` VALUES (173, '202206264457', 80, 2, 7);
INSERT INTO `orderdetail` VALUES (174, '202206281359', 54, 1, 24);
INSERT INTO `orderdetail` VALUES (175, '202206298395', 54, 1, 24);
INSERT INTO `orderdetail` VALUES (176, '202206298395', 42, 1, 12);
INSERT INTO `orderdetail` VALUES (177, '202206309935', 58, 1, 45);
INSERT INTO `orderdetail` VALUES (178, '202206309935', 87, 1, 48.6);
INSERT INTO `orderdetail` VALUES (179, '202206309935', 88, 1, 19.900000000000002);
INSERT INTO `orderdetail` VALUES (182, '202207044621', 88, 1, 19.900000000000002);
INSERT INTO `orderdetail` VALUES (183, '202207053562', 54, 1, 24);
INSERT INTO `orderdetail` VALUES (184, '202207053642', 94, 1, 799.2);
INSERT INTO `orderdetail` VALUES (187, '202207065592', 94, 1, 799.2);
INSERT INTO `orderdetail` VALUES (192, '202207103126', 92, 1, 19.900000000000002);
INSERT INTO `orderdetail` VALUES (196, '202207107954', 92, 1, 19.900000000000002);
INSERT INTO `orderdetail` VALUES (197, '202207109758', 95, 1, 50);
INSERT INTO `orderdetail` VALUES (198, '202207103078', 85, 1, 179.10000000000002);
INSERT INTO `orderdetail` VALUES (200, '202207104644', 94, 1, 799.2);
INSERT INTO `orderdetail` VALUES (201, '202207104644', 25, 1, 1);
INSERT INTO `orderdetail` VALUES (202, '202207104213', 94, 1, 799.2);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` int NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isparent` int NULL DEFAULT NULL,
  `ismenu` int NULL DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (6, '用户管理', 0, '/snack/admin/user/mainToUserinfo', 1, 1);
INSERT INTO `permission` VALUES (9, '用户删除', 6, '/snack/admin/user/delUserinfoById', 0, 1);
INSERT INTO `permission` VALUES (10, '用户修改', 6, '/snack/admin/user/updateGoUserinfoById', 0, 1);
INSERT INTO `permission` VALUES (13, '订单管理', 0, '/snack/admin/order/mainToAdminOrder', 1, 1);
INSERT INTO `permission` VALUES (14, '订单修改', 13, '/snack/admin/order/updateSelectAdminOrder', 0, 1);
INSERT INTO `permission` VALUES (15, '订单删除', 13, '/snack/admin/order/deleteAdminOrder', 0, 1);
INSERT INTO `permission` VALUES (16, '详情修改', 13, '/snack/admin/order/updateSelectAdminOrderDetial', 0, 1);
INSERT INTO `permission` VALUES (17, '详情删除', 13, '/snack/admin/order/deleteOrderdetail', 0, 1);
INSERT INTO `permission` VALUES (19, '图片管理', 0, '/snack/admin/img/mainToAdminImg', 1, 1);
INSERT INTO `permission` VALUES (20, '上传图片', 19, '/snack/admin/img/upload', 0, 1);
INSERT INTO `permission` VALUES (21, '商品管理', 0, '/snack/admin/snackinfo/mainToAdminSnackinfo', 0, 1);
INSERT INTO `permission` VALUES (22, '商品上架', 21, '/snack/admin/snackinfo/addAdminSnack', 0, 1);
INSERT INTO `permission` VALUES (23, '商品删除', 21, '/snack/admin/snackinfo/delAdminUserinfo', 0, 1);
INSERT INTO `permission` VALUES (24, '商品修改', 21, '/snack/admin/snackinfo/selectAdminUserinfoBysId', 0, 1);
INSERT INTO `permission` VALUES (25, '个人信息', 0, '/admin/user/mainToAdminuser', 1, 1);
INSERT INTO `permission` VALUES (26, '确认发货', 13, '/snack/admin/order/userOrderConfirm', 0, 1);

-- ----------------------------
-- Table structure for receiptinfo
-- ----------------------------
DROP TABLE IF EXISTS `receiptinfo`;
CREATE TABLE `receiptinfo`  (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of receiptinfo
-- ----------------------------
INSERT INTO `receiptinfo` VALUES (139, '202206078903', '徐辉', '13719203556', '长沙市');
INSERT INTO `receiptinfo` VALUES (140, '202206264457', '徐辉', '13719203558', '长沙市');
INSERT INTO `receiptinfo` VALUES (141, '202206281359', '徐辉', '13719203558', '长沙市');
INSERT INTO `receiptinfo` VALUES (142, '202206298395', '徐辉', '13719203558', '长沙市');
INSERT INTO `receiptinfo` VALUES (143, '202206309935', '徐辉', '13719203558', '长沙市');
INSERT INTO `receiptinfo` VALUES (146, '202207044621', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (147, '202207053562', '徐辉', '15608499956', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (148, '202207053642', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (150, '202207065592', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (154, '202207103126', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (156, '202207107446', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (157, '202207104909', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (158, '202207106848', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (159, '202207104150', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (160, '202207109612', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (161, '202207103011', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (162, '202207101638', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (163, '202207104523', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (164, '202207108951', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (165, '202207107579', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (166, '202207104564', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (167, '202207102225', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (168, '202207107990', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (169, '202207109683', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (170, '202207101718', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (171, '202207105704', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (172, '202207106770', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (173, '202207104229', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (174, '202207107328', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (175, '202207106978', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (176, '202207107546', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (177, '202207107645', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (178, '202207103298', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (179, '202207102281', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (180, '202207101275', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (181, '202207107924', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (182, '202207107527', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (183, '202207101681', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (184, '202207102036', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (185, '202207103816', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (186, '202207103740', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (187, '202207101194', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (188, '202207109772', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (189, '202207108583', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (190, '202207109544', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (191, '202207104332', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (192, '202207107365', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (193, '202207109073', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (194, '202207108628', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (195, '202207109928', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (196, '202207106212', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (197, '202207102807', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (199, '202207107954', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (200, '202207109758', '徐辉', '13719203558', '长汉化');
INSERT INTO `receiptinfo` VALUES (201, '202207103078', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (203, '202207104644', '徐辉', '13719203558', '长沙市撒擦');
INSERT INTO `receiptinfo` VALUES (204, '202207104213', '徐辉', '13719203553', '长沙市撒擦');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `s_id` int NULL DEFAULT NULL,
  `recordDate` date NULL DEFAULT NULL,
  `recordNumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `s_idfk`(`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (13, 20, '2018-02-16', 2);
INSERT INTO `record` VALUES (14, 23, '2018-03-27', 4);
INSERT INTO `record` VALUES (15, 20, '2018-03-27', 6);
INSERT INTO `record` VALUES (16, 20, '2018-03-27', 2);
INSERT INTO `record` VALUES (17, 23, '2018-03-27', 1);
INSERT INTO `record` VALUES (18, 21, '2018-03-27', 1);
INSERT INTO `record` VALUES (19, 20, '2018-03-27', 2);
INSERT INTO `record` VALUES (20, 21, '2018-03-27', 1);
INSERT INTO `record` VALUES (21, 24, '2018-03-27', 3);
INSERT INTO `record` VALUES (22, 23, '2018-03-28', 1);
INSERT INTO `record` VALUES (23, 21, '2018-03-28', 10);
INSERT INTO `record` VALUES (24, 21, '2018-03-28', 1);
INSERT INTO `record` VALUES (25, 20, '2018-03-28', 1);
INSERT INTO `record` VALUES (26, 24, '2018-03-28', 1);
INSERT INTO `record` VALUES (27, 24, '2018-03-28', 1);
INSERT INTO `record` VALUES (28, 23, '2018-03-31', 1);
INSERT INTO `record` VALUES (29, 23, '2018-04-01', 1);
INSERT INTO `record` VALUES (30, 20, '2018-04-01', 6);
INSERT INTO `record` VALUES (31, 24, '2018-04-01', 3);
INSERT INTO `record` VALUES (32, 20, '2018-04-01', 1);
INSERT INTO `record` VALUES (33, 23, '2018-04-01', 1);
INSERT INTO `record` VALUES (34, 62, '2018-04-01', 4);
INSERT INTO `record` VALUES (35, 27, '2018-04-01', 5);
INSERT INTO `record` VALUES (36, 45, '2018-04-01', 3);
INSERT INTO `record` VALUES (37, 51, '2018-04-17', 4);
INSERT INTO `record` VALUES (38, 34, '2018-04-17', 4);
INSERT INTO `record` VALUES (39, 26, '2018-04-01', 8);
INSERT INTO `record` VALUES (40, 30, '2018-04-01', 10);
INSERT INTO `record` VALUES (41, 51, '2018-04-30', 3);
INSERT INTO `record` VALUES (42, 33, '2018-04-30', 4);
INSERT INTO `record` VALUES (43, 26, '2018-04-30', 3);
INSERT INTO `record` VALUES (44, 56, '2018-04-30', 1);
INSERT INTO `record` VALUES (45, 26, '2018-10-25', 1);
INSERT INTO `record` VALUES (46, 26, '2018-10-25', 10);
INSERT INTO `record` VALUES (47, 26, '2018-10-25', 22);
INSERT INTO `record` VALUES (48, 34, '2018-10-25', 6);
INSERT INTO `record` VALUES (49, 26, '2018-11-04', 1);
INSERT INTO `record` VALUES (50, 25, '2018-11-04', 1);
INSERT INTO `record` VALUES (51, 39, '2018-12-05', 2);
INSERT INTO `record` VALUES (52, 32, '2018-12-05', 3);
INSERT INTO `record` VALUES (54, 67, '2018-12-07', 3);
INSERT INTO `record` VALUES (55, 55, '2018-12-07', 2);
INSERT INTO `record` VALUES (56, 39, '2018-12-07', 1);
INSERT INTO `record` VALUES (57, 66, '2018-12-07', 1);
INSERT INTO `record` VALUES (58, 34, '2018-12-07', 1);
INSERT INTO `record` VALUES (59, 88, '2022-07-05', 1);
INSERT INTO `record` VALUES (60, 94, '2022-07-05', 1);
INSERT INTO `record` VALUES (61, 54, '2022-07-05', 1);
INSERT INTO `record` VALUES (62, 58, '2022-07-05', 1);
INSERT INTO `record` VALUES (63, 87, '2022-07-05', 1);
INSERT INTO `record` VALUES (64, 88, '2022-07-05', 1);
INSERT INTO `record` VALUES (65, 54, '2022-07-05', 1);
INSERT INTO `record` VALUES (66, 42, '2022-07-05', 1);
INSERT INTO `record` VALUES (67, 54, '2022-07-05', 1);
INSERT INTO `record` VALUES (68, 32, '2022-07-05', 1);
INSERT INTO `record` VALUES (69, 80, '2022-07-05', 2);
INSERT INTO `record` VALUES (70, 94, '2022-07-06', 1);
INSERT INTO `record` VALUES (71, 94, '2022-07-11', 1);
INSERT INTO `record` VALUES (72, 25, '2022-07-11', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '系统最高权限者(不可添加编辑)');
INSERT INTO `role` VALUES (2, '普通管理员', '管理发货');
INSERT INTO `role` VALUES (3, '小角色', '查看基本报表');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `perid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (1, 1, 1);
INSERT INTO `rolepermission` VALUES (2, 1, 2);
INSERT INTO `rolepermission` VALUES (3, 1, 3);
INSERT INTO `rolepermission` VALUES (4, 1, 4);
INSERT INTO `rolepermission` VALUES (5, 1, 6);
INSERT INTO `rolepermission` VALUES (6, 1, 9);
INSERT INTO `rolepermission` VALUES (7, 1, 10);
INSERT INTO `rolepermission` VALUES (8, 1, 13);
INSERT INTO `rolepermission` VALUES (9, 1, 14);
INSERT INTO `rolepermission` VALUES (10, 1, 15);
INSERT INTO `rolepermission` VALUES (11, 1, 16);
INSERT INTO `rolepermission` VALUES (12, 1, 17);
INSERT INTO `rolepermission` VALUES (13, 1, 19);
INSERT INTO `rolepermission` VALUES (14, 1, 20);
INSERT INTO `rolepermission` VALUES (15, 1, 21);
INSERT INTO `rolepermission` VALUES (16, 1, 22);
INSERT INTO `rolepermission` VALUES (17, 1, 23);
INSERT INTO `rolepermission` VALUES (18, 1, 24);
INSERT INTO `rolepermission` VALUES (19, 2, 1);
INSERT INTO `rolepermission` VALUES (20, 2, 6);
INSERT INTO `rolepermission` VALUES (21, 2, 13);
INSERT INTO `rolepermission` VALUES (22, 2, 14);
INSERT INTO `rolepermission` VALUES (23, 2, 15);
INSERT INTO `rolepermission` VALUES (24, 2, 16);
INSERT INTO `rolepermission` VALUES (25, 2, 17);
INSERT INTO `rolepermission` VALUES (26, 2, 19);
INSERT INTO `rolepermission` VALUES (27, 2, 21);
INSERT INTO `rolepermission` VALUES (28, 2, 25);
INSERT INTO `rolepermission` VALUES (29, 1, 25);
INSERT INTO `rolepermission` VALUES (30, 3, 1);
INSERT INTO `rolepermission` VALUES (31, 3, 6);
INSERT INTO `rolepermission` VALUES (32, 3, 13);
INSERT INTO `rolepermission` VALUES (33, 3, 19);
INSERT INTO `rolepermission` VALUES (34, 3, 21);
INSERT INTO `rolepermission` VALUES (35, 3, 25);
INSERT INTO `rolepermission` VALUES (36, 1, 26);
INSERT INTO `rolepermission` VALUES (37, 2, 26);

-- ----------------------------
-- Table structure for snackinfo
-- ----------------------------
DROP TABLE IF EXISTS `snackinfo`;
CREATE TABLE `snackinfo`  (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_price` double NULL DEFAULT NULL,
  `s_discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地',
  `s_Imported` int NULL DEFAULT NULL COMMENT '是否进口',
  `s_score` int NULL DEFAULT NULL COMMENT '积分',
  `s_pDate` date NULL DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保质期',
  `state` int NULL DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date NULL DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_number` int NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of snackinfo
-- ----------------------------
INSERT INTO `snackinfo` VALUES (20, '201803273550', '可乐', 10, '10', 'kele.jpg', '百事', '浙江', 1, NULL, '2018-03-15', '12', 1, '2018-03-27', '很好喝', '饮料类', 9980);
INSERT INTO `snackinfo` VALUES (21, '201803276547', '瓜子', 20, '9', 'guazi.jpg', '恰恰', '浙江', 1, NULL, '2018-03-24', '12', 1, '2018-03-27', '好吃的瓜子', '其他', 989999);
INSERT INTO `snackinfo` VALUES (23, '201803271694', '牛肉干', 100, '8', 'niurougan.jpg', '小辣椒', '浙江', 1, NULL, '2018-03-14', '12', 1, '2018-03-27', '好吃的牛肉干', '肉制类', 9991);
INSERT INTO `snackinfo` VALUES (24, '201803272746', '提拉米酥', 100, '5', 'tilamishu.jpg', '大本营', '浙江', 0, NULL, '2018-03-14', '12', 1, '2018-03-27', '好吃的提拉米酥', '膨化类', 9992);
INSERT INTO `snackinfo` VALUES (25, '201804174136', '咪咪', 10, '1', 'mimi.jpg', '咪咪', '广东', 0, NULL, '2018-04-15', '12', 1, '2018-04-17', '好吃的咪咪', '膨化类', 99998);
INSERT INTO `snackinfo` VALUES (26, '201804172196', '乐事薯片', 20, '8', 'leshishupian.jpg', '乐事', '上海', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '好吃的薯片', '膨化类', 9955);
INSERT INTO `snackinfo` VALUES (27, '201804171833', '黄金锅巴', 10, '7', 'huangjinguoba.jpg', '宇润', '安徽', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '好吃的锅巴', '膨化类', 9995);
INSERT INTO `snackinfo` VALUES (30, '201804172485', '炒米', 10, '8', 'chaomi.jpg', '甘源', '浙江', 1, NULL, '2018-04-17', '12', 1, '2018-04-17', '好吃的炒米', '膨化类', 9000);
INSERT INTO `snackinfo` VALUES (32, '201804174170', '妙妙果', 10, '10', 'miaomiaoguo.jpg', '妙妙', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的妙妙果', '膨化类', 9996);
INSERT INTO `snackinfo` VALUES (33, '201804173272', '虾味条', 20, '8', 'xiaweitiao.jpg', '旺旺', '浙江', 0, NULL, '2018-04-02', '12', 1, '2018-04-17', '好吃的虾味条', '膨化类', 119996);
INSERT INTO `snackinfo` VALUES (34, '201804175107', '糙米卷', 20, '6', 'chumijuan.jpg', '旺旺', '浙江', 1, NULL, '2018-04-05', '12', 1, '2018-04-17', '好吃的糙米卷', '膨化类', 102291);
INSERT INTO `snackinfo` VALUES (39, '201804178495', '山椒凤爪', 20, '10', 'shanjiaofengzhua.jpg', '旺旺', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的山椒凤爪', '肉制类', 19997);
INSERT INTO `snackinfo` VALUES (42, '201804177856', '小鸡腿', 20, '6', 'xiaojitui.jpg', '恰恰', '浙江', 0, NULL, '2018-04-11', '12', 1, '2018-04-17', '好吃的小鸡腿', '肉制类', 9999);
INSERT INTO `snackinfo` VALUES (45, '201804177197', '牛肉片', 30, '9', 'niuroupian.jpg', '旺旺', '浙江', 0, NULL, '2018-04-20', '12', 1, '2018-04-17', '好吃的牛肉片', '肉制类', 9997);
INSERT INTO `snackinfo` VALUES (51, '201804171818', '猪蹄', 30, '9', 'zhuti.jpg', '旺旺', '浙江', 0, NULL, '2018-04-13', '12', 1, '2018-04-17', '好吃的猪蹄', '肉制类', 9993);
INSERT INTO `snackinfo` VALUES (54, '201804176090', '拿铁咖啡', 30, '8', 'natiekafei.jpg', '旺旺', '浙江', 0, NULL, '2018-03-07', '12', 1, '2018-04-17', '好吃的拿铁咖啡', '饮料类', 9997);
INSERT INTO `snackinfo` VALUES (55, '201804177963', '啵乐乐', 10, '9', 'bolele.jpg', '旺旺', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的啵乐乐', '饮料类', 9998);
INSERT INTO `snackinfo` VALUES (56, '201804177044', '蜜柠水', 20, '6', 'miningshui.jpg', '旺旺', '浙江', 1, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的蜜柠水', '饮料类', 9999);
INSERT INTO `snackinfo` VALUES (58, '201804171125', '糖豆奶', 50, '9', 'tangdounai.jpg', '旺旺', '西藏', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的糖豆奶', '饮料类', 9999);
INSERT INTO `snackinfo` VALUES (62, '201804171606', '牛乳茶', 10, '8', 'niurucha.jpg', '旺旺', '浙江', 0, NULL, '2018-04-05', '12', 1, '2018-04-17', '好吃的牛乳茶', '饮料类', 9996);
INSERT INTO `snackinfo` VALUES (66, '201804177256', '椰汁', 20, '8', 'yezhi.jpg', '旺旺', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的椰汁', '饮料类', 9999);
INSERT INTO `snackinfo` VALUES (67, '201804177149', '牛奶果冻', 20, '8', 'niunaiguodong.jpg', '旺旺', '浙江', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '好吃的牛奶果冻', '其他', 9997);
INSERT INTO `snackinfo` VALUES (73, '201804174125', '布丁原味', 20, '8', 'budingyuanwei.jpg', '旺旺', '浙江', 0, NULL, '2018-04-17', '18', 1, '2018-04-17', '好吃的布丁原味', '其他', 10000);
INSERT INTO `snackinfo` VALUES (80, '201804173962', '秋葵', 10, '7', 'huamei.jpg', '旺旺', '浙江', 0, NULL, '2018-04-04', '12', 1, '2018-04-17', '好吃的秋葵', '其他', 9998);
INSERT INTO `snackinfo` VALUES (87, '202206299674', '皇马', 162, '3', 'FIFA22_ID2973nmOM.jpg', '英雄联盟', '湖南', 0, NULL, '2002-12-18', '10年', 1, '2022-06-29', '蒙多哪里都能去', '肉制类', 100);
INSERT INTO `snackinfo` VALUES (88, '202206296457', '蒙多', 199, '1', 'BitComet_vi0Glbd8kg.png', '英雄联盟', '湖南', 0, NULL, '2002-12-18', '10年', 1, '2022-06-29', '蒙多哪里都能去', '饮料类', 0);
INSERT INTO `snackinfo` VALUES (94, '202207059116', '红', 999, '8', '屏幕截图 2022-07-02 205122.png', 'Viper', '英格兰', 0, NULL, '2010-12-18', '20', 1, '2022-07-05', '红黄牌', '肉制类', 97);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date NULL DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `u_score` int NULL DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (22, '徐牛牛', 'xh666', 'xuhui666', '99999', '13719203555', '2027960078@qq.com', '男', '2022-06-26', '哈哈哈夜夜', NULL);

-- ----------------------------
-- Procedure structure for haha
-- ----------------------------
DROP PROCEDURE IF EXISTS `haha`;
delimiter ;;
CREATE PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for jk
-- ----------------------------
DROP PROCEDURE IF EXISTS `jk`;
delimiter ;;
CREATE PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
