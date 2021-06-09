/*
Navicat MySQL Data Transfer

Source Server         : mybatis
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2021-06-09 19:54:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(128) NOT NULL,
  `patent_id` varchar(128) NOT NULL,
  `patent_type` varchar(128) DEFAULT NULL,
  `teacher_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', '20210002', 'CN201910082787.3', '发明授权', '4');
INSERT INTO `apply` VALUES ('2', '20210002', 'CN201710324105.6', '发明授权', '5');
INSERT INTO `apply` VALUES ('3', '20210002', 'CN201910423167.1', '发明授权', '3');
INSERT INTO `apply` VALUES ('4', '20210002', 'CN201710572122.1', '发明授权', '8');
INSERT INTO `apply` VALUES ('5', '20210002', 'CN201810607025.6', '发明授权', '0');
INSERT INTO `apply` VALUES ('6', '20210002', 'CN201910422934.7', '发明授权', '5');
INSERT INTO `apply` VALUES ('7', '20210002', 'CN201810224237.6', '发明授权', '2');
INSERT INTO `apply` VALUES ('8', '20210002', 'CN201910475353.X', '发明授权', '2');
INSERT INTO `apply` VALUES ('9', '20210002', 'CN202010671269.8', '发明公开', '2');
INSERT INTO `apply` VALUES ('10', '20210002', 'CN202010707218.6', '发明公开', '5');
INSERT INTO `apply` VALUES ('11', '20210002', 'CN201710477071.4', '发明授权', '5');
INSERT INTO `apply` VALUES ('12', '20210002', 'CN201910554731.3', '发明授权', '5');
INSERT INTO `apply` VALUES ('13', '20210002', 'CN201810372791.9', '发明授权', '6');
INSERT INTO `apply` VALUES ('14', '20210002', 'CN202010627279.1', '发明公开', '3');
INSERT INTO `apply` VALUES ('15', '20210002', 'CN202010650711.9', '发明公开', '10');
INSERT INTO `apply` VALUES ('16', '20210002', 'CN202010651096.3', '发明公开', '10');
INSERT INTO `apply` VALUES ('17', '20210002', 'CN201710868373.4', '发明授权', '7');
INSERT INTO `apply` VALUES ('18', '20210002', 'CN201810446991.4', '发明授权', '4');
INSERT INTO `apply` VALUES ('19', '20210002', 'CN201710120547.9', '发明授权', '0');
INSERT INTO `apply` VALUES ('20', '20210002', 'CN202010200651.0', '发明公开', '6');
INSERT INTO `apply` VALUES ('21', '20210002', 'CN202010200633.2', '发明公开', '5');
INSERT INTO `apply` VALUES ('22', '20210002', 'CN201910548389.6', '发明授权', '7');
INSERT INTO `apply` VALUES ('23', '20210002', 'CN201611059354.9', '发明授权', '2');
INSERT INTO `apply` VALUES ('24', '20210002', 'CN202010093807.X', '发明公开', '8');
INSERT INTO `apply` VALUES ('25', '20210002', 'CN201810446970.2', '发明授权', '5');
INSERT INTO `apply` VALUES ('26', '20210002', 'CN201710117961.4', '发明授权', '4');
INSERT INTO `apply` VALUES ('27', '20210002', 'CN201710652602.9', '发明授权', '8');
INSERT INTO `apply` VALUES ('28', '20210002', 'CN201710453423.2', '发明授权', '4');
INSERT INTO `apply` VALUES ('29', '20210002', 'CN201810977882.5', '发明授权', '8');
INSERT INTO `apply` VALUES ('30', '20210002', 'CN201911281680.8', '发明公开', '5');
INSERT INTO `apply` VALUES ('31', '20210002', 'CN201710553192.2', '发明授权', '6');
INSERT INTO `apply` VALUES ('32', '20210002', 'CN201911257349.2', '发明公开', '7');
INSERT INTO `apply` VALUES ('33', '20210002', 'CN201911088665.1', '发明公开', '4');
INSERT INTO `apply` VALUES ('34', '20210002', 'CN201911102141.3', '发明公开', '2');
INSERT INTO `apply` VALUES ('35', '20210002', 'CN201911005055.0', '发明公开', '1');
INSERT INTO `apply` VALUES ('36', '20210002', 'CN201911102162.5', '发明公开', '5');
INSERT INTO `apply` VALUES ('37', '20210002', 'CN201810230242.8', '发明授权', '7');
INSERT INTO `apply` VALUES ('38', '20210002', 'CN201710138361.6', '发明授权', '0');
INSERT INTO `apply` VALUES ('39', '20210002', 'CN201910423167.1', '发明公开', '3');
INSERT INTO `apply` VALUES ('40', '20210002', 'CN201910554731.3', '发明公开', '5');
INSERT INTO `apply` VALUES ('41', '20210002', 'CN201910475353.X', '发明公开', '2');
INSERT INTO `apply` VALUES ('42', '20210002', 'CN201610538537.2', '发明授权', '7');
INSERT INTO `apply` VALUES ('43', '20210002', 'CN201610575118.6', '发明授权', '0');
INSERT INTO `apply` VALUES ('44', '20210002', 'CN201910548389.6', '发明公开', '7');
INSERT INTO `apply` VALUES ('45', '20210002', 'CN201610873931.1', '发明授权', '3');
INSERT INTO `apply` VALUES ('46', '20210002', 'CN201910438584.3', '发明公开', '5');
INSERT INTO `apply` VALUES ('47', '20210002', 'CN201910422934.7', '发明公开', '5');
INSERT INTO `apply` VALUES ('48', '20210002', 'CN201910469425.X', '发明公开', '0');
INSERT INTO `apply` VALUES ('49', '20210002', 'CN201910411715.9', '发明公开', '3');
INSERT INTO `apply` VALUES ('50', '20210002', 'CN201710633515.9', '发明授权', '6');
INSERT INTO `apply` VALUES ('51', '20210002', 'CN201910394117.5', '发明公开', '5');
INSERT INTO `apply` VALUES ('52', '20210002', 'CN201910237218.1', '发明公开', '7');
INSERT INTO `apply` VALUES ('53', '20210002', 'CN201710962064.3', '发明授权', '5');
INSERT INTO `apply` VALUES ('54', '20210002', 'CN201910188751.3', '发明公开', '3');
INSERT INTO `apply` VALUES ('55', '20210002', 'CN201710684515.1', '发明授权', '4');
INSERT INTO `apply` VALUES ('56', '20210002', 'CN201610529103.6', '发明授权', '4');
INSERT INTO `apply` VALUES ('57', '20210002', 'CN201610072508.1', '发明授权', '7');
INSERT INTO `apply` VALUES ('58', '20210002', 'CN201910127936.3', '发明公开', '6');
INSERT INTO `apply` VALUES ('59', '20210002', 'CN201910072075.3', '发明公开', '7');
INSERT INTO `apply` VALUES ('60', '20210002', 'CN201811630072.9', '发明公开', '0');
INSERT INTO `apply` VALUES ('61', '20210002', 'CN201610579861.9', '发明授权', '0');
INSERT INTO `apply` VALUES ('62', '20210002', 'CN201910082787.3', '发明公开', '5');
INSERT INTO `apply` VALUES ('63', '20210002', 'CN201811359582.7', '发明公开', '5');
INSERT INTO `apply` VALUES ('64', '20210002', 'CN201610551541.2', '发明授权', '3');
INSERT INTO `apply` VALUES ('65', '20210002', 'CN201610065909.4', '发明授权', '1');
INSERT INTO `apply` VALUES ('66', '20210002', 'CN201810989222.9', '发明公开', '7');
INSERT INTO `apply` VALUES ('67', '20210002', 'CN201810977882.5', '发明公开', '8');
INSERT INTO `apply` VALUES ('68', '20210002', 'CN201510485784.6', '发明授权', '4');
INSERT INTO `apply` VALUES ('69', '20210002', 'CN201610748446.1', '发明授权', '5');
INSERT INTO `apply` VALUES ('70', '20210002', 'CN201810594201.7', '发明公开', '5');
INSERT INTO `apply` VALUES ('71', '20210002', 'CN201810527946.1', '发明公开', '5');
INSERT INTO `apply` VALUES ('72', '20210002', 'CN201810372791.9', '发明公开', '6');
INSERT INTO `apply` VALUES ('73', '20210002', 'CN201810607025.6', '发明公开', '0');
INSERT INTO `apply` VALUES ('74', '20210002', 'CN201810412422.8', '发明公开', '0');
INSERT INTO `apply` VALUES ('75', '20210002', 'CN201810446094.3', '发明公开', '6');
INSERT INTO `apply` VALUES ('76', '20210002', 'CN201810325323.6', '发明公开', '8');
INSERT INTO `apply` VALUES ('77', '20210002', 'CN201810446991.4', '发明公开', '4');
INSERT INTO `apply` VALUES ('78', '20210002', 'CN201810478714.1', '发明公开', '4');
INSERT INTO `apply` VALUES ('79', '20210002', 'CN201810446980.6', '发明公开', '5');
INSERT INTO `apply` VALUES ('80', '20210002', 'CN201810446970.2', '发明公开', '5');
INSERT INTO `apply` VALUES ('81', '20210002', 'CN201810224237.6', '发明公开', '2');
INSERT INTO `apply` VALUES ('82', '20210002', 'CN201810188125.X', '发明公开', '6');
INSERT INTO `apply` VALUES ('83', '20210002', 'CN201810230242.8', '发明公开', '7');
INSERT INTO `apply` VALUES ('84', '20210002', 'CN201711106920.1', '发明公开', '0');
INSERT INTO `apply` VALUES ('85', '20210002', 'CN201710954189.1', '发明公开', '0');
INSERT INTO `apply` VALUES ('86', '20210002', 'CN201710952661.8', '发明公开', '0');
INSERT INTO `apply` VALUES ('87', '20210002', 'CN201710962064.3', '发明公开', '5');
INSERT INTO `apply` VALUES ('88', '20210002', 'CN201711013603.5', '发明公开', '0');
INSERT INTO `apply` VALUES ('89', '20210002', 'CN201710868373.4', '发明公开', '7');
INSERT INTO `apply` VALUES ('90', '20210002', 'CN201710684515.1', '发明公开', '4');
INSERT INTO `apply` VALUES ('91', '20210002', 'CN201710633515.9', '发明公开', '6');
INSERT INTO `apply` VALUES ('92', '20210002', 'CN201710477071.4', '发明公开', '5');
INSERT INTO `apply` VALUES ('93', '20210002', 'CN201710453423.2', '发明公开', '4');
INSERT INTO `apply` VALUES ('94', '20210002', 'CN201710572122.1', '发明公开', '8');
INSERT INTO `apply` VALUES ('95', '20210002', 'CN201710791353.1', '发明公开', '5');
INSERT INTO `apply` VALUES ('96', '20210002', 'CN201710652602.9', '发明公开', '8');
INSERT INTO `apply` VALUES ('97', '20210002', 'CN201710572124.0', '发明公开', '6');
INSERT INTO `apply` VALUES ('98', '20210002', 'CN201710553192.2', '发明公开', '6');
INSERT INTO `apply` VALUES ('99', '20210002', 'CN201710324105.6', '发明公开', '5');
INSERT INTO `apply` VALUES ('100', '20210002', 'CN201710250167.7', '发明公开', '6');
INSERT INTO `apply` VALUES ('101', '20210002', 'CN201710329645.3', '发明公开', '0');
INSERT INTO `apply` VALUES ('102', '20210002', 'CN201710138361.6', '发明公开', '0');
INSERT INTO `apply` VALUES ('103', '20210002', 'CN201710117961.4', '发明公开', '4');
INSERT INTO `apply` VALUES ('104', '20210002', 'CN201710120547.9', '发明公开', '0');
INSERT INTO `apply` VALUES ('105', '20210002', 'CN201611059354.9', '发明公开', '2');
INSERT INTO `apply` VALUES ('106', '20210002', 'CN201611153581.8', '发明公开', '0');
INSERT INTO `apply` VALUES ('107', '20210002', 'CN201610966591.7', '发明公开', '5');
INSERT INTO `apply` VALUES ('108', '20210002', 'CN201610873931.1', '发明公开', '3');
INSERT INTO `apply` VALUES ('109', '20210002', 'CN201610748446.1', '发明公开', '5');
INSERT INTO `apply` VALUES ('110', '20210002', 'CN201610551797.3', '发明公开', '0');
INSERT INTO `apply` VALUES ('111', '20210002', 'CN201610575056.9', '发明公开', '0');
INSERT INTO `apply` VALUES ('112', '20210002', 'CN201610748139.3', '发明公开', '6');
INSERT INTO `apply` VALUES ('113', '20210002', 'CN201610551541.2', '发明公开', '3');
INSERT INTO `apply` VALUES ('114', '20210002', 'CN201610538537.2', '发明公开', '7');
INSERT INTO `apply` VALUES ('115', '20210002', 'CN201610575118.6', '发明公开', '0');
INSERT INTO `apply` VALUES ('116', '20210002', 'CN201610537734.2', '发明公开', '0');
INSERT INTO `apply` VALUES ('117', '20210002', 'CN201610579861.9', '发明公开', '0');
INSERT INTO `apply` VALUES ('118', '20210002', 'CN201610399231.3', '发明公开', '4');
INSERT INTO `apply` VALUES ('119', '20210002', 'CN201610389820.3', '发明公开', '5');
INSERT INTO `apply` VALUES ('120', '20210002', 'CN201610529103.6', '发明公开', '4');
INSERT INTO `apply` VALUES ('121', '20210002', 'CN201610279693.1', '发明公开', '3');
INSERT INTO `apply` VALUES ('122', '20210002', 'CN201610149871.9', '发明公开', '5');
INSERT INTO `apply` VALUES ('123', '20210002', 'CN201610072508.1', '发明公开', '7');
INSERT INTO `apply` VALUES ('124', '20210002', 'CN201610135566.4', '发明公开', '5');
INSERT INTO `apply` VALUES ('125', '20210002', 'CN201610108081.6', '发明公开', '8');
INSERT INTO `apply` VALUES ('126', '20210002', 'CN201610178414.2', '发明公开', '7');
INSERT INTO `apply` VALUES ('127', '20210002', 'CN201610065909.4', '发明公开', '1');
INSERT INTO `apply` VALUES ('128', '20210002', 'CN201610027313.5', '发明公开', '4');
INSERT INTO `apply` VALUES ('129', '20210002', 'CN201610055172.8', '发明公开', '0');
INSERT INTO `apply` VALUES ('130', '20210002', 'CN201510997890.2', '发明公开', '5');
INSERT INTO `apply` VALUES ('131', '20210002', 'CN201511025912.5', '发明公开', '9');
INSERT INTO `apply` VALUES ('132', '20210002', 'CN201510939043.0', '发明公开', '3');
INSERT INTO `apply` VALUES ('133', '20210002', 'CN201510868947.9', '发明公开', '3');
INSERT INTO `apply` VALUES ('134', '20210002', 'CN201510846522.8', '发明公开', '3');
INSERT INTO `apply` VALUES ('135', '20210002', 'CN201510881672.2', '发明公开', '2');
INSERT INTO `apply` VALUES ('136', '20210002', 'CN201510810577.3', '发明公开', '3');
INSERT INTO `apply` VALUES ('137', '20210002', 'CN201510640987.8', '发明公开', '6');
INSERT INTO `apply` VALUES ('138', '20210002', 'CN201510548193.9', '发明公开', '4');
INSERT INTO `apply` VALUES ('139', '20210002', 'CN201510548665.0', '发明公开', '0');
INSERT INTO `apply` VALUES ('140', '20210002', 'CN201510429039.X', '发明公开', '4');
INSERT INTO `apply` VALUES ('141', '20210002', 'CN201510438666.X', '发明公开', '5');
INSERT INTO `apply` VALUES ('142', '20210002', 'CN201510374274.1', '发明公开', '6');
INSERT INTO `apply` VALUES ('143', '20210002', 'CN201510485784.6', '发明公开', '4');
INSERT INTO `apply` VALUES ('144', '20210002', 'CN201510438360.4', '发明公开', '1');
INSERT INTO `apply` VALUES ('145', '20210002', 'CN201510375384.X', '发明公开', '4');
INSERT INTO `apply` VALUES ('146', '20210002', 'CN201510309814.8', '发明公开', '6');
INSERT INTO `apply` VALUES ('147', '20210002', 'CN201510256382.9', '发明公开', '6');
INSERT INTO `apply` VALUES ('148', '20210002', 'CN201510157843.7', '发明公开', '2');
INSERT INTO `apply` VALUES ('149', '20210002', 'CN201510158163.7', '发明公开', '4');
INSERT INTO `apply` VALUES ('150', '20210002', 'CN201510151720.2', '发明公开', '2');
INSERT INTO `apply` VALUES ('151', '20210002', 'CN201510158443.8', '发明公开', '3');
INSERT INTO `apply` VALUES ('152', '20210002', 'CN201410631554.1', '发明公开', '3');
INSERT INTO `apply` VALUES ('153', '20210002', 'CN201410631671.8', '发明公开', '3');
INSERT INTO `apply` VALUES ('154', '20210002', 'CN201410632194.7', '发明公开', '3');
INSERT INTO `apply` VALUES ('155', '20210002', 'CN201410482991.1', '发明公开', '1');
INSERT INTO `apply` VALUES ('156', '20210002', 'CN201410538553.2', '发明公开', '5');
INSERT INTO `apply` VALUES ('157', '20210002', 'CN201410456238.5', '发明公开', '5');
INSERT INTO `apply` VALUES ('158', '20210002', 'CN201410418945.5', '发明公开', '2');
INSERT INTO `apply` VALUES ('159', '20210002', 'CN201410360219.2', '发明公开', '1');
INSERT INTO `apply` VALUES ('160', '20210002', 'CN201410400684.4', '发明公开', '0');
INSERT INTO `apply` VALUES ('161', '20210002', 'CN201410341165.5', '发明公开', '2');
INSERT INTO `apply` VALUES ('162', '20210002', 'CN201410255447.3', '发明公开', '1');
INSERT INTO `apply` VALUES ('163', '20210002', 'CN201410234822.6', '发明公开', '1');
INSERT INTO `apply` VALUES ('164', '20210002', 'CN201410283576.3', '发明公开', '2');
INSERT INTO `apply` VALUES ('165', '20210002', 'CN201410216133.2', '发明公开', '1');
INSERT INTO `apply` VALUES ('166', '20210002', 'CN201410140300.X', '发明公开', '2');
INSERT INTO `apply` VALUES ('167', '20210002', 'CN201410018508.4', '发明公开', '11');
INSERT INTO `apply` VALUES ('168', '20210002', 'CN201310652152.5', '发明公开', '3');
INSERT INTO `apply` VALUES ('169', '20210002', 'CN201310651614.1', '发明公开', '2');
INSERT INTO `apply` VALUES ('170', '20210002', 'CN201310471447.2', '发明公开', '1');
INSERT INTO `apply` VALUES ('171', '20210002', 'CN201310488535.3', '发明公开', '2');
INSERT INTO `apply` VALUES ('172', '20210002', 'CN201310476591.5', '发明公开', '1');
INSERT INTO `apply` VALUES ('173', '20210002', 'CN201310473303.0', '发明公开', '2');
INSERT INTO `apply` VALUES ('174', '20210002', 'CN201310476866.5', '发明公开', '3');
INSERT INTO `apply` VALUES ('175', '20210002', 'CN201310471219.5', '发明公开', '2');
INSERT INTO `apply` VALUES ('176', '20210002', 'CN201210376260.X', '发明公开', '2');
INSERT INTO `apply` VALUES ('177', '20210002', 'CN201210430753.7', '发明公开', '4');
INSERT INTO `apply` VALUES ('178', '20210002', 'CN201210430755.6', '发明公开', '1');
INSERT INTO `apply` VALUES ('179', '20210002', 'CN201210375054.7', '发明公开', '5');
INSERT INTO `apply` VALUES ('180', '20210002', 'CN201210148620.0', '发明公开', '2');
INSERT INTO `apply` VALUES ('181', '20210002', 'CN201210059809.2', '发明公开', '2');
INSERT INTO `apply` VALUES ('182', '20210002', 'CN201210060081.5', '发明公开', '2');
INSERT INTO `apply` VALUES ('183', '20210002', 'CN201110169906.2', '发明公开', '3');
INSERT INTO `apply` VALUES ('184', '20210002', 'CN201010282733.0', '发明公开', '3');
INSERT INTO `apply` VALUES ('185', '20210002', 'CN200910218880.9', '发明公开', '4');
INSERT INTO `apply` VALUES ('186', '20210002', 'CN200910023743.X', '发明公开', '2');
INSERT INTO `apply` VALUES ('187', '20210002', 'CN200910023498.2', '发明公开', '3');
INSERT INTO `apply` VALUES ('188', '20210002', 'CN200810018184.9', '发明公开', '1');

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(128) NOT NULL,
  `paper_id` varchar(128) NOT NULL,
  `teacher_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------
INSERT INTO `deliver` VALUES ('1', '20210002', 'JSJX202008012', '6');
INSERT INTO `deliver` VALUES ('2', '20210002', 'RJXB201908017', '1');
INSERT INTO `deliver` VALUES ('3', '20210002', 'BJYD201903007', '2');
INSERT INTO `deliver` VALUES ('4', '20210002', 'JFYZ201906013', '6');
INSERT INTO `deliver` VALUES ('5', '20210002', 'TXXB201903017', '1');
INSERT INTO `deliver` VALUES ('6', '20210002', 'RJXB201902009', '1');
INSERT INTO `deliver` VALUES ('7', '20210002', 'RJXB201812018', '1');
INSERT INTO `deliver` VALUES ('8', '20210002', 'JFYZ201712010', '4');
INSERT INTO `deliver` VALUES ('9', '20210002', 'JSJX201902012', '0');
INSERT INTO `deliver` VALUES ('10', '20210002', 'RJXB201712007', '5');
INSERT INTO `deliver` VALUES ('11', '20210002', 'XBJZ201702009', '2');
INSERT INTO `deliver` VALUES ('12', '20210002', 'SCLH201701022', '3');
INSERT INTO `deliver` VALUES ('13', '20210002', 'XXWX201609015', '3');
INSERT INTO `deliver` VALUES ('14', '20210002', 'HZLG201603006', '3');
INSERT INTO `deliver` VALUES ('15', '20210002', 'HZLG201603013', '3');
INSERT INTO `deliver` VALUES ('16', '20210002', 'JSJX201708003', '3');
INSERT INTO `deliver` VALUES ('17', '20210002', 'RJXB201510014', '1');
INSERT INTO `deliver` VALUES ('18', '20210002', 'JFYZ201508018', '1');
INSERT INTO `deliver` VALUES ('19', '20210002', 'JSJX201605014', '2');
INSERT INTO `deliver` VALUES ('20', '20210002', 'SCLH2015S1016', '2');
INSERT INTO `deliver` VALUES ('21', '20210002', 'JSJX201512003', '1');
INSERT INTO `deliver` VALUES ('22', '20210002', 'XBDZ201406011', '1');
INSERT INTO `deliver` VALUES ('23', '20210002', 'CGQJ201412044', '3');
INSERT INTO `deliver` VALUES ('24', '20210002', 'CGQJ201412039', '2');
INSERT INTO `deliver` VALUES ('25', '20210002', 'XTFZ201412007', '2');
INSERT INTO `deliver` VALUES ('26', '20210002', 'JSYJ201504052', '2');
INSERT INTO `deliver` VALUES ('27', '20210002', 'XBDZ201405013', '3');
INSERT INTO `deliver` VALUES ('28', '20210002', 'XDKD201405034', '2');
INSERT INTO `deliver` VALUES ('29', '20210002', 'XXWX201410003', '1');
INSERT INTO `deliver` VALUES ('30', '20210002', 'SCLH201501005', '0');
INSERT INTO `deliver` VALUES ('31', '20210002', 'JSYJ201501040', '5');
INSERT INTO `deliver` VALUES ('32', '20210002', 'XBDZ201404014', '4');
INSERT INTO `deliver` VALUES ('33', '20210002', 'CGQJ201406027', '4');
INSERT INTO `deliver` VALUES ('34', '20210002', 'DZXU201403017', '3');
INSERT INTO `deliver` VALUES ('35', '20210002', 'JSJY201312020', '1');
INSERT INTO `deliver` VALUES ('36', '20210002', 'JSJC201303023', '2');
INSERT INTO `deliver` VALUES ('37', '20210002', 'XDKD201201029', '2');
INSERT INTO `deliver` VALUES ('38', '20210002', 'JFYZ2011S2041', '0');
INSERT INTO `deliver` VALUES ('39', '20210002', 'WXYJ201108002', '3');
INSERT INTO `deliver` VALUES ('40', '20210002', 'JSJK201011009', '1');
INSERT INTO `deliver` VALUES ('41', '20210002', 'JFYZ2010S2053', '1');
INSERT INTO `deliver` VALUES ('42', '20210002', 'XBDZ201004016', '0');
INSERT INTO `deliver` VALUES ('43', '20210002', 'XXWX201008014', '2');
INSERT INTO `deliver` VALUES ('44', '20210002', '1012278086.nh', '0');
INSERT INTO `deliver` VALUES ('45', '20210002', 'XBDZ201003020', '2');
INSERT INTO `deliver` VALUES ('46', '20210002', 'JSGG201012025', '2');
INSERT INTO `deliver` VALUES ('47', '20210002', 'JSJA200911042', '3');
INSERT INTO `deliver` VALUES ('48', '20210002', 'JDMT200910001071', '3');
INSERT INTO `deliver` VALUES ('49', '20210002', 'JSYJ200909079', '2');
INSERT INTO `deliver` VALUES ('50', '20210002', 'JYRJ200906027', '3');
INSERT INTO `deliver` VALUES ('51', '20210002', 'XXWX200903018', '3');
INSERT INTO `deliver` VALUES ('52', '20210002', 'JSJC200823053', '2');
INSERT INTO `deliver` VALUES ('53', '20210002', 'WJFZ200810046', '2');
INSERT INTO `deliver` VALUES ('54', '20210002', 'JYRJ200808021', '0');
INSERT INTO `deliver` VALUES ('55', '20210002', 'JYRJ200807020', '2');
INSERT INTO `deliver` VALUES ('56', '20210002', 'JYRJ200806027', '3');
INSERT INTO `deliver` VALUES ('57', '20210002', 'JSJA200805009', '2');
INSERT INTO `deliver` VALUES ('58', '20210002', 'SXSZ200802008', '0');
INSERT INTO `deliver` VALUES ('59', '20210002', 'JSGG200804036', '3');
INSERT INTO `deliver` VALUES ('60', '20210002', 'JSJC200724052', '3');
INSERT INTO `deliver` VALUES ('61', '20210002', 'NJKF200710002025', '0');
INSERT INTO `deliver` VALUES ('62', '20210002', 'WXYJ200710025', '0');
INSERT INTO `deliver` VALUES ('63', '20210002', 'JDMT200710001126', '0');
INSERT INTO `deliver` VALUES ('64', '20210002', 'JYRJ200708013', '2');
INSERT INTO `deliver` VALUES ('65', '20210002', 'XBDZ200703010', '2');
INSERT INTO `deliver` VALUES ('66', '20210002', 'JYRJ200705011', '2');
INSERT INTO `deliver` VALUES ('67', '20210002', 'JYRJ200704015', '3');
INSERT INTO `deliver` VALUES ('68', '20210002', 'XBDZ200702010', '2');
INSERT INTO `deliver` VALUES ('69', '20210002', 'JYRJ200701056', '3');
INSERT INTO `deliver` VALUES ('70', '20210002', 'JSJC200623048', '2');
INSERT INTO `deliver` VALUES ('71', '20210002', 'JSJC200620057', '3');
INSERT INTO `deliver` VALUES ('72', '20210002', 'WXYJ200610058', '1');
INSERT INTO `deliver` VALUES ('73', '20210002', 'NJKF200610001018', '1');
INSERT INTO `deliver` VALUES ('74', '20210002', 'NJKF200610001060', '1');
INSERT INTO `deliver` VALUES ('75', '20210002', 'NJKF200610002059', '1');
INSERT INTO `deliver` VALUES ('76', '20210002', 'WXYJ200609018', '1');
INSERT INTO `deliver` VALUES ('77', '20210002', 'WXYJ200609060', '1');
INSERT INTO `deliver` VALUES ('78', '20210002', 'JYRJ200608019', '2');
INSERT INTO `deliver` VALUES ('79', '20210002', 'WXYJ200608014', '2');
INSERT INTO `deliver` VALUES ('80', '20210002', 'XBDZ200506009', '1');
INSERT INTO `deliver` VALUES ('81', '20210002', 'RZNX200510001010', '1');
INSERT INTO `deliver` VALUES ('82', '20210002', 'XTYD200509042', '3');
INSERT INTO `deliver` VALUES ('83', '20210002', 'ZGTH200508006011', '4');
INSERT INTO `deliver` VALUES ('84', '20210002', 'WXYJ200506020', '1');
INSERT INTO `deliver` VALUES ('85', '20210002', 'XBDZ200502007', '0');
INSERT INTO `deliver` VALUES ('86', '20210002', 'JSJC20050300Z', '2');
INSERT INTO `deliver` VALUES ('87', '20210002', 'ZGTH200408003069', '4');
INSERT INTO `deliver` VALUES ('88', '20210002', 'XBDZ200302006', '1');
INSERT INTO `deliver` VALUES ('89', '20210002', 'JYRJ200303001', '0');
INSERT INTO `deliver` VALUES ('90', '20210002', '2002070576.nh', '0');

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `province1` varchar(128) NOT NULL,
  `city1` varchar(128) NOT NULL,
  `district1` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `province2` varchar(128) DEFAULT NULL,
  `city2` varchar(128) DEFAULT NULL,
  `district2` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '陈晓江', '20210002', '1753044001@qq.com', '陕西省', '西安市', '长安区', '西北大学信息科学与技术学院', '', '', '', '', '教授');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` varchar(128) NOT NULL,
  `paper_name` varchar(128) NOT NULL,
  `paper_source` varchar(128) DEFAULT NULL,
  `paper_time` date DEFAULT NULL,
  `paper_region` varchar(128) DEFAULT NULL,
  `paper_keywords` varchar(128) DEFAULT NULL,
  `paper_influence` decimal(6,2) DEFAULT NULL,
  `paper_quote` int(11) DEFAULT NULL,
  `paper_press` varchar(128) DEFAULT NULL,
  `paper_search_type` varchar(128) DEFAULT NULL,
  `paper_doi` varchar(128) DEFAULT NULL,
  `paper_state` varchar(128) DEFAULT NULL,
  `paper_authors` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paper_id` (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('1', 'JSJX202008012', '一种基于条件生成式对抗网络的文本类验证码识别方法', '计算机学报', '2020-04-15', '西北大学', '文本类验证码; 验证码识别; 条件生成式对抗网络; 字符分割; 去干扰算法;', '0.00', '0', '', '', '', '已发表', '汤战勇;田超雄;叶贵鑫;李婧;王薇;龚晓庆;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('2', 'RJXB201908017', '无源感知网络中能耗和延迟平衡的机会路由协议', '软件学报', '2019-04-15', '西北大学', '无源感知网络; 能量收集; 机会路由; 延迟;', '0.00', '0', '', '', '', '已发表', '高宏超;陈晓江;徐丹;彭瑶;汤战勇;房鼎益');
INSERT INTO `paper` VALUES ('3', 'BJYD201903007', '基于智能手机感知的人体运动状态深度识别', '北京邮电大学学报', '2019-04-15', '西北大学', '运动状态; 深度识别; 智能手机; 并联卷积神经网络;', '0.00', '0', '', '', '', '已发表', '殷晓玲;夏启寿;陈晓江;何娟;陈峰');
INSERT INTO `paper` VALUES ('4', 'JFYZ201906013', '一种跨APP组件间隐私泄露自动检测方法', '计算机研究与发展', '2019-04-15', '西北大学', 'Android安全; 隐私泄露; 静态分析; 数据流分析; 污点分析;', '0.00', '0', '', '', '', '已发表', '李振;汤战勇;李政桥;王海;龚晓庆;陈峰;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('5', 'TXXB201903017', '基于智能手机内置传感器的人体运动状态识别', '通信学报', '2019-04-15', '西北大学', '运动状态识别; 层次支持向量机; 智能手机传感器; 时域特征;', '0.00', '0', '', '', '', '已发表', '殷晓玲;陈晓江;夏启寿;何娟;张鹏艳;陈峰');
INSERT INTO `paper` VALUES ('6', 'RJXB201902009', 'VANET中流调度与路径选择联合优化的传输策略', '软件学报', '2019-04-15', '西北大学', '车载自组网; 调度; 路径选择; 联合优化; 数据传输;', '0.00', '0', '', '', '', '已发表', '强敏;陈晓江;尹小燕;贾茹昭;徐丹;汤战勇;房鼎益');
INSERT INTO `paper` VALUES ('7', 'RJXB201812018', '高鲁棒性低延迟的路由协议', '软件学报', '2018-04-15', '西北大学', '无线网络; 物联网; 延迟; 鲁棒性;', '0.00', '0', '', '', '', '已发表', '兰轩宇;陈晓江;徐丹;彭瑶;房鼎益');
INSERT INTO `paper` VALUES ('8', 'JFYZ201712010', '基于RFID的免携带设备手势识别关键技术研究', '计算机研究与发展', '2017-04-15', '西北大学', '无线手势识别; 射频识别; 免携带设备; 合成孔径雷达; 动态时间归整;', '0.00', '0', '', '', '', '已发表', '王旋;方河川;常俪琼;王举;陈晓江;房鼎益;彭瑶;陈峰');
INSERT INTO `paper` VALUES ('9', 'JSJX201902012', '面向多重应用的高鲁棒被动式定位模型研究', '计算机学报', '2019-04-15', '西北大学', '被动式定位; 高鲁棒; 信号到达角度; 角度误差补偿; 相干;', '0.00', '0', '', '', '', '已发表', '陈晓江;陈丽丽;李博航;汤战勇;谢彬彬;王薇;王安文;房鼎益');
INSERT INTO `paper` VALUES ('10', 'RJXB201712007', '基于数据价值的无人机数据收集方法', '软件学报', '2017-04-15', '西北大学', '无人机; 数据收集; 数据相似; 数据价值; 数据关键节点;', '0.00', '0', '', '', '', '已发表', '徐丹;李伟;王安文;范浩楠;龚晓庆;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('11', 'XBJZ201702009', '科研评价体系中学术论文评价实证分析', '长安大学学报(社会科学版)', '2017-04-15', '西北大学', '科研评价; 顶级会议论文; SCI期刊论文; 计算机学科;', '0.00', '0', '', '', '', '已发表', '陈峰;杨晓;陈晓江');
INSERT INTO `paper` VALUES ('12', 'SCLH201701022', '一种抗语义攻击的虚拟化软件保护方法', '工程科学与技术', '2017-04-15', '西北大学', '虚拟机软件保护; 数据流混淆; 语义攻击;', '0.00', '30', '', '其他', '', '已发表', '房鼎益;张恒;汤战勇;陈晓江');
INSERT INTO `paper` VALUES ('13', 'XXWX201609015', '一种代码碎片化的Android应用程序防二次打包方法', '小型微型计算机系统', '2016-04-15', '西北大学', 'Android安全; 恶意应用; 二次打包; 内存窃取; 加壳保护;', '0.00', '0', '', '', '', '已发表', '樊如霞;房鼎益;汤战勇;陈晓江;刘方圆;李政桥');
INSERT INTO `paper` VALUES ('14', 'HZLG201603006', '一种具有指令集随机化的代码虚拟化保护系统', '华中科技大学学报(自然科学版)', '2016-04-15', '西北大学', '安全系统; 虚拟机; 保护系统; 指令集; 逆向工程;', '0.00', '0', '', '', '', '已发表', '汤战勇;李光辉;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('15', 'HZLG201603013', '基于进程级虚拟机的软件防篡改方法', '华中科技大学学报(自然科学版)', '2016-04-15', '西北大学', '进程级虚拟机; 防篡改; 哨兵; 哨兵环; 反调试; 随机化;', '0.00', '0', '', '', '', '已发表', '汤战勇;郝朝辉;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('16', 'JSJX201708003', '一种基于RSSI的智能家居环境Evil-Twin攻击的检测方法', '计算机学报', '2017-04-15', '西北大学', '智能家居; 邪恶双胞胎; 无线网络; 攻击位置检测; 伪造AP; 信号强度; 物联网; 传感器网络; 信息物理融合系统;', '0.00', '0', '', '', '', '已发表', '房鼎益;祁生德;汤战勇;陈晓江;顾元祥');
INSERT INTO `paper` VALUES ('17', 'RJXB201510014', '一种温度自适应无线传感网络时间同步方法', '软件学报', '2015-04-15', '西北大学', '时间同步; 频偏估计; 无线传感器网络; 环境自适应; 温度敏感度因子;', '0.00', '0', '', '', '', '已发表', '金梦;陈晓江;房鼎益;汤战勇;刘晨;徐丹;王薇');
INSERT INTO `paper` VALUES ('18', 'JFYZ201508018', '一种基于休眠调度的数据源拥塞控制方法', '计算机研究与发展', '2015-04-15', '西北大学', '拥塞控制; 数据源拥塞; 休眠调度; 异构无线传感网; 拥塞概率预测;', '0.00', '0', '', '', '', '已发表', '黄骏杰;陈晓江;刘晨;房鼎益;王薇;尹小燕;武岳山');
INSERT INTO `paper` VALUES ('19', 'JSJX201605014', '一种有效消除环境噪声的被动式目标定位方法', '计算机学报', '2016-04-15', '西北大学', '无线传感器网络; 被动式目标定位; 接收信号强度值; 有限状态马尔可夫链; 动态时间规整; 物联网;', '0.00', '0', '', '', '', '已发表', '常俪琼;房鼎益;陈晓江;王举;汤战勇;聂卫科;刘晨');
INSERT INTO `paper` VALUES ('20', 'SCLH2015S1016', '面向自动化建模的软件攻击技术分类研究', '四川大学学报(工程科学版)', '2015-04-15', '西北大学', '分类; 属性; 攻击技术; 自动化建模;', '0.00', '0', '', '', '', '已发表', '王瑾榕;房鼎益;陈晓江;王怀军;何路');
INSERT INTO `paper` VALUES ('21', 'JSJX201512003', '基于压缩感知的被动式移动目标轨迹测绘', '计算机学报', '2015-04-15', '西北大学', '被动式跟踪(定位); 压缩感知; 数据量; 物联网;', '0.00', '0', '', '', '', '已发表', '王举;陈晓江;常俪琼;房鼎益;邢天璋;聂卫科');
INSERT INTO `paper` VALUES ('22', 'XBDZ201406011', '野外传感网节点管理与数据传输的设计与实现', '西北大学学报(自然科学版)', '2014-04-15', '西北大学', '无线传感器网络; 网关; 休眠调度;', '0.00', '0', '', '', '', '已发表', '赵康;陈晓江;黄骏杰;李博航;房鼎益');
INSERT INTO `paper` VALUES ('23', 'CGQJ201412044', '随机布署平面传感器阵列实现色噪声下运动节点跟踪算法', '传感器与微系统', '2014-04-15', '西北大学', '节点定位; 辅助变量; 传感器阵列;', '0.00', '0', '', '', '', '已发表', '聂卫科;朱从光;房鼎益;陈晓江;冯大政');
INSERT INTO `paper` VALUES ('24', 'CGQJ201412039', '一种基于无线传感器阵列的到达方向检测方法', '传感器与微系统', '2014-04-15', '西北大学', '目标定位; 到达方向; 无线传感器阵列;', '0.00', '0', '', '', '', '已发表', '聂卫科;房鼎益;陈晓江;冯大政');
INSERT INTO `paper` VALUES ('25', 'XTFZ201412007', '一种循环最大降维的二维波达方向建模与仿真', '系统仿真学报', '2014-04-15', '西北大学', '目标定位; 波达方向; 导向矢量; 传感器阵列;', '0.00', '0', '', '', '', '已发表', '聂卫科;房鼎益;陈晓江;冯大政');
INSERT INTO `paper` VALUES ('26', 'JSYJ201504052', '基于收包评价的无线传感器网络部署', '计算机应用研究', '2015-04-15', '西北大学', '无线传感器网络; 部署; 收包评价; 丢包率;', '0.00', '0', '', '', '', '已发表', '辛强伟;房鼎益;陈晓江;王怀军');
INSERT INTO `paper` VALUES ('27', 'XBDZ201405013', '直接数据域双向多循环优化的二维波束形成', '西北大学学报(自然科学版)', '2014-04-15', '西北大学', '传感阵列处理; 多循环优化; 数据域;', '0.00', '0', '', '', '', '已发表', '聂卫科;房鼎益;冯大政;陈晓江;尹小燕');
INSERT INTO `paper` VALUES ('28', 'XDKD201405034', 'WSN中异构数据协同的目标定位方法', '西安电子科技大学学报', '2014-04-15', '西北大学', '无线传感器网络; 被动式定位; 信号强度; 红外测距; 贝叶斯图;', '0.00', '0', '', '', '', '已发表', '邢天璋;王举;陈晓江;房鼎益;杨哲');
INSERT INTO `paper` VALUES ('29', 'XXWX201410003', 'ODR:一种基于传输方向的无线传感器网络机会路由算法', '小型微型计算机系统', '2014-04-15', '西北大学', '无线传感器网络; 传输方向; 机会路由; 地理位置路由;', '0.00', '0', '', '', '', '已发表', '刘晨;陈晓江;汤战勇;房鼎益;徐丹;郭军;陈昊');
INSERT INTO `paper` VALUES ('30', 'SCLH201501005', '基于反调试的JavaScript代码保护方法研究', '四川大学学报(工程科学版)', '2015-04-15', '西北大学', 'HTML5; Java Script代码保护; 反调试;', '0.00', '0', '', '', '', '已发表', '陈晓江;董浩;房鼎益;王怀军;张凡');
INSERT INTO `paper` VALUES ('31', 'JSYJ201501040', '退避算法多负载状况下的退避窗口最优设定', '计算机应用研究', '2015-04-15', '西北大学', '无线传感网; 退避算法; 退避窗口; 吞吐量;', '0.00', '0', '', '', '', '已发表', '马纯;尹小燕;房鼎益;陈昊;韦泽鹏;陈晓江');
INSERT INTO `paper` VALUES ('32', 'XBDZ201404014', '无线传感器网络中基于二次估计的被动式目标定位方法', '西北大学学报(自然科学版)', '2014-04-15', '西北大学', '无线传感器网络; 被动式定位; 二次估计; 定位精度;', '0.00', '0', '', '', '', '已发表', '邢天璋;常俪琼;刘晨;聂卫科;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('33', 'CGQJ201406027', '无网络区域的无线传感器网络数据远程传输系统', '传感器与微系统', '2014-04-15', '西北大学', '无线传感器网络; 中转传输系统; 休眠调度; UHF/VHF频段;', '0.00', '0', '', '', '', '已发表', '陈少峰;邓周虎;谢冰;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('34', 'DZXU201403017', '白盒环境中防动态攻击的软件保护方法研究', '电子学报', '2014-04-15', '西北大学', '白盒环境; 防动态攻击; 软件保护; 虚拟机软件保护;', '0.00', '0', '', '', '', '已发表', '王怀军;房鼎益;董浩;陈晓江;汤战勇');
INSERT INTO `paper` VALUES ('35', 'JSJY201312020', '基于低占空比的机会汇聚树路由协议', '计算机应用', '2013-04-15', '西北大学', '无线传感器网络; 时间同步; 占空比; 机会路由; 转发概率;', '0.00', '0', '', '', '', '已发表', '徐丹;陈晓江;黄骏杰;尹小燕;房鼎益');
INSERT INTO `paper` VALUES ('36', 'JSJC201303023', '基于滑动缓存的WSN可靠协议及其能耗分析', '计算机工程', '2013-04-15', '西北大学', '可靠传输; 低能耗; 缓存; 动态调整; 马尔科夫链模型; 正态分布;', '0.00', '0', '', '', '', '已发表', '陈昊;房鼎益;陈晓江;陈峰;龚晓庆;马纯;秦朗;邢天章');
INSERT INTO `paper` VALUES ('37', 'XDKD201201029', '文物监测中无线传感器网络数据压缩算法', '西安电子科技大学学报', '2012-04-15', '西北大学', '文物监测; 数据压缩; 无线传感器网络; SDT算法; 分布式小波压缩算法; 能耗;', '0.00', '0', '', '', '', '已发表', '王举;房鼎益;陈晓江;邢天璋;张远;高宝建');
INSERT INTO `paper` VALUES ('38', 'JFYZ2011S2041', 'PDHP:一个适于土遗址微环境监测的WSN路由协议', '计算机研究与发展', '2011-04-15', '西北大学', 'WSN; 路由协议; 微环境监测; 土遗址保护;', '0.00', '0', '', '', '', '已发表', '陈晓江;房鼎益;张谦;刘晨;韩金枝');
INSERT INTO `paper` VALUES ('39', 'WXYJ201108002', '基于精简指令集的软件保护虚拟机技术研究与实现', '微电子学与计算机', '2011-04-15', '西北大学', '虚拟机; 软件保护; 软件多样性; 软件保护虚拟机;', '0.00', '0', '', '', '', '已发表', '汤战勇;王怀军;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('40', 'JSJK201011009', 'DRAD:一种基于异步休眠调度的无线传感器网络数据收集协议', '计算机工程与科学', '2010-04-15', '西北大学', '无线传感器网络; 数据收集; 异步休眠调度; 时间差修正;', '0.00', '0', '', '', '', '已发表', '刘微姗;陈晓江;段任;陈文娟;刘晨;房鼎益');
INSERT INTO `paper` VALUES ('41', 'JFYZ2010S2053', '基于云模型的土遗址形变判定', '计算机研究与发展', '2010-04-15', '西北大学', '无线传感器网络; 形变监测模型; 云模型; 土遗址; RSSI;', '0.00', '0', '', '', '', '已发表', '付莹;陈晓江;邢天璋;刘宝英;陈文娟;韩金枝;房鼎益');
INSERT INTO `paper` VALUES ('42', 'XBDZ201004016', '基于DSM的软件架构重构工具', '西北大学学报(自然科学版)', '2010-04-15', '西北大学', '软件架构; 架构重构; 逆向工程;', '0.00', '0', '', '', '', '已发表', '陈晓江;符凯;房鼎益;何路;陈峰;汤战勇');
INSERT INTO `paper` VALUES ('43', 'XXWX201008014', '一种无结构P2P网络中对抗Free-rider的新方法', '小型微型计算机系统', '2010-04-15', '西北大学', '搭便车; 分布式; 对等网络; 信誉;', '0.00', '0', '', '', '', '已发表', '康江;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('44', '1012278086.nh', '分布式系统软件体系结构建模与开发方法研究', '西北大学', '2010-06-30', '西北大学', '软件体系结构; 分布式系统; 软件体系结构描述; 交互风格; 软件体系结构求精;', '0.00', '0', '', '', '', '已发表', '陈晓江');
INSERT INTO `paper` VALUES ('45', 'XBDZ201003020', '基于透明加解密的数字内容安全防护系统', '西北大学学报(自然科学版)', '2010-04-15', '西北大学', '透明加解密; 文件系统过滤驱动程序; 数字内容保护; DRM;', '0.00', '0', '', '', '', '已发表', '张汉宁;房鼎益;陈晓江;汤战勇');
INSERT INTO `paper` VALUES ('46', 'JSGG201012025', '一种节能的基于定位的传感器路由算法', '计算机工程与应用', '2010-04-15', '西北大学', '无线传感器网络; 路由协议; 定位路由; 睡眠;', '0.00', '0', '', '', '', '已发表', '王钢;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('47', 'JSJA200911042', '集成安全分析的模型驱动软件开发方法研究', '计算机科学', '2009-04-15', '西北大学', '安全分析; 模型驱动架构; UML安全扩展;', '0.00', '0', '', '', '', '已发表', '陈峰;李伟华;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('48', 'JDMT200910001071', '一种土遗址保护传感器网络轻量级数据融合协议', '第18届全国多媒体学术会议（NCMT2009）、第5届全国人机交互学术会议（CHCI2009）、第5届全国普适计算学术会议（PCC2009）论文集', '2009-10-29', '西北大学', '无线传感器网络; 土遗址; 网络寿命; 数据融合;', '0.00', '0', '', '', '', '已发表', '黄学青;房鼎益;刘宝英;陈晓江;张谦;付莹');
INSERT INTO `paper` VALUES ('49', 'JSYJ200909079', '传感器网络中基于非均匀分簇负载均衡路由算法', '计算机应用研究', '2009-04-15', '西北大学', '无线传感器网络; 非均匀分簇; 能量空洞; 负载均衡;', '0.00', '0', '', '', '', '已发表', '黄琛;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('50', 'JYRJ200906027', '基于任务-操作的访问控制模型研究', '计算机应用与软件', '2009-04-15', '西北大学', '访问控制; 基于角色访问控制; 基于操作访问控制; 基于任务-操作的访问控制; 基于任务-角色的访问控制;', '0.00', '0', '', '', '', '已发表', '乔卫;房鼎益;何路;陈晓江');
INSERT INTO `paper` VALUES ('51', 'XXWX200903018', 'P2P流媒体传输协议及其QoS优化研究', '小型微型计算机系统', '2009-04-15', '西北大学', 'P2P; CollectCast; 多发送端对单接收端; 节点传输; QoS NS2;', '0.00', '0', '', '', '', '已发表', '李文超;房鼎益;冯健;陈晓江');
INSERT INTO `paper` VALUES ('52', 'JSJC200823053', 'Linux系统中网络I/O性能改进方法的研究', '计算机工程', '2008-04-15', '西北大学', '网络I/O; Linux系统; Web服务器; 性能改善;', '0.00', '0', '', '', '', '已发表', '李涛;房鼎益;陈晓江;冯健');
INSERT INTO `paper` VALUES ('53', 'WJFZ200810046', '基于J2EE的网络考试系统设计与实现', '计算机技术与发展', '2008-04-15', '西北大学', '网络考试系统; J2EE; Struts; Hibernate; Ajax;', '0.00', '0', '', '', '', '已发表', '王爽;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('54', 'JYRJ200808021', '智能移动终端白板交互系统的研究与设计', '计算机应用与软件', '2008-04-15', '西北大学', '智能移动终端; 电子白板; 群件; 并发控制;', '0.00', '0', '', '', '', '已发表', '陈晓江;马东海;陈峰;房鼎益');
INSERT INTO `paper` VALUES ('55', 'JYRJ200807020', '基于任务角色访问控制的数据版权管理模型', '计算机应用与软件', '2008-04-15', '西北大学', '数字版权管理; 访问控制; T-RBAC; TR-EDRM;', '0.00', '0', '', '', '', '已发表', '罗养霞;冯健;陈晓江;何路;陈峰;房鼎益;');
INSERT INTO `paper` VALUES ('56', 'JYRJ200806027', '基于偏序简化的并发系统验证', '计算机应用与软件', '2008-04-15', '西北大学', '分布式系统; 并发系统; 偏序简化; 进程代数; 安全性;', '0.00', '0', '', '', '', '已发表', '王婷;罗养霞;房鼎益;陈晓江;何路');
INSERT INTO `paper` VALUES ('57', 'JSJA200805009', 'P2P流媒体激励机制研究', '计算机科学', '2008-04-15', '西北大学', 'P2P流媒体; 激励;', '0.00', '0', '', '', '', '已发表', '冯健;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('58', 'SXSZ200802008', '基于数字权限管理的访问控制模型研究', '陕西师范大学学报(自然科学版)', '2008-04-15', '西北大学', '数字权限管理; 访问控制; 工作流;', '0.00', '0', '', '', '', '已发表', '陈晓江;罗养霞;房鼎益;陈峰;何路;冯建');
INSERT INTO `paper` VALUES ('59', 'JSGG200804036', '并发系统的安全性与活性的验证方法', '计算机工程与应用', '2008-04-15', '西北大学', '并发系统; 安全性; 活性; 组合可达性; 标号迁移系统;', '0.00', '0', '', '', '', '已发表', '李杨;程建华;房鼎益;陈晓江;冯健');
INSERT INTO `paper` VALUES ('60', 'JSJC200724052', '基于SSFNet的蠕虫对抗仿真', '计算机工程', '2007-04-15', '西北大学', '良性蠕虫; SSFNet网络; SIRA模型;', '0.00', '0', '', '', '', '已发表', '齐文华;罗养霞;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('61', 'NJKF200710002025', '并发系统模型检测中的状态约减算法', '2007年全国开放式分布与并行计算机学术会议论文集(下册)', '2007-10-12', '西北大学', '通信系统演算; 模型检测; 组合可达性分析; 状态爆炸; 假定-保证算法; 安全性;', '0.00', '0', '', '', '', '已发表', '陈晓江;杨琛;冯健;房鼎益');
INSERT INTO `paper` VALUES ('62', 'WXYJ200710025', '并发系统模型检测中的状态约减算法', '微电子学与计算机', '2007-04-15', '西北大学', '通信系统演算; 模型检测; 组合可达性分析; 状态爆炸; 假定-保证算法; 安全性;', '0.00', '0', '', '', '', '已发表', '陈晓江;杨琛;冯健;房鼎益');
INSERT INTO `paper` VALUES ('63', 'JDMT200710001126', '一个智能移动终端白板系统的设计与实现', '第三届和谐人机环境联合学术会议（HHME2007）论文集', '2007-10-01', '西北大学', '智能移动终端; 电子白板; 计算机支持的协同工作; 并发控制;', '0.00', '0', '', '', '', '已发表', '陈晓江;冯健;马东海;房鼎益');
INSERT INTO `paper` VALUES ('64', 'JYRJ200708013', '一种可扩展的SMS中间件系统设计', '计算机应用与软件', '2007-04-15', '西北大学', '短消息服务; 短消息网关; SMS中间件; SDL（服务定义语言）; FSM（有穷状态自动机）;', '0.00', '0', '', '', '', '已发表', '汤战勇;房鼎益;陈晓江;吴晓南');
INSERT INTO `paper` VALUES ('65', 'XBDZ200703010', '一种有效的分布式构件交互性质验证方法', '西北大学学报(自然科学版)', '2007-04-15', '西北大学', '分布式系统; 构件交互; π-演算; 标记转移系统; 活性; 安全性;', '0.00', '0', '', '', '', '已发表', '杨琛;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('66', 'JYRJ200705011', '一个网络安全风险评估模型的研究与设计', '计算机应用与软件', '2007-04-15', '西北大学', '网络安全; 风险评估; 脆弱性; 攻击; 风险指数;', '0.00', '0', '', '', '', '已发表', '冯妍;房鼎益;陈晓江;');
INSERT INTO `paper` VALUES ('67', 'JYRJ200704015', '网络入侵事件防御决策技术研究', '计算机应用与软件', '2007-04-15', '西北大学', '网络安全; 入侵检测; 事件分析; 事件响应;', '0.00', '0', '', '', '', '已发表', '王莉娜;房鼎益;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('68', 'XBDZ200702010', '网络攻击技术研究进展', '西北大学学报(自然科学版)', '2007-04-15', '西北大学', '网络攻击; 入侵检测; 攻击响应策略;', '0.00', '0', '', '', '', '已发表', '陈峰;罗养霞;陈晓江;龚晓庆;房鼎益');
INSERT INTO `paper` VALUES ('69', 'JYRJ200701056', '基于拆分-协作方法的移动Agent安全保护', '计算机应用与软件', '2007-04-15', '西北大学', '移动Agent; 拆分; 协作; 恶意主机; 安全;', '0.00', '0', '', '', '', '已发表', '宋亚奇;房鼎益;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('70', 'JSJC200623048', '基于陷阱网络的未知蠕虫行为模式挖掘', '计算机工程', '2006-04-15', '西北大学', '行为模式挖掘; 遗传算法; 陷阱网络; 蠕虫;', '0.00', '0', '', '', '', '已发表', '房鼎益;汤战勇;陈晓江;吴晓南');
INSERT INTO `paper` VALUES ('71', 'JSJC200620057', '基于多常量编码的动态图软件水印保护技术', '计算机工程', '2006-04-15', '西北大学', '动态图软件水印; 鲁棒性; 常量编码; 伪水印; 防篡改;', '0.00', '0', '', '', '', '已发表', '沈静博;房鼎益;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('72', 'WXYJ200610058', '网格计算:现状与进展', '微电子学与计算机', '2006-04-15', '西北大学', '网格计算; 分布式计算; 中件间;', '0.00', '0', '', '', '', '已发表', '王义立;陈晓江;冯健;何路;陈锋;房鼎益');
INSERT INTO `paper` VALUES ('73', 'NJKF200610001018', 'Web文本内容过滤方法的研究', '2006年全国开放式分布与并行计算学术会议论文集（一）', '2006-10-01', '西北大学', '文本内容过滤; 文本向量; 关键词匹配; 关键词权重;', '0.00', '0', '', '', '', '已发表', '于海燕;陈晓江;冯健;房鼎益');
INSERT INTO `paper` VALUES ('74', 'NJKF200610001060', '电子文档保护系统的设计与实现', '2006年全国开放式分布与并行计算学术会议论文集（一）', '2006-10-01', '西北大学', '数字版权管理; 电子文档保护; 版权描述语言;', '0.00', '0', '', '', '', '已发表', '符凯;陈晓江;何路;房鼎益');
INSERT INTO `paper` VALUES ('75', 'NJKF200610002059', '网格计算:现状与进展', '2006年全国开放式分布与并行计算学术会议论文集（二）', '2006-10-01', '西北大学', '网格计算; 分布式计算; 中件间;', '0.00', '0', '', '', '', '已发表', '王义立;陈晓江;冯健;何路;陈锋;房鼎益');
INSERT INTO `paper` VALUES ('76', 'WXYJ200609018', 'Web文本内容过滤方法的研究', '微电子学与计算机', '2006-04-15', '西北大学', '文本内容过滤; 文本向量; 关键词匹配; 关键词权重;', '0.00', '0', '', '', '', '已发表', '于海燕;陈晓江;冯健;房鼎益');
INSERT INTO `paper` VALUES ('77', 'WXYJ200609060', '电子文档保护系统的设计与实现', '微电子学与计算机', '2006-04-15', '西北大学', '数字版权管理; 电子文档保护; 版权描述语言;', '0.00', '0', '', '', '', '已发表', '符凯;陈晓江;何路;房鼎益');
INSERT INTO `paper` VALUES ('78', 'JYRJ200608019', '基于UML的构件检索', '计算机应用与软件', '2006-04-15', '西北大学', 'CBD; 构件检索; 领域模型; 复用构件库; UML;', '0.00', '0', '', '', '', '已发表', '冯艳华;房鼎益;陈晓江;刘炜');
INSERT INTO `paper` VALUES ('79', 'WXYJ200608014', '间谍软件和反间谍软件的分析与研究', '微电子学与计算机', '2006-04-15', '西北大学', '间谍软件; 计算机安全; 反间谍软件; 隐藏; 受害主机;', '0.00', '0', '', '', '', '已发表', '杨珂;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('80', 'XBDZ200506009', '基于构件的分布式软件构架求精', '西北大学学报(自然科学版)', '2005-04-15', '西北大学', '软件构架; 分布式系统; CBD; UML;', '0.00', '0', '', '', '', '已发表', '段任;陈晓江;安娜;房鼎益');
INSERT INTO `paper` VALUES ('81', 'RZNX200510001010', '考试方法改革与计算机考试系统的研制和应用', '计算机与教育——全国计算机辅助教育学会第十二届学术年会论文集', '2005-10-12', '西北大学', '考试; 考试方法改革; 网络化考试; 远程教育;', '0.00', '0', '', '', '', '已发表', '安娜;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('82', 'XTYD200509042', '基于神经网络的异常入侵检测系统', '系统工程与电子技术', '2005-04-15', '西北大学', '网络安全; 入侵检测; BP神经网络; 程序行为;', '0.00', '0', '', '', '', '已发表', '李元兵;房鼎益;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('83', 'ZGTH200508006011', '基于程序行为分析的网络异常检测系统', '全国网络与信息安全技术研讨会\'2005论文集（上册）', '2005-08-01', '西北大学', '网络安全; 检测器; 程序行为; 强序列; BP神经网络;', '0.00', '0', '', '', '', '已发表', '房鼎益;汤战勇;李元兵;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('84', 'WXYJ200506020', '基于SOA体系结构的软件开发方法研究', '微电子学与计算机', '2005-04-15', '西北大学', 'SOA; Web服务; 功能重用; CMI;', '0.00', '0', '', '', '', '已发表', '魏东;陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('85', 'XBDZ200502007', '基于CORBA的媒体流构件模型', '西北大学学报(自然科学版)', '2005-04-15', '西北大学', 'CORBA; 媒体流; 构件; 交互风格;', '0.00', '0', '', '', '', '已发表', '陈晓江;房鼎益;刘炜;安娜;段任;冯艳华;赵彦锋');
INSERT INTO `paper` VALUES ('86', 'JSJC20050300Z', '面向模式的分布式软件构架可视化建模', '计算机工程', '2005-04-15', '西北大学', '模式; 软件构架; 构件; 分布式系统;', '0.00', '0', '', '', '', '已发表', '刘炜;房鼎益;陈晓江');
INSERT INTO `paper` VALUES ('87', 'ZGTH200408003069', '网络入侵事件协同分析与响应技术研究', '全国网络与信息安全技术研讨会’2004论文集', '2004-08-01', '西北大学', '事件分析; 事件响应; 模型推理; 有穷状态自动机;', '0.00', '0', '', '', '', '已发表', '房鼎益;王莉娜;王丽苹;吴晓南;陈晓江');
INSERT INTO `paper` VALUES ('88', 'XBDZ200302006', '基于构件的分布式系统设计环境', '西北大学学报(自然科学版)', '2003-04-15', '西北大学', '构件; 软件体系结构; 分布式系统; 基于构件的软件系统开发;', '0.00', '0', '', '', '', '已发表', '房鼎益;陈晓江;吴晓南');
INSERT INTO `paper` VALUES ('89', 'JYRJ200303001', '基于分布式构件的媒体流模型研究', '计算机应用与软件', '2003-04-15', '西北大学', '媒体流; 分布式构件; 动态绑定; 交互;', '0.00', '0', '', '', '', '已发表', '陈晓江;房鼎益');
INSERT INTO `paper` VALUES ('90', '2002070576.nh', '基于构件的分布式软件体系结构及其开发工具的研究与实现', '西北大学', '2002-04-01', '西北大学', '构件; 软件体系结构; 分布式系统; 建模工具; 媒体流;', '0.00', '0', '', '', '', '已发表', '陈晓江');

-- ----------------------------
-- Table structure for participate
-- ----------------------------
DROP TABLE IF EXISTS `participate`;
CREATE TABLE `participate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(128) NOT NULL,
  `project_id` varchar(128) NOT NULL,
  `teacher_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participate
-- ----------------------------
INSERT INTO `participate` VALUES ('1', '20210002', '61272461', '1');
INSERT INTO `participate` VALUES ('2', '20210002', '61170218', '0');
INSERT INTO `participate` VALUES ('3', '20210002', '61070176', '1');
INSERT INTO `participate` VALUES ('4', '20210002', '61202393', '1');

-- ----------------------------
-- Table structure for patent
-- ----------------------------
DROP TABLE IF EXISTS `patent`;
CREATE TABLE `patent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patent_id` varchar(128) NOT NULL,
  `patent_name` varchar(128) NOT NULL,
  `patent_owner` varchar(128) DEFAULT NULL,
  `patent_inventors` varchar(128) DEFAULT NULL,
  `patent_time` date DEFAULT NULL,
  `patent_state` varchar(128) DEFAULT NULL,
  `patent_type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patent
-- ----------------------------
INSERT INTO `patent` VALUES ('1', 'CN201910082787.3', '基于氮化钽材料的吸波/透波超表面的设计方法及其应用', '西北大学', '王夫蔚;任宇辉;李珂;高宝建;邓周虎;陈晓江', '2019-01-23', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('2', 'CN201710324105.6', '一种土体温度模式预测方法', '西北大学', '肖云;许震洲;王欣;王选宏;高颢函;陈晓江;房鼎益', '2017-05-09', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('3', 'CN201910423167.1', '一种折线路径弧线化的旋翼无人机节能路径优化方法', '西北大学', '王安文;姬翔;刘宝英;陈晓江;房鼎益;华庆一;陈峰', '2019-05-21', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('4', 'CN201710572122.1', '一种基于广告网络拓扑的恶意网页广告检测方法', '西北大学', '尹小燕;王华;汤战勇;倪礼刚;牛进平;侯爱琴;徐丹;陈峰;陈晓江;房鼎益', '2017-07-13', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('5', 'CN201810607025.6', '一种基于商用RFID的非接触式徒手健身活动识别方法', '西北大学', '陈晓江;王晔竹;张涛;刘宝英;房鼎益;陈峰;任宇辉', '2018-06-13', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('6', 'CN201910422934.7', '一种转角与距离结合的旋翼无人机节能路径优化方法', '西北大学', '姬翔;王安文;刘宝英;华庆一;陈峰;陈晓江;房鼎益', '2019-05-21', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('7', 'CN201810224237.6', '基于压缩感知的指纹库建立及RFID定位方法', '西北大学', '常俪琼;李欣怡;陈晓江;王举;孟海宁;房鼎益;汤战勇;王铮', '2018-03-19', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('8', 'CN201910475353.X', '一种基于卷积神经网络的室内定位方法', '西北大学', '邢天璋;廉英浩;陈晓江;房鼎益;彭瑶;刘晨', '2019-06-03', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('9', 'CN202010671269.8', '一种基于FPGA高吞吐反向散射细粒度移频编码方法', '西北大学', '彭瑶;方鹏飞;陈晓江;房鼎益;秦启慧;李荔垚;赵宇航;王俊;王夫蔚;王雪文;邓周虎', '2020-07-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('10', 'CN202010707218.6', '基于机器学习的射频信号检测方法及系统', '西北大学', '彭瑶;李荔垚;王俊;徐鹏;方鹏飞;陈晓江;赵宇航;房鼎益', '2020-07-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('11', 'CN201710477071.4', '一种基于ARM指令虚拟化的软件防护能耗评估方法', '西北大学', '房鼎益;陈美玲;汤战勇;李振;赵贝贝;陈晓江;龚晓庆;陈锋', '2017-06-21', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('12', 'CN201910554731.3', '一种基于前端字节码技术的JavaScript代码优化方法', '西北大学', '王薇;汤战勇;王帅;薛超;房鼎益;陈晓江', '2019-06-25', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('13', 'CN201810372791.9', '一种基于高频声波频率的持续身份认证方法', '西北大学', '汤战勇;李青佩;翟双姣;何中凯;龚晓庆;房鼎益;陈晓江;王薇', '2018-04-24', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('14', 'CN202010627279.1', '一种抗干扰散射通信系统天线阵的设计方法', '西北大学', '彭瑶;赵宇航;王夫蔚;陈晓江;房鼎益;秦启慧;王俊;李荔垚;方鹏飞;王雪文;邓周虎;徐鹏;肖云', '2020-07-02', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('15', 'CN202010650711.9', '一种同型异质结构IMPATT二极管及其制作方法', '西北大学', '戴扬;卢昭阳;雷晓艺;张云尧;廖晨光;张涵;贠江妮;马晓龙;赵武;张志勇;陈晓江', '2020-07-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('16', 'CN202010651096.3', '一种横向结构IMPATT二极管及其制备方法', '西北大学', '戴扬;卢昭阳;雷晓艺;张云尧;廖晨光;贠江妮;闫军锋;王雪文;赵武;张志勇;陈晓江', '2020-07-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('17', 'CN201710868373.4', '一种基于RF技术的书法临摹方法', '西北大学', '郭军;胡雪婷;常俪琼;李欣怡;牛近平;王安文;王举;陈晓江;房鼎益;汤战勇', '2017-09-22', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('18', 'CN201810446991.4', '基于代码下沉与残码解释的Android应用程序保护方法', '西北大学', '汤战勇;李振;何中凯;房鼎益;陈晓江;龚晓庆;陈峰;王薇', '2018-05-11', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('19', 'CN201710120547.9', '一种高鲁棒性低延迟的无线传感网路由方法', '西北大学', '陈晓江;兰轩宇;徐丹;彭瑶;尹小燕;房鼎益;汤战勇;郭军', '2017-03-02', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('20', 'CN202010200651.0', '一种基于类型推断的具有引导性的测试用例变异方法', '西北大学', '房鼎益;曹帅;叶贵鑫;田洋;姚厚友;汤战勇;陈晓江', '2020-03-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('21', 'CN202010200633.2', '一种基于深度学习图网络的加密算法识别方法', '西北大学', '龚晓庆;常原海;汤战勇;李朋;叶贵鑫;陈晓江;房鼎益', '2020-03-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('22', 'CN201910548389.6', '一种基于Wi-Fi网卡的近距离多用户隐蔽通信方法及系统', '西北大学', '牛进平;马跃;郭艺;张李;鱼跃华;陈峰;尹晓燕;陈晓江;房鼎益;汤战勇', '2019-06-24', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('23', 'CN201611059354.9', '基于增量自步学习和区域色彩量化的金丝猴面部检测方法', '西北大学', '许鹏飞;郭松涛;陈晓江;袁晶;何刚;陈峰;李保国;房鼎益', '2016-11-25', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('24', 'CN202010093807.X', '基于LoRa上行传输系统的高能效资源分配方法', '西北大学', '牛进平;郭艺;马跃;颉麦杰;杨香;张李;李艳艳;尹小燕;陈晓江;房鼎益', '2020-02-14', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('25', 'CN201810446970.2', '一种基于前端字节码技术的JavaScript虚拟化保护方法', '西北大学', '汤战勇;薛超;王帅;匡开圆;房鼎益;陈晓江;龚晓庆;陈峰', '2018-05-11', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('26', 'CN201710117961.4', '一种人脸图片聚类的方法', '西北大学', '郭军;赵晓伟;许鹏飞;袁璇;陈晓江;肖云', '2017-03-01', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('27', 'CN201710652602.9', '一种基于传感器数据与信号差值融合定位伪AP的方法', '西北大学', '房鼎益;杨蕾;汤战勇;李蓉;李青佩;龚晓庆;郭军;陈峰;陈晓江', '2017-08-02', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('28', 'CN201710453423.2', '一种基于ELF感染的Android本地层指令编译虚拟化加壳方法', '西北大学', '赵贝贝;房鼎益;汤战勇;宋丽娜;陈晓江;李振;龚晓庆;陈峰', '2017-06-15', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('29', 'CN201810977882.5', '边缘计算网络中兼顾优先级与公平性的数据协同传输方法', '西北大学', '尹小燕;贾茹昭;胡潇;王倩倩;王薇;牛进平;陈峰;刘宝英;陈晓江;房鼎益', '2018-08-27', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('30', 'CN201911281680.8', '一种Lora无线网络及其参数优化、传输方法及装置', '西北大学', '徐丹;张楠楠;丁娜娜;张晶;刘宝英;陈晓江;房鼎益', '2019-12-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('31', 'CN201710553192.2', '一种垂直扇区劈裂的下倾角优化和功率分配方法', '西北大学', '牛进平;李艳艳;索莲;李想;马跃;刘雨田;陈晓江;房鼎益', '2017-07-07', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('32', 'CN201911257349.2', '基于生成对抗网络中国书法风格转换模型构建方法及装置', '西北大学', '肖云;雷文龙;张颖;吴琨;常晓军;许鹏飞;郭军;陈晓江;房鼎益', '2019-12-10', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('33', 'CN201911088665.1', '一种基于LoRa信号的非接触式检测定位方法及系统', '西北大学', '陈丽丽;陈凯;韩典贺;房鼎益;陈晓江;陈峰;王安文;徐丹', '2019-11-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('34', 'CN201911102141.3', '一种无源backscatter长距离通信系统', '西北大学', '彭瑶;上官龙飞;陈晓江;房鼎益;何娟;胡悦;钱玉洁;林贤上;王俊', '2019-11-12', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('35', 'CN201911005055.0', '一种基于电容池的多能源能量采集系统', '西北大学', '彭瑶;陈晓江;方鹏飞;王俊;何娟;房鼎益', '2019-10-22', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('36', 'CN201911102162.5', '一种基于多元能量收集的能量管理方法', '西北大学', '彭瑶;王俊;郭军;何娟;赵宇航;陈晓江;汪霖;章勇勤;房鼎益', '2019-11-12', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('37', 'CN201810230242.8', '兼顾时间上下文与隐式反馈的IPTV电视节目个性化推荐方法', '西北大学', '尹小燕;王华;米晓倩;刘浩;徐成;许鹏飞;汤战勇;陈晓江;房鼎益', '2018-03-20', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('38', 'CN201710138361.6', '一种适用于大型野外环境的无线传感网络的路由方法', '西北大学', '陈晓江;高宏超;徐丹;彭瑶;尹小燕;房鼎益;汤战勇', '2017-03-09', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('39', 'CN201910423167.1', '一种折线路径弧线化的旋翼无人机节能路径优化方法', '西北大学', '王安文;姬翔;刘宝英;陈晓江;房鼎益;华庆一;陈峰', '2019-05-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('40', 'CN201910554731.3', '一种基于前端字节码技术的JavaScript代码优化方法', '西北大学', '王薇;汤战勇;王帅;薛超;房鼎益;陈晓江', '2019-06-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('41', 'CN201910475353.X', '一种基于卷积神经网络的室内定位方法', '西北大学', '邢天璋;廉英浩;陈晓江;房鼎益;彭瑶;刘晨', '2019-06-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('42', 'CN201610538537.2', '一种基于数据关键性节点的无人机数据收集方法', '西北大学', '房鼎益;梁思睿;王安文;徐丹;龚晓庆;李伟;肖云;陈晓江', '2016-07-08', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('43', 'CN201610575118.6', '一种基于WI-FI信号的非指纹被动式定位方法', '西北大学', '陈晓江;王晔竹;房鼎益;王安文;邢天璋;王薇;彭瑶;张远;王亮;王举', '2016-07-20', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('44', 'CN201910548389.6', '一种基于Wi-Fi网卡的近距离多用户隐蔽通信方法及系统', '西北大学', '牛进平;马跃;郭艺;张李;鱼跃华;陈峰;尹晓燕;陈晓江;房鼎益;汤战勇', '2019-06-24', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('45', 'CN201610873931.1', '一种基于细粒度子载波信息的低代价被动式定位方法', '西北大学', '房鼎益;王旋;王举;陈晓江;王安文;王薇;彭瑶;汤战勇;徐丹', '2016-09-30', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('46', 'CN201910438584.3', '一种基于RF技术的多目标呼吸频率检测方法及系统', '西北大学', '房鼎益;闫涛;陈凯;陈丽丽;韩典贺;陈晓江;陈峰;刘宝英;汤战勇;王安文', '2019-05-24', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('47', 'CN201910422934.7', '一种转角与距离结合的旋翼无人机节能路径优化方法', '西北大学', '姬翔;王安文;刘宝英;华庆一;陈峰;陈晓江;房鼎益', '2019-05-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('48', 'CN201910469425.X', '一种基于RFID的目标成像方法及系统', '西北大学', '陈晓江;尹壮;刘方;房鼎益;陈峰;刘宝英;孙雪', '2019-05-31', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('49', 'CN201910411715.9', '一种LoRa信号源识别方法', '西北大学', '房鼎益;何航;徐丹;陈晓江;陈峰;刘宝英', '2019-05-17', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('50', 'CN201710633515.9', '大规模3D MIMO反向TDD异构网络无线回程资源分配方法', '西北大学', '李艳艳;牛进平;陈晓璇;高宝建;马跃;刘雨田;陈晓江;房鼎益', '2017-07-28', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('51', 'CN201910394117.5', '基于Dex2C与LLVM的Android应用程序保护方法', '西北大学', '汤战勇;何中凯;张宇翔;王薇;龚晓庆;陈晓江;房鼎益', '2019-05-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('52', 'CN201910237218.1', '一种在线社交网络中节点相似性与凝聚力并重的信息传播方法', '西北大学', '尹小燕;胡潇;孙婷;米晓倩;刘长友;牛进平;陈峰;陈晓江;房鼎益', '2019-03-27', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('53', 'CN201710962064.3', '一种反向散射协议中多标签信号并行解码方法及系统', '西北大学', '房鼎益;孟鑫;金梦;孙雪;徐丹;陈晓江;陈峰;王安文;王薇;汤战勇', '2017-10-16', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('54', 'CN201910188751.3', '一种基于RF技术的呼吸频率检测方法', '西北大学', '房鼎益;陈丽丽;闫涛;陈晓江;陈凯;韩典贺;余思佳;汤战勇;王安文', '2019-03-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('55', 'CN201710684515.1', '基于双重ARM指令虚拟的Android应用程序保护方法', '西北大学', '汤战勇;赵贝贝;房鼎益;李振;陈晓江;龚晓庆;陈峰', '2017-08-11', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('56', 'CN201610529103.6', '一种基于信道干扰的保护用户行为隐私的方法', '西北大学', '房鼎益;张洁;汤战勇;李蓉;陈晓江;龚晓庆;陈峰;叶贵鑫', '2016-07-05', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('57', 'CN201610072508.1', '一种基于S-TLD的川金丝猴面部检测和追踪方法', '西北大学', '许鹏飞;叶贵鑫;常鸿莉;郭松涛;郑欣;李保国;何刚;陈晓江;房鼎益', '2016-02-02', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('58', 'CN201910127936.3', '社交网络中基于概念格的协作成本任务分配方法及其系统', '西北大学', '尹小燕;王倩倩;孙婷;孟一;金博;陈峰;陈晓江;房鼎益', '2019-02-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('59', 'CN201910072075.3', '具有本征子空间的图像鲁棒单步谱聚类方法', '西北大学', '肖云;任鹏真;王蓓蕾;赵珂;许鹏飞;郭军;王欣;陈晓江;房鼎益', '2019-01-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('60', 'CN201811630072.9', '一种基于WiFi信号的干扰检测及手势识别方法', '西北大学', '陈晓江;刘雨田;牛进平;颉麦杰;郭艺;马跃;房鼎益;陈峰;张涛;刘宝英', '2018-12-29', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('61', 'CN201610579861.9', '一种面向车联网的优化数据传输方法', '西北大学', '陈晓江;强敏;尹小燕;徐丹;王安文;王薇;郭军;房鼎益;张远', '2016-07-21', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('62', 'CN201910082787.3', '基于氮化钽材料的吸波/透波超表面的设计方法及其应用', '西北大学', '王夫蔚;任宇辉;李珂;高宝建;邓周虎;陈晓江', '2019-01-23', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('63', 'CN201811359582.7', '一种基于开源代码库的软件缺陷自动检测方法', '西北大学', '汤战勇;柯鑫;孔维星;叶贵鑫;房鼎益;陈晓江;陈峰;龚晓庆;王薇;李文瑾', '2018-11-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('64', 'CN201610551541.2', '一种基于指纹自适应环境变化的被动式室内定位方法', '西北大学', '常俪琼;冯超;房鼎益;陈晓江;王举;胡君豪;王薇;王安文;聂卫科', '2016-07-13', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('65', 'CN201610065909.4', '一种图像去噪处理方法及装置', '西北大学', '章勇勤;陈晓江;房鼎益;郑霞;肖进胜;兰慧;许鹏飞;肖云;陈峰;彭瑶;王安文', '2016-01-25', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('66', 'CN201810989222.9', '一种柔性流行嵌入的数据聚类方法', '西北大学', '肖云;任鹏真;赵珂;王蓓蕾;许鹏飞;郭军;王欣;陈晓江;房鼎益', '2018-08-28', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('67', 'CN201810977882.5', '边缘计算网络中兼顾优先级与公平性的数据协同传输方法', '西北大学', '尹小燕;贾茹昭;胡潇;王倩倩;王薇;牛进平;陈峰;刘宝英;陈晓江;房鼎益', '2018-08-27', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('68', 'CN201510485784.6', '一种基于压缩感知的低代价时间自适应室内定位方法', '西北大学', '常俪琼;强敏;王亮;李伟;陈晓江;郭军;王举;王安文;汤战勇;房鼎益', '2015-08-03', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('69', 'CN201610748446.1', '一种基于图像超分辨率的书法背景重建方法', '西北大学', '龚晓庆;王磊;许鹏飞;汤战勇;章勇勤;陈晓江;房鼎益', '2016-08-26', '已授权', '发明授权');
INSERT INTO `patent` VALUES ('70', 'CN201810594201.7', '神经网络及在移动感知设备上部署神经网络的方法', '西北大学', '邢天璋;杨康;龚晓庆;雷燕;陈峰;陈晓江;房鼎益', '2018-06-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('71', 'CN201810527946.1', '一种动作识别方法', '西北大学', '刘宝英;赵月;薛博文;李荔垚;陈峰;陈晓江;房鼎益', '2018-05-29', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('72', 'CN201810372791.9', '一种基于高频声波频率的持续身份认证方法', '西北大学', '汤战勇;李青佩;翟双姣;何中凯;龚晓庆;房鼎益;陈晓江;王薇', '2018-04-24', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('73', 'CN201810607025.6', '一种基于商用RFID的非接触式徒手健身活动识别方法', '西北大学', '陈晓江;王晔竹;张涛;刘宝英;房鼎益;陈峰;任宇辉', '2018-06-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('74', 'CN201810412422.8', '一种基于WiFi信号的被动式目标探测方法', '西北大学', '陈晓江;倪礼刚;王薇;陈峰;刘宝英;房鼎益;常丽琼', '2018-05-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('75', 'CN201810446094.3', '一种基于书写视频的笔画分割方法及书法临摹指导方法', '西北大学', '龚晓庆;许鹏飞;刘宝英;陈峰;郭军;肖云;陈晓江;房鼎益', '2018-05-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('76', 'CN201810325323.6', '一种鲁棒自动加权多特征聚类方法', '西北大学', '肖云;王长青;任鹏真;雷文龙;高颢函;许鹏飞;郭军;王欣;陈晓江;房鼎益', '2018-04-12', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('77', 'CN201810446991.4', '基于代码下沉与残码解释的Android应用程序保护方法', '西北大学', '汤战勇;李振;何中凯;房鼎益;陈晓江;龚晓庆;陈峰;王薇', '2018-05-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('78', 'CN201810478714.1', '一种基于商用Wi-Fi的被动式人数估计方法', '西北大学', '龚晓庆;梁思睿;王安文;刘宝英;陈晓江;房鼎益;陈峰;王夫蔚', '2018-05-18', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('79', 'CN201810446980.6', '一种基于迁移学习的跨场景无线信号感知方法', '西北大学', '汤战勇;张洁;李梦;房鼎益;龚晓庆;陈晓江;许鹏飞;王薇;陈峰', '2018-05-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('80', 'CN201810446970.2', '一种基于前端字节码技术的JavaScript虚拟化保护方法', '西北大学', '汤战勇;薛超;王帅;匡开圆;房鼎益;陈晓江;龚晓庆;陈峰', '2018-05-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('81', 'CN201810224237.6', '基于压缩感知的指纹库建立及RFID定位方法', '西北大学', '常俪琼;李欣怡;陈晓江;王举;孟海宁;房鼎益;汤战勇;王铮', '2018-03-19', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('82', 'CN201810188125.X', '在线社交网络中人际关系感知的广告推送方法', '西北大学', '尹小燕;胡潇;贾茹昭;王倩倩;牛进平;陈峰;陈晓江;房鼎益', '2018-03-07', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('83', 'CN201810230242.8', '兼顾时间上下文与隐式反馈的IPTV电视节目个性化推荐方法', '西北大学', '尹小燕;王华;米晓倩;刘浩;徐成;许鹏飞;汤战勇;陈晓江;房鼎益', '2018-03-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('84', 'CN201711106920.1', '一种目标识别方法', '西北大学', '陈晓江;纪青然;赵月;谢彬彬;陈峰;王安文;彭瑶;房鼎益', '2017-11-10', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('85', 'CN201710954189.1', '一种目标识别方法', '西北大学', '陈晓江;冯超;李欣怡;王举;常俪琼;房鼎益', '2017-10-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('86', 'CN201710952661.8', '一种目标成像方法', '西北大学', '陈晓江;李欣怡;冯超;王举;常俪琼;房鼎益', '2017-10-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('87', 'CN201710962064.3', '一种反向散射协议中多标签信号并行解码方法及系统', '西北大学', '房鼎益;孟鑫;金梦;孙雪;徐丹;陈晓江;陈峰;王安文;王薇;汤战勇', '2017-10-16', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('88', 'CN201711013603.5', '一种目标识别方法', '西北大学', '陈晓江;冯超;王旋;常俪琼;王举;房鼎益', '2017-10-26', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('89', 'CN201710868373.4', '一种基于RF技术的书法临摹方法', '西北大学', '郭军;胡雪婷;常俪琼;李欣怡;牛近平;王安文;王举;陈晓江;房鼎益;汤战勇', '2017-09-22', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('90', 'CN201710684515.1', '基于双重ARM指令虚拟的Android应用程序保护方法', '西北大学', '汤战勇;赵贝贝;房鼎益;李振;陈晓江;龚晓庆;陈峰', '2017-08-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('91', 'CN201710633515.9', '大规模3D MIMO反向TDD异构网络无线回程资源分配方法', '西北大学', '牛进平;李艳艳;陈晓璇;高宝建;马跃;刘雨田;陈晓江;房鼎益', '2017-07-28', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('92', 'CN201710477071.4', '一种基于ARM指令虚拟化的软件防护能耗评估方法', '西北大学', '房鼎益;陈美玲;汤战勇;李振;赵贝贝;陈晓江;龚晓庆;陈锋', '2017-06-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('93', 'CN201710453423.2', '一种基于ELF感染的Android本地层指令编译虚拟化加壳方法', '西北大学', '赵贝贝;房鼎益;汤战勇;宋丽娜;陈晓江;李振;龚晓庆;陈峰', '2017-06-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('94', 'CN201710572122.1', '一种基于广告网络拓扑的恶意网页广告检测方法', '西北大学', '尹小燕;王华;汤战勇;倪礼刚;牛进平;侯爱琴;徐丹;陈峰;陈晓江;房鼎益', '2017-07-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('95', 'CN201710791353.1', '一种针对CSI时频域信息攻击的用户行为隐私保护方法', '西北大学', '汤战勇;张洁;李梦;房鼎益;龚晓庆;陈晓江;陈峰', '2017-09-05', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('96', 'CN201710652602.9', '一种基于传感器数据与信号差值融合定位伪AP的方法', '西北大学', '房鼎益;杨蕾;汤战勇;李蓉;李青佩;龚晓庆;郭军;陈峰;陈晓江', '2017-08-02', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('97', 'CN201710572124.0', '同频带无线回程下行异构网络中3D波束赋形方法', '西北大学', '牛进平;王倩倩;尹小燕;李艳艳;李想;索莲;陈晓江;房鼎益', '2017-07-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('98', 'CN201710553192.2', '一种垂直扇区劈裂的下倾角优化和功率分配方法', '西北大学', '牛进平;李艳艳;索莲;李想;马跃;刘雨田;陈晓江;房鼎益', '2017-07-07', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('99', 'CN201710324105.6', '一种多元时序数据的模式预测方法', '西北大学', '肖云;许震洲;王欣;王选宏;高颢函;陈晓江;房鼎益', '2017-05-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('100', 'CN201710250167.7', '一种基于自适应特征降维的多标记数据分类方法', '西北大学', '龚晓庆;王磊;许鹏飞;郭军;肖云;徐丹;陈晓江;房鼎益', '2017-04-17', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('101', 'CN201710329645.3', '一种面向多重应用的被动式定位方法', '西北大学', '陈晓江;陈丽丽;倪礼刚;汤战勇;牛进平;房鼎益;彭瑶', '2017-05-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('102', 'CN201710138361.6', '一种适用于大型野外环境的无线传感网络的路由方法', '西北大学', '陈晓江;高宏超;徐丹;彭瑶;尹小燕;房鼎益;汤战勇', '2017-03-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('103', 'CN201710117961.4', '一种人脸图片聚类的方法', '西北大学', '郭军;赵晓伟;许鹏飞;袁璇;陈晓江;肖云', '2017-03-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('104', 'CN201710120547.9', '一种高鲁棒性低延迟的无线传感网路由方法', '西北大学', '陈晓江;兰轩宇;徐丹;彭瑶;尹小燕;房鼎益;汤战勇;郭军', '2017-03-02', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('105', 'CN201611059354.9', '基于增量自步学习和区域色彩量化的金丝猴面部检测方法', '西北大学', '许鹏飞;郭松涛;陈晓江;袁晶;何刚;陈峰;李保国;房鼎益', '2016-11-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('106', 'CN201611153581.8', '一种基于多径信号空间谱的被动式目标定位方法', '西北大学', '陈晓江;冯超;王举;房鼎益', '2016-12-14', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('107', 'CN201610966591.7', '众包系统中兼顾用户异质性与用户偏好的任务分配方法', '西北大学', '尹小燕;贾茹昭;胡潇;王倩倩;王薇;陈晓江;房鼎益', '2016-10-28', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('108', 'CN201610873931.1', '一种基于细粒度子载波信息的低代价被动式定位方法', '西北大学', '房鼎益;王旋;王举;陈晓江;王安文;王薇;彭瑶;汤战勇;徐丹', '2016-09-30', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('109', 'CN201610748446.1', '一种基于图像超分辨率的书法背景重建方法', '西北大学', '龚晓庆;王磊;许鹏飞;汤战勇;章勇勤;陈晓江;房鼎益', '2016-08-26', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('110', 'CN201610551797.3', '一种基于RFID的被动式目标追踪方法', '西北大学', '陈晓江;张立超;倪礼刚;房鼎益;王薇;王安文;刘晨;徐丹;刘宝英', '2016-07-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('111', 'CN201610575056.9', '一种低代价高鲁棒性的非绑定式活动识别方法', '西北大学', '陈晓江;张立超;谢彬彬;李荔垚;白蕊;邢天璋;彭瑶;王薇;房鼎益', '2016-07-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('112', 'CN201610748139.3', '一种多视角数据的半监督特征选择方法', '西北大学', '房鼎益;郑欣;许鹏飞;侯文静;徐丹;肖云;陈晓江;郭军;尹小燕', '2016-08-26', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('113', 'CN201610551541.2', '一种基于指纹自适应环境变化的被动式室内定位方法', '西北大学', '常俪琼;冯超;房鼎益;陈晓江;王举;胡君豪;王薇;王安文;聂卫科', '2016-07-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('114', 'CN201610538537.2', '一种基于数据关键性节点的无人机数据收集方法', '西北大学', '房鼎益;梁思睿;王安文;徐丹;龚晓庆;李伟;肖云;陈晓江', '2016-07-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('115', 'CN201610575118.6', '一种基于WI#FI信号的非指纹被动式定位方法', '西北大学', '陈晓江;王晔竹;房鼎益;王安文;邢天璋;王薇;彭瑶;张远;王亮;王举', '2016-07-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('116', 'CN201610537734.2', '一种无人机数据收集过程中的路径规划方法', '西北大学', '陈晓江;范浩楠;徐丹;王薇;郭军;尹小燕;李伟;房鼎益', '2016-07-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('117', 'CN201610579861.9', '一种面向车联网的优化数据传输方法', '西北大学', '陈晓江;强敏;尹小燕;徐丹;王安文;王薇;郭军;房鼎益;张远', '2016-07-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('118', 'CN201610399231.3', '一种具有数据流混淆的虚拟化软件保护方法', '西北大学', '房鼎益;张恒;汤战勇;周祥;陈晓江;龚晓庆;刘方圆;张洁;叶贵鑫;陈锋', '2016-06-07', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('119', 'CN201610389820.3', '一种快速定位Android敏感功能对应的驱动文件位置的方法', '西北大学', '汤战勇;李浩存;李政桥;周祥;房鼎益;陈晓江;龚晓庆;赵贝贝;陈峰', '2016-06-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('120', 'CN201610529103.6', '一种基于信道干扰的保护用户行为隐私的方法', '西北大学', '房鼎益;张洁;汤战勇;李蓉;陈晓江;龚晓庆;陈峰;叶贵鑫', '2016-07-05', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('121', 'CN201610279693.1', '一种基于smali代码混淆的Android应用保护方法', '西北大学', '房鼎益;刘方圆;汤战勇;陈晓江;赵贝贝;李政桥;龚晓庆;刑天璋;陈峰', '2016-04-28', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('122', 'CN201610149871.9', '一种基于攻击树的ROP防护方法', '西北大学', '汤战勇;吕留东;张恒;李政桥;房鼎益;陈晓江;周祥;龚晓庆;刘方圆;陈锋', '2016-03-16', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('123', 'CN201610072508.1', '一种基于S-TLD的川金丝猴面部检测和追踪算法', '西北大学', '许鹏飞;叶贵鑫;常鸿莉;郭松涛;郑欣;李保国;何刚;陈晓江;房鼎益', '2016-02-02', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('124', 'CN201610135566.4', '反污点分析软件保护方法', '西北大学', '汤战勇;周祥;李政桥;张恒;房鼎益;陈晓江;龚晓庆;刘方圆;吕留东;王华', '2016-03-10', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('125', 'CN201610108081.6', '一种抵抗符号执行和污点分析的软件保护方法', '西北大学', '汤战勇;张恒;吕留东;李政桥;房鼎益;龚晓庆;周祥;刘方圆;陈晓江;张洁;叶贵鑫;陈锋', '2016-02-26', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('126', 'CN201610178414.2', '一种基于时空相关性的土遗址监测数据修正拟合方法', '西北大学', '肖云;王磊;许鹏飞;王欣;王选宏;王薇;房鼎益;陈晓江;章勇勤', '2016-03-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('127', 'CN201610065909.4', '一种图像去噪处理方法及装置', '西北大学', '章勇勤;陈晓江;房鼎益;郑霞;肖进胜;兰慧;许鹏飞;肖云;陈峰;彭瑶;王安文', '2016-01-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('128', 'CN201610027313.5', '一种基于RFID的多目标被动式室内活动识别方法', '西北大学', '房鼎益;张立超;谢彬彬;倪礼刚;陈晓江;王薇;王安文;彭瑶;邢天璋', '2016-01-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('129', 'CN201610055172.8', '一种基于手机内置传感器的室内目标运动轨迹估计方法', '西北大学', '陈晓江;张鹏艳;马阳;汤战勇;房鼎益;彭瑶;王安文;聂卫科;张远;邢天璋', '2016-01-27', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('130', 'CN201510997890.2', '一种基于API安全属性隐藏与攻击威胁监控的软件保护方法', '西北大学', '汤战勇;郝朝辉;房鼎益;龚晓庆;陈峰;陈晓江;叶贵鑫;张洁;张恒', '2015-12-28', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('131', 'CN201511025912.5', '一种隐式反调试保护方法', '西北大学', '周祥;汤战勇;房鼎益;张洁;叶贵鑫;张恒;李政桥;刘方圆;吕留东;陈晓江;龚晓庆;陈锋', '2015-12-31', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('132', 'CN201510939043.0', '一种基于Wi-Fi信号的手势识别方法', '西北大学', '刘东东;王亮;李伟;陈晓江;汤战勇;彭瑶;张洁;王安文;任宇辉;郭松涛;何刚', '2015-12-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('133', 'CN201510868947.9', '一种基于RFID的细粒度多目标被动式定位方法', '西北大学', '谢彬彬;张立超;李荔垚;陈晓江;房鼎益;邢天璋;汤战勇;王安文;王薇;刘晨', '2015-12-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('134', 'CN201510846522.8', '一种基于防御网的Android应用防篡改方法及系统', '西北大学', '汤战勇;任庆峰;房鼎益;陈晓江;龚晓庆;陈峰;李政桥;刘方圆;陈美玲', '2015-11-27', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('135', 'CN201510881672.2', '一种基于RSSI的伪AP检测方法', '西北大学', '汤战勇;祁生德;陈晓江;房鼎益;陈峰;龚晓庆;匡开圆', '2015-12-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('136', 'CN201510810577.3', '一种基于K近邻抠图和数学形态学的书法字提取方法', '西北大学', '王磊;章勇勤;许鹏飞;陈晓江;房鼎益;王晔竹;赵菁菁', '2015-11-20', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('137', 'CN201510640987.8', '一种移动sink信息收集路径的可变维粒子群构建方法', '西北大学', '王薇;黄鹏宇;高宝建;聂卫科;王举;牛进平;陈晓江;房鼎益', '2015-09-30', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('138', 'CN201510548193.9', '一种基于代码碎片化的Android应用程序加壳保护方法及装置', '西北大学', '樊如霞;汤战勇;张洁;杨蕾;陈晓江;房鼎益;龚晓庆;刘方圆;李政桥', '2015-08-31', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('139', 'CN201510548665.0', '基于反射信号相位差的被动式定位方法', '西北大学', '陈晓江;王亮;陈丽丽;谢彬彬;王薇;李博航;王安文;汤战勇;房鼎益', '2015-08-31', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('140', 'CN201510429039.X', '基于数据价值动态估计的无线传感网移动sink数据收集方法', '西北大学', '李伟;王亮;崔文;龚晓庆;陈晓江;汤战勇;刘晨;王安文;郭军', '2015-07-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('141', 'CN201510438666.X', '一种基于车辆密度分布的数据传输路径选择方法', '西北大学', '崔文;王亮;刘东;徐丹;汤战勇;陈晓江;王安文;龚晓庆;郭军;房鼎益', '2015-07-23', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('142', 'CN201510374274.1', '基于RSS分布的距离自适应的无线传感网络被动式定位方法', '西北大学', '刘晨;王晔竹;王亮;李伟;韩鑫;王举;陈晓江;房鼎益;聂卫科;王薇', '2015-06-30', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('143', 'CN201510485784.6', '一种基于压缩感知的低代价时间自适应室内定位方法', '西北大学', '常俪琼;强敏;王亮;李伟;陈晓江;郭军;王举;王安文;汤战勇;房鼎益', '2015-08-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('144', 'CN201510438360.4', '基于数据命名为中心的无线传感器网络异步休眠调度方法', '西北大学', '韩鑫;陈晓江;倪礼刚;徐丹;刘晨;尹小燕;王安文;房鼎益;汤战勇;王薇', '2015-07-23', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('145', 'CN201510375384.X', '一种具有指令集随机化的代码虚拟化软件保护系统', '西北大学', '李光辉;房鼎益;汤战勇;匡开圆;陈晓江;郝朝辉;祁生德;樊如霞;任庆峰;王蕾', '2015-06-30', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('146', 'CN201510309814.8', '野生动物保护传感网中能源有效的数据传输优化控制方法', '西北大学', '尹小燕;徐丹;孟鑫;王亮;郭军;汤战勇;陈晓江;房鼎益', '2015-06-05', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('147', 'CN201510256382.9', '一种恶意软件的多执行路径构造方法', '西北大学', '王蕾;汤战勇;张洁;王华;李光辉;房鼎益;陈晓江;叶贵鑫;张恒;吕留东;陈锋', '2015-05-19', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('148', 'CN201510157843.7', '一种基于空间迁移压缩感知的被动式定位方法', '西北大学', '常俪琼;房鼎益;陈晓江;王举;邢天璋;聂卫科;王薇;任宇辉', '2015-04-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('149', 'CN201510158163.7', '一种基于语义的二进制代码反混淆方法', '西北大学', '王蕾;郭军;汤战勇;房鼎益;陈晓江;李光辉;郝朝辉;王华;张恒;叶贵鑫;周祥;陈锋', '2015-04-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('150', 'CN201510151720.2', '电压自适应无线传感器网络时间同步方法', '西北大学', '金梦;赵菁菁;陈晓江;房鼎益;徐丹;刘晨;郭军;尹小燕;牛进平', '2015-04-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('151', 'CN201510158443.8', '一种任意阵接收对称虚拟变换2D-DOA分离算法', '西北大学', '聂卫科;徐楷杰;冯大政;陈晓江', '2015-04-03', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('152', 'CN201410631554.1', '一种基于空时数据的高分辨目标方位估计方法', '西北大学', '聂卫科;朱从光;房鼎益;陈晓江', '2014-11-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('153', 'CN201410631671.8', '一种高分辨率的二维参数估算方法', '西北大学', '聂卫科;朱从光;房鼎益;陈晓江', '2014-11-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('154', 'CN201410632194.7', '一种基于无线传感器阵列的到达方向检测方法', '西北大学', '聂卫科;徐楷杰;房鼎益;陈晓江', '2014-11-11', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('155', 'CN201410482991.1', '一种野外条件下无线传感器网络定位优化方法', '西北大学', '汤战勇;陈晓江;兰轩宇;房鼎益;刘晨;聂卫科;徐丹;邢天璋;任宇辉;王举', '2014-09-19', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('156', 'CN201410538553.2', '一种消除环境噪声的被动式定位方法', '西北大学', '房鼎益;常俪琼;方河川;汤战勇;王举;陈晓江;任宇辉;刘晨;聂卫科', '2014-10-13', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('157', 'CN201410456238.5', '基于压缩感知的被动式移动目标轨迹测绘方法', '西北大学', '房鼎益;王举;汤战勇;寇迦南;常俪琼;陈晓江;刘晨;聂卫科;邢天璋;任宇辉', '2014-09-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('158', 'CN201410418945.5', '大规模3D无线传感器网络基于凸划分的节点定位方法', '西北大学', '王兆强;汤战勇;陈晓江;房鼎益;任宇辉;刘晨;徐丹;聂卫科;邢天璋;王薇', '2014-08-22', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('159', 'CN201410360219.2', '一种基于休眠调度的数据源拥塞控制方法', '西北大学', '黄骏杰;陈晓江;张远;汤战勇;徐丹;刘晨;房鼎益;王薇', '2014-07-25', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('160', 'CN201410400684.4', '一种基于区域判定的多精度节点定位方法', '西北大学', '陈晓江;汤战勇;房鼎益;郑欣;赵晖;聂卫科;邢天璋;刘晨;徐丹;任宇辉', '2014-08-14', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('161', 'CN201410341165.5', '一种基于温度感知的无线传感器网络时间同步方法', '西北大学', '金梦;房鼎益;陈晓江;刘晨;徐丹;郭军', '2014-07-17', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('162', 'CN201410255447.3', '一种基于多网关数据传输的无线传感网络路由方法', '西北大学', '徐丹;陈晓江;王绿菊;郭军;刘晨;房鼎益;王薇;尹小燕;聂卫科', '2014-06-10', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('163', 'CN201410234822.6', '一种基于多普勒频移的被动式移动目标定位方法', '西北大学', '赵康;陈晓江;聂卫科;王举;房鼎益;张远;任宇辉;邢天璋;王亮', '2014-05-29', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('164', 'CN201410283576.3', '一种基于区域划分的目标无线设备定位方法', '西北大学', '陈少峰;房鼎益;陈晓江;邓周虎;张远;聂卫科;邢天璋;刘晨;徐丹', '2014-06-23', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('165', 'CN201410216133.2', '一种基于网络编码的无线网状网络介质访问控制方法', '西北大学', '李海涛;陈晓江;房鼎益;刘晨;徐丹;王薇;尹小燕;郭军', '2014-05-21', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('166', 'CN201410140300.X', '一种基于电压感知的无线传感器网络时间同步方法', '西北大学', '金梦;房鼎益;陈晓江;刘晨;聂卫科;王薇;邢天璋;尹小燕', '2014-04-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('167', 'CN201410018508.4', '一种基于代码变形的二进制代码混淆方法', '西北大学', '王怀军;房鼎益;李光辉;张聪;许广莲;董浩;王瑾榕;党舒凡;王琳;姜河;何路;陈晓江', '2014-01-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('168', 'CN201310652152.5', '一种基于迁移压缩感知的多种类多目标被动式定位方法', '西北大学', '王举;房鼎益;常俪琼;陈晓江;聂卫科;邢天璋;刘晨;张远', '2013-12-04', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('169', 'CN201310651614.1', '一种无线传感器节点随机部署的被动式目标定位方法', '西北大学', '房鼎益;王举;陈晓江;常俪琼;邢天璋;聂卫科;刘晨;肖云', '2013-12-04', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('170', 'CN201310471447.2', '一种基于传输方向的无线传感器网络路由方法及装置', '西北大学', '刘晨;陈晓江;金梦;黄骏杰;尹小燕;房鼎益;赵晖;屈超;聂卫科;邢天璋;陈峰;段任', '2013-10-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('171', 'CN201310488535.3', '用于间歇性连通无线传感器网络的路由协议', '西北大学', '房鼎益;韩雨涝;陈晓江;刘晨;尹小燕;王薇', '2013-10-17', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('172', 'CN201310476591.5', '无线传感网随机部署下的目标定位方法', '西北大学', '邢天璋;陈晓江;屈超;房鼎益;王如晨;张远;聂卫科;刘晨;王薇', '2013-10-12', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('173', 'CN201310473303.0', '一种基于旋转RSS的单信标定位方法', '西北大学', '任丽晴;房鼎益;陈晓江;黄骏杰;邢天璋;聂卫科;刘晨;马阳;赵康;张远', '2013-10-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('174', 'CN201310476866.5', '无线传感器网络复杂区域划分方法和节点定位方法', '西北大学', '高宝建;邢天璋;王兆强;陈晓江;房鼎益;周莹;聂卫科;刘晨;王薇;张远', '2013-10-12', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('175', 'CN201310471219.5', '基于区域划分与虚拟目的节点的可靠机会路由方法及装置', '西北大学', '刘晨;金梦;陈晓江;房鼎益;崔文;陈昊;黄骏杰;段任;尹小燕;王薇;张远', '2013-10-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('176', 'CN201210376260.X', '一种基于节点密度的无线传感器网络分区域定位方法', '西北大学', '房鼎益;韩金枝;陈晓江;邢天璋;刘晨;聂卫科;肖云;张远;金梦;赵康', '2012-09-29', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('177', 'CN201210430753.7', '一种用于感知野外环境的物联网网关及其数据传输方法', '西北大学', '赵康;张远;房鼎益;邢天璋;陈晓江;尹晓燕;王举;刘晨;陈少峰;邓周虎;聂卫科;任宇辉', '2012-11-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('178', 'CN201210430755.6', '基于压缩感知的无线传感器网络多目标被动式定位方法', '西北大学', '王举;陈晓江;房鼎益;邢天璋;刘晨;郭松涛;任丽晴;聂伟科;张远;尹晓燕;陈峰', '2012-11-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('179', 'CN201210375054.7', '适用于无网络覆盖地区的远程中转传输系统及其传输方法', '西北大学', '陈少峰;邓周虎;房鼎益;邢天璋;张远;陈晓江;赵康;黄骏杰;尹小燕;肖云;聂卫科', '2012-09-29', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('180', 'CN201210148620.0', '一种中文超短文本的水印嵌入和提取方法', '西北大学', '何路;房鼎益;陈晓江;谢碧清', '2012-05-15', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('181', 'CN201210059809.2', '一种面向野生动物的无线传感器网络的目标定位方法', '西北大学', '房鼎益;刘晨;陈晓江;邢天璋;何阿静;王如晨;邓周虎;张远;王兆强;尹小燕;王举;赵晖', '2012-03-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('182', 'CN201210060081.5', '用于无线传感节点感知数据的上下文自适应商余编码方法', '西北大学', '房鼎益;任学军;陈晓江;陈少峰;赵康;王薇;邢天璋;张远;刘晨;王举;尹小燕', '2012-03-08', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('183', 'CN201110169906.2', '一种基于数据流切片的软件识别方法', '西北大学', '房鼎益;李磊;汤战勇;陈晓江;雷远晓;郭俊;何路;龚晓庆;王妮;王怀军;高宝健;邢天璋', '2011-06-22', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('184', 'CN201010282733.0', '一种无线传感器网络点对点传输协议', '西北大学', '房鼎益;段任;刘晨;陈晓江;王举;黄学青;邢天璋;高宝健;张远;何路;陈峰', '2010-09-16', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('185', 'CN200910218880.9', '基于透明加解密的数字内容安全防护系统及加解密方法', '西北大学', '房鼎益;张汉宁;高丽;汤战勇;陈晓江;杭继春;高沛;苏琳;章哲;安娜;李磊;赵玉洁;杨朕;何路;陈峰;王妮;胡伟;杨红', '2009-11-09', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('186', 'CN200910023743.X', '一种基于中文句式模板变换的文本隐藏方法', '西北大学', '何路;房鼎益;陈晓江;马广平', '2009-09-01', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('187', 'CN200910023498.2', '无线传感器网络数据收集路由方法及装置', '西北大学', '房鼎益;黄学青;刘微姗;陈晓江;孙镌宸;安娜;刘宝英;汤战勇;何路;张谦;魏媛', '2009-08-04', '已公开', '发明公开');
INSERT INTO `patent` VALUES ('188', 'CN200810018184.9', '嵌入式电信增值服务网关', '西北大学', '房鼎益;陈晓江;陈峰;安娜;冯健;何路;黄琛;罗养霞;李涛;彭瑞云;范训礼', '2008-05-14', '已公开', '发明公开');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(128) NOT NULL,
  `project_name` varchar(128) NOT NULL,
  `project_type` varchar(128) DEFAULT NULL,
  `project_source` varchar(128) DEFAULT NULL,
  `project_state` varchar(128) DEFAULT NULL,
  `project_principal` varchar(128) DEFAULT NULL,
  `project_principal_title` varchar(128) DEFAULT NULL,
  `project_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '61272461', '野生动物监测无线传感器网络中多目标被动式定位关键技术研究', '面上项目', '国家自然科学基金委员会', '已结题', '房鼎益', '教授', '2012-04-15');
INSERT INTO `project` VALUES ('2', '61170218', '分区统计模型与迁移学习相结合的大型土遗址传感网定位方法研究', '面上项目', '国家自然科学基金委员会', '已结题', '陈晓江', '教授', '2011-04-15');
INSERT INTO `project` VALUES ('3', '61070176', '土遗址保护无线传感器网络监测与信息融合研究', '面上项目', '国家自然科学基金委员会', '已结题', '房鼎益', '教授', '2010-04-15');
INSERT INTO `project` VALUES ('4', '61202393', '野生动物保护传感网的QoS保障机制及评价模型研究', '青年科学基金项目', '国家自然科学基金委员会', '已结题', '尹小燕', '副教授', '2012-04-15');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '', 'admin1', 'pbkdf2:sha256:150000$TT05jUpt$5e83126fa31a9f832ce07979a963fabfb507350763d8c48b82841c6ef49ac3a6', '管理员1');
INSERT INTO `user` VALUES ('2', '1753044001@qq.com', '20210002', 'pbkdf2:sha256:150000$2LmxERH4$171902dcd1297517edc62b4ab7c891da3e6b91b724129dab31abf41fe27efbf9', '陈晓江');
