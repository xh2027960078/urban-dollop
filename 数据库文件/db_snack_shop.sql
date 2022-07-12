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

 Date: 12/07/2022 11:31:56
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
INSERT INTO `admin` VALUES (1, 'xh666', 'xuhui666', 2);
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
INSERT INTO `order` VALUES (163, '202207125691', 22, 1, '2022-07-12', 1);
INSERT INTO `order` VALUES (164, '202207122509', 22, 2, '2022-07-12', 0);

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
INSERT INTO `orderdetail` VALUES (210, '202207125691', 97, 1, 16);
INSERT INTO `orderdetail` VALUES (211, '202207122509', 132, 2, 64);

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
INSERT INTO `receiptinfo` VALUES (216, '202207125691', '徐辉', '13719203558', '长沙市');
INSERT INTO `receiptinfo` VALUES (217, '202207125996', '徐辉', '13719203558', '中国北京海淀区上地十街10号百度大厦');
INSERT INTO `receiptinfo` VALUES (218, '202207122509', '徐辉', '13719203558', '中国北京海淀区上地十街10号百度大厦');

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
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (81, 97, '2022-07-12', 1);
INSERT INTO `record` VALUES (82, 132, '2022-07-12', 2);

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
  `s_pDate` date NULL DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保质期',
  `state` int NULL DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date NULL DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_number` int NULL DEFAULT NULL COMMENT '数量',
  `s_score` int NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of snackinfo
-- ----------------------------
INSERT INTO `snackinfo` VALUES (97, '202207128835', '培根', 20, '8', 'bacon_PNG10903.png', '荷美尔', '爱尔兰', 1, '2022-06-14', '6', 1, '2022-07-12', '培根又名烟肉（Bacon），是将猪肉经腌熏等加工的猪胸肉，或其他部位的肉熏制而成。烟肉一般被认为是早餐的头盘，将之切成薄片，放在锅子里烤或用油煎。烟肉味道极好，常用作为烹调，烟肉被视为肥胖的主要来源，但因为美国推出了低碳水化合物减肥法，烟肉致肥的观点渐渐改变', '肉制类', 499, NULL);
INSERT INTO `snackinfo` VALUES (98, '202207124291', '口香糖', 10, '5', 'chewing_gum_PNG39.png', '大大', '湖南', 0, '2022-06-13', '12', 1, '2022-07-12', '口香糖是以天然树胶或甘油树脂为胶体的基础，加入糖浆、薄荷、甜味剂等调和压制而成的一种供人们放入口中嚼咬的糖。是很受世界人民喜爱的一种糖类。既可吃又可玩，深受儿童和青年人喜爱。同时也成为大部分年轻人的扮酷、时尚的新宠。在提升口腔健康的同时，通过咀嚼口香糖带来的面部肌肉运动，在认知学领域也具有多重功效', '其他', 999, NULL);
INSERT INTO `snackinfo` VALUES (99, '202207124146', '可口可乐', 3, '', 'kele.jpg', '中粮', '上海', 0, '2022-07-09', '12', 1, '2022-07-12', '畅爽好喝，让此刻更带劲', '饮料类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (100, '202207126868', '赌神同款巧克力', 10, '8', 'chocolate_PNG97211.png', '德芙', '湖南', 0, '2022-06-13', '6', 1, '2022-07-12', '赌神周润发同款的巧克力', '其他', 100, NULL);
INSERT INTO `snackinfo` VALUES (102, '202207125056', '爆米花', 10, 'null', 'popcorn_PNG40.png', '', '湖南', 0, '2022-06-17', '1', 1, '2022-07-12', '现爆现卖才是最香', '膨化类', 100, NULL);
INSERT INTO `snackinfo` VALUES (103, '202207128829', '红牛', 8, '5', 'red_bull_PNG27.png', '红牛', '湖南', 0, '2022-07-13', '6', 1, '2022-07-12', '你真牛，红牛挺你', '饮料类', 500, NULL);
INSERT INTO `snackinfo` VALUES (104, '202207127838', '蓝莓酸奶', 10, '8', 'yogurt_PNG15213.png', '蓝莓', '湖南', 0, '2022-07-15', '6', 1, '2022-07-12', '酸酸甜甜才健康', '饮料类', 100, NULL);
INSERT INTO `snackinfo` VALUES (105, '202207126443', '吐司', 10, '5', 'toast_PNG116.png', '贼顶饱', '湖南', 0, '2022-07-09', '6', 1, '2022-07-12', '吐司，是英文toast的音译，粤语（广东话）叫多士，实际上就是用长方形带盖或不带盖的烤听制作的听型面包。 用带盖烤听烤出的面包经切片后呈正方形，夹入火腿或蔬菜后即为三明治。用不带盖烤听烤出的面包为长方圆顶形，类似长方形大面包', '其他', 500, NULL);
INSERT INTO `snackinfo` VALUES (106, '202207128633', '雪碧', 4, '', 'sprite_PNG8928.png', '中粮', '湖南', 0, '2022-06-14', '12', 1, '2022-07-12', '「雪碧」汽水产品与可口可乐公司的其他饮料产品齐头并进，如今已经成为美国发展速度领先的主要非酒精饮料产品之一，并且是全球深受青睐的柠檬味汽水非酒精饮料产品之一', '饮料类', 999, NULL);
INSERT INTO `snackinfo` VALUES (107, '202207125282', '芬达', 4, 'null', 'fanta_PNG63.png', '中粮', '湖南', 0, '2022-07-09', '12', 1, '2022-07-12', '芬达（Fanta）是1955年可口可乐公司在意大利推出的一款橙味汽水。芬达拥有橙、苹果、葡萄、青柠、芒果、水蜜桃、菠萝、西瓜、草莓，茉莉蜜桃等口味', '饮料类', 999, NULL);
INSERT INTO `snackinfo` VALUES (108, '202207124180', '薯片', 10, '8', 'doritos_PNG52.png', '多力多滋', '美国', 1, '2022-07-14', '12', 1, '2022-07-12', '多力多滋是百事公司旗下零食品牌。 [1]  “多力多滋”全国上市于1966年，在美国全国推出的第一个玉米饼薯片', '膨化类', 100, NULL);
INSERT INTO `snackinfo` VALUES (109, '202207124316', '薯片', 10, '', 'potato_chips_PNG4.png', '乐事', '湖南', 0, '2022-06-14', '12', 1, '2022-07-12', '乐事（Lay\'s）是美国的薯片品牌，创立于1932年，自1965年起成为百事旗下产品。 乐事品牌在不同国家有不同的名称表述，英国和爱尔兰称为Walkers，埃及称为Chipsy，越南称为Poca，以色列称为Tapuchips', '膨化类', 500, NULL);
INSERT INTO `snackinfo` VALUES (110, '202207122413', '烤鸡翅', 7, '', 'grilled-spicy-chicken-wings-ketchup-260nw-1678801786.jpg', '肉肉', '湖南', 0, '2022-07-11', '1', 1, '2022-07-12', '年轻人，网络，好奇心，价格便宜，促成了烤鸡翅的火爆。火爆得有点过火，有可能的确是搂不住了，也有可能是自己搓火。要说成功，也真的不能说是烤鸡翅的美味，有很多甚至味道赶不上洋快餐中的奥尔良烤翅，这只能说是营销与包装策划上的成功，尽管是有点无心插柳的感觉', '肉制类', 100, NULL);
INSERT INTO `snackinfo` VALUES (111, '202207123645', '开心果', 10, '7', 'pistachios-3223610__480.jpg', '干货', '湖南', 0, '2022-07-09', '6', 1, '2022-07-12', '开心果是世界四大干果之一，也是中国新疆喀什地区特有的珍贵木本油料、干果、药用等多种用途的经济树种，果实富含维生素、矿物质和抗氧化元素，具有低脂肪、低卡路里、高纤维的显著特点，对心脑血管疾病、老年性视网膜病变、防衰老等具有医疗保健功效，是世界坚果市场十分畅销的保健休闲食品', '其他', 500, NULL);
INSERT INTO `snackinfo` VALUES (112, '202207126312', '烤鸡腿', 10, '8', 'thigh-3423122__340.jpg', '肉肉', '湖南', 0, '2022-07-14', '12', 1, '2022-07-12', '鸡腿是餐桌上的一道美味，制作原料主要有棒棒腿、柠檬、酱油、酒、孜然、辣椒粉等，因其肉质鲜嫩，酱香味道而深受欢迎', '肉制类', 500, NULL);
INSERT INTO `snackinfo` VALUES (113, '202207124468', '美味锅巴', 1, '', '5aa686e71e5562d6.jpg', '狗牙儿', '湖南', 0, '2022-05-14', '12', 1, '2022-07-12', '香香辣辣的锅巴', '膨化类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (114, '202207125505', '红糖小麻花', 12, '8', 'f1af3eb3efe3b459.jpg', '惠寻', '山东', 0, '2022-07-09', '6', 1, '2022-07-12', '甜甜酥酥的小麻花', '膨化类', 500, NULL);
INSERT INTO `snackinfo` VALUES (115, '202207129527', '蒜香味花生', 10, '8', '5240676272d6d715.jpg', '比比赞', '湖南', 0, '2022-06-14', '6', 1, '2022-07-12', '蒜香味的炒花生', '其他', 500, NULL);
INSERT INTO `snackinfo` VALUES (116, '202207128083', '小卤蛋', 8, '5', '0a100fb9ec171759.jpg', '百草味', '湖南', 0, '2022-07-09', '6', 1, '2022-07-12', '小阿Giao最喜欢的小卤蛋', '肉制类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (117, '202207121025', '果冻', 10, '8', '7d86112f372e8d35.jpg', '喜之郎', '湖南', 0, '2022-06-19', '12', 1, '2022-07-12', '太空人都爱吃的喜之郎小果冻', '其他', 999, NULL);
INSERT INTO `snackinfo` VALUES (118, '202207121781', '南瓜酥', 10, '7', '5b59ef979b2a23c6.jpg', '百草味', '上海', 0, '2022-07-09', '6', 1, '2022-07-12', '南瓜酥', '膨化类', 999, NULL);
INSERT INTO `snackinfo` VALUES (119, '202207124298', '米格玛', 20, '5', 'edb9811295b8b1cc.jpg', '徐福记', '湖南', 0, '2022-06-15', '12', 1, '2022-07-12', '徐福记米格玛糙米卷', '膨化类', 999, NULL);
INSERT INTO `snackinfo` VALUES (120, '202207124095', '棒棒冰', 10, '8', '03610aa56ed8a5e8.jpg', '旺旺', '湖南', 0, '2022-07-14', '12', 1, '2022-07-12', '旺旺棒棒冰', '饮料类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (121, '202207125163', '大象苏打水', 80, '8', '6aacc0fe65a38cbb.jpg', '三麟', '泰国', 1, '2022-07-05', '12', 1, '2022-07-12', '三麟泰国进口苏打水', '饮料类', 100, NULL);
INSERT INTO `snackinfo` VALUES (122, '202207121981', '纯肉零食大礼包', 20, '8', 'd10a8e6682797ebd.jpg', '盐津铺子', '湖南', 0, '2022-06-17', '12', 1, '2022-07-12', '从上到下全是肉', '肉制类', 999, NULL);
INSERT INTO `snackinfo` VALUES (123, '202207122047', '壮汉山泉', 40, '8', '0797f23ddad97db8.jpg', '农夫山泉', '长白山', 0, '2022-07-14', '12', 1, '2022-07-12', '农夫山泉PLUS', '饮料类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (124, '202207121904', '麻辣王子', 30, '5', '224edfae1936f460.jpg', '麻辣王子', '湖南', 0, '2022-07-08', '12', 1, '2022-07-12', '够辣才过瘾', '肉制类', 999, NULL);
INSERT INTO `snackinfo` VALUES (125, '202207127369', '山药脆片', 10, '8', 'f936e2cdfc7ecc20.jpg', '良品铺子', '湖南', 0, '2022-06-17', '12', 1, '2022-07-12', '山药片脆脆的', '膨化类', 999, NULL);
INSERT INTO `snackinfo` VALUES (126, '202207129442', '金典有机奶', 70, '8', 'd605fd53c8ca3e04.jpg', '金典', '内蒙古', 0, '2022-07-14', '6', 1, '2022-07-12', '每天一杯奶，强壮中国人', '饮料类', 500, NULL);
INSERT INTO `snackinfo` VALUES (127, '202207129103', '卫龙亲嘴烧', 10, '8', '51a64dab0cdb2d47.jpg', '卫龙', '湖南', 0, '2022-07-03', '12', 1, '2022-07-12', '亲嘴烧', '其他', 500, NULL);
INSERT INTO `snackinfo` VALUES (128, '202207121530', '王老吉', 70, '8', 'af4e34e3d98870e5.jpg', '王老吉', '湖南', 0, '2022-07-09', '12', 1, '2022-07-12', '红罐王老吉', '饮料类', 999, NULL);
INSERT INTO `snackinfo` VALUES (129, '202207127570', '鳕鱼肠', 19.9, '', 'c7775bce7fc220ce.jpg', '窝小芽', '广州', 0, '2022-06-19', '6', 1, '2022-07-12', '都是新鲜的鳕鱼制作而成', '肉制类', 999, NULL);
INSERT INTO `snackinfo` VALUES (130, '202207128389', '卧龙手工大锅巴', 16, '8', 'ce0db340e8ff7e53.jpg', '卧龙', '湖南', 0, '2022-05-09', '12', 1, '2022-07-12', '卧龙大侠锅巴', '肉制类', 999, NULL);
INSERT INTO `snackinfo` VALUES (131, '202207129763', '乐事香芋片', 7.7, '', '141ab0b7bb7ed452.jpg', '乐事', '上海', 0, '2022-06-14', '12', 1, '2022-07-12', '脆脆的香芋炸片', '膨化类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (132, '202207123001', '纯甄酸奶', 80, '8', '1d07ae2aa6606465.jpg', '纯甄', '内蒙古', 0, '2022-07-07', '12', 1, '2022-07-12', '一口纯甄，回归纯与真', '饮料类', 498, NULL);
INSERT INTO `snackinfo` VALUES (133, '202207127984', '椰树牌椰汁', 15, '', '20a65ea75e5ba296.jpg', '椰树', '海南', 0, '2022-07-10', '12', 1, '2022-07-12', '我从小喝到大', '饮料类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (134, '202207127768', '卫龙78度早餐蛋', 50, '8', 'ea6a196afc8e0e18.jpg', '卫龙', '湖南', 0, '2022-07-09', '12', 1, '2022-07-12', '大大的蛋', '肉制类', 999, NULL);
INSERT INTO `snackinfo` VALUES (135, '202207129951', '龟苓膏', 30, '8', '95428f97a42ef5ea.jpg', '双钱', '云南', 0, '2022-07-05', '12', 1, '2022-07-12', '双钱牌龟苓膏，好吃又健康', '饮料类', 999, NULL);
INSERT INTO `snackinfo` VALUES (136, '202207127165', '旺旺小小酥', 12, '8', '5ab9bfcaNc9d4389d.jpg', '旺旺', '湖南', 0, '2022-07-09', '6', 1, '2022-07-12', '酥酥酥', '膨化类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (137, '202207122225', '甜甜乐星球杯', 15, '', '04c5723b96d7566c.jpg', '甜甜乐', '上海', 0, '2022-07-14', '12', 1, '2022-07-12', '甜甜乐星球杯', '其他', 100, NULL);
INSERT INTO `snackinfo` VALUES (138, '202207124194', '美好时光海苔', 50, '8', 'e7e349d53f8facff.jpg', '美好时光', '海南', 0, '2022-06-15', '12', 1, '2022-07-12', '海苔就要美好时光', '其他', 1000, NULL);
INSERT INTO `snackinfo` VALUES (139, '202207121063', '猫耳朵', 10, '8', '4ee21f77b9eb9c87.jpg', '惠寻', '上海', 0, '2022-07-03', '12', 1, '2022-07-12', '酥酥的猫耳朵', '膨化类', 1000, NULL);
INSERT INTO `snackinfo` VALUES (140, '202207126078', '花花肠', 20, '8', '37c6cad5483f99ca.jpg', '金磨坊', '湖南', 0, '2022-04-19', '12', 1, '2022-07-12', '全是花花肠子', '肉制类', 100, NULL);

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
INSERT INTO `userinfo` VALUES (22, '徐牛牛', 'xh666', 'xuhui666', '99764.0', '13719203555', '2027960078@qq.com', '男', '2022-06-26', '中国北京海淀区上地十街10号百度大厦', NULL);

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
