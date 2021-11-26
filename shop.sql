/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 127.0.0.1:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 25/11/2021 18:57:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_classify
-- ----------------------------
DROP TABLE IF EXISTS `s_classify`;
CREATE TABLE `s_classify`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `is_show` tinyint(255) NULL DEFAULT 1 COMMENT '是否显示',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_classify
-- ----------------------------
INSERT INTO `s_classify` VALUES ('手机', 7, 1, 'logo_default.png');
INSERT INTO `s_classify` VALUES ('耳机', 8, 1, 'logo_default.png');
INSERT INTO `s_classify` VALUES ('电视', 9, 1, 'logo_default.png');
INSERT INTO `s_classify` VALUES ('男装', 10, 1, 'logo_default.png');
INSERT INTO `s_classify` VALUES ('食品', 11, 1, 'logo_default.png');

-- ----------------------------
-- Table structure for s_goods
-- ----------------------------
DROP TABLE IF EXISTS `s_goods`;
CREATE TABLE `s_goods`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(255) NULL DEFAULT NULL COMMENT '库存',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `classify_id` int(255) NULL DEFAULT NULL COMMENT '分类id',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_goods
-- ----------------------------
INSERT INTO `s_goods` VALUES (19, 'Redmi Note 11 Pro系列', 1799.00, 999, '202111181040111637203211716.jpg', 7, '* 120W 秒充仅 Redmi Note 11 Pro+ 版本支持；\r\n*“充满只需一刻钟”为手动开启快充加速模式下，小米实验室测试可达到最佳结果，\r\n实际数据受环境等客观因素影响稍有偏差。');
INSERT INTO `s_goods` VALUES (20, 'Xiaomi 11 Ultra', 5999.00, 999, '202111181042111637203331416.jpg', 7, '1/1.12\'\'GN2｜128°超广角｜120X超长焦｜2K四微曲屏｜骁龙888｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器');
INSERT INTO `s_goods` VALUES (21, 'Note 9 4G', 899.00, 99, '202111181044171637203457480.jpg', 7, '6000mAh超长续航｜4800万超清三摄｜全高清6.53英寸护眼屏｜骁龙662处理器｜18W快速充电｜立体声双扬声器｜侧边指纹识别｜90%高屏占比｜康宁大猩猩保护玻璃');
INSERT INTO `s_goods` VALUES (22, '小米真无线蓝牙耳机Air2 SE 白色', 129.00, 99, '202111181046171637203577738.jpg', 8, '20小时持久续航 / 双麦克风通话降噪，无惧干扰 / 开盒弹窗，智能连接看得到 / 智能真无线，自由随心 / 大尺寸动圈单元，听感浑厚自然 / 双耳同步传输，游戏影音更畅快');
INSERT INTO `s_goods` VALUES (23, 'Xiaomi 真无线降噪耳机 3 Pro 极光绿', 689.00, 20, '202111181047441637203664468.png', 8, '40dB自适应降噪 ｜空间音频 ｜ HiFi高保真音质 ｜27小时超长续航 人体工学舒适佩戴｜双重通透模式｜跨平台双设备连接');
INSERT INTO `s_goods` VALUES (24, '小米蓝牙耳机Line Free 灰色', 189.00, 30, '202111181049401637203780731.jpg', 8, 'aptX Adaptive低延迟模式 / 高通旗舰芯片 / 同轴双动圈单元 / 9小时长续航 / 疾速快充，充电10分钟，播放2.5小时');
INSERT INTO `s_goods` VALUES (25, 'Redmi MAX 86″ 超大屏电视', 7999.00, 19, '202111181051121637203872663.jpg', 9, '86″震撼大屏｜双 120Hz 高刷屏｜星幕锐影多分区背光｜杜比视界·全景声｜HDMI 2.1接口｜金属全面屏');
INSERT INTO `s_goods` VALUES (26, '小米电视 EA55 2022款 黑色', 2099.00, 99, '202111181052471637203967320.jpg', 9, '4K超高清画质/AI远场语音/Unibody金属全面屏/DTS音频解码');
INSERT INTO `s_goods` VALUES (27, 'Redmi智能电视A32 黑色', 699.00, 11, '202111181054231637204063323.jpg', 9, 'MIUI for TV 智能系统/立体声扬声器/64位处理器/1GB+8GB大存储');
INSERT INTO `s_goods` VALUES (28, '卫衣男TYAKASHA联名款 ', 99.00, 9, '202111181058231637204303758.jpg', 10, '秋冬恒温保暖男款时尚印图长袖男式卫衣');
INSERT INTO `s_goods` VALUES (29, '新款男子运动休闲圆领卫衣2021秋季冬季新款男卫衣', 328.00, 99, '202111181059201637204360086.jpg', 10, '新款男子运动休闲圆领卫衣2021秋季冬季新款男卫衣');
INSERT INTO `s_goods` VALUES (30, '21冬新款百搭经典款大logo圆领男款运动卫衣男套头衫', 229.00, 10, '20211118111391637204499576.jpg', 10, '21冬新款百搭经典款大logo圆领男款运动卫衣男套头衫');
INSERT INTO `s_goods` VALUES (31, '秋季男装新款圆领套头上衣刺绣印花男士韩版时尚卫衣', 45.00, 100, '202111181419211637216361214.jpg', 10, '秋季男装新款圆领套头上衣刺绣印花男士韩版时尚卫衣');
INSERT INTO `s_goods` VALUES (32, '正背面童趣猫咪印花时尚百搭休闲圆领套头男式卫衣', 79.00, 99, '202111181420261637216426597.jpg', 10, '【新疆棉】正背面童趣猫咪印花时尚百搭休闲圆领套头男式卫衣');
INSERT INTO `s_goods` VALUES (33, '卫衣男秋冬新品加绒加厚T恤百搭休闲时尚套头加绒圆领卫衣上衣男', 88.00, 88, '202111181421121637216472645.jpg', 10, '卫衣男秋冬新品加绒加厚T恤百搭休闲时尚套头加绒圆领卫衣上衣男');
INSERT INTO `s_goods` VALUES (34, '秋季新款时尚连帽套头衫潮ins印花上衣学生保暖加绒卫衣男', 72.90, 10, '202111181422131637216533289.jpg', 10, '秋季新款时尚连帽套头衫潮ins印花上衣学生保暖加绒卫衣男');
INSERT INTO `s_goods` VALUES (35, '乐品乐茶 毛尖茶叶绿茶2021新茶雨前特级嫩芽散装春茶礼盒装250g(125g*2罐)', 89.00, 99, '20211118142961637216946676.jpg', 11, '乐品乐茶 毛尖茶叶绿茶2021新茶雨前特级嫩芽散装春茶礼盒装250g(125g*2罐)');
INSERT INTO `s_goods` VALUES (36, '金龙鱼 东北大米 5kg 乳玉皇妃稻香贡米 大米 十斤', 99.90, 10, '202111181429591637216999296.jpg', 11, '金龙鱼 东北大米 5kg 乳玉皇妃稻香贡米 大米 十斤');
INSERT INTO `s_goods` VALUES (37, '三只松鼠坚果礼盒9袋装1720g 送礼火红A零食大礼包每日坚果碧根果核桃果干团购礼物', 139.00, 22, '202111181430471637217047653.jpg', 11, '三只松鼠坚果礼盒9袋装1720g 送礼火红A零食大礼包每日坚果碧根果核桃果干团购礼物');
INSERT INTO `s_goods` VALUES (38, '福临门 食用油 小榨炒香 压榨一级花生油（京东定制）6.18L 中粮出品 新老包装随机发货', 145.90, 999, '202111181432211637217141666.jpg', 11, '福临门 食用油 小榨炒香 压榨一级花生油（京东定制）6.18L 中粮出品 新老包装随机发货');
INSERT INTO `s_goods` VALUES (39, '源氏 老式大辣片 怀旧休闲零食小吃 京东超市豆腐干网红辣条儿时豆皮 200g', 8.90, 999, '202111181433251637217205665.jpg', 11, '源氏 老式大辣片 怀旧休闲零食小吃 京东超市豆腐干网红辣条儿时豆皮 200g');
INSERT INTO `s_goods` VALUES (40, '徐福记 小叭叭米格玛糙米卷 能量棒 粗粮夹心米果卷膨化食品饼干休闲零食品散装混合口味大礼包425g 囤货必备', 27.90, 30, '202111181434191637217259264.jpg', 11, '徐福记 小叭叭米格玛糙米卷 能量棒 粗粮夹心米果卷膨化食品饼干休闲零食品散装混合口味大礼包425g 囤货必备');
INSERT INTO `s_goods` VALUES (41, '格力高（glico）百力滋香脆饼干棒 早餐办公室下午茶香脆甜点休闲网红零食 6盒装', 33.90, 50, '202111181435541637217354378.jpg', 11, '格力高（glico）百力滋香脆饼干棒 早餐办公室下午茶香脆甜点休闲网红零食 6盒装');

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号类型（0：普通，1：管理员）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES (1, 'admin', '123456', '1517973****', '男', '1');
INSERT INTO `s_user` VALUES (3, 'xiaomei', '123456', '115', '男', '0');
INSERT INTO `s_user` VALUES (4, 'xiaom', '123456', '151000', '女', '1');
INSERT INTO `s_user` VALUES (5, 'xxx', '123', '123', '男', '1');
INSERT INTO `s_user` VALUES (6, 'aaa', '123', '123e', '女', '0');
INSERT INTO `s_user` VALUES (7, 'root', '123456', '123456', '女', '1');
INSERT INTO `s_user` VALUES (8, 'weibin', '123er', '123er', '男', '1');
INSERT INTO `s_user` VALUES (9, '1232r4', '12132re', '2e3re', '男', '1');
INSERT INTO `s_user` VALUES (10, 'dujin', '123456', '123', '男', '1');
INSERT INTO `s_user` VALUES (11, 'ngbfd', 'fewrbf', 'efwgegbf', '男', '1');
INSERT INTO `s_user` VALUES (12, '512305fr', 'grgeb', 'wgebg', '男', '1');
INSERT INTO `s_user` VALUES (13, 'fergb', 'gregb', 'rgeg', '女', '0');
INSERT INTO `s_user` VALUES (14, '123', '123', '323', '女', '0');
INSERT INTO `s_user` VALUES (15, 'gerfeg', 'hth', 'ht', '男', '1');
INSERT INTO `s_user` VALUES (16, '1234', '2134', '1234', '男', '1');
INSERT INTO `s_user` VALUES (17, 'fgbfgf', 'ewfreg', 'rgetr', '男', '1');
INSERT INTO `s_user` VALUES (18, 'qweqw', '1234', '1234', '男', '1');
INSERT INTO `s_user` VALUES (19, '12341234', '1234', '123', '男', '1');
INSERT INTO `s_user` VALUES (20, 'liaowbin', '123456', '12346', '男', '1');

SET FOREIGN_KEY_CHECKS = 1;
