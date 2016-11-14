/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : performance

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-11-14 15:37:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assist
-- ----------------------------
DROP TABLE IF EXISTS `assist`;
CREATE TABLE `assist` (
  `assistId` int(11) NOT NULL auto_increment,
  `assistName` varchar(25) default NULL,
  `employee` varchar(25) default NULL,
  `score` int(11) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`assistId`),
  KEY `assistEmployee` (`employee`),
  CONSTRAINT `assistEmployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assist
-- ----------------------------
INSERT INTO `assist` VALUES ('1', ', 其他', '11020403', '5', '2016-01-07');
INSERT INTO `assist` VALUES ('2', ', 其他', '11021950', '5', '2016-01-07');
INSERT INTO `assist` VALUES ('3', ', 其他', '20059616', '3', '2016-01-07');
INSERT INTO `assist` VALUES ('4', ', 其他', '20059615', '1', '2016-03-08');
INSERT INTO `assist` VALUES ('5', ', 其他', '11020249', '5', '2016-03-07');
INSERT INTO `assist` VALUES ('6', ', 其他', '20073800', '3', '2016-04-07');
INSERT INTO `assist` VALUES ('7', ', 其他', '11009171', '3', '2016-04-07');
INSERT INTO `assist` VALUES ('8', ', 其他', '11020958', '3', '2016-04-07');
INSERT INTO `assist` VALUES ('9', ', 其他', '20059616', '3', '2016-05-07');
INSERT INTO `assist` VALUES ('10', ', 其他', '12128145', '5', '2016-06-07');
INSERT INTO `assist` VALUES ('11', ', 其他', '20059615', '1', '2016-06-07');
INSERT INTO `assist` VALUES ('12', ', 其他', '20059615', '5', '2016-08-07');
INSERT INTO `assist` VALUES ('13', ', 其他', '20218676', '1', '2016-08-07');
INSERT INTO `assist` VALUES ('14', ', 其他', '20059616', '3', '2016-08-07');
INSERT INTO `assist` VALUES ('15', ', 其他', '20059616', '1', '2016-08-07');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `Classify_Id` int(11) NOT NULL auto_increment,
  `Classify_Name` varchar(20) default NULL,
  PRIMARY KEY  (`Classify_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `phaseId` int(11) NOT NULL,
  `projectId` varchar(30) NOT NULL,
  `employeeId` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `phaseId` (`phaseId`),
  KEY `projectId` (`projectId`),
  CONSTRAINT `phaseId` FOREIGN KEY (`phaseId`) REFERENCES `phase` (`phaseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('40288ae7581d571101581e5b6cea0000', '2015SDG6800LN', '2015-04-14', '3', 'SDG6800LN-HD02', '20059615');
INSERT INTO `comment` VALUES ('40288ae7581d571101581e622f1d0001', '2015DVBT7T35SR2', '2015-11-20', '3', '2015DVB-T7T35SR', '20152714');
INSERT INTO `comment` VALUES ('40288ae7581d571101581e6b09100002', '2015HD DVB-S22', '2015-04-30', '3', '2015HD DVB-S2 ENTEL', '20059616');
INSERT INTO `comment` VALUES ('40288ae7581d571101581e71718d0003', '2015ccxtel', '2015-07-07', '3', '2015ccxtelblock', '20059616');
INSERT INTO `comment` VALUES ('40288ae7581d571101581e724d3d0004', '2015ccxtel2', '2015-06-08', '3', '2015ccxtelblock', '20059616');
INSERT INTO `comment` VALUES ('4028f3815805849401580589016c0000', 'DVB-T2 GE', '2015-02-23', '3', '2015DVB-T2 GE', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657dfdd510157e161128a0000', 'GS100项目阶段评审', '2016-07-21', '3', 'GS100', '20218676');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4bc25780000', 'HD2000HS阶段评审', '2016-06-02', '3', 'HD2000HS', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4cf14620001', 'IHO-2905第二版', '2016-03-24', '3', 'IHO-2905', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4d2543b0002', 'IHO-2905第一版', '2016-01-15', '3', 'IHO-2905', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4d5fe950003', 'IHO-3300A阶段评审', '2016-09-18', '3', 'IHO-3300A', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4d9a5830004', '新疆天山云终端eoc阶段评审', '2016-06-27', '3', 'XJTS2016V2', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4dc074e0005', 'OTS-3000 SX评审', '2016-06-17', '3', 'OTS-3000 SX', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4e1b91b0006', '广西CH832R阶段评审', '2016-01-21', '3', 'CH832R', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4e2dd790007', '四川EP-3000阶段评审', '2016-07-04', '3', 'EP-3000', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4e631200008', 'ES100 UW2评审', '2016-03-23', '3', 'ES100 UW2', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4e7ec000009', 'U4B1项目评审', '2016-04-29', '3', 'ES100 U4BI', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4f6cf85000a', '5VT平台BOB', '2015-04-30', '3', '20155VTBOB', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4fcf72e000b', '中移物联网M101评审', '2016-06-08', '3', 'M10120160608', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e4ff7b8e000c', '3798M方案评审', '2016-08-08', '3', '3798M20160808', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5013009000d', 'HD 7250一版评审', '2016-04-28', '3', 'HD 7250', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e501b8e7000f', 'HD 7250二版评审', '2016-06-15', '3', 'HD 7250', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e505b2fc0010', 'IPTV8000阶段评审', '2016-07-20', '3', 'IPTV8000', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5074a030011', '云南省网阶段评审', '2016-03-15', '3', 'YN2016V01', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5090c9c0012', '马里阶段评审', '2016-10-09', '3', '20160810ML01', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5098f180013', 'CH-8500MU-GHITS', '2015-09-08', '3', 'CH-8500MU-GHITS', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e50aebda0014', '辽宁建平阶段评审', '2016-10-13', '3', '20160813LN01', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e50e92b30015', 'DVB-C9700 SY评审', '2016-03-22', '3', 'DVB-C9700 SY', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e51093da0016', 'DVB-C9700阶段评审', '2015-12-31', '3', 'DVB-C9700 HBM', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e51a4ed40017', 'DVB-S2 RIL第2版评审', '2016-02-18', '3', 'DVB-S2 RIL', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e51d442b0018', 'BCM7251S', '2015-09-14', '3', '2015BCM7251S', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e51dcb8e0019', 'MSA3B177阶段评审', '2016-04-27', '3', 'MSA3B177', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e51fb244001a', 'OTS-3000 SH阶段评审', '2016-06-07', '3', 'OTS-3000 SH', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e522bada001b', 'DMB-TH2000AVS评审', '2016-07-05', '3', 'DMB-TH2000AVS', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e523cd2a001c', 'SG6800LN-CA15', '2015-12-16', '3', 'SG6800LN-CA15', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e524b15b001d', 'SDG6800LN-HD02评审', '2016-03-03', '3', 'SDG6800LN-HD02', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e52690fa001e', '河南高清DVB-C8000评审', '2016-05-06', '3', 'DVB-C8000BGA HN1', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5287fac001f', '平台项目MSA6Z18评审', '2016-09-27', '3', 'MSA6Z18', '14000635');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e52a44430020', '英国高清CDVBT2阶段评审', '2016-10-20', '3', 'CDVBT2', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e52dd8940021', 'CH-8501M VMX评审', '2016-05-16', '3', 'CH-8501M VMX', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e52f73d50022', 'HI3716M V330评审', '2016-07-25', '3', 'HI3716M V330', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e530f7280023', '2015OTT', '2015-12-22', '3', '2015OTT', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e531163f0024', 'CH-6000M阶段评审', '2016-01-27', '3', 'CH-6000M-MSD5029-KCCL', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53252e00025', '2015CH-8501M-I', '2015-10-21', '3', '2015CH-8501M-I', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e532a1360026', 'AX7362阶段评审', '2016-05-09', '3', 'AX7362', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53415460027', '2015DVB-T7T35SR', '2015-09-02', '3', '2015DVB-T7T35SR', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5344a390028', '荷兰高清VS1265评审', '2016-05-20', '3', 'VS1265', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53598640029', '南美HD 7C55阶段评审', '2016-04-13', '3', 'HD-7C55', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e537166f002a', '2015IHO-3000', '2015-08-21', '3', '2015IHO-3000', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5374fed002b', 'CH-8600M评审', '2016-03-31', '3', 'CH-8600M', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e538de32002c', 'ALI3715-ICNCL评审', '2016-08-24', '3', 'CH-8600M-ALI3715-ICNCL', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53a336c002d', '2015IHO-1000 4K', '2015-12-21', '3', '2015IHO-1000 4K', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53a4913002e', 'HPH2000项目评审', '2016-06-06', '3', 'HPH2000', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53becec002f', 'DVB-S2 MSD7S75评审', '2016-03-23', '3', 'DVB-S2 MSD7S75', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53ce6ad0030', 'HDDVB-S2ENTEL', '2015-09-25', '3', '2015HD DVB-S2 ENTEL', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53da1da0031', '英国DAB阶段评审', '2016-01-25', '3', 'ENDABV01', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53efcc20032', 'HD DVB-S2 RIL', '2015-11-06', '3', '2015HD DVB-S2 RIL', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e53f69be0033', 'CH-8500M阶段评审', '2016-04-25', '3', 'CH-8500MU-NSTV', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54004340034', 'HD DVB-S2 RIL', '2015-10-26', '3', '2015HD DVB-S2 RIL', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e540f5470035', '德国高清DVB-T2阶段评审', '2016-06-02', '3', 'DVB-T2-GE-7T75', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e543221f0036', '意大利HD DVB-T2 评审', '2016-03-21', '3', 'HD DVB-T2 HEVC', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54339a10037', 'OTS-3000 GZ', '2015-11-21', '3', '2015OTS-3000 GZ', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54522b70038', '基于BCM33843的CM评审', '2016-04-07', '3', 'BCM33843-CM', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e545a49f0039', 'DVB-C9700 HB', '2015-12-10', '3', '2015DVB-C9700 HB', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5472cf8003a', '深圳天威Hi3798评审', '2016-08-05', '3', 'Hi3798-3383', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5477b0a003b', 'DVB-C9700 SX', '2015-09-09', '3', '2015DVB-C9700 SX', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e549b51a003c', '北京CM500 U2 GH评审', '2016-03-25', '3', 'CM500-U2-GH', '11020249');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54a013e003d', 'DVB-C9700 RG', '2015-12-21', '3', '2015DVB-C9700 RG', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54b608d003e', 'DVB-S2 5000 IRD', '2015-07-16', '3', '2015DVB-S2 5000 IRD', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54b9914003f', 'IHO-3300阶段评审', '2016-09-05', '3', 'IHO-3300', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54dcd570040', '北京DVBIP-1001评审', '2016-06-13', '3', 'DVBIP-1001', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54efae50041', '湖北高清OTS-3000HB评审', '2016-03-28', '3', 'OTS-3000HB', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e54f93a70042', 'MR2503C-F', '2015-12-31', '3', '2015MR2503C-F', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e550bf160043', 'OTS-3000 SZ阶段评审', '2016-04-07', '3', 'OTS-3000 SZ', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e55275de0044', 'DVB-S2 H239NZ评审', '2016-02-18', '3', 'DVB-S2 H239NZ PVR', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e55425a20045', 'DVB-C8000H SC', '2015-10-26', '3', '2015DVB-C8000H SC', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e554b6a10046', 'CT6000阶段评审', '2016-07-22', '3', 'CT6000', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e57dc4080047', '越南高清CFS-8888评审', '2016-09-18', '3', 'CFS-8888', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e57f40970048', '印度高清CH-6000M评审', '2016-04-01', '3', 'CH-6000M', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5aae7090049', 'DVB-C8000H SCL', '2015-12-10', '3', '2015DVB-C8000H SCL', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5af1cb4004a', 'MSO9380AK平台评审', '2016-09-22', '3', 'MSO9380AK', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5b1b2c2004b', '村村响编码控制器评审', '2016-03-31', '3', 'CCX0331', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5b92e1d004c', '江西IHO-3000E评审', '2016-04-29', '3', 'IHO-3000E', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5c9133d004d', 'EP-3000', '2015-02-28', '3', '2015EP-3000', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5cbb85f004e', 'CH-8600M', '2015-11-19', '3', '2015CH-8600M', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5ce1268004f', 'MSD5C37', '2015-10-19', '3', '2015MSD5C37', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5d59e810050', 'DVB-C8000H SC', '2015-11-09', '3', '2015DVB-C8000H SC(NZ)', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5df82710052', 'RTL8196E8192ER', '2015-09-15', '3', '2015RTL8196E8192ER', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657e4b6d30157e5e244670053', 'EPON41WIFI', '2015-11-20', '3', 'EPON41WIFI', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f490fea60000', '捷克高清DVB-S2 9100A', '2015-06-08', '3', '捷克高清DVB-S2 9100A', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f493e0770001', '2015HD3601', '2015-04-01', '3', '2015HD3601', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f4991a1a0002', '2015RK3128', '2015-03-12', '3', '2015RK3128', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f49c26620003', '2015CH-INPLUTO', '2015-07-10', '3', '2015CH-INPLUTO', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f4a285290004', '2015SDDVB-S2', '2015-06-29', '3', '2015SD DVB-S2 8500 ID', '11008845');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f4b46aa80005', '2015SDG6800LNHD', '2015-04-28', '3', '2015SDG6800LN-HD03', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f4b805450006', '2015ISDBT7542G', '2015-08-03', '3', '2015ISDB-T 7542G', '20152714');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f52babb70007', '2015ccxtelblock', '2015-06-08', '3', '2015ccxtelblock', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f53340d10008', '2015WWIO DVB-C', '2015-03-19', '3', '2015WWIO DVB-C', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5375e2c0009', '2015H273', '2015-03-02', '3', '2015H273', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f53e2be7000a', '2015HD DVBC273', '2015-04-14', '3', '2015HD DVB-C 273MOV', '20059616');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5427cbb000b', 'CH-INPLUTO-HD', '2015-07-16', '3', '2015CH-INPLUTO-HD', '14000635');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f54b7f1a000c', '2015Hi3796M', '2015-03-13', '3', '2015Hi3796M', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f552d7d8000d', 'ccxtelblockting', '2015-07-06', '3', '2015ccxtelblock', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f557e63b000e', 'ccxtelblockting1', '2015-06-17', '3', '2015ccxtelblock', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f55a2b76000f', 'ccxtelblockting2', '2015-07-10', '3', '2015ccxtelblock', '20073800');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f575bf420010', 'DVB-C8000BGA SXE', '2015-07-02', '3', '2015DVB-C8000BGA SXE', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f577d2a70011', 'DVBC8000BGASXE', '2015-05-22', '3', '2015DVB-C8000BGA SXE', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f57c9f4c0012', 'DVB-S5000MD', '2015-03-11', '3', '2015DVB-S5000MD', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5805aae0013', '2015MR2503C', '2015-04-17', '3', '2015MR2503C', '11021933');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f58243480014', 'DVB-S2 7200', '2015-10-27', '3', '2015DVB-S2 7200', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f585f6620015', 'EVO ENFINITY', '2015-07-02', '3', '2015EVO ENFINITY', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5888ec30016', 'MSD5029', '2015-08-05', '3', '2015MSD5029', '11008199');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f58e5d440017', 'DVB-C8100H AH', '2015-05-19', '3', '2015DVB-C8100H AH', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f590e3dd0018', 'OTS-2000HB', '2015-03-02', '3', '2015OTS-2000HB', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f596889a0019', '2015智能网关', '2015-03-18', '3', '2015智能网关', '12138029');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f59826b9001a', '2015CM500 ZJ', '2015-05-05', '3', '2015CM500 ZJ', '11020249');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f59b231f001b', '2015DVB-T 9000NN', '2015-06-12', '3', '2015DVB-T 9000NN', '11020249');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5a1cced001c', 'CM500 UW41F2S', '2015-11-13', '3', '2015CM500 UW41F2S', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5a3c78d001d', 'CM500 UW41F2S', '2015-04-16', '3', '2015CM500 UW41F2S', '11020809');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5be1310001e', 'DVB-C8000H SC', '2015-04-24', '3', '2015DVB-C8000H SC', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5c096d4001f', 'VB264TR CN', '2015-03-23', '3', '2015VB264TR CN', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5c2e3ed0020', 'neimengwifi', '2015-04-02', '3', '2015内蒙WIFI模块', '11021950');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5c64dc50021', 'RTL9602BGPON21', '2015-05-18', '3', 'RTL9602BGPON21', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5c91e5b0022', 'ZTELightCat', '2015-05-18', '3', '2015ZTELightCat', '20155707');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5caf03c0023', 'CH-8500ME', '2015-07-17', '3', '2015CH-8500ME', '11009145');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5cd84a10024', 'CH-8500M-ST273', '2015-06-29', '3', '2015CH-8500M-ST273-ABP', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5d0fa830025', 'CH-8501M', '2015-04-20', '3', '2015CH-8501M', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5d378a90026', 'CH-8560M', '2015-05-27', '3', '2015CH-8560M', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5d58e380027', 'GBS T-252', '2015-05-08', '3', '2015GBS T-252', '11022719');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5d8244e0028', 'SDG6800LN', '2015-06-10', '3', '2015SDG6800LN-CA10 Y3', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5dd9e8c0029', 'SDG6800LN', '2015-03-23', '3', '2015SDG6800LN-HD01', '20059615');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5e3ba18002b', 'DVB-C8000H ', '2015-05-22', '3', '2015DVB-C8000H SC(NZ)', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5e750ac002c', 'HD8800DS', '2015-04-17', '3', '2015HD8800DS', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5ea328d002d', 'HD8850 COMBO', '2015-06-18', '3', '2015HD8850 COMBO', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5ed647b002e', 'MSD7C75', '2015-08-04', '3', '2015MSD7C75', '11020958');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5efcacf002f', 'DVB-C8200H AH', '2015-05-25', '3', '2015DVB-C8200H AH', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5f2e7ca0030', 'AMLOGIC-S905', '2015-09-01', '3', 'AMLOGIC-S905', '20155708');
INSERT INTO `comment` VALUES ('8a87e29657f437cf0157f5f3fa5b0031', 'ccxtelblockkun', '2016-04-26', '3', '2015ccxtelblock', '20155708');

-- ----------------------------
-- Table structure for communication
-- ----------------------------
DROP TABLE IF EXISTS `communication`;
CREATE TABLE `communication` (
  `communicationId` int(11) NOT NULL auto_increment,
  `workEnthusiasm` varchar(10) default NULL,
  `communication` varchar(10) default NULL,
  `workPlan` varchar(10) default NULL,
  `employee` varchar(10) default NULL,
  PRIMARY KEY  (`communicationId`),
  KEY `communication` (`employee`),
  CONSTRAINT `communication` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communication
-- ----------------------------

-- ----------------------------
-- Table structure for comprehensive
-- ----------------------------
DROP TABLE IF EXISTS `comprehensive`;
CREATE TABLE `comprehensive` (
  `comprehensiveId` int(11) NOT NULL,
  `name` varchar(25) default NULL,
  `lowPoint` int(11) default NULL,
  `oneStep` int(11) default NULL,
  `score` int(11) default NULL,
  `type` varchar(25) default NULL,
  `mode` int(11) default NULL,
  PRIMARY KEY  (`comprehensiveId`),
  KEY `modeCom` (`mode`),
  CONSTRAINT `modeCom` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comprehensive
-- ----------------------------

-- ----------------------------
-- Table structure for data_dirt
-- ----------------------------
DROP TABLE IF EXISTS `data_dirt`;
CREATE TABLE `data_dirt` (
  `nID` int(11) NOT NULL auto_increment,
  `pID` int(11) default NULL,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`nID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dirt
-- ----------------------------
INSERT INTO `data_dirt` VALUES ('1', '0', '电路');
INSERT INTO `data_dirt` VALUES ('2', '1', '高频头');
INSERT INTO `data_dirt` VALUES ('15', '1', '接口');
INSERT INTO `data_dirt` VALUES ('16', '1', '主芯片');
INSERT INTO `data_dirt` VALUES ('17', '15', 'CA');
INSERT INTO `data_dirt` VALUES ('18', '15', '音视频');
INSERT INTO `data_dirt` VALUES ('19', '2', 'DVB-C');
INSERT INTO `data_dirt` VALUES ('20', '2', 'DVB-T');
INSERT INTO `data_dirt` VALUES ('21', '2', 'DVB-S');
INSERT INTO `data_dirt` VALUES ('22', '15', 'HDMI');
INSERT INTO `data_dirt` VALUES ('23', '1', 'CA');
INSERT INTO `data_dirt` VALUES ('24', '23', 'TDA8024');
INSERT INTO `data_dirt` VALUES ('25', '1', '在板电源');
INSERT INTO `data_dirt` VALUES ('26', '25', 'DC-DC');
INSERT INTO `data_dirt` VALUES ('27', '1', '测试认证');
INSERT INTO `data_dirt` VALUES ('28', '27', '辐射');
INSERT INTO `data_dirt` VALUES ('30', '1', '储存器');
INSERT INTO `data_dirt` VALUES ('31', '30', 'Memory');
INSERT INTO `data_dirt` VALUES ('32', '27', 'CA');
INSERT INTO `data_dirt` VALUES ('33', '1', '模块');
INSERT INTO `data_dirt` VALUES ('34', '33', 'WIFI 模块');
INSERT INTO `data_dirt` VALUES ('35', '1', '分离器件');
INSERT INTO `data_dirt` VALUES ('36', '35', '晶振');
INSERT INTO `data_dirt` VALUES ('37', '27', '浪涌');
INSERT INTO `data_dirt` VALUES ('38', '30', 'FLASH');
INSERT INTO `data_dirt` VALUES ('39', '1', '静电测试');
INSERT INTO `data_dirt` VALUES ('40', '2', '灵敏度指标');
INSERT INTO `data_dirt` VALUES ('41', '1', '接收单元');
INSERT INTO `data_dirt` VALUES ('42', '41', 'DVB-C');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL auto_increment,
  `departmentName` varchar(25) default NULL,
  PRIMARY KEY  (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '研发部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` varchar(20) NOT NULL,
  `name` varchar(30) default NULL,
  `password` varchar(25) default NULL,
  `email` varchar(50) default NULL,
  `tel` varchar(20) default NULL,
  `sex` varchar(10) default NULL,
  `job` int(11) default NULL,
  `department` int(11) default NULL,
  `phone` varchar(25) default NULL,
  `v_phone` varchar(25) default NULL,
  `address` varchar(100) default NULL,
  `permission` int(10) default NULL,
  `EmergencyName` varchar(30) default NULL,
  `EmergencyTel` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `employee1` (`job`),
  KEY `employee2` (`department`),
  CONSTRAINT `employee1` FOREIGN KEY (`job`) REFERENCES `job` (`jobId`),
  CONSTRAINT `employee2` FOREIGN KEY (`department`) REFERENCES `department` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('11004346', '杨建蓉', '4346', 'jianrong.yang@changhong.com', '', '', '2', '1', '13980149505', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11006882', '周均', '6882', 'zhouj@changhong.com', '', '', null, '1', '13989278312', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11007219', '王俊清', '7219', 'wangjq@changhong.com', '', '', '2', '1', '13881126602', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11007538', '向洪元', '7538', 'hongyuan.xiang@changhong.com', '', '', '1', '1', '13778032118', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11007541', '戴勇', '7541', 'yong.dai@changhong.com', '', '', '1', '1', '18081231025', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11008199', '孙晓虎', '8199', 'xiaohu.sun@changhong.com', '', '', '1', '1', '13795950699', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11008693', '敖志超', '8693', 'zhichao.ao@changhong.com', '', '', '2', '1', '13890172610', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11008845', '樊卫华', '8845', 'weihua.fan@changhong.com', '', '', '1', '1', '13881173459', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11009145', '卢朝军', '9145', 'chaojun.lu@changhong.com', '', '', '1', '1', '13890135385', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11009171', '彭军', '9171', 'jun.peng@changhong.com', '', '', '1', '1', '13881126515', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11009238', '王银彬', '9238', 'yinbin.wang@changhong.com', '', '', '2', '1', '13698123943', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11009486', '李德洪', '9486', 'lidehong@changhong.com', '', '', '2', '1', '15882865399', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11020249', '吴保雄', '0249', 'baoxiong.wu@changhong.com', '', '', '1', '1', '18981100737', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11020403', '吴楚宁', '0403', 'chuning.wu@changhong.com', '', '', '1', '1', '15983677275', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11020809', '吴志强', '0809', 'zhiqiang.wu@changhong.com', '', '', '1', '1', '18011134570', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11020843', '赖建新', '0843', 'jianxin.lai@changhong.com', '', '', '2', '1', '18081222357', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11020958', '张方方', '0958', 'fangfang.zhang@changhong.com', '', '', '1', '1', '18620300109', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11021640', '徐伟', '1640', 'wei-2.xu@changhong.com', '', '', '2', '1', '18675645625', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11021933', '任国', '1933', 'guo.ren@changhong.com', '', '', '1', '1', '13990107132', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11021950', '向亚君', '1950', 'yajun.xiang@changhong.com', '', '', '1', '1', '18011109770', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('11022719', '许金', '2719', 'jin.xu@changhong.com', '', '', '1', '1', '13990174196', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('12128145', '罗里刚', '8145', 'ligang.luo@changhong.com', '', '', '1', '1', '15882771079', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('12138029', '王思齐', '8029', 'siqi.wang@changhong.com', '', '', '1', '1', '18608098040', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('14000635', '李颖', '0635', 'ying2.li@changhong.com', '', '', '1', '1', '18681682356', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20059615', '杨显江', '9615', 'xianjiang.yang@changhong.com', '', '', '1', '1', '13778014171', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20059616', '姜海洋', '9616', 'haiyang2.jiang@changhong.com', '', '', '1', '1', '15883756289', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20073800', '罗婷', '3800', 'ting1.luo@changhong.com', '', '', '1', '1', '18681691651', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20152714', '何天龙', '2714', 'tianlong.he@changhong.com', '', '', '1', '1', '15182417575', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20155707', '徐龙', '5707', 'long.xu@changhong.com', '', '', '1', '1', '18780575168', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20155708', '张坤', '5708', 'kun3.zhang@changhong.com', '', '', '1', '1', '15181683787', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20218676', '汪滨波', '8676', 'binbo.wang@changhong.com', '', '', '1', '1', '15281115600', '', '', '1', '', '');
INSERT INTO `employee` VALUES ('20222822', '王涛', '2822', 'tao3.wang@changhong.com', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `employee` VALUES ('admin', 'admin', '123', 'admin@changhong.com', '0816-7666666', '男', '2', '1', '13666666666', '777777', '绵阳高新区', '2', 'test', '13656565656');

-- ----------------------------
-- Table structure for employeeexamr
-- ----------------------------
DROP TABLE IF EXISTS `employeeexamr`;
CREATE TABLE `employeeexamr` (
  `employeeExamRId` int(11) NOT NULL auto_increment,
  `employee` varchar(30) default NULL,
  `exam` int(11) default NULL,
  `score` int(11) default NULL,
  PRIMARY KEY  (`employeeExamRId`),
  KEY `employeeexam1` (`employee`),
  KEY `employeeexam2` (`exam`),
  CONSTRAINT `employeeexam1` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `employeeexam2` FOREIGN KEY (`exam`) REFERENCES `exam` (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeexamr
-- ----------------------------
INSERT INTO `employeeexamr` VALUES ('1', '11008199', '1', '97');
INSERT INTO `employeeexamr` VALUES ('2', '14000635', '1', '86');
INSERT INTO `employeeexamr` VALUES ('3', '20073800', '1', '92');
INSERT INTO `employeeexamr` VALUES ('4', '20059615', '1', '91');
INSERT INTO `employeeexamr` VALUES ('5', '11008845', '1', '90');
INSERT INTO `employeeexamr` VALUES ('6', '12128145', '1', '85');
INSERT INTO `employeeexamr` VALUES ('7', '11021950', '1', '99');
INSERT INTO `employeeexamr` VALUES ('8', '12138029', '1', '95');
INSERT INTO `employeeexamr` VALUES ('9', '20155707', '1', '85');
INSERT INTO `employeeexamr` VALUES ('10', '20155708', '1', '86');
INSERT INTO `employeeexamr` VALUES ('11', '11021933', '1', '89');
INSERT INTO `employeeexamr` VALUES ('12', '11009171', '1', '85');
INSERT INTO `employeeexamr` VALUES ('13', '11020809', '1', '98');
INSERT INTO `employeeexamr` VALUES ('14', '11022719', '1', '97');
INSERT INTO `employeeexamr` VALUES ('15', '11020249', '1', '90');
INSERT INTO `employeeexamr` VALUES ('16', '11009145', '1', '81');
INSERT INTO `employeeexamr` VALUES ('17', '11007541', '1', '80');
INSERT INTO `employeeexamr` VALUES ('18', '20152714', '1', '80');
INSERT INTO `employeeexamr` VALUES ('19', '11020958', '1', '90');
INSERT INTO `employeeexamr` VALUES ('20', '11008199', '1', '16');
INSERT INTO `employeeexamr` VALUES ('21', '11008199', '2', '100');
INSERT INTO `employeeexamr` VALUES ('22', '14000635', '2', '0');
INSERT INTO `employeeexamr` VALUES ('23', '20073800', '2', '100');
INSERT INTO `employeeexamr` VALUES ('24', '20059615', '2', '100');
INSERT INTO `employeeexamr` VALUES ('25', '11008845', '2', '98');
INSERT INTO `employeeexamr` VALUES ('26', '12128145', '2', '100');
INSERT INTO `employeeexamr` VALUES ('27', '11021950', '2', '100');
INSERT INTO `employeeexamr` VALUES ('28', '12138029', '2', '100');
INSERT INTO `employeeexamr` VALUES ('29', '20155707', '2', '93');
INSERT INTO `employeeexamr` VALUES ('30', '20155708', '2', '95');
INSERT INTO `employeeexamr` VALUES ('31', '11021933', '2', '100');
INSERT INTO `employeeexamr` VALUES ('32', '11009171', '2', '0');
INSERT INTO `employeeexamr` VALUES ('33', '11020809', '2', '100');
INSERT INTO `employeeexamr` VALUES ('34', '11022719', '2', '100');
INSERT INTO `employeeexamr` VALUES ('35', '11020249', '2', '90');
INSERT INTO `employeeexamr` VALUES ('36', '11009145', '2', '0');
INSERT INTO `employeeexamr` VALUES ('37', '11007541', '2', '95');
INSERT INTO `employeeexamr` VALUES ('38', '20152714', '2', '97');
INSERT INTO `employeeexamr` VALUES ('39', '11020958', '2', '100');
INSERT INTO `employeeexamr` VALUES ('40', '11008199', '2', '16');
INSERT INTO `employeeexamr` VALUES ('41', '11008199', '3', '100');
INSERT INTO `employeeexamr` VALUES ('42', '14000635', '3', '0');
INSERT INTO `employeeexamr` VALUES ('43', '20073800', '3', '100');
INSERT INTO `employeeexamr` VALUES ('44', '20059615', '3', '93');
INSERT INTO `employeeexamr` VALUES ('45', '11008845', '3', '94');
INSERT INTO `employeeexamr` VALUES ('46', '12128145', '3', '100');
INSERT INTO `employeeexamr` VALUES ('47', '11021950', '3', '100');
INSERT INTO `employeeexamr` VALUES ('48', '12138029', '3', '95');
INSERT INTO `employeeexamr` VALUES ('49', '20155707', '3', '80');
INSERT INTO `employeeexamr` VALUES ('50', '20155708', '3', '93');
INSERT INTO `employeeexamr` VALUES ('51', '11021933', '3', '95');
INSERT INTO `employeeexamr` VALUES ('52', '11009171', '3', '0');
INSERT INTO `employeeexamr` VALUES ('53', '11020809', '3', '95');
INSERT INTO `employeeexamr` VALUES ('54', '11022719', '3', '99');
INSERT INTO `employeeexamr` VALUES ('55', '11020249', '3', '98');
INSERT INTO `employeeexamr` VALUES ('56', '11009145', '3', '0');
INSERT INTO `employeeexamr` VALUES ('57', '11007541', '3', '95');
INSERT INTO `employeeexamr` VALUES ('58', '20152714', '3', '99');
INSERT INTO `employeeexamr` VALUES ('59', '11020958', '3', '93');
INSERT INTO `employeeexamr` VALUES ('60', '11008199', '3', '16');
INSERT INTO `employeeexamr` VALUES ('61', '11008199', '4', '97');
INSERT INTO `employeeexamr` VALUES ('62', '14000635', '4', '0');
INSERT INTO `employeeexamr` VALUES ('63', '20073800', '4', '98');
INSERT INTO `employeeexamr` VALUES ('64', '20059615', '4', '92');
INSERT INTO `employeeexamr` VALUES ('65', '11008845', '4', '94');
INSERT INTO `employeeexamr` VALUES ('66', '12128145', '4', '98');
INSERT INTO `employeeexamr` VALUES ('67', '11021950', '4', '100');
INSERT INTO `employeeexamr` VALUES ('68', '12138029', '4', '97');
INSERT INTO `employeeexamr` VALUES ('69', '20155707', '4', '80');
INSERT INTO `employeeexamr` VALUES ('70', '20155708', '4', '93');
INSERT INTO `employeeexamr` VALUES ('71', '11021933', '4', '95');
INSERT INTO `employeeexamr` VALUES ('72', '11009171', '4', '88');
INSERT INTO `employeeexamr` VALUES ('73', '11020809', '4', '100');
INSERT INTO `employeeexamr` VALUES ('74', '11022719', '4', '93');
INSERT INTO `employeeexamr` VALUES ('75', '11020249', '4', '96');
INSERT INTO `employeeexamr` VALUES ('76', '11009145', '4', '99');
INSERT INTO `employeeexamr` VALUES ('77', '11007541', '4', '99');
INSERT INTO `employeeexamr` VALUES ('78', '20152714', '4', '78');
INSERT INTO `employeeexamr` VALUES ('79', '11020958', '4', '95');
INSERT INTO `employeeexamr` VALUES ('80', '11008199', '4', '16');
INSERT INTO `employeeexamr` VALUES ('81', '11008199', '5', '97');
INSERT INTO `employeeexamr` VALUES ('82', '14000635', '5', '0');
INSERT INTO `employeeexamr` VALUES ('83', '20073800', '5', '98');
INSERT INTO `employeeexamr` VALUES ('84', '20059615', '5', '87');
INSERT INTO `employeeexamr` VALUES ('85', '11008845', '5', '94');
INSERT INTO `employeeexamr` VALUES ('86', '12128145', '5', '90');
INSERT INTO `employeeexamr` VALUES ('87', '11021950', '5', '99');
INSERT INTO `employeeexamr` VALUES ('88', '12138029', '5', '96');
INSERT INTO `employeeexamr` VALUES ('89', '20155707', '5', '86');
INSERT INTO `employeeexamr` VALUES ('90', '20155708', '5', '92');
INSERT INTO `employeeexamr` VALUES ('91', '11021933', '5', '77');
INSERT INTO `employeeexamr` VALUES ('92', '11020809', '5', '92');
INSERT INTO `employeeexamr` VALUES ('93', '11022719', '5', '92');
INSERT INTO `employeeexamr` VALUES ('94', '11020249', '5', '92');
INSERT INTO `employeeexamr` VALUES ('95', '11009145', '5', '0');
INSERT INTO `employeeexamr` VALUES ('96', '11007541', '5', '80');
INSERT INTO `employeeexamr` VALUES ('97', '20152714', '5', '99');
INSERT INTO `employeeexamr` VALUES ('98', '11020958', '5', '95');
INSERT INTO `employeeexamr` VALUES ('99', '11008199', '5', '16');
INSERT INTO `employeeexamr` VALUES ('100', '11008199', '6', '93');
INSERT INTO `employeeexamr` VALUES ('101', '14000635', '6', '0');
INSERT INTO `employeeexamr` VALUES ('102', '20073800', '6', '98');
INSERT INTO `employeeexamr` VALUES ('103', '20059615', '6', '98');
INSERT INTO `employeeexamr` VALUES ('104', '11008845', '6', '99');
INSERT INTO `employeeexamr` VALUES ('105', '12128145', '6', '93');
INSERT INTO `employeeexamr` VALUES ('106', '11021950', '6', '99');
INSERT INTO `employeeexamr` VALUES ('107', '12138029', '6', '0');
INSERT INTO `employeeexamr` VALUES ('108', '20155707', '6', '85');
INSERT INTO `employeeexamr` VALUES ('109', '20155708', '6', '0');
INSERT INTO `employeeexamr` VALUES ('110', '11021933', '6', '92');
INSERT INTO `employeeexamr` VALUES ('111', '11009171', '6', '80');
INSERT INTO `employeeexamr` VALUES ('112', '11020809', '6', '98');
INSERT INTO `employeeexamr` VALUES ('113', '11022719', '6', '92');
INSERT INTO `employeeexamr` VALUES ('114', '11020249', '6', '88');
INSERT INTO `employeeexamr` VALUES ('115', '11009145', '6', '96');
INSERT INTO `employeeexamr` VALUES ('116', '11007541', '6', '90');
INSERT INTO `employeeexamr` VALUES ('117', '20152714', '6', '96');
INSERT INTO `employeeexamr` VALUES ('118', '11020958', '6', '95');
INSERT INTO `employeeexamr` VALUES ('119', '20218676', '6', '95');
INSERT INTO `employeeexamr` VALUES ('120', '11008199', '6', '16');

-- ----------------------------
-- Table structure for employeemoder
-- ----------------------------
DROP TABLE IF EXISTS `employeemoder`;
CREATE TABLE `employeemoder` (
  `employeeModeId` int(11) NOT NULL auto_increment,
  `employee` varchar(25) default NULL,
  `mode` int(11) default NULL,
  `score` int(11) default NULL,
  PRIMARY KEY  (`employeeModeId`),
  KEY `33` (`employee`),
  KEY `44` (`mode`),
  CONSTRAINT `33` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `44` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeemoder
-- ----------------------------

-- ----------------------------
-- Table structure for employeeprojectr
-- ----------------------------
DROP TABLE IF EXISTS `employeeprojectr`;
CREATE TABLE `employeeprojectr` (
  `employeeProjectRId` int(11) NOT NULL auto_increment,
  `employee` varchar(25) default NULL,
  `project` varchar(30) default NULL,
  PRIMARY KEY  (`employeeProjectRId`),
  KEY `employeeProject1` (`employee`),
  KEY `employeeProject2` (`project`),
  CONSTRAINT `employeeProject1` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `employeeProject2` FOREIGN KEY (`project`) REFERENCES `project` (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeprojectr
-- ----------------------------
INSERT INTO `employeeprojectr` VALUES ('22', '11008845', 'CT6000');
INSERT INTO `employeeprojectr` VALUES ('23', '11008845', 'MSO9380AK');
INSERT INTO `employeeprojectr` VALUES ('24', '11008845', 'CH-6000M');
INSERT INTO `employeeprojectr` VALUES ('25', '11008845', 'CFS-8888');
INSERT INTO `employeeprojectr` VALUES ('26', '11008845', 'SG6800LN-SD01');
INSERT INTO `employeeprojectr` VALUES ('27', '20152714', '3798M20160808');
INSERT INTO `employeeprojectr` VALUES ('28', '20152714', 'M10120160608');
INSERT INTO `employeeprojectr` VALUES ('29', '20059616', 'DVB-S2 RIL');
INSERT INTO `employeeprojectr` VALUES ('30', '14000635', 'MSA6Z18');
INSERT INTO `employeeprojectr` VALUES ('31', '11009145', 'DVB-S2 H239NZ PVR');
INSERT INTO `employeeprojectr` VALUES ('32', '11009145', 'IHO-3300');
INSERT INTO `employeeprojectr` VALUES ('33', '11009145', 'OTS-3000 SZ');
INSERT INTO `employeeprojectr` VALUES ('34', '11009145', 'DVBIP-1001');
INSERT INTO `employeeprojectr` VALUES ('35', '11009145', 'OTS-3000HB');
INSERT INTO `employeeprojectr` VALUES ('36', '20073800', 'HD 7250');
INSERT INTO `employeeprojectr` VALUES ('37', '20073800', 'DVB-C9700 HBM');
INSERT INTO `employeeprojectr` VALUES ('38', '20073800', 'IPTV8000');
INSERT INTO `employeeprojectr` VALUES ('39', '20073800', 'DVB-C9700 SY');
INSERT INTO `employeeprojectr` VALUES ('40', '11008845', 'CH-8500MU-GHITS');
INSERT INTO `employeeprojectr` VALUES ('41', '20073800', '20160813LN01');
INSERT INTO `employeeprojectr` VALUES ('42', '11008845', 'SG6800LN-CA15');
INSERT INTO `employeeprojectr` VALUES ('43', '20073800', '20160810ML01');
INSERT INTO `employeeprojectr` VALUES ('44', '11008845', '捷克高清DVB-S2 9100A');
INSERT INTO `employeeprojectr` VALUES ('45', '20073800', 'YN2016V01');
INSERT INTO `employeeprojectr` VALUES ('46', '11008845', '2015HD3601');
INSERT INTO `employeeprojectr` VALUES ('47', '11021933', 'DVB-S2 MSD7S75');
INSERT INTO `employeeprojectr` VALUES ('48', '11021933', 'ENDABV01');
INSERT INTO `employeeprojectr` VALUES ('49', '11008845', '2015RK3128');
INSERT INTO `employeeprojectr` VALUES ('50', '11008845', '2015OTT');
INSERT INTO `employeeprojectr` VALUES ('51', '11008845', '2015CH-8501M-I');
INSERT INTO `employeeprojectr` VALUES ('52', '11008845', '2015CH-INPLUTO');
INSERT INTO `employeeprojectr` VALUES ('53', '11008199', 'CCX0331');
INSERT INTO `employeeprojectr` VALUES ('54', '11008845', '2015SD DVB-S2 8500 ID');
INSERT INTO `employeeprojectr` VALUES ('55', '11008199', 'IHO-3000E');
INSERT INTO `employeeprojectr` VALUES ('56', '20152714', '2015DVB-T7T35SR');
INSERT INTO `employeeprojectr` VALUES ('57', '20218676', 'GS100');
INSERT INTO `employeeprojectr` VALUES ('58', '12138029', 'CH-6000M-MSD5029-KCCL');
INSERT INTO `employeeprojectr` VALUES ('59', '20152714', '2015IHO-3000');
INSERT INTO `employeeprojectr` VALUES ('60', '12138029', 'CH-8501M VMX');
INSERT INTO `employeeprojectr` VALUES ('61', '20152714', '2015SDG6800LN-HD03');
INSERT INTO `employeeprojectr` VALUES ('62', '12138029', 'HI3716M V330');
INSERT INTO `employeeprojectr` VALUES ('63', '20152714', '2015ISDB-T 7542G');
INSERT INTO `employeeprojectr` VALUES ('64', '12138029', 'CDVBT2');
INSERT INTO `employeeprojectr` VALUES ('65', '20152714', '2015IHO-1000 4K');
INSERT INTO `employeeprojectr` VALUES ('66', '20059616', '2015HD DVB-S2 ENTEL');
INSERT INTO `employeeprojectr` VALUES ('67', '11020249', 'CM500-U2-GH');
INSERT INTO `employeeprojectr` VALUES ('69', '11020809', 'BCM33843-CM');
INSERT INTO `employeeprojectr` VALUES ('70', '20059616', '2015WWIO DVB-C');
INSERT INTO `employeeprojectr` VALUES ('71', '20059616', '2015H273');
INSERT INTO `employeeprojectr` VALUES ('72', '11020809', 'Hi3798-3383');
INSERT INTO `employeeprojectr` VALUES ('73', '20059616', '2015HD DVB-C 273MOV');
INSERT INTO `employeeprojectr` VALUES ('74', '20059616', '2015HD DVB-S2 RIL');
INSERT INTO `employeeprojectr` VALUES ('75', '11021950', 'HPH2000');
INSERT INTO `employeeprojectr` VALUES ('77', '20155707', 'ES100 U4BI');
INSERT INTO `employeeprojectr` VALUES ('79', '20155707', 'ES100 UW2');
INSERT INTO `employeeprojectr` VALUES ('80', '20155707', 'CH832R');
INSERT INTO `employeeprojectr` VALUES ('81', '20155707', 'EP-3000');
INSERT INTO `employeeprojectr` VALUES ('82', '11022719', 'AX7362');
INSERT INTO `employeeprojectr` VALUES ('83', '11022719', 'CH-8600M-ALI3715-ICNCL');
INSERT INTO `employeeprojectr` VALUES ('84', '11022719', 'CH-8600M');
INSERT INTO `employeeprojectr` VALUES ('85', '11022719', 'VS1265');
INSERT INTO `employeeprojectr` VALUES ('86', '11022719', 'HD-7C55');
INSERT INTO `employeeprojectr` VALUES ('87', '14000635', '2015CH-INPLUTO-HD');
INSERT INTO `employeeprojectr` VALUES ('88', '20059615', 'DMB-TH2000AVS');
INSERT INTO `employeeprojectr` VALUES ('89', '11009145', '2015CH-8500ME');
INSERT INTO `employeeprojectr` VALUES ('90', '20059615', 'OTS-3000 SH');
INSERT INTO `employeeprojectr` VALUES ('91', '11009145', '2015OTS-3000 GZ');
INSERT INTO `employeeprojectr` VALUES ('92', '11009145', '2015Hi3796M');
INSERT INTO `employeeprojectr` VALUES ('93', '20059615', 'SDG6800LN-HD02');
INSERT INTO `employeeprojectr` VALUES ('94', '20059615', 'MSA3B177');
INSERT INTO `employeeprojectr` VALUES ('95', '20059615', 'DVB-C8000BGA HN1');
INSERT INTO `employeeprojectr` VALUES ('96', '11020958', 'CH-8500MU-NSTV');
INSERT INTO `employeeprojectr` VALUES ('97', '11020958', 'DVB-T2-GE-7T75');
INSERT INTO `employeeprojectr` VALUES ('98', '11020958', 'HD DVB-T2 HEVC');
INSERT INTO `employeeprojectr` VALUES ('99', '20155708', 'IHO-2905');
INSERT INTO `employeeprojectr` VALUES ('100', '20155708', 'HD2000HS');
INSERT INTO `employeeprojectr` VALUES ('101', '20155708', 'IHO-3300A');
INSERT INTO `employeeprojectr` VALUES ('102', '20155708', 'XJTS2016V1');
INSERT INTO `employeeprojectr` VALUES ('103', '20155708', 'XJTS2016V2');
INSERT INTO `employeeprojectr` VALUES ('104', '20155708', 'OTS-3000 SX');
INSERT INTO `employeeprojectr` VALUES ('107', '20073800', '2015DVB-C9700 HB');
INSERT INTO `employeeprojectr` VALUES ('108', '20073800', '2015DVB-C9700 SX');
INSERT INTO `employeeprojectr` VALUES ('109', '11021933', '2015DVB-C8000BGA SXE');
INSERT INTO `employeeprojectr` VALUES ('110', '11021933', '2015DVB-S5000MD');
INSERT INTO `employeeprojectr` VALUES ('111', '11021933', '2015MR2503C');
INSERT INTO `employeeprojectr` VALUES ('112', '11008199', '2015DVB-C9700 RG');
INSERT INTO `employeeprojectr` VALUES ('113', '11008199', '2015DVB-S2 5000 IRD');
INSERT INTO `employeeprojectr` VALUES ('114', '11008199', '2015DVB-S2 7200');
INSERT INTO `employeeprojectr` VALUES ('115', '11008199', '2015EVO ENFINITY');
INSERT INTO `employeeprojectr` VALUES ('116', '11008199', '2015MSD5029');
INSERT INTO `employeeprojectr` VALUES ('117', '12138029', '2015DVB-C8100H AH');
INSERT INTO `employeeprojectr` VALUES ('118', '12138029', '2015MR2503C-F');
INSERT INTO `employeeprojectr` VALUES ('119', '12138029', '2015OTS-2000HB');
INSERT INTO `employeeprojectr` VALUES ('120', '12138029', '2015智能网关');
INSERT INTO `employeeprojectr` VALUES ('121', '11020249', '2015CM500 ZJ');
INSERT INTO `employeeprojectr` VALUES ('122', '11020249', '2015DVB-T 9000NN');
INSERT INTO `employeeprojectr` VALUES ('123', '11020809', '20155VTBOB');
INSERT INTO `employeeprojectr` VALUES ('124', '11020809', '2015CM500 UW41F2S');
INSERT INTO `employeeprojectr` VALUES ('125', '11020809', '2015BCM7251S');
INSERT INTO `employeeprojectr` VALUES ('126', '11021950', '2015DVB-C8000H SC');
INSERT INTO `employeeprojectr` VALUES ('127', '11021950', '2015DVB-C8000H SCL');
INSERT INTO `employeeprojectr` VALUES ('129', '11021950', '2015VB264TR CN');
INSERT INTO `employeeprojectr` VALUES ('130', '11021950', '2015内蒙WIFI模块');
INSERT INTO `employeeprojectr` VALUES ('133', '20155707', '2015EP-3000');
INSERT INTO `employeeprojectr` VALUES ('134', '20155707', '2015ZTELightCat');
INSERT INTO `employeeprojectr` VALUES ('135', '11022719', '2015CH-8500M-ST273-ABP');
INSERT INTO `employeeprojectr` VALUES ('136', '11022719', '2015CH-8501M');
INSERT INTO `employeeprojectr` VALUES ('137', '11022719', '2015CH-8560M');
INSERT INTO `employeeprojectr` VALUES ('138', '11022719', '2015CH-8600M');
INSERT INTO `employeeprojectr` VALUES ('139', '11022719', '2015GBS T-252');
INSERT INTO `employeeprojectr` VALUES ('140', '11022719', '2015MSD5C37');
INSERT INTO `employeeprojectr` VALUES ('141', '20059615', '2015SDG6800LN-CA10 Y3');
INSERT INTO `employeeprojectr` VALUES ('142', '20059615', '2015SDG6800LN-HD01');
INSERT INTO `employeeprojectr` VALUES ('144', '11020958', '2015DVB-C8000H SC(NZ)');
INSERT INTO `employeeprojectr` VALUES ('145', '11020958', '2015DVB-T2 GE');
INSERT INTO `employeeprojectr` VALUES ('146', '11020958', '2015HD8800DS');
INSERT INTO `employeeprojectr` VALUES ('147', '11020958', '2015HD8850 COMBO');
INSERT INTO `employeeprojectr` VALUES ('148', '11020958', '2015MSD7C75');
INSERT INTO `employeeprojectr` VALUES ('149', '20155708', '2015DVB-C8200H AH');
INSERT INTO `employeeprojectr` VALUES ('150', '20155708', '2015AMLOGIC S905');
INSERT INTO `employeeprojectr` VALUES ('151', '20073800', '2015ccxtelblock');
INSERT INTO `employeeprojectr` VALUES ('152', '20155708', '2015ccxtelblock');
INSERT INTO `employeeprojectr` VALUES ('153', '20059616', '2015ccxtelblock');
INSERT INTO `employeeprojectr` VALUES ('154', '11021950', '2015RTL8196E8192ER');
INSERT INTO `employeeprojectr` VALUES ('155', '20155707', 'EPON41WIFI');
INSERT INTO `employeeprojectr` VALUES ('156', '11009145', 'HD-DVB-CW-EL');
INSERT INTO `employeeprojectr` VALUES ('157', '11009145', 'DVBTH207NZPVR');
INSERT INTO `employeeprojectr` VALUES ('158', '11009145', 'HD500C');
INSERT INTO `employeeprojectr` VALUES ('159', '11009145', 'ISDBTH206BR');
INSERT INTO `employeeprojectr` VALUES ('160', '20152714', 'HI3798M');
INSERT INTO `employeeprojectr` VALUES ('161', '20155708', 'SML492HDrev110');
INSERT INTO `employeeprojectr` VALUES ('162', '20155708', 'OTS2000TJ');
INSERT INTO `employeeprojectr` VALUES ('163', '12138029', 'BCM72524K');
INSERT INTO `employeeprojectr` VALUES ('164', '12138029', 'CH5000MK');
INSERT INTO `employeeprojectr` VALUES ('165', '11020249', 'ITV628HD');
INSERT INTO `employeeprojectr` VALUES ('166', '11020249', 'CM100UW21C');
INSERT INTO `employeeprojectr` VALUES ('167', '11020249', 'IHO1128');
INSERT INTO `employeeprojectr` VALUES ('168', '11020249', 'CM100UW21CN');
INSERT INTO `employeeprojectr` VALUES ('169', '11020249', 'CM100UW21EI');
INSERT INTO `employeeprojectr` VALUES ('170', '11021950', 'videobridge');
INSERT INTO `employeeprojectr` VALUES ('171', '11021950', 'DVBS2MODULE');
INSERT INTO `employeeprojectr` VALUES ('172', '11021950', 'MSTAR7C51G');
INSERT INTO `employeeprojectr` VALUES ('173', '20155707', 'MTKMT7520FT');
INSERT INTO `employeeprojectr` VALUES ('174', '20059615', 'DY6000CZAPN');
INSERT INTO `employeeprojectr` VALUES ('175', '20059615', 'SG6800LNCA06Y2');
INSERT INTO `employeeprojectr` VALUES ('176', '20059615', 'DVBC8000BGATJ2');
INSERT INTO `employeeprojectr` VALUES ('177', '20059615', 'DVBC8000BGAPN');
INSERT INTO `employeeprojectr` VALUES ('178', '20059615', 'SG6800LNCA06Q3');
INSERT INTO `employeeprojectr` VALUES ('179', '11022719', 'DVBC8080CBH');
INSERT INTO `employeeprojectr` VALUES ('180', '11022719', 'DSR4639');
INSERT INTO `employeeprojectr` VALUES ('181', '11022719', 'CH5000MA');
INSERT INTO `employeeprojectr` VALUES ('182', '11022719', 'CH85000MIN');
INSERT INTO `employeeprojectr` VALUES ('183', '11022719', 'CH8500MU7STAR');
INSERT INTO `employeeprojectr` VALUES ('184', '11008845', 'AMLOGICS806');
INSERT INTO `employeeprojectr` VALUES ('185', '11008845', 'CH1000M');
INSERT INTO `employeeprojectr` VALUES ('186', '11008845', 'IHO2000');
INSERT INTO `employeeprojectr` VALUES ('187', '20059616', 'HD1200');
INSERT INTO `employeeprojectr` VALUES ('188', '20059616', 'ULTRAMINS2');
INSERT INTO `employeeprojectr` VALUES ('189', '20059616', 'ICE7547');
INSERT INTO `employeeprojectr` VALUES ('190', '20073800', 'DVBC9700GD');
INSERT INTO `employeeprojectr` VALUES ('191', '20073800', 'DVBC9700CGD');
INSERT INTO `employeeprojectr` VALUES ('193', '20073800', 'DVBC8000BGEHB1');
INSERT INTO `employeeprojectr` VALUES ('194', '20073800', 'HS200UW4S');
INSERT INTO `employeeprojectr` VALUES ('195', '11008199', 'DVBC8000HHN');
INSERT INTO `employeeprojectr` VALUES ('196', '11008199', 'CH5000MEL');
INSERT INTO `employeeprojectr` VALUES ('198', '20155708', 'AMLOGIC-S905');
INSERT INTO `employeeprojectr` VALUES ('199', '11008199', 'OTS2000');
INSERT INTO `employeeprojectr` VALUES ('200', '11008199', 'DVBC9700HBHC');
INSERT INTO `employeeprojectr` VALUES ('201', '11021933', 'DVBC8000BGASX');
INSERT INTO `employeeprojectr` VALUES ('202', '11021933', 'DVBS2ORDISA');
INSERT INTO `employeeprojectr` VALUES ('203', '11021933', 'DVBC8000BGAABS');
INSERT INTO `employeeprojectr` VALUES ('204', '11021933', 'SDDVBS25S35');
INSERT INTO `employeeprojectr` VALUES ('205', '14000635', 'CH8500MKCCL');
INSERT INTO `employeeprojectr` VALUES ('206', '14000635', 'NSO9280');
INSERT INTO `employeeprojectr` VALUES ('207', '14000635', 'CH8500MV');
INSERT INTO `employeeprojectr` VALUES ('208', '14000635', 'CHINPLUTOHDPLUS');
INSERT INTO `employeeprojectr` VALUES ('209', '20152714', 'HI3798M-jb');
INSERT INTO `employeeprojectr` VALUES ('210', '20152714', 'HI3798M-4K-jb');
INSERT INTO `employeeprojectr` VALUES ('211', '20152714', 'IHO-3000-HN');
INSERT INTO `employeeprojectr` VALUES ('212', '20152714', 'HI3798M-YD');
INSERT INTO `employeeprojectr` VALUES ('213', '20152714', 'IHO-3000-GZ');
INSERT INTO `employeeprojectr` VALUES ('214', '11009145', 'OTS-3000_SC');
INSERT INTO `employeeprojectr` VALUES ('215', '20155707', 'RTL9602BGPON21');
INSERT INTO `employeeprojectr` VALUES ('216', '11009145', 'IHO-3100_SCYD');
INSERT INTO `employeeprojectr` VALUES ('217', '12138029', 'MSTAR-MSO9280M');
INSERT INTO `employeeprojectr` VALUES ('218', '12138029', 'ET7000-T2');
INSERT INTO `employeeprojectr` VALUES ('219', '12138029', 'G100-S2');
INSERT INTO `employeeprojectr` VALUES ('220', '12138029', 'G100-T2');
INSERT INTO `employeeprojectr` VALUES ('221', '11020249', 'HD-NAGRA_COMBO-HEVC');
INSERT INTO `employeeprojectr` VALUES ('222', '11020249', 'CM500-UW41ZJ');
INSERT INTO `employeeprojectr` VALUES ('223', '11020249', 'CM500-UW11-HW');
INSERT INTO `employeeprojectr` VALUES ('224', '20059615', 'DVB-C9700_CXJ');
INSERT INTO `employeeprojectr` VALUES ('225', '20059615', 'DVB-C9700-EXJ');
INSERT INTO `employeeprojectr` VALUES ('226', '20059615', 'SDG6800LN-HD02-JB');
INSERT INTO `employeeprojectr` VALUES ('227', '11022719', 'CH-8500M-ST273-ABPL');
INSERT INTO `employeeprojectr` VALUES ('228', '11008845', 'IHO-2000-I');
INSERT INTO `employeeprojectr` VALUES ('229', '11008845', 'CH-8501M-ALI-ICNCL');
INSERT INTO `employeeprojectr` VALUES ('230', '11008845', 'CH-8500MU-MSD5C35-7STAR');
INSERT INTO `employeeprojectr` VALUES ('231', '11008845', 'IHO-1000-SCYD');
INSERT INTO `employeeprojectr` VALUES ('232', '11008845', 'AVGT6000');
INSERT INTO `employeeprojectr` VALUES ('233', '20059616', 'HD1265');
INSERT INTO `employeeprojectr` VALUES ('234', '20059616', 'HD1500');
INSERT INTO `employeeprojectr` VALUES ('235', '20059616', 'SD-DVB-S2-RI');
INSERT INTO `employeeprojectr` VALUES ('236', '20073800', 'DVB-C9700');
INSERT INTO `employeeprojectr` VALUES ('237', '20073800', 'HD-DVB-S2-ENTEL');
INSERT INTO `employeeprojectr` VALUES ('238', '20073800', 'SML-582_HD');
INSERT INTO `employeeprojectr` VALUES ('239', '20073800', 'DVB-C9700-HBS');
INSERT INTO `employeeprojectr` VALUES ('240', '20073800', 'SML-5010T');
INSERT INTO `employeeprojectr` VALUES ('241', '11021933', 'AVGT6000');
INSERT INTO `employeeprojectr` VALUES ('242', '14000635', 'MSTAR-MSO9280M');
INSERT INTO `employeeprojectr` VALUES ('243', '11020958', 'CH-8500MU-ABV');
INSERT INTO `employeeprojectr` VALUES ('244', '11020958', 'HD6850');
INSERT INTO `employeeprojectr` VALUES ('245', '11020958', 'MSD7C35-R');
INSERT INTO `employeeprojectr` VALUES ('246', '11020809', 'CM500-UW41F2S-ST');
INSERT INTO `employeeprojectr` VALUES ('247', '11021950', 'VB264TCN');
INSERT INTO `employeeprojectr` VALUES ('248', '11021950', 'MSTAR-7C51G');
INSERT INTO `employeeprojectr` VALUES ('249', '20059616', 'HD-DVB-S2-H237');
INSERT INTO `employeeprojectr` VALUES ('250', '20059615', 'SDG6800LN-CA09-Y3');

-- ----------------------------
-- Table structure for employeetrainr
-- ----------------------------
DROP TABLE IF EXISTS `employeetrainr`;
CREATE TABLE `employeetrainr` (
  `employeeTrainRId` int(11) NOT NULL auto_increment,
  `employee` varchar(30) default NULL,
  `train` int(11) default NULL,
  PRIMARY KEY  (`employeeTrainRId`),
  KEY `employeeTrain1` (`employee`),
  KEY `employeeTrain2` (`train`),
  CONSTRAINT `employeeTrain1` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `employeeTrain2` FOREIGN KEY (`train`) REFERENCES `train` (`trainId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeetrainr
-- ----------------------------
INSERT INTO `employeetrainr` VALUES ('1', '11007538', '1');
INSERT INTO `employeetrainr` VALUES ('2', '11007541', '1');
INSERT INTO `employeetrainr` VALUES ('3', '11008199', '1');
INSERT INTO `employeetrainr` VALUES ('4', '11008845', '1');
INSERT INTO `employeetrainr` VALUES ('5', '11020249', '1');
INSERT INTO `employeetrainr` VALUES ('6', '11020809', '1');
INSERT INTO `employeetrainr` VALUES ('7', '11021933', '1');
INSERT INTO `employeetrainr` VALUES ('8', '11021950', '1');
INSERT INTO `employeetrainr` VALUES ('9', '11022719', '1');
INSERT INTO `employeetrainr` VALUES ('10', '12128145', '1');
INSERT INTO `employeetrainr` VALUES ('11', '12138029', '1');
INSERT INTO `employeetrainr` VALUES ('12', '20059615', '1');
INSERT INTO `employeetrainr` VALUES ('13', '20059616', '1');
INSERT INTO `employeetrainr` VALUES ('14', '20073800', '1');
INSERT INTO `employeetrainr` VALUES ('15', '20152714', '1');
INSERT INTO `employeetrainr` VALUES ('16', '20155707', '1');
INSERT INTO `employeetrainr` VALUES ('17', '20155708', '1');
INSERT INTO `employeetrainr` VALUES ('18', '11007538', '2');
INSERT INTO `employeetrainr` VALUES ('19', '11008199', '2');
INSERT INTO `employeetrainr` VALUES ('20', '11008845', '2');
INSERT INTO `employeetrainr` VALUES ('21', '11009145', '2');
INSERT INTO `employeetrainr` VALUES ('22', '11020249', '2');
INSERT INTO `employeetrainr` VALUES ('23', '11020403', '2');
INSERT INTO `employeetrainr` VALUES ('24', '11020809', '2');
INSERT INTO `employeetrainr` VALUES ('25', '11021933', '2');
INSERT INTO `employeetrainr` VALUES ('26', '11022719', '2');
INSERT INTO `employeetrainr` VALUES ('27', '12128145', '2');
INSERT INTO `employeetrainr` VALUES ('28', '12138029', '2');
INSERT INTO `employeetrainr` VALUES ('29', '20059615', '2');
INSERT INTO `employeetrainr` VALUES ('30', '20059616', '2');
INSERT INTO `employeetrainr` VALUES ('31', '20073800', '2');
INSERT INTO `employeetrainr` VALUES ('32', '20152714', '2');
INSERT INTO `employeetrainr` VALUES ('33', '20155707', '2');
INSERT INTO `employeetrainr` VALUES ('34', '20155708', '2');
INSERT INTO `employeetrainr` VALUES ('35', '11007541', '3');
INSERT INTO `employeetrainr` VALUES ('36', '11008199', '3');
INSERT INTO `employeetrainr` VALUES ('37', '11008845', '3');
INSERT INTO `employeetrainr` VALUES ('38', '11009145', '3');
INSERT INTO `employeetrainr` VALUES ('39', '11020249', '3');
INSERT INTO `employeetrainr` VALUES ('40', '11020403', '3');
INSERT INTO `employeetrainr` VALUES ('41', '11020809', '3');
INSERT INTO `employeetrainr` VALUES ('42', '11021933', '3');
INSERT INTO `employeetrainr` VALUES ('43', '11021950', '3');
INSERT INTO `employeetrainr` VALUES ('44', '11022719', '3');
INSERT INTO `employeetrainr` VALUES ('45', '12128145', '3');
INSERT INTO `employeetrainr` VALUES ('46', '12138029', '3');
INSERT INTO `employeetrainr` VALUES ('47', '20059615', '3');
INSERT INTO `employeetrainr` VALUES ('48', '20059616', '3');
INSERT INTO `employeetrainr` VALUES ('49', '20073800', '3');
INSERT INTO `employeetrainr` VALUES ('50', '20152714', '3');
INSERT INTO `employeetrainr` VALUES ('51', '20155707', '3');
INSERT INTO `employeetrainr` VALUES ('52', '11007538', '4');
INSERT INTO `employeetrainr` VALUES ('53', '11007541', '4');
INSERT INTO `employeetrainr` VALUES ('54', '11008199', '4');
INSERT INTO `employeetrainr` VALUES ('55', '11008845', '4');
INSERT INTO `employeetrainr` VALUES ('56', '11009145', '4');
INSERT INTO `employeetrainr` VALUES ('57', '11020249', '4');
INSERT INTO `employeetrainr` VALUES ('58', '11020403', '4');
INSERT INTO `employeetrainr` VALUES ('59', '11020809', '4');
INSERT INTO `employeetrainr` VALUES ('60', '11021933', '4');
INSERT INTO `employeetrainr` VALUES ('61', '11021950', '4');
INSERT INTO `employeetrainr` VALUES ('62', '11022719', '4');
INSERT INTO `employeetrainr` VALUES ('63', '12128145', '4');
INSERT INTO `employeetrainr` VALUES ('64', '12138029', '4');
INSERT INTO `employeetrainr` VALUES ('65', '20059615', '4');
INSERT INTO `employeetrainr` VALUES ('66', '20059616', '4');
INSERT INTO `employeetrainr` VALUES ('67', '20073800', '4');
INSERT INTO `employeetrainr` VALUES ('68', '20152714', '4');
INSERT INTO `employeetrainr` VALUES ('69', '20155707', '4');
INSERT INTO `employeetrainr` VALUES ('70', '20155708', '4');
INSERT INTO `employeetrainr` VALUES ('71', '11007538', '5');
INSERT INTO `employeetrainr` VALUES ('72', '11007541', '5');
INSERT INTO `employeetrainr` VALUES ('73', '11008199', '5');
INSERT INTO `employeetrainr` VALUES ('74', '11008845', '5');
INSERT INTO `employeetrainr` VALUES ('75', '11009145', '5');
INSERT INTO `employeetrainr` VALUES ('76', '11020249', '5');
INSERT INTO `employeetrainr` VALUES ('77', '11020403', '5');
INSERT INTO `employeetrainr` VALUES ('78', '11020809', '5');
INSERT INTO `employeetrainr` VALUES ('79', '11021933', '5');
INSERT INTO `employeetrainr` VALUES ('80', '11021950', '5');
INSERT INTO `employeetrainr` VALUES ('81', '11022719', '5');
INSERT INTO `employeetrainr` VALUES ('82', '12128145', '5');
INSERT INTO `employeetrainr` VALUES ('83', '12138029', '5');
INSERT INTO `employeetrainr` VALUES ('84', '20059615', '5');
INSERT INTO `employeetrainr` VALUES ('85', '20059616', '5');
INSERT INTO `employeetrainr` VALUES ('86', '20073800', '5');
INSERT INTO `employeetrainr` VALUES ('87', '20152714', '5');
INSERT INTO `employeetrainr` VALUES ('88', '20155707', '5');
INSERT INTO `employeetrainr` VALUES ('89', '20155708', '5');
INSERT INTO `employeetrainr` VALUES ('90', '11007538', '6');
INSERT INTO `employeetrainr` VALUES ('91', '11007541', '6');
INSERT INTO `employeetrainr` VALUES ('92', '11008199', '6');
INSERT INTO `employeetrainr` VALUES ('93', '11008845', '6');
INSERT INTO `employeetrainr` VALUES ('94', '11009145', '6');
INSERT INTO `employeetrainr` VALUES ('95', '11020249', '6');
INSERT INTO `employeetrainr` VALUES ('96', '11020403', '6');
INSERT INTO `employeetrainr` VALUES ('97', '11020809', '6');
INSERT INTO `employeetrainr` VALUES ('98', '11021933', '6');
INSERT INTO `employeetrainr` VALUES ('99', '11021950', '6');
INSERT INTO `employeetrainr` VALUES ('100', '11022719', '6');
INSERT INTO `employeetrainr` VALUES ('101', '12128145', '6');
INSERT INTO `employeetrainr` VALUES ('102', '12138029', '6');
INSERT INTO `employeetrainr` VALUES ('103', '20059615', '6');
INSERT INTO `employeetrainr` VALUES ('104', '20059616', '6');
INSERT INTO `employeetrainr` VALUES ('105', '20073800', '6');
INSERT INTO `employeetrainr` VALUES ('106', '20152714', '6');
INSERT INTO `employeetrainr` VALUES ('107', '20155707', '6');
INSERT INTO `employeetrainr` VALUES ('108', '20155708', '6');
INSERT INTO `employeetrainr` VALUES ('109', '11007538', '7');
INSERT INTO `employeetrainr` VALUES ('110', '11007541', '7');
INSERT INTO `employeetrainr` VALUES ('111', '11008199', '7');
INSERT INTO `employeetrainr` VALUES ('112', '11008845', '7');
INSERT INTO `employeetrainr` VALUES ('113', '11009145', '7');
INSERT INTO `employeetrainr` VALUES ('114', '11020249', '7');
INSERT INTO `employeetrainr` VALUES ('115', '11020403', '7');
INSERT INTO `employeetrainr` VALUES ('116', '11020809', '7');
INSERT INTO `employeetrainr` VALUES ('117', '11021933', '7');
INSERT INTO `employeetrainr` VALUES ('118', '11022719', '7');
INSERT INTO `employeetrainr` VALUES ('119', '12128145', '7');
INSERT INTO `employeetrainr` VALUES ('120', '12138029', '7');
INSERT INTO `employeetrainr` VALUES ('121', '20059615', '7');
INSERT INTO `employeetrainr` VALUES ('122', '20059616', '7');
INSERT INTO `employeetrainr` VALUES ('123', '20073800', '7');
INSERT INTO `employeetrainr` VALUES ('124', '20152714', '7');
INSERT INTO `employeetrainr` VALUES ('125', '20155707', '7');
INSERT INTO `employeetrainr` VALUES ('126', '20155708', '7');
INSERT INTO `employeetrainr` VALUES ('127', '11007538', '8');
INSERT INTO `employeetrainr` VALUES ('128', '11007541', '8');
INSERT INTO `employeetrainr` VALUES ('129', '11008199', '8');
INSERT INTO `employeetrainr` VALUES ('130', '11008845', '8');
INSERT INTO `employeetrainr` VALUES ('131', '11009145', '8');
INSERT INTO `employeetrainr` VALUES ('132', '11009171', '8');
INSERT INTO `employeetrainr` VALUES ('133', '11020249', '8');
INSERT INTO `employeetrainr` VALUES ('134', '11020403', '8');
INSERT INTO `employeetrainr` VALUES ('135', '11020809', '8');
INSERT INTO `employeetrainr` VALUES ('136', '11021933', '8');
INSERT INTO `employeetrainr` VALUES ('137', '11021950', '8');
INSERT INTO `employeetrainr` VALUES ('138', '11022719', '8');
INSERT INTO `employeetrainr` VALUES ('139', '12128145', '8');
INSERT INTO `employeetrainr` VALUES ('140', '12138029', '8');
INSERT INTO `employeetrainr` VALUES ('141', '20059615', '8');
INSERT INTO `employeetrainr` VALUES ('142', '20059616', '8');
INSERT INTO `employeetrainr` VALUES ('143', '20073800', '8');
INSERT INTO `employeetrainr` VALUES ('144', '20152714', '8');
INSERT INTO `employeetrainr` VALUES ('145', '20155707', '8');
INSERT INTO `employeetrainr` VALUES ('146', '20155708', '8');
INSERT INTO `employeetrainr` VALUES ('147', '11007538', '9');
INSERT INTO `employeetrainr` VALUES ('148', '11007541', '9');
INSERT INTO `employeetrainr` VALUES ('149', '11008199', '9');
INSERT INTO `employeetrainr` VALUES ('150', '11008845', '9');
INSERT INTO `employeetrainr` VALUES ('151', '11009145', '9');
INSERT INTO `employeetrainr` VALUES ('152', '11020249', '9');
INSERT INTO `employeetrainr` VALUES ('153', '11020403', '9');
INSERT INTO `employeetrainr` VALUES ('154', '11020809', '9');
INSERT INTO `employeetrainr` VALUES ('155', '11021933', '9');
INSERT INTO `employeetrainr` VALUES ('156', '11021950', '9');
INSERT INTO `employeetrainr` VALUES ('157', '11022719', '9');
INSERT INTO `employeetrainr` VALUES ('158', '12128145', '9');
INSERT INTO `employeetrainr` VALUES ('159', '12138029', '9');
INSERT INTO `employeetrainr` VALUES ('160', '20059615', '9');
INSERT INTO `employeetrainr` VALUES ('161', '20059616', '9');
INSERT INTO `employeetrainr` VALUES ('162', '20073800', '9');
INSERT INTO `employeetrainr` VALUES ('163', '20155707', '9');
INSERT INTO `employeetrainr` VALUES ('164', '20155708', '9');
INSERT INTO `employeetrainr` VALUES ('165', '11004346', '9');
INSERT INTO `employeetrainr` VALUES ('166', '11007219', '9');
INSERT INTO `employeetrainr` VALUES ('167', '11008693', '9');
INSERT INTO `employeetrainr` VALUES ('168', '11009238', '9');
INSERT INTO `employeetrainr` VALUES ('169', '11009486', '9');
INSERT INTO `employeetrainr` VALUES ('170', '11020843', '9');
INSERT INTO `employeetrainr` VALUES ('181', '11022719', '4');
INSERT INTO `employeetrainr` VALUES ('182', '12128145', '4');
INSERT INTO `employeetrainr` VALUES ('183', '12138029', '4');
INSERT INTO `employeetrainr` VALUES ('184', '20059615', '4');
INSERT INTO `employeetrainr` VALUES ('185', '20059616', '4');
INSERT INTO `employeetrainr` VALUES ('186', '20073800', '4');
INSERT INTO `employeetrainr` VALUES ('187', '20155707', '4');
INSERT INTO `employeetrainr` VALUES ('188', '20155708', '4');
INSERT INTO `employeetrainr` VALUES ('190', '11007538', '11');
INSERT INTO `employeetrainr` VALUES ('191', '11007541', '11');
INSERT INTO `employeetrainr` VALUES ('192', '11008199', '11');
INSERT INTO `employeetrainr` VALUES ('193', '11008845', '11');
INSERT INTO `employeetrainr` VALUES ('194', '11009145', '11');
INSERT INTO `employeetrainr` VALUES ('195', '11009171', '11');
INSERT INTO `employeetrainr` VALUES ('196', '11020249', '11');
INSERT INTO `employeetrainr` VALUES ('197', '11020403', '11');
INSERT INTO `employeetrainr` VALUES ('198', '11020809', '11');
INSERT INTO `employeetrainr` VALUES ('199', '11021933', '11');
INSERT INTO `employeetrainr` VALUES ('200', '11022719', '11');
INSERT INTO `employeetrainr` VALUES ('201', '12128145', '11');
INSERT INTO `employeetrainr` VALUES ('202', '12138029', '11');
INSERT INTO `employeetrainr` VALUES ('203', '20059615', '11');
INSERT INTO `employeetrainr` VALUES ('204', '20059616', '11');
INSERT INTO `employeetrainr` VALUES ('205', '20073800', '11');
INSERT INTO `employeetrainr` VALUES ('206', '20155707', '11');
INSERT INTO `employeetrainr` VALUES ('207', '20155708', '11');
INSERT INTO `employeetrainr` VALUES ('208', '11004346', '11');
INSERT INTO `employeetrainr` VALUES ('209', '11007219', '11');
INSERT INTO `employeetrainr` VALUES ('210', '11009238', '11');
INSERT INTO `employeetrainr` VALUES ('211', '11007538', '12');
INSERT INTO `employeetrainr` VALUES ('212', '11007541', '12');
INSERT INTO `employeetrainr` VALUES ('213', '11008199', '12');
INSERT INTO `employeetrainr` VALUES ('214', '11008845', '12');
INSERT INTO `employeetrainr` VALUES ('215', '11009145', '12');
INSERT INTO `employeetrainr` VALUES ('216', '11020403', '12');
INSERT INTO `employeetrainr` VALUES ('217', '11021933', '12');
INSERT INTO `employeetrainr` VALUES ('218', '11022719', '12');
INSERT INTO `employeetrainr` VALUES ('219', '12128145', '12');
INSERT INTO `employeetrainr` VALUES ('220', '20059615', '12');
INSERT INTO `employeetrainr` VALUES ('221', '20073800', '12');
INSERT INTO `employeetrainr` VALUES ('222', '20152714', '12');
INSERT INTO `employeetrainr` VALUES ('223', '20155707', '12');
INSERT INTO `employeetrainr` VALUES ('224', '20155708', '12');
INSERT INTO `employeetrainr` VALUES ('225', '11007538', '13');
INSERT INTO `employeetrainr` VALUES ('226', '11007541', '13');
INSERT INTO `employeetrainr` VALUES ('227', '11008199', '13');
INSERT INTO `employeetrainr` VALUES ('228', '11008845', '13');
INSERT INTO `employeetrainr` VALUES ('229', '11009145', '13');
INSERT INTO `employeetrainr` VALUES ('230', '11009171', '13');
INSERT INTO `employeetrainr` VALUES ('231', '11020249', '13');
INSERT INTO `employeetrainr` VALUES ('232', '11020403', '13');
INSERT INTO `employeetrainr` VALUES ('233', '11020809', '13');
INSERT INTO `employeetrainr` VALUES ('234', '11021933', '13');
INSERT INTO `employeetrainr` VALUES ('235', '11021950', '13');
INSERT INTO `employeetrainr` VALUES ('236', '11022719', '13');
INSERT INTO `employeetrainr` VALUES ('237', '12128145', '13');
INSERT INTO `employeetrainr` VALUES ('238', '20059615', '13');
INSERT INTO `employeetrainr` VALUES ('239', '20073800', '13');
INSERT INTO `employeetrainr` VALUES ('240', '20152714', '13');
INSERT INTO `employeetrainr` VALUES ('241', '20155707', '13');
INSERT INTO `employeetrainr` VALUES ('242', '20155708', '13');
INSERT INTO `employeetrainr` VALUES ('243', '11007538', '14');
INSERT INTO `employeetrainr` VALUES ('244', '11008199', '14');
INSERT INTO `employeetrainr` VALUES ('245', '11008845', '14');
INSERT INTO `employeetrainr` VALUES ('246', '11009145', '14');
INSERT INTO `employeetrainr` VALUES ('247', '11020403', '14');
INSERT INTO `employeetrainr` VALUES ('248', '11020809', '14');
INSERT INTO `employeetrainr` VALUES ('249', '11020958', '14');
INSERT INTO `employeetrainr` VALUES ('250', '11021933', '14');
INSERT INTO `employeetrainr` VALUES ('251', '11022719', '14');
INSERT INTO `employeetrainr` VALUES ('252', '12128145', '14');
INSERT INTO `employeetrainr` VALUES ('253', '12138029', '14');
INSERT INTO `employeetrainr` VALUES ('254', '20059615', '14');
INSERT INTO `employeetrainr` VALUES ('255', '20073800', '14');
INSERT INTO `employeetrainr` VALUES ('256', '20152714', '14');
INSERT INTO `employeetrainr` VALUES ('257', '20155708', '14');
INSERT INTO `employeetrainr` VALUES ('258', '11007219', '14');
INSERT INTO `employeetrainr` VALUES ('259', '11020843', '14');
INSERT INTO `employeetrainr` VALUES ('260', '11007538', '15');
INSERT INTO `employeetrainr` VALUES ('261', '11007541', '15');
INSERT INTO `employeetrainr` VALUES ('262', '11008199', '15');
INSERT INTO `employeetrainr` VALUES ('263', '11008845', '15');
INSERT INTO `employeetrainr` VALUES ('264', '11009145', '15');
INSERT INTO `employeetrainr` VALUES ('265', '11009171', '15');
INSERT INTO `employeetrainr` VALUES ('266', '11020249', '15');
INSERT INTO `employeetrainr` VALUES ('267', '11020809', '15');
INSERT INTO `employeetrainr` VALUES ('268', '11021933', '15');
INSERT INTO `employeetrainr` VALUES ('269', '11021950', '15');
INSERT INTO `employeetrainr` VALUES ('270', '12128145', '15');
INSERT INTO `employeetrainr` VALUES ('271', '12138029', '15');
INSERT INTO `employeetrainr` VALUES ('272', '20059615', '15');
INSERT INTO `employeetrainr` VALUES ('273', '20073800', '15');
INSERT INTO `employeetrainr` VALUES ('274', '20152714', '15');
INSERT INTO `employeetrainr` VALUES ('275', '20155707', '15');
INSERT INTO `employeetrainr` VALUES ('276', '20155708', '15');
INSERT INTO `employeetrainr` VALUES ('277', '11007538', '16');
INSERT INTO `employeetrainr` VALUES ('278', '11007541', '16');
INSERT INTO `employeetrainr` VALUES ('279', '11008199', '16');
INSERT INTO `employeetrainr` VALUES ('280', '11008845', '16');
INSERT INTO `employeetrainr` VALUES ('281', '11009145', '16');
INSERT INTO `employeetrainr` VALUES ('282', '11009171', '16');
INSERT INTO `employeetrainr` VALUES ('283', '11020249', '16');
INSERT INTO `employeetrainr` VALUES ('284', '11020403', '16');
INSERT INTO `employeetrainr` VALUES ('285', '11020809', '16');
INSERT INTO `employeetrainr` VALUES ('286', '11021933', '16');
INSERT INTO `employeetrainr` VALUES ('287', '11021950', '16');
INSERT INTO `employeetrainr` VALUES ('288', '11022719', '16');
INSERT INTO `employeetrainr` VALUES ('289', '12128145', '16');
INSERT INTO `employeetrainr` VALUES ('290', '12138029', '16');
INSERT INTO `employeetrainr` VALUES ('291', '20059615', '16');
INSERT INTO `employeetrainr` VALUES ('292', '20059616', '16');
INSERT INTO `employeetrainr` VALUES ('293', '20073800', '16');
INSERT INTO `employeetrainr` VALUES ('294', '20152714', '16');
INSERT INTO `employeetrainr` VALUES ('295', '20155707', '16');
INSERT INTO `employeetrainr` VALUES ('296', '20155708', '16');
INSERT INTO `employeetrainr` VALUES ('297', '11007538', '17');
INSERT INTO `employeetrainr` VALUES ('298', '11007541', '17');
INSERT INTO `employeetrainr` VALUES ('299', '11008199', '17');
INSERT INTO `employeetrainr` VALUES ('300', '11008845', '17');
INSERT INTO `employeetrainr` VALUES ('301', '11009171', '17');
INSERT INTO `employeetrainr` VALUES ('302', '11020249', '17');
INSERT INTO `employeetrainr` VALUES ('303', '11020403', '17');
INSERT INTO `employeetrainr` VALUES ('304', '11020809', '17');
INSERT INTO `employeetrainr` VALUES ('305', '11021933', '17');
INSERT INTO `employeetrainr` VALUES ('306', '11021950', '17');
INSERT INTO `employeetrainr` VALUES ('307', '11022719', '17');
INSERT INTO `employeetrainr` VALUES ('308', '12138029', '17');
INSERT INTO `employeetrainr` VALUES ('309', '20059615', '17');
INSERT INTO `employeetrainr` VALUES ('310', '20059616', '17');
INSERT INTO `employeetrainr` VALUES ('311', '20073800', '17');
INSERT INTO `employeetrainr` VALUES ('312', '20155707', '17');
INSERT INTO `employeetrainr` VALUES ('313', '11007538', '18');
INSERT INTO `employeetrainr` VALUES ('314', '11007541', '18');
INSERT INTO `employeetrainr` VALUES ('315', '11008199', '18');
INSERT INTO `employeetrainr` VALUES ('316', '11009145', '18');
INSERT INTO `employeetrainr` VALUES ('317', '11009171', '18');
INSERT INTO `employeetrainr` VALUES ('318', '11020249', '18');
INSERT INTO `employeetrainr` VALUES ('319', '11020403', '18');
INSERT INTO `employeetrainr` VALUES ('320', '11020809', '18');
INSERT INTO `employeetrainr` VALUES ('321', '11021933', '18');
INSERT INTO `employeetrainr` VALUES ('322', '11021950', '18');
INSERT INTO `employeetrainr` VALUES ('323', '11022719', '18');
INSERT INTO `employeetrainr` VALUES ('324', '12128145', '18');
INSERT INTO `employeetrainr` VALUES ('325', '12138029', '18');
INSERT INTO `employeetrainr` VALUES ('326', '20059615', '18');
INSERT INTO `employeetrainr` VALUES ('327', '20059616', '18');
INSERT INTO `employeetrainr` VALUES ('328', '20152714', '18');
INSERT INTO `employeetrainr` VALUES ('329', '20155707', '18');
INSERT INTO `employeetrainr` VALUES ('330', '20155708', '18');
INSERT INTO `employeetrainr` VALUES ('331', '11007538', '19');
INSERT INTO `employeetrainr` VALUES ('332', '11008199', '19');
INSERT INTO `employeetrainr` VALUES ('333', '11008845', '19');
INSERT INTO `employeetrainr` VALUES ('334', '11009145', '19');
INSERT INTO `employeetrainr` VALUES ('335', '11020249', '19');
INSERT INTO `employeetrainr` VALUES ('336', '11020403', '19');
INSERT INTO `employeetrainr` VALUES ('337', '11020809', '19');
INSERT INTO `employeetrainr` VALUES ('338', '11021933', '19');
INSERT INTO `employeetrainr` VALUES ('339', '11021950', '19');
INSERT INTO `employeetrainr` VALUES ('340', '11022719', '19');
INSERT INTO `employeetrainr` VALUES ('341', '12128145', '19');
INSERT INTO `employeetrainr` VALUES ('342', '12138029', '19');
INSERT INTO `employeetrainr` VALUES ('343', '20059615', '19');
INSERT INTO `employeetrainr` VALUES ('344', '20059616', '19');
INSERT INTO `employeetrainr` VALUES ('345', '20073800', '19');
INSERT INTO `employeetrainr` VALUES ('346', '20155708', '19');
INSERT INTO `employeetrainr` VALUES ('347', '11007538', '20');
INSERT INTO `employeetrainr` VALUES ('348', '11007541', '20');
INSERT INTO `employeetrainr` VALUES ('349', '11008199', '20');
INSERT INTO `employeetrainr` VALUES ('350', '11008845', '20');
INSERT INTO `employeetrainr` VALUES ('351', '11009145', '20');
INSERT INTO `employeetrainr` VALUES ('352', '11009171', '20');
INSERT INTO `employeetrainr` VALUES ('353', '11020249', '20');
INSERT INTO `employeetrainr` VALUES ('354', '11020403', '20');
INSERT INTO `employeetrainr` VALUES ('355', '11020809', '20');
INSERT INTO `employeetrainr` VALUES ('356', '11021933', '20');
INSERT INTO `employeetrainr` VALUES ('357', '11021950', '20');
INSERT INTO `employeetrainr` VALUES ('358', '11022719', '20');
INSERT INTO `employeetrainr` VALUES ('359', '12138029', '20');
INSERT INTO `employeetrainr` VALUES ('360', '20059615', '20');
INSERT INTO `employeetrainr` VALUES ('361', '20059616', '20');
INSERT INTO `employeetrainr` VALUES ('362', '20073800', '20');
INSERT INTO `employeetrainr` VALUES ('363', '20152714', '20');
INSERT INTO `employeetrainr` VALUES ('364', '11007538', '21');
INSERT INTO `employeetrainr` VALUES ('365', '11007541', '21');
INSERT INTO `employeetrainr` VALUES ('366', '11008199', '21');
INSERT INTO `employeetrainr` VALUES ('367', '11008845', '21');
INSERT INTO `employeetrainr` VALUES ('368', '11009145', '21');
INSERT INTO `employeetrainr` VALUES ('369', '11009171', '21');
INSERT INTO `employeetrainr` VALUES ('370', '11020249', '21');
INSERT INTO `employeetrainr` VALUES ('371', '11020403', '21');
INSERT INTO `employeetrainr` VALUES ('372', '11020809', '21');
INSERT INTO `employeetrainr` VALUES ('373', '11021933', '21');
INSERT INTO `employeetrainr` VALUES ('374', '11021950', '21');
INSERT INTO `employeetrainr` VALUES ('375', '11022719', '21');
INSERT INTO `employeetrainr` VALUES ('376', '12128145', '21');
INSERT INTO `employeetrainr` VALUES ('377', '12138029', '21');
INSERT INTO `employeetrainr` VALUES ('378', '14000635', '21');
INSERT INTO `employeetrainr` VALUES ('379', '20059616', '21');
INSERT INTO `employeetrainr` VALUES ('380', '20073800', '21');
INSERT INTO `employeetrainr` VALUES ('381', '20152714', '21');
INSERT INTO `employeetrainr` VALUES ('382', '20155708', '21');
INSERT INTO `employeetrainr` VALUES ('383', '11007538', '22');
INSERT INTO `employeetrainr` VALUES ('384', '11008199', '22');
INSERT INTO `employeetrainr` VALUES ('385', '11008845', '22');
INSERT INTO `employeetrainr` VALUES ('386', '11009145', '22');
INSERT INTO `employeetrainr` VALUES ('387', '11009171', '22');
INSERT INTO `employeetrainr` VALUES ('388', '11020249', '22');
INSERT INTO `employeetrainr` VALUES ('389', '11020403', '22');
INSERT INTO `employeetrainr` VALUES ('390', '11020809', '22');
INSERT INTO `employeetrainr` VALUES ('391', '11021933', '22');
INSERT INTO `employeetrainr` VALUES ('392', '11021950', '22');
INSERT INTO `employeetrainr` VALUES ('393', '11022719', '22');
INSERT INTO `employeetrainr` VALUES ('394', '12128145', '22');
INSERT INTO `employeetrainr` VALUES ('395', '12138029', '22');
INSERT INTO `employeetrainr` VALUES ('396', '14000635', '22');
INSERT INTO `employeetrainr` VALUES ('397', '20059615', '22');
INSERT INTO `employeetrainr` VALUES ('398', '20073800', '22');
INSERT INTO `employeetrainr` VALUES ('399', '20152714', '22');
INSERT INTO `employeetrainr` VALUES ('400', '20155707', '22');
INSERT INTO `employeetrainr` VALUES ('401', '20155708', '22');
INSERT INTO `employeetrainr` VALUES ('402', '11007538', '23');
INSERT INTO `employeetrainr` VALUES ('403', '11007541', '23');
INSERT INTO `employeetrainr` VALUES ('404', '11008199', '23');
INSERT INTO `employeetrainr` VALUES ('405', '11008845', '23');
INSERT INTO `employeetrainr` VALUES ('406', '11009145', '23');
INSERT INTO `employeetrainr` VALUES ('407', '11009171', '23');
INSERT INTO `employeetrainr` VALUES ('408', '11020249', '23');
INSERT INTO `employeetrainr` VALUES ('409', '11020403', '23');
INSERT INTO `employeetrainr` VALUES ('410', '11020809', '23');
INSERT INTO `employeetrainr` VALUES ('411', '11021933', '23');
INSERT INTO `employeetrainr` VALUES ('412', '11021950', '23');
INSERT INTO `employeetrainr` VALUES ('413', '11022719', '23');
INSERT INTO `employeetrainr` VALUES ('414', '12128145', '23');
INSERT INTO `employeetrainr` VALUES ('415', '12138029', '23');
INSERT INTO `employeetrainr` VALUES ('416', '14000635', '23');
INSERT INTO `employeetrainr` VALUES ('417', '20059615', '23');
INSERT INTO `employeetrainr` VALUES ('418', '20059616', '23');
INSERT INTO `employeetrainr` VALUES ('419', '20073800', '23');
INSERT INTO `employeetrainr` VALUES ('420', '20155707', '23');
INSERT INTO `employeetrainr` VALUES ('421', '20155708', '23');
INSERT INTO `employeetrainr` VALUES ('422', '20218676', '23');
INSERT INTO `employeetrainr` VALUES ('423', '11007538', '24');
INSERT INTO `employeetrainr` VALUES ('424', '11007541', '24');
INSERT INTO `employeetrainr` VALUES ('425', '11008199', '24');
INSERT INTO `employeetrainr` VALUES ('426', '11008845', '24');
INSERT INTO `employeetrainr` VALUES ('427', '11009145', '24');
INSERT INTO `employeetrainr` VALUES ('428', '11009171', '24');
INSERT INTO `employeetrainr` VALUES ('429', '11020249', '24');
INSERT INTO `employeetrainr` VALUES ('430', '11020403', '24');
INSERT INTO `employeetrainr` VALUES ('431', '11020809', '24');
INSERT INTO `employeetrainr` VALUES ('432', '11021933', '24');
INSERT INTO `employeetrainr` VALUES ('433', '11021950', '24');
INSERT INTO `employeetrainr` VALUES ('434', '11022719', '24');
INSERT INTO `employeetrainr` VALUES ('435', '12128145', '24');
INSERT INTO `employeetrainr` VALUES ('436', '12138029', '24');
INSERT INTO `employeetrainr` VALUES ('437', '20059615', '24');
INSERT INTO `employeetrainr` VALUES ('438', '20059616', '24');
INSERT INTO `employeetrainr` VALUES ('439', '20073800', '24');
INSERT INTO `employeetrainr` VALUES ('440', '20155708', '24');
INSERT INTO `employeetrainr` VALUES ('441', '20218676', '24');
INSERT INTO `employeetrainr` VALUES ('442', '11004346', '24');
INSERT INTO `employeetrainr` VALUES ('443', '11007219', '24');
INSERT INTO `employeetrainr` VALUES ('444', '11008693', '24');
INSERT INTO `employeetrainr` VALUES ('445', '11009238', '24');
INSERT INTO `employeetrainr` VALUES ('446', '11009486', '24');
INSERT INTO `employeetrainr` VALUES ('447', '11020843', '24');
INSERT INTO `employeetrainr` VALUES ('524', '11007538', '25');
INSERT INTO `employeetrainr` VALUES ('525', '11007541', '25');
INSERT INTO `employeetrainr` VALUES ('526', '11008199', '25');
INSERT INTO `employeetrainr` VALUES ('527', '11008845', '25');
INSERT INTO `employeetrainr` VALUES ('528', '11009145', '25');
INSERT INTO `employeetrainr` VALUES ('529', '11020249', '25');
INSERT INTO `employeetrainr` VALUES ('530', '11020403', '25');
INSERT INTO `employeetrainr` VALUES ('531', '11020809', '25');
INSERT INTO `employeetrainr` VALUES ('532', '11021933', '25');
INSERT INTO `employeetrainr` VALUES ('533', '11021950', '25');
INSERT INTO `employeetrainr` VALUES ('534', '11022719', '25');
INSERT INTO `employeetrainr` VALUES ('535', '12128145', '25');
INSERT INTO `employeetrainr` VALUES ('536', '12138029', '25');
INSERT INTO `employeetrainr` VALUES ('537', '20059615', '25');
INSERT INTO `employeetrainr` VALUES ('538', '20059616', '25');
INSERT INTO `employeetrainr` VALUES ('539', '20073800', '25');
INSERT INTO `employeetrainr` VALUES ('540', '20155707', '25');
INSERT INTO `employeetrainr` VALUES ('541', '20155708', '25');
INSERT INTO `employeetrainr` VALUES ('542', '11020843', '25');
INSERT INTO `employeetrainr` VALUES ('543', '20218676', '16');
INSERT INTO `employeetrainr` VALUES ('544', '20218676', '17');
INSERT INTO `employeetrainr` VALUES ('545', '20218676', '18');
INSERT INTO `employeetrainr` VALUES ('546', '20218676', '19');
INSERT INTO `employeetrainr` VALUES ('547', '20218676', '20');
INSERT INTO `employeetrainr` VALUES ('548', '20218676', '21');
INSERT INTO `employeetrainr` VALUES ('549', '20218676', '22');
INSERT INTO `employeetrainr` VALUES ('550', '20222822', '21');
INSERT INTO `employeetrainr` VALUES ('551', '20222822', '22');
INSERT INTO `employeetrainr` VALUES ('552', '20222822', '23');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `examId` int(11) NOT NULL auto_increment,
  `examName` varchar(50) default NULL,
  `examLevel` varchar(10) default NULL,
  `examLocation` varchar(50) default NULL,
  `organizer` varchar(30) default NULL,
  `examContent` varchar(255) default NULL,
  `examTime` date default NULL,
  `joinNum` int(11) default NULL,
  `other` varchar(50) default NULL,
  PRIMARY KEY  (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', '电路考试1', 'A', '', '向洪元', '略', '2016-01-10', null, null);
INSERT INTO `exam` VALUES ('2', '电路考试2', 'A', '', '向洪元', '略', '2016-02-19', null, null);
INSERT INTO `exam` VALUES ('3', '电路考试3', 'A', '', '向洪元', '略', '2016-03-11', null, null);
INSERT INTO `exam` VALUES ('4', '电路测试4', 'A', '', '向洪元', '略', '2016-04-22', null, null);
INSERT INTO `exam` VALUES ('5', '电路测试5', 'A', '', '向洪元', '略', '2016-06-06', null, null);
INSERT INTO `exam` VALUES ('6', '电路测试6', 'A', '', '向洪元', '略', '2016-07-27', null, null);

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `experienceId` int(11) NOT NULL auto_increment,
  `experienceName` varchar(50) default NULL,
  `employee` varchar(20) default NULL,
  `county` varchar(25) default NULL,
  `area` varchar(50) default NULL,
  `classify` int(11) default NULL,
  `abstract` varchar(255) default NULL,
  `mainChip` varchar(25) default NULL,
  `keyword` varchar(255) default NULL,
  `accNum` int(11) default NULL,
  `exUrl` varchar(255) default NULL,
  `exTime` date default NULL,
  `exState` varchar(25) default NULL,
  `Title` varchar(50) default NULL,
  `score` int(11) default NULL,
  `dataDirt` int(11) default NULL,
  PRIMARY KEY  (`experienceId`),
  KEY `11` (`classify`),
  KEY `12` (`employee`),
  KEY `13` (`dataDirt`),
  CONSTRAINT `11` FOREIGN KEY (`classify`) REFERENCES `classify` (`Classify_Id`),
  CONSTRAINT `12` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `13` FOREIGN KEY (`dataDirt`) REFERENCES `data_dirt` (`nID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES ('4', ' 8024 未给出卡插入信号的原因分析', '11020403', '国内', '国内', null, '插卡后 8024 未给出卡插入信号,原因为上次拔卡主芯片未执行去激活时序,将CMDVCC 关闭,8024 一直在等待该信号.', 'MSD7C51GC', 'TDA8024; OFF; CMDVCC; 无卡插入信号;NDS; CA QC 测试', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]8024未给出卡插入信号的原因分析（吴楚宁）.pdf', '2016-11-07', '已处理', null, '5', '24');
INSERT INTO `experience` VALUES ('5', '8024 未给出卡插入信号的原因分析', '11020958', '国内', '国内', null, '插卡后 8024 未给出卡插入信号,原因为上次拔卡主芯片未执行去激活时序,将CMDVCC 关闭,8024 一直在等待该信号.', 'MSD7C51GC', 'TDA8024; OFF; CMDVCC; 无卡插入信号;NDS; CA QC 测试', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]8024未给出卡插入信号的原因分析（张方方）.pdf', '2016-11-07', '未处理', null, null, '24');
INSERT INTO `experience` VALUES ('6', 'A LLEGRO  A4491 DCDC 辐射整改', '20059616', '海外', '印度', null, '印度 SD DVB-S2 RIL 项目所用 Allegro A4491 DCDC 辐射测试不过，通过重新排板改善地回路解决', 'MSD7S735B', 'EMC；辐射；地回路；接地；A4491；DC-DC; Allegro', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]Allegro A4491 DCDC辐射EMC整改.pdf', '2016-11-07', '已处理', null, '5', '26');
INSERT INTO `experience` VALUES ('7', 'H I 3796 真待机重启问题（针对特定电视连接 HDMI 情况）', '11009145', '国内', '国内', null, 'H I 3796 真待机重启问题（针对特定电视连接 HDMI 情况）', '海思 Hi3796', ' 海思、Hi3796、HDMI、真待机、重启、交流关机、开机、启动、HDMI_CEC、', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]（HI3796真待机重启问题（针对特定电视连接HDMI情况））.pdf', '2016-11-07', '未处理', null, null, '22');
INSERT INTO `experience` VALUES ('8', '捷克高清 DVB-S2 9100A EMC 整改过程', '11008845', '国内', '国内', null, 'CE 摸底测试中发现辐射不过，最终通过加强与机壳地连接的方式解决', 'BCM7362', 'EMC；辐射；接地；CE', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]DVB-S2 9100A_EMC整改.pdf', '2016-11-07', '已处理', null, '5', '28');
INSERT INTO `experience` VALUES ('10', ' 尼日利亚 DVB-T 9000NN 待机 CVBS 花屏故障分析', '11020249', '海外', '非洲', null, '尼日利亚 DVB-T 9000NN 小批量生产真待机时通过 CVBS 连接到某些电视机上出现花屏现象，最终通过调整待机电压解决。', 'BCM7563', '真待机；CVBS；视频运放；TPF-113; 花屏', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]HI3798M网口浪涌防护.pdf', '2016-11-07', '已处理', null, '5', '18');
INSERT INTO `experience` VALUES ('11', 'MSD KCCL 5029 HD 拷机花屏问题', '12138029', '海外', '印度', null, '印度 KCCL5029 HD 项目在生产厂进行老化拷机 100 小时左右出现花屏现象（视频花，而 OSD 显示正常），分析原因为：码流信号问题（不仅仅是信号强度），引起 Vdec拿到错误的 disp info，然后 Vdec 举起蓝屏设定，通过软件在 VIDEO 模块中增加蓝屏恢复机制解决。', 'MSD5029', '拷机 100+小时 花屏 拷机信号质量差 视频花 OSD 显示正常', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]MSD5029拷机花屏问题.pdf', '2016-11-07', '未处理', null, null, '31');
INSERT INTO `experience` VALUES ('12', ' NDS 认证硬件部分总结', '11020958', '国内', '国内', null, 'NDS 认证硬件部分总结', 'MSD7C51GC', 'NDS 认证硬件部分注意事项、测试事项、测试流程、问题总结、NDS、温升、掉 电时序、8024', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]NDS认证硬件部分总结.pdf', '2016-11-07', '已处理', null, '5', '32');
INSERT INTO `experience` VALUES ('13', ' RMII 时钟辐射引起的 EMC 问题及其整改', '20073800', '海外', '俄罗斯', null, '俄罗斯 SML-582 HD 项目，在进行 FCC 认证时，125MHz 及其倍频（375MHz，625MHz，875MHz）辐射测试不过，原因为 RGMII 接口的时钟辐射，通过 WIFI 天线、HDMI 线及电源线等串出。通过HDMI、电源线及 WIFI 天线加磁环可以通过 EMC 测试，但 WIFI 性能受影响，最后通过软件降低主芯片与 wifi 之间通信速率到 10Mbit/s 解决。', 'BCM7251S', 'EMC；辐射；接地；FCC; mini PCIe；RGMII；125MHz；Quantenna', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]RMII时钟辐射引起的EMC问题及其整改.pdf', '2016-11-07', '已处理', null, '5', '34');
INSERT INTO `experience` VALUES ('14', 'SCEI 测试 AC 掉电时序问题', '11020958', '国内', '国内', null, 'NDS 认证中硬件部分 SCEI 测试，AC 端掉电时候，CLK 不能满足在 RESET 发出后保持至少 7.5us。后经调整 8024 检测脚电压解决。', 'MSD7C51GC', 'NDS 认证、SCEI 测试、卡测试、AC 掉电时序', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]SCEI测试-AC掉电时序问题.pdf', '2016-11-07', '已处理', null, '5', '32');
INSERT INTO `experience` VALUES ('15', ' SCEI 测试 STANDBY 掉电时序问题', '11020958', '国内', '国内', null, 'NDS 认证中硬件部分 SCEI 测试，STANDBY 时候，CLK 不能满足在 RESET 发出后保持至少 7.5us。后经调整软件驱动解决。', 'MSD7C51GC', 'NDS 认证、SCEI 测试、卡测试、STANDBY 掉电时序', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]SCEI测试-STANDBY掉电时序问题.pdf', '2016-11-07', '已处理', null, '5', '32');
INSERT INTO `experience` VALUES ('16', ' SCEI 测试 VCC 纹波超标问题', '11020958', '国内', '国内', null, 'NDS 认证中硬件部分 SCEI 测试，在测试板加入 1.5MHZ 30%占空比,200mA 电流，测试 VCC 脚纹波超标。后经过加大 vcc 管脚电容解决。', 'MSD7C51GC', 'NDS 认证、SCEI 测试、卡测试、VCC 纹波', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]SCEI测试-卡座VCC纹波超标问题.pdf', '2016-11-07', '已处理', null, '5', '32');
INSERT INTO `experience` VALUES ('17', '安徽省高清 DVB-C8200H AH 时不开机问题', '20155708', '国内', '安徽', null, '安徽省高清 DVB-C8200H AH 小批量 200 台产品 8 小时常温老化后开关机实验4000 台次，发现有 4 台机器出现时不开机问题。 原因为：在 BCM7241 平台上 strap pin设置为 110 时提供的晶体驱动电流为 1290uA ，对于红星 54Mhz 晶体此电流比较临界。将 strap pin 设置为 111 时提供的晶体驱动电流为1416uA，问题解决。', 'BCM7241', '时不开机、strap pin 设置、晶体驱动电流、博通、BCM7241、54Mhz 晶振', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]安徽省高清DVB-C8200H AH时不开机问题.pdf', '2016-11-07', '已处理', null, '5', '36');
INSERT INTO `experience` VALUES ('18', 'YDT 993-2006 标准解读', '20152714', '国内', '国内', null, '针对目前 IPTV 市场要求网络浪涌测试，本文解读电信提供的《YDT 993-2006 电信终端设备防雷技术要求及试验方法》，了解产品试验类型和使用标准。测试方法请参考《网\r\n口浪涌测试方法介绍》', '', '网口、RJ45、浪涌、防护、差模、共模、电信、YDT993', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]电信终端设备防雷标准-YDT 993-2006解读.pdf', '2016-11-07', '已处理', null, '5', '37');
INSERT INTO `experience` VALUES ('19', '湖北电信 IHO-2000D 不开机故障问题分析', '11008845', '国内', '湖北', null, '由于 FLASH 软件驱动兼容性带来的概率性不开机另设计时需要关注不同 FLASH 之间 pin 脚定义的不同，如东芝 FLASH 的 pin38，pin39 需要供电，美光不需要。', 'Amlogic S805', 'Amlogic;S805;MLC; FLASH;东芝;不开机;驱动;兼容', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]湖北电信IHO-2000D不开机故障问题分析.pdf', '2016-11-07', '未处理', null, null, '38');
INSERT INTO `experience` VALUES ('20', ' 静电测试整改', '20073800', '国内', '国内', null, 'HD8800-T SCART 机器，在 USB 播放视频的时候对光纤座打静电死机，由于光线座下面有很多诸如电源等敏感走线。经过割地割线等整改通过。\r\nHDMI Dongle 机器，对机壳、HDMI，USB 端口打接触放电或空气放电不过，和敏感器件/线路离端口太近，以及主板太小所以可放电面积太小有关。经过在被测试管脚增加地孔后\r\n通过测试。', 'MSD5043/ BCM7230', '光纤，静电测试，死机，USB 端口，HDMI 端口，屏蔽，接地，空气放电，接触放 电，ESD', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]静电测试整改.pdf', '2016-11-07', '已处理', null, '5', '39');
INSERT INTO `experience` VALUES ('21', '视频 BUFFER 影响 EMC 测试整改', '20073800', '国内', '陕西', null, '陕西 DVB-C9700 SX，在国抽摸底的时候，使用帝奥微的DIO2551，用 AV 输出时，60MHz 附近辐射测试超标，通过更改视频 buffer 输出的滤波电路，测试合格。', 'Hi3716MV310', 'EMC；辐射；滤波；视频 buffer；视频运放；DIO2551', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]视频buffer影响EMC测试整改.pdf', '2016-11-07', '已处理', null, '5', '28');
INSERT INTO `experience` VALUES ('22', 'DDR 干扰高频头灵敏度指标整改', '20073800', '国内', '国内', null, '网口指示灯的两条信号线将 DDR 干扰带出，影响高频头的灵敏度指标', 'Hi3716MV310', 'TDA18250B，DDR3，666M，灵敏度，网口，隔直器，Tuner，高频头', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]网口带出DDR辐射影响高频头灵敏度.pdf', '2016-11-07', '已处理', null, '5', '40');
INSERT INTO `experience` VALUES ('23', ' 网口浪涌测试方法介绍', '20152714', '国内', '国内', null, '针对目前 IPTV 市场要求网络浪涌测试，本文依照电信网络浪涌测试标准 YDT993 介绍网口浪涌测试标准，以便大家对网络产品进行浪涌测试。', '', '网口、RJ45、浪涌、防护、差模、共模、电信、YDT993、测试方法', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]网口浪涌测试方法介绍.pdf', '2016-11-07', '已处理', null, '5', '37');
INSERT INTO `experience` VALUES ('24', ' 印度高清 CH-8600M 开机无信号问题', '11022719', '海外', '印度', null, 'CH-8600M 批量生产时候，发现 3%左右的整机开机后无信号，再次重新搜索无法锁定信号。将整机断电重启之后可以锁定节目。原因如下：整机开机时候，主芯片内置 demod\r\n通过主芯片内置 IIC 进行初始化的时候，实际得到的初始化寄存器的值和软件设置的值不一\r\n样。为了解决此问题，软件上增加寄存器值比较功能，比较 demod 初始化后寄存器值是否和软件设置值一致，如不一致再次进行 demod 初始化。内部循环比较设置为 10 次，无问题后再进入后续流程。更改之后，问题解决。', 'ST273', '无信号 DEMOD 初始化 寄存器 未锁定 重开机', null, 'C:\\tomcat7\\webapps\\Eva\\upload\\experience\\[经验分享]印度高清CH-8600M开机无信号问题.pdf', '2016-11-07', '已处理', null, '5', '42');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobId` int(11) NOT NULL auto_increment,
  `jobName` varchar(25) default NULL,
  PRIMARY KEY  (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '电路设计师');
INSERT INTO `job` VALUES ('2', '结构设计师');
INSERT INTO `job` VALUES ('3', '测试工程师');
INSERT INTO `job` VALUES ('4', '其他');

-- ----------------------------
-- Table structure for mode
-- ----------------------------
DROP TABLE IF EXISTS `mode`;
CREATE TABLE `mode` (
  `modeId` int(11) NOT NULL auto_increment,
  `modeName` varchar(25) default NULL,
  `createTime` date default NULL,
  `employee` varchar(25) default NULL,
  `problemMode` int(11) default NULL,
  `comprehensive` int(11) default NULL,
  PRIMARY KEY  (`modeId`),
  KEY `modeEmployee` (`employee`),
  KEY `modeProblemMode` (`problemMode`),
  KEY `comprehensivemode` (`comprehensive`),
  CONSTRAINT `comprehensivemode` FOREIGN KEY (`comprehensive`) REFERENCES `comprehensive` (`comprehensiveId`),
  CONSTRAINT `modeEmployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `modeProblemMode` FOREIGN KEY (`problemMode`) REFERENCES `problemmode` (`problemModeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mode
-- ----------------------------
INSERT INTO `mode` VALUES ('1', '2015年无权重分配模型', '2016-10-25', 'admin', null, null);

-- ----------------------------
-- Table structure for modecomprehensive
-- ----------------------------
DROP TABLE IF EXISTS `modecomprehensive`;
CREATE TABLE `modecomprehensive` (
  `modeComprehensiveId` int(11) NOT NULL auto_increment,
  `mode` int(11) default NULL,
  `comprehensive` int(11) default NULL,
  PRIMARY KEY  (`modeComprehensiveId`),
  KEY `modeComprehensive` (`mode`),
  KEY `modeComprehensive2` (`comprehensive`),
  CONSTRAINT `modeComprehensive` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`),
  CONSTRAINT `modeComprehensive2` FOREIGN KEY (`comprehensive`) REFERENCES `comprehensive` (`comprehensiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modecomprehensive
-- ----------------------------

-- ----------------------------
-- Table structure for modeproblemmoder
-- ----------------------------
DROP TABLE IF EXISTS `modeproblemmoder`;
CREATE TABLE `modeproblemmoder` (
  `modeProblemModeRId` int(11) NOT NULL auto_increment,
  `mode` int(11) default NULL,
  `problemMode` int(11) default NULL,
  PRIMARY KEY  (`modeProblemModeRId`),
  KEY `modeProblemmode1` (`mode`),
  KEY `modeproblemmode2` (`problemMode`),
  CONSTRAINT `modeProblemmode1` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`),
  CONSTRAINT `modeproblemmode2` FOREIGN KEY (`problemMode`) REFERENCES `problemmode` (`problemModeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modeproblemmoder
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL auto_increment,
  `orderName` varchar(255) default NULL,
  `employee` varchar(25) default NULL,
  `num` int(11) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`orderId`),
  KEY `order1` (`employee`),
  CONSTRAINT `order1` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for overallscore
-- ----------------------------
DROP TABLE IF EXISTS `overallscore`;
CREATE TABLE `overallscore` (
  `id` int(11) NOT NULL auto_increment,
  `startTime` date default NULL,
  `endTime` date default NULL,
  `name` varchar(50) default NULL,
  `mode` int(11) default NULL,
  `Employee` varchar(20) default NULL,
  `createTime` date default NULL,
  `employeeNum` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `overallresult1` (`mode`),
  KEY `overallresult2` (`Employee`),
  CONSTRAINT `overallresult1` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`),
  CONSTRAINT `overallresult2` FOREIGN KEY (`Employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overallscore
-- ----------------------------
INSERT INTO `overallscore` VALUES ('1', '2015-01-01', '2015-12-31', '2015年电路评审', '1', null, '2016-11-03', null);
INSERT INTO `overallscore` VALUES ('2', '2016-01-01', '2016-12-31', '2016年评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('3', '2016-01-01', '2016-11-11', '2016年评审2', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('4', '2015-01-01', '2015-12-31', '2015年第二次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('5', '2015-01-01', '2015-12-31', '2015年第三次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('6', '2015-01-01', '2015-12-31', '2015年第四次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('7', '2015-01-01', '2015-12-31', '2015年第五次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('8', '2015-01-01', '2015-12-31', '2015年员工第六次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('9', '2015-01-01', '2016-12-31', '2015年员工第七次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('10', '2015-01-01', '2015-12-31', '2015年员工第八次评审', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('11', '2016-01-01', '2016-12-31', '2016年评审3', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('12', '2016-01-01', '2016-11-11', '2016年评审3', '1', null, '2016-11-11', null);
INSERT INTO `overallscore` VALUES ('13', '2016-01-01', '2016-11-11', '2016年评审4', '1', null, '2016-11-11', null);

-- ----------------------------
-- Table structure for patent
-- ----------------------------
DROP TABLE IF EXISTS `patent`;
CREATE TABLE `patent` (
  `patentId` varchar(25) NOT NULL,
  `patentName` varchar(255) default NULL,
  `patentType` varchar(25) default NULL,
  `employee` varchar(25) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`patentId`),
  KEY `patentEmployee` (`employee`),
  CONSTRAINT `patentEmployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patent
-- ----------------------------

-- ----------------------------
-- Table structure for phase
-- ----------------------------
DROP TABLE IF EXISTS `phase`;
CREATE TABLE `phase` (
  `phaseId` int(11) NOT NULL auto_increment,
  `phaseName` varchar(25) default NULL,
  `priority` int(11) default NULL,
  PRIMARY KEY  (`phaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phase
-- ----------------------------
INSERT INTO `phase` VALUES ('1', '立项阶段', '1');
INSERT INTO `phase` VALUES ('2', '初样阶段', '2');
INSERT INTO `phase` VALUES ('3', '正样阶段', '3');
INSERT INTO `phase` VALUES ('4', '小批量阶段', '4');
INSERT INTO `phase` VALUES ('5', '批量阶段', '5');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `problemId` int(11) NOT NULL auto_increment,
  `problemName` varchar(255) default NULL,
  `phase` int(11) default NULL,
  `review` int(11) default NULL,
  `commentId` varchar(32) default NULL,
  `problemContent` varchar(255) default NULL,
  `problemLevel` varchar(25) default NULL,
  `problemState` int(11) default NULL,
  `problemBelong` varchar(25) default NULL,
  `problemBelongProject` varchar(25) default NULL,
  `problemLoction` varchar(25) default NULL,
  `problemType` int(11) default NULL,
  `explaintion` varchar(255) default NULL,
  `imageurl` varchar(100) default NULL,
  `createTime` date default NULL,
  PRIMARY KEY  (`problemId`),
  KEY `problem1` (`phase`),
  KEY `problem2` (`review`),
  KEY `problem3` (`problemBelong`),
  KEY `problem4` (`problemBelongProject`),
  KEY `problem5` (`problemState`),
  KEY `problem6` (`problemType`),
  KEY `problem7` (`commentId`),
  CONSTRAINT `problem1` FOREIGN KEY (`phase`) REFERENCES `phase` (`phaseId`),
  CONSTRAINT `problem2` FOREIGN KEY (`review`) REFERENCES `review` (`reviewId`),
  CONSTRAINT `problem3` FOREIGN KEY (`problemBelong`) REFERENCES `employee` (`id`),
  CONSTRAINT `problem4` FOREIGN KEY (`problemBelongProject`) REFERENCES `project` (`projectId`),
  CONSTRAINT `problem5` FOREIGN KEY (`problemState`) REFERENCES `problemstate` (`stateId`),
  CONSTRAINT `problem6` FOREIGN KEY (`problemType`) REFERENCES `problemtype` (`typeId`),
  CONSTRAINT `problem7` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('40', 'C32/C45/C1/C2/C3/C24/C25等按照规范，应标明耐压', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'B', null, '20218676', 'GS100', null, '3', '已修改类似错误', null, '2016-07-21');
INSERT INTO `problem` VALUES ('41', 'R32/R33等按照规范，应标明1%精度', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'B', null, '20218676', 'GS100', null, '3', '已修改类似错误', null, '2016-07-21');
INSERT INTO `problem` VALUES ('42', 'R134\\R138等规格，按照规范，应该表示为500R', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', null, '20218676', 'GS100', null, '3', '已修改类似错误', null, '2016-07-21');
INSERT INTO `problem` VALUES ('43', 'U9的规格？MAX15059还是MP3430', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', null, '20218676', 'GS100', null, '2', 'MP3430贴片，MAX15059 P2P兼容', null, '2016-07-21');
INSERT INTO `problem` VALUES ('44', 'R71/R95/Q1/Q2没有规格型号？是否安装？', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'B', null, '20218676', 'GS100', null, '2', 'Q1Q2 NC不贴片，已修改', null, '2016-07-21');
INSERT INTO `problem` VALUES ('45', 'L19/L20等的规格没有标出？', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', null, '20218676', 'GS100', null, '3', '已修改类似错误', null, '2016-07-21');
INSERT INTO `problem` VALUES ('46', 'R96/R100标明1%精度', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', null, '20218676', 'GS100', null, '3', '已修改类似错误', null, '2016-07-21');
INSERT INTO `problem` VALUES ('47', 'C121是不是放在另一边好点？', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', '3', '20218676', 'GS100', null, '1', '已修改至右边', null, '2016-07-21');
INSERT INTO `problem` VALUES ('48', 'DDR_VREF靠近DDR管脚应有电容', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', '2', '20218676', 'GS100', null, '1', 'VREF在top走线，电容已经最大程度靠近DDR，若再近点会影响DD贴片。', null, '2016-07-21');
INSERT INTO `problem` VALUES ('49', '建议R101网络远离TX_FAULT及APD_DAC网络。', '3', null, '8a87e29657dfdd510157e161128a0000', null, 'C', null, '20218676', 'GS100', null, '1', '已修改，加gnd隔离。', null, '2016-07-21');
INSERT INTO `problem` VALUES ('50', '原理图的Title没有改,还是澜起的', '3', null, '8a87e29657e4b6d30157e4bc25780000', null, 'C', null, '20155708', 'HD2000HS', null, '3', '', null, '2016-06-02');
INSERT INTO `problem` VALUES ('51', '网口安全间距不符合要求:', '3', null, '8a87e29657e4b6d30157e4bc25780000', null, 'A', null, '20155708', 'HD2000HS', null, '1', '', null, '2016-06-02');
INSERT INTO `problem` VALUES ('52', '9Q1的方向反了?', '3', null, '8a87e29657e4b6d30157e4cf14620001', null, 'A', '3', '20155708', 'IHO-2905', null, '1', '已经更改', null, '2016-03-24');
INSERT INTO `problem` VALUES ('53', '1U6的排版建议优化下,特别是输入及输出电容的回地环路', '3', null, '8a87e29657e4b6d30157e4cf14620001', null, 'C', '3', '20155708', 'IHO-2905', null, '1', '已经更改', null, '2016-03-24');
INSERT INTO `problem` VALUES ('54', '适配器接头的接地端,在顶层\\底层\\GND层建议floor over', '3', null, '8a87e29657e4b6d30157e4cf14620001', null, 'C', '3', '20155708', 'IHO-2905', null, '1', '已经更改', null, '2016-03-24');
INSERT INTO `problem` VALUES ('55', '安全间距不够', '3', null, '8a87e29657e4b6d30157e4cf14620001', null, 'A', '3', '20155708', 'IHO-2905', null, '1', '已经更改', null, '2016-03-24');
INSERT INTO `problem` VALUES ('56', '1C28/1C36/1C29的规格表示方法226等不符合规定', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'C', null, '20155708', 'IHO-2905', null, '3', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('57', '这种驱动方法是否有问题?上电的一瞬间,3V3_5V_EN这个网络是否有确定的状态?', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'A', null, '20155708', 'IHO-2905', null, '1', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('58', 'AR1、AR22都装？', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'A', null, '20155708', 'IHO-2905', null, '2', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('59', '1U6的输入\\输出电容的地与芯片的地没有在底层连在一起,建议优化下,1U7、9U2有同样的问题', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'B', null, '20155708', 'IHO-2905', null, '1', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('60', '保护器件到引脚的连线应足够粗，且信号应从保护器件的焊盘上过。', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'B', null, '20155708', 'IHO-2905', null, '1', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('61', '这部分的排版，输入输出电容的回地路径，需要优化。', '3', null, '8a87e29657e4b6d30157e4d2543b0002', null, 'B', null, '20155708', 'IHO-2905', null, '1', '', null, '2016-01-15');
INSERT INTO `problem` VALUES ('62', '这个走线请不要走电源层', '3', null, '8a87e29657e4b6d30157e4dc074e0005', null, 'B', '3', '20155708', 'OTS-3000 SX', null, '1', '已经更改', null, '2016-06-17');
INSERT INTO `problem` VALUES ('63', '保护元件应有过孔就近接地', '3', null, '8a87e29657e4b6d30157e4dc074e0005', null, 'B', '3', '20155708', 'OTS-3000 SX', null, '1', '已经更改', null, '2016-06-17');
INSERT INTO `problem` VALUES ('64', '原理图、PCB不对应？如原理图J201，无PCB对应元件？', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'A', null, '20155707', 'CH832R', null, '3', '', null, '2016-01-21');
INSERT INTO `problem` VALUES ('65', 'R242/R243和R252/R253只能二选一', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'A', null, '20155707', 'CH832R', null, '2', '', null, '2016-01-21');
INSERT INTO `problem` VALUES ('66', 'R404/R405标明1%精度', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'B', null, '20155707', 'CH832R', null, '3', '', null, '2016-01-21');
INSERT INTO `problem` VALUES ('67', 'RP21/RP22应标明1%精度', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'B', null, '20155707', 'CH832R', null, '3', null, null, '2016-01-21');
INSERT INTO `problem` VALUES ('68', 'DD1型号不正确', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'C', null, '20155707', 'CH832R', null, '2', null, null, '2016-01-21');
INSERT INTO `problem` VALUES ('69', '22U25V0805 这个规格不常用，22u通常是6.3V耐压', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'C', null, '20155707', 'CH832R', null, '3', null, null, '2016-01-21');
INSERT INTO `problem` VALUES ('70', '顶层地网络的铺铜参数设置有问题，铺成了网格状', '3', null, '8a87e29657e4b6d30157e4e1b91b0006', null, 'B', null, '20155707', 'CH832R', null, '2', '', null, '2016-01-21');
INSERT INTO `problem` VALUES ('71', 'PCB中没有J203？原理图', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'A', null, '20155707', 'EP-3000', null, '3', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('72', 'CP4、CP5、CP15等，22U25V0805没有使用这个规格', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'C', null, '20155707', 'EP-3000', null, '3', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('73', 'DC-DC的FB反馈电阻，请使用1%精度，如RP16、RP8', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'B', null, '20155707', 'EP-3000', null, '3', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('74', 'IR57、IR91用1%精度电阻，另UVP的分压取未接电阻前的5V0_MOS网络', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'C', null, '20155707', 'EP-3000', null, '1', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('75', 'IR9用1%精度电阻', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'C', null, '20155707', 'EP-3000', null, '3', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('76', 'I2C请不要按照差分线走', '3', null, '8a87e29657e4b6d30157e4e2dd790007', null, 'C', null, '20155707', 'EP-3000', null, '1', '', null, '2016-07-04');
INSERT INTO `problem` VALUES ('77', 'DC-DC的分压电阻,请标明1%精度', '3', null, '8a87e29657e4b6d30157e4e631200008', null, 'C', null, '20155707', 'ES100 UW2', null, '3', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('78', '22U25V0805 这个不是我们常用的规格,请更新', '3', null, '8a87e29657e4b6d30157e4e631200008', null, 'C', null, '20155707', 'ES100 UW2', null, '3', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('79', 'LP9,原理图和PCB的网络不对应?', '3', null, '8a87e29657e4b6d30157e4e631200008', null, 'A', null, '20155707', 'ES100 UW2', null, '3', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('80', '安全间距不够。', '3', null, '8a87e29657e4b6d30157e4e631200008', null, 'A', null, '20155707', 'ES100 UW2', null, '2', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('81', 'J203/J1/D7/D9/D12 PCB中没有对应物料?R2原理图中没有对应物料？原理图PCB不对应。', '3', null, '8a87e29657e4b6d30157e4e7ec000009', null, 'A', null, '20155707', 'ES100 U4BI', null, '3', '', null, '2016-04-29');
INSERT INTO `problem` VALUES ('82', 'C15/C17没有标明耐压', '3', null, '8a87e29657e4b6d30157e4e7ec000009', null, 'B', null, '20155707', 'ES100 U4BI', null, '3', '', null, '2016-04-29');
INSERT INTO `problem` VALUES ('83', 'R609的阻值表示方法562不符合规定', '3', null, '8a87e29657e4b6d30157e5013009000d', null, 'B', null, '20073800', 'HD 7250', null, '3', '', null, '2016-04-28');
INSERT INTO `problem` VALUES ('84', '这是什么意思?', '3', null, '8a87e29657e4b6d30157e5013009000d', null, 'A', null, '20073800', 'HD 7250', null, '2', null, null, '2016-04-28');
INSERT INTO `problem` VALUES ('85', 'C41/C29等未标明耐压', '3', null, '8a87e29657e4b6d30157e5013009000d', null, 'B', null, '20073800', 'HD 7250', null, '3', null, null, '2016-04-28');
INSERT INTO `problem` VALUES ('86', 'R405\\R408\\R603\\R1609是否需要1%精度电阻?', '3', null, '8a87e29657e4b6d30157e501b8e7000f', null, 'C', null, '20073800', 'HD 7250', null, '3', '需要', null, '2016-06-15');
INSERT INTO `problem` VALUES ('87', '安全间距不够', '3', null, '8a87e29657e4b6d30157e501b8e7000f', null, 'A', null, '20073800', 'HD 7250', null, '2', '已更改', null, '2016-06-15');
INSERT INTO `problem` VALUES ('88', '这个走线DDR的电源层未覆盖到', '3', null, '8a87e29657e4b6d30157e501b8e7000f', null, 'A', null, '20073800', 'HD 7250', null, '1', '已更改', null, '2016-06-15');
INSERT INTO `problem` VALUES ('89', 'C57/C273/C48等电容,按照原理图规范,应该标明耐压', '3', null, '8a87e29657e4b6d30157e5074a030011', null, 'B', null, '20073800', 'YN2016V01', null, '3', '', null, '2016-03-15');
INSERT INTO `problem` VALUES ('90', 'R319/R43/R318/R314请加精度标识', '3', null, '8a87e29657e4b6d30157e5074a030011', null, 'B', null, '20073800', 'YN2016V01', null, '3', '', null, '2016-03-15');
INSERT INTO `problem` VALUES ('91', 'R79应使用5.1R电阻（注意测试下5.1R电阻的功率和压降）', '3', null, '8a87e29657e4b6d30157e5074a030011', null, 'A', null, '20073800', 'YN2016V01', null, '1', '', null, '2016-03-15');
INSERT INTO `problem` VALUES ('92', 'R31/R346配置值不合适', '3', null, '8a87e29657e4b6d30157e5074a030011', null, 'A', null, '20073800', 'YN2016V01', null, '1', '', null, '2016-03-15');
INSERT INTO `problem` VALUES ('93', 'TDA8024 PORADJ脚的电阻需要1%精度，且目前的规格来至于哪里？', '3', null, '8a87e29657e4b6d30157e5090c9c0012', null, 'B', null, '20073800', '20160810ML01', null, '1', '板子是在张方方的设计上改的，这个沿用她的', null, '2016-10-09');
INSERT INTO `problem` VALUES ('94', 'R319\\R43\\R318\\R314标明1%精度', '3', null, '8a87e29657e4b6d30157e50e92b30015', null, 'B', null, '20073800', 'DVB-C9700 SY', null, '3', '已更改', null, '2016-03-22');
INSERT INTO `problem` VALUES ('95', 'C440\\C65\\C38\\C443按照规定应标明耐压', '3', null, '8a87e29657e4b6d30157e50e92b30015', null, 'C', null, '20073800', 'DVB-C9700 SY', null, '3', '已更改', null, '2016-03-22');
INSERT INTO `problem` VALUES ('96', 'D14的2脚建议接5V,不接Video 5V', '3', null, '8a87e29657e4b6d30157e50e92b30015', null, 'B', null, '20073800', 'DVB-C9700 SY', null, '1', '已更改', null, '2016-03-22');
INSERT INTO `problem` VALUES ('97', '网口这部分的安全间距不够:', '3', null, '8a87e29657e4b6d30157e50e92b30015', null, 'B', null, '20073800', 'DVB-C9700 SY', null, '2', '已更改', null, '2016-03-22');
INSERT INTO `problem` VALUES ('98', 'C63的回地路径太长,同时,电源铺铜有问题:', '3', null, '8a87e29657e4b6d30157e50e92b30015', null, 'B', null, '20073800', 'DVB-C9700 SY', null, '1', '已更改', null, '2016-03-22');
INSERT INTO `problem` VALUES ('99', '这里,需要加足够的地过孔。', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'B', null, '20073800', 'DVB-C9700 HBM', null, '1', '已更改', null, '2015-12-31');
INSERT INTO `problem` VALUES ('100', '电容放下来，不要绕这个弯：', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'C', null, '20073800', 'DVB-C9700 HBM', null, '1', '已更改', null, '2015-12-31');
INSERT INTO `problem` VALUES ('101', '所有ESD器件要有独立过孔到地。', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'C', null, '20073800', 'DVB-C9700 HBM', null, '1', '已更改', null, '2015-12-31');
INSERT INTO `problem` VALUES ('102', '要有过孔。', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'C', null, '20073800', 'DVB-C9700 HBM', null, '1', '已增加', null, '2015-12-31');
INSERT INTO `problem` VALUES ('103', '这个挖空是啥意思？', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'C', null, '20073800', 'DVB-C9700 HBM', null, '1', '背面的，已更改', null, '2015-12-31');
INSERT INTO `problem` VALUES ('104', '螺钉孔未接地', '3', null, '8a87e29657e4b6d30157e51093da0016', null, 'C', null, '20073800', 'DVB-C9700 HBM', null, '1', '已更改', null, '2015-12-31');
INSERT INTO `problem` VALUES ('105', '22U25V0805 这个规格我们不常用,常见的规格是6.3V耐压的', '3', null, '8a87e29657e4b6d30157e5098f180013', null, 'C', null, '11008845', 'CH-8500MU-GHITS', null, '1', 'BOM上为6.3V的，原理图已改', null, '2015-09-08');
INSERT INTO `problem` VALUES ('106', 'C95 2n2F/50V 这个规格有问题吧?', '3', null, '8a87e29657e4b6d30157e5098f180013', null, 'C', null, '11008845', 'CH-8500MU-GHITS', null, '2', '从平台项目派生，我已经原理图已经改为2.2n，bom上也是对的。', null, '2015-09-08');
INSERT INTO `problem` VALUES ('107', 'R188/R192建议用1%精度电阻,同时,建议取样的电压用不要过电阻前的,防止过了电阻的电压太低误触发', '3', null, '8a87e29657e4b6d30157e5098f180013', null, 'C', null, '11008845', 'CH-8500MU-GHITS', null, '1', '已改为F精度电阻，我实测过UVP电压，1.7V以上，余量较大，不会误触发', null, '2015-09-08');
INSERT INTO `problem` VALUES ('108', '二极管建议放在保险丝的后面: ', '3', null, '8a87e29657e4b6d30157e5098f180013', null, 'B', null, '11008845', 'CH-8500MU-GHITS', null, '1', '已更改', null, '2015-09-08');
INSERT INTO `problem` VALUES ('109', 'PCB坐标原点不在左下角', '3', null, '8a87e29657e4b6d30157e5098f180013', null, 'C', null, '11008845', 'CH-8500MU-GHITS', null, '2', '', null, '2015-09-08');
INSERT INTO `problem` VALUES ('113', 'Q4501型号不对,另外,让博通解释下,为啥MOS管的gate级要上拉到5V而不是3.3V呢?', '3', null, '8a87e29657e4b6d30157e51d442b0018', null, 'C', null, '11020809', '2015BCM7251S', null, '2', '', null, '2015-09-14');
INSERT INTO `problem` VALUES ('114', 'L7没标规格', '3', null, '8a87e29657e4b6d30157e51d442b0018', null, 'B', null, '11020809', '2015BCM7251S', null, '3', '', null, '2015-09-14');
INSERT INTO `problem` VALUES ('115', '网口不符合安全间距要求', '3', null, '8a87e29657e4b6d30157e51d442b0018', null, 'B', null, '11020809', '2015BCM7251S', null, '1', '', null, '2015-09-14');
INSERT INTO `problem` VALUES ('116', 'GPRS模块的复位电路,在模块端没有上拉或下拉电阻,当主芯片端为高电平的时候,GPRS模块复位端状态不确定?', '3', null, '8a87e29657e4b6d30157e523cd2a001c', null, 'A', null, '11008845', 'SG6800LN-CA15', null, '1', '模块内部有上拉', null, '2015-12-16');
INSERT INTO `problem` VALUES ('117', 'CA卡供电走线太细：', '3', null, '8a87e29657e4b6d30157e523cd2a001c', null, 'B', null, '11008845', 'SG6800LN-CA15', null, '1', '已经增加到12mil，这个电流很小，原来应该也是够的。', null, '2015-12-16');
INSERT INTO `problem` VALUES ('118', 'DD1型号不对', '3', null, '8a87e29657e4b6d30157e524b15b001d', null, 'C', null, '20059615', 'SDG6800LN-HD02', null, '2', '', null, '2016-03-03');
INSERT INTO `problem` VALUES ('119', 'C210需标出耐压', '3', null, '8a87e29657e4b6d30157e524b15b001d', null, 'B', null, '20059615', 'SDG6800LN-HD02', null, '3', '', null, '2016-03-03');
INSERT INTO `problem` VALUES ('120', 'CP1\\CP14使用的10U25V0805及CP2\\CP21使用的22U25V0805不是常用型号', '3', null, '8a87e29657e4b6d30157e524b15b001d', null, 'C', null, '20059615', 'SDG6800LN-HD02', null, '3', '', null, '2016-03-03');
INSERT INTO `problem` VALUES ('121', 'R224/R225/R226/R227应标明1%精度', '3', null, '8a87e29657e4b6d30157e52690fa001e', null, 'B', null, '20059615', 'DVB-C8000BGA HN1', null, '3', '', null, '2016-05-06');
INSERT INTO `problem` VALUES ('122', 'C3耐压错误', '3', null, '8a87e29657e4b6d30157e5287fac001f', null, 'A', null, '14000635', 'MSA6Z18', null, '2', '', null, null);
INSERT INTO `problem` VALUES ('123', 'DD1型号不正确', '3', null, '8a87e29657e4b6d30157e52a44430020', null, 'C', null, '12138029', 'CDVBT2', null, '3', '', null, '2016-10-20');
INSERT INTO `problem` VALUES ('124', '确认天线供电的电流要求300mA？3906只有200mA？', '3', null, '8a87e29657e4b6d30157e52a44430020', null, 'A', null, '12138029', 'CDVBT2', null, '1', '', null, '2016-10-20');
INSERT INTO `problem` VALUES ('125', 'ESD器件接地脚附近应有过孔', '3', null, '8a87e29657e4b6d30157e52a44430020', null, 'C', null, '12138029', 'CDVBT2', null, '1', '', null, '2016-10-20');
INSERT INTO `problem` VALUES ('126', 'DC-DC的排版建议优化下，将电容转90度后，移动到离芯片及电感更近的位置，减小输出电容的回地路径。同时，Vref的取样点请放在电容后面', '3', null, '8a87e29657e4b6d30157e52a44430020', null, 'B', null, '12138029', 'CDVBT2', null, '1', '', null, '2016-10-20');
INSERT INTO `problem` VALUES ('127', 'VDD_AUDIO走线太细。', '3', null, '8a87e29657e4b6d30157e52a44430020', null, 'A', null, '12138029', 'CDVBT2', null, '2', '', null, '2016-10-20');
INSERT INTO `problem` VALUES ('128', 'DC插座的接地，建议Floor over或大面积铜皮连接，现在的方式地连接太少', '3', null, '8a87e29657e4b6d30157e52dd8940021', null, 'A', null, '12138029', 'CH-8501M VMX', null, '2', '', null, '2016-05-16');
INSERT INTO `problem` VALUES ('129', 'C37规格？', '3', null, '8a87e29657e4b6d30157e52f73d50022', null, 'C', null, '12138029', 'HI3716M V330', null, '2', '', null, '2016-07-25');
INSERT INTO `problem` VALUES ('130', '网口安全间距不够', '3', null, '8a87e29657e4b6d30157e52f73d50022', null, 'A', null, '12138029', 'HI3716M V330', null, '1', '', null, '2016-07-25');
INSERT INTO `problem` VALUES ('131', '含有MLC Nand FLASH的设计，其下电时序是否有要求?', '3', null, '8a87e29657e4b6d30157e530f7280023', null, 'C', null, '11008845', '2015OTT', null, '1', '这个真没注意，不过这部分是严格按照原厂参考设计，也批量过,应该没什么问题', null, '2015-12-22');
INSERT INTO `problem` VALUES ('132', '防静电器件应放在靠近插座管脚处', '3', null, '8a87e29657e4b6d30157e530f7280023', null, 'C', null, '11008845', '2015OTT', null, '1', '已改', null, '2015-12-22');
INSERT INTO `problem` VALUES ('133', '底层的高速走线，参考层为第三层，所以，请注意下面的USB走线：', '3', null, '8a87e29657e4b6d30157e530f7280023', null, 'B', null, '11008845', '2015OTT', null, '1', '底层的USB走线的参考层依然是第二层GND层', null, '2015-12-22');
INSERT INTO `problem` VALUES ('134', 'UP1\\UP2\\UP3未标明具体型号', '3', null, '8a87e29657e4b6d30157e53252e00025', null, 'C', null, '11008845', '2015CH-8501M-I', null, '3', '已增加', null, '2015-10-21');
INSERT INTO `problem` VALUES ('135', 'Q28型号不正确', '3', null, '8a87e29657e4b6d30157e53252e00025', null, 'C', null, '11008845', '2015CH-8501M-I', null, '3', '已更改', null, '2015-10-21');
INSERT INTO `problem` VALUES ('136', '视频运放的供电要加电阻', '3', null, '8a87e29657e4b6d30157e53252e00025', null, 'B', null, '11008845', '2015CH-8501M-I', null, '3', '位号FB1，BOM上为5.1欧姆的电阻', null, '2015-10-21');
INSERT INTO `problem` VALUES ('137', '定位点上有丝印', '3', null, '8a87e29657e4b6d30157e53252e00025', null, 'B', null, '11008845', '2015CH-8501M-I', null, '2', '发板前调整到位', null, '2015-10-21');
INSERT INTO `problem` VALUES ('138', '部分位号上焊盘,未调整', '3', null, '8a87e29657e4b6d30157e53252e00025', null, 'C', null, '11008845', '2015CH-8501M-I', null, '2', '发板前调整到位', null, '2015-10-21');
INSERT INTO `problem` VALUES ('139', 'FB12\\FB31,请使用电阻', '3', null, '8a87e29657e4b6d30157e5344a390028', null, 'A', null, '11022719', 'VS1265', null, '3', '', null, '2016-05-20');
INSERT INTO `problem` VALUES ('140', '这部分,阻抗不均匀:', '3', null, '8a87e29657e4b6d30157e5344a390028', null, 'C', null, '11022719', 'VS1265', null, '1', '', null, '2016-05-20');
INSERT INTO `problem` VALUES ('142', '22U25V0805 这个规格的电容不常用,通常22uF耐压是6.3V的', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'C', null, '20152714', '2015DVB-T7T35SR', null, '2', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('143', 'R119\\RP32\\RP34建议用1%精度', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'B', null, '20152714', '2015DVB-T7T35SR', null, '1', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('144', 'FB6应用电阻,如5.1欧', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'A', null, '20152714', '2015DVB-T7T35SR', null, '1', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('145', 'U8\\U9的输入电容建议至少10uF', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'B', null, '20152714', '2015DVB-T7T35SR', null, '1', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('146', '这些射频线是否有阻抗要求？', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'A', null, '20152714', '2015DVB-T7T35SR', null, '1', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('147', '模拟信号建议远离晶振：', '3', null, '8a87e29657e4b6d30157e53415460027', null, 'A', null, '20152714', '2015DVB-T7T35SR', null, '1', '', null, '2015-09-02');
INSERT INTO `problem` VALUES ('148', '809不装?AR9331可以内部复位么?另外,809为什么使用2.63V版本?', '3', null, '8a87e29657e4b6d30157e53a4913002e', null, 'C', null, '11021950', 'HPH2000', null, '3', '有内部复位，809只是预留，可以用常用规格', null, '2016-06-06');
INSERT INTO `problem` VALUES ('149', '3906作为LDO的调整管,hFE是否够大?电流?', '3', null, '8a87e29657e4b6d30157e53a4913002e', null, 'A', null, '11021950', 'HPH2000', null, '1', '已改成MMBT2907A-7-F', null, '2016-06-06');
INSERT INTO `problem` VALUES ('150', 'LDO_OUT走线太细,且应包地', '3', null, '8a87e29657e4b6d30157e53a4913002e', null, 'B', null, '11021950', 'HPH2000', null, '1', '已修改', null, '2016-06-06');
INSERT INTO `problem` VALUES ('151', '你这电源层上的DDR_VCC划分区域中,底层的DDR无关走线\\元件有在其中', '3', null, '8a87e29657e4b6d30157e53a4913002e', null, 'B', null, '11021950', 'HPH2000', null, '1', '已修改', null, '2016-06-06');
INSERT INTO `problem` VALUES ('152', '这部分电源层要不要划进来？', '3', null, '8a87e29657e4b6d30157e53a4913002e', null, 'B', null, '11021950', 'HPH2000', null, '1', '已修改', null, '2016-06-06');
INSERT INTO `problem` VALUES ('153', '网口安全间距不符合要求：', '3', null, '8a87e29657e4b6d30157e53a336c002d', null, 'B', null, '20152714', '2015IHO-1000 4K', null, '2', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('154', 'CVBS应远离DC-DC的功率电感，否则可能有很大的被干扰风险', '3', null, '8a87e29657e4b6d30157e53a336c002d', null, 'A', null, '20152714', '2015IHO-1000 4K', null, '1', null, null, '2015-12-31');
INSERT INTO `problem` VALUES ('155', '音频接口没有保护元件', '3', null, '8a87e29657e4b6d30157e53a336c002d', null, 'A', null, '20152714', '2015IHO-1000 4K', null, '2', null, null, '2015-12-31');
INSERT INTO `problem` VALUES ('156', '电源层上的GND铺成孤铜了', '3', null, '8a87e29657e4b6d30157e53a336c002d', null, 'B', null, '20152714', '2015IHO-1000 4K', null, '2', null, null, '2015-12-31');
INSERT INTO `problem` VALUES ('157', '原理图的title没改，还是Mstar Semiconductor', '3', null, '8a87e29657e4b6d30157e53becec002f', null, 'C', null, '11021933', 'DVB-S2 MSD7S75', null, '3', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('158', 'FB6要求是电阻', '3', null, '8a87e29657e4b6d30157e53becec002f', null, 'A', null, '11021933', 'DVB-S2 MSD7S75', null, '1', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('159', '用三极管不合适，且方向也错了。', '3', null, '8a87e29657e4b6d30157e53becec002f', null, 'A', null, '11021933', 'DVB-S2 MSD7S75', null, '1', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('160', 'ESD器件需要就近接地：', '3', null, '8a87e29657e4b6d30157e53becec002f', null, 'B', null, '11021933', 'DVB-S2 MSD7S75', null, '1', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('161', 'GND_EARTH_EPHY与GND之间应有足够的安全间距。', '3', null, '8a87e29657e4b6d30157e53becec002f', null, 'B', null, '11021933', 'DVB-S2 MSD7S75', null, '1', '', null, '2016-03-23');
INSERT INTO `problem` VALUES ('162', '8034对卡供电VCC的要求是: \n\n\npls follow', '3', null, '8a87e29657e4b6d30157e53ce6ad0030', null, 'B', null, '20059616', '2015HD DVB-S2 ENTEL', null, '1', '已改', null, '2015-08-05');
INSERT INTO `problem` VALUES ('163', '请预留CPU散热器引脚焊接位置', '3', null, '8a87e29657e4b6d30157e53ce6ad0030', null, 'A', null, '20059616', '2015HD DVB-S2 ENTEL', null, '1', '已增加定位孔', null, '2015-08-05');
INSERT INTO `problem` VALUES ('164', 'C3\\C11\\C12\\C13\\C14未按照规定标明耐压', '3', null, '8a87e29657e4b6d30157e53da1da0031', null, 'B', null, '11021933', 'ENDABV01', null, '3', '', null, '2016-01-25');
INSERT INTO `problem` VALUES ('165', '电容需要调转180度', '3', null, '8a87e29657e4b6d30157e53da1da0031', null, 'B', null, '11021933', 'ENDABV01', null, '1', '', null, '2016-01-25');
INSERT INTO `problem` VALUES ('166', 'RF4CE的I2C和Tuner连在同一组I2C上,这个不太有利于灵敏度,建议分开.', '3', null, '8a87e29657e4b6d30157e53efcc20032', null, 'C', null, '20059616', '2015HD DVB-S2 RIL', null, '1', '已修改为两组IIC兼容设计。', null, '2015-11-06');
INSERT INTO `problem` VALUES ('167', 'USB接口供电,10uF电容不够,建议至少加100uF的铝电解', '3', null, '8a87e29657e4b6d30157e53f69be0033', null, 'B', '3', '11020958', 'CH-8500MU-NSTV', null, '1', '', null, '2016-04-25');
INSERT INTO `problem` VALUES ('168', 'U12的型号是啥?', '3', null, '8a87e29657e4b6d30157e53f69be0033', null, 'C', null, '11020958', 'CH-8500MU-NSTV', null, '3', '见后', null, '2016-04-25');
INSERT INTO `problem` VALUES ('169', '原理图\\PCB不对应,如SC_VCC网络', '3', null, '8a87e29657e4b6d30157e53f69be0033', null, 'A', null, '11020958', 'CH-8500MU-NSTV', null, '3', '已改', null, '2016-04-25');
INSERT INTO `problem` VALUES ('170', 'U11的三路电源，FB路径均离功率电感较近，且+3.3V_AON这路输出地环路较大', '3', null, '8a87e29657e4b6d30157e54004340034', null, 'B', null, '20059616', '2015HD DVB-S2 RIL', null, '1', '3.3V的环路是C71、C72。FB已修改，稍后与参考设计对比。', null, '2015-10-26');
INSERT INTO `problem` VALUES ('171', '网口安全间距不够', '3', null, '8a87e29657e4b6d30157e540f5470035', null, 'A', null, '11020958', 'DVB-T2-GE-7T75', null, '1', '', null, '2016-06-02');
INSERT INTO `problem` VALUES ('172', 'Smart Card VCC走线太细', '3', null, '8a87e29657e4b6d30157e540f5470035', null, 'B', null, '11020958', 'DVB-T2-GE-7T75', null, '2', '', null, '2016-06-02');
INSERT INTO `problem` VALUES ('173', 'AGC电阻R33，根据Mstar的MStar_DTV_Demodulator HW design guideline_V1.2，for Maxliner时应该是4.7k', '3', null, '8a87e29657e4b6d30157e543221f0036', null, 'A', '3', '11020958', 'HD DVB-T2 HEVC', null, '1', '已更改。兼容设计，装板时不装NC', null, '2016-03-21');
INSERT INTO `problem` VALUES ('174', 'R86和R87是22欧？为什么？', '3', null, '8a87e29657e4b6d30157e543221f0036', null, 'B', null, '11020958', 'HD DVB-T2 HEVC', null, '1', 'mstar调试使用，实际装板时候NC不装，已更改。', null, '2016-03-21');
INSERT INTO `problem` VALUES ('175', 'FB这根走线离旁边的电感近了点，建议最好能远点：', '3', null, '8a87e29657e4b6d30157e543221f0036', null, 'B', null, '11020958', 'HD DVB-T2 HEVC', null, '1', '更改', null, '2016-03-21');
INSERT INTO `problem` VALUES ('176', '所有DC-DC的分压电阻桥,请标明1%精度', '3', null, '8a87e29657e4b6d30157e54339a10037', null, 'C', null, '11009145', '2015OTS-3000 GZ', null, '3', '', null, '2015-10-07');
INSERT INTO `problem` VALUES ('177', '铜皮异常', '3', null, '8a87e29657e4b6d30157e54339a10037', null, 'A', '3', '11009145', '2015OTS-3000 GZ', null, '2', '', null, '2015-10-07');
INSERT INTO `problem` VALUES ('178', '建议差分线的参考面连续,且差分线参考面附近避免走线。', '3', null, '8a87e29657e4b6d30157e54339a10037', null, 'C', '3', '11009145', '2015OTS-3000 GZ', null, '1', '', null, '2015-10-07');
INSERT INTO `problem` VALUES ('179', 'MP8761的排版建议优化下: 输出电容的地回路可以缩短,FB取样点应在电容后', '3', null, '8a87e29657e4b6d30157e54522b70038', null, 'B', '3', '11020809', 'BCM33843-CM', null, '1', '已更改', null, '2016-04-07');
INSERT INTO `problem` VALUES ('180', '安全间距不够:', '3', null, '8a87e29657e4b6d30157e54522b70038', null, 'A', null, '11020809', 'BCM33843-CM', null, '2', '', null, '2016-04-07');
INSERT INTO `problem` VALUES ('181', 'FD2\\LB16写清型号', '3', null, '8a87e29657e4b6d30157e545a49f0039', null, 'C', null, '20073800', '2015DVB-C9700 HB', null, '3', '', null, '2015-12-10');
INSERT INTO `problem` VALUES ('182', 'U4 DC-DC请参考标准排版,保证输出电容的回地路径阻抗足够低', '3', null, '8a87e29657e4b6d30157e545a49f0039', null, 'B', null, '20073800', '2015DVB-C9700 HB', null, '1', '', null, '2015-12-10');
INSERT INTO `problem` VALUES ('183', '这部分走线是否与USB插座冲突？且USB信号线背面保护地最好完整,不能与其它线重合。', '3', null, '8a87e29657e4b6d30157e545a49f0039', null, 'B', null, '20073800', '2015DVB-C9700 HB', null, '1', '', null, '2015-12-10');
INSERT INTO `problem` VALUES ('184', '这两颗电容，可以的话，尽量靠近高频头引脚', '3', null, '8a87e29657e4b6d30157e545a49f0039', null, 'B', null, '20073800', '2015DVB-C9700 HB', null, '1', '', null, '2015-12-10');
INSERT INTO `problem` VALUES ('185', 'U6型号？', '3', null, '8a87e29657e4b6d30157e5472cf8003a', null, 'C', null, '11020809', 'Hi3798-3383', null, '3', '', null, '2016-08-05');
INSERT INTO `problem` VALUES ('186', 'U32未标明型号', '3', null, '8a87e29657e4b6d30157e5472cf8003a', null, 'C', null, '11020809', 'Hi3798-3383', null, '3', '', null, '2016-08-05');
INSERT INTO `problem` VALUES ('187', 'R39\\R105不应为0R', '3', null, '8a87e29657e4b6d30157e5472cf8003a', null, 'B', null, '11020809', 'Hi3798-3383', null, '2', '', null, '2016-08-05');
INSERT INTO `problem` VALUES ('188', 'MR52、MR53等应为1%精度', '3', null, '8a87e29657e4b6d30157e5472cf8003a', null, 'C', null, '11020809', 'Hi3798-3383', null, '3', '', null, '2016-08-05');
INSERT INTO `problem` VALUES ('189', 'D2没有标规格型号', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'C', null, '20073800', '2015DVB-C9700 SX', null, '3', '已更改', null, '2015-09-09');
INSERT INTO `problem` VALUES ('190', 'C57/C273/C48/C16等按照规范应标明耐压', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '3', '已更改  还有部分电容没有标或标错耐压', null, '2015-09-09');
INSERT INTO `problem` VALUES ('191', '这个限流电阻是不是有点小?建议确认下:', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '1', '暂时更改为220R,后续根据灯的亮度需求再做调整', null, '2015-09-09');
INSERT INTO `problem` VALUES ('192', '为什么是75R的上拉：', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'A', null, '20073800', '2015DVB-C9700 SX', null, '2', '已更改为4.7K', null, '2015-09-09');
INSERT INTO `problem` VALUES ('193', 'R43\\R314\\R318\\R319应使用1%精度电阻', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '1', '已更改', null, '2015-09-09');
INSERT INTO `problem` VALUES ('194', '这个算是啥意思？', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '1', '已更改如下：', null, '2015-09-09');
INSERT INTO `problem` VALUES ('195', '视频运放供电建议串电阻', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '3', '已更改  LB18这个磁珠可以去掉吧?', null, '2015-09-09');
INSERT INTO `problem` VALUES ('196', '这个分压值在3.3V供电的情况下不对，电压监控最好取电源上串的电阻前面的，因为电阻会有一定的压降。', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'C', null, '20073800', '2015DVB-C9700 SX', null, '1', '已更改', null, '2015-09-09');
INSERT INTO `problem` VALUES ('197', '网口安全间距不够:', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '1', '', null, '2015-09-09');
INSERT INTO `problem` VALUES ('198', '引脚的底层都没连接?为啥?', '3', null, '8a87e29657e4b6d30157e5477b0a003b', null, 'B', null, '20073800', '2015DVB-C9700 SX', null, '2', '', null, '2015-09-09');
INSERT INTO `problem` VALUES ('199', 'C273/C48等应标出耐压', '3', null, '8a87e29657e4b6d30157e54a013e003d', null, 'B', null, '11008199', '2015DVB-C9700 RG', null, '3', '', null, '2015-12-21');
INSERT INTO `problem` VALUES ('200', 'LB4应使用5.1R电阻', '3', null, '8a87e29657e4b6d30157e54a013e003d', null, 'B', null, '11008199', '2015DVB-C9700 RG', null, '1', '', null, '2015-12-21');
INSERT INTO `problem` VALUES ('201', '网口两组差分对间是否间距过近?', '3', null, '8a87e29657e4b6d30157e54a013e003d', null, 'B', null, '11008199', '2015DVB-C9700 RG', null, '1', '', null, '2015-12-21');
INSERT INTO `problem` VALUES ('202', '底层割地较多，建议优化下', '3', null, '8a87e29657e4b6d30157e54a013e003d', null, 'C', null, '11008199', '2015DVB-C9700 RG', null, '1', '', null, '2015-12-21');
INSERT INTO `problem` VALUES ('203', '两个空白页的标签还是Mstar的', '3', null, '8a87e29657e4b6d30157e54b608d003e', null, 'C', null, '11008199', '2015DVB-S2 5000 IRD', null, '3', '', null, '2015-12-14');
INSERT INTO `problem` VALUES ('204', 'M-star最新的APN要求TS流CLK信号PCB走线宽10mil', '3', null, '8a87e29657e4b6d30157e54b608d003e', null, 'B', null, '11008199', '2015DVB-S2 5000 IRD', null, '2', '', null, '2015-12-14');
INSERT INTO `problem` VALUES ('205', 'U32未标明型号', '3', null, '8a87e29657e4b6d30157e54dcd570040', null, 'C', null, '11009145', 'DVBIP-1001', null, '3', '已更改', null, '2016-06-13');
INSERT INTO `problem` VALUES ('206', '原理图和PCB的网络不对应?', '3', null, '8a87e29657e4b6d30157e54dcd570040', null, 'A', null, '11009145', 'DVBIP-1001', null, '3', '海思原始原理图为ORCAD格式，转化为PADS logic有问题。因项目要求急，此次暂用ORCAD导入网表，随后查找原理图转化问题', null, '2016-06-13');
INSERT INTO `problem` VALUES ('207', 'UVP的电压监控,建议取过电阻以前的。', '3', null, '8a87e29657e4b6d30157e54efae50041', null, 'B', '3', '11009145', 'OTS-3000HB', null, '1', '已更改', null, '2016-03-28');
INSERT INTO `problem` VALUES ('208', '这两个有冲突？', '3', null, '8a87e29657e4b6d30157e54efae50041', null, 'A', '3', '11009145', 'OTS-3000HB', null, '1', '已完善', null, '2016-03-28');
INSERT INTO `problem` VALUES ('209', '螺钉孔在电源层上应让开足够的安全间距。', '3', null, '8a87e29657e4b6d30157e54efae50041', null, 'B', '3', '11009145', 'OTS-3000HB', null, '1', '已完善', null, '2016-03-28');
INSERT INTO `problem` VALUES ('210', 'R49/R50为何NC？', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'C', null, '12138029', '2015MR2503C-F', null, '2', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('211', 'R31、R346分压比不对', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'A', null, '12138029', '2015MR2503C-F', null, '2', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('212', '音视频保护元件不在输入插座附近', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'A', null, '12138029', '2015MR2503C-F', null, '2', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('213', '音频运放EN脚没有与主芯片GPIO相连？', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'A', null, '12138029', '2015MR2503C-F', null, '1', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('214', 'R6需要使用5.1R', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'A', null, '12138029', '2015MR2503C-F', null, '1', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('215', '建议调整下R94的位置，T型分叉越小越好。', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'C', null, '12138029', '2015MR2503C-F', null, '1', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('216', '12V_MK、CM_5V电源网络上的过孔太小', '3', null, '8a87e29657e4b6d30157e54f93a70042', null, 'A', null, '12138029', '2015MR2503C-F', null, '1', '', null, '2015-12-31');
INSERT INTO `problem` VALUES ('217', '5V0_MOS_HDMI和其它5V网络没连接?', '3', null, '8a87e29657e4b6d30157e550bf160043', null, 'A', null, '11009145', 'OTS-3000 SZ', null, '2', '', null, '2016-04-07');
INSERT INTO `problem` VALUES ('218', '电源层上,走线穿过wifi天线下', '3', null, '8a87e29657e4b6d30157e55275de0044', null, 'A', '3', '11009145', 'DVB-S2 H239NZ PVR', null, '2', '该线绕行', null, '2016-02-18');
INSERT INTO `problem` VALUES ('219', '接地焊盘是否floor over比较好？', '3', null, '8a87e29657e4b6d30157e55275de0044', null, 'C', '3', '11009145', 'DVB-S2 H239NZ PVR', null, '1', '已更改', null, '2016-02-18');
INSERT INTO `problem` VALUES ('220', '这个是用IO口直接驱动LED么?驱动能力是否够？', '3', null, '8a87e29657e4b6d30157e55425a20045', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '1', 'LED目前点亮时候的电流小于2mA，此IO口驱动电流是5mA', null, '2015-10-26');
INSERT INTO `problem` VALUES ('221', '串R221这个电阻，会不会导致卡VCC电压过低，或纹波过大？', '3', null, '8a87e29657e4b6d30157e55425a20045', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '1', '使用川网同方卡实测电流只有5mA不到，压降0.035V', null, '2015-10-26');
INSERT INTO `problem` VALUES ('222', 'T4、DD1型号不正确', '3', null, '8a87e29657e4b6d30157e55425a20045', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '2', '已修改', null, '2015-10-26');
INSERT INTO `problem` VALUES ('223', 'CP2、CP9、CP16、CP17等使用22U25V0805，这个我们不常用', '3', null, '8a87e29657e4b6d30157e55425a20045', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '2', 'BOM使用的是22u6.3V0805', null, '2015-10-26');
INSERT INTO `problem` VALUES ('224', '定位点上有丝印', '3', null, '8a87e29657e4b6d30157e55425a20045', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '2', '这个PCB加工都不会漏印在MARK点上的', null, '2015-10-26');
INSERT INTO `problem` VALUES ('225', 'LT17不能NC', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'A', null, '11008845', 'CH-6000M', null, '1', '更新原理图及BOM', null, '2016-04-01');
INSERT INTO `problem` VALUES ('226', 'R289/R290应使用1%精度电阻', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'C', null, '11008845', 'CH-6000M', null, '3', '更新原理图', null, '2016-04-01');
INSERT INTO `problem` VALUES ('227', '音频UVP分压点比较临界', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'B', null, '11008845', 'CH-6000M', null, '1', '更新原理图', null, '2016-04-01');
INSERT INTO `problem` VALUES ('228', 'C175/C181/C178等应标示出电容耐压', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'C', null, '11008845', 'CH-6000M', null, '3', '更新原理图', null, '2016-04-01');
INSERT INTO `problem` VALUES ('229', '请优化DC-DC的排板:', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'B', null, '11008845', 'CH-6000M', null, '1', '优化排版', null, '2016-04-01');
INSERT INTO `problem` VALUES ('230', 'smart card的VCC\\Reset\\CLK\\IO等引脚附近应有电容', '3', null, '8a87e29657e4b6d30157e57f40970048', null, 'B', null, '11008845', 'CH-6000M', null, '1', '优化排版', null, '2016-04-01');
INSERT INTO `problem` VALUES ('231', '所有原理图页的不标题框不对', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'B', null, '11021950', '2015DVB-C8000H SCL', null, '3', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('232', 'DD1、FD1型号不正确', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'C', null, '11021950', '2015DVB-C8000H SCL', null, '3', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('233', 'ECD1无耐压标注', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'B', null, '11021950', '2015DVB-C8000H SCL', null, '3', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('234', 'CP2、CP9这种22U25V0805的规格不常用', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'C', null, '11021950', '2015DVB-C8000H SCL', null, '3', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('235', 'U2无规格型号标注', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'C', null, '11021950', '2015DVB-C8000H SCL', null, '3', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('236', '根据最新的MStar_DTV_Demodulator HW design guideline_V1.1，I2C需串100R电阻，且AGC电路部分值与推荐不符，请与Mstar确认', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'A', null, '11021950', '2015DVB-C8000H SCL', null, '1', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('237', '这部分线建议走底层，不要切割输入电容的回地路径', '3', null, '8a87e29657e4b6d30157e5aae7090049', null, 'B', null, '11021950', '2015DVB-C8000H SCL', null, '1', '已修改', null, '2015-12-10');
INSERT INTO `problem` VALUES ('238', 'L3、L4、L37、C4等无型号', '3', null, '8a87e29657e4b6d30157e5af1cb4004a', null, 'C', null, '11008845', 'MSO9380AK', null, '3', '已增加', null, '2016-09-22');
INSERT INTO `problem` VALUES ('239', '5V的负载不重，作为音频运放的UVP监控电压是否合适？', '3', null, '8a87e29657e4b6d30157e5af1cb4004a', null, 'B', null, '11008845', 'MSO9380AK', null, '1', '改为3.3V', null, '2016-09-22');
INSERT INTO `problem` VALUES ('240', 'U24、Y1没有型号', '3', null, '8a87e29657e4b6d30157e5b1b2c2004b', null, 'C', null, '11008199', 'CCX0331', null, '3', '完善原理图', null, '2016-03-31');
INSERT INTO `problem` VALUES ('241', 'L4A、L7等的型号标示561不合符规范', '3', null, '8a87e29657e4b6d30157e5b1b2c2004b', null, 'C', null, '11008199', 'CCX0331', null, '3', '完善原理图', null, '2016-03-31');
INSERT INTO `problem` VALUES ('242', '为什么保险丝\\二极管\\电容都在开关前面?', '3', null, '8a87e29657e4b6d30157e5b92e1d004c', null, 'A', null, '11008199', 'IHO-3000E', null, '1', '更改，保险丝开关之前，二极管\\电容开关之后', null, '2016-04-29');
INSERT INTO `problem` VALUES ('243', '为什么要用SGM2021而不用标准化的SGM2032', '3', null, '8a87e29657e4b6d30157e5b92e1d004c', null, 'C', null, '11008199', 'IHO-3000E', null, '3', '更改为SGM2032', null, '2016-04-29');
INSERT INTO `problem` VALUES ('244', 'R1243不建议装0R', '3', null, '8a87e29657e4b6d30157e5b92e1d004c', null, 'B', null, '11008199', 'IHO-3000E', null, '1', '改为10欧姆电阻，并进行音频指标测试', null, '2016-04-29');
INSERT INTO `problem` VALUES ('245', 'R1244/R1245没有值', '3', null, '8a87e29657e4b6d30157e5b92e1d004c', null, 'C', null, '11008199', 'IHO-3000E', null, '2', '完善原理图', null, '2016-04-29');
INSERT INTO `problem` VALUES ('246', 'DD1没有型号', '3', null, '8a87e29657e4b6d30157e5c9133d004d', null, 'C', null, '20155707', '2015EP-3000', null, '3', '', null, '2015-02-28');
INSERT INTO `problem` VALUES ('247', 'ZR10,原理图PCB不对应', '3', null, '8a87e29657e4b6d30157e5c9133d004d', null, 'A', null, '20155707', '2015EP-3000', null, '3', '', null, '2015-02-28');
INSERT INTO `problem` VALUES ('248', '检查此部分顶层线路是否会和器件冲突?', '3', null, '8a87e29657e4b6d30157e5c9133d004d', null, 'A', null, '20155707', '2015EP-3000', null, '1', '', null, '2015-02-28');
INSERT INTO `problem` VALUES ('249', '两网络未连接及多余铜皮', '3', null, '8a87e29657e4b6d30157e5c9133d004d', null, 'A', null, '20155707', '2015EP-3000', null, '1', '', null, '2015-02-28');
INSERT INTO `problem` VALUES ('250', 'CP25、CP34这些电容按照规范应该加耐压标注', '3', null, '8a87e29657e4b6d30157e5cbb85f004e', null, 'B', null, '11022719', '2015CH-8600M', null, '3', '', null, '2015-11-19');
INSERT INTO `problem` VALUES ('251', 'RP306不应该NC吧?', '3', null, '8a87e29657e4b6d30157e5ce1268004f', null, 'B', null, '11022719', '2015MSD5C37', null, '2', '', null, '2015-10-19');
INSERT INTO `problem` VALUES ('252', 'UP101\\UP201没有规格型号', '3', null, '8a87e29657e4b6d30157e5ce1268004f', null, 'C', null, '11022719', '2015MSD5C37', null, '3', '', null, '2015-10-19');
INSERT INTO `problem` VALUES ('253', 'RP107没有规格型号,另外,为什么用下拉?', '3', null, '8a87e29657e4b6d30157e5ce1268004f', null, 'C', null, '11022719', '2015MSD5C37', null, '3', '', null, '2015-10-19');
INSERT INTO `problem` VALUES ('254', 'PH3可恢复保险丝只能过一遍回流焊炉，请确认贴背面是否正确？', '3', null, '8a87e29657e4b6d30157e5d59e810050', null, 'A', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '1', '', null, '2015-11-09');
INSERT INTO `problem` VALUES ('255', '5V供电的话，音频DA的EN脚要加电平转换，否则有可能高电平比较临界', '3', null, '8a87e29657e4b6d30157e5d59e810050', null, 'A', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '1', '', null, '2015-11-09');
INSERT INTO `problem` VALUES ('256', '视频直接输出的指标能过？', '3', null, '8a87e29657e4b6d30157e5d59e810050', null, 'C', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '3', '', null, '2015-11-09');
INSERT INTO `problem` VALUES ('257', '从保护效果的角度看，视频的保护应放在视频走线的路径上。尤其是没有运放做缓冲的情况下。', '3', null, '8a87e29657e4b6d30157e5d59e810050', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '1', '', null, '2015-11-09');
INSERT INTO `problem` VALUES ('258', '保护间隔不够：', '3', null, '8a87e29657e4b6d30157e5d59e810050', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '1', '', null, '2015-11-09');
INSERT INTO `problem` VALUES ('271', 'R404、R405标明1%精度', '3', null, '8a87e29657e4b6d30157e5e244670053', null, 'B', null, '20155707', 'EPON41WIFI', null, '1', 'OK,已改', null, '2015-11-20');
INSERT INTO `problem` VALUES ('272', 'CP6 22U25V0805 我们一般没有用这个规格，一般是10u/16V', '3', null, '8a87e29657e4b6d30157e5e244670053', null, 'B', null, '20155707', 'EPON41WIFI', null, '1', 'OK,已改', null, '2015-11-20');
INSERT INTO `problem` VALUES ('273', 'CP40、CP49按规定应标出耐压', '3', null, '8a87e29657e4b6d30157e5e244670053', null, 'B', null, '20155707', 'EPON41WIFI', null, '3', 'OK,已改，CP40耐压6.3V,CP19为10V', null, '2015-11-20');
INSERT INTO `problem` VALUES ('274', '这是啥意思？', '3', null, '8a87e29657e4b6d30157e5e244670053', null, 'A', null, '20155707', 'EPON41WIFI', null, '2', '此为接地，地掉了，已改。', null, '2015-11-20');
INSERT INTO `problem` VALUES ('275', '印象中C4这个电容应该是比较关键的,在使用X5R材质的基础上,建议放两个', '3', null, '8a87e29657f437cf0157f490fea60000', null, 'A', null, '11008845', '捷克高清DVB-S2 9100A', null, '1', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('276', 'FB3、FB23缺少型号', '3', null, '8a87e29657f437cf0157f490fea60000', null, 'B', null, '11008845', '捷克高清DVB-S2 9100A', null, '2', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('277', '12V适配器输入,更具标准电路请加上防反向二极管', '3', null, '8a87e29657f437cf0157f490fea60000', null, 'B', null, '11008845', '捷克高清DVB-S2 9100A', null, '3', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('278', 'LNB的升压电路,建议按照参考排下:', '3', null, '8a87e29657f437cf0157f490fea60000', null, 'B', null, '11008845', '捷克高清DVB-S2 9100A', null, '1', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('279', 'Y1001,不允许再使用5032封装的晶振,必须3225封装', '3', null, '8a87e29657f437cf0157f490fea60000', null, 'A', null, '11008845', '捷克高清DVB-S2 9100A', null, '3', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('280', '所有DC-DC的FB电阻,请标出1%精度', '3', null, '8a87e29657f437cf0157f493e0770001', null, 'B', null, '11008845', '2015HD3601', null, '3', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('281', '这个电阻是不是有点大?请确认下,一般10-20R差不多了', '3', null, '8a87e29657f437cf0157f493e0770001', null, 'A', null, '11008845', '2015HD3601', null, '1', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('282', 'RM25/RM26用1%精度', '3', null, '8a87e29657f437cf0157f493e0770001', null, 'B', null, '11008845', '2015HD3601', null, '3', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('283', '这两个是MPS1470么？如果是的话，请对方参考我们的标准化排法：\n', '3', null, '8a87e29657f437cf0157f493e0770001', null, 'B', null, '11008845', '2015HD3601', null, '3', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('284', 'CVBS的地保护走线建议不要断', '3', null, '8a87e29657f437cf0157f493e0770001', null, 'B', null, '11008845', '2015HD3601', null, '1', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('285', '电阻R164需要安装，否则HDMI没有输出', '3', null, '8a87e29657f437cf0157f4991a1a0002', null, 'A', null, '11008845', '2015RK3128', null, '1', '', null, '2015-03-12');
INSERT INTO `problem` VALUES ('286', 'U12,输出电容建议调整下，减少地回路。\n', '3', null, '8a87e29657f437cf0157f4991a1a0002', null, 'B', null, '11008845', '2015RK3128', null, '1', '', null, '2015-03-12');
INSERT INTO `problem` VALUES ('287', '去藕电容需要的排版要求没有做到：', '3', null, '8a87e29657f437cf0157f4991a1a0002', null, 'A', null, '11008845', '2015RK3128', null, '1', '', null, '2015-03-12');
INSERT INTO `problem` VALUES ('288', '底层的USB走线，以电源层作为参考，请尽量保证走线下的电源层完整，不要分割', '3', null, '8a87e29657f437cf0157f4991a1a0002', null, 'B', null, '11008845', '2015RK3128', null, '1', '', null, '2015-03-12');
INSERT INTO `problem` VALUES ('289', '原理图和PCB不对应?原理图没有L11', '3', null, '8a87e29657f437cf0157f49c26620003', null, 'A', null, '11008845', '2015CH-INPLUTO', null, '2', '', null, '2015-07-10');
INSERT INTO `problem` VALUES ('290', 'R40\\R51\\R75\\R80规格没有加单位', '3', null, '8a87e29657f437cf0157f4a285290004', null, 'C', null, '11008845', '2015SD DVB-S2 8500 ID', null, '3', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('291', '电源分配图上前面板标示为5V供电,实际为3.3V', '3', null, '8a87e29657f437cf0157f4a285290004', null, 'C', null, '11008845', '2015SD DVB-S2 8500 ID', null, '2', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('292', '原理图的页标签没改,还是M-star的', '3', null, '8a87e29657f437cf0157f4a285290004', null, 'C', null, '11008845', '2015SD DVB-S2 8500 ID', null, '3', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('293', 'U3没有标型号', '3', null, '8a87e29657f437cf0157f4a285290004', null, 'C', null, '11008845', '2015SD DVB-S2 8500 ID', null, '2', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('300', 'CP2\\CP3\\C22\\C25\\C38\\C50等未按照原理图标准标出耐压', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'B', null, '20152714', '2015IHO-3000', null, '3', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('301', 'LB12\\Q1未标规格型号', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'B', null, '20152714', '2015IHO-3000', null, '2', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('302', '这部分RF走线是否符合阻抗要求?', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'B', null, '20152714', '2015IHO-3000', null, '1', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('303', '部分DC-DC的FB网络，是在中间层相连的，还是建议在顶层相连：', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'B', null, '20152714', '2015IHO-3000', null, '1', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('304', '这部分建议还是优化下，SW的路径及回地路径建议短一点：', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'C', null, '20152714', '2015IHO-3000', null, '1', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('305', '底层没有Mark点', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'A', null, '20152714', '2015IHO-3000', null, '2', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('306', 'F1 PTC保险丝，建议放在正面，否则会过两次回流焊', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'A', null, '20152714', '2015IHO-3000', null, '1', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('307', '建议仔细检查下电源层上的过孔，可能会割掉电源层', '3', null, '8a87e29657e4b6d30157e537166f002a', null, 'C', null, '20152714', '2015IHO-3000', null, '1', '', null, '2015-08-21');
INSERT INTO `problem` VALUES ('308', 'R71的意义是啥?', '3', null, '8a87e29657f437cf0157f4b46aa80005', null, 'B', null, '20152714', '2015SDG6800LN-HD03', null, '1', '', null, '2015-04-28');
INSERT INTO `problem` VALUES ('309', '此处射频线与地的间距,是否符合要求?', '3', null, '8a87e29657f437cf0157f4b46aa80005', null, 'A', null, '20152714', '2015SDG6800LN-HD03', null, '1', '', null, '2015-04-28');
INSERT INTO `problem` VALUES ('310', '12V电源输入没有加防反向二极管', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'B', null, '20152714', '2015ISDB-T 7542G', null, '3', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('311', '所有应用建议不再用Y5V材质的电容', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '1', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('312', 'C41\\Cp17\\CP18等按照原理图规范,需要标明耐压', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '3', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('313', 'FB13按照标准化模块电路,应使用电阻', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '3', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('314', 'R145太大，压降大，对于没有红外延长输出口的设计，不建议串很大的电阻', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '1', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('315', '顶层走线尽量离远点', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '1', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('316', 'D5\\D6\\D7等不是标准封装', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '3', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('317', 'DC-DC的排版回地环路大，请严格按照推荐排版', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'A', null, '20152714', '2015ISDB-T 7542G', null, '1', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('318', '高速走线建议保持背面地的完整性，尽量不要割地，建议优化下：', '3', null, '8a87e29657f437cf0157f4b805450006', null, 'B', null, '20152714', '2015ISDB-T 7542G', null, '1', '', null, '2015-08-03');
INSERT INTO `problem` VALUES ('319', '各输入、输出接口，建议自己考虑下保护是否全面，如调制板的RF输出，现有放电管及ESD，考虑下是否增加对浪涌的防护', '3', null, '8a87e29657f437cf0157f52babb70007', null, 'A', null, '20059616', '2015ccxtelblock', null, '1', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('320', 'ALC芯片的供电串220R电阻，请确认正常', '3', null, '8a87e29657f437cf0157f52babb70007', null, 'B', null, '20059616', '2015ccxtelblock', null, '1', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('321', 'C37/C70/C51等电容，请按照原理图规范增加耐压标识', '3', null, '8a87e29657f437cf0157f52babb70007', null, 'A', null, '20059616', '2015ccxtelblock', null, '3', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('322', '顶层走线,注意下是否会和插座冲突造成短路:', '3', null, '8a87e29657f437cf0157f52babb70007', null, 'B', null, '20059616', '2015ccxtelblock', null, '1', '', null, '2015-06-08');
INSERT INTO `problem` VALUES ('323', 'R1508、R1509请标明1%精度', '3', null, '8a87e29657f437cf0157f53340d10008', null, 'B', null, '20059616', '2015WWIO DVB-C', null, '3', '已修改', null, '2015-03-19');
INSERT INTO `problem` VALUES ('324', 'UP1请用MP1471A', '3', null, '8a87e29657f437cf0157f53340d10008', null, 'B', null, '20059616', '2015WWIO DVB-C', null, '3', '已修改', null, '2015-03-19');
INSERT INTO `problem` VALUES ('325', 'Y1001请改成3225封装,5032封装后续不再使用', '3', null, '8a87e29657f437cf0157f53340d10008', null, 'A', null, '20059616', '2015WWIO DVB-C', null, '3', '已修改', null, '2015-03-19');
INSERT INTO `problem` VALUES ('326', '电容及芯片的地脚,建议铺地时floor over,否则可能有很大的造成回地路径不畅,几个DC-DC都存在同样的问题。', '3', null, '8a87e29657f437cf0157f53340d10008', null, 'A', null, '20059616', '2015WWIO DVB-C', null, '2', '已修改', null, '2015-03-19');
INSERT INTO `problem` VALUES ('327', '保护的部分，接地最好用floor over：', '3', null, '8a87e29657f437cf0157f53340d10008', null, 'B', null, '20059616', '2015WWIO DVB-C', null, '2', '已修改', null, '2015-03-19');
INSERT INTO `problem` VALUES ('328', 'D22的限流电阻R105 只有100R，是不是有点小？建议确认下。', '3', null, '8a87e29657f437cf0157f5375e2c0009', null, 'B', '3', '20059616', '2015H273', null, '1', '已修改为330R', null, '2015-03-02');
INSERT INTO `problem` VALUES ('329', '左右音频线太近，影响串音指标\n', '3', null, '8a87e29657f437cf0157f5375e2c0009', null, 'B', '2', '20059616', '2015H273', null, '1', '根据此芯片之前的测试结果，串音没有太大影响，同时排版空间有限制，此版暂不改，等样板测试结果再看。', null, '2015-03-02');
INSERT INTO `problem` VALUES ('330', '保护器件应就近加地孔：', '3', null, '8a87e29657f437cf0157f5375e2c0009', null, 'C', '3', '20059616', '2015H273', null, '1', '', null, '2015-03-02');
INSERT INTO `problem` VALUES ('331', '按键开关下的顶层走线，是否与按键支脚之间有短路风险？', '3', null, '8a87e29657f437cf0157f5375e2c0009', null, 'B', '3', '20059616', '2015H273', null, '1', '', null, '2015-03-02');
INSERT INTO `problem` VALUES ('332', 'U3的型号错误,应为可调版本', '3', null, '8a87e29657f437cf0157f53e2be7000a', null, 'A', null, '20059616', '2015HD DVB-C 273MOV', null, '2', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('333', 'J9不是标准化的插座', '3', null, '8a87e29657f437cf0157f53e2be7000a', null, 'B', null, '20059616', '2015HD DVB-C 273MOV', null, '3', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('334', '左右声道之间,请加地隔离,并预留足够的空间。', '3', null, '8a87e29657f437cf0157f53e2be7000a', null, 'A', null, '20059616', '2015HD DVB-C 273MOV', null, '1', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('335', '注意看下按键实物，是否有与顶层印制线短路嫌疑', '3', null, '8a87e29657f437cf0157f53e2be7000a', null, 'B', null, '20059616', '2015HD DVB-C 273MOV', null, '1', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('336', '印度市场的DVB-C，需要在高频头输入增加额外的电感，提高抗浪涌等级。具体可以咨询樊为华', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'A', null, '14000635', '2015CH-INPLUTO-HD', null, '1', '稍后增加', null, '2015-07-16');
INSERT INTO `problem` VALUES ('337', '原来Mstar发过更新，基于Dobby原因，要求HDMI CEC上串的200R电阻不能去掉，建议找原厂确认下你这个要不要处理。', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'A', null, '14000635', '2015CH-INPLUTO-HD', null, '3', '确认要串，已修改', null, '2015-07-16');
INSERT INTO `problem` VALUES ('338', 'SY6883的排版,要求输入电容和输出电容的地环路尽可能的小,目前的排版不符合要求,建议改掉,请找Torch审核下。\n下面这个排版是樊为华的，可以作为参考：\n\n\n\n\n\n\n\n\n\n\n\n\n\n', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'A', null, '14000635', '2015CH-INPLUTO-HD', null, '1', '已修改', null, '2015-07-16');
INSERT INTO `problem` VALUES ('339', '顶层走线注意短路风险：', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'A', null, '14000635', '2015CH-INPLUTO-HD', null, '1', '已修改', null, '2015-07-16');
INSERT INTO `problem` VALUES ('340', '左右声道太近，没有地隔离，可能会影响串音指标', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'A', null, '14000635', '2015CH-INPLUTO-HD', null, '1', '指标测试过，没有影响，所以不修改', null, '2015-07-16');
INSERT INTO `problem` VALUES ('341', 'FB这根线这么绕有点长：', '3', null, '8a87e29657f437cf0157f5427cbb000b', null, 'B', null, '14000635', '2015CH-INPLUTO-HD', null, '1', '已修改', null, '2015-07-16');
INSERT INTO `problem` VALUES ('342', 'MPS的1470系列的最低工作电压只有4.5V左右,用5V供电比较危险,建议所有DC-DC直接从12V取电', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'B', '3', '11009145', '2015Hi3796M', null, '1', '已全部改为12V供电', null, '2015-03-13');
INSERT INTO `problem` VALUES ('343', '红圈处连接有问题:', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'A', '3', '11009145', '2015Hi3796M', null, '2', '已更改', null, '2015-03-13');
INSERT INTO `problem` VALUES ('344', '作为红外头电源的限流电阻,560R太大,压降是比较大的,尤其是在3.3V的情况下\n', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'A', '3', '11009145', '2015Hi3796M', null, '1', '已更改', null, '2015-03-13');
INSERT INTO `problem` VALUES ('345', '底层USB信号走线的参考层是电源层,建议不要分割电源层下的平面:', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'B', '3', '11009145', '2015Hi3796M', null, '1', '已更改', null, '2015-03-13');
INSERT INTO `problem` VALUES ('346', 'I2C的走线,建议中间最好能夹地,或者分开点,根据实际经验容易造成波形上有过冲。', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'B', '5', '11009145', '2015Hi3796M', null, '1', '参照海思参考设计（按差分方式走线）', null, '2015-03-13');
INSERT INTO `problem` VALUES ('347', '网口安全间距不对。', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'A', '3', '11009145', '2015Hi3796M', null, '2', '已更改', null, '2015-03-13');
INSERT INTO `problem` VALUES ('348', '建议地层作为USB信号的参考层，覆盖全:', '3', null, '8a87e29657f437cf0157f54b7f1a000c', null, 'B', null, '11009145', '2015Hi3796M', null, '1', '', null, '2015-03-13');
INSERT INTO `problem` VALUES ('349', 'R76、R77电压采集脚电阻，最好使用高精度的', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'B', null, '20073800', '2015ccxtelblock', null, '3', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('350', 'U5型号未标出', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'B', null, '20073800', '2015ccxtelblock', null, '2', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('351', '工程机的端口，需要增加足够的保护器件', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('352', '接收板中,针对模拟信号,应做好地的保护。最好保证走线两侧及底层的地完整。如音频信号VA，两侧不应有时钟及电源等', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('353', 'RF信号，地保护，远离模拟信号，且不要与另一层的走线有平行的部分。', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('354', 'SW脚太长，建议按照参考布线走', '3', null, '8a87e29657f437cf0157f552d7d8000d', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-06');
INSERT INTO `problem` VALUES ('355', '所有DC-DC的反馈电阻，应为1%精度', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'B', null, '20073800', '2015ccxtelblock', null, '3', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('356', 'R38/R41阻值太大，LED可能会比较暗', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'B', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('357', '这个网络是干嘛的？', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'A', null, '20073800', '2015ccxtelblock', null, '2', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('358', '作为工程机，射频输入部分是否有足够的保护？如ESD、EOS、防雷等，请充分考虑。所有对外端口，请仔细考虑防护。', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('359', '这个电路是做什么用的？基极上没有限流电阻？', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('360', '集电极没限流电阻，请确认下是否正常？', '3', null, '8a87e29657f437cf0157f557e63b000e', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-06-17');
INSERT INTO `problem` VALUES ('361', '12V工作电电压的电容,耐压建议用25V的。', '3', null, '8a87e29657f437cf0157f55a2b76000f', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-10');
INSERT INTO `problem` VALUES ('362', 'MP1484的排版建议参考下面:', '3', null, '8a87e29657f437cf0157f55a2b76000f', null, 'A', null, '20073800', '2015ccxtelblock', null, '1', '', null, '2015-07-10');
INSERT INTO `problem` VALUES ('363', 'LB2/LB4等磁珠,以及D2没有标明型号', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '2', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('364', 'C440等按照原理图规范应标明耐压', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '3', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('365', 'R319/R43/R314/R318需要使用1%精度电阻', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '1', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('366', 'R79不应为0R', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'A', null, '11021933', '2015DVB-C8000BGA SXE', null, '1', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('367', '音频运放电源的选择是3.3V的，但使用8903，是否有必要？另，如果是3.3V供电，则R346和R31的分压值不合适', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'A', null, '11021933', '2015DVB-C8000BGA SXE', null, '1', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('368', '接地点与地层连接太少', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'A', null, '11021933', '2015DVB-C8000BGA SXE', null, '1', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('369', '主板边缘没有mark点', '3', null, '8a87e29657f437cf0157f575bf420010', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '2', '', null, '2015-07-02');
INSERT INTO `problem` VALUES ('370', '所有电路图页没有title', '3', null, '8a87e29657f437cf0157f577d2a70011', null, 'C', null, '11021933', '2015DVB-C8000BGA SXE', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('371', 'R224/R225/R226/R227应标出1%精度', '3', null, '8a87e29657f437cf0157f577d2a70011', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('372', 'R518应标出1%精度', '3', null, '8a87e29657f437cf0157f577d2a70011', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('373', 'C31需要标出耐压', '3', null, '8a87e29657f437cf0157f577d2a70011', null, 'B', null, '11021933', '2015DVB-C8000BGA SXE', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('374', '印度市场环境恶劣，这个电阻应该加上：', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'B', null, '11021933', '2015DVB-S5000MD', null, '3', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('375', 'C62/C76 100nF，使用50V耐压，必须在原理图中明确标出', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'A', null, '11021933', '2015DVB-S5000MD', null, '3', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('376', '部分电源线太细,建议加粗,如:+3_3V_NORMAL、+3_3V_STANDBY等\n', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'B', null, '11021933', '2015DVB-S5000MD', null, '1', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('377', 'DC-DC离视频插座较近，请注意干扰风险：', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'A', null, '11021933', '2015DVB-S5000MD', null, '1', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('378', 'DC-DC的排版可以优化下，输出电容回地环路过长', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'B', null, '11021933', '2015DVB-S5000MD', null, '1', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('379', '这部分顶层走线是否会和按键冲突造成短路隐患？建议找实物确认下。', '3', null, '8a87e29657f437cf0157f57c9f4c0012', null, 'B', null, '11021933', '2015DVB-S5000MD', null, '1', '', null, '2015-03-11');
INSERT INTO `problem` VALUES ('380', 'PL1推荐用2.2uH', '3', null, '8a87e29657f437cf0157f5805aae0013', null, 'B', null, '11021933', '2015MR2503C', null, '3', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('381', 'R55\\R42\\R224\\R225\\R226\\R227请标明1%精度', '3', null, '8a87e29657f437cf0157f5805aae0013', null, 'C', null, '11021933', '2015MR2503C', null, '3', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('382', '原理上不推荐这种3V3_MOS到VDD33O再到AVDD33O的路径,建议直接3V3_MOS分到VDD33O和AVDD33O', '3', null, '8a87e29657f437cf0157f5805aae0013', null, 'B', null, '11021933', '2015MR2503C', null, '1', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('383', 'T2的中心抽头供电建议加磁珠,要求200mA以上电流:', '3', null, '8a87e29657f437cf0157f5805aae0013', null, 'B', null, '11021933', '2015MR2503C', null, '1', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('384', 'AV插座的屏蔽壳有与顶层线路短路的风险，建议走底层：\n', '3', null, '8a87e29657f437cf0157f5805aae0013', null, 'A', null, '11021933', '2015MR2503C', null, '1', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('385', '通常809有输出有下拉的考虑，本设计是上拉，是否有其它原因？', '3', null, '8a87e29657f437cf0157f58243480014', null, 'B', null, '11008199', '2015DVB-S2 7200', null, '1', '改为100K下拉', null, '2015-10-27');
INSERT INTO `problem` VALUES ('386', 'LP13，根据推荐电路，建议用2.2uH的', '3', null, '8a87e29657f437cf0157f58243480014', null, 'C', null, '11008199', '2015DVB-S2 7200', null, '1', '改为2.2uH', null, '2015-10-27');
INSERT INTO `problem` VALUES ('387', 'U5、U12没有写型号，是否标准化推荐？', '3', null, '8a87e29657f437cf0157f58243480014', null, 'C', null, '11008199', '2015DVB-S2 7200', null, '3', '标准电路U5=SGM8900 ,U12=TPS61175', null, '2015-10-27');
INSERT INTO `problem` VALUES ('388', '这两个网络需不需要地保护？', '3', null, '8a87e29657f437cf0157f58243480014', null, 'C', null, '11008199', '2015DVB-S2 7200', null, '1', '完善PCB', null, '2015-10-27');
INSERT INTO `problem` VALUES ('389', '过孔是不是离的有点近？', '3', null, '8a87e29657f437cf0157f58243480014', null, 'B', null, '11008199', '2015DVB-S2 7200', null, '1', '完善PCB', null, '2015-10-27');
INSERT INTO `problem` VALUES ('390', '整板没有看到mark点', '3', null, '8a87e29657f437cf0157f58243480014', null, 'B', null, '11008199', '2015DVB-S2 7200', null, '2', '完善PCB', null, '2015-10-27');
INSERT INTO `problem` VALUES ('391', '原理图每页的标签还是9140的', '3', null, '8a87e29657f437cf0157f585f6620015', null, 'C', null, '11008199', '2015EVO ENFINITY', null, '3', '完善原理图', null, '2015-07-02');
INSERT INTO `problem` VALUES ('392', 'Y1001,严禁使用5032封装的晶振', '3', null, '8a87e29657f437cf0157f585f6620015', null, 'A', null, '11008199', '2015EVO ENFINITY', null, '3', '更改为3225封装', null, '2015-07-02');
INSERT INTO `problem` VALUES ('393', 'R1509为啥NC?', '3', null, '8a87e29657f437cf0157f585f6620015', null, 'B', null, '11008199', '2015EVO ENFINITY', null, '2', '未装U1502(SGM2032),取消反馈电阻R1509，R1508，完善原理图', null, '2015-07-02');
INSERT INTO `problem` VALUES ('394', 'DC12V输入的接地部分,建议Floor over:', '3', null, '8a87e29657f437cf0157f585f6620015', null, 'A', null, '11008199', '2015EVO ENFINITY', null, '2', '完善PCB', null, '2015-07-02');
INSERT INTO `problem` VALUES ('395', '12V输入的印制线太细:', '3', null, '8a87e29657f437cf0157f585f6620015', null, 'A', null, '11008199', '2015EVO ENFINITY', null, '2', '完善PCB', null, '2015-07-02');
INSERT INTO `problem` VALUES ('396', '我们用的22uF电容没有12V以上耐压的,EC15建议更改为两个10uF电容,并标明耐压值', '3', null, '8a87e29657f437cf0157f5888ec30016', null, 'A', null, '11008199', '2015MSD5029', null, '1', '', null, '2015-08-05');
INSERT INTO `problem` VALUES ('397', '5V输出应该从电容上引,而不是电感上:', '3', null, '8a87e29657f437cf0157f5888ec30016', null, 'B', null, '11008199', '2015MSD5029', null, '1', '', null, '2015-08-05');
INSERT INTO `problem` VALUES ('398', '板背面的割地比较严重,建议优化下,尽量少在背面走长线', '3', null, '8a87e29657f437cf0157f5888ec30016', null, 'A', null, '11008199', '2015MSD5029', null, '1', '', null, '2015-08-05');
INSERT INTO `problem` VALUES ('399', '修改历史为乱码', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'C', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('400', '电源分配页框图与实际不符', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '2', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('401', 'U29的型号是啥?不是标准化型号吧?', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('402', 'CON1串口非标准化排序方式', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('403', '原理图是否和PCB完全对应? R282有冲突?', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('404', 'U3是否标准化推荐型号?', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('405', 'R249/R181分压电阻设置不合理', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('406', '使用5V供电的话,U3的EN脚必须能达到5V才能保证有效，如果I/O口只能到3.3V左右的话，建议加三级管', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('407', 'T2型号不对', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '2', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('408', '整个原理图中没有按照规范增加title', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('409', 'L23请使用推荐值，应该是2.2uH', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('410', 'u14不是标准化器件', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '3', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('411', 'R260、C134是否应靠近解调放置？', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('412', '网口安全间距不够', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('413', 'DC-DC的输出电容环路请尽可能的短', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'A', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('414', 'DC-DC的输入电容环路也请尽可能短，同时电容位置应尽量靠近输入脚。', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '1', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('415', 'mark点上有丝印', '3', null, '8a87e29657f437cf0157f58e5d440017', null, 'B', null, '12138029', '2015DVB-C8100H AH', null, '2', '', null, '2015-05-19');
INSERT INTO `problem` VALUES ('416', 'U26、U38的型号是啥？', '3', null, '8a87e29657f437cf0157f590e3dd0018', null, 'A', null, '12138029', '2015OTS-2000HB', null, '3', '', null, '2015-03-02');
INSERT INTO `problem` VALUES ('417', '建议Tuner的每个电源引脚,都加一个去藕电容', '3', null, '8a87e29657f437cf0157f590e3dd0018', null, 'B', null, '12138029', '2015OTS-2000HB', null, '1', '', null, '2015-03-02');
INSERT INTO `problem` VALUES ('418', '这部分的底层走线,对双层板的地割的太多,影响DC电源进口处的回流,建议改下,能不走在背面的线尽量不要走在背面。', '3', null, '8a87e29657f437cf0157f590e3dd0018', null, 'A', null, '12138029', '2015OTS-2000HB', null, '1', '', null, '2015-03-02');
INSERT INTO `problem` VALUES ('419', '12V-5V这种两级的电源设置，最好12V高压DC-DC不要用MPS的，电压反馈环容易受干扰，如人手摸，调试时容易烧后级的电源，推荐可以用fitipower的兼容系列。至少也要和工艺讨论下相关的风险。', '3', null, '8a87e29657f437cf0157f596889a0019', null, 'A', null, '12138029', '2015智能网关', null, '1', '这个可以和工艺一起再讨论下', null, '2015-03-18');
INSERT INTO `problem` VALUES ('420', 'DC-DC的FB部分电阻，以及AVS部分电阻，是否都要1%精度？建议标出来', '3', null, '8a87e29657f437cf0157f596889a0019', null, 'B', null, '12138029', '2015智能网关', null, '3', 'BOM都是1%精度，原理图后面更改', null, '2015-03-18');
INSERT INTO `problem` VALUES ('421', 'R180、R196、R197、R242、R243请使用1%精度电阻', '3', null, '8a87e29657f437cf0157f596889a0019', null, 'B', null, '12138029', '2015智能网关', null, '3', 'OK，后续更改 -没有更改', null, '2015-03-18');
INSERT INTO `problem` VALUES ('422', '双层板要求GND的完整性,目前的设计底层走了太多的线,地分割严重', '3', null, '8a87e29657f437cf0157f596889a0019', null, 'B', null, '12138029', '2015智能网关', null, '1', '', null, '2015-03-18');
INSERT INTO `problem` VALUES ('423', 'DC-DC的分压电阻，请标明1%精度', '3', null, '8a87e29657f437cf0157f59826b9001a', null, 'B', null, '11020249', '2015CM500 ZJ', null, '3', '', null, '2015-05-05');
INSERT INTO `problem` VALUES ('424', 'ESD器件建议还是贴在信号路径上效果比较好', '3', null, '8a87e29657f437cf0157f59826b9001a', null, 'B', null, '11020249', '2015CM500 ZJ', null, '1', '', null, '2015-05-05');
INSERT INTO `problem` VALUES ('425', 'UP1如果要使用3A的DC-DC，应为MP1471A', '3', null, '8a87e29657f437cf0157f59b231f001b', null, 'B', '3', '11020249', '2015DVB-T 9000NN', null, '2', '改原理图', null, '2015-06-12');
INSERT INTO `problem` VALUES ('426', 'LP4\\CP8的值推荐按照标准化手册。', '3', null, '8a87e29657f437cf0157f59b231f001b', null, 'B', '3', '11020249', '2015DVB-T 9000NN', null, '3', '改原理图', null, '2015-06-12');
INSERT INTO `problem` VALUES ('427', '这两个MOS管的方向不对：', '3', null, '8a87e29657f437cf0157f59b231f001b', null, 'A', '3', '11020249', '2015DVB-T 9000NN', null, '2', '原理图封装不对，更改原理图', null, '2015-06-12');
INSERT INTO `problem` VALUES ('428', '按键会否与顶层走线冲突,有短路可能性?建议确认下。', '3', null, '8a87e29657e4b6d30157e4f6cf85000a', null, 'B', null, '11020809', '20155VTBOB', null, '1', '', null, '2015-04-30');
INSERT INTO `problem` VALUES ('429', 'RJ11部分的间距是否够?', '3', null, '8a87e29657e4b6d30157e4f6cf85000a', null, 'B', null, '11020809', '20155VTBOB', null, '1', '', null, '2015-04-30');
INSERT INTO `problem` VALUES ('430', '差分线间距过近:', '3', null, '8a87e29657f437cf0157f5a1cced001c', null, 'C', null, '11020809', '2015CM500 UW41F2S', null, '1', '', null, '2015-11-13');
INSERT INTO `problem` VALUES ('431', '电源层与过孔需要环形隔离', '3', null, '8a87e29657f437cf0157f5a1cced001c', null, 'B', null, '11020809', '2015CM500 UW41F2S', null, '1', '', null, '2015-11-13');
INSERT INTO `problem` VALUES ('432', 'U53没有标明型号', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'C', null, '11020809', '2015CM500 UW41F2S', null, '3', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('433', '所有DC-DC的分压电阻，请标明1%精度', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'B', null, '11020809', '2015CM500 UW41F2S', null, '3', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('434', 'U9的型号TJ1118S-1.5V/0.8A 这个是否正确？', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'B', null, '11020809', '2015CM500 UW41F2S', null, '2', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('435', 'U9如果采用2.5V的输入，输出1.5V，Dropout Voltage是否够？', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'A', null, '11020809', '2015CM500 UW41F2S', null, '1', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('436', 'UP4、UP5的输出电感，根据标准化推荐，应该是2.2u', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'B', null, '11020809', '2015CM500 UW41F2S', null, '3', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('437', '对于DC-DC的接地脚，建议谨慎使用四角连接，最好floor over\n', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'B', null, '11020809', '2015CM500 UW41F2S', null, '2', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('438', '没有安全间距：', '3', null, '8a87e29657f437cf0157f5a3c78d001d', null, 'A', null, '11020809', '2015CM500 UW41F2S', null, '2', '', null, '2015-04-16');
INSERT INTO `problem` VALUES ('439', 'R221,根据ISO7816,卡最大电流50mA的情况下有0.5w,封装是不是要做大点?或电阻做小点？', '3', null, '8a87e29657f437cf0157f5be1310001e', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '1', '', null, '2015-04-24');
INSERT INTO `problem` VALUES ('440', 'mark点上有丝印：', '3', null, '8a87e29657f437cf0157f5be1310001e', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '2', '', null, '2015-04-24');
INSERT INTO `problem` VALUES ('441', '主板下部没有mark点', '3', null, '8a87e29657f437cf0157f5be1310001e', null, 'B', null, '11021950', '2015DVB-C8000H SC', null, '2', '', null, '2015-04-24');
INSERT INTO `problem` VALUES ('442', '这部分网口信号线的安全间距不够:', '3', null, '8a87e29657f437cf0157f5c096d4001f', null, 'B', null, '11021950', '2015VB264TR CN', null, '2', '', null, '2015-03-23');
INSERT INTO `problem` VALUES ('443', '部分引脚的接地不够宽:', '3', null, '8a87e29657f437cf0157f5c096d4001f', null, 'B', null, '11021950', '2015VB264TR CN', null, '2', '', null, '2015-03-23');
INSERT INTO `problem` VALUES ('444', 'R23、R345请标明1%精度', '3', null, '8a87e29657f437cf0157f5c2e3ed0020', null, 'B', null, '11021950', '2015内蒙WIFI模块', null, '3', '', null, '2015-04-02');
INSERT INTO `problem` VALUES ('445', 'DC-DC的反馈电阻,如RP7、RP8、RP14、RP15，请标出1%精度', '3', null, '8a87e29657f437cf0157f5c64dc50021', null, 'C', '3', '20155707', 'RTL9602BGPON21', null, '3', '已经解决', null, '2015-05-18');
INSERT INTO `problem` VALUES ('446', '22U25V0805 这种我们不常用，建议按照DC-DC输入输出电容的参考改为推荐的规格', '3', null, '8a87e29657f437cf0157f5c64dc50021', null, 'B', '3', '20155707', 'RTL9602BGPON21', null, '1', '已经解决', null, '2015-05-18');
INSERT INTO `problem` VALUES ('447', '所有标示为Y5V材质的电容，建议改为X5R的，Y5V材质基本已经被淘汰', '3', null, '8a87e29657f437cf0157f5c64dc50021', null, 'B', '3', '20155707', 'RTL9602BGPON21', null, '1', '已经解决', null, '2015-05-18');
INSERT INTO `problem` VALUES ('448', '顶层铺铜看起来有网格,应该是grid比route width要宽?', '3', null, '8a87e29657f437cf0157f5c64dc50021', null, 'B', null, '20155707', 'RTL9602BGPON21', null, '2', '', null, '2015-05-18');
INSERT INTO `problem` VALUES ('449', '按键实物是否会和后面的走线及元件冲突，请确认下', '3', null, '8a87e29657f437cf0157f5c64dc50021', null, 'A', null, '20155707', 'RTL9602BGPON21', null, '1', '', null, '2015-05-18');
INSERT INTO `problem` VALUES ('450', '这部分是否有安全间距的要求?', '3', null, '8a87e29657f437cf0157f5c91e5b0022', null, 'B', '3', '20155707', '2015ZTELightCat', null, '2', 'ok', null, '2015-05-18');
INSERT INTO `problem` VALUES ('451', 'DC-DC的布局问题较大，参考电压应从电容处引，而不是功率电感处。输出电容、输入电容的接地环路均较大，且底层地不够完整，建议按照推荐的排版来做。', '3', null, '8a87e29657f437cf0157f5c91e5b0022', null, 'A', '3', '20155707', '2015ZTELightCat', null, '1', '建议完全按照标准推荐排', null, '2015-05-18');
INSERT INTO `problem` VALUES ('452', '建议看下按键实物，这个位置的走线会不会和按键冲突，有短路风险？', '3', null, '8a87e29657f437cf0157f5c91e5b0022', null, 'B', '5', '20155707', '2015ZTELightCat', null, '1', '不冲突。', null, '2015-05-18');
INSERT INTO `problem` VALUES ('453', '这部分是升压用么？排版看起来不太好，建议对比下参考设计：', '3', null, '8a87e29657f437cf0157f5c91e5b0022', null, 'A', '5', '20155707', '2015ZTELightCat', null, '1', '升压部分，重新调整了安全距离，无参考设计', null, '2015-05-18');
INSERT INTO `problem` VALUES ('454', 'G2这个是晶振么？用的是什么封装？是否常用？', '3', null, '8a87e29657f437cf0157f5c91e5b0022', null, 'B', '3', '20155707', '2015ZTELightCat', null, '3', '换成贴片设计  没看到变化', null, '2015-05-18');
INSERT INTO `problem` VALUES ('455', 'CP23\\CP25等10u电容需要增加耐压标识', '3', null, '8a87e29657f437cf0157f5cd84a10024', null, 'B', null, '11022719', '2015CH-8500M-ST273-ABP', null, '3', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('456', '中频线与I2C之间请增加地隔离:', '3', null, '8a87e29657f437cf0157f5cd84a10024', null, 'A', null, '11022719', '2015CH-8500M-ST273-ABP', null, '1', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('457', '铺铜貌似有问题?', '3', null, '8a87e29657f437cf0157f5cd84a10024', null, 'A', null, '11022719', '2015CH-8500M-ST273-ABP', null, '2', '', null, '2015-06-29');
INSERT INTO `problem` VALUES ('458', '主板的左上角和右上角缺少机贴Mark点，且看起来没有机插定位孔？', '3', null, '8a87e29657f437cf0157f5d0fa830025', null, 'A', null, '11022719', '2015CH-8501M', null, '2', '', null, '2015-04-20');
INSERT INTO `problem` VALUES ('459', '这两个电阻都不装？', '3', null, '8a87e29657f437cf0157f5d58e380027', null, 'B', null, '11022719', '2015GBS T-252', null, '2', '', null, '2015-05-08');
INSERT INTO `problem` VALUES ('460', 'LMI_RET和SBC_LMI_RET# 这两个网络的电流多大？现有走线是否够粗？二极管的摆放位置是否可以更靠芯片？', '3', null, '8a87e29657f437cf0157f5d58e380027', null, 'B', null, '11022719', '2015GBS T-252', null, '1', '', null, '2015-05-08');
INSERT INTO `problem` VALUES ('463', '原理图规范要求:工作电压峰值超过12V或电容容量大于或等于1uF时，需要标出电容耐压要求,CP25未标出耐压要求', '3', null, '8a87e29657f437cf0157f5d8244e0028', null, 'B', '3', '20059615', '2015SDG6800LN-CA10 Y3', null, '3', '已改', null, '2015-06-10');
INSERT INTO `problem` VALUES ('464', 'CA卡的CLK不要去绕这个圈，可能对EMC有影响。', '3', null, '8a87e29657f437cf0157f5d8244e0028', null, 'B', '3', '20059615', '2015SDG6800LN-CA10 Y3', null, '1', '已修改', null, '2015-06-10');
INSERT INTO `problem` VALUES ('465', '多个DC-DC的GND脚，或输入输出电容的GND脚，采用的是十字连接，这样比较危险，建议针对这些引脚Floor over', '3', null, '8a87e29657f437cf0157f5d8244e0028', null, 'A', '3', '20059615', '2015SDG6800LN-CA10 Y3', null, '2', '已修改\nWCN:DC-DC的输入输出电容接地还是没改', null, '2015-06-10');
INSERT INTO `problem` VALUES ('466', 'IF线包地，建议尽量完整：', '3', null, '8a87e29657f437cf0157f5d8244e0028', null, 'B', '3', '20059615', '2015SDG6800LN-CA10 Y3', null, '1', '已修改', null, '2015-06-10');
INSERT INTO `problem` VALUES ('467', 'MPS的1470系列的最低工作电压只有4.5V左右,用5V供电比较危险,UP3建议从12V取电,如果需要控制通断,建议用EN脚', '3', null, '8a87e29657f437cf0157f5dd9e8c0029', null, 'B', null, '20059615', '2015SDG6800LN-HD01', null, '1', '', null, '2015-03-23');
INSERT INTO `problem` VALUES ('468', 'UP3的反馈离板边缘较近,调试时容易摸到,造成后端输出电压升高,有烧毁芯片的风险,建议换个方位', '3', null, '8a87e29657f437cf0157f5dd9e8c0029', null, 'B', null, '20059615', '2015SDG6800LN-HD01', null, '1', '', null, '2015-03-23');
INSERT INTO `problem` VALUES ('476', 'DD1型号HER103?这个不是标准化器件。', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '3', '20150514反馈', null, '2015-05-22');
INSERT INTO `problem` VALUES ('477', 'CP16、CP17等DC-DC输出的22uF陶瓷电容型号，见标准化手册，我们没有使用过25V耐压的型号', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '1', '20150514反馈', null, '2015-05-22');
INSERT INTO `problem` VALUES ('478', 'T2等很多器件的型号都不对', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '3', '20150514反馈', null, '2015-05-22');
INSERT INTO `problem` VALUES ('479', '按照最新的原理图规范,没有电源分配页', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('480', 'CP1/CP2/CP4/CP6应标出耐压', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'B', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '3', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('481', 'DD1这个二极管的符号是不是反了?', '3', null, '8a87e29657f437cf0157f5e3ba18002b', null, 'A', null, '11020958', '2015DVB-C8000H SC(NZ)', null, '2', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('482', 'scart输出的音视频都不需要电容隔直么?为什么?', '3', null, '8a87e29657f437cf0157f5e750ac002c', null, 'A', null, '11020958', '2015HD8800DS', null, '1', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('483', '左右音频线太近，影响串音指标\n', '3', null, '8a87e29657f437cf0157f5e750ac002c', null, 'A', null, '11020958', '2015HD8800DS', null, '1', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('484', 'USB差分线两端地不完整,且差分线间距不统一', '3', null, '8a87e29657f437cf0157f5e750ac002c', null, 'B', null, '11020958', '2015HD8800DS', null, '2', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('485', 'CN2,推荐使用标准化的15mm毫米插座', '3', null, '8a87e29657f437cf0157f5e750ac002c', null, 'B', null, '11020958', '2015HD8800DS', null, '3', '', null, '2015-04-17');
INSERT INTO `problem` VALUES ('486', '这个电容没接上？', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '2', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('487', 'C135应标出耐压', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'B', null, '11020958', '2015HD8850 COMBO', null, '3', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('488', 'C2在原理图中没有?', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '3', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('489', '12V输入请预留防反向二极管', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'B', null, '11020958', '2015HD8850 COMBO', null, '3', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('490', 'R188/R190请使用1%精度电阻', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'B', null, '11020958', '2015HD8850 COMBO', null, '3', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('491', '位号不正确，且PCB上没有对应物料', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '3', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('492', '8024的PORADJ脚分压电阻，建议考虑改为33k/47k 1%精度，对电源的容忍度更高。此更改需要考虑CA的电性能要求，如上下电时序。', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '1', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('493', '要求离Tuner近', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'B', null, '11020958', '2015HD8850 COMBO', null, '1', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('494', '输出电容的回地路径太远，建议优化PCB排版', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '1', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('495', '视频信号应先过保护电路，再到端口。', '3', null, '8a87e29657f437cf0157f5ea328d002d', null, 'A', null, '11020958', '2015HD8850 COMBO', null, '1', '', null, '2015-06-18');
INSERT INTO `problem` VALUES ('496', '视频buffer的供电,基于保护的原因,串电阻,不要用磁珠,具体规格参考模块电路', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'A', null, '11020958', '2015MSD7C75', null, '3', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('497', 'T2的型号不正确', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'C', null, '11020958', '2015MSD7C75', null, '2', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('498', '8024的分压监控，R21/R29建议按照47k/33k取值', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'B', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('499', '视频、音频输出直接分给了两个输出口，这个不是标准做法，具体可以参考规格书及参考，两个输出口之间应有隔离', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'A', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('500', '这部分的铺地间隔不一样：', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'B', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('501', '建议找实物确认下，是否Tuner的脚压在顶层走线上，如果是的话有短路风险', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'A', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('502', '卡的CLK、IO、VCC、RESET等应有地保护', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'A', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('503', '底层的线建议绕一下，让U3的输入电容有更好的回地路径', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'B', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('504', '左右声道之间应加地隔离：', '3', null, '8a87e29657f437cf0157f5ed647b002e', null, 'A', null, '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('505', 'U26\\U28没有标明型号?是干嘛的?', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'B', null, '20155708', '2015DVB-C8200H AH', null, '3', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('506', 'X5\\X6的封装是啥?从控制成本的角度考虑,建议使用常用的插件晶振', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'B', null, '20155708', '2015DVB-C8200H AH', null, '2', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('507', '原理图中标出的主芯片是BCM7231,请确认最终型号?', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'A', null, '20155708', '2015DVB-C8200H AH', null, '2', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('508', 'R424/R425请使用1%精度电阻', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'A', null, '20155708', '2015DVB-C8200H AH', null, '3', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('509', '实际我们没有使用22U25V0805的电容,达不到这个耐压。请按照推荐手册来确定DC-DC输出电容型号\n同时DC-DC的输入电容未按照原理图规范标出耐压', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'B', null, '20155708', '2015DVB-C8200H AH', null, '3', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('510', 'Q8的型号是啥？R87/R88都是NC么？', '3', null, '8a87e29657f437cf0157f5efcacf002f', null, 'A', null, '20155708', '2015DVB-C8200H AH', null, '2', '', null, '2015-05-25');
INSERT INTO `problem` VALUES ('511', '1C45\\1C46等未标出耐压值，且106、226等这种容值的表示方法不合规', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '3', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('512', '1R24\\1R26\\RP29请使用1%精度', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '3', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('513', '22U25V0805 这种规格很少用，一般是6.3V耐压的', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'C', null, '20155708', 'AMLOGIC-S905', null, '2', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('514', '这个设计的目的何在？另外，直接用GPIO驱动MOS管，是否驱动能力足够？', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'A', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('515', '1C6、9C14、9C15建议用10uF的容量', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'A', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('516', 'AR17、AR18请使用1%精度电阻', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('517', '晶振建议增加保护地，与附近的信号隔离。且规则中要求匹配电容的地与CPU地直连', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('518', 'ESD器件应使用过孔尽量接地', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('519', '沿高速差分线两侧，建议打足够的过孔，尤其是换层的时候。', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'C', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('520', '差分线的间距不相等？', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '2', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('521', '这部分接地太细，建议用Floor over。', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'B', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('522', '所有DC-DC的排版，请根据推荐排版，仔细修改一下：', '3', null, '8a87e29657f437cf0157f5f2e7ca0030', null, 'A', null, '20155708', 'AMLOGIC-S905', null, '1', '', null, '2015-09-01');
INSERT INTO `problem` VALUES ('523', '三级管的基极需要串限流电阻，同时，这个上拉的位置好像也不太正常：', '3', null, '8a87e29657f437cf0157f5f3fa5b0031', null, 'A', null, '20155708', '2015ccxtelblock', null, '1', '', null, '2016-04-26');
INSERT INTO `problem` VALUES ('524', 'MOS管作为电平转换，3.3V端应该有上拉：', '3', null, '8a87e29657f437cf0157f5f3fa5b0031', null, 'A', null, '20155708', '2015ccxtelblock', null, '1', '', null, '2016-04-26');
INSERT INTO `problem` VALUES ('525', '这啥情况?', '3', null, '4028f3815805849401580589016c0000', null, 'A', null, '11020958', '2015DVB-T2 GE', null, '2', '', null, '2015-02-23');
INSERT INTO `problem` VALUES ('526', 'DD1型号不对', '3', null, '4028f3815805849401580589016c0000', null, 'C', null, '11020958', '2015DVB-T2 GE', null, '3', '', null, '2015-02-23');
INSERT INTO `problem` VALUES ('527', '这部分和Mstar最新的APN不同?没有加330pF的电容,二极管的位置也不对?', '3', null, '4028f3815805849401580589016c0000', null, 'A', null, '11020958', '2015DVB-T2 GE', null, '1', '', null, '2015-02-23');
INSERT INTO `problem` VALUES ('528', '原理图上的U9/SC2,PCB上没有,原理图/PCB不对应？', '3', null, '4028f3815805849401580589016c0000', null, 'A', null, '11020958', '2015DVB-T2 GE', null, '3', '', null, '2015-02-23');
INSERT INTO `problem` VALUES ('529', 'MP1470的FB是电压反馈的，', '3', null, '8a87e29657f437cf0157f493e0770001', 'MP1470的FB是电压反馈的，对感应电压敏感，FB部分不能离板边缘太近，调试时手容易摸到，会烧后端的器件', 'B', '1', '11008845', '2015HD3601', null, '1', '', null, '2015-04-01');
INSERT INTO `problem` VALUES ('530', 'u13实际的输入电容只有C182 100n左右，太小。', '3', null, '8a87e29657f437cf0157f577d2a70011', 'u13实际的输入电容只有C182 100n左右，太小。', 'A', '1', '11021933', '2015DVB-C8000BGA SXE', null, '1', '', null, '2015-05-22');
INSERT INTO `problem` VALUES ('531', 'J23串口不是标准定义', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'B', null, '20059615', 'SDG6800LN-HD02', null, '3', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('532', 'CP46请标出耐压', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'A', null, '20059615', 'SDG6800LN-HD02', null, '3', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('533', '安全间距不符合要求：', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'B', null, '20059615', 'SDG6800LN-HD02', null, '2', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('534', 'mark点上有丝印', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'A', null, '20059615', 'SDG6800LN-HD02', null, '2', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('535', '按键开关下的顶层走线，是否与按键支脚之间有短路风险？', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'B', '3', '20059615', 'SDG6800LN-HD02', null, '2', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('536', 'DC电源插座的GND连接过少，建议Floor over', '3', null, '40288ae7581d571101581e5b6cea0000', null, 'A', null, '20059615', 'SDG6800LN-HD02', null, '2', '', null, '2015-04-14');
INSERT INTO `problem` VALUES ('537', '8024 PORADJ的分压电阻桥R15、R16使用1%精度', '3', null, '8a87e29657f437cf0157f5caf03c0023', null, 'A', null, '11009145', '2015CH-8500ME', null, '3', '', null, '2015-07-17');
INSERT INTO `problem` VALUES ('538', 'LV5使用5.1R电阻，防视频烧坏', '3', null, '8a87e29657f437cf0157f5caf03c0023', null, 'A', null, '11009145', '2015CH-8500ME', null, '3', '', null, '2015-07-17');
INSERT INTO `problem` VALUES ('539', 'R724、R725建议用1%精度', '3', null, '8a87e29657f437cf0157f5caf03c0023', null, 'B', null, '11009145', '2015CH-8500ME', null, '3', '', null, '2015-07-17');
INSERT INTO `problem` VALUES ('540', 'LP2、LP3建议按照参考选择值', '3', null, '8a87e29657f437cf0157f5caf03c0023', null, 'C', null, '11009145', '2015CH-8500ME', null, '3', '', null, '2015-07-17');
INSERT INTO `problem` VALUES ('541', 'DD1型号错误', '3', null, '40288ae7581d571101581e622f1d0001', null, 'C', null, '20152714', '2015DVB-T7T35SR', null, '2', '', null, '2015-11-20');
INSERT INTO `problem` VALUES ('542', '卡供电的线太细，C31放的位置有问题', '3', null, '8a87e29657f437cf0157f5ed647b002e', '卡供电的线太细，C31放的位置有问题', 'A', '1', '11020958', '2015MSD7C75', null, '1', '', null, '2015-08-04');
INSERT INTO `problem` VALUES ('543', '8024的PORADJ脚分压，请再确认下，现有的分压值比较临界，建议使用33k/47k', '3', null, '40288ae7581d571101581e5b6cea0000', '8024的PORADJ脚分压，请再确认下，现有的分压值比较临界，建议使用33k/47k', 'B', '1', '20059615', 'SDG6800LN-HD02', null, '1', '', null, '2015-04-14');

-- ----------------------------
-- Table structure for problemmode
-- ----------------------------
DROP TABLE IF EXISTS `problemmode`;
CREATE TABLE `problemmode` (
  `problemModeId` int(11) NOT NULL auto_increment,
  `problemTypeName` varchar(50) default NULL,
  `A` int(11) default NULL,
  `B` int(11) default NULL,
  `C` int(11) default NULL,
  `D` int(11) default NULL,
  `scale` int(11) default NULL,
  `total` int(11) default NULL,
  `problemType` int(11) default NULL,
  `mode` int(11) default NULL,
  PRIMARY KEY  (`problemModeId`),
  KEY `222` (`total`),
  KEY `problemmodeType` (`problemType`),
  KEY `problemmodeMode` (`mode`),
  CONSTRAINT `problemmodeMode` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`),
  CONSTRAINT `problemmodeType` FOREIGN KEY (`problemType`) REFERENCES `problemtype` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problemmode
-- ----------------------------

-- ----------------------------
-- Table structure for problemstate
-- ----------------------------
DROP TABLE IF EXISTS `problemstate`;
CREATE TABLE `problemstate` (
  `stateId` int(11) NOT NULL auto_increment,
  `problemStateName` varchar(25) default NULL,
  `explaintion` varchar(255) default NULL,
  PRIMARY KEY  (`stateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problemstate
-- ----------------------------
INSERT INTO `problemstate` VALUES ('1', '待修复', '确认为缺陷');
INSERT INTO `problemstate` VALUES ('2', '待验证', '修复完成等待验证');
INSERT INTO `problemstate` VALUES ('3', '已解决', '缺陷已经修复，并通过验证');
INSERT INTO `problemstate` VALUES ('4', '遗留', '此缺陷不在本阶级解决');
INSERT INTO `problemstate` VALUES ('5', '注销', '不是缺陷');

-- ----------------------------
-- Table structure for problemtype
-- ----------------------------
DROP TABLE IF EXISTS `problemtype`;
CREATE TABLE `problemtype` (
  `typeId` int(11) NOT NULL auto_increment,
  `typeName` varchar(25) default NULL,
  `explaintion` varchar(255) default NULL,
  PRIMARY KEY  (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problemtype
-- ----------------------------
INSERT INTO `problemtype` VALUES ('1', '一般设计缺陷', null);
INSERT INTO `problemtype` VALUES ('2', '低级错误', null);
INSERT INTO `problemtype` VALUES ('3', '不合规', null);
INSERT INTO `problemtype` VALUES ('4', ' 流程规定', null);
INSERT INTO `problemtype` VALUES ('5', '设计规定', null);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `projectId` varchar(30) NOT NULL,
  `projectName` varchar(50) default NULL,
  `projectManager` varchar(25) default NULL,
  `createTime` date default NULL,
  `startTime` date default NULL,
  `introduction` varchar(255) default NULL,
  `area` varchar(50) default NULL,
  `projectClassify` varchar(20) default NULL,
  `projectState` varchar(25) default NULL,
  `reviewId` int(11) default NULL,
  `endTime` date default NULL,
  PRIMARY KEY  (`projectId`),
  KEY `project1` (`projectManager`),
  KEY `project3` (`reviewId`),
  CONSTRAINT `project1` FOREIGN KEY (`projectManager`) REFERENCES `employee` (`id`),
  CONSTRAINT `project3` FOREIGN KEY (`reviewId`) REFERENCES `review` (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('20155VTBOB', '5VT平台BOB方案光猫', '11020809', null, '2015-02-21', '2015吴志强项目', null, null, null, '9', '2016-01-21');
INSERT INTO `project` VALUES ('2015AMLOGIC S905', '基于AMLOGIC S905方案产品预研', '20155708', null, '2015-02-21', '2015张坤项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015BCM7251S', '基于BCM7251S的4K产品预研', '11020809', null, '2015-02-21', '2015吴志强项目', null, null, null, '9', '2016-01-21');
INSERT INTO `project` VALUES ('2015ccxtelblock', '2015村村响', '20059616', null, '2015-02-21', '2015年姜海洋、罗婷、张坤项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-8500M-ST273-ABP', 'CH-8500M-ST273-ABP', '11022719', null, '2015-02-21', '2015 许金项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-8500ME', 'CH-8500ME', '11009145', null, '2015-02-20', '卢朝军2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-8501M', 'CH-8501M', '11022719', null, '2015-02-21', '2015许金项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-8501M-I', '印度标清CH-8501M-I', '11008845', null, '2015-02-20', '2015OTT项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015CH-8560M', 'CH-8560M', '11022719', null, '2015-02-21', '2015许金项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-8600M', '2015CH-8600M', '11022719', null, '2015-02-21', '2015许金项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015CH-INPLUTO', '印度标清CH-INPLUTO', '11008845', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CH-INPLUTO-HD', '印度高清CH-INPLUTO-HD', '14000635', null, '2015-02-20', '李颖2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CM500 UW41F2S', 'CM500 UW41F2S', '11020809', null, '2015-02-21', '吴志强2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015CM500 ZJ', '广州珠江数码CM500 ZJ', '11020249', null, '2015-02-20', '吴宝雄2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-C8000BGA SXE', 'DVB-C8000BGA SXE', '11021933', null, '2015-02-20', '2015任国项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015DVB-C8000H SC', 'DVB-C8000H SC', '11021950', null, '2015-02-21', '2015向亚君项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-C8000H SC(NZ)', 'DVB-C8000H SC(NZ)', '11020958', null, '2015-02-21', '2015张方方项目', null, null, null, '9', '2016-03-12');
INSERT INTO `project` VALUES ('2015DVB-C8000H SCL', 'DVB-C8000H SCL', '11021950', null, '2015-02-21', '2015向亚君项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-C8100H AH', 'DVB-C8100H AH', '12138029', null, '2015-02-20', '2015王思齐项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015DVB-C8200H AH', '安徽高清DVB-C8200H AH', '20155708', null, '2015-02-21', '2015张坤项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015DVB-C9700 HB', 'DVB-C9700 HB', '20073800', null, '2015-02-20', '罗婷2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-C9700 RG', 'DVB-C9700 RG', '11008199', null, '2015-02-20', '2015孙晓虎项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-C9700 SX', 'DVB-C9700 SX', '20073800', null, '2015-02-20', '罗婷2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-S2 5000 IRD', 'DVB-S2 5000 IRD', '11008199', null, '2015-02-20', '2015孙晓虎项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-S2 7200', 'DVB-S2 7200', '11008199', null, '2015-02-20', '2015孙晓虎项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-S5000MD', 'DVB-S5000MD', '11021933', null, '2015-02-20', '2015任国项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015DVB-T 9000NN', '尼日利亚高清DVB-T 9000NN', '11020249', null, '2015-02-21', '吴保雄2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015DVB-T2 GE', 'DVB-T2 GE', '11020958', null, '2015-02-21', '2015张方方项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015DVB-T7T35SR', 'DVB-T7T35SR', '20152714', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015EP-3000', '广西EP-3000', '20155707', null, '2015-02-21', '2015徐龙项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015EVO ENFINITY', 'EVO ENFINITY', '11008199', null, '2015-02-20', '2015孙晓虎项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015GBS T-252', 'GBS T-252', '11022719', null, '2015-02-21', '2015许金项目', null, null, null, '9', '2016-02-23');
INSERT INTO `project` VALUES ('2015H273', '南美H273项目', '20059616', null, '2015-02-20', '姜海洋2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015HD DVB-C 273MOV', '南美HD DVB-C 273MOV 项目', '20059616', null, '2015-02-20', '2015姜海洋项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015HD DVB-S2 ENTEL', 'HD DVB-S2 ENTEL', '20059616', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015HD DVB-S2 RIL', '印度HD DVB-S2 RIL项目', '20059616', null, '2015-02-20', '姜海洋2015印度项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015HD3601', '上海高清HD3601单模零售机型', '11008845', null, '2015-02-20', '2015年项目', null, null, null, '9', '2016-02-08');
INSERT INTO `project` VALUES ('2015HD8800DS', 'HD8800DS', '11020958', null, '2015-02-21', '2015张方方项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015HD8850 COMBO', 'HD8850 COMBO', '11020958', null, '2015-02-28', '2015张方方项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015Hi3796M', '基于Hi3796M的4K产品预研', '11009145', null, '2015-02-20', '卢朝军2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015IHO-1000 4K', '四川移动IHO-1000 4K', '20152714', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015IHO-3000', 'IHO-3000', '20152714', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015ISDB-T 7542G', '巴西ISDB-T 7542G', '20152714', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015MR2503C', 'MR2503C', '11021933', null, '2015-02-20', '任国2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015MR2503C-F', 'MR2503C-F', '12138029', null, '2015-02-20', '2015王思齐项目', null, null, null, '9', '2016-10-21');
INSERT INTO `project` VALUES ('2015MSD5029', '印度MSD5029', '11008199', null, '2015-02-20', '2015孙晓虎项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015MSD5C37', 'MSD5C37', '11022719', null, '2015-02-21', '2015许金项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015MSD7C75', '平台项目MSD7C75', '11020958', null, '2015-02-21', '2015张方方项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015OTS-2000HB', 'OTS-2000 HB', '12138029', null, '2015-02-20', '2015王思齐项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015OTS-3000 GZ', '广州珠江数码OTS-3000 GZ', '11009145', null, '2015-02-20', '卢朝军2015项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015OTT', '印度OTT项目', '11008845', null, '2015-02-20', '2015OTT项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015RK3128', '四川移动RK3128方案', '11008845', null, '2015-02-20', '2015年项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015RTL8196E8192ER', 'RTL8196E8192ER', '11021950', null, '2015-02-21', '2015向亚君项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('2015SD DVB-S2 8500 ID', '印尼标清SD DVB-S2 8500 ID', '11008845', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015SDG6800LN-CA10 Y3', 'SDG6800LN-CA10 Y3', '20059615', null, '2015-02-21', '2015杨显江项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015SDG6800LN-HD01', 'SDG6800LN-HD01', '20059615', null, '2015-02-21', '2015杨显江项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015SDG6800LN-HD03', 'SDG6800LN-HD03', '20152714', null, '2015-02-20', '2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015VB264TR CN', 'VB264TR CN', '11021950', null, '2015-02-21', '2015向亚君项目', null, null, null, '9', '2016-02-23');
INSERT INTO `project` VALUES ('2015WWIO DVB-C', '韩国WWIO DVB-C项目', '20059616', null, '2015-02-20', '姜海洋2015项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015ZTELightCat', '中兴光猫项目', '20155707', null, '2015-02-21', '2015徐龙项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015内蒙WIFI模块', '内蒙WIFI模块', '11021950', null, '2015-02-21', '2015项目简介', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('2015智能网关', '智能网关', '12138029', null, '2015-02-20', '2015王思齐项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('20160810ML01', '马里', '20073800', null, '2016-08-10', '马里', null, null, null, '5', '2017-02-21');
INSERT INTO `project` VALUES ('20160813LN01', '辽宁建平', '20073800', null, '2016-08-12', '辽宁建平', null, null, null, '5', '2017-02-14');
INSERT INTO `project` VALUES ('3798M20160808', '3798M方案二次降本', '20152714', null, '2016-07-20', '3798M方案二次降本', null, null, null, '7', '2016-12-21');
INSERT INTO `project` VALUES ('AMLOGIC-S905', '基于AMLOGIC S905方案产品预研项目', '20155708', null, '2015-03-15', '基于AMLOGIC S905方案产品预研项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('AMLOGICS806', '基于AMLOGIC S806方案产品预研', '11008845', null, '2015-01-21', '2015樊卫华项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('AVGT6000', '越南高清AVGT6000', '11008845', null, '2016-10-11', '越南高清AVGT6000', null, null, null, '9', null);
INSERT INTO `project` VALUES ('AX7362', 'AX7362', '11022719', null, '2016-04-04', 'AX7362', null, null, null, '7', '2016-11-21');
INSERT INTO `project` VALUES ('BCM33843-CM', '基于BCM33843的CM', '11020809', null, '2016-03-07', '基于BCM33843的CM', null, null, null, '7', '2016-12-22');
INSERT INTO `project` VALUES ('BCM72524K', 'BCM7252 4K', '12138029', null, '2015-01-21', '2015王思齐项目', null, null, null, '7', '2016-11-05');
INSERT INTO `project` VALUES ('CCX0331', '村村响编码控制器', '11008199', null, '2016-01-20', '村村响编码控制器', null, null, null, '7', '2016-11-21');
INSERT INTO `project` VALUES ('CDVBT2', '英国高清CDVBT2', '12138029', null, '2016-09-06', '英国高清CDVBT2', null, null, null, '5', '2017-04-19');
INSERT INTO `project` VALUES ('CFS-8888', '越南高清CFS-8888', '11008845', null, '2016-05-20', '越南高清CFS-8888', null, null, null, '7', '2016-12-29');
INSERT INTO `project` VALUES ('CH-6000M', '印度高清CH-6000M', '11008845', null, '2016-05-20', '印度高清CH-6000M', null, null, null, '7', '2016-12-21');
INSERT INTO `project` VALUES ('CH-6000M-MSD5029-KCCL', 'CH-6000M-MSD5029-KCCL', '12138029', null, '2016-01-04', 'CH-6000M-MSD5029-KCCL', null, null, null, '7', '2016-12-14');
INSERT INTO `project` VALUES ('CH-8500M-ST273-ABPL', 'CH-8500M-ST273-ABPL', '11022719', null, '2016-03-29', 'CH-8500M-ST273-ABPL', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH-8500MU-ABV', 'CH-8500MU-ABV', '11020958', null, '2016-04-11', 'CH-8500MU-ABV', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH-8500MU-GHITS', 'CH-8500MU-GHITS', '11008845', null, '2015-02-20', 'CH-8500MU-GHITS', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('CH-8500MU-MSD5C35-7STAR', '印度标清CH-8500MU-MSD5C35-7STAR', '11008845', null, '2016-05-16', '印度标清CH-8500MU-MSD5C35-7STAR', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH-8500MU-NSTV', 'CH-8500MU-NSTV+', '11020958', null, '2016-03-07', 'CH-8500MU-NSTV+', null, null, null, '7', '2016-11-21');
INSERT INTO `project` VALUES ('CH-8501M VMX', 'CH-8501M VMX', '12138029', null, '2016-04-12', 'CH-8501M VMX', null, null, null, '5', '2016-12-21');
INSERT INTO `project` VALUES ('CH-8501M-ALI-ICNCL', '印度标清CH-8501M-ALI-ICNCL', '11008845', null, '2016-04-18', '印度标清CH-8501M-ALI-ICNCL', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH-8600M', 'CH-8600M', '11022719', null, '2016-02-01', 'CH-8600M', null, null, null, '9', '2016-10-20');
INSERT INTO `project` VALUES ('CH-8600M-ALI3715-ICNCL', 'CH-8600M-ALI3715-ICNCL', '11022719', null, '2016-07-04', 'CH-8600M-ALI3715-ICNCL', null, null, null, '6', '2017-02-15');
INSERT INTO `project` VALUES ('CH1000M', '印度标清CH-1000M', '11008845', null, '2015-01-21', '2015樊卫华项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH5000MA', 'CH-5000MA', '11022719', null, '2015-01-21', '2015许金项目', null, null, null, '9', '2016-11-05');
INSERT INTO `project` VALUES ('CH5000MEL', 'CH-5000M-EL', '11008199', null, '2015-01-21', '2015孙晓虎项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH5000MK', 'CH-5000MK', '12138029', null, '2015-01-21', '2015王思齐项目', null, null, null, '7', '2016-11-05');
INSERT INTO `project` VALUES ('CH832R', '广西CH832R', '20155707', null, '2015-12-07', '广西CH832R', null, null, null, '7', '2016-10-21');
INSERT INTO `project` VALUES ('CH85000MIN', 'CH-85000M IN', '11022719', null, '2015-01-21', '2015许金项目', null, null, null, '9', '2016-10-28');
INSERT INTO `project` VALUES ('CH8500MKCCL', 'CH-8500M-KCCL', '14000635', null, '2015-01-21', '2015李颖项目', null, null, null, '9', '2015-12-24');
INSERT INTO `project` VALUES ('CH8500MU7STAR', 'CH-8500MU(7STAR)', '11022719', null, '2015-01-21', '2015许金项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CH8500MV', 'CH-8500MV', '14000635', null, '2015-01-21', '2015李颖项目', null, null, null, '9', '2015-12-22');
INSERT INTO `project` VALUES ('CHINPLUTOHDPLUS', '印度高清CH-INPLUTO-HD（PLUS）', '14000635', null, '2015-01-21', '2015李颖项目', null, null, null, '9', '2015-12-28');
INSERT INTO `project` VALUES ('CM100UW21C', '印度CM100 UW21C', '11020249', null, '2015-01-21', '2015吴宝雄项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CM100UW21CN', '内蒙CM100 UW21CN', '11020249', null, '2015-01-21', '2015吴保雄项目', null, null, null, '9', '2016-11-05');
INSERT INTO `project` VALUES ('CM100UW21EI', '印度CM100 UW21EI', '11020249', null, '2015-01-21', '2015吴保雄项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CM500-U2-GH', '北京CM500 U2 GH', '11020249', null, '2016-01-11', '北京CM500 U2 GH', null, null, null, '9', '2016-10-28');
INSERT INTO `project` VALUES ('CM500-UW11-HW', '印度CM500 UW11 HW', '11020249', null, '2016-03-24', '印度CM500 UW11 HW', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CM500-UW41F2S-ST', '基于ST方案的CM500 UW41F2S', '11020809', null, '2016-03-22', '基于ST方案的CM500 UW41F2S', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CM500-UW41ZJ', '广州珠江数码CM500 UW41ZJ', '11020249', null, '2016-04-25', '广州珠江数码CM500 UW41ZJ', null, null, null, '9', null);
INSERT INTO `project` VALUES ('CT6000', 'CT6000', '11008845', null, '2016-03-20', 'CT6000', null, null, null, '7', '2016-12-20');
INSERT INTO `project` VALUES ('DMB-TH2000AVS', 'DMB-TH2000AVS', '20059615', null, '2016-05-19', 'DMB-TH2000AVS', null, null, null, '7', '2017-01-20');
INSERT INTO `project` VALUES ('DSR4639', 'DSR4639', '11022719', null, '2015-01-21', '2015许金项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVB-C8000BGA HN1', '河南高清DVB-C8000BGA HN1', '20059615', null, '2016-03-17', '河南高清DVB-C8000BGA HN1', null, null, null, '7', '2016-11-21');
INSERT INTO `project` VALUES ('DVB-C9700', 'DVB-C9700', '20073800', null, '2016-02-23', 'DVB-C9700', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVB-C9700 HBM', 'DVB-C9700 HBM', '20073800', null, '2015-11-20', 'DVB-C9700 HBM', null, null, null, '9', '2016-10-21');
INSERT INTO `project` VALUES ('DVB-C9700 SY', '辽宁浑南DVB-C9700 SY', '20073800', null, '2016-01-20', '辽宁浑南DVB-C9700 SY', null, null, null, '5', '2016-10-21');
INSERT INTO `project` VALUES ('DVB-C9700-EXJ', 'DVB-C9700 EXJ', '20059615', null, '2016-03-14', 'DVB-C9700 EXJ', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVB-C9700-HBS', 'DVB-C9700 HBS', '20073800', null, '2016-03-28', 'DVB-C9700 HBS', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVB-C9700_CXJ', 'DVB-C9700 CXJ', '20059615', null, '2016-03-22', 'DVB-C9700_CXJ', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVB-S2 H239NZ PVR', 'DVB-S2 H239NZ PVR', '11009145', null, '2016-01-20', 'DVB-S2 H239NZ PVR\r\n', null, null, null, '9', '2016-11-03');
INSERT INTO `project` VALUES ('DVB-S2 MSD7S75', 'DVB-S2 MSD7S75', '11021933', null, '2016-01-11', 'DVB-S2 MSD7S75', null, null, null, '9', '2016-10-28');
INSERT INTO `project` VALUES ('DVB-S2 RIL', '印度HD DVB-S2 RIL', '20059616', null, '2016-01-20', '印度HD DVB-S2 RIL', null, null, null, '5', '2016-10-21');
INSERT INTO `project` VALUES ('DVB-T2-GE-7T75', '德国高清DVB-T2 GE IRDETO 7T75', '11020958', null, '2016-04-20', '德国高清DVB-T2 GE IRDETO 7T75', null, null, null, '7', '2016-12-22');
INSERT INTO `project` VALUES ('DVBC8000BGAABS', 'DVB-C8000BGA ABS', '11021933', null, '2015-01-21', '2015任国项目', null, null, null, '10', '2015-12-29');
INSERT INTO `project` VALUES ('DVBC8000BGAPN', 'DVB-C8000BGA PN', '20059615', null, '2015-01-21', '2015杨显江项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVBC8000BGASX', 'DVB-C8000BGA SX', '11021933', null, '2015-01-21', '2015任国项目', null, null, null, '9', '2015-12-23');
INSERT INTO `project` VALUES ('DVBC8000BGATJ2', 'DVB-C8000BGA TJ2', '20059615', null, '2015-01-21', '2015杨显江项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVBC8000BGEHB1', '湖北DVB-C8000BG_E HB1自研EOC模块', '20073800', null, '2015-01-21', '2015罗婷项目', null, null, null, '9', '2016-10-26');
INSERT INTO `project` VALUES ('DVBC8000HHN', 'DVB-C8000H HN', '11008199', null, '2015-01-21', '2015孙晓虎项目', null, null, null, '10', '2015-12-30');
INSERT INTO `project` VALUES ('DVBC8080CBH', 'DVB-C8080CL BH', '11022719', null, '2015-01-21', '2015许金项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVBC9700CGD', 'DVB-C9700 CGD', '20073800', null, '2015-01-21', '2015罗婷项目', null, null, null, '10', '2015-10-27');
INSERT INTO `project` VALUES ('DVBC9700GD', 'DVB-C9700 GD', '20073800', null, '2015-01-21', '2015罗婷项目', null, null, null, '9', '2016-12-28');
INSERT INTO `project` VALUES ('DVBC9700HBHC', 'DVB-C9700HB(HC)', '11008199', null, '2015-01-21', '2015孙晓虎项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVBIP-1001', '北京高清智能DVBIP-1001', '11009145', null, '2016-05-20', '北京高清智能DVBIP-1001', null, null, null, '9', '2016-11-21');
INSERT INTO `project` VALUES ('DVBS2MODULE', 'DVB-S2 MODULE', '11021950', null, '2015-01-21', '2015向亚君项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('DVBS2ORDISA', 'DVB-S2 ORDISA', '11021933', null, '2015-01-21', '2015任国项目', null, null, null, '9', '2015-12-24');
INSERT INTO `project` VALUES ('DVBTH207NZPVR', 'DVB-T H207NZ PVR', '11009145', null, '2015-01-21', '2015卢朝军项目', null, null, null, '7', '2016-10-26');
INSERT INTO `project` VALUES ('DY6000CZAPN', 'DY6000CZA PN', '20059615', null, '2015-01-21', '2015杨显江项目', null, null, null, '7', '2016-11-05');
INSERT INTO `project` VALUES ('ENDABV01', '英国DAB', '11021933', null, '2016-01-04', '英国DAB', null, null, null, '10', '2016-10-21');
INSERT INTO `project` VALUES ('EP-3000', '四川EP-3000', '20155707', null, '2016-05-20', '四川EP-3000', null, null, null, '7', '2016-10-21');
INSERT INTO `project` VALUES ('EPON41WIFI', 'EPON41WIFI', '20155707', null, '2015-02-21', '2015徐龙项目', null, null, null, '9', '2016-02-21');
INSERT INTO `project` VALUES ('ES100 U4BI', 'ES100 U4BI', '20155707', null, '2016-03-14', 'ES100 U4BI', null, null, null, '9', '2016-10-21');
INSERT INTO `project` VALUES ('ES100 UW2', 'ES100 UW2', '20155707', null, '2016-02-08', 'ES100 UW2', null, null, null, '7', '2016-10-21');
INSERT INTO `project` VALUES ('ET7000-T2', 'ET7000 T2', '12138029', null, '2016-04-24', 'ET7000 T2', null, null, null, '9', null);
INSERT INTO `project` VALUES ('G100-S2', 'G100 S2', '12138029', null, '2016-04-04', 'G100 S2', null, null, null, '9', null);
INSERT INTO `project` VALUES ('G100-T2', 'G100 T2', '12138029', null, '2016-05-23', 'G100 T2', null, null, null, '9', null);
INSERT INTO `project` VALUES ('GS100', 'GS100项目', '20218676', null, '2016-05-20', 'GS100项目', null, null, null, '10', '2016-10-20');
INSERT INTO `project` VALUES ('HD 7250', 'HD 7250', '20073800', null, '2016-03-07', 'HD 7250', null, null, null, '7', '2016-12-21');
INSERT INTO `project` VALUES ('HD DVB-T2 HEVC', '意大利HD DVB-T2 HEVC', '11020958', null, '2016-01-18', '意大利HD DVB-T2 HEVC', null, null, null, '9', '2016-10-28');
INSERT INTO `project` VALUES ('HD-7C55', '南美HD 7C55', '11022719', null, '2016-03-07', '南美HD 7C55', null, null, null, '9', '2016-11-21');
INSERT INTO `project` VALUES ('HD-DVB-CW-EL', 'HD-DVB-CW-EL', '11009145', null, '2015-01-21', '2015卢朝军项目', null, null, null, '7', '2016-12-24');
INSERT INTO `project` VALUES ('HD-DVB-S2-ENTEL', 'HD DVB S2 ENTEL', '20073800', null, '2016-03-15', 'HD DVB S2 ENTEL', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HD-DVB-S2-H237', 'HD DVB-S2 H237', '20059616', null, '2015-03-16', 'HD DVB-S2 H237', null, null, null, '9', '2015-12-29');
INSERT INTO `project` VALUES ('HD-NAGRA_COMBO-HEVC', '意大利HD NAGRA+COMBO HEVC', '11020249', null, '2016-03-24', '意大利HD NAGRA+COMBO HEVC', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HD1200', 'HD1200', '20059616', null, '2015-01-21', '2015姜海洋项目', null, null, null, '9', '2016-11-05');
INSERT INTO `project` VALUES ('HD1265', 'HD1265', '20059616', null, '2016-04-11', 'HD1265', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HD1500', 'HD1500', '20059616', null, '2016-04-11', 'HD1500', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HD2000HS', 'HD2000HS', '20155708', null, '2016-04-11', 'HD2000HS', null, null, null, '9', '2016-05-16');
INSERT INTO `project` VALUES ('HD500C', 'HD500C', '11009145', null, '2015-02-07', '卢朝军2015项目', null, null, null, '7', '2016-10-28');
INSERT INTO `project` VALUES ('HD6850', '土耳其HD6850', '11020958', null, '2016-03-17', '土耳其HD6850', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HI3716M V330', 'HI3716M V330平台', '12138029', null, '2016-05-17', 'HI3716M V330平台', null, null, null, '5', '2016-12-29');
INSERT INTO `project` VALUES ('Hi3798-3383', '深圳天威Hi3798+3383', '11020809', null, '2016-07-04', '深圳天威Hi3798+3383', null, null, null, '5', '2017-02-24');
INSERT INTO `project` VALUES ('HI3798M', '基于HI3798M方案产品预研', '20152714', null, '2015-01-21', '2015何天龙项目', null, null, null, '7', '2016-10-20');
INSERT INTO `project` VALUES ('HI3798M-4K-jb', '电信HI3798M 4K降本方案', '20152714', null, '2016-04-21', '电信HI3798M 4K降本方案', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HI3798M-jb', 'HI3798M降本方案', '20152714', null, '2016-03-21', 'HI3798M降本方案', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HI3798M-YD', '移动HI3798M降本小外观', '20152714', null, '2016-06-06', '移动HI3798M降本小外观', null, null, null, '9', null);
INSERT INTO `project` VALUES ('HPH2000', 'HPH2000项目', '11021950', null, '2016-05-02', 'HPH2000项目', null, null, null, '9', '2016-10-27');
INSERT INTO `project` VALUES ('HS200UW4S', 'HS200 UW4S', '20073800', null, '2015-01-21', '2015罗婷项目', null, null, null, '9', '2016-11-05');
INSERT INTO `project` VALUES ('ICE7547', 'ICE 7547', '20059616', null, '2015-01-21', '2015姜海洋项目', null, null, null, '9', '2015-12-30');
INSERT INTO `project` VALUES ('IHO-1000-SCYD', '四川移动IHO-1000 SCYD', '11008845', null, '2016-04-19', '四川移动IHO-1000 SCYD', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO-2000-I', '印度IHO-2000 I', '11008845', null, '2016-04-11', '印度IHO-2000 I', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO-2905', 'IHO-2905', '20155708', null, '2015-11-20', 'IHO-2905', null, null, null, '9', '2016-05-19');
INSERT INTO `project` VALUES ('IHO-3000-GZ', 'IHO-3000 GZ项目', '20152714', null, '2016-07-11', 'IHO-3000 GZ项目（更改为QFP主芯片）', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO-3000-HN', '湖南IHO-3000', '20152714', null, '2016-05-19', '湖南IHO-3000', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO-3000E', '江西IHO-3000E', '11008199', null, '2016-03-07', '江西IHO-3000E', null, null, null, '7', '2016-11-29');
INSERT INTO `project` VALUES ('IHO-3100_SCYD', 'IHO-3100 SCYD', '11009145', null, '2016-03-23', 'IHO-3100 SCYD', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO-3300', 'IHO-3300', '11009145', null, '2016-08-20', 'IHO-3300', null, null, null, '5', '2017-04-14');
INSERT INTO `project` VALUES ('IHO-3300A', 'IHO-3300A', '20155708', null, '2016-07-04', 'IHO-3300A', null, null, null, '5', '2016-10-21');
INSERT INTO `project` VALUES ('IHO1128', '四川移动IHO-1128', '11020249', null, '2015-01-14', '2015吴保雄项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IHO2000', 'IHO-2000', '11008845', null, '2015-01-21', '2015樊卫华项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('IPTV8000', 'IPTV8000', '20073800', null, '2016-04-20', 'IPTV8000', null, null, null, '7', '2016-12-21');
INSERT INTO `project` VALUES ('ISDBTH206BR', 'ISDB-T H206 BR', '11009145', null, '2015-01-21', '2015卢朝军项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('ITV628HD', '四川电信ITV628 HD', '11020249', null, '2015-01-21', '2015吴保雄项目', null, null, null, '9', '2016-11-05');
INSERT INTO `project` VALUES ('M10120160608', '中移物联网M101', '20152714', null, '2016-04-20', '中移物联网M101', null, null, null, '7', '2016-11-21');
INSERT INTO `project` VALUES ('MSA3B177', '巴西政府招标MSA3B177', '20059615', null, '2016-02-08', '巴西政府招标MSA3B177', null, null, null, '7', '2016-10-21');
INSERT INTO `project` VALUES ('MSA6Z18', '平台项目MSA6Z18', '14000635', null, '2016-07-06', '平台项目MSA6Z18', null, null, null, '5', '2017-03-14');
INSERT INTO `project` VALUES ('MSD7C35-R', '基于MSD7C35的平台预研项目', '11020958', null, '2016-05-16', '基于MSD7C35的平台预研项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('MSO9380AK', 'MSO9380AK平台', '11008845', null, '2016-04-20', 'MSO9380AK平台', null, null, null, '7', '2016-12-28');
INSERT INTO `project` VALUES ('MSTAR-7C51G', 'MSTAR 7C51G', '11021950', null, '2015-03-22', 'MSTAR 7C51G', null, null, null, '10', '2015-12-16');
INSERT INTO `project` VALUES ('MSTAR-MSO9280M', '基于MSTAR MSO9280M方案产品预研', '12138029', null, '2016-03-22', '基于MSTAR MSO9280M方案产品预研', null, null, null, '9', null);
INSERT INTO `project` VALUES ('MSTAR7C51G', 'MSTAR7C51G', '11021950', null, '2015-01-21', '2015向亚君项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('MTKMT7520FT', '基于MTK MT7520FT方案产品预研', '20155707', null, '2015-01-21', '2015徐龙项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('NSO9280', 'NSO9280', '14000635', null, '2015-01-21', '2015李颖项目', null, null, null, '9', '2015-12-21');
INSERT INTO `project` VALUES ('OTS-3000 SH', 'OTS-3000 SH', '20059615', null, '2016-05-09', 'OTS-3000 SH', null, null, null, '5', '2016-12-21');
INSERT INTO `project` VALUES ('OTS-3000 SX', '浙江绍兴高清OTS-3000 SX', '20155708', null, '2016-05-10', '浙江绍兴高清OTS-3000 SX', null, null, null, '5', '2016-10-21');
INSERT INTO `project` VALUES ('OTS-3000 SZ', 'OTS-3000 SZ', '11009145', null, '2016-03-11', 'OTS-3000 SZ', null, null, null, '9', '2016-11-21');
INSERT INTO `project` VALUES ('OTS-3000HB', '湖北高清OTS-3000HB', '11009145', null, '2016-01-20', '湖北高清OTS-3000HB', null, null, null, '9', '2016-10-21');
INSERT INTO `project` VALUES ('OTS-3000_SC', 'OTS-3000 SC', '11009145', null, '2016-03-08', 'OTS-3000 SC', null, null, null, '9', null);
INSERT INTO `project` VALUES ('OTS2000', 'OTS-2000', '11008199', null, '2015-01-21', '2015王思齐项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('OTS2000TJ', '天津OTS-2000TJ', '20155708', null, '2015-01-21', '2015张坤项目', null, null, null, '7', '2016-10-28');
INSERT INTO `project` VALUES ('RTL9602BGPON21', 'RTL9602B GPON2+1', '20155707', null, '2015-02-24', '2015徐龙项目', null, null, null, '9', '2016-02-24');
INSERT INTO `project` VALUES ('SD-DVB-S2-RI', '印度SD DVB-S2-RI', '20059616', null, '2016-04-11', '印度SD DVB-S2-RI', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SDDVBS25S35', 'SD DVB-S2 5S35', '11021933', null, '2015-01-21', '2015任国项目', null, null, null, '9', '2015-12-23');
INSERT INTO `project` VALUES ('SDG6800LN-CA09-Y3', 'SDG6800LN-CA09 Y3', '20059615', null, '2015-04-13', 'SDG6800LN-CA09 Y3', null, null, null, '9', '2016-02-25');
INSERT INTO `project` VALUES ('SDG6800LN-HD02', 'SDG6800LN-HD02', '20059615', null, '2015-01-11', 'SDG6800LN-HD02', null, null, null, '7', '2015-10-21');
INSERT INTO `project` VALUES ('SDG6800LN-HD02-JB', 'SDG6800LN-HD02降本', '20059615', null, '2016-03-23', 'SDG6800LN-HD02降本', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SG6800LN-CA15', 'SG6800LN-CA15', '11008845', null, '2015-02-20', '2015年项目', null, null, null, '9', '2016-01-21');
INSERT INTO `project` VALUES ('SG6800LN-SD01', '直播星SG6800LN-SD01', '11008845', null, '2016-06-20', '直播星SG6800LN-SD01', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SG6800LNCA06Q3', 'SG6800LN-CA06 Q3', '20059615', null, '2015-01-21', '2015杨显江项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SG6800LNCA06Y2', 'SG6800LN-CA06 Y2', '20059615', null, '2015-01-21', '2015杨显江项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SML-5010T', '俄罗斯高清SML-5010T', '20073800', null, '2016-03-22', '俄罗斯高清SML-5010T', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SML-582_HD', 'SML-582 HD', '20073800', null, '2016-05-16', 'SML-582 HD', null, null, null, '9', null);
INSERT INTO `project` VALUES ('SML492HDrev110', '俄罗斯高清SML492HD rev110', '20155708', null, '2015-01-21', '2015张坤项目', null, null, null, '7', '2016-10-20');
INSERT INTO `project` VALUES ('ULTRAMINS2', 'ULTRA MINI S2', '20059616', null, '2015-01-21', '2015姜海洋项目', null, null, null, '9', '2016-10-29');
INSERT INTO `project` VALUES ('VB264TCN', 'VB264TCN', '11021950', null, '2015-02-24', '2015向亚君项目', null, null, null, '9', null);
INSERT INTO `project` VALUES ('videobridge', 'video bridge', '11021950', null, '2015-01-21', '2015向亚君项目', null, null, null, '9', '2016-11-04');
INSERT INTO `project` VALUES ('VS1265', '荷兰高清VS1265', '11022719', null, '2016-04-11', '荷兰高清VS1265', null, null, null, '9', '2016-11-22');
INSERT INTO `project` VALUES ('XJTS2016V1', '新疆天山云融合终端', '20155708', null, '2016-05-20', '新疆天山云融合终端', null, null, null, '9', '2016-10-21');
INSERT INTO `project` VALUES ('XJTS2016V2', '新疆天山云终端eoc', '20155708', null, '2016-08-08', '新疆天山云终端eoc', null, null, null, '5', '2016-10-21');
INSERT INTO `project` VALUES ('YN2016V01', '云南省网', '20073800', null, '2016-01-20', '云南省网', null, null, null, '7', '2016-10-21');
INSERT INTO `project` VALUES ('捷克高清DVB-S2 9100A', '捷克高清DVB-S2 9100A', '11008845', null, '2015-02-20', '2015年项目', null, null, null, '9', '2016-02-24');

-- ----------------------------
-- Table structure for projectreview
-- ----------------------------
DROP TABLE IF EXISTS `projectreview`;
CREATE TABLE `projectreview` (
  `projectReviewId` int(11) NOT NULL auto_increment,
  `project` varchar(25) default NULL,
  `employee` varchar(20) default NULL,
  `phase` int(11) default NULL,
  `designReg` int(11) default NULL COMMENT '设计规定',
  `designExplain` varchar(255) default NULL,
  `flowsheetReg` int(11) default NULL COMMENT '流程规定',
  `flowExplain` varchar(255) default NULL,
  `workplan` int(11) default NULL,
  `workPlanExplain` varchar(255) default NULL,
  `communication` int(11) default NULL,
  `communicationExplain` varchar(255) default NULL,
  `workEnt` int(11) default NULL,
  `workEntExplain` varchar(255) default NULL,
  `PRExplain` varchar(255) default NULL,
  `PRDate` date default NULL,
  PRIMARY KEY  (`projectReviewId`),
  KEY `projectph1` (`project`),
  KEY `projectph2` (`employee`),
  KEY `projectph3` (`phase`),
  CONSTRAINT `projectph1` FOREIGN KEY (`project`) REFERENCES `project` (`projectId`),
  CONSTRAINT `projectph2` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `projectph3` FOREIGN KEY (`phase`) REFERENCES `phase` (`phaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectreview
-- ----------------------------
INSERT INTO `projectreview` VALUES ('128', 'BCM72524K', '12138029', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('129', '2015OTS-2000HB', '12138029', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('130', 'CH5000MK', '12138029', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '未完成工艺自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('131', '2015DVB-C8100H AH', '12138029', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('132', '2015DVB-C8100H AH', '12138029', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '未提供评审资料', '2015-10-12');
INSERT INTO `projectreview` VALUES ('133', 'HD-DVB-CW-EL', '11009145', '4', '0', null, '2', null, '0', null, '0', null, '0', null, '没有提供电路设计图', '2015-10-12');
INSERT INTO `projectreview` VALUES ('134', 'DVBTH207NZPVR', '11009145', '4', '0', null, '3', null, '0', null, '0', null, '0', null, '没有提供评审记录表，没有对正样评审情况进行自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('135', 'HD500C', '11009145', '3', '0', null, '4', null, '2', null, '0', null, '0', null, '没有完成自检、试验没有做，报告没有预回复', '2015-10-12');
INSERT INTO `projectreview` VALUES ('136', '2015Hi3796M', '11009145', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('137', '2015CH-8500ME', '11009145', '2', '2', null, '0', null, '0', null, '0', null, '0', null, '前端接收灵敏度不合格没有结论和计划', '2015-10-12');
INSERT INTO `projectreview` VALUES ('138', '2015CH-8500ME', '11009145', '3', '0', null, '0', null, '0', null, '0', null, '3', null, '显控板带线长度没有沟通考虑', '2015-10-12');
INSERT INTO `projectreview` VALUES ('139', 'ISDBTH206BR', '11009145', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('140', 'MTKMT7520FT', '20155707', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('141', 'MTKMT7520FT', '20155707', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('142', 'CH8500MKCCL', '14000635', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('143', 'CH8500MKCCL', '14000635', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '正样样机工艺自评和审核未完成', '2015-10-12');
INSERT INTO `projectreview` VALUES ('144', 'CH8500MKCCL', '14000635', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('145', '2015CH-INPLUTO-HD', '14000635', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '无对应状态评审用样机', '2015-10-12');
INSERT INTO `projectreview` VALUES ('146', 'NSO9280', '14000635', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('147', 'NSO9280', '14000635', '3', '5', null, '0', null, '0', null, '0', null, '0', null, '没有完成样机自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('148', 'CH8500MV', '14000635', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '正样样机工艺自评和审核未完成', '2015-10-12');
INSERT INTO `projectreview` VALUES ('149', 'CH8500MV', '14000635', '4', '0', null, '0', null, '0', null, '2', null, '3', null, '组装问题未与结构仔细落实；键控板质量问题未关注', '2015-10-12');
INSERT INTO `projectreview` VALUES ('150', 'CHINPLUTOHDPLUS', '14000635', '4', '0', null, '0', null, '0', null, '0', null, '2', null, '马赛克问题没有去落实', '2015-10-12');
INSERT INTO `projectreview` VALUES ('151', 'DVBC8080CBH', '11022719', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('152', '2015CH-8560M', '11022719', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('153', '2015CH-8560M', '11022719', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('154', '2015CH-8501M', '11022719', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('155', '2015CH-8501M', '11022719', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('156', 'DSR4639', '11022719', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('157', '2015GBS T-252', '11022719', '2', '0', null, '2', null, '0', null, '0', null, '0', null, '未反馈DDR和FLASH兼容性情况', '2015-10-12');
INSERT INTO `projectreview` VALUES ('158', '2015GBS T-252', '11022719', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('159', 'CH5000MA', '11022719', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('160', 'CH5000MA', '11022719', '3', '0', null, '0', null, '3', null, '0', null, '0', null, '烤机死机问题未优先处理', '2015-10-12');
INSERT INTO `projectreview` VALUES ('161', 'CH85000MIN', '11022719', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('162', 'CH85000MIN', '11022719', '3', '0', null, '4', null, '0', null, '0', null, '0', null, '未按规定完成评审自检和审核项，未对初样评审问题确认回复', '2015-10-12');
INSERT INTO `projectreview` VALUES ('163', 'CH8500MU7STAR', '11022719', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('164', 'DVBC8000BGASX', '11021933', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('165', 'DVBC8000BGASX', '11021933', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '电路自检未完成', '2015-10-12');
INSERT INTO `projectreview` VALUES ('166', 'DVBS2ORDISA', '11021933', '2', '0', null, '4', null, '0', null, '0', null, '0', null, '试验安排不充分等', '2015-10-12');
INSERT INTO `projectreview` VALUES ('167', 'DVBS2ORDISA', '11021933', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '没在初样基础上填写自检表、结构结论部分空白', '2015-10-12');
INSERT INTO `projectreview` VALUES ('168', 'DVBC8000BGAABS', '11021933', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('169', '2015MR2503C', '11021933', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('170', '2015MR2503C', '11021933', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('171', '2015MR2503C', '11021933', '4', '0', null, '3', null, '0', null, '0', null, '0', null, '未在正样评审表格基础上填写和未对正样评审问题进行确认', '2015-10-12');
INSERT INTO `projectreview` VALUES ('172', '2015DVB-C8000BGA SXE', '11021933', '3', '0', null, '3', null, '0', null, '0', null, '3', null, '初样未评审、评审表格没有电路设计图审核信息、试制问题没有提前确认处理', '2015-10-12');
INSERT INTO `projectreview` VALUES ('173', 'SDDVBS25S35', '11021933', '2', '0', null, '2', null, '0', null, '0', null, '0', null, '评审表格没有电路设计图审核信息', '2015-10-12');
INSERT INTO `projectreview` VALUES ('174', 'SML492HDrev110', '20155708', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '评审样机与测试样机状态不同', '2015-10-12');
INSERT INTO `projectreview` VALUES ('175', 'SML492HDrev110', '20155708', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('176', 'OTS2000TJ', '20155708', '3', '2', null, '0', null, '0', null, '0', null, '0', null, 'DDR新制程未考虑安排等', '2015-10-12');
INSERT INTO `projectreview` VALUES ('177', '2015DVB-C8200H AH', '20155708', '2', '0', null, '0', null, '0', null, '0', null, '5', null, '工艺问题较多，没有积极落实', '2015-10-12');
INSERT INTO `projectreview` VALUES ('178', 'HD1200', '20059616', '2', '0', null, '0', null, '2', null, '0', null, '0', null, '高低温试验没有安排', '2015-10-12');
INSERT INTO `projectreview` VALUES ('179', 'HD1200', '20059616', '3', '0', null, '2', null, '0', null, '0', null, '0', null, '资料没有一次性提供完备', '2015-10-12');
INSERT INTO `projectreview` VALUES ('180', 'HD1200', '20059616', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('181', 'ULTRAMINS2', '20059616', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('182', 'ULTRAMINS2', '20059616', '3', '0', null, '0', null, '0', null, '0', null, '1', null, '初样评审问题与结构相关项未落实', '2015-10-12');
INSERT INTO `projectreview` VALUES ('183', 'ICE7547', '20059616', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('184', 'HD-DVB-S2-H237', '20059616', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('185', '2015HD DVB-S2 ENTEL', '20059616', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '评审表未完成工艺评审', '2015-10-12');
INSERT INTO `projectreview` VALUES ('186', 'DVBC9700GD', '20073800', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('187', 'DVBC9700GD', '20073800', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('188', 'DVBC9700CGD', '20073800', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('189', 'DVBC9700CGD', '20073800', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('190', 'SDG6800LN-HD02', '20073800', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '自评审没有及时完成', '2015-10-12');
INSERT INTO `projectreview` VALUES ('191', 'SDG6800LN-HD02', '20073800', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('192', 'DVBC8000BGEHB1', '20073800', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('193', '2015DVB-C9700 SX', '20073800', '2', '1', null, '3', null, '0', null, '0', null, '0', null, '铝电解极性方向不统一，工艺问题未自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('194', '2015DVB-C9700 SX', '20073800', '3', '0', null, '0', null, '3', null, '0', null, '0', null, '正样需安排的试验没有机器安排', '2015-10-12');
INSERT INTO `projectreview` VALUES ('195', 'HS200UW4S', '20073800', '2', '0', null, '0', null, '3', null, '0', null, '0', null, '不合格项未及时与方案商沟通确认、初样改版次数多', '2015-10-12');
INSERT INTO `projectreview` VALUES ('196', 'HI3798M', '20152714', '2', '0', null, '3', null, '0', null, '0', null, '0', null, 'WIFI性能测试和EMC摸底测试未完成', '2015-10-12');
INSERT INTO `projectreview` VALUES ('197', '2015SDG6800LN-HD03', '20152714', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('198', '2015IHO-3000', '20152714', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('199', '2015IHO-3000', '20152714', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '未在初样基础上填写评审表', '2015-10-12');
INSERT INTO `projectreview` VALUES ('200', '2015IHO-3000', '20152714', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('201', '2015IHO-1000 4K', '20152714', '3', '0', null, '1', null, '0', null, '0', null, '0', null, '未对初样评审问题进行回复', '2015-10-12');
INSERT INTO `projectreview` VALUES ('202', '2015DVB-T7T35SR', '20152714', '2', '3', null, '0', null, '0', null, '0', null, '0', null, '视频BUFFER没有采用标准封装', '2015-10-12');
INSERT INTO `projectreview` VALUES ('203', '2015HD8800DS', '11020958', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('204', '2015HD8800DS', '11020958', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('205', '2015DVB-C8000H SC(NZ)', '11020958', '2', '0', null, '2', null, '0', null, '0', null, '0', null, '性能指标表提供错误', '2015-10-12');
INSERT INTO `projectreview` VALUES ('206', '2015DVB-C8000H SC(NZ)', '11020958', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('207', '2015CH-INPLUTO', '11008845', '2', '0', null, '0', null, '0', null, '0', null, '2', null, '对结构和适配器相关事项没有推动落实', '2015-10-12');
INSERT INTO `projectreview` VALUES ('208', '2015CH-INPLUTO', '11008845', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('209', '2015CH-INPLUTO', '11008845', '4', '0', null, '3', null, '0', null, '0', null, '0', null, '未提供设计图', '2015-10-12');
INSERT INTO `projectreview` VALUES ('210', 'SG6800LN-CA15', '11008845', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '工艺没有自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('211', 'CH1000M', '11008845', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('212', '2015SD DVB-S2 8500 ID', '11008845', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('213', '2015SD DVB-S2 8500 ID', '11008845', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('214', 'IHO2000', '11008845', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('215', 'CH-8500MU-GHITS', '11008845', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('216', 'CH-8500MU-GHITS', '11008845', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('217', '捷克高清DVB-S2 9100A', '11008845', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('218', '捷克高清DVB-S2 9100A', '11008845', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('219', 'videobridge', '11021950', '2', '0', null, '0', null, '0', null, '2', null, '0', null, '工艺问题沟通较少', '2015-10-12');
INSERT INTO `projectreview` VALUES ('220', 'VB264TCN', '11021950', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('221', '2015VB264TR CN', '11021950', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '性能测试数据未提供', '2015-10-12');
INSERT INTO `projectreview` VALUES ('222', 'DVBS2MODULE', '11021950', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('223', 'DVBS2MODULE', '11021950', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('224', '2015DVB-C8000H SC', '11021950', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('225', '2015DVB-C8000H SC', '11021950', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('226', 'MSTAR-7C51G', '11021950', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('227', 'DVBC8000HHN', '11008199', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('228', 'DVBC8000HHN', '11008199', '3', '0', null, '3', null, '0', null, '0', null, '0', null, '未提供测试指标，没有在初样基础上自评', '2015-10-12');
INSERT INTO `projectreview` VALUES ('229', 'DVBC8000HHN', '11008199', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('230', 'CH5000MEL', '11008199', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('231', '2015EVO ENFINITY', '11008199', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('232', 'OTS2000', '11008199', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('233', 'OTS2000', '11008199', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('234', 'DVBC9700HBHC', '11008199', '2', '0', null, '3', null, '0', null, '0', null, '0', null, '未完成工艺自检', '2015-10-12');
INSERT INTO `projectreview` VALUES ('235', 'DY6000CZAPN', '20059615', '4', '0', null, '2', null, '0', null, '0', null, '0', null, '对应的设计图没有提供', '2015-10-12');
INSERT INTO `projectreview` VALUES ('236', '2015SDG6800LN-HD01', '20059615', '2', '0', null, '0', null, '0', null, '0', null, '2', null, '电源纹波较大问题没有积极想法改善', '2015-10-12');
INSERT INTO `projectreview` VALUES ('237', '2015SDG6800LN-HD01', '20059615', '3', '0', null, '1', null, '0', null, '0', null, '0', null, '记录表中漏了结构评审部分', '2015-10-12');
INSERT INTO `projectreview` VALUES ('238', 'SDG6800LN-HD02', '20059615', '2', '0', null, '0', null, '3', null, '0', null, '0', null, '没有及时安排评审', '2015-10-12');
INSERT INTO `projectreview` VALUES ('239', 'SDG6800LN-HD02', '20059615', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('240', 'SDG6800LN-HD02', '20059615', '4', '3', null, '0', null, '0', null, '0', null, '0', null, '串口和卡座没有采用标准封装', '2015-10-12');
INSERT INTO `projectreview` VALUES ('241', 'SG6800LNCA06Y2', '20059615', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('242', 'SDG6800LN-CA09-Y3', '20059615', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('243', 'DVBC8000BGATJ2', '20059615', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('244', 'DVBC8000BGATJ2', '20059615', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('245', 'DVBC8000BGAPN', '20059615', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('246', 'DVBC8000BGAPN', '20059615', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('247', 'SG6800LNCA06Q3', '20059615', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('248', 'SG6800LNCA06Q3', '20059615', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('249', 'SG6800LNCA06Q3', '20059615', '4', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('250', 'ITV628HD', '11020249', '2', '0', null, '0', null, '0', null, '3', null, '0', null, '接口端子与后面板配合差', '2015-10-12');
INSERT INTO `projectreview` VALUES ('251', 'ITV628HD', '11020249', '3', '0', null, '0', null, '0', null, '0', null, '2', null, '仍存在配合间隙', '2015-10-12');
INSERT INTO `projectreview` VALUES ('252', 'ITV628HD', '11020249', '4', '0', null, '2', null, '0', null, '0', null, '0', null, '没有提供设计图纸', '2015-10-12');
INSERT INTO `projectreview` VALUES ('253', 'CM100UW21C', '11020249', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('254', 'IHO1128', '11020249', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('255', 'CM100UW21CN', '11020249', '2', '0', null, '1', null, '0', null, '0', null, '0', null, '未对初样评审问题进行回复确认', '2015-10-12');
INSERT INTO `projectreview` VALUES ('256', '2015DVB-T 9000NN', '11020249', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('257', '2015DVB-T 9000NN', '11020249', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('258', 'CM100UW21EI', '11020249', '2', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');
INSERT INTO `projectreview` VALUES ('259', 'CM100UW21EI', '11020249', '3', '0', null, '0', null, '0', null, '0', null, '0', null, '无问题', '2015-10-12');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `resultId` int(11) NOT NULL auto_increment,
  `employee` varchar(25) default NULL,
  `compliance` double(11,2) default NULL,
  `learningAbility` double(11,2) default NULL,
  `designAbility` double(11,2) default NULL,
  `work` double(11,2) default NULL,
  `communication` double(11,2) unsigned zerofill default NULL,
  `mode` int(11) default NULL,
  `score` int(11) default NULL,
  `other` varchar(25) default NULL,
  `startTime` date default NULL,
  `endTime` date default NULL,
  `overall` int(11) default NULL,
  PRIMARY KEY  (`resultId`),
  KEY `resultemployee` (`employee`),
  KEY `resultmodeid` (`mode`),
  KEY `readfasdf` (`overall`),
  CONSTRAINT `readfasdf` FOREIGN KEY (`overall`) REFERENCES `overallscore` (`id`),
  CONSTRAINT `resultemployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `resultmodeid` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('1', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('2', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('3', '11008199', '2.95', '0.00', '9.40', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('4', '11008845', '3.17', '0.00', '7.67', '0.00', '00000000.17', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('5', '11009145', '6.57', '0.00', '11.00', '0.00', '00000000.71', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('6', '11009171', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('7', '11020249', '3.30', '0.00', '5.50', '0.00', '00000000.50', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('8', '11020403', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('9', '11020809', '2.50', '0.00', '7.50', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('10', '11020958', '8.17', '0.00', '17.50', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('11', '11021933', '8.05', '0.00', '13.50', '0.00', '00000000.30', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('12', '11021950', '2.38', '0.00', '6.33', '0.00', '00000000.25', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('13', '11022719', '1.79', '0.00', '4.00', '0.00', '00000000.23', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('14', '12128145', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('15', '12138029', '10.95', '0.00', '20.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('16', '14000635', '6.56', '0.00', '23.00', '0.00', '00000000.78', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('17', '20059615', '4.07', '0.00', '12.00', '0.00', '00000000.33', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('18', '20059616', '2.53', '0.00', '5.40', '0.00', '00000000.38', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('19', '20073800', '3.03', '0.00', '15.67', '0.00', '00000000.60', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('20', '20152714', '4.93', '0.00', '15.17', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('21', '20155707', '3.25', '0.00', '12.75', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('22', '20155708', '9.75', '0.00', '22.50', '0.00', '00000001.25', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('23', '20218676', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '1');
INSERT INTO `result` VALUES ('24', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '4');
INSERT INTO `result` VALUES ('25', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '4');
INSERT INTO `result` VALUES ('26', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '5');
INSERT INTO `result` VALUES ('27', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '5');
INSERT INTO `result` VALUES ('28', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '6');
INSERT INTO `result` VALUES ('29', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '6');
INSERT INTO `result` VALUES ('30', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '7');
INSERT INTO `result` VALUES ('31', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '7');
INSERT INTO `result` VALUES ('32', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '8');
INSERT INTO `result` VALUES ('33', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '8');
INSERT INTO `result` VALUES ('34', '11007538', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('35', '11007541', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('36', '11008199', '2.95', '0.00', '9.40', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('37', '11008845', '3.17', '0.00', '7.67', '0.00', '00000000.17', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('38', '11009145', '6.57', '0.00', '11.00', '0.00', '00000000.71', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('39', '11009171', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('40', '11020249', '3.30', '0.00', '5.50', '0.00', '00000000.50', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('41', '11020403', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('42', '11020809', '2.50', '0.00', '7.50', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('43', '11020958', '8.17', '0.00', '17.50', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('44', '11021933', '8.05', '0.00', '13.50', '0.00', '00000000.30', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('45', '11021950', '2.38', '0.00', '6.33', '0.00', '00000000.25', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('46', '11022719', '1.79', '0.00', '4.00', '0.00', '00000000.23', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('47', '12128145', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('48', '12138029', '10.95', '0.00', '20.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('49', '14000635', '6.56', '0.00', '23.00', '0.00', '00000000.78', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('50', '20059615', '4.07', '0.00', '12.00', '0.00', '00000000.33', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('51', '20059616', '2.53', '0.00', '5.40', '0.00', '00000000.38', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('52', '20073800', '3.03', '0.00', '15.67', '0.00', '00000000.60', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('53', '20152714', '4.93', '0.00', '15.17', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('54', '20155707', '3.25', '0.00', '12.75', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('55', '20155708', '9.75', '0.00', '22.50', '0.00', '00000001.25', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('56', '20218676', '0.00', '0.00', '0.00', '0.00', '00000000.00', '1', null, null, '2015-01-01', '2015-12-31', '10');
INSERT INTO `result` VALUES ('57', '11007538', '0.00', '120.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('58', '11007541', '0.00', '194.83', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('59', '11008199', '1.50', '181.67', '4.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('60', '11008845', '0.60', '214.83', '3.40', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('61', '11009145', '1.20', '161.00', '4.40', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('62', '11009171', '0.00', '110.60', '0.00', '3.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('63', '11020249', '0.00', '207.33', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('64', '11020403', '0.00', '115.00', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('65', '11020809', '1.50', '217.17', '5.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('66', '11020958', '2.00', '99.67', '7.33', '23.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('67', '11021933', '2.00', '216.33', '9.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('68', '11021950', '1.00', '199.50', '14.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('69', '11022719', '1.00', '215.50', '0.20', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('70', '12128145', '0.00', '209.33', '0.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('71', '12138029', '0.33', '195.50', '8.33', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('72', '14000635', '0.00', '29.33', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('73', '20059615', '1.40', '213.50', '0.20', '7.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('74', '20059616', '0.00', '100.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('75', '20073800', '2.43', '217.67', '5.29', '43.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('76', '20152714', '0.00', '176.50', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('77', '20155707', '9.25', '184.83', '4.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('78', '20155708', '0.29', '186.50', '7.43', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('79', '20218676', '9.00', '140.00', '7.00', '1.00', '00000000.00', '1', null, null, '2016-01-01', '2016-12-31', '11');
INSERT INTO `result` VALUES ('80', '11007538', '0.00', '115.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('81', '11007541', '0.00', '189.83', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('82', '11008199', '1.50', '176.67', '4.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('83', '11008845', '0.60', '209.83', '3.40', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('84', '11009145', '1.20', '156.00', '4.40', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('85', '11009171', '0.00', '110.60', '0.00', '3.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('86', '11020249', '0.00', '202.33', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('87', '11020403', '0.00', '110.00', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('88', '11020809', '1.50', '212.17', '5.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('89', '11020958', '2.00', '99.67', '7.33', '23.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('90', '11021933', '2.00', '211.33', '9.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('91', '11021950', '1.00', '194.50', '14.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('92', '11022719', '1.00', '215.50', '0.20', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('93', '12128145', '0.00', '209.33', '0.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('94', '12138029', '0.33', '195.50', '8.33', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('95', '14000635', '0.00', '29.33', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('96', '20059615', '1.40', '213.50', '0.20', '7.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('97', '20059616', '0.00', '100.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('98', '20073800', '2.43', '217.67', '5.29', '43.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('99', '20152714', '0.00', '176.50', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('100', '20155707', '9.25', '184.83', '4.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('101', '20155708', '0.29', '186.50', '7.43', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('102', '20218676', '9.00', '140.00', '7.00', '1.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '11');
INSERT INTO `result` VALUES ('103', '11007538', '0.00', '115.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('104', '11007541', '0.00', '189.83', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('105', '11008199', '1.50', '176.67', '4.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('106', '11008845', '0.60', '209.83', '3.40', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('107', '11009145', '1.20', '156.00', '4.40', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('108', '11009171', '0.00', '110.60', '0.00', '3.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('109', '11020249', '0.00', '202.33', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('110', '11020403', '0.00', '110.00', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('111', '11020809', '1.50', '212.17', '5.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('112', '11020958', '2.00', '99.67', '7.33', '23.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('113', '11021933', '2.00', '211.33', '9.50', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('114', '11021950', '1.00', '194.50', '14.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('115', '11022719', '1.00', '215.50', '0.20', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('116', '12128145', '0.00', '209.33', '0.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('117', '12138029', '0.33', '195.50', '8.33', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('118', '14000635', '0.00', '29.33', '0.00', '0.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('119', '20059615', '1.40', '213.50', '0.20', '7.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('120', '20059616', '0.00', '100.00', '0.00', '20.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('121', '20073800', '2.43', '217.67', '5.29', '43.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('122', '20152714', '0.00', '176.50', '0.00', '15.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('123', '20155707', '9.25', '184.83', '4.00', '10.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('124', '20155708', '0.29', '186.50', '7.43', '5.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');
INSERT INTO `result` VALUES ('125', '20218676', '9.00', '140.00', '7.00', '1.00', '00000000.00', '1', null, null, '2016-01-01', '2016-11-11', '13');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL auto_increment,
  `reviewName` varchar(25) default NULL,
  `phase` int(11) default NULL,
  `priority` int(11) default NULL,
  PRIMARY KEY  (`reviewId`),
  KEY `123` (`phase`),
  CONSTRAINT `123` FOREIGN KEY (`phase`) REFERENCES `phase` (`phaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '设计评审', '1', '1');
INSERT INTO `review` VALUES ('2', '项目评审', '1', '2');
INSERT INTO `review` VALUES ('3', '设计评审', '2', '1');
INSERT INTO `review` VALUES ('4', '项目评审', '2', '2');
INSERT INTO `review` VALUES ('5', '设计评审', '3', '1');
INSERT INTO `review` VALUES ('6', '项目评审', '3', '2');
INSERT INTO `review` VALUES ('7', '设计评审', '4', '1');
INSERT INTO `review` VALUES ('8', '项目评审', '4', '2');
INSERT INTO `review` VALUES ('9', '设计评审', '5', '1');
INSERT INTO `review` VALUES ('10', '项目评审', '5', '2');

-- ----------------------------
-- Table structure for secondlevelscore
-- ----------------------------
DROP TABLE IF EXISTS `secondlevelscore`;
CREATE TABLE `secondlevelscore` (
  `secondLevelScoreId` int(11) NOT NULL auto_increment,
  `employee` varchar(25) default NULL,
  `oneLevel` varchar(25) default NULL,
  `secondLevel` varchar(25) default NULL,
  `score` double(11,2) default NULL,
  `mode` int(11) default NULL,
  `overallscore` int(11) default NULL,
  PRIMARY KEY  (`secondLevelScoreId`),
  KEY `sls1` (`employee`),
  KEY `sls2` (`mode`),
  KEY `sls3` (`overallscore`),
  CONSTRAINT `sls1` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `sls2` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`),
  CONSTRAINT `sls3` FOREIGN KEY (`overallscore`) REFERENCES `overallscore` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondlevelscore
-- ----------------------------
INSERT INTO `secondlevelscore` VALUES ('1', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('2', '11007538', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('3', '11007538', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('4', '11007538', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('5', '11007538', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('6', '11007538', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('7', '11007538', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('8', '11007538', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('9', '11007538', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('10', '11007538', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('11', '11007538', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('12', '11007538', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('13', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('14', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('15', '11007538', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('16', '11007538', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('17', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('18', '11007541', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('19', '11007541', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('20', '11007541', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('21', '11007541', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('22', '11007541', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('23', '11007541', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('24', '11007541', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('25', '11007541', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('26', '11007541', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('27', '11007541', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('28', '11007541', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('29', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('30', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('31', '11007541', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('32', '11007541', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('33', '11008199', '专业技术', '一般设计缺陷', '5.60', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('34', '11008199', '专业技术', '低级错误', '3.80', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('35', '11008199', '合规', '设计规定', '2.20', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('36', '11008199', '合规', '流程规定', '0.75', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('37', '11008199', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('38', '11008199', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('39', '11008199', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('40', '11008199', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('41', '11008199', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('42', '11008199', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('43', '11008199', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('44', '11008199', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('45', '11008199', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('46', '11008199', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('47', '11008199', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('48', '11008199', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('49', '11008845', '专业技术', '一般设计缺陷', '5.89', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('50', '11008845', '专业技术', '低级错误', '1.78', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('51', '11008845', '合规', '设计规定', '2.67', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('52', '11008845', '合规', '流程规定', '0.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('53', '11008845', '沟通管理', '工作积极性', '0.17', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('54', '11008845', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('55', '11008845', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('56', '11008845', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('57', '11008845', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('58', '11008845', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('59', '11008845', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('60', '11008845', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('61', '11008845', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('62', '11008845', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('63', '11008845', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('64', '11008845', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('65', '11009145', '专业技术', '一般设计缺陷', '6.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('66', '11009145', '专业技术', '低级错误', '5.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('67', '11009145', '合规', '设计规定', '5.29', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('68', '11009145', '合规', '流程规定', '1.29', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('69', '11009145', '沟通管理', '工作积极性', '0.43', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('70', '11009145', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('71', '11009145', '沟通管理', '工作计划性', '0.29', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('72', '11009145', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('73', '11009145', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('74', '11009145', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('75', '11009145', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('76', '11009145', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('77', '11009145', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('78', '11009145', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('79', '11009145', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('80', '11009145', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('81', '11009171', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('82', '11009171', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('83', '11009171', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('84', '11009171', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('85', '11009171', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('86', '11009171', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('87', '11009171', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('88', '11009171', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('89', '11009171', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('90', '11009171', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('91', '11009171', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('92', '11009171', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('93', '11009171', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('94', '11009171', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('95', '11009171', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('96', '11009171', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('97', '11020249', '专业技术', '一般设计缺陷', '1.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('98', '11020249', '专业技术', '低级错误', '4.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('99', '11020249', '合规', '设计规定', '3.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('100', '11020249', '合规', '流程规定', '0.30', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('101', '11020249', '沟通管理', '工作积极性', '0.20', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('102', '11020249', '沟通管理', '沟通能力', '0.30', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('103', '11020249', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('104', '11020249', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('105', '11020249', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('106', '11020249', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('107', '11020249', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('108', '11020249', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('109', '11020249', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('110', '11020249', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('111', '11020249', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('112', '11020249', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('113', '11020403', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('114', '11020403', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('115', '11020403', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('116', '11020403', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('117', '11020403', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('118', '11020403', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('119', '11020403', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('120', '11020403', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('121', '11020403', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('122', '11020403', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('123', '11020403', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('124', '11020403', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('125', '11020403', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('126', '11020403', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('127', '11020403', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('128', '11020403', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('129', '11020809', '专业技术', '一般设计缺陷', '4.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('130', '11020809', '专业技术', '低级错误', '3.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('131', '11020809', '合规', '设计规定', '2.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('132', '11020809', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('133', '11020809', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('134', '11020809', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('135', '11020809', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('136', '11020809', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('137', '11020809', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('138', '11020809', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('139', '11020809', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('140', '11020809', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('141', '11020809', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('142', '11020809', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('143', '11020809', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('144', '11020809', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('145', '11020958', '专业技术', '一般设计缺陷', '14.33', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('146', '11020958', '专业技术', '低级错误', '3.17', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('147', '11020958', '合规', '设计规定', '7.67', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('148', '11020958', '合规', '流程规定', '0.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('149', '11020958', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('150', '11020958', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('151', '11020958', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('152', '11020958', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('153', '11020958', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('154', '11020958', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('155', '11020958', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('156', '11020958', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('157', '11020958', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('158', '11020958', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('159', '11020958', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('160', '11020958', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('161', '11021933', '专业技术', '一般设计缺陷', '12.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('162', '11021933', '专业技术', '低级错误', '1.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('163', '11021933', '合规', '设计规定', '6.25', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('164', '11021933', '合规', '流程规定', '1.80', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('165', '11021933', '沟通管理', '工作积极性', '0.30', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('166', '11021933', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('167', '11021933', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('168', '11021933', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('169', '11021933', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('170', '11021933', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('171', '11021933', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('172', '11021933', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('173', '11021933', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('174', '11021933', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('175', '11021933', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('176', '11021933', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('177', '11021950', '专业技术', '一般设计缺陷', '2.83', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('178', '11021950', '专业技术', '低级错误', '3.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('179', '11021950', '合规', '设计规定', '2.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('180', '11021950', '合规', '流程规定', '0.38', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('181', '11021950', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('182', '11021950', '沟通管理', '沟通能力', '0.25', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('183', '11021950', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('184', '11021950', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('185', '11021950', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('186', '11021950', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('187', '11021950', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('188', '11021950', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('189', '11021950', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('190', '11021950', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('191', '11021950', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('192', '11021950', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('193', '11022719', '专业技术', '一般设计缺陷', '1.33', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('194', '11022719', '专业技术', '低级错误', '2.67', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('195', '11022719', '合规', '设计规定', '1.33', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('196', '11022719', '合规', '流程规定', '0.46', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('197', '11022719', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('198', '11022719', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('199', '11022719', '沟通管理', '工作计划性', '0.23', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('200', '11022719', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('201', '11022719', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('202', '11022719', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('203', '11022719', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('204', '11022719', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('205', '11022719', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('206', '11022719', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('207', '11022719', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('208', '11022719', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('209', '12128145', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('210', '12128145', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('211', '12128145', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('212', '12128145', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('213', '12128145', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('214', '12128145', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('215', '12128145', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('216', '12128145', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('217', '12128145', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('218', '12128145', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('219', '12128145', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('220', '12128145', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('221', '12128145', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('222', '12128145', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('223', '12128145', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('224', '12128145', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('225', '12138029', '专业技术', '一般设计缺陷', '14.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('226', '12138029', '专业技术', '低级错误', '5.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('227', '12138029', '合规', '设计规定', '9.75', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('228', '12138029', '合规', '流程规定', '1.20', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('229', '12138029', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('230', '12138029', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('231', '12138029', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('232', '12138029', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('233', '12138029', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('234', '12138029', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('235', '12138029', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('236', '12138029', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('237', '12138029', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('238', '12138029', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('239', '12138029', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('240', '12138029', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('241', '14000635', '专业技术', '一般设计缺陷', '23.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('242', '14000635', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('243', '14000635', '合规', '设计规定', '5.56', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('244', '14000635', '合规', '流程规定', '1.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('245', '14000635', '沟通管理', '工作积极性', '0.56', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('246', '14000635', '沟通管理', '沟通能力', '0.22', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('247', '14000635', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('248', '14000635', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('249', '14000635', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('250', '14000635', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('251', '14000635', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('252', '14000635', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('253', '14000635', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('254', '14000635', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('255', '14000635', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('256', '14000635', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('257', '20059615', '专业技术', '一般设计缺陷', '5.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('258', '20059615', '专业技术', '低级错误', '7.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('259', '20059615', '合规', '设计规定', '3.87', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('260', '20059615', '合规', '流程规定', '0.20', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('261', '20059615', '沟通管理', '工作积极性', '0.13', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('262', '20059615', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('263', '20059615', '沟通管理', '工作计划性', '0.20', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('264', '20059615', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('265', '20059615', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('266', '20059615', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('267', '20059615', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('268', '20059615', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('269', '20059615', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('270', '20059615', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('271', '20059615', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('272', '20059615', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('273', '20059616', '专业技术', '一般设计缺陷', '4.10', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('274', '20059616', '专业技术', '低级错误', '1.30', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('275', '20059616', '合规', '设计规定', '1.90', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('276', '20059616', '合规', '流程规定', '0.63', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('277', '20059616', '沟通管理', '工作积极性', '0.13', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('278', '20059616', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('279', '20059616', '沟通管理', '工作计划性', '0.25', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('280', '20059616', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('281', '20059616', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('282', '20059616', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('283', '20059616', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('284', '20059616', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('285', '20059616', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('286', '20059616', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('287', '20059616', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('288', '20059616', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('289', '20073800', '专业技术', '一般设计缺陷', '13.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('290', '20073800', '专业技术', '低级错误', '2.67', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('291', '20073800', '合规', '设计规定', '2.43', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('292', '20073800', '合规', '流程规定', '0.60', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('293', '20073800', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('294', '20073800', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('295', '20073800', '沟通管理', '工作计划性', '0.60', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('296', '20073800', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('297', '20073800', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('298', '20073800', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('299', '20073800', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('300', '20073800', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('301', '20073800', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('302', '20073800', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('303', '20073800', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('304', '20073800', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('305', '20152714', '专业技术', '一般设计缺陷', '11.67', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('306', '20152714', '专业技术', '低级错误', '3.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('307', '20152714', '合规', '设计规定', '3.93', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('308', '20152714', '合规', '流程规定', '1.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('309', '20152714', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('310', '20152714', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('311', '20152714', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('312', '20152714', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('313', '20152714', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('314', '20152714', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('315', '20152714', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('316', '20152714', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('317', '20152714', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('318', '20152714', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('319', '20152714', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('320', '20152714', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('321', '20155707', '专业技术', '一般设计缺陷', '10.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('322', '20155707', '专业技术', '低级错误', '2.75', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('323', '20155707', '合规', '设计规定', '3.25', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('324', '20155707', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('325', '20155707', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('326', '20155707', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('327', '20155707', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('328', '20155707', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('329', '20155707', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('330', '20155707', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('331', '20155707', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('332', '20155707', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('333', '20155707', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('334', '20155707', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('335', '20155707', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('336', '20155707', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('337', '20155708', '专业技术', '一般设计缺陷', '14.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('338', '20155708', '专业技术', '低级错误', '8.50', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('339', '20155708', '合规', '设计规定', '9.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('340', '20155708', '合规', '流程规定', '0.75', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('341', '20155708', '沟通管理', '工作积极性', '1.25', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('342', '20155708', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('343', '20155708', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('344', '20155708', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('345', '20155708', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('346', '20155708', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('347', '20155708', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('348', '20155708', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('349', '20155708', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('350', '20155708', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('351', '20155708', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('352', '20155708', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('353', '20218676', '专业技术', '一般设计缺陷', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('354', '20218676', '专业技术', '低级错误', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('355', '20218676', '合规', '设计规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('356', '20218676', '合规', '流程规定', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('357', '20218676', '沟通管理', '工作积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('358', '20218676', '沟通管理', '沟通能力', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('359', '20218676', '沟通管理', '工作计划性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('360', '20218676', '自我成长', '学习积极性', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('361', '20218676', '自我成长', '考试', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('362', '20218676', '对公司的贡献', '专利', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('363', '20218676', '对公司的贡献', '经验库', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('364', '20218676', '对公司的贡献', '标准化', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('365', '20218676', '对公司的贡献', '重要信息收集', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('366', '20218676', '对公司的贡献', '项目文档', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('367', '20218676', '对公司的贡献', '其他', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('368', '20218676', '对公司的贡献', '培训', '0.00', '1', '1');
INSERT INTO `secondlevelscore` VALUES ('369', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('370', '11007538', '专业技术', '低级错误', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('371', '11007538', '合规', '设计规定', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('372', '11007538', '合规', '流程规定', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('373', '11007538', '沟通管理', '工作积极性', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('374', '11007538', '沟通管理', '沟通能力', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('375', '11007538', '沟通管理', '工作计划性', '0.00', '1', '2');
INSERT INTO `secondlevelscore` VALUES ('376', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('377', '11007538', '专业技术', '低级错误', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('378', '11007538', '合规', '设计规定', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('379', '11007538', '合规', '流程规定', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('380', '11007538', '沟通管理', '工作积极性', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('381', '11007538', '沟通管理', '沟通能力', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('382', '11007538', '沟通管理', '工作计划性', '0.00', '1', '3');
INSERT INTO `secondlevelscore` VALUES ('383', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('384', '11007538', '专业技术', '低级错误', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('385', '11007538', '合规', '设计规定', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('386', '11007538', '合规', '流程规定', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('387', '11007538', '沟通管理', '工作积极性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('388', '11007538', '沟通管理', '沟通能力', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('389', '11007538', '沟通管理', '工作计划性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('390', '11007538', '自我成长', '学习积极性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('391', '11007538', '自我成长', '考试', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('392', '11007538', '对公司的贡献', '专利', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('393', '11007538', '对公司的贡献', '经验库', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('394', '11007538', '对公司的贡献', '标准化', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('395', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('396', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('397', '11007538', '对公司的贡献', '其他', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('398', '11007538', '对公司的贡献', '培训', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('399', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('400', '11007541', '专业技术', '低级错误', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('401', '11007541', '合规', '设计规定', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('402', '11007541', '合规', '流程规定', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('403', '11007541', '沟通管理', '工作积极性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('404', '11007541', '沟通管理', '沟通能力', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('405', '11007541', '沟通管理', '工作计划性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('406', '11007541', '自我成长', '学习积极性', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('407', '11007541', '自我成长', '考试', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('408', '11007541', '对公司的贡献', '专利', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('409', '11007541', '对公司的贡献', '经验库', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('410', '11007541', '对公司的贡献', '标准化', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('411', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('412', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('413', '11007541', '对公司的贡献', '其他', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('414', '11007541', '对公司的贡献', '培训', '0.00', '1', '4');
INSERT INTO `secondlevelscore` VALUES ('415', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('416', '11007538', '专业技术', '低级错误', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('417', '11007538', '合规', '设计规定', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('418', '11007538', '合规', '流程规定', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('419', '11007538', '沟通管理', '工作积极性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('420', '11007538', '沟通管理', '沟通能力', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('421', '11007538', '沟通管理', '工作计划性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('422', '11007538', '自我成长', '学习积极性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('423', '11007538', '自我成长', '考试', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('424', '11007538', '对公司的贡献', '专利', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('425', '11007538', '对公司的贡献', '经验库', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('426', '11007538', '对公司的贡献', '标准化', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('427', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('428', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('429', '11007538', '对公司的贡献', '其他', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('430', '11007538', '对公司的贡献', '培训', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('431', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('432', '11007541', '专业技术', '低级错误', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('433', '11007541', '合规', '设计规定', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('434', '11007541', '合规', '流程规定', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('435', '11007541', '沟通管理', '工作积极性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('436', '11007541', '沟通管理', '沟通能力', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('437', '11007541', '沟通管理', '工作计划性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('438', '11007541', '自我成长', '学习积极性', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('439', '11007541', '自我成长', '考试', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('440', '11007541', '对公司的贡献', '专利', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('441', '11007541', '对公司的贡献', '经验库', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('442', '11007541', '对公司的贡献', '标准化', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('443', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('444', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('445', '11007541', '对公司的贡献', '其他', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('446', '11007541', '对公司的贡献', '培训', '0.00', '1', '5');
INSERT INTO `secondlevelscore` VALUES ('447', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('448', '11007538', '专业技术', '低级错误', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('449', '11007538', '合规', '设计规定', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('450', '11007538', '合规', '流程规定', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('451', '11007538', '沟通管理', '工作积极性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('452', '11007538', '沟通管理', '沟通能力', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('453', '11007538', '沟通管理', '工作计划性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('454', '11007538', '自我成长', '学习积极性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('455', '11007538', '自我成长', '考试', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('456', '11007538', '对公司的贡献', '专利', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('457', '11007538', '对公司的贡献', '经验库', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('458', '11007538', '对公司的贡献', '标准化', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('459', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('460', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('461', '11007538', '对公司的贡献', '其他', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('462', '11007538', '对公司的贡献', '培训', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('463', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('464', '11007541', '专业技术', '低级错误', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('465', '11007541', '合规', '设计规定', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('466', '11007541', '合规', '流程规定', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('467', '11007541', '沟通管理', '工作积极性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('468', '11007541', '沟通管理', '沟通能力', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('469', '11007541', '沟通管理', '工作计划性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('470', '11007541', '自我成长', '学习积极性', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('471', '11007541', '自我成长', '考试', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('472', '11007541', '对公司的贡献', '专利', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('473', '11007541', '对公司的贡献', '经验库', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('474', '11007541', '对公司的贡献', '标准化', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('475', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('476', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('477', '11007541', '对公司的贡献', '其他', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('478', '11007541', '对公司的贡献', '培训', '0.00', '1', '6');
INSERT INTO `secondlevelscore` VALUES ('479', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('480', '11007538', '专业技术', '低级错误', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('481', '11007538', '合规', '设计规定', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('482', '11007538', '合规', '流程规定', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('483', '11007538', '沟通管理', '工作积极性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('484', '11007538', '沟通管理', '沟通能力', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('485', '11007538', '沟通管理', '工作计划性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('486', '11007538', '自我成长', '学习积极性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('487', '11007538', '自我成长', '考试', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('488', '11007538', '对公司的贡献', '专利', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('489', '11007538', '对公司的贡献', '经验库', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('490', '11007538', '对公司的贡献', '标准化', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('491', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('492', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('493', '11007538', '对公司的贡献', '其他', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('494', '11007538', '对公司的贡献', '培训', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('495', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('496', '11007541', '专业技术', '低级错误', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('497', '11007541', '合规', '设计规定', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('498', '11007541', '合规', '流程规定', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('499', '11007541', '沟通管理', '工作积极性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('500', '11007541', '沟通管理', '沟通能力', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('501', '11007541', '沟通管理', '工作计划性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('502', '11007541', '自我成长', '学习积极性', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('503', '11007541', '自我成长', '考试', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('504', '11007541', '对公司的贡献', '专利', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('505', '11007541', '对公司的贡献', '经验库', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('506', '11007541', '对公司的贡献', '标准化', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('507', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('508', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('509', '11007541', '对公司的贡献', '其他', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('510', '11007541', '对公司的贡献', '培训', '0.00', '1', '7');
INSERT INTO `secondlevelscore` VALUES ('511', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('512', '11007538', '专业技术', '低级错误', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('513', '11007538', '合规', '设计规定', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('514', '11007538', '合规', '流程规定', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('515', '11007538', '沟通管理', '工作积极性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('516', '11007538', '沟通管理', '沟通能力', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('517', '11007538', '沟通管理', '工作计划性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('518', '11007538', '自我成长', '学习积极性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('519', '11007538', '自我成长', '考试', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('520', '11007538', '对公司的贡献', '专利', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('521', '11007538', '对公司的贡献', '经验库', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('522', '11007538', '对公司的贡献', '标准化', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('523', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('524', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('525', '11007538', '对公司的贡献', '其他', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('526', '11007538', '对公司的贡献', '培训', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('527', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('528', '11007541', '专业技术', '低级错误', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('529', '11007541', '合规', '设计规定', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('530', '11007541', '合规', '流程规定', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('531', '11007541', '沟通管理', '工作积极性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('532', '11007541', '沟通管理', '沟通能力', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('533', '11007541', '沟通管理', '工作计划性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('534', '11007541', '自我成长', '学习积极性', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('535', '11007541', '自我成长', '考试', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('536', '11007541', '对公司的贡献', '专利', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('537', '11007541', '对公司的贡献', '经验库', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('538', '11007541', '对公司的贡献', '标准化', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('539', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('540', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('541', '11007541', '对公司的贡献', '其他', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('542', '11007541', '对公司的贡献', '培训', '0.00', '1', '8');
INSERT INTO `secondlevelscore` VALUES ('543', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('544', '11007538', '专业技术', '低级错误', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('545', '11007538', '合规', '设计规定', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('546', '11007538', '合规', '流程规定', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('547', '11007538', '沟通管理', '工作积极性', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('548', '11007538', '沟通管理', '沟通能力', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('549', '11007538', '沟通管理', '工作计划性', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('550', '11007538', '自我成长', '学习积极性', '120.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('551', '11007538', '自我成长', '考试', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('552', '11007538', '对公司的贡献', '专利', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('553', '11007538', '对公司的贡献', '经验库', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('554', '11007538', '对公司的贡献', '标准化', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('555', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('556', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('557', '11007538', '对公司的贡献', '其他', '0.00', '1', '9');
INSERT INTO `secondlevelscore` VALUES ('558', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('559', '11007538', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('560', '11007538', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('561', '11007538', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('562', '11007538', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('563', '11007538', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('564', '11007538', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('565', '11007538', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('566', '11007538', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('567', '11007538', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('568', '11007538', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('569', '11007538', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('570', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('571', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('572', '11007538', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('573', '11007538', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('574', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('575', '11007541', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('576', '11007541', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('577', '11007541', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('578', '11007541', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('579', '11007541', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('580', '11007541', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('581', '11007541', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('582', '11007541', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('583', '11007541', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('584', '11007541', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('585', '11007541', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('586', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('587', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('588', '11007541', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('589', '11007541', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('590', '11008199', '专业技术', '一般设计缺陷', '5.60', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('591', '11008199', '专业技术', '低级错误', '3.80', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('592', '11008199', '合规', '设计规定', '2.20', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('593', '11008199', '合规', '流程规定', '0.75', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('594', '11008199', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('595', '11008199', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('596', '11008199', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('597', '11008199', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('598', '11008199', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('599', '11008199', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('600', '11008199', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('601', '11008199', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('602', '11008199', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('603', '11008199', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('604', '11008199', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('605', '11008199', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('606', '11008845', '专业技术', '一般设计缺陷', '5.89', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('607', '11008845', '专业技术', '低级错误', '1.78', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('608', '11008845', '合规', '设计规定', '2.67', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('609', '11008845', '合规', '流程规定', '0.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('610', '11008845', '沟通管理', '工作积极性', '0.17', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('611', '11008845', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('612', '11008845', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('613', '11008845', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('614', '11008845', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('615', '11008845', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('616', '11008845', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('617', '11008845', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('618', '11008845', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('619', '11008845', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('620', '11008845', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('621', '11008845', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('622', '11009145', '专业技术', '一般设计缺陷', '6.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('623', '11009145', '专业技术', '低级错误', '5.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('624', '11009145', '合规', '设计规定', '5.29', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('625', '11009145', '合规', '流程规定', '1.29', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('626', '11009145', '沟通管理', '工作积极性', '0.43', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('627', '11009145', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('628', '11009145', '沟通管理', '工作计划性', '0.29', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('629', '11009145', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('630', '11009145', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('631', '11009145', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('632', '11009145', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('633', '11009145', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('634', '11009145', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('635', '11009145', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('636', '11009145', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('637', '11009145', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('638', '11009171', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('639', '11009171', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('640', '11009171', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('641', '11009171', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('642', '11009171', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('643', '11009171', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('644', '11009171', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('645', '11009171', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('646', '11009171', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('647', '11009171', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('648', '11009171', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('649', '11009171', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('650', '11009171', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('651', '11009171', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('652', '11009171', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('653', '11009171', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('654', '11020249', '专业技术', '一般设计缺陷', '1.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('655', '11020249', '专业技术', '低级错误', '4.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('656', '11020249', '合规', '设计规定', '3.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('657', '11020249', '合规', '流程规定', '0.30', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('658', '11020249', '沟通管理', '工作积极性', '0.20', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('659', '11020249', '沟通管理', '沟通能力', '0.30', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('660', '11020249', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('661', '11020249', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('662', '11020249', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('663', '11020249', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('664', '11020249', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('665', '11020249', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('666', '11020249', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('667', '11020249', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('668', '11020249', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('669', '11020249', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('670', '11020403', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('671', '11020403', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('672', '11020403', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('673', '11020403', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('674', '11020403', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('675', '11020403', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('676', '11020403', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('677', '11020403', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('678', '11020403', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('679', '11020403', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('680', '11020403', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('681', '11020403', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('682', '11020403', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('683', '11020403', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('684', '11020403', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('685', '11020403', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('686', '11020809', '专业技术', '一般设计缺陷', '4.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('687', '11020809', '专业技术', '低级错误', '3.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('688', '11020809', '合规', '设计规定', '2.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('689', '11020809', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('690', '11020809', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('691', '11020809', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('692', '11020809', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('693', '11020809', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('694', '11020809', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('695', '11020809', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('696', '11020809', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('697', '11020809', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('698', '11020809', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('699', '11020809', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('700', '11020809', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('701', '11020809', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('702', '11020958', '专业技术', '一般设计缺陷', '14.33', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('703', '11020958', '专业技术', '低级错误', '3.17', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('704', '11020958', '合规', '设计规定', '7.67', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('705', '11020958', '合规', '流程规定', '0.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('706', '11020958', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('707', '11020958', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('708', '11020958', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('709', '11020958', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('710', '11020958', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('711', '11020958', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('712', '11020958', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('713', '11020958', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('714', '11020958', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('715', '11020958', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('716', '11020958', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('717', '11020958', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('718', '11021933', '专业技术', '一般设计缺陷', '12.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('719', '11021933', '专业技术', '低级错误', '1.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('720', '11021933', '合规', '设计规定', '6.25', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('721', '11021933', '合规', '流程规定', '1.80', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('722', '11021933', '沟通管理', '工作积极性', '0.30', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('723', '11021933', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('724', '11021933', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('725', '11021933', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('726', '11021933', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('727', '11021933', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('728', '11021933', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('729', '11021933', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('730', '11021933', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('731', '11021933', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('732', '11021933', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('733', '11021933', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('734', '11021950', '专业技术', '一般设计缺陷', '2.83', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('735', '11021950', '专业技术', '低级错误', '3.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('736', '11021950', '合规', '设计规定', '2.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('737', '11021950', '合规', '流程规定', '0.38', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('738', '11021950', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('739', '11021950', '沟通管理', '沟通能力', '0.25', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('740', '11021950', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('741', '11021950', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('742', '11021950', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('743', '11021950', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('744', '11021950', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('745', '11021950', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('746', '11021950', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('747', '11021950', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('748', '11021950', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('749', '11021950', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('750', '11022719', '专业技术', '一般设计缺陷', '1.33', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('751', '11022719', '专业技术', '低级错误', '2.67', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('752', '11022719', '合规', '设计规定', '1.33', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('753', '11022719', '合规', '流程规定', '0.46', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('754', '11022719', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('755', '11022719', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('756', '11022719', '沟通管理', '工作计划性', '0.23', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('757', '11022719', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('758', '11022719', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('759', '11022719', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('760', '11022719', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('761', '11022719', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('762', '11022719', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('763', '11022719', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('764', '11022719', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('765', '11022719', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('766', '12128145', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('767', '12128145', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('768', '12128145', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('769', '12128145', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('770', '12128145', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('771', '12128145', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('772', '12128145', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('773', '12128145', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('774', '12128145', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('775', '12128145', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('776', '12128145', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('777', '12128145', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('778', '12128145', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('779', '12128145', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('780', '12128145', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('781', '12128145', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('782', '12138029', '专业技术', '一般设计缺陷', '14.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('783', '12138029', '专业技术', '低级错误', '5.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('784', '12138029', '合规', '设计规定', '9.75', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('785', '12138029', '合规', '流程规定', '1.20', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('786', '12138029', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('787', '12138029', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('788', '12138029', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('789', '12138029', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('790', '12138029', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('791', '12138029', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('792', '12138029', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('793', '12138029', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('794', '12138029', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('795', '12138029', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('796', '12138029', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('797', '12138029', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('798', '14000635', '专业技术', '一般设计缺陷', '23.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('799', '14000635', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('800', '14000635', '合规', '设计规定', '5.56', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('801', '14000635', '合规', '流程规定', '1.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('802', '14000635', '沟通管理', '工作积极性', '0.56', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('803', '14000635', '沟通管理', '沟通能力', '0.22', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('804', '14000635', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('805', '14000635', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('806', '14000635', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('807', '14000635', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('808', '14000635', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('809', '14000635', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('810', '14000635', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('811', '14000635', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('812', '14000635', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('813', '14000635', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('814', '20059615', '专业技术', '一般设计缺陷', '5.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('815', '20059615', '专业技术', '低级错误', '7.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('816', '20059615', '合规', '设计规定', '3.87', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('817', '20059615', '合规', '流程规定', '0.20', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('818', '20059615', '沟通管理', '工作积极性', '0.13', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('819', '20059615', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('820', '20059615', '沟通管理', '工作计划性', '0.20', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('821', '20059615', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('822', '20059615', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('823', '20059615', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('824', '20059615', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('825', '20059615', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('826', '20059615', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('827', '20059615', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('828', '20059615', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('829', '20059615', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('830', '20059616', '专业技术', '一般设计缺陷', '4.10', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('831', '20059616', '专业技术', '低级错误', '1.30', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('832', '20059616', '合规', '设计规定', '1.90', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('833', '20059616', '合规', '流程规定', '0.63', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('834', '20059616', '沟通管理', '工作积极性', '0.13', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('835', '20059616', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('836', '20059616', '沟通管理', '工作计划性', '0.25', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('837', '20059616', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('838', '20059616', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('839', '20059616', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('840', '20059616', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('841', '20059616', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('842', '20059616', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('843', '20059616', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('844', '20059616', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('845', '20059616', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('846', '20073800', '专业技术', '一般设计缺陷', '13.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('847', '20073800', '专业技术', '低级错误', '2.67', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('848', '20073800', '合规', '设计规定', '2.43', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('849', '20073800', '合规', '流程规定', '0.60', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('850', '20073800', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('851', '20073800', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('852', '20073800', '沟通管理', '工作计划性', '0.60', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('853', '20073800', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('854', '20073800', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('855', '20073800', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('856', '20073800', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('857', '20073800', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('858', '20073800', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('859', '20073800', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('860', '20073800', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('861', '20073800', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('862', '20152714', '专业技术', '一般设计缺陷', '11.67', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('863', '20152714', '专业技术', '低级错误', '3.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('864', '20152714', '合规', '设计规定', '3.93', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('865', '20152714', '合规', '流程规定', '1.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('866', '20152714', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('867', '20152714', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('868', '20152714', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('869', '20152714', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('870', '20152714', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('871', '20152714', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('872', '20152714', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('873', '20152714', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('874', '20152714', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('875', '20152714', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('876', '20152714', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('877', '20152714', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('878', '20155707', '专业技术', '一般设计缺陷', '10.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('879', '20155707', '专业技术', '低级错误', '2.75', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('880', '20155707', '合规', '设计规定', '3.25', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('881', '20155707', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('882', '20155707', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('883', '20155707', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('884', '20155707', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('885', '20155707', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('886', '20155707', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('887', '20155707', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('888', '20155707', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('889', '20155707', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('890', '20155707', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('891', '20155707', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('892', '20155707', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('893', '20155707', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('894', '20155708', '专业技术', '一般设计缺陷', '14.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('895', '20155708', '专业技术', '低级错误', '8.50', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('896', '20155708', '合规', '设计规定', '9.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('897', '20155708', '合规', '流程规定', '0.75', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('898', '20155708', '沟通管理', '工作积极性', '1.25', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('899', '20155708', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('900', '20155708', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('901', '20155708', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('902', '20155708', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('903', '20155708', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('904', '20155708', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('905', '20155708', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('906', '20155708', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('907', '20155708', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('908', '20155708', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('909', '20155708', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('910', '20218676', '专业技术', '一般设计缺陷', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('911', '20218676', '专业技术', '低级错误', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('912', '20218676', '合规', '设计规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('913', '20218676', '合规', '流程规定', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('914', '20218676', '沟通管理', '工作积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('915', '20218676', '沟通管理', '沟通能力', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('916', '20218676', '沟通管理', '工作计划性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('917', '20218676', '自我成长', '学习积极性', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('918', '20218676', '自我成长', '考试', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('919', '20218676', '对公司的贡献', '专利', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('920', '20218676', '对公司的贡献', '经验库', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('921', '20218676', '对公司的贡献', '标准化', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('922', '20218676', '对公司的贡献', '重要信息收集', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('923', '20218676', '对公司的贡献', '项目文档', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('924', '20218676', '对公司的贡献', '其他', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('925', '20218676', '对公司的贡献', '培训', '0.00', '1', '10');
INSERT INTO `secondlevelscore` VALUES ('926', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('927', '11007538', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('928', '11007538', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('929', '11007538', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('930', '11007538', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('931', '11007538', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('932', '11007538', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('933', '11007538', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('934', '11007538', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('935', '11007538', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('936', '11007538', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('937', '11007538', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('938', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('939', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('940', '11007538', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('941', '11007538', '对公司的贡献', '培训', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('942', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('943', '11007541', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('944', '11007541', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('945', '11007541', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('946', '11007541', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('947', '11007541', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('948', '11007541', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('949', '11007541', '自我成长', '学习积极性', '105.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('950', '11007541', '自我成长', '考试', '89.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('951', '11007541', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('952', '11007541', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('953', '11007541', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('954', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('955', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('956', '11007541', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('957', '11007541', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('958', '11008199', '专业技术', '一般设计缺陷', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('959', '11008199', '专业技术', '低级错误', '0.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('960', '11008199', '合规', '设计规定', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('961', '11008199', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('962', '11008199', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('963', '11008199', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('964', '11008199', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('965', '11008199', '自我成长', '学习积极性', '125.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('966', '11008199', '自我成长', '考试', '56.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('967', '11008199', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('968', '11008199', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('969', '11008199', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('970', '11008199', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('971', '11008199', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('972', '11008199', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('973', '11008199', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('974', '11008845', '专业技术', '一般设计缺陷', '3.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('975', '11008845', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('976', '11008845', '合规', '设计规定', '0.60', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('977', '11008845', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('978', '11008845', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('979', '11008845', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('980', '11008845', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('981', '11008845', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('982', '11008845', '自我成长', '考试', '94.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('983', '11008845', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('984', '11008845', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('985', '11008845', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('986', '11008845', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('987', '11008845', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('988', '11008845', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('989', '11008845', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('990', '11009145', '专业技术', '一般设计缺陷', '2.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('991', '11009145', '专业技术', '低级错误', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('992', '11009145', '合规', '设计规定', '1.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('993', '11009145', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('994', '11009145', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('995', '11009145', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('996', '11009145', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('997', '11009145', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('998', '11009145', '自我成长', '考试', '46.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('999', '11009145', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1000', '11009145', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1001', '11009145', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1002', '11009145', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1003', '11009145', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1004', '11009145', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1005', '11009145', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1006', '11009171', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1007', '11009171', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1008', '11009171', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1009', '11009171', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1010', '11009171', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1011', '11009171', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1012', '11009171', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1013', '11009171', '自我成长', '学习积极性', '60.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1014', '11009171', '自我成长', '考试', '50.60', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1015', '11009171', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1016', '11009171', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1017', '11009171', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1018', '11009171', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1019', '11009171', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1020', '11009171', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1021', '11009171', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1022', '11020249', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1023', '11020249', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1024', '11020249', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1025', '11020249', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1026', '11020249', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1027', '11020249', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1028', '11020249', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1029', '11020249', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1030', '11020249', '自我成长', '考试', '92.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1031', '11020249', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1032', '11020249', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1033', '11020249', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1034', '11020249', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1035', '11020249', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1036', '11020249', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1037', '11020249', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1038', '11020403', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1039', '11020403', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1040', '11020403', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1041', '11020403', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1042', '11020403', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1043', '11020403', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1044', '11020403', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1045', '11020403', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1046', '11020403', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1047', '11020403', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1048', '11020403', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1049', '11020403', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1050', '11020403', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1051', '11020403', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1052', '11020403', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1053', '11020403', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1054', '11020809', '专业技术', '一般设计缺陷', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1055', '11020809', '专业技术', '低级错误', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1056', '11020809', '合规', '设计规定', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1057', '11020809', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1058', '11020809', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1059', '11020809', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1060', '11020809', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1061', '11020809', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1062', '11020809', '自我成长', '考试', '97.17', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1063', '11020809', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1064', '11020809', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1065', '11020809', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1066', '11020809', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1067', '11020809', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1068', '11020809', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1069', '11020809', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1070', '11020958', '专业技术', '一般设计缺陷', '6.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1071', '11020958', '专业技术', '低级错误', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1072', '11020958', '合规', '设计规定', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1073', '11020958', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1074', '11020958', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1075', '11020958', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1076', '11020958', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1077', '11020958', '自我成长', '学习积极性', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1078', '11020958', '自我成长', '考试', '94.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1079', '11020958', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1080', '11020958', '对公司的贡献', '经验库', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1081', '11020958', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1082', '11020958', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1083', '11020958', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1084', '11020958', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1085', '11020958', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1086', '11021933', '专业技术', '一般设计缺陷', '9.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1087', '11021933', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1088', '11021933', '合规', '设计规定', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1089', '11021933', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1090', '11021933', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1091', '11021933', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1092', '11021933', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1093', '11021933', '自我成长', '学习积极性', '125.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1094', '11021933', '自我成长', '考试', '91.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1095', '11021933', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1096', '11021933', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1097', '11021933', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1098', '11021933', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1099', '11021933', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1100', '11021933', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1101', '11021933', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1102', '11021950', '专业技术', '一般设计缺陷', '14.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1103', '11021950', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1104', '11021950', '合规', '设计规定', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1105', '11021950', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1106', '11021950', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1107', '11021950', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1108', '11021950', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1109', '11021950', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1110', '11021950', '自我成长', '考试', '99.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1111', '11021950', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1112', '11021950', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1113', '11021950', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1114', '11021950', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1115', '11021950', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1116', '11021950', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1117', '11021950', '对公司的贡献', '培训', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1118', '11022719', '专业技术', '一般设计缺陷', '0.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1119', '11022719', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1120', '11022719', '合规', '设计规定', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1121', '11022719', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1122', '11022719', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1123', '11022719', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1124', '11022719', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1125', '11022719', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1126', '11022719', '自我成长', '考试', '95.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1127', '11022719', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1128', '11022719', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1129', '11022719', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1130', '11022719', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1131', '11022719', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1132', '11022719', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1133', '11022719', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1134', '12128145', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1135', '12128145', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1136', '12128145', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1137', '12128145', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1138', '12128145', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1139', '12128145', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1140', '12128145', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1141', '12128145', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1142', '12128145', '自我成长', '考试', '94.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1143', '12128145', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1144', '12128145', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1145', '12128145', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1146', '12128145', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1147', '12128145', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1148', '12128145', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1149', '12128145', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1150', '12138029', '专业技术', '一般设计缺陷', '4.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1151', '12138029', '专业技术', '低级错误', '3.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1152', '12138029', '合规', '设计规定', '0.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1153', '12138029', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1154', '12138029', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1155', '12138029', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1156', '12138029', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1157', '12138029', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1158', '12138029', '自我成长', '考试', '80.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1159', '12138029', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1160', '12138029', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1161', '12138029', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1162', '12138029', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1163', '12138029', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1164', '12138029', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1165', '12138029', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1166', '14000635', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1167', '14000635', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1168', '14000635', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1169', '14000635', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1170', '14000635', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1171', '14000635', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1172', '14000635', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1173', '14000635', '自我成长', '学习积极性', '15.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1174', '14000635', '自我成长', '考试', '14.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1175', '14000635', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1176', '14000635', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1177', '14000635', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1178', '14000635', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1179', '14000635', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1180', '14000635', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1181', '14000635', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1182', '20059615', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1183', '20059615', '专业技术', '低级错误', '0.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1184', '20059615', '合规', '设计规定', '1.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1185', '20059615', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1186', '20059615', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1187', '20059615', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1188', '20059615', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1189', '20059615', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1190', '20059615', '自我成长', '考试', '93.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1191', '20059615', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1192', '20059615', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1193', '20059615', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1194', '20059615', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1195', '20059615', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1196', '20059615', '对公司的贡献', '其他', '7.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1197', '20059615', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1198', '20059616', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1199', '20059616', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1200', '20059616', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1201', '20059616', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1202', '20059616', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1203', '20059616', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1204', '20059616', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1205', '20059616', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1206', '20059616', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1207', '20059616', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1208', '20059616', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1209', '20059616', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1210', '20059616', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1211', '20059616', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1212', '20059616', '对公司的贡献', '其他', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1213', '20059616', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1214', '20073800', '专业技术', '一般设计缺陷', '3.43', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1215', '20073800', '专业技术', '低级错误', '1.86', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1216', '20073800', '合规', '设计规定', '2.43', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1217', '20073800', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1218', '20073800', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1219', '20073800', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1220', '20073800', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1221', '20073800', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1222', '20073800', '自我成长', '考试', '97.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1223', '20073800', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1224', '20073800', '对公司的贡献', '经验库', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1225', '20073800', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1226', '20073800', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1227', '20073800', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1228', '20073800', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1229', '20073800', '对公司的贡献', '培训', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1230', '20152714', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1231', '20152714', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1232', '20152714', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1233', '20152714', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1234', '20152714', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1235', '20152714', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1236', '20152714', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1237', '20152714', '自我成长', '学习积极性', '85.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1238', '20152714', '自我成长', '考试', '91.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1239', '20152714', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1240', '20152714', '对公司的贡献', '经验库', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1241', '20152714', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1242', '20152714', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1243', '20152714', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1244', '20152714', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1245', '20152714', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1246', '20155707', '专业技术', '一般设计缺陷', '0.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1247', '20155707', '专业技术', '低级错误', '3.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1248', '20155707', '合规', '设计规定', '9.25', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1249', '20155707', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1250', '20155707', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1251', '20155707', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1252', '20155707', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1253', '20155707', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1254', '20155707', '自我成长', '考试', '84.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1255', '20155707', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1256', '20155707', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1257', '20155707', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1258', '20155707', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1259', '20155707', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1260', '20155707', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1261', '20155707', '对公司的贡献', '培训', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1262', '20155708', '专业技术', '一般设计缺陷', '6.71', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1263', '20155708', '专业技术', '低级错误', '0.71', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1264', '20155708', '合规', '设计规定', '0.29', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1265', '20155708', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1266', '20155708', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1267', '20155708', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1268', '20155708', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1269', '20155708', '自我成长', '学习积极性', '110.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1270', '20155708', '自我成长', '考试', '76.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1271', '20155708', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1272', '20155708', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1273', '20155708', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1274', '20155708', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1275', '20155708', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1276', '20155708', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1277', '20155708', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1278', '20218676', '专业技术', '一般设计缺陷', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1279', '20218676', '专业技术', '低级错误', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1280', '20218676', '合规', '设计规定', '9.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1281', '20218676', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1282', '20218676', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1283', '20218676', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1284', '20218676', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1285', '20218676', '自我成长', '学习积极性', '45.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1286', '20218676', '自我成长', '考试', '95.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1287', '20218676', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1288', '20218676', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1289', '20218676', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1290', '20218676', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1291', '20218676', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1292', '20218676', '对公司的贡献', '其他', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1293', '20218676', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1294', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1295', '11007538', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1296', '11007538', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1297', '11007538', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1298', '11007538', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1299', '11007538', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1300', '11007538', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1301', '11007538', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1302', '11007538', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1303', '11007538', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1304', '11007538', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1305', '11007538', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1306', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1307', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1308', '11007538', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1309', '11007538', '对公司的贡献', '培训', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1310', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1311', '11007541', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1312', '11007541', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1313', '11007541', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1314', '11007541', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1315', '11007541', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1316', '11007541', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1317', '11007541', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1318', '11007541', '自我成长', '考试', '89.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1319', '11007541', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1320', '11007541', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1321', '11007541', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1322', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1323', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1324', '11007541', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1325', '11007541', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1326', '11008199', '专业技术', '一般设计缺陷', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1327', '11008199', '专业技术', '低级错误', '0.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1328', '11008199', '合规', '设计规定', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1329', '11008199', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1330', '11008199', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1331', '11008199', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1332', '11008199', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1333', '11008199', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1334', '11008199', '自我成长', '考试', '56.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1335', '11008199', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1336', '11008199', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1337', '11008199', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1338', '11008199', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1339', '11008199', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1340', '11008199', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1341', '11008199', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1342', '11008845', '专业技术', '一般设计缺陷', '3.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1343', '11008845', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1344', '11008845', '合规', '设计规定', '0.60', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1345', '11008845', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1346', '11008845', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1347', '11008845', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1348', '11008845', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1349', '11008845', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1350', '11008845', '自我成长', '考试', '94.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1351', '11008845', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1352', '11008845', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1353', '11008845', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1354', '11008845', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1355', '11008845', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1356', '11008845', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1357', '11008845', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1358', '11009145', '专业技术', '一般设计缺陷', '2.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1359', '11009145', '专业技术', '低级错误', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1360', '11009145', '合规', '设计规定', '1.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1361', '11009145', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1362', '11009145', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1363', '11009145', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1364', '11009145', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1365', '11009145', '自我成长', '学习积极性', '110.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1366', '11009145', '自我成长', '考试', '46.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1367', '11009145', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1368', '11009145', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1369', '11009145', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1370', '11009145', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1371', '11009145', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1372', '11009145', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1373', '11009145', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1374', '11009171', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1375', '11009171', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1376', '11009171', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1377', '11009171', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1378', '11009171', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1379', '11009171', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1380', '11009171', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1381', '11009171', '自我成长', '学习积极性', '60.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1382', '11009171', '自我成长', '考试', '50.60', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1383', '11009171', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1384', '11009171', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1385', '11009171', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1386', '11009171', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1387', '11009171', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1388', '11009171', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1389', '11009171', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1390', '11020249', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1391', '11020249', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1392', '11020249', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1393', '11020249', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1394', '11020249', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1395', '11020249', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1396', '11020249', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1397', '11020249', '自我成长', '学习积极性', '110.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1398', '11020249', '自我成长', '考试', '92.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1399', '11020249', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1400', '11020249', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1401', '11020249', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1402', '11020249', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1403', '11020249', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1404', '11020249', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1405', '11020249', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1406', '11020403', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1407', '11020403', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1408', '11020403', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1409', '11020403', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1410', '11020403', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1411', '11020403', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1412', '11020403', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1413', '11020403', '自我成长', '学习积极性', '110.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1414', '11020403', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1415', '11020403', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1416', '11020403', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1417', '11020403', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1418', '11020403', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1419', '11020403', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1420', '11020403', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1421', '11020403', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1422', '11020809', '专业技术', '一般设计缺陷', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1423', '11020809', '专业技术', '低级错误', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1424', '11020809', '合规', '设计规定', '1.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1425', '11020809', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1426', '11020809', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1427', '11020809', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1428', '11020809', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1429', '11020809', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1430', '11020809', '自我成长', '考试', '97.17', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1431', '11020809', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1432', '11020809', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1433', '11020809', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1434', '11020809', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1435', '11020809', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1436', '11020809', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1437', '11020809', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1438', '11020958', '专业技术', '一般设计缺陷', '6.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1439', '11020958', '专业技术', '低级错误', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1440', '11020958', '合规', '设计规定', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1441', '11020958', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1442', '11020958', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1443', '11020958', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1444', '11020958', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1445', '11020958', '自我成长', '学习积极性', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1446', '11020958', '自我成长', '考试', '94.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1447', '11020958', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1448', '11020958', '对公司的贡献', '经验库', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1449', '11020958', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1450', '11020958', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1451', '11020958', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1452', '11020958', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1453', '11020958', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1454', '11021933', '专业技术', '一般设计缺陷', '9.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1455', '11021933', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1456', '11021933', '合规', '设计规定', '2.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1457', '11021933', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1458', '11021933', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1459', '11021933', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1460', '11021933', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1461', '11021933', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1462', '11021933', '自我成长', '考试', '91.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1463', '11021933', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1464', '11021933', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1465', '11021933', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1466', '11021933', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1467', '11021933', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1468', '11021933', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1469', '11021933', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1470', '11021950', '专业技术', '一般设计缺陷', '14.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1471', '11021950', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1472', '11021950', '合规', '设计规定', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1473', '11021950', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1474', '11021950', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1475', '11021950', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1476', '11021950', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1477', '11021950', '自我成长', '学习积极性', '95.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1478', '11021950', '自我成长', '考试', '99.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1479', '11021950', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1480', '11021950', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1481', '11021950', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1482', '11021950', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1483', '11021950', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1484', '11021950', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1485', '11021950', '对公司的贡献', '培训', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1486', '11022719', '专业技术', '一般设计缺陷', '0.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1487', '11022719', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1488', '11022719', '合规', '设计规定', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1489', '11022719', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1490', '11022719', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1491', '11022719', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1492', '11022719', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1493', '11022719', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1494', '11022719', '自我成长', '考试', '95.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1495', '11022719', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1496', '11022719', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1497', '11022719', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1498', '11022719', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1499', '11022719', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1500', '11022719', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1501', '11022719', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1502', '12128145', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1503', '12128145', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1504', '12128145', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1505', '12128145', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1506', '12128145', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1507', '12128145', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1508', '12128145', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1509', '12128145', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1510', '12128145', '自我成长', '考试', '94.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1511', '12128145', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1512', '12128145', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1513', '12128145', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1514', '12128145', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1515', '12128145', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1516', '12128145', '对公司的贡献', '其他', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1517', '12128145', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1518', '12138029', '专业技术', '一般设计缺陷', '4.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1519', '12138029', '专业技术', '低级错误', '3.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1520', '12138029', '合规', '设计规定', '0.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1521', '12138029', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1522', '12138029', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1523', '12138029', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1524', '12138029', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1525', '12138029', '自我成长', '学习积极性', '115.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1526', '12138029', '自我成长', '考试', '80.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1527', '12138029', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1528', '12138029', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1529', '12138029', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1530', '12138029', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1531', '12138029', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1532', '12138029', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1533', '12138029', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1534', '14000635', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1535', '14000635', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1536', '14000635', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1537', '14000635', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1538', '14000635', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1539', '14000635', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1540', '14000635', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1541', '14000635', '自我成长', '学习积极性', '15.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1542', '14000635', '自我成长', '考试', '14.33', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1543', '14000635', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1544', '14000635', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1545', '14000635', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1546', '14000635', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1547', '14000635', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1548', '14000635', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1549', '14000635', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1550', '20059615', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1551', '20059615', '专业技术', '低级错误', '0.20', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1552', '20059615', '合规', '设计规定', '1.40', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1553', '20059615', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1554', '20059615', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1555', '20059615', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1556', '20059615', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1557', '20059615', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1558', '20059615', '自我成长', '考试', '93.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1559', '20059615', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1560', '20059615', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1561', '20059615', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1562', '20059615', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1563', '20059615', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1564', '20059615', '对公司的贡献', '其他', '7.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1565', '20059615', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1566', '20059616', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1567', '20059616', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1568', '20059616', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1569', '20059616', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1570', '20059616', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1571', '20059616', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1572', '20059616', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1573', '20059616', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1574', '20059616', '自我成长', '考试', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1575', '20059616', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1576', '20059616', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1577', '20059616', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1578', '20059616', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1579', '20059616', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1580', '20059616', '对公司的贡献', '其他', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1581', '20059616', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1582', '20073800', '专业技术', '一般设计缺陷', '3.43', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1583', '20073800', '专业技术', '低级错误', '1.86', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1584', '20073800', '合规', '设计规定', '2.43', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1585', '20073800', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1586', '20073800', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1587', '20073800', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1588', '20073800', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1589', '20073800', '自我成长', '学习积极性', '120.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1590', '20073800', '自我成长', '考试', '97.67', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1591', '20073800', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1592', '20073800', '对公司的贡献', '经验库', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1593', '20073800', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1594', '20073800', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1595', '20073800', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1596', '20073800', '对公司的贡献', '其他', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1597', '20073800', '对公司的贡献', '培训', '20.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1598', '20152714', '专业技术', '一般设计缺陷', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1599', '20152714', '专业技术', '低级错误', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1600', '20152714', '合规', '设计规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1601', '20152714', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1602', '20152714', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1603', '20152714', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1604', '20152714', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1605', '20152714', '自我成长', '学习积极性', '85.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1606', '20152714', '自我成长', '考试', '91.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1607', '20152714', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1608', '20152714', '对公司的贡献', '经验库', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1609', '20152714', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1610', '20152714', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1611', '20152714', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1612', '20152714', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1613', '20152714', '对公司的贡献', '培训', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1614', '20155707', '专业技术', '一般设计缺陷', '0.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1615', '20155707', '专业技术', '低级错误', '3.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1616', '20155707', '合规', '设计规定', '9.25', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1617', '20155707', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1618', '20155707', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1619', '20155707', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1620', '20155707', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1621', '20155707', '自我成长', '学习积极性', '100.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1622', '20155707', '自我成长', '考试', '84.83', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1623', '20155707', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1624', '20155707', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1625', '20155707', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1626', '20155707', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1627', '20155707', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1628', '20155707', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1629', '20155707', '对公司的贡献', '培训', '10.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1630', '20155708', '专业技术', '一般设计缺陷', '6.71', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1631', '20155708', '专业技术', '低级错误', '0.71', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1632', '20155708', '合规', '设计规定', '0.29', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1633', '20155708', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1634', '20155708', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1635', '20155708', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1636', '20155708', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1637', '20155708', '自我成长', '学习积极性', '110.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1638', '20155708', '自我成长', '考试', '76.50', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1639', '20155708', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1640', '20155708', '对公司的贡献', '经验库', '5.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1641', '20155708', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1642', '20155708', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1643', '20155708', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1644', '20155708', '对公司的贡献', '其他', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1645', '20155708', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1646', '20218676', '专业技术', '一般设计缺陷', '3.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1647', '20218676', '专业技术', '低级错误', '4.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1648', '20218676', '合规', '设计规定', '9.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1649', '20218676', '合规', '流程规定', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1650', '20218676', '沟通管理', '工作积极性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1651', '20218676', '沟通管理', '沟通能力', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1652', '20218676', '沟通管理', '工作计划性', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1653', '20218676', '自我成长', '学习积极性', '45.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1654', '20218676', '自我成长', '考试', '95.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1655', '20218676', '对公司的贡献', '专利', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1656', '20218676', '对公司的贡献', '经验库', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1657', '20218676', '对公司的贡献', '标准化', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1658', '20218676', '对公司的贡献', '重要信息收集', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1659', '20218676', '对公司的贡献', '项目文档', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1660', '20218676', '对公司的贡献', '其他', '1.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1661', '20218676', '对公司的贡献', '培训', '0.00', '1', '11');
INSERT INTO `secondlevelscore` VALUES ('1662', '11007538', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1663', '11007538', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1664', '11007538', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1665', '11007538', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1666', '11007538', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1667', '11007538', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1668', '11007538', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1669', '11007538', '自我成长', '学习积极性', '115.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1670', '11007538', '自我成长', '考试', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1671', '11007538', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1672', '11007538', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1673', '11007538', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1674', '11007538', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1675', '11007538', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1676', '11007538', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1677', '11007538', '对公司的贡献', '培训', '20.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1678', '11007541', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1679', '11007541', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1680', '11007541', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1681', '11007541', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1682', '11007541', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1683', '11007541', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1684', '11007541', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1685', '11007541', '自我成长', '学习积极性', '100.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1686', '11007541', '自我成长', '考试', '89.83', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1687', '11007541', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1688', '11007541', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1689', '11007541', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1690', '11007541', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1691', '11007541', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1692', '11007541', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1693', '11007541', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1694', '11008199', '专业技术', '一般设计缺陷', '4.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1695', '11008199', '专业技术', '低级错误', '0.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1696', '11008199', '合规', '设计规定', '1.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1697', '11008199', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1698', '11008199', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1699', '11008199', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1700', '11008199', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1701', '11008199', '自我成长', '学习积极性', '120.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1702', '11008199', '自我成长', '考试', '56.67', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1703', '11008199', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1704', '11008199', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1705', '11008199', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1706', '11008199', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1707', '11008199', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1708', '11008199', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1709', '11008199', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1710', '11008845', '专业技术', '一般设计缺陷', '3.40', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1711', '11008845', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1712', '11008845', '合规', '设计规定', '0.60', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1713', '11008845', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1714', '11008845', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1715', '11008845', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1716', '11008845', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1717', '11008845', '自我成长', '学习积极性', '115.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1718', '11008845', '自我成长', '考试', '94.83', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1719', '11008845', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1720', '11008845', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1721', '11008845', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1722', '11008845', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1723', '11008845', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1724', '11008845', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1725', '11008845', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1726', '11009145', '专业技术', '一般设计缺陷', '2.40', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1727', '11009145', '专业技术', '低级错误', '2.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1728', '11009145', '合规', '设计规定', '1.20', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1729', '11009145', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1730', '11009145', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1731', '11009145', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1732', '11009145', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1733', '11009145', '自我成长', '学习积极性', '110.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1734', '11009145', '自我成长', '考试', '46.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1735', '11009145', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1736', '11009145', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1737', '11009145', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1738', '11009145', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1739', '11009145', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1740', '11009145', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1741', '11009145', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1742', '11009171', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1743', '11009171', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1744', '11009171', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1745', '11009171', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1746', '11009171', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1747', '11009171', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1748', '11009171', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1749', '11009171', '自我成长', '学习积极性', '60.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1750', '11009171', '自我成长', '考试', '50.60', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1751', '11009171', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1752', '11009171', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1753', '11009171', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1754', '11009171', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1755', '11009171', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1756', '11009171', '对公司的贡献', '其他', '3.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1757', '11009171', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1758', '11020249', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1759', '11020249', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1760', '11020249', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1761', '11020249', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1762', '11020249', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1763', '11020249', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1764', '11020249', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1765', '11020249', '自我成长', '学习积极性', '110.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1766', '11020249', '自我成长', '考试', '92.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1767', '11020249', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1768', '11020249', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1769', '11020249', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1770', '11020249', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1771', '11020249', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1772', '11020249', '对公司的贡献', '其他', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1773', '11020249', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1774', '11020403', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1775', '11020403', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1776', '11020403', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1777', '11020403', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1778', '11020403', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1779', '11020403', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1780', '11020403', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1781', '11020403', '自我成长', '学习积极性', '110.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1782', '11020403', '自我成长', '考试', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1783', '11020403', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1784', '11020403', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1785', '11020403', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1786', '11020403', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1787', '11020403', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1788', '11020403', '对公司的贡献', '其他', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1789', '11020403', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1790', '11020809', '专业技术', '一般设计缺陷', '1.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1791', '11020809', '专业技术', '低级错误', '4.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1792', '11020809', '合规', '设计规定', '1.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1793', '11020809', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1794', '11020809', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1795', '11020809', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1796', '11020809', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1797', '11020809', '自我成长', '学习积极性', '115.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1798', '11020809', '自我成长', '考试', '97.17', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1799', '11020809', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1800', '11020809', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1801', '11020809', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1802', '11020809', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1803', '11020809', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1804', '11020809', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1805', '11020809', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1806', '11020958', '专业技术', '一般设计缺陷', '6.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1807', '11020958', '专业技术', '低级错误', '1.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1808', '11020958', '合规', '设计规定', '2.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1809', '11020958', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1810', '11020958', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1811', '11020958', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1812', '11020958', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1813', '11020958', '自我成长', '学习积极性', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1814', '11020958', '自我成长', '考试', '94.67', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1815', '11020958', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1816', '11020958', '对公司的贡献', '经验库', '20.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1817', '11020958', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1818', '11020958', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1819', '11020958', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1820', '11020958', '对公司的贡献', '其他', '3.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1821', '11020958', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1822', '11021933', '专业技术', '一般设计缺陷', '9.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1823', '11021933', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1824', '11021933', '合规', '设计规定', '2.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1825', '11021933', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1826', '11021933', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1827', '11021933', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1828', '11021933', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1829', '11021933', '自我成长', '学习积极性', '120.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1830', '11021933', '自我成长', '考试', '91.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1831', '11021933', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1832', '11021933', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1833', '11021933', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1834', '11021933', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1835', '11021933', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1836', '11021933', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1837', '11021933', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1838', '11021950', '专业技术', '一般设计缺陷', '14.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1839', '11021950', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1840', '11021950', '合规', '设计规定', '1.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1841', '11021950', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1842', '11021950', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1843', '11021950', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1844', '11021950', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1845', '11021950', '自我成长', '学习积极性', '95.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1846', '11021950', '自我成长', '考试', '99.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1847', '11021950', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1848', '11021950', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1849', '11021950', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1850', '11021950', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1851', '11021950', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1852', '11021950', '对公司的贡献', '其他', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1853', '11021950', '对公司的贡献', '培训', '10.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1854', '11022719', '专业技术', '一般设计缺陷', '0.20', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1855', '11022719', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1856', '11022719', '合规', '设计规定', '1.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1857', '11022719', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1858', '11022719', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1859', '11022719', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1860', '11022719', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1861', '11022719', '自我成长', '学习积极性', '120.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1862', '11022719', '自我成长', '考试', '95.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1863', '11022719', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1864', '11022719', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1865', '11022719', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1866', '11022719', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1867', '11022719', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1868', '11022719', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1869', '11022719', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1870', '12128145', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1871', '12128145', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1872', '12128145', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1873', '12128145', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1874', '12128145', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1875', '12128145', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1876', '12128145', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1877', '12128145', '自我成长', '学习积极性', '115.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1878', '12128145', '自我成长', '考试', '94.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1879', '12128145', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1880', '12128145', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1881', '12128145', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1882', '12128145', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1883', '12128145', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1884', '12128145', '对公司的贡献', '其他', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1885', '12128145', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1886', '12138029', '专业技术', '一般设计缺陷', '4.67', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1887', '12138029', '专业技术', '低级错误', '3.67', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1888', '12138029', '合规', '设计规定', '0.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1889', '12138029', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1890', '12138029', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1891', '12138029', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1892', '12138029', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1893', '12138029', '自我成长', '学习积极性', '115.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1894', '12138029', '自我成长', '考试', '80.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1895', '12138029', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1896', '12138029', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1897', '12138029', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1898', '12138029', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1899', '12138029', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1900', '12138029', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1901', '12138029', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1902', '14000635', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1903', '14000635', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1904', '14000635', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1905', '14000635', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1906', '14000635', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1907', '14000635', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1908', '14000635', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1909', '14000635', '自我成长', '学习积极性', '15.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1910', '14000635', '自我成长', '考试', '14.33', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1911', '14000635', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1912', '14000635', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1913', '14000635', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1914', '14000635', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1915', '14000635', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1916', '14000635', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1917', '14000635', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1918', '20059615', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1919', '20059615', '专业技术', '低级错误', '0.20', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1920', '20059615', '合规', '设计规定', '1.40', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1921', '20059615', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1922', '20059615', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1923', '20059615', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1924', '20059615', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1925', '20059615', '自我成长', '学习积极性', '120.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1926', '20059615', '自我成长', '考试', '93.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1927', '20059615', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1928', '20059615', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1929', '20059615', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1930', '20059615', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1931', '20059615', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1932', '20059615', '对公司的贡献', '其他', '7.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1933', '20059615', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1934', '20059616', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1935', '20059616', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1936', '20059616', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1937', '20059616', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1938', '20059616', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1939', '20059616', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1940', '20059616', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1941', '20059616', '自我成长', '学习积极性', '100.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1942', '20059616', '自我成长', '考试', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1943', '20059616', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1944', '20059616', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1945', '20059616', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1946', '20059616', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1947', '20059616', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1948', '20059616', '对公司的贡献', '其他', '10.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1949', '20059616', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1950', '20073800', '专业技术', '一般设计缺陷', '3.43', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1951', '20073800', '专业技术', '低级错误', '1.86', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1952', '20073800', '合规', '设计规定', '2.43', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1953', '20073800', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1954', '20073800', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1955', '20073800', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1956', '20073800', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1957', '20073800', '自我成长', '学习积极性', '120.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1958', '20073800', '自我成长', '考试', '97.67', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1959', '20073800', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1960', '20073800', '对公司的贡献', '经验库', '20.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1961', '20073800', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1962', '20073800', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1963', '20073800', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1964', '20073800', '对公司的贡献', '其他', '3.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1965', '20073800', '对公司的贡献', '培训', '20.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1966', '20152714', '专业技术', '一般设计缺陷', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1967', '20152714', '专业技术', '低级错误', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1968', '20152714', '合规', '设计规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1969', '20152714', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1970', '20152714', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1971', '20152714', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1972', '20152714', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1973', '20152714', '自我成长', '学习积极性', '85.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1974', '20152714', '自我成长', '考试', '91.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1975', '20152714', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1976', '20152714', '对公司的贡献', '经验库', '10.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1977', '20152714', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1978', '20152714', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1979', '20152714', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1980', '20152714', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1981', '20152714', '对公司的贡献', '培训', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1982', '20155707', '专业技术', '一般设计缺陷', '0.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1983', '20155707', '专业技术', '低级错误', '3.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1984', '20155707', '合规', '设计规定', '9.25', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1985', '20155707', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1986', '20155707', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1987', '20155707', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1988', '20155707', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1989', '20155707', '自我成长', '学习积极性', '100.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1990', '20155707', '自我成长', '考试', '84.83', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1991', '20155707', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1992', '20155707', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1993', '20155707', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1994', '20155707', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1995', '20155707', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1996', '20155707', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1997', '20155707', '对公司的贡献', '培训', '10.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1998', '20155708', '专业技术', '一般设计缺陷', '6.71', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('1999', '20155708', '专业技术', '低级错误', '0.71', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2000', '20155708', '合规', '设计规定', '0.29', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2001', '20155708', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2002', '20155708', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2003', '20155708', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2004', '20155708', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2005', '20155708', '自我成长', '学习积极性', '110.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2006', '20155708', '自我成长', '考试', '76.50', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2007', '20155708', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2008', '20155708', '对公司的贡献', '经验库', '5.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2009', '20155708', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2010', '20155708', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2011', '20155708', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2012', '20155708', '对公司的贡献', '其他', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2013', '20155708', '对公司的贡献', '培训', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2014', '20218676', '专业技术', '一般设计缺陷', '3.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2015', '20218676', '专业技术', '低级错误', '4.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2016', '20218676', '合规', '设计规定', '9.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2017', '20218676', '合规', '流程规定', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2018', '20218676', '沟通管理', '工作积极性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2019', '20218676', '沟通管理', '沟通能力', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2020', '20218676', '沟通管理', '工作计划性', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2021', '20218676', '自我成长', '学习积极性', '45.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2022', '20218676', '自我成长', '考试', '95.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2023', '20218676', '对公司的贡献', '专利', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2024', '20218676', '对公司的贡献', '经验库', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2025', '20218676', '对公司的贡献', '标准化', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2026', '20218676', '对公司的贡献', '重要信息收集', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2027', '20218676', '对公司的贡献', '项目文档', '0.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2028', '20218676', '对公司的贡献', '其他', '1.00', '1', '13');
INSERT INTO `secondlevelscore` VALUES ('2029', '20218676', '对公司的贡献', '培训', '0.00', '1', '13');

-- ----------------------------
-- Table structure for secondweight
-- ----------------------------
DROP TABLE IF EXISTS `secondweight`;
CREATE TABLE `secondweight` (
  `secondWeightId` int(11) NOT NULL auto_increment,
  `oneLevel` varchar(255) default NULL,
  `secondLevel` varchar(255) default NULL,
  `A` int(11) default NULL,
  `B` int(11) default NULL,
  `C` int(11) default NULL,
  `weightly` double default NULL,
  `mode` int(11) default NULL,
  PRIMARY KEY  (`secondWeightId`),
  KEY `secondweight1` (`mode`),
  CONSTRAINT `secondweight1` FOREIGN KEY (`mode`) REFERENCES `mode` (`modeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondweight
-- ----------------------------
INSERT INTO `secondweight` VALUES ('1', '专业技术', '一般设计缺陷', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('2', '专业技术', '低级错误', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('3', '合规', '设计规定', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('4', '自我成长', '学习积极性', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('5', '对公司的贡献', '专利', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('6', '对公司的贡献', '培训', '5', '3', '1', '1', '1');
INSERT INTO `secondweight` VALUES ('7', '对公司的贡献', '经验库', '1', null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('8', '对公司的贡献', '标准化', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('9', '对公司的贡献', '其他', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('10', '对公司的贡献', '项目文档', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('11', '对公司的贡献', '重要信息收集', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('12', '沟通管理', '工作积极性', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('13', '沟通管理', '沟通能力', null, null, null, '1', '1');
INSERT INTO `secondweight` VALUES ('14', '沟通管理', '工作计划性', null, null, null, '1', '1');

-- ----------------------------
-- Table structure for structureproblem
-- ----------------------------
DROP TABLE IF EXISTS `structureproblem`;
CREATE TABLE `structureproblem` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `classify` int(11) default NULL,
  `score` int(11) default NULL,
  `strExplain` varchar(255) default NULL,
  `employee` varchar(20) default NULL,
  `project` varchar(30) default NULL,
  `createDate` date default NULL,
  `phaseId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `strclassify` (`classify`),
  KEY `struemployee` (`employee`),
  KEY `struproject` (`project`),
  KEY `struphase` (`phaseId`),
  CONSTRAINT `struphase` FOREIGN KEY (`phaseId`) REFERENCES `phase` (`phaseId`),
  CONSTRAINT `strclassify` FOREIGN KEY (`classify`) REFERENCES `problemtype` (`typeId`),
  CONSTRAINT `struemployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`),
  CONSTRAINT `struproject` FOREIGN KEY (`project`) REFERENCES `project` (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of structureproblem
-- ----------------------------

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `trainId` int(11) NOT NULL auto_increment,
  `trainName` varchar(50) default NULL,
  `trainContent` varchar(255) default NULL,
  `trainLocation` varchar(50) default NULL,
  `trainLevel` varchar(10) default NULL,
  `information` varchar(255) default NULL,
  `trainTime` date default NULL,
  `teacher` varchar(30) default NULL,
  `joinNum` int(11) default NULL,
  `employee` varchar(11) default NULL,
  PRIMARY KEY  (`trainId`),
  KEY `trainEmployee` (`employee`),
  CONSTRAINT `trainEmployee` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('1', 'Fitipower培训', 'Fitipower培训', '', 'A', 'Fitipower培训', '2016-01-19', null, '17', null);
INSERT INTO `train` VALUES ('2', '镁光', '镁光', '', 'A', '镁光', '2016-01-26', null, '17', null);
INSERT INTO `train` VALUES ('3', 'ESD经验分享', 'ESD经验分享', '', 'A', 'ESD经验分享', '2016-03-03', null, '17', null);
INSERT INTO `train` VALUES ('4', 'EOC培训', 'EOC培训', '', 'A', 'EOC培训', '2016-03-10', null, '19', null);
INSERT INTO `train` VALUES ('5', 'VOIP培训', 'VOIP培训', '', 'A', 'VOIP培训', '2016-03-17', null, '19', null);
INSERT INTO `train` VALUES ('6', 'TVS/ESD培训', 'TVS/ESD培训', '', 'A', 'TVS/ESD培训', '2016-03-18', null, '19', null);
INSERT INTO `train` VALUES ('7', 'MPS DC-DC培训', 'MPS DC-DC培训', '', 'A', 'MPS DC-DC培训', '2016-03-18', null, '18', null);
INSERT INTO `train` VALUES ('8', '顶点天线知识培训', '顶点天线知识培训', '', 'A', '顶点天线知识培训', '2016-03-31', null, '20', null);
INSERT INTO `train` VALUES ('9', 'PDM交流', 'PDM交流', '', 'A', 'PDM交流', '2016-03-31', null, '24', null);
INSERT INTO `train` VALUES ('11', 'EMI培训2', 'EMI培训2', '', 'A', 'EMI培训2', '2016-04-07', null, '21', null);
INSERT INTO `train` VALUES ('12', 'BOB培训', 'BOB培训', '', 'A', 'BOB培训', '2016-04-21', null, '14', null);
INSERT INTO `train` VALUES ('13', '网口浪涌', '网口浪涌', '', 'A', '网口浪涌', '2016-05-19', null, '18', null);
INSERT INTO `train` VALUES ('14', '扬声器', '扬声器相关知识', '', 'A', '扬声器相关知识', '2016-05-24', null, '17', null);
INSERT INTO `train` VALUES ('15', '设计经验', '设计经验分享', '', 'A', '设计经验分享', '2016-06-02', null, '18', null);
INSERT INTO `train` VALUES ('16', 'HDMI培训', 'HDMI培训', '', 'A', 'HDMI培训', '2016-06-23', null, '19', null);
INSERT INTO `train` VALUES ('17', 'LNB培训', 'LNB培训', '', 'A', 'LNB培训', '2016-06-30', null, '17', null);
INSERT INTO `train` VALUES ('18', '电容关键参数及案例分析', '电容关键参数及案例分析', '', 'A', '电容关键参数及案例分析', '2016-07-07', null, '19', null);
INSERT INTO `train` VALUES ('19', '产品开发及问题处理经验共享汇总', '产品开发及问题处理经验共享汇总', '', 'A', '产品开发及问题处理经验共享汇总', '2016-07-14', null, '17', null);
INSERT INTO `train` VALUES ('20', '红外类设计注意事项及实际案例分析分析', '红外类设计注意事项及实际案例分析分析', '', 'A', '红外类设计注意事项及实际案例分析分析', '2016-08-04', null, '18', null);
INSERT INTO `train` VALUES ('21', 'PCB设计培训', 'PCB设计培训', '', 'A', 'PCB设计培训', '2016-08-04', null, '20', null);
INSERT INTO `train` VALUES ('22', 'PCB的成本优化设计及设计评审中的常见设计缺陷', 'PCB的成本优化设计及设计评审中的常见设计缺陷', '', 'A', 'PCB的成本优化设计及设计评审中的常见设计缺陷', '2016-08-18', null, '20', null);
INSERT INTO `train` VALUES ('23', '天线技术交流', '天线技术交流', '', 'A', '天线技术交流', '2016-09-05', null, '21', null);
INSERT INTO `train` VALUES ('24', 'CCC\\CE等认证交流', 'CCC\\CE等认证交流', '', 'A', 'CCC\\CE等认证交流', '2016-10-20', null, '25', null);
INSERT INTO `train` VALUES ('25', 'EOC培训2', 'EOC培训2', '', 'A', 'EOC培训2', '2016-04-06', null, '19', null);

-- ----------------------------
-- Table structure for trainorg
-- ----------------------------
DROP TABLE IF EXISTS `trainorg`;
CREATE TABLE `trainorg` (
  `trainOrg` int(11) NOT NULL auto_increment,
  `trainId` int(11) default NULL,
  `employeeId` varchar(20) default NULL,
  PRIMARY KEY  (`trainOrg`),
  KEY `trainOrg` (`trainId`),
  KEY `trainOrg2` (`employeeId`),
  CONSTRAINT `trainOrg` FOREIGN KEY (`trainId`) REFERENCES `train` (`trainId`),
  CONSTRAINT `trainOrg2` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trainorg
-- ----------------------------
INSERT INTO `trainorg` VALUES ('1', '1', '11007538');
INSERT INTO `trainorg` VALUES ('2', '3', '20073800');
INSERT INTO `trainorg` VALUES ('3', '4', '20073800');
INSERT INTO `trainorg` VALUES ('4', '5', '20155707');
INSERT INTO `trainorg` VALUES ('5', '6', '20073800');
INSERT INTO `trainorg` VALUES ('6', '7', '11009145');
INSERT INTO `trainorg` VALUES ('7', '8', '11021950');
INSERT INTO `trainorg` VALUES ('8', '9', '11007538');
INSERT INTO `trainorg` VALUES ('10', '11', '20059616');
INSERT INTO `trainorg` VALUES ('11', '12', '20155707');
INSERT INTO `trainorg` VALUES ('12', '13', '20152714');
INSERT INTO `trainorg` VALUES ('13', '15', '11007538');
INSERT INTO `trainorg` VALUES ('14', '16', '11020249');
INSERT INTO `trainorg` VALUES ('15', '17', '11008845');
INSERT INTO `trainorg` VALUES ('16', '18', '12138029');
INSERT INTO `trainorg` VALUES ('17', '19', '11007538');
INSERT INTO `trainorg` VALUES ('18', '21', '11022719');
INSERT INTO `trainorg` VALUES ('19', '22', '11020403');
INSERT INTO `trainorg` VALUES ('20', '23', '11021950');
INSERT INTO `trainorg` VALUES ('21', '24', '12128145');
INSERT INTO `trainorg` VALUES ('22', '25', '20073800');

-- ----------------------------
-- Procedure structure for admin_sort_num
-- ----------------------------
DROP PROCEDURE IF EXISTS `admin_sort_num`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_sort_num`(OUT `employee_num` int,OUT `project_num` int,OUT `exam_num` int,OUT `study_num` int)
BEGIN
 SELECT count(*) as employee_num FROM employee into employee_num;
SELECT count(*) as project_num FROM project into project_num;
SELECT count(*) as exam_num FROM exam into exam_num;
SELECT count(*) as study_num FROM train into study_num;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for employee_sorts_num
-- ----------------------------
DROP PROCEDURE IF EXISTS `employee_sorts_num`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_sorts_num`(IN `employee_Id_In` varchar(20),OUT `employee_project_num_out` varchar(20),OUT `employee_exam_num_out` varchar(20),OUT `employee_study_num_out` varchar(20))
BEGIN
  SELECT count(employee) as employee_project_num FROM employeeprojectr where employee = employee_Id_In into employee_project_num_out;
  SELECT count(employee) as employee_examination_num FROM employeeexamr where employee = employee_Id_In into employee_exam_num_out;
  SELECT count(employee) as employee_study_num  FROM employeetrainr where employee = employee_Id_In into employee_study_num_out;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for experience_num
-- ----------------------------
DROP PROCEDURE IF EXISTS `experience_num`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `experience_num`(OUT `all_num_out` int,OUT `have_num_out` int,OUT `no_num_out` int)
BEGIN
  SELECT count(*) as all_num FROM experience into all_num_out;
  SELECT count(*) as have_num FROM experience where exState = "已处理" into have_num_out;
  SELECT count(*) as no_num  FROM experience where exState = "未处理"  into no_num_out;
END
;;
DELIMITER ;
