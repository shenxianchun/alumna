/*
Navicat MySQL Data Transfer

Source Server         : mysql56
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : alumna

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-05-29 16:11:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`uid`),
  CONSTRAINT `aid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '1', '相册名', '相册描述', '2017-05-22 10:12:15');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provice` int(11) NOT NULL DEFAULT '0',
  `cityname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('100', '0', '安徽');
INSERT INTO `city` VALUES ('101', '100', '合肥');
INSERT INTO `city` VALUES ('102', '100', '安庆');
INSERT INTO `city` VALUES ('103', '100', '毫州');
INSERT INTO `city` VALUES ('104', '100', '蚌埠');
INSERT INTO `city` VALUES ('105', '100', '滁州');
INSERT INTO `city` VALUES ('106', '100', '巢湖');
INSERT INTO `city` VALUES ('107', '100', '池州');
INSERT INTO `city` VALUES ('108', '100', '阜阳');
INSERT INTO `city` VALUES ('109', '100', '淮北');
INSERT INTO `city` VALUES ('110', '100', '淮南');
INSERT INTO `city` VALUES ('111', '100', '黄山站');
INSERT INTO `city` VALUES ('112', '100', '六安');
INSERT INTO `city` VALUES ('113', '100', '马鞍山');
INSERT INTO `city` VALUES ('114', '100', '宿州');
INSERT INTO `city` VALUES ('115', '100', '铜陵');
INSERT INTO `city` VALUES ('116', '100', '芜湖');
INSERT INTO `city` VALUES ('117', '100', '宣城');
INSERT INTO `city` VALUES ('200', '0', '澳门');
INSERT INTO `city` VALUES ('300', '0', '北京');
INSERT INTO `city` VALUES ('400', '0', '重庆');
INSERT INTO `city` VALUES ('500', '0', '福建');
INSERT INTO `city` VALUES ('501', '500', '福州');
INSERT INTO `city` VALUES ('502', '500', '龙岩');
INSERT INTO `city` VALUES ('503', '500', '南平');
INSERT INTO `city` VALUES ('504', '500', '宁德');
INSERT INTO `city` VALUES ('505', '500', '莆田');
INSERT INTO `city` VALUES ('506', '500', '泉州');
INSERT INTO `city` VALUES ('507', '500', '三明');
INSERT INTO `city` VALUES ('508', '500', '厦门');
INSERT INTO `city` VALUES ('509', '500', '漳州');
INSERT INTO `city` VALUES ('600', '0', '甘肃');
INSERT INTO `city` VALUES ('601', '600', '兰州');
INSERT INTO `city` VALUES ('602', '600', '白银');
INSERT INTO `city` VALUES ('603', '600', '定西');
INSERT INTO `city` VALUES ('604', '600', '合作');
INSERT INTO `city` VALUES ('605', '600', '金昌');
INSERT INTO `city` VALUES ('606', '600', '酒泉');
INSERT INTO `city` VALUES ('607', '600', '嘉峪关');
INSERT INTO `city` VALUES ('608', '600', '临夏');
INSERT INTO `city` VALUES ('609', '600', '平凉');
INSERT INTO `city` VALUES ('610', '600', '庆阳');
INSERT INTO `city` VALUES ('611', '600', '天水');
INSERT INTO `city` VALUES ('612', '600', '武威');
INSERT INTO `city` VALUES ('613', '600', '武都');
INSERT INTO `city` VALUES ('614', '600', '张掖');
INSERT INTO `city` VALUES ('700', '0', '广东');
INSERT INTO `city` VALUES ('701', '700', '广州');
INSERT INTO `city` VALUES ('702', '700', '潮州');
INSERT INTO `city` VALUES ('703', '700', '东莞');
INSERT INTO `city` VALUES ('704', '700', '佛山');
INSERT INTO `city` VALUES ('705', '700', '河源');
INSERT INTO `city` VALUES ('706', '700', '惠州');
INSERT INTO `city` VALUES ('707', '700', '江门');
INSERT INTO `city` VALUES ('708', '700', '揭阳');
INSERT INTO `city` VALUES ('709', '700', '梅州');
INSERT INTO `city` VALUES ('710', '700', '茂名');
INSERT INTO `city` VALUES ('711', '700', '清远');
INSERT INTO `city` VALUES ('712', '700', '深圳');
INSERT INTO `city` VALUES ('713', '700', '汕头');
INSERT INTO `city` VALUES ('714', '700', '韶关');
INSERT INTO `city` VALUES ('715', '700', '汕尾');
INSERT INTO `city` VALUES ('716', '700', '阳江');
INSERT INTO `city` VALUES ('717', '700', '云浮');
INSERT INTO `city` VALUES ('718', '700', '珠海');
INSERT INTO `city` VALUES ('719', '700', '中山');
INSERT INTO `city` VALUES ('720', '700', '湛江');
INSERT INTO `city` VALUES ('721', '700', '肇庆');
INSERT INTO `city` VALUES ('800', '0', '广西');
INSERT INTO `city` VALUES ('801', '800', '南宁');
INSERT INTO `city` VALUES ('802', '800', '北海');
INSERT INTO `city` VALUES ('803', '800', '白色');
INSERT INTO `city` VALUES ('804', '800', '崇左');
INSERT INTO `city` VALUES ('805', '800', '防城港');
INSERT INTO `city` VALUES ('806', '800', '桂林');
INSERT INTO `city` VALUES ('807', '800', '贵港');
INSERT INTO `city` VALUES ('808', '800', '贺州');
INSERT INTO `city` VALUES ('809', '800', '河池');
INSERT INTO `city` VALUES ('810', '800', '柳州');
INSERT INTO `city` VALUES ('811', '800', '来宾');
INSERT INTO `city` VALUES ('812', '800', '钦州');
INSERT INTO `city` VALUES ('813', '800', '梧州');
INSERT INTO `city` VALUES ('814', '800', '玉林');
INSERT INTO `city` VALUES ('900', '0', '贵州');
INSERT INTO `city` VALUES ('901', '900', '贵阳');
INSERT INTO `city` VALUES ('902', '900', '安顺');
INSERT INTO `city` VALUES ('903', '900', '毕节');
INSERT INTO `city` VALUES ('904', '900', '都匀');
INSERT INTO `city` VALUES ('905', '900', '凯里');
INSERT INTO `city` VALUES ('906', '900', '六盘水');
INSERT INTO `city` VALUES ('907', '900', '晴隆');
INSERT INTO `city` VALUES ('908', '900', '铜仁');
INSERT INTO `city` VALUES ('909', '900', '兴义');
INSERT INTO `city` VALUES ('910', '900', '遵义');
INSERT INTO `city` VALUES ('1000', '0', '海南');
INSERT INTO `city` VALUES ('1001', '1000', '海口');
INSERT INTO `city` VALUES ('1002', '1000', '白沙');
INSERT INTO `city` VALUES ('1003', '1000', '保亭');
INSERT INTO `city` VALUES ('1004', '1000', '澄迈');
INSERT INTO `city` VALUES ('1005', '1000', '昌江');
INSERT INTO `city` VALUES ('1006', '1000', '儋州');
INSERT INTO `city` VALUES ('1007', '1000', '定安');
INSERT INTO `city` VALUES ('1008', '1000', '东方');
INSERT INTO `city` VALUES ('1009', '1000', '临高');
INSERT INTO `city` VALUES ('1010', '1000', '陵水');
INSERT INTO `city` VALUES ('1011', '1000', '乐东');
INSERT INTO `city` VALUES ('1012', '1000', '南沙岛');
INSERT INTO `city` VALUES ('1013', '1000', '琼海');
INSERT INTO `city` VALUES ('1014', '1000', '琼中');
INSERT INTO `city` VALUES ('1015', '1000', '三亚');
INSERT INTO `city` VALUES ('1016', '1000', '屯昌');
INSERT INTO `city` VALUES ('1017', '1000', '五指山');
INSERT INTO `city` VALUES ('1018', '1000', '文昌');
INSERT INTO `city` VALUES ('1019', '1000', '万宁');
INSERT INTO `city` VALUES ('1020', '1000', '西沙');
INSERT INTO `city` VALUES ('1100', '0', '河北');
INSERT INTO `city` VALUES ('1101', '1100', '石家庄');
INSERT INTO `city` VALUES ('1102', '1100', '保定');
INSERT INTO `city` VALUES ('1103', '1100', '承德');
INSERT INTO `city` VALUES ('1104', '1100', '沧州');
INSERT INTO `city` VALUES ('1105', '1100', '衡水');
INSERT INTO `city` VALUES ('1106', '1100', '邯郸');
INSERT INTO `city` VALUES ('1107', '1100', '廊坊');
INSERT INTO `city` VALUES ('1108', '1100', '秦皇岛');
INSERT INTO `city` VALUES ('1109', '1100', '唐山');
INSERT INTO `city` VALUES ('1110', '1100', '邢台');
INSERT INTO `city` VALUES ('1111', '1100', '张家口');
INSERT INTO `city` VALUES ('1200', '0', '河南');
INSERT INTO `city` VALUES ('1201', '1200', '郑州');
INSERT INTO `city` VALUES ('1202', '1200', '安阳');
INSERT INTO `city` VALUES ('1203', '1200', '鹤壁');
INSERT INTO `city` VALUES ('1204', '1200', '焦作');
INSERT INTO `city` VALUES ('1205', '1200', '济源');
INSERT INTO `city` VALUES ('1206', '1200', '开封');
INSERT INTO `city` VALUES ('1207', '1200', '洛阳');
INSERT INTO `city` VALUES ('1208', '1200', '漯河');
INSERT INTO `city` VALUES ('1209', '1200', '南阳');
INSERT INTO `city` VALUES ('1210', '1200', '濮阳');
INSERT INTO `city` VALUES ('1211', '1200', '平顶山');
INSERT INTO `city` VALUES ('1212', '1200', '三门峡');
INSERT INTO `city` VALUES ('1213', '1200', '商丘');
INSERT INTO `city` VALUES ('1214', '1200', '新乡');
INSERT INTO `city` VALUES ('1215', '1200', '许昌');
INSERT INTO `city` VALUES ('1216', '1200', '信阳');
INSERT INTO `city` VALUES ('1217', '1200', '周口');
INSERT INTO `city` VALUES ('1218', '1200', '驻马店');
INSERT INTO `city` VALUES ('1300', '0', '黑龙江');
INSERT INTO `city` VALUES ('1301', '1300', '哈尔滨');
INSERT INTO `city` VALUES ('1302', '1300', '大庆');
INSERT INTO `city` VALUES ('1303', '1300', '大兴安岭');
INSERT INTO `city` VALUES ('1304', '1300', '鹤岗');
INSERT INTO `city` VALUES ('1305', '1300', '黑河');
INSERT INTO `city` VALUES ('1306', '1300', '佳木斯');
INSERT INTO `city` VALUES ('1307', '1300', '鸡西');
INSERT INTO `city` VALUES ('1308', '1300', '牡丹江');
INSERT INTO `city` VALUES ('1309', '1300', '齐齐哈尔');
INSERT INTO `city` VALUES ('1310', '1300', '七台河');
INSERT INTO `city` VALUES ('1311', '1300', '双鸭山');
INSERT INTO `city` VALUES ('1312', '1300', '绥化');
INSERT INTO `city` VALUES ('1313', '1300', '伊春');
INSERT INTO `city` VALUES ('1400', '0', '湖北');
INSERT INTO `city` VALUES ('1401', '1400', '武汉');
INSERT INTO `city` VALUES ('1402', '1400', '鄂州');
INSERT INTO `city` VALUES ('1403', '1400', '恩施');
INSERT INTO `city` VALUES ('1404', '1400', '黄石');
INSERT INTO `city` VALUES ('1405', '1400', '黄冈');
INSERT INTO `city` VALUES ('1406', '1400', '荆州');
INSERT INTO `city` VALUES ('1407', '1400', '荆门');
INSERT INTO `city` VALUES ('1408', '1400', '潜江');
INSERT INTO `city` VALUES ('1409', '1400', '十堰');
INSERT INTO `city` VALUES ('1410', '1400', '随州');
INSERT INTO `city` VALUES ('1411', '1400', '神农架');
INSERT INTO `city` VALUES ('1412', '1400', '天门');
INSERT INTO `city` VALUES ('1413', '1400', '襄阳');
INSERT INTO `city` VALUES ('1414', '1400', '孝感');
INSERT INTO `city` VALUES ('1415', '1400', '咸宁');
INSERT INTO `city` VALUES ('1416', '1400', '仙桃');
INSERT INTO `city` VALUES ('1417', '1400', '宜昌');
INSERT INTO `city` VALUES ('1500', '0', '湖南');
INSERT INTO `city` VALUES ('1501', '1500', '长沙');
INSERT INTO `city` VALUES ('1502', '1500', '常德');
INSERT INTO `city` VALUES ('1503', '1500', '郴州');
INSERT INTO `city` VALUES ('1504', '1500', '衡阳');
INSERT INTO `city` VALUES ('1505', '1500', '怀化');
INSERT INTO `city` VALUES ('1506', '1500', '吉首');
INSERT INTO `city` VALUES ('1507', '1500', '娄底');
INSERT INTO `city` VALUES ('1508', '1500', '黔阳');
INSERT INTO `city` VALUES ('1509', '1500', '邵阳');
INSERT INTO `city` VALUES ('1510', '1500', '湘潭');
INSERT INTO `city` VALUES ('1511', '1500', '岳阳');
INSERT INTO `city` VALUES ('1512', '1500', '益阳');
INSERT INTO `city` VALUES ('1513', '1500', '永州');
INSERT INTO `city` VALUES ('1514', '1500', '株洲');
INSERT INTO `city` VALUES ('1515', '1500', '张家界');
INSERT INTO `city` VALUES ('1600', '0', '吉林');
INSERT INTO `city` VALUES ('1601', '1600', '长春');
INSERT INTO `city` VALUES ('1602', '1600', '白山');
INSERT INTO `city` VALUES ('1603', '1600', '白城');
INSERT INTO `city` VALUES ('1604', '1600', '吉林');
INSERT INTO `city` VALUES ('1605', '1600', '辽源');
INSERT INTO `city` VALUES ('1606', '1600', '四平');
INSERT INTO `city` VALUES ('1607', '1600', '松原');
INSERT INTO `city` VALUES ('1608', '1600', '通化');
INSERT INTO `city` VALUES ('1609', '1600', '延吉');
INSERT INTO `city` VALUES ('1700', '0', '江苏');
INSERT INTO `city` VALUES ('1701', '1700', '南京');
INSERT INTO `city` VALUES ('1702', '1700', '常州');
INSERT INTO `city` VALUES ('1703', '1700', '淮安');
INSERT INTO `city` VALUES ('1704', '1700', '连云港');
INSERT INTO `city` VALUES ('1705', '1700', '南通');
INSERT INTO `city` VALUES ('1706', '1700', '苏州');
INSERT INTO `city` VALUES ('1707', '1700', '宿迁');
INSERT INTO `city` VALUES ('1708', '1700', '秦州');
INSERT INTO `city` VALUES ('1709', '1700', '无锡');
INSERT INTO `city` VALUES ('1710', '1700', '徐州');
INSERT INTO `city` VALUES ('1711', '1700', '盐城');
INSERT INTO `city` VALUES ('1712', '1700', '扬州');
INSERT INTO `city` VALUES ('1713', '1700', '镇江');
INSERT INTO `city` VALUES ('1800', '0', '江西');
INSERT INTO `city` VALUES ('1801', '1800', '南昌');
INSERT INTO `city` VALUES ('1802', '1800', '抚州');
INSERT INTO `city` VALUES ('1803', '1800', '赣州');
INSERT INTO `city` VALUES ('1804', '1800', '九江');
INSERT INTO `city` VALUES ('1805', '1800', '景德镇');
INSERT INTO `city` VALUES ('1806', '1800', '吉安');
INSERT INTO `city` VALUES ('1807', '1800', '萍乡');
INSERT INTO `city` VALUES ('1808', '1800', '上饶');
INSERT INTO `city` VALUES ('1809', '1800', '新余');
INSERT INTO `city` VALUES ('1810', '1800', '鹰潭');
INSERT INTO `city` VALUES ('1811', '1800', '宜春');
INSERT INTO `city` VALUES ('1900', '0', '辽宁');
INSERT INTO `city` VALUES ('1901', '1900', '沈阳');
INSERT INTO `city` VALUES ('1902', '1900', '鞍山');
INSERT INTO `city` VALUES ('1903', '1900', '本溪');
INSERT INTO `city` VALUES ('1904', '1900', '朝阳');
INSERT INTO `city` VALUES ('1905', '1900', '大连');
INSERT INTO `city` VALUES ('1906', '1900', '丹东');
INSERT INTO `city` VALUES ('1907', '1900', '抚顺');
INSERT INTO `city` VALUES ('1908', '1900', '阜新');
INSERT INTO `city` VALUES ('1909', '1900', '葫芦岛');
INSERT INTO `city` VALUES ('1910', '1900', '锦州');
INSERT INTO `city` VALUES ('1911', '1900', '辽阳');
INSERT INTO `city` VALUES ('1912', '1900', '盘锦');
INSERT INTO `city` VALUES ('1913', '1900', '铁岭');
INSERT INTO `city` VALUES ('1914', '1900', '营口');
INSERT INTO `city` VALUES ('2000', '0', '内蒙古');
INSERT INTO `city` VALUES ('2001', '2000', '呼和浩特');
INSERT INTO `city` VALUES ('2002', '2000', '阿拉善左旗');
INSERT INTO `city` VALUES ('2003', '2000', '包头');
INSERT INTO `city` VALUES ('2004', '2000', '赤峰');
INSERT INTO `city` VALUES ('2005', '2000', '鄂尔多斯');
INSERT INTO `city` VALUES ('2006', '2000', '呼伦贝尔');
INSERT INTO `city` VALUES ('2007', '2000', '集宁');
INSERT INTO `city` VALUES ('2008', '2000', '临河');
INSERT INTO `city` VALUES ('2009', '2000', '通辽');
INSERT INTO `city` VALUES ('2010', '2000', '乌兰浩特');
INSERT INTO `city` VALUES ('2011', '2000', '乌海');
INSERT INTO `city` VALUES ('2012', '2000', '锡林浩特');
INSERT INTO `city` VALUES ('2100', '0', '宁夏');
INSERT INTO `city` VALUES ('2101', '2100', '银川');
INSERT INTO `city` VALUES ('2102', '2100', '固原');
INSERT INTO `city` VALUES ('2103', '2100', '石嘴山');
INSERT INTO `city` VALUES ('2104', '2100', '吴忠');
INSERT INTO `city` VALUES ('2105', '2100', '中卫');
INSERT INTO `city` VALUES ('2200', '0', '青海');
INSERT INTO `city` VALUES ('2201', '2200', '西宁');
INSERT INTO `city` VALUES ('2202', '2200', '果洛');
INSERT INTO `city` VALUES ('2203', '2200', '海东');
INSERT INTO `city` VALUES ('2204', '2200', '海南');
INSERT INTO `city` VALUES ('2205', '2200', '海北');
INSERT INTO `city` VALUES ('2206', '2200', '海西');
INSERT INTO `city` VALUES ('2207', '2200', '黄南');
INSERT INTO `city` VALUES ('2208', '2200', '玉树');
INSERT INTO `city` VALUES ('2300', '0', '山东');
INSERT INTO `city` VALUES ('2301', '2300', '济南');
INSERT INTO `city` VALUES ('2302', '2300', '滨州');
INSERT INTO `city` VALUES ('2303', '2300', '东营');
INSERT INTO `city` VALUES ('2304', '2300', '德州');
INSERT INTO `city` VALUES ('2305', '2300', '菏泽');
INSERT INTO `city` VALUES ('2306', '2300', '济宁');
INSERT INTO `city` VALUES ('2307', '2300', '莱芜');
INSERT INTO `city` VALUES ('2308', '2300', '临沂');
INSERT INTO `city` VALUES ('2309', '2300', '聊城');
INSERT INTO `city` VALUES ('2310', '2300', '青岛');
INSERT INTO `city` VALUES ('2311', '2300', '日照');
INSERT INTO `city` VALUES ('2312', '2300', '泰安');
INSERT INTO `city` VALUES ('2313', '2300', '潍坊');
INSERT INTO `city` VALUES ('2314', '2300', '威海');
INSERT INTO `city` VALUES ('2315', '2300', '烟台');
INSERT INTO `city` VALUES ('2316', '2300', '淄博');
INSERT INTO `city` VALUES ('2317', '2300', '枣庄');
INSERT INTO `city` VALUES ('2400', '0', '山西');
INSERT INTO `city` VALUES ('2401', '2400', '太原');
INSERT INTO `city` VALUES ('2402', '2400', '长治');
INSERT INTO `city` VALUES ('2403', '2400', '大同');
INSERT INTO `city` VALUES ('2404', '2400', '晋城');
INSERT INTO `city` VALUES ('2405', '2400', '晋中');
INSERT INTO `city` VALUES ('2406', '2400', '临汾');
INSERT INTO `city` VALUES ('2407', '2400', '吕梁');
INSERT INTO `city` VALUES ('2408', '2400', '朔州');
INSERT INTO `city` VALUES ('2409', '2400', '忻州');
INSERT INTO `city` VALUES ('2410', '2400', '阳泉');
INSERT INTO `city` VALUES ('2411', '2400', '运城');
INSERT INTO `city` VALUES ('2500', '0', '陕西');
INSERT INTO `city` VALUES ('2501', '2500', '西安');
INSERT INTO `city` VALUES ('2502', '2500', '宝康');
INSERT INTO `city` VALUES ('2503', '2500', '宝鸡');
INSERT INTO `city` VALUES ('2504', '2500', '陈仓');
INSERT INTO `city` VALUES ('2505', '2500', '汉中');
INSERT INTO `city` VALUES ('2506', '2500', '商洛');
INSERT INTO `city` VALUES ('2507', '2500', '铜川');
INSERT INTO `city` VALUES ('2508', '2500', '渭南');
INSERT INTO `city` VALUES ('2509', '2500', '咸阳');
INSERT INTO `city` VALUES ('2510', '2500', '延安');
INSERT INTO `city` VALUES ('2511', '2500', '榆林');
INSERT INTO `city` VALUES ('2600', '0', '上海');
INSERT INTO `city` VALUES ('2700', '0', '四川');
INSERT INTO `city` VALUES ('2701', '2700', '成都');
INSERT INTO `city` VALUES ('2702', '2700', '阿贝');
INSERT INTO `city` VALUES ('2703', '2700', '巴中');
INSERT INTO `city` VALUES ('2704', '2700', '德阳');
INSERT INTO `city` VALUES ('2705', '2700', '达州');
INSERT INTO `city` VALUES ('2706', '2700', '广元');
INSERT INTO `city` VALUES ('2707', '2700', '广安');
INSERT INTO `city` VALUES ('2708', '2700', '甘孜');
INSERT INTO `city` VALUES ('2709', '2700', '泸州');
INSERT INTO `city` VALUES ('2710', '2700', '乐山');
INSERT INTO `city` VALUES ('2711', '2700', '凉山');
INSERT INTO `city` VALUES ('2712', '2700', '绵阳');
INSERT INTO `city` VALUES ('2713', '2700', '眉山');
INSERT INTO `city` VALUES ('2714', '2700', '内江');
INSERT INTO `city` VALUES ('2715', '2700', '南充');
INSERT INTO `city` VALUES ('2716', '2700', '攀枝花');
INSERT INTO `city` VALUES ('2717', '2700', '遂宁');
INSERT INTO `city` VALUES ('2718', '2700', '宜宾');
INSERT INTO `city` VALUES ('2719', '2700', '雅安');
INSERT INTO `city` VALUES ('2720', '2700', '自贡');
INSERT INTO `city` VALUES ('2721', '2700', '资阳');
INSERT INTO `city` VALUES ('2800', '0', '天津');
INSERT INTO `city` VALUES ('2900', '0', '台湾');
INSERT INTO `city` VALUES ('3000', '0', '西藏');
INSERT INTO `city` VALUES ('3001', '3000', '拉萨');
INSERT INTO `city` VALUES ('3002', '3000', '阿里');
INSERT INTO `city` VALUES ('3003', '3000', '昌都');
INSERT INTO `city` VALUES ('3004', '3000', '林芝');
INSERT INTO `city` VALUES ('3005', '3000', '那曲');
INSERT INTO `city` VALUES ('3006', '3000', '日喀则');
INSERT INTO `city` VALUES ('3007', '3000', '山南');
INSERT INTO `city` VALUES ('3100', '0', '香港');
INSERT INTO `city` VALUES ('3200', '0', '新疆');
INSERT INTO `city` VALUES ('3201', '3200', '乌鲁木齐');
INSERT INTO `city` VALUES ('3202', '3200', '阿克苏');
INSERT INTO `city` VALUES ('3203', '3200', '阿图什');
INSERT INTO `city` VALUES ('3204', '3200', '阿勒泰');
INSERT INTO `city` VALUES ('3205', '3200', '阿拉尔');
INSERT INTO `city` VALUES ('3206', '3200', '博乐');
INSERT INTO `city` VALUES ('3207', '3200', '昌吉');
INSERT INTO `city` VALUES ('3208', '3200', '哈密');
INSERT INTO `city` VALUES ('3209', '3200', '和田');
INSERT INTO `city` VALUES ('3210', '3200', '克拉玛依');
INSERT INTO `city` VALUES ('3211', '3200', '喀什');
INSERT INTO `city` VALUES ('3212', '3200', '库尔勒');
INSERT INTO `city` VALUES ('3213', '3200', '石河子');
INSERT INTO `city` VALUES ('3214', '3200', '吐鲁番');
INSERT INTO `city` VALUES ('3215', '3200', '塔城');
INSERT INTO `city` VALUES ('3216', '3200', '伊宁');
INSERT INTO `city` VALUES ('3300', '0', '云南');
INSERT INTO `city` VALUES ('3301', '3300', '昆明');
INSERT INTO `city` VALUES ('3302', '3300', '保山');
INSERT INTO `city` VALUES ('3303', '3300', '楚雄');
INSERT INTO `city` VALUES ('3304', '3300', '大理');
INSERT INTO `city` VALUES ('3305', '3300', '德宏');
INSERT INTO `city` VALUES ('3306', '3300', '红河');
INSERT INTO `city` VALUES ('3307', '3300', '景洪');
INSERT INTO `city` VALUES ('3308', '3300', '丽江');
INSERT INTO `city` VALUES ('3309', '3300', '临沧');
INSERT INTO `city` VALUES ('3310', '3300', '怒江');
INSERT INTO `city` VALUES ('3311', '3300', '曲靖');
INSERT INTO `city` VALUES ('3312', '3300', '思茅');
INSERT INTO `city` VALUES ('3313', '3300', '文山');
INSERT INTO `city` VALUES ('3314', '3300', '香格里拉');
INSERT INTO `city` VALUES ('3315', '3300', '玉溪');
INSERT INTO `city` VALUES ('3316', '3300', '昭通');
INSERT INTO `city` VALUES ('3400', '0', '浙江');
INSERT INTO `city` VALUES ('3401', '3400', '杭州');
INSERT INTO `city` VALUES ('3402', '3400', '湖州');
INSERT INTO `city` VALUES ('3403', '3400', '嘉兴');
INSERT INTO `city` VALUES ('3404', '3400', '金华');
INSERT INTO `city` VALUES ('3405', '3400', '丽水');
INSERT INTO `city` VALUES ('3406', '3400', '宁波');
INSERT INTO `city` VALUES ('3407', '3400', '衢州');
INSERT INTO `city` VALUES ('3408', '3400', '绍兴');
INSERT INTO `city` VALUES ('3409', '3400', '台州');
INSERT INTO `city` VALUES ('3410', '3400', '温州');
INSERT INTO `city` VALUES ('3411', '3400', '舟山');

-- ----------------------------
-- Table structure for colleges
-- ----------------------------
DROP TABLE IF EXISTS `colleges`;
CREATE TABLE `colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `speciality_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colleges
-- ----------------------------
INSERT INTO `colleges` VALUES ('1', '0', '计算机科学与工程学院');
INSERT INTO `colleges` VALUES ('2', '1', '计算机科学与技术');
INSERT INTO `colleges` VALUES ('3', '1', '软件工程');
INSERT INTO `colleges` VALUES ('4', '1', '网络工程');
INSERT INTO `colleges` VALUES ('5', '0', '国际商学院');
INSERT INTO `colleges` VALUES ('6', '5', '国际与贸易');
INSERT INTO `colleges` VALUES ('7', '5', '物流管理');

-- ----------------------------
-- Table structure for graduate
-- ----------------------------
DROP TABLE IF EXISTS `graduate`;
CREATE TABLE `graduate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `entranceyear` varchar(100) DEFAULT NULL,
  `courtyard` varchar(100) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `banji` varchar(50) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `tell` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `worktime` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `home` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gid` (`uid`),
  CONSTRAINT `gid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graduate
-- ----------------------------
INSERT INTO `graduate` VALUES ('1', '1', '学号', '姓名', '性别', '生日', '头像', '入学年份', '所在院', '专业', '班级', '签名', '兴趣爱好', '电话', '邮箱', '公司', '职位', '工作时间', '部门', '所在地', '家庭住址', '2017-05-28 16:12:11');
INSERT INTO `graduate` VALUES ('2', '3', '2013081517', '沈先春', '男', '1993-07-21', 'img/my.jpg', '2013-09-06', '计算机科学与工程学院', '计算机科学与技术', '计科135', '哈哈', '啊哈', '1884234871', '15624@qq.com', '亚信科技', '软件工程师', '1年', 'CUC事业部', '大连民族大学', '云南昭通', '2017-05-28 16:12:14');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lid` (`uid`),
  CONSTRAINT `lid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '1', '标题', '内容', '2017-05-22 10:18:46');

-- ----------------------------
-- Table structure for loves
-- ----------------------------
DROP TABLE IF EXISTS `loves`;
CREATE TABLE `loves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `sayid` int(11) DEFAULT NULL,
  `lovetime` datetime DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`uid`),
  KEY `lovesayid` (`sayid`),
  CONSTRAINT `lovesayid` FOREIGN KEY (`sayid`) REFERENCES `say` (`id`),
  CONSTRAINT `userid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loves
-- ----------------------------
INSERT INTO `loves` VALUES ('1', '1', '1', '2017-05-28 21:10:14', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendid` int(11) DEFAULT NULL,
  `content` longtext,
  `getid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msid` (`sendid`),
  KEY `mgid` (`getid`),
  CONSTRAINT `mgid` FOREIGN KEY (`getid`) REFERENCES `user` (`id`),
  CONSTRAINT `msid` FOREIGN KEY (`sendid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `aid` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`aid`),
  CONSTRAINT `pid` FOREIGN KEY (`aid`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replyid` (`rid`),
  KEY `replyyid` (`uid`),
  CONSTRAINT `replyid` FOREIGN KEY (`rid`) REFERENCES `review` (`id`),
  CONSTRAINT `replyyid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sayid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`sayid`),
  KEY `reid` (`uid`),
  CONSTRAINT `reid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `rid` FOREIGN KEY (`sayid`) REFERENCES `say` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '1', '2', '似不似傻', '2017-05-22 10:25:01');
INSERT INTO `review` VALUES ('2', '1', '2', '你才傻', '2017-05-28 17:55:20');
INSERT INTO `review` VALUES ('3', '1', '3', '哈哈', '2017-05-28 17:55:35');
INSERT INTO `review` VALUES ('4', '2', '2', '啧啧', '2017-05-28 17:58:44');
INSERT INTO `review` VALUES ('5', '2', '3', '遨游', '2017-05-28 17:59:10');
INSERT INTO `review` VALUES ('6', '3', '3', '矮油', '2017-05-28 17:59:37');
INSERT INTO `review` VALUES ('7', '4', '2', '哎呦喂', '2017-05-28 17:59:54');
INSERT INTO `review` VALUES ('8', '5', '2', '回复沈先春：哈哈', '2017-05-28 18:00:46');

-- ----------------------------
-- Table structure for say
-- ----------------------------
DROP TABLE IF EXISTS `say`;
CREATE TABLE `say` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` longtext,
  `image` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sayid` (`uid`),
  CONSTRAINT `sayid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of say
-- ----------------------------
INSERT INTO `say` VALUES ('1', '3', '轻轻的我走了，正如我轻轻的来；我挥一挥衣袖，不带走一片云彩。我轻轻的招手，作别西天的云彩。', 'img/img1.jpg', '2017-05-22 10:21:34');
INSERT INTO `say` VALUES ('2', '3', '三亚的海滩很漂亮。', '', '2017-06-01 17:49:57');
INSERT INTO `say` VALUES ('3', '3', '英国艺术家 Jane Perkins 能利用很多不起眼的东西进行创作，甚至是垃圾。首饰、纽扣、玩具等等都可以作为他创作的工具并创作出惟妙惟肖的画作，丝毫不逊色于色彩丰富的颜料。', 'img/img1.jpg', '2017-05-26 17:50:29');
INSERT INTO `say` VALUES ('4', '2', '我是二号发表的第一条', 'img/img1.jpg', '2017-05-28 17:57:20');
INSERT INTO `say` VALUES ('5', '2', '我是二号发表的第二条', null, '2017-05-28 17:57:43');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `entranceyear` varchar(50) DEFAULT NULL,
  `courtyard` varchar(100) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `banji` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `tell` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`uid`),
  CONSTRAINT `sid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', '学号', '姓名', '入学年份', '所在院', '专业', '班级', '性别', '生日', '头像', '签名', '兴趣爱好', '电话', '邮箱', '家庭住址', '所在地', '2017-05-28 15:20:29');
INSERT INTO `student` VALUES ('2', '2', '2013081424', '徐畅', '2013-09-06', '计算机科学与工程学院', '计算机科学与技术', '计科134', '女', '1994-11-23', 'img/my.jpg', '哈哈', '啊哈', '1212131', '1452314@qq.com', '辽宁本溪', '大连民族大学', '2017-05-28 15:20:32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '学号', '密码', '角色(毕业和在校)');
INSERT INTO `user` VALUES ('2', '2013081424', '123456', '0');
INSERT INTO `user` VALUES ('3', '2013081517', '123456', '1');
