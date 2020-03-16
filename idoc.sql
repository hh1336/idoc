/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : idoc

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-03-16 08:55:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_session
-- ----------------------------
DROP TABLE IF EXISTS `think_session`;
CREATE TABLE `think_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_session
-- ----------------------------

-- ----------------------------
-- Table structure for t_acc_fmt
-- ----------------------------
DROP TABLE IF EXISTS `t_acc_fmt`;
CREATE TABLE `t_acc_fmt` (
  `id` varchar(255) NOT NULL,
  `acc_number` varchar(255) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) NOT NULL,
  `in_use` int(11) DEFAULT '1',
  `db_table_name_prefix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_acc_fmt
-- ----------------------------

-- ----------------------------
-- Table structure for t_acc_fmt_cols
-- ----------------------------
DROP TABLE IF EXISTS `t_acc_fmt_cols`;
CREATE TABLE `t_acc_fmt_cols` (
  `id` varchar(255) NOT NULL,
  `fmt_id` varchar(255) NOT NULL,
  `db_field_name` varchar(255) NOT NULL,
  `db_field_type` varchar(255) DEFAULT NULL,
  `db_field_length` int(11) NOT NULL,
  `db_field_decimal` int(11) NOT NULL,
  `show_order` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `sys_col` int(11) DEFAULT NULL,
  `use_code_table` int(11) NOT NULL DEFAULT '0',
  `code_table_name` varchar(255) DEFAULT NULL,
  `code_table_field_name` varchar(255) DEFAULT NULL,
  `code_table_field_name_fk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_acc_fmt_cols
-- ----------------------------

-- ----------------------------
-- Table structure for t_acc_period
-- ----------------------------
DROP TABLE IF EXISTS `t_acc_period`;
CREATE TABLE `t_acc_period` (
  `id` varchar(255) NOT NULL,
  `acc_year` int(11) NOT NULL,
  `acc_month` int(11) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `acc_gl_kept` int(11) NOT NULL,
  `acc_gl_closed` int(11) NOT NULL,
  `acc_detail_kept` int(11) NOT NULL,
  `acc_detail_closed` int(11) NOT NULL,
  `period_closed` int(11) NOT NULL,
  `year_forward` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_acc_period
-- ----------------------------

-- ----------------------------
-- Table structure for t_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `t_bank_account`;
CREATE TABLE `t_bank_account` (
  `id` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bank_account
-- ----------------------------

-- ----------------------------
-- Table structure for t_biz_log
-- ----------------------------
DROP TABLE IF EXISTS `t_biz_log`;
CREATE TABLE `t_biz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `info` varchar(1000) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `log_category` varchar(50) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `ip_from` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_biz_log
-- ----------------------------
INSERT INTO `t_biz_log` VALUES ('1', '2020-03-04 10:31:34', '登录系统', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('2', '2020-03-05 09:01:06', '登录系统', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('3', '2020-03-05 09:02:30', '通过主菜单进入模块：权限管理', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('4', '2020-03-05 09:44:51', '登录系统', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('5', '2020-03-05 09:44:55', '通过主菜单进入模块：业务设置', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('6', '2020-03-05 09:45:09', '[公司], 把[公司名称]设置为[广西佳业]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('7', '2020-03-05 09:45:09', '[公司], 把[采购订单默认付款方式]设置为[记应付账款]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('8', '2020-03-05 09:45:09', '[公司], 把[采购入库单默认付款方式]设置为[记应付账款]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('9', '2020-03-05 09:45:09', '[公司], 把[采购入库数量控制]设置为[不能超过采购订单未入库量]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('10', '2020-03-05 09:45:09', '[公司], 把[销售出库单默认收款方式]设置为[记应收账款]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('11', '2020-03-05 09:45:09', '[公司], 把[销售订单默认收款方式]设置为[记应收账款]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('12', '2020-03-05 09:45:09', '[公司], 把[销售出库数量控制]设置为[不做限制]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('13', '2020-03-05 09:45:09', '[公司], 把[模块打开方式]设置为[原窗口打开]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('14', '2020-03-05 09:45:09', '[公司], 把[商品数量小数位数]设置为[0]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('15', '2020-03-05 09:45:09', '[公司], 把[销售合同号前缀]设置为[SC]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('16', '2020-03-05 09:45:09', '[公司], 把[拆分单单号前缀]设置为[WSP]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('17', '2020-03-05 09:45:09', '[公司], 把[成品委托生产订单号前缀]设置为[DMO]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('18', '2020-03-05 09:45:09', '[公司], 把[成品委托生产入库单号前缀]设置为[DMW]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('19', '2020-03-05 09:45:32', '[公司], 把[产品名称]设置为[iDoc]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('20', '2020-03-05 09:46:08', '[公司], 把[产品名称]设置为[iDoc - 文档管理系统]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('21', '2020-03-05 09:46:13', '通过主菜单进入模块：重新登录', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('22', '2020-03-05 09:46:21', '登录系统', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('23', '2020-03-05 09:46:40', '通过主菜单进入模块：业务设置', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('24', '2020-03-05 09:46:49', '[公司], 把[产品名称]设置为[iDoc]', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '业务设置', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('25', '2020-03-05 09:46:52', '通过主菜单进入模块：重新登录', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('26', '2020-03-05 09:46:56', '登录系统', '127.0.0.1', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '内网IP', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('27', '2020-03-05 17:27:22', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('28', '2020-03-06 10:38:19', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('29', '2020-03-06 14:35:55', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('30', '2020-03-06 14:36:24', '通过常用功能进入模块：权限管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '常用功能', '', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('31', '2020-03-06 14:39:34', '访问帮助页面：数据域应用详解', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '帮助', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('32', '2020-03-06 14:39:40', '编辑角色[系统管理]', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '权限管理', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('33', '2020-03-06 14:39:45', '通过主菜单进入模块：文件管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('34', '2020-03-07 08:45:26', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('35', '2020-03-07 09:25:46', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('36', '2020-03-07 11:13:39', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('37', '2020-03-09 08:42:03', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('38', '2020-03-09 12:01:03', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('39', '2020-03-09 16:24:18', '通过主菜单进入模块：权限管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('40', '2020-03-09 16:24:23', '通过主菜单进入模块：业务设置', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('41', '2020-03-09 16:34:28', '通过主菜单进入模块：权限管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('42', '2020-03-09 16:48:53', '通过主菜单进入模块：文件管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('43', '2020-03-10 09:04:07', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('44', '2020-03-10 09:04:09', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('45', '2020-03-10 10:50:54', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('46', '2020-03-10 14:12:12', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('47', '2020-03-10 14:38:38', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('48', '2020-03-11 09:07:55', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('49', '2020-03-11 17:17:29', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('50', '2020-03-12 08:38:44', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('51', '2020-03-12 09:41:26', '通过主菜单进入模块：权限管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('52', '2020-03-12 09:41:53', '访问帮助页面：数据域应用详解', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '帮助', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('53', '2020-03-12 09:41:58', '编辑角色[系统管理]', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '权限管理', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('54', '2020-03-12 09:59:12', '通过主菜单进入模块：文件管理', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('55', '2020-03-13 08:37:16', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('56', '2020-03-13 08:46:35', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('57', '2020-03-13 08:48:25', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_biz_log` VALUES ('58', '2020-03-13 09:46:16', '登录系统', '0.0.0.0', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '系统', '01010001', '', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');

-- ----------------------------
-- Table structure for t_cash
-- ----------------------------
DROP TABLE IF EXISTS `t_cash`;
CREATE TABLE `t_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash
-- ----------------------------

-- ----------------------------
-- Table structure for t_cash_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_detail`;
CREATE TABLE `t_cash_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_code_table_category
-- ----------------------------
DROP TABLE IF EXISTS `t_code_table_category`;
CREATE TABLE `t_code_table_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_code_table_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_code_table_cols_md
-- ----------------------------
DROP TABLE IF EXISTS `t_code_table_cols_md`;
CREATE TABLE `t_code_table_cols_md` (
  `id` varchar(255) NOT NULL,
  `table_id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `db_field_name` varchar(255) NOT NULL,
  `db_field_type` varchar(255) NOT NULL,
  `db_field_length` int(11) NOT NULL,
  `db_field_decimal` int(11) NOT NULL,
  `show_order` int(11) NOT NULL,
  `value_from` int(11) DEFAULT NULL,
  `value_from_table_name` varchar(255) DEFAULT NULL,
  `value_from_col_name` varchar(255) DEFAULT NULL,
  `value_from_col_name_display` varchar(255) DEFAULT NULL,
  `must_input` int(11) DEFAULT '1',
  `sys_col` int(11) DEFAULT '1',
  `is_visible` int(11) DEFAULT '1',
  `width_in_view` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `show_order_in_view` int(11) NOT NULL DEFAULT '-1',
  `editor_xtype` varchar(255) NOT NULL DEFAULT 'textfield',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_code_table_cols_md
-- ----------------------------

-- ----------------------------
-- Table structure for t_code_table_md
-- ----------------------------
DROP TABLE IF EXISTS `t_code_table_md`;
CREATE TABLE `t_code_table_md` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `md_version` int(11) NOT NULL DEFAULT '1',
  `is_fixed` int(11) NOT NULL DEFAULT '2',
  `enable_parent_id` int(11) NOT NULL DEFAULT '0',
  `handler_class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_code_table_md
-- ----------------------------

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `show_order` int(11) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('9000-01', '公司名称', '广西佳业', '', '100', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9000-02', '公司地址', '', '', '101', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9000-03', '公司电话', '', '', '102', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9000-04', '公司传真', '', '', '103', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9000-05', '公司邮编', '', '', '104', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2001-01', '采购入库默认仓库', '', '', '200', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2002-02', '销售出库默认仓库', '', '', '300', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2002-01', '销售出库单允许编辑销售单价', '0', '当允许编辑的时候，还需要给用户赋予权限[销售出库单允许编辑销售单价]', '301', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('1003-02', '存货计价方法', '0', '', '401', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9001-01', '增值税税率', '17', '', '501', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9002-01', '产品名称', 'iDoc', '', '0', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-01', '采购订单单号前缀', 'PO', '', '601', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-02', '采购入库单单号前缀', 'PW', '', '602', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-03', '采购退货出库单单号前缀', 'PR', '', '603', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-04', '销售出库单单号前缀', 'WS', '', '604', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-05', '销售退货入库单单号前缀', 'SR', '', '605', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-06', '调拨单单号前缀', 'IT', '', '606', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-07', '盘点单单号前缀', 'IC', '', '607', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-08', '销售订单单号前缀', 'SO', '', '608', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2001-02', '采购订单默认付款方式', '0', '', '201', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2001-03', '采购入库单默认付款方式', '0', '', '202', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2001-04', '采购入库数量控制', '1', '', '203', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2002-03', '销售出库单默认收款方式', '0', '', '302', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2002-04', '销售订单默认收款方式', '0', '', '303', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('2002-05', '销售出库数量控制', '0', '', '304', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9002-02', '模块打开方式', '0', '', '1', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9002-03', '商品数量小数位数', '0', '', '2', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-09', '销售合同号前缀', 'SC', '', '609', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-10', '拆分单单号前缀', 'WSP', '', '610', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-11', '成品委托生产订单号前缀', 'DMO', '', '611', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');
INSERT INTO `t_config` VALUES ('9003-12', '成品委托生产入库单号前缀', 'DMW', '', '612', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact01` varchar(255) DEFAULT NULL,
  `qq01` varchar(255) DEFAULT NULL,
  `tel01` varchar(255) DEFAULT NULL,
  `mobile01` varchar(255) DEFAULT NULL,
  `contact02` varchar(255) DEFAULT NULL,
  `qq02` varchar(255) DEFAULT NULL,
  `tel02` varchar(255) DEFAULT NULL,
  `mobile02` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_shipping` varchar(255) DEFAULT NULL,
  `address_receipt` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `init_receivables` decimal(19,2) DEFAULT NULL,
  `init_receivables_dt` datetime DEFAULT NULL,
  `init_payables` decimal(19,2) DEFAULT NULL,
  `init_payables_dt` datetime DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `sales_warehouse_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer_category
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_category`;
CREATE TABLE `t_customer_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `ps_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict_table_category
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_table_category`;
CREATE TABLE `t_dict_table_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict_table_category
-- ----------------------------
INSERT INTO `t_dict_table_category` VALUES ('01', '01', '码表', null);

-- ----------------------------
-- Table structure for t_dict_table_md
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_table_md`;
CREATE TABLE `t_dict_table_md` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict_table_md
-- ----------------------------
INSERT INTO `t_dict_table_md` VALUES ('0101', '0101', '码表记录状态', 't_sysdict_record_status', '01', '码表记录的状态', 'MBJLZT');
INSERT INTO `t_dict_table_md` VALUES ('0102', '0102', '码表字段编辑器类型', 't_sysdict_editor_xtype', '01', '码表字段编辑器的类型', 'MBZDBJQLX');

-- ----------------------------
-- Table structure for t_dir
-- ----------------------------
DROP TABLE IF EXISTS `t_dir`;
CREATE TABLE `t_dir` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '显示给用户看的文件夹路径',
  `parent_dir_id` varchar(255) DEFAULT NULL COMMENT '上一级文件夹',
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `edit_user_id` varchar(255) DEFAULT NULL,
  `edit_user_name` varchar(255) DEFAULT NULL,
  `edit_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `del_user_id` varchar(255) DEFAULT NULL,
  `del_user_name` varchar(255) DEFAULT NULL,
  `del_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '0：正常\r\n1：作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_del` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dir
-- ----------------------------
INSERT INTO `t_dir` VALUES ('0fa50192-e97e-44df-b7ae-fc20cb746aff', '/', 'Uploads/0fa50192-e97e-44df-b7ae-fc20cb746aff/', null, null, null, null, null, null, null, null, null, null, '0', null, '0');

-- ----------------------------
-- Table structure for t_dmo_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_dmo_bill`;
CREATE TABLE `t_dmo_bill` (
  `id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `factory_id` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `org_id` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `bill_status` int(11) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `deal_date` datetime NOT NULL,
  `deal_address` varchar(255) DEFAULT NULL,
  `confirm_user_id` varchar(255) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dmo_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_dmo_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dmo_bill_detail`;
CREATE TABLE `t_dmo_bill_detail` (
  `id` varchar(255) NOT NULL,
  `dmobill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `tax_rate` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `dmw_count` decimal(19,8) NOT NULL,
  `left_count` decimal(19,8) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dmo_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_dmo_dmw
-- ----------------------------
DROP TABLE IF EXISTS `t_dmo_dmw`;
CREATE TABLE `t_dmo_dmw` (
  `dmo_id` varchar(255) NOT NULL,
  `dmw_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dmo_dmw
-- ----------------------------

-- ----------------------------
-- Table structure for t_dmw_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_dmw_bill`;
CREATE TABLE `t_dmw_bill` (
  `id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `factory_id` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `bill_status` int(11) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dmw_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_dmw_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_dmw_bill_detail`;
CREATE TABLE `t_dmw_bill_detail` (
  `id` varchar(255) NOT NULL,
  `dmwbill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `dmobilldetail_id` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dmw_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_factory
-- ----------------------------
DROP TABLE IF EXISTS `t_factory`;
CREATE TABLE `t_factory` (
  `id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact01` varchar(255) DEFAULT NULL,
  `tel01` varchar(255) DEFAULT NULL,
  `mobile01` varchar(255) DEFAULT NULL,
  `contact02` varchar(255) DEFAULT NULL,
  `tel02` varchar(255) DEFAULT NULL,
  `mobile02` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `init_receivables` decimal(19,2) DEFAULT NULL,
  `init_receivables_dt` datetime DEFAULT NULL,
  `init_payables` decimal(19,2) DEFAULT NULL,
  `init_payables_dt` datetime DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_factory
-- ----------------------------

-- ----------------------------
-- Table structure for t_factory_category
-- ----------------------------
DROP TABLE IF EXISTS `t_factory_category`;
CREATE TABLE `t_factory_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_factory_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_fid
-- ----------------------------
DROP TABLE IF EXISTS `t_fid`;
CREATE TABLE `t_fid` (
  `fid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fid
-- ----------------------------
INSERT INTO `t_fid` VALUES ('-7999', '自定义表单', 'ZDYBD', '');
INSERT INTO `t_fid` VALUES ('-7994', '系统数据字典', 'XTSJZD', '');
INSERT INTO `t_fid` VALUES ('-7995', '主菜单维护', 'ZCDWH', '');
INSERT INTO `t_fid` VALUES ('-7996', '码表设置', 'MBSZ', '');
INSERT INTO `t_fid` VALUES ('-7997', '表单视图开发助手', 'BDSTKFZS', '');
INSERT INTO `t_fid` VALUES ('-9999', '重新登录', '', '');
INSERT INTO `t_fid` VALUES ('-9997', '首页', 'SY', '');
INSERT INTO `t_fid` VALUES ('-9996', '修改我的密码', 'XGWDMM', '');
INSERT INTO `t_fid` VALUES ('-9995', '帮助', 'BZ', '');
INSERT INTO `t_fid` VALUES ('-9994', '关于', 'GY', '');
INSERT INTO `t_fid` VALUES ('-9993', '购买商业服务', '', '');
INSERT INTO `t_fid` VALUES ('-8999', '用户管理', 'YHGL', '');
INSERT INTO `t_fid` VALUES ('-8999-01', '组织机构在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('-8999-02', '业务员在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('-8997', '业务日志', 'YWRZ', '');
INSERT INTO `t_fid` VALUES ('-8996', '权限管理', 'QXGL', '');
INSERT INTO `t_fid` VALUES ('1001', '商品', 'SP', '');
INSERT INTO `t_fid` VALUES ('1001-01', '商品在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('1001-02', '商品分类', 'SPFL', '');
INSERT INTO `t_fid` VALUES ('1002', '商品计量单位', 'SPJLDW', '');
INSERT INTO `t_fid` VALUES ('1003', '仓库', 'CK', '');
INSERT INTO `t_fid` VALUES ('1003-01', '仓库在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('1004', '供应商档案', 'GYSDA', '');
INSERT INTO `t_fid` VALUES ('1004-01', '供应商档案在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('1004-02', '供应商分类', '', '');
INSERT INTO `t_fid` VALUES ('1007', '客户资料', 'KHZL', '');
INSERT INTO `t_fid` VALUES ('1007-01', '客户资料在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('1007-02', '客户分类', '', '');
INSERT INTO `t_fid` VALUES ('2000', '库存建账', 'KCJZ', '');
INSERT INTO `t_fid` VALUES ('2001', '采购入库', 'CGRK', '');
INSERT INTO `t_fid` VALUES ('2001-01', '采购入库-新建采购入库单', '', '');
INSERT INTO `t_fid` VALUES ('2001-02', '采购入库-编辑采购入库单', '', '');
INSERT INTO `t_fid` VALUES ('2001-03', '采购入库-删除采购入库单', '', '');
INSERT INTO `t_fid` VALUES ('2001-04', '采购入库-提交入库', '', '');
INSERT INTO `t_fid` VALUES ('2001-05', '采购入库-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2001-06', '采购入库-采购单价和金额可见', '', '');
INSERT INTO `t_fid` VALUES ('2001-07', '采购入库-打印', '', '');
INSERT INTO `t_fid` VALUES ('2002', '销售出库', 'XSCK', '');
INSERT INTO `t_fid` VALUES ('2002-01', '销售出库-销售出库单允许编辑销售单价', '', '');
INSERT INTO `t_fid` VALUES ('2002-02', '销售出库-新建销售出库单', '', '');
INSERT INTO `t_fid` VALUES ('2002-03', '销售出库-编辑销售出库单', '', '');
INSERT INTO `t_fid` VALUES ('2002-04', '销售出库-删除销售出库单', '', '');
INSERT INTO `t_fid` VALUES ('2002-05', '销售出库-提交出库', '', '');
INSERT INTO `t_fid` VALUES ('2002-06', '销售出库-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2002-07', '销售出库-打印', '', '');
INSERT INTO `t_fid` VALUES ('2003', '库存账查询', 'KCZCX', '');
INSERT INTO `t_fid` VALUES ('2004', '应收账款管理', 'YSZKGL', '');
INSERT INTO `t_fid` VALUES ('2005', '应付账款管理', 'YFZKGL', '');
INSERT INTO `t_fid` VALUES ('2006', '销售退货入库', 'XSTHRK', '');
INSERT INTO `t_fid` VALUES ('2006-01', '销售退货入库-新建销售退货入库单', '', '');
INSERT INTO `t_fid` VALUES ('2006-02', '销售退货入库-编辑销售退货入库单', '', '');
INSERT INTO `t_fid` VALUES ('2006-03', '销售退货入库-删除销售退货入库单', '', '');
INSERT INTO `t_fid` VALUES ('2006-04', '销售退货入库-提交入库', '', '');
INSERT INTO `t_fid` VALUES ('2006-05', '销售退货入库-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2006-06', '销售退货入库-打印', '', '');
INSERT INTO `t_fid` VALUES ('2007', '采购退货出库', 'CGTHCK', '');
INSERT INTO `t_fid` VALUES ('2007-01', '采购退货出库-新建采购退货出库单', '', '');
INSERT INTO `t_fid` VALUES ('2007-02', '采购退货出库-编辑采购退货出库单', '', '');
INSERT INTO `t_fid` VALUES ('2007-03', '采购退货出库-删除采购退货出库单', '', '');
INSERT INTO `t_fid` VALUES ('2007-04', '采购退货出库-提交采购退货出库单', '', '');
INSERT INTO `t_fid` VALUES ('2007-05', '采购退货出库-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2007-06', '采购退货出库-打印', '', '');
INSERT INTO `t_fid` VALUES ('2008', '业务设置', 'YWSZ', '');
INSERT INTO `t_fid` VALUES ('2009', '库间调拨', 'KJDB', '');
INSERT INTO `t_fid` VALUES ('2009-01', '库间调拨-新建调拨单', '', '');
INSERT INTO `t_fid` VALUES ('2009-02', '库间调拨-编辑调拨单', '', '');
INSERT INTO `t_fid` VALUES ('2009-03', '库间调拨-删除调拨单', '', '');
INSERT INTO `t_fid` VALUES ('2009-04', '库间调拨-提交调拨单', '', '');
INSERT INTO `t_fid` VALUES ('2009-05', '库间调拨-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2009-06', '库间调拨-打印', '', '');
INSERT INTO `t_fid` VALUES ('2010', '库存盘点', 'KCPD', '');
INSERT INTO `t_fid` VALUES ('2010-01', '库存盘点-新建盘点单', '', '');
INSERT INTO `t_fid` VALUES ('2010-02', '库存盘点-编辑盘点单', '', '');
INSERT INTO `t_fid` VALUES ('2010-03', '库存盘点-删除盘点单', '', '');
INSERT INTO `t_fid` VALUES ('2010-04', '库存盘点-提交盘点单', '', '');
INSERT INTO `t_fid` VALUES ('2010-05', '库存盘点-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2010-06', '库存盘点-打印', '', '');
INSERT INTO `t_fid` VALUES ('2011-01', '首页-销售看板', '', '');
INSERT INTO `t_fid` VALUES ('2011-02', '首页-库存看板', '', '');
INSERT INTO `t_fid` VALUES ('2011-03', '首页-采购看板', '', '');
INSERT INTO `t_fid` VALUES ('2011-04', '首页-资金看板', '', '');
INSERT INTO `t_fid` VALUES ('2012', '报表-销售日报表(按商品汇总)', 'BBXSRBBASPHZ', '');
INSERT INTO `t_fid` VALUES ('2013', '报表-销售日报表(按客户汇总)', 'BBXSRBBAKHHZ', '');
INSERT INTO `t_fid` VALUES ('2014', '报表-销售日报表(按仓库汇总)', 'BBXSRBBACKHZ', '');
INSERT INTO `t_fid` VALUES ('2015', '报表-销售日报表(按业务员汇总)', 'BBXSRBBAYWYHZ', '');
INSERT INTO `t_fid` VALUES ('2016', '报表-销售月报表(按商品汇总)', 'BBXSYBBASPHZ', '');
INSERT INTO `t_fid` VALUES ('2017', '报表-销售月报表(按客户汇总)', 'BBXSYBBAKHHZ', '');
INSERT INTO `t_fid` VALUES ('2018', '报表-销售月报表(按仓库汇总)', 'BBXSYBBACKHZ', '');
INSERT INTO `t_fid` VALUES ('2019', '报表-销售月报表(按业务员汇总)', 'BBXSYBBAYWYHZ', '');
INSERT INTO `t_fid` VALUES ('2020', '报表-安全库存明细表', 'BBAQKCMXB', '');
INSERT INTO `t_fid` VALUES ('2021', '报表-应收账款账龄分析表', 'BBYSZKZLFXB', '');
INSERT INTO `t_fid` VALUES ('2022', '报表-应付账款账龄分析表', 'BBYFZKZLFXB', '');
INSERT INTO `t_fid` VALUES ('2023', '报表-库存超上限明细表', 'BBKCCSXMXB', '');
INSERT INTO `t_fid` VALUES ('2024', '现金收支查询', 'XJSZCX', '');
INSERT INTO `t_fid` VALUES ('2025', '预收款管理', 'YSKGL', '');
INSERT INTO `t_fid` VALUES ('2026', '预付款管理', 'YFKGL', '');
INSERT INTO `t_fid` VALUES ('2027', '采购订单', 'CGDD', '');
INSERT INTO `t_fid` VALUES ('2027-01', '采购订单-审核/取消审核', '', '');
INSERT INTO `t_fid` VALUES ('2027-02', '采购订单-生成采购入库单', '', '');
INSERT INTO `t_fid` VALUES ('2027-03', '采购订单-新建采购订单', '', '');
INSERT INTO `t_fid` VALUES ('2027-04', '采购订单-编辑采购订单', '', '');
INSERT INTO `t_fid` VALUES ('2027-05', '采购订单-删除采购订单', '', '');
INSERT INTO `t_fid` VALUES ('2027-06', '采购订单-关闭订单/取消关闭订单', '', '');
INSERT INTO `t_fid` VALUES ('2027-07', '采购订单-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2027-08', '采购订单-打印', '', '');
INSERT INTO `t_fid` VALUES ('2028', '销售订单', 'XSDD', '');
INSERT INTO `t_fid` VALUES ('2028-01', '销售订单-审核/取消审核', '', '');
INSERT INTO `t_fid` VALUES ('2028-02', '销售订单-生成销售出库单', '', '');
INSERT INTO `t_fid` VALUES ('2028-03', '销售订单-新建销售订单', '', '');
INSERT INTO `t_fid` VALUES ('2028-04', '销售订单-编辑销售订单', '', '');
INSERT INTO `t_fid` VALUES ('2028-05', '销售订单-删除销售订单', '', '');
INSERT INTO `t_fid` VALUES ('2028-06', '销售订单-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2028-07', '销售订单-打印', '', '');
INSERT INTO `t_fid` VALUES ('2028-08', '销售订单-生成采购订单', '', '');
INSERT INTO `t_fid` VALUES ('2028-09', '销售订单-关闭订单/取消关闭订单', '', '');
INSERT INTO `t_fid` VALUES ('2029', '商品品牌', 'SPPP', '');
INSERT INTO `t_fid` VALUES ('2030-01', '商品构成-新增子商品', '', '');
INSERT INTO `t_fid` VALUES ('2030-02', '商品构成-编辑子商品', '', '');
INSERT INTO `t_fid` VALUES ('2030-03', '商品构成-删除子商品', '', '');
INSERT INTO `t_fid` VALUES ('2031', '价格体系', 'JGTX', '');
INSERT INTO `t_fid` VALUES ('2031-01', '商品-设置商品价格体系', '', '');
INSERT INTO `t_fid` VALUES ('2032', '销售合同', 'XSHT', '');
INSERT INTO `t_fid` VALUES ('2032-01', '销售合同-新建销售合同', '', '');
INSERT INTO `t_fid` VALUES ('2032-02', '销售合同-编辑销售合同', '', '');
INSERT INTO `t_fid` VALUES ('2032-03', '销售合同-删除销售合同', '', '');
INSERT INTO `t_fid` VALUES ('2032-04', '销售合同-审核/取消审核', '', '');
INSERT INTO `t_fid` VALUES ('2032-05', '销售合同-生成销售订单', '', '');
INSERT INTO `t_fid` VALUES ('2032-06', '销售合同-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2032-07', '销售合同-打印', '', '');
INSERT INTO `t_fid` VALUES ('2033', '存货拆分', 'CHCF', '');
INSERT INTO `t_fid` VALUES ('2033-01', '存货拆分-新建拆分单', '', '');
INSERT INTO `t_fid` VALUES ('2033-02', '存货拆分-编辑拆分单', '', '');
INSERT INTO `t_fid` VALUES ('2033-03', '存货拆分-删除拆分单', '', '');
INSERT INTO `t_fid` VALUES ('2033-04', '存货拆分-提交拆分单', '', '');
INSERT INTO `t_fid` VALUES ('2033-05', '存货拆分-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2033-06', '存货拆分-打印', '', '');
INSERT INTO `t_fid` VALUES ('2034', '工厂', 'GC', '');
INSERT INTO `t_fid` VALUES ('2034-01', '工厂在业务单据中的使用权限', '', '');
INSERT INTO `t_fid` VALUES ('2034-02', '工厂分类', '', '');
INSERT INTO `t_fid` VALUES ('2034-03', '工厂-新增工厂分类', '', '');
INSERT INTO `t_fid` VALUES ('2034-04', '工厂-编辑工厂分类', '', '');
INSERT INTO `t_fid` VALUES ('2034-05', '工厂-删除工厂分类', '', '');
INSERT INTO `t_fid` VALUES ('2034-06', '工厂-新增工厂', '', '');
INSERT INTO `t_fid` VALUES ('2034-07', '工厂-编辑工厂', '', '');
INSERT INTO `t_fid` VALUES ('2034-08', '工厂-删除工厂', '', '');
INSERT INTO `t_fid` VALUES ('2035', '成品委托生产订单', 'CPWTSCDD', '');
INSERT INTO `t_fid` VALUES ('2035-01', '成品委托生产订单-新建成品委托生产订单', '', '');
INSERT INTO `t_fid` VALUES ('2035-02', '成品委托生产订单-编辑成品委托生产订单', '', '');
INSERT INTO `t_fid` VALUES ('2035-03', '成品委托生产订单-删除成品委托生产订单', '', '');
INSERT INTO `t_fid` VALUES ('2035-04', '成品委托生产订单-提交成品委托生产订单', '', '');
INSERT INTO `t_fid` VALUES ('2035-05', '成品委托生产订单-审核/取消审核成品委托生产入库单', '', '');
INSERT INTO `t_fid` VALUES ('2035-06', '成品委托生产订单-关闭/取消关闭成品委托生产订单', '', '');
INSERT INTO `t_fid` VALUES ('2035-07', '成品委托生产订单-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2035-08', '成品委托生产订单-打印', '', '');
INSERT INTO `t_fid` VALUES ('2036', '成品委托生产入库', 'CPWTSCRK', '');
INSERT INTO `t_fid` VALUES ('2036-01', '成品委托生产入库-新建成品委托生产入库单', '', '');
INSERT INTO `t_fid` VALUES ('2036-02', '成品委托生产入库-编辑成品委托生产入库单', '', '');
INSERT INTO `t_fid` VALUES ('2036-03', '成品委托生产入库-删除成品委托生产入库单', '', '');
INSERT INTO `t_fid` VALUES ('2036-04', '成品委托生产入库-提交入库', '', '');
INSERT INTO `t_fid` VALUES ('2036-05', '成品委托生产入库-单据生成PDF', '', '');
INSERT INTO `t_fid` VALUES ('2036-06', '成品委托生产入库-打印', '', '');
INSERT INTO `t_fid` VALUES ('2101', '会计科目', 'KJKM', '');
INSERT INTO `t_fid` VALUES ('2102', '银行账户', 'YHZH', '');
INSERT INTO `t_fid` VALUES ('2103', '会计期间', 'KJQJ', '');
INSERT INTO `t_fid` VALUES ('3001', '文件管理', 'WJGL', null);
INSERT INTO `t_fid` VALUES ('3001-01', '文件管理-新增文件夹', 'WJGLXZWJJ', null);
INSERT INTO `t_fid` VALUES ('3001-02', '文件管理-编辑文件夹', 'WJGLBJWJJ', null);
INSERT INTO `t_fid` VALUES ('3001-03', '文件管理-查看文件夹', 'WJGLCKWJJ', null);
INSERT INTO `t_fid` VALUES ('3001-04', '文件管理-删除文件夹', 'WJGLSCWJJ', null);
INSERT INTO `t_fid` VALUES ('3001-05', '文件管理-作废文件夹', 'WJGLZFWJJ', null);
INSERT INTO `t_fid` VALUES ('3001-06', '文件管理-上传文件', 'WJGLCSWJ', null);
INSERT INTO `t_fid` VALUES ('3001-07', '文件管理-编辑文件', 'WJGLBJWJ', null);
INSERT INTO `t_fid` VALUES ('3001-08', '文件管理-删除文件', 'WJGLSCWJ', null);
INSERT INTO `t_fid` VALUES ('3001-09', '文件管理-查看文件', 'WJGLCKWJ', null);
INSERT INTO `t_fid` VALUES ('3001-10', '文件管理-作废文件', 'WJGLZFWJ', null);
INSERT INTO `t_fid` VALUES ('3001-11', '文件管理-操作记录', 'WJGLCZJL', null);

-- ----------------------------
-- Table structure for t_fid_plus
-- ----------------------------
DROP TABLE IF EXISTS `t_fid_plus`;
CREATE TABLE `t_fid_plus` (
  `fid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fid_plus
-- ----------------------------

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件真实存放路径',
  `size` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '拓展名',
  `parent_dir_id` varchar(255) DEFAULT NULL COMMENT '所存放的文件夹id',
  `version` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户定义的版本号',
  `f_id` varchar(255) DEFAULT NULL COMMENT '文件多次修改这个id都不变， 根据这个可以查到某个文件修改的所有记录',
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `edit_user_id` varchar(255) DEFAULT NULL,
  `edit_user_name` varchar(255) DEFAULT NULL,
  `edit_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `del_user_id` varchar(255) DEFAULT NULL,
  `del_user_name` varchar(255) DEFAULT NULL,
  `del_time` varchar(255) DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT '0：正常\r\n1：作废',
  `remark` varchar(255) DEFAULT NULL COMMENT '文件备注',
  `is_del` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_file_log
-- ----------------------------
DROP TABLE IF EXISTS `t_file_log`;
CREATE TABLE `t_file_log` (
  `id` varchar(255) NOT NULL,
  `create_user_id` varchar(255) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '操作类型：\r\nadded 插入数据\r\nmodified 修改数据\r\ndeleted 删除数据',
  `content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `is_del` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_file_log_action
-- ----------------------------
DROP TABLE IF EXISTS `t_file_log_action`;
CREATE TABLE `t_file_log_action` (
  `id` varchar(255) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL COMMENT '操作的表名',
  `field_name` varchar(255) DEFAULT NULL COMMENT '字段名',
  `value` varchar(255) DEFAULT NULL COMMENT '操作类型为edit时用到：\r\n修改前的文件名称',
  `data_id` varchar(255) DEFAULT NULL COMMENT '数据的id',
  `log_id` varchar(255) DEFAULT NULL COMMENT 'file_log表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file_log_action
-- ----------------------------

-- ----------------------------
-- Table structure for t_file_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_file_permission`;
CREATE TABLE `t_file_permission` (
  `user_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `permission_fid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_form
-- ----------------------------
DROP TABLE IF EXISTS `t_form`;
CREATE TABLE `t_form` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `sys_form` int(11) NOT NULL DEFAULT '0',
  `md_version` int(11) NOT NULL DEFAULT '1',
  `memo` varchar(1000) DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form
-- ----------------------------

-- ----------------------------
-- Table structure for t_form_category
-- ----------------------------
DROP TABLE IF EXISTS `t_form_category`;
CREATE TABLE `t_form_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_form_cols
-- ----------------------------
DROP TABLE IF EXISTS `t_form_cols`;
CREATE TABLE `t_form_cols` (
  `id` varchar(255) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `db_field_name` varchar(255) NOT NULL,
  `db_field_type` varchar(255) NOT NULL,
  `db_field_length` int(11) NOT NULL,
  `db_field_decimal` int(11) NOT NULL,
  `show_order` int(11) NOT NULL,
  `col_span` int(11) NOT NULL,
  `value_from` int(11) DEFAULT NULL,
  `value_from_table_name` varchar(255) DEFAULT NULL,
  `value_from_col_name` varchar(255) DEFAULT NULL,
  `value_from_col_name_display` varchar(255) DEFAULT NULL,
  `must_input` int(11) DEFAULT '1',
  `sys_col` int(11) DEFAULT '1',
  `is_visible` int(11) DEFAULT '1',
  `note` varchar(1000) DEFAULT NULL,
  `editor_xtype` varchar(255) NOT NULL DEFAULT 'textfield',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form_cols
-- ----------------------------

-- ----------------------------
-- Table structure for t_form_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_form_detail`;
CREATE TABLE `t_form_detail` (
  `id` varchar(255) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `fk_name` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_form_detail_cols
-- ----------------------------
DROP TABLE IF EXISTS `t_form_detail_cols`;
CREATE TABLE `t_form_detail_cols` (
  `id` varchar(255) NOT NULL,
  `detail_id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `db_field_name` varchar(255) NOT NULL,
  `db_field_type` varchar(255) NOT NULL,
  `db_field_length` int(11) NOT NULL,
  `db_field_decimal` int(11) NOT NULL,
  `show_order` int(11) NOT NULL,
  `width_in_view` int(11) NOT NULL,
  `value_from` int(11) DEFAULT NULL,
  `value_from_table_name` varchar(255) DEFAULT NULL,
  `value_from_col_name` varchar(255) DEFAULT NULL,
  `value_from_col_name_display` varchar(255) DEFAULT NULL,
  `must_input` int(11) DEFAULT '1',
  `sys_col` int(11) DEFAULT '1',
  `is_visible` int(11) DEFAULT '1',
  `note` varchar(1000) DEFAULT NULL,
  `editor_xtype` varchar(255) NOT NULL DEFAULT 'textfield',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form_detail_cols
-- ----------------------------

-- ----------------------------
-- Table structure for t_form_md
-- ----------------------------
DROP TABLE IF EXISTS `t_form_md`;
CREATE TABLE `t_form_md` (
  `id` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `prop_name` varchar(255) NOT NULL,
  `prop_value` varchar(1000) NOT NULL,
  `show_order` int(11) NOT NULL DEFAULT '0',
  `form_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form_md
-- ----------------------------

-- ----------------------------
-- Table structure for t_fv_md
-- ----------------------------
DROP TABLE IF EXISTS `t_fv_md`;
CREATE TABLE `t_fv_md` (
  `id` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `prop_name` varchar(255) NOT NULL,
  `prop_value` varchar(1000) NOT NULL,
  `show_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fv_md
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sale_price` decimal(19,2) NOT NULL,
  `spec` varchar(255) NOT NULL,
  `unit_id` varchar(255) NOT NULL,
  `purchase_price` decimal(19,2) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `spec_py` varchar(255) DEFAULT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `brand_id` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1000',
  `tax_rate` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_bom
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_bom`;
CREATE TABLE `t_goods_bom` (
  `id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `sub_goods_id` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sub_goods_count` decimal(19,8) NOT NULL,
  `cost_weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_bom
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_brand`;
CREATE TABLE `t_goods_brand` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(1000) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_category`;
CREATE TABLE `t_goods_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(1000) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_price`;
CREATE TABLE `t_goods_price` (
  `id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `ps_id` varchar(255) NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_price
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_si
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_si`;
CREATE TABLE `t_goods_si` (
  `id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `safety_inventory` decimal(19,2) NOT NULL,
  `inventory_upper` decimal(19,2) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_si
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_unit`;
CREATE TABLE `t_goods_unit` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_unit
-- ----------------------------

-- ----------------------------
-- Table structure for t_ic_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_ic_bill`;
CREATE TABLE `t_ic_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ic_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_ic_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_ic_bill_detail`;
CREATE TABLE `t_ic_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `show_order` int(11) NOT NULL,
  `icbill_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ic_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_inventory
-- ----------------------------
DROP TABLE IF EXISTS `t_inventory`;
CREATE TABLE `t_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance_count` decimal(19,8) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `balance_price` decimal(19,2) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `in_count` decimal(19,8) DEFAULT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `in_price` decimal(19,2) DEFAULT NULL,
  `out_count` decimal(19,8) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `out_price` decimal(19,2) DEFAULT NULL,
  `afloat_count` decimal(19,8) DEFAULT NULL,
  `afloat_money` decimal(19,2) DEFAULT NULL,
  `afloat_price` decimal(19,2) DEFAULT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for t_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_inventory_detail`;
CREATE TABLE `t_inventory_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance_count` decimal(19,8) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `balance_price` decimal(19,2) NOT NULL,
  `biz_date` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `in_count` decimal(19,8) DEFAULT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `in_price` decimal(19,2) DEFAULT NULL,
  `out_count` decimal(19,8) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `out_price` decimal(19,2) DEFAULT NULL,
  `ref_number` varchar(255) DEFAULT NULL,
  `ref_type` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inventory_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_inventory_fifo
-- ----------------------------
DROP TABLE IF EXISTS `t_inventory_fifo`;
CREATE TABLE `t_inventory_fifo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance_count` decimal(19,8) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `balance_price` decimal(19,2) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `in_count` decimal(19,8) DEFAULT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `in_price` decimal(19,2) DEFAULT NULL,
  `out_count` decimal(19,8) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `out_price` decimal(19,2) DEFAULT NULL,
  `in_ref` varchar(255) DEFAULT NULL,
  `in_ref_type` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `pwbilldetail_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inventory_fifo
-- ----------------------------

-- ----------------------------
-- Table structure for t_inventory_fifo_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_inventory_fifo_detail`;
CREATE TABLE `t_inventory_fifo_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance_count` decimal(19,8) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `balance_price` decimal(19,2) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `in_count` decimal(19,8) DEFAULT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `in_price` decimal(19,2) DEFAULT NULL,
  `out_count` decimal(19,8) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `out_price` decimal(19,2) DEFAULT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `pwbilldetail_id` varchar(255) DEFAULT NULL,
  `wsbilldetail_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_inventory_fifo_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_it_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_it_bill`;
CREATE TABLE `t_it_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `from_warehouse_id` varchar(255) NOT NULL,
  `to_warehouse_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_it_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_it_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_it_bill_detail`;
CREATE TABLE `t_it_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `show_order` int(11) NOT NULL,
  `itbill_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_it_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu_item
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_item`;
CREATE TABLE `t_menu_item` (
  `id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `show_order` int(11) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_item
-- ----------------------------
INSERT INTO `t_menu_item` VALUES ('01', '文件', null, null, '1', '', '');
INSERT INTO `t_menu_item` VALUES ('0101', '首页', '-9997', '01', '1', 'SY', '');
INSERT INTO `t_menu_item` VALUES ('0102', '重新登录', '-9999', '01', '2', '', '');
INSERT INTO `t_menu_item` VALUES ('0103', '修改我的密码', '-9996', '01', '3', 'XGWDMM', '');
INSERT INTO `t_menu_item` VALUES ('02', '采购', null, null, '2', '', '');
INSERT INTO `t_menu_item` VALUES ('0200', '采购订单', '2027', '02', '0', 'CGDD', '');
INSERT INTO `t_menu_item` VALUES ('0201', '采购入库', '2001', '02', '1', 'CGRK', '');
INSERT INTO `t_menu_item` VALUES ('0202', '采购退货出库', '2007', '02', '2', 'CGTHCK', '');
INSERT INTO `t_menu_item` VALUES ('03', '库存', null, null, '3', '', '');
INSERT INTO `t_menu_item` VALUES ('0301', '库存账查询', '2003', '03', '1', 'KCZCX', '');
INSERT INTO `t_menu_item` VALUES ('0302', '库存建账', '2000', '03', '2', 'KCJZ', '');
INSERT INTO `t_menu_item` VALUES ('0303', '库间调拨', '2009', '03', '3', 'KJDB', '');
INSERT INTO `t_menu_item` VALUES ('0304', '库存盘点', '2010', '03', '4', 'KCPD', '');
INSERT INTO `t_menu_item` VALUES ('04', '销售', null, null, '5', '', '');
INSERT INTO `t_menu_item` VALUES ('0401', '销售合同', '2032', '04', '1', 'XSHT', '');
INSERT INTO `t_menu_item` VALUES ('0402', '销售订单', '2028', '04', '2', 'XSDD', '');
INSERT INTO `t_menu_item` VALUES ('0403', '销售出库', '2002', '04', '3', 'XSCK', '');
INSERT INTO `t_menu_item` VALUES ('0404', '销售退货入库', '2006', '04', '4', 'XSTHRK', '');
INSERT INTO `t_menu_item` VALUES ('05', '客户关系', null, null, '6', '', '');
INSERT INTO `t_menu_item` VALUES ('0501', '客户资料', '1007', '05', '1', 'KHZL', '');
INSERT INTO `t_menu_item` VALUES ('06', '资金', null, null, '7', '', '');
INSERT INTO `t_menu_item` VALUES ('0601', '应收账款管理', '2004', '06', '1', 'YSZKGL', '');
INSERT INTO `t_menu_item` VALUES ('0602', '应付账款管理', '2005', '06', '2', 'YFZKGL', '');
INSERT INTO `t_menu_item` VALUES ('0603', '现金收支查询', '2024', '06', '3', 'XJSZCX', '');
INSERT INTO `t_menu_item` VALUES ('0604', '预收款管理', '2025', '06', '4', 'YSKGL', '');
INSERT INTO `t_menu_item` VALUES ('0605', '预付款管理', '2026', '06', '5', 'YFKGL', '');
INSERT INTO `t_menu_item` VALUES ('07', '报表', null, null, '8', '', '');
INSERT INTO `t_menu_item` VALUES ('0701', '销售日报表', null, '07', '1', '', '');
INSERT INTO `t_menu_item` VALUES ('070101', '销售日报表(按商品汇总)', '2012', '0701', '1', 'XSRBBASPHZ', '');
INSERT INTO `t_menu_item` VALUES ('070102', '销售日报表(按客户汇总)', '2013', '0701', '2', 'XSRBBAKHHZ', '');
INSERT INTO `t_menu_item` VALUES ('070103', '销售日报表(按仓库汇总)', '2014', '0701', '3', 'XSRBBACKHZ', '');
INSERT INTO `t_menu_item` VALUES ('070104', '销售日报表(按业务员汇总)', '2015', '0701', '4', 'XSRBBAYWYHZ', '');
INSERT INTO `t_menu_item` VALUES ('0702', '销售月报表', null, '07', '2', '', '');
INSERT INTO `t_menu_item` VALUES ('070201', '销售月报表(按商品汇总)', '2016', '0702', '1', 'XSYBBASPHZ', '');
INSERT INTO `t_menu_item` VALUES ('070202', '销售月报表(按客户汇总)', '2017', '0702', '2', 'XSYBBAKHHZ', '');
INSERT INTO `t_menu_item` VALUES ('070203', '销售月报表(按仓库汇总)', '2018', '0702', '3', 'XSYBBACKHZ', '');
INSERT INTO `t_menu_item` VALUES ('070204', '销售月报表(按业务员汇总)', '2019', '0702', '4', 'XSYBBAYWYHZ', '');
INSERT INTO `t_menu_item` VALUES ('0703', '库存报表', null, '07', '3', '', '');
INSERT INTO `t_menu_item` VALUES ('070301', '安全库存明细表', '2020', '0703', '1', 'AQKCMXB', '');
INSERT INTO `t_menu_item` VALUES ('070302', '库存超上限明细表', '2023', '0703', '2', 'KCCSXMXB', '');
INSERT INTO `t_menu_item` VALUES ('0706', '资金报表', null, '07', '6', '', '');
INSERT INTO `t_menu_item` VALUES ('070601', '应收账款账龄分析表', '2021', '0706', '1', 'YSZKZLFXB', '');
INSERT INTO `t_menu_item` VALUES ('070602', '应付账款账龄分析表', '2022', '0706', '2', 'YFZKZLFXB', '');
INSERT INTO `t_menu_item` VALUES ('08', '基础数据', null, null, '10', '', '');
INSERT INTO `t_menu_item` VALUES ('0801', '商品', null, '08', '1', '', '');
INSERT INTO `t_menu_item` VALUES ('080101', '商品', '1001', '0801', '1', 'SP', '');
INSERT INTO `t_menu_item` VALUES ('080102', '商品计量单位', '1002', '0801', '2', 'SPJLDW', '');
INSERT INTO `t_menu_item` VALUES ('080103', '商品品牌', '2029', '0801', '3', '', 'SPPP');
INSERT INTO `t_menu_item` VALUES ('080104', '价格体系', '2031', '0801', '4', '', 'JGTX');
INSERT INTO `t_menu_item` VALUES ('0803', '仓库', '1003', '08', '3', 'CK', '');
INSERT INTO `t_menu_item` VALUES ('0804', '供应商档案', '1004', '08', '4', 'GYSDA', '');
INSERT INTO `t_menu_item` VALUES ('0805', '工厂', '2034', '08', '5', 'GC', '');
INSERT INTO `t_menu_item` VALUES ('09', '系统管理', null, null, '11', '', '');
INSERT INTO `t_menu_item` VALUES ('0901', '用户管理', '-8999', '09', '1', 'YHGL', '');
INSERT INTO `t_menu_item` VALUES ('0902', '权限管理', '-8996', '09', '2', 'QXGL', '');
INSERT INTO `t_menu_item` VALUES ('0903', '业务日志', '-8997', '09', '3', 'YWRZ', '');
INSERT INTO `t_menu_item` VALUES ('0904', '业务设置', '2008', '09', '4', '', 'YWSZ');
INSERT INTO `t_menu_item` VALUES ('0905', '二次开发', null, '09', '5', '', '');
INSERT INTO `t_menu_item` VALUES ('090501', '码表设置', '-7996', '0905', '1', 'MBSZ', '');
INSERT INTO `t_menu_item` VALUES ('090502', '自定义表单', '-7999', '0905', '2', 'ZDYBD', '');
INSERT INTO `t_menu_item` VALUES ('090503', '表单视图开发助手', '-7997', '0905', '3', 'BDSTKFZS', '');
INSERT INTO `t_menu_item` VALUES ('090504', '主菜单维护', '-7995', '0905', '4', 'ZCDWH', '');
INSERT INTO `t_menu_item` VALUES ('090505', '系统数据字典', '-7994', '0905', '5', 'XTSJZD', '');
INSERT INTO `t_menu_item` VALUES ('11', '财务总账', null, null, '9', '', '');
INSERT INTO `t_menu_item` VALUES ('1101', '基础数据', null, '11', '1', '', '');
INSERT INTO `t_menu_item` VALUES ('110101', '会计科目', '2101', '1101', '1', 'KJKM', '');
INSERT INTO `t_menu_item` VALUES ('110102', '银行账户', '2102', '1101', '2', 'YHZH', '');
INSERT INTO `t_menu_item` VALUES ('110103', '会计期间', '2103', '1101', '3', 'KJQJ', '');
INSERT INTO `t_menu_item` VALUES ('12', '加工', null, null, '4', '', '');
INSERT INTO `t_menu_item` VALUES ('1201', '存货拆分', '2033', '12', '1', 'CHCF', '');
INSERT INTO `t_menu_item` VALUES ('1202', '成品委托生产', null, '12', '2', '', '');
INSERT INTO `t_menu_item` VALUES ('120201', '成品委托生产订单', '2035', '1202', '1', 'CPWTSCDD', '');
INSERT INTO `t_menu_item` VALUES ('120202', '成品委托生产入库', '2036', '1202', '2', 'CPWTSCRK', '');
INSERT INTO `t_menu_item` VALUES ('13', '文件管理', null, null, '5', '', null);
INSERT INTO `t_menu_item` VALUES ('1301', '目录', '3001', '13', '1', 'WJGL', null);

-- ----------------------------
-- Table structure for t_menu_item_h5
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_item_h5`;
CREATE TABLE `t_menu_item_h5` (
  `id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `show_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_item_h5
-- ----------------------------
INSERT INTO `t_menu_item_h5` VALUES ('01', '销售', null, null, '1');
INSERT INTO `t_menu_item_h5` VALUES ('0101', '销售订单', '2028', '01', '1');
INSERT INTO `t_menu_item_h5` VALUES ('02', '客户关系', null, null, '2');
INSERT INTO `t_menu_item_h5` VALUES ('0201', '客户资料', '1007', '02', '1');

-- ----------------------------
-- Table structure for t_menu_item_plus
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_item_plus`;
CREATE TABLE `t_menu_item_plus` (
  `id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `show_order` int(11) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_item_plus
-- ----------------------------

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` varchar(255) NOT NULL,
  `full_name` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `org_code` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `org_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_org
-- ----------------------------
INSERT INTO `t_org` VALUES ('4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '公司', '公司', '01', null, '01', null);
INSERT INTO `t_org` VALUES ('5EBDBE11-A129-11E4-9B6A-782BCBD7746B', '公司\\信息部', '信息部', '0199', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '0101', null);

-- ----------------------------
-- Table structure for t_payables
-- ----------------------------
DROP TABLE IF EXISTS `t_payables`;
CREATE TABLE `t_payables` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `ca_id` varchar(255) NOT NULL,
  `ca_type` varchar(255) NOT NULL,
  `pay_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payables
-- ----------------------------

-- ----------------------------
-- Table structure for t_payables_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_payables_detail`;
CREATE TABLE `t_payables_detail` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `ca_id` varchar(255) NOT NULL,
  `ca_type` varchar(255) NOT NULL,
  `biz_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `pay_money` decimal(19,2) NOT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payables_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_payment`;
CREATE TABLE `t_payment` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `biz_date` datetime NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `pay_user_id` varchar(255) NOT NULL,
  `bill_id` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `ref_number` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(255) NOT NULL,
  `fid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('-7994', '-7994', '系统数据字典', '模块权限：通过菜单进入系统数据字典模块的权限', '系统数据字典', 'XTSJZD', '100');
INSERT INTO `t_permission` VALUES ('-7995', '-7995', '主菜单维护', '模块权限：通过菜单进入主菜单维护模块的权限', '主菜单维护', 'ZCDWH', '100');
INSERT INTO `t_permission` VALUES ('-7996', '-7996', '码表设置', '模块权限：通过菜单进入码表设置模块的权限', '码表设置', 'MBSZ', '100');
INSERT INTO `t_permission` VALUES ('-7999', '-7999', '自定义表单', '模块权限：通过菜单进入自定义表单模块的权限', '自定义表单', 'ZDYBD', '100');
INSERT INTO `t_permission` VALUES ('-8996', '-8996', '权限管理', '模块权限：通过菜单进入权限管理模块的权限', '权限管理', 'QXGL', '100');
INSERT INTO `t_permission` VALUES ('-8996-01', '-8996-01', '权限管理-新增角色', '按钮权限：权限管理模块[新增角色]按钮权限', '权限管理', 'QXGL_XZJS', '201');
INSERT INTO `t_permission` VALUES ('-8996-02', '-8996-02', '权限管理-编辑角色', '按钮权限：权限管理模块[编辑角色]按钮权限', '权限管理', 'QXGL_BJJS', '202');
INSERT INTO `t_permission` VALUES ('-8996-03', '-8996-03', '权限管理-删除角色', '按钮权限：权限管理模块[删除角色]按钮权限', '权限管理', 'QXGL_SCJS', '203');
INSERT INTO `t_permission` VALUES ('-8997', '-8997', '业务日志', '模块权限：通过菜单进入业务日志模块的权限', '系统管理', 'YWRZ', '100');
INSERT INTO `t_permission` VALUES ('-8999', '-8999', '用户管理', '模块权限：通过菜单进入用户管理模块的权限', '用户管理', 'YHGL', '100');
INSERT INTO `t_permission` VALUES ('-8999-01', '-8999-01', '组织机构在业务单据中的使用权限', '数据域权限：组织机构在业务单据中的使用权限', '用户管理', 'ZZJGZYWDJZDSYQX', '300');
INSERT INTO `t_permission` VALUES ('-8999-02', '-8999-02', '业务员在业务单据中的使用权限', '数据域权限：业务员在业务单据中的使用权限', '用户管理', 'YWYZYWDJZDSYQX', '301');
INSERT INTO `t_permission` VALUES ('-8999-03', '-8999-03', '用户管理-新增组织机构', '按钮权限：用户管理模块[新增组织机构]按钮权限', '用户管理', 'YHGL_XZZZJG', '201');
INSERT INTO `t_permission` VALUES ('-8999-04', '-8999-04', '用户管理-编辑组织机构', '按钮权限：用户管理模块[编辑组织机构]按钮权限', '用户管理', 'YHGL_BJZZJG', '202');
INSERT INTO `t_permission` VALUES ('-8999-05', '-8999-05', '用户管理-删除组织机构', '按钮权限：用户管理模块[删除组织机构]按钮权限', '用户管理', 'YHGL_SCZZJG', '203');
INSERT INTO `t_permission` VALUES ('-8999-06', '-8999-06', '用户管理-新增用户', '按钮权限：用户管理模块[新增用户]按钮权限', '用户管理', 'YHGL_XZYH', '204');
INSERT INTO `t_permission` VALUES ('-8999-07', '-8999-07', '用户管理-编辑用户', '按钮权限：用户管理模块[编辑用户]按钮权限', '用户管理', 'YHGL_BJYH', '205');
INSERT INTO `t_permission` VALUES ('-8999-08', '-8999-08', '用户管理-删除用户', '按钮权限：用户管理模块[删除用户]按钮权限', '用户管理', 'YHGL_SCYH', '206');
INSERT INTO `t_permission` VALUES ('-8999-09', '-8999-09', '用户管理-修改用户密码', '按钮权限：用户管理模块[修改用户密码]按钮权限', '用户管理', 'YHGL_XGYHMM', '207');
INSERT INTO `t_permission` VALUES ('1001', '1001', '商品', '模块权限：通过菜单进入商品模块的权限', '商品', 'SP', '100');
INSERT INTO `t_permission` VALUES ('1001-01', '1001-01', '商品在业务单据中的使用权限', '数据域权限：商品在业务单据中的使用权限', '商品', 'SPZYWDJZDSYQX', '300');
INSERT INTO `t_permission` VALUES ('1001-02', '1001-02', '商品分类', '数据域权限：商品模块中商品分类的数据权限', '商品', 'SPFL', '301');
INSERT INTO `t_permission` VALUES ('1001-03', '1001-03', '新增商品分类', '按钮权限：商品模块[新增商品分类]按钮权限', '商品', 'XZSPFL', '201');
INSERT INTO `t_permission` VALUES ('1001-04', '1001-04', '编辑商品分类', '按钮权限：商品模块[编辑商品分类]按钮权限', '商品', 'BJSPFL', '202');
INSERT INTO `t_permission` VALUES ('1001-05', '1001-05', '删除商品分类', '按钮权限：商品模块[删除商品分类]按钮权限', '商品', 'SCSPFL', '203');
INSERT INTO `t_permission` VALUES ('1001-06', '1001-06', '新增商品', '按钮权限：商品模块[新增商品]按钮权限', '商品', 'XZSP', '204');
INSERT INTO `t_permission` VALUES ('1001-07', '1001-07', '编辑商品', '按钮权限：商品模块[编辑商品]按钮权限', '商品', 'BJSP', '205');
INSERT INTO `t_permission` VALUES ('1001-08', '1001-08', '删除商品', '按钮权限：商品模块[删除商品]按钮权限', '商品', 'SCSP', '206');
INSERT INTO `t_permission` VALUES ('1001-09', '1001-09', '导入商品', '按钮权限：商品模块[导入商品]按钮权限', '商品', 'DRSP', '207');
INSERT INTO `t_permission` VALUES ('1001-10', '1001-10', '设置商品安全库存', '按钮权限：商品模块[设置安全库存]按钮权限', '商品', 'SZSPAQKC', '208');
INSERT INTO `t_permission` VALUES ('1001-11', '1001-11', '导出Excel', '按钮权限：商品模块[导出Excel]按钮权限', '商品', 'DCEXCEL', '209');
INSERT INTO `t_permission` VALUES ('1002', '1002', '商品计量单位', '模块权限：通过菜单进入商品计量单位模块的权限', '商品', 'SPJLDW', '500');
INSERT INTO `t_permission` VALUES ('1003', '1003', '仓库', '模块权限：通过菜单进入仓库的权限', '仓库', 'CK', '100');
INSERT INTO `t_permission` VALUES ('1003-01', '1003-01', '仓库在业务单据中的使用权限', '数据域权限：仓库在业务单据中的使用权限', '仓库', 'CKZYWDJZDSYQX', '300');
INSERT INTO `t_permission` VALUES ('1003-02', '1003-02', '新增仓库', '按钮权限：仓库模块[新增仓库]按钮权限', '仓库', 'XZCK', '201');
INSERT INTO `t_permission` VALUES ('1003-03', '1003-03', '编辑仓库', '按钮权限：仓库模块[编辑仓库]按钮权限', '仓库', 'BJCK', '202');
INSERT INTO `t_permission` VALUES ('1003-04', '1003-04', '删除仓库', '按钮权限：仓库模块[删除仓库]按钮权限', '仓库', 'SCCK', '203');
INSERT INTO `t_permission` VALUES ('1003-05', '1003-05', '修改仓库数据域', '按钮权限：仓库模块[修改数据域]按钮权限', '仓库', 'XGCKSJY', '204');
INSERT INTO `t_permission` VALUES ('1004', '1004', '供应商档案', '模块权限：通过菜单进入供应商档案的权限', '供应商管理', 'GYSDA', '100');
INSERT INTO `t_permission` VALUES ('1004-01', '1004-01', '供应商档案在业务单据中的使用权限', '数据域权限：供应商档案在业务单据中的使用权限', '供应商管理', 'GYSDAZYWDJZDSYQX', '301');
INSERT INTO `t_permission` VALUES ('1004-02', '1004-02', '供应商分类', '数据域权限：供应商档案模块中供应商分类的数据权限', '供应商管理', 'GYSFL', '300');
INSERT INTO `t_permission` VALUES ('1004-03', '1004-03', '新增供应商分类', '按钮权限：供应商档案模块[新增供应商分类]按钮权限', '供应商管理', 'XZGYSFL', '201');
INSERT INTO `t_permission` VALUES ('1004-04', '1004-04', '编辑供应商分类', '按钮权限：供应商档案模块[编辑供应商分类]按钮权限', '供应商管理', 'BJGYSFL', '202');
INSERT INTO `t_permission` VALUES ('1004-05', '1004-05', '删除供应商分类', '按钮权限：供应商档案模块[删除供应商分类]按钮权限', '供应商管理', 'SCGYSFL', '203');
INSERT INTO `t_permission` VALUES ('1004-06', '1004-06', '新增供应商', '按钮权限：供应商档案模块[新增供应商]按钮权限', '供应商管理', 'XZGYS', '204');
INSERT INTO `t_permission` VALUES ('1004-07', '1004-07', '编辑供应商', '按钮权限：供应商档案模块[编辑供应商]按钮权限', '供应商管理', 'BJGYS', '205');
INSERT INTO `t_permission` VALUES ('1004-08', '1004-08', '删除供应商', '按钮权限：供应商档案模块[删除供应商]按钮权限', '供应商管理', 'SCGYS', '206');
INSERT INTO `t_permission` VALUES ('1007', '1007', '客户资料', '模块权限：通过菜单进入客户资料模块的权限', '客户管理', 'KHZL', '100');
INSERT INTO `t_permission` VALUES ('1007-01', '1007-01', '客户资料在业务单据中的使用权限', '数据域权限：客户资料在业务单据中的使用权限', '客户管理', 'KHZLZYWDJZDSYQX', '300');
INSERT INTO `t_permission` VALUES ('1007-02', '1007-02', '客户分类', '数据域权限：客户档案模块中客户分类的数据权限', '客户管理', 'KHFL', '301');
INSERT INTO `t_permission` VALUES ('1007-03', '1007-03', '新增客户分类', '按钮权限：客户资料模块[新增客户分类]按钮权限', '客户管理', 'XZKHFL', '201');
INSERT INTO `t_permission` VALUES ('1007-04', '1007-04', '编辑客户分类', '按钮权限：客户资料模块[编辑客户分类]按钮权限', '客户管理', 'BJKHFL', '202');
INSERT INTO `t_permission` VALUES ('1007-05', '1007-05', '删除客户分类', '按钮权限：客户资料模块[删除客户分类]按钮权限', '客户管理', 'SCKHFL', '203');
INSERT INTO `t_permission` VALUES ('1007-06', '1007-06', '新增客户', '按钮权限：客户资料模块[新增客户]按钮权限', '客户管理', 'XZKH', '204');
INSERT INTO `t_permission` VALUES ('1007-07', '1007-07', '编辑客户', '按钮权限：客户资料模块[编辑客户]按钮权限', '客户管理', 'BJKH', '205');
INSERT INTO `t_permission` VALUES ('1007-08', '1007-08', '删除客户', '按钮权限：客户资料模块[删除客户]按钮权限', '客户管理', 'SCKH', '206');
INSERT INTO `t_permission` VALUES ('1007-09', '1007-09', '导入客户', '按钮权限：客户资料模块[导入客户]按钮权限', '客户管理', 'DRKH', '207');
INSERT INTO `t_permission` VALUES ('2000', '2000', '库存建账', '模块权限：通过菜单进入库存建账模块的权限', '库存建账', 'KCJZ', '100');
INSERT INTO `t_permission` VALUES ('2001', '2001', '采购入库', '模块权限：通过菜单进入采购入库模块的权限', '采购入库', 'CGRK', '100');
INSERT INTO `t_permission` VALUES ('2001-01', '2001-01', '采购入库-新建采购入库单', '按钮权限：采购入库模块[新建采购入库单]按钮权限', '采购入库', 'CGRK_XJCGRKD', '201');
INSERT INTO `t_permission` VALUES ('2001-02', '2001-02', '采购入库-编辑采购入库单', '按钮权限：采购入库模块[编辑采购入库单]按钮权限', '采购入库', 'CGRK_BJCGRKD', '202');
INSERT INTO `t_permission` VALUES ('2001-03', '2001-03', '采购入库-删除采购入库单', '按钮权限：采购入库模块[删除采购入库单]按钮权限', '采购入库', 'CGRK_SCCGRKD', '203');
INSERT INTO `t_permission` VALUES ('2001-04', '2001-04', '采购入库-提交入库', '按钮权限：采购入库模块[提交入库]按钮权限', '采购入库', 'CGRK_TJRK', '204');
INSERT INTO `t_permission` VALUES ('2001-05', '2001-05', '采购入库-单据生成PDF', '按钮权限：采购入库模块[单据生成PDF]按钮权限', '采购入库', 'CGRK_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2001-06', '2001-06', '采购入库-采购单价和金额可见', '字段权限：采购入库单的采购单价和金额可以被用户查看', '采购入库', 'CGRK_CGDJHJEKJ', '206');
INSERT INTO `t_permission` VALUES ('2001-07', '2001-07', '采购入库-打印', '按钮权限：采购入库模块[打印预览]和[直接打印]按钮权限', '采购入库', 'CGRK_DY', '207');
INSERT INTO `t_permission` VALUES ('2002', '2002', '销售出库', '模块权限：通过菜单进入销售出库模块的权限', '销售出库', 'XSCK', '100');
INSERT INTO `t_permission` VALUES ('2002-01', '2002-01', '销售出库-销售出库单允许编辑销售单价', '功能权限：销售出库单允许编辑销售单价', '销售出库', 'XSCKDYXBJXSDJ', '101');
INSERT INTO `t_permission` VALUES ('2002-02', '2002-02', '销售出库-新建销售出库单', '按钮权限：销售出库模块[新建销售出库单]按钮权限', '销售出库', 'XSCK_XJXSCKD', '201');
INSERT INTO `t_permission` VALUES ('2002-03', '2002-03', '销售出库-编辑销售出库单', '按钮权限：销售出库模块[编辑销售出库单]按钮权限', '销售出库', 'XSCK_BJXSCKD', '202');
INSERT INTO `t_permission` VALUES ('2002-04', '2002-04', '销售出库-删除销售出库单', '按钮权限：销售出库模块[删除销售出库单]按钮权限', '销售出库', 'XSCK_SCXSCKD', '203');
INSERT INTO `t_permission` VALUES ('2002-05', '2002-05', '销售出库-提交出库', '按钮权限：销售出库模块[提交出库]按钮权限', '销售出库', 'XSCK_TJCK', '204');
INSERT INTO `t_permission` VALUES ('2002-06', '2002-06', '销售出库-单据生成PDF', '按钮权限：销售出库模块[单据生成PDF]按钮权限', '销售出库', 'XSCK_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2002-07', '2002-07', '销售出库-打印', '按钮权限：销售出库模块[打印预览]和[直接打印]按钮权限', '销售出库', 'XSCK_DY', '207');
INSERT INTO `t_permission` VALUES ('2003', '2003', '库存账查询', '模块权限：通过菜单进入库存账查询模块的权限', '库存账查询', 'KCZCX', '100');
INSERT INTO `t_permission` VALUES ('2004', '2004', '应收账款管理', '模块权限：通过菜单进入应收账款管理模块的权限', '应收账款管理', 'YSZKGL', '100');
INSERT INTO `t_permission` VALUES ('2005', '2005', '应付账款管理', '模块权限：通过菜单进入应付账款管理模块的权限', '应付账款管理', 'YFZKGL', '100');
INSERT INTO `t_permission` VALUES ('2006', '2006', '销售退货入库', '模块权限：通过菜单进入销售退货入库模块的权限', '销售退货入库', 'XSTHRK', '100');
INSERT INTO `t_permission` VALUES ('2006-01', '2006-01', '销售退货入库-新建销售退货入库单', '按钮权限：销售退货入库模块[新建销售退货入库单]按钮权限', '销售退货入库', 'XSTHRK_XJXSTHRKD', '201');
INSERT INTO `t_permission` VALUES ('2006-02', '2006-02', '销售退货入库-编辑销售退货入库单', '按钮权限：销售退货入库模块[编辑销售退货入库单]按钮权限', '销售退货入库', 'XSTHRK_BJXSTHRKD', '202');
INSERT INTO `t_permission` VALUES ('2006-03', '2006-03', '销售退货入库-删除销售退货入库单', '按钮权限：销售退货入库模块[删除销售退货入库单]按钮权限', '销售退货入库', 'XSTHRK_SCXSTHRKD', '203');
INSERT INTO `t_permission` VALUES ('2006-04', '2006-04', '销售退货入库-提交入库', '按钮权限：销售退货入库模块[提交入库]按钮权限', '销售退货入库', 'XSTHRK_TJRK', '204');
INSERT INTO `t_permission` VALUES ('2006-05', '2006-05', '销售退货入库-单据生成PDF', '按钮权限：销售退货入库模块[单据生成PDF]按钮权限', '销售退货入库', 'XSTHRK_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2006-06', '2006-06', '销售退货入库-打印', '按钮权限：销售退货入库模块[打印预览]和[直接打印]按钮权限', '销售退货入库', 'XSTHRK_DY', '206');
INSERT INTO `t_permission` VALUES ('2007', '2007', '采购退货出库', '模块权限：通过菜单进入采购退货出库模块的权限', '采购退货出库', 'CGTHCK', '100');
INSERT INTO `t_permission` VALUES ('2007-01', '2007-01', '采购退货出库-新建采购退货出库单', '按钮权限：采购退货出库模块[新建采购退货出库单]按钮权限', '采购退货出库', 'CGTHCK_XJCGTHCKD', '201');
INSERT INTO `t_permission` VALUES ('2007-02', '2007-02', '采购退货出库-编辑采购退货出库单', '按钮权限：采购退货出库模块[编辑采购退货出库单]按钮权限', '采购退货出库', 'CGTHCK_BJCGTHCKD', '202');
INSERT INTO `t_permission` VALUES ('2007-03', '2007-03', '采购退货出库-删除采购退货出库单', '按钮权限：采购退货出库模块[删除采购退货出库单]按钮权限', '采购退货出库', 'CGTHCK_SCCGTHCKD', '203');
INSERT INTO `t_permission` VALUES ('2007-04', '2007-04', '采购退货出库-提交采购退货出库单', '按钮权限：采购退货出库模块[提交采购退货出库单]按钮权限', '采购退货出库', 'CGTHCK_TJCGTHCKD', '204');
INSERT INTO `t_permission` VALUES ('2007-05', '2007-05', '采购退货出库-单据生成PDF', '按钮权限：采购退货出库模块[单据生成PDF]按钮权限', '采购退货出库', 'CGTHCK_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2007-06', '2007-06', '采购退货出库-打印', '按钮权限：采购退货出库模块[打印预览]和[直接打印]按钮权限', '采购退货出库', 'CGTHCK_DY', '206');
INSERT INTO `t_permission` VALUES ('2008', '2008', '业务设置', '模块权限：通过菜单进入业务设置模块的权限', '系统管理', 'YWSZ', '100');
INSERT INTO `t_permission` VALUES ('2009', '2009', '库间调拨', '模块权限：通过菜单进入库间调拨模块的权限', '库间调拨', 'KJDB', '100');
INSERT INTO `t_permission` VALUES ('2009-01', '2009-01', '库间调拨-新建调拨单', '按钮权限：库间调拨模块[新建调拨单]按钮权限', '库间调拨', 'KJDB_XJDBD', '201');
INSERT INTO `t_permission` VALUES ('2009-02', '2009-02', '库间调拨-编辑调拨单', '按钮权限：库间调拨模块[编辑调拨单]按钮权限', '库间调拨', 'KJDB_BJDBD', '202');
INSERT INTO `t_permission` VALUES ('2009-03', '2009-03', '库间调拨-删除调拨单', '按钮权限：库间调拨模块[删除调拨单]按钮权限', '库间调拨', 'KJDB_SCDBD', '203');
INSERT INTO `t_permission` VALUES ('2009-04', '2009-04', '库间调拨-提交调拨单', '按钮权限：库间调拨模块[提交调拨单]按钮权限', '库间调拨', 'KJDB_TJDBD', '204');
INSERT INTO `t_permission` VALUES ('2009-05', '2009-05', '库间调拨-单据生成PDF', '按钮权限：库间调拨模块[单据生成PDF]按钮权限', '库间调拨', 'KJDB_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2009-06', '2009-06', '库间调拨-打印', '按钮权限：库间调拨模块[打印预览]和[直接打印]按钮权限', '库间调拨', 'KJDB_DY', '206');
INSERT INTO `t_permission` VALUES ('2010', '2010', '库存盘点', '模块权限：通过菜单进入库存盘点模块的权限', '库存盘点', 'KCPD', '100');
INSERT INTO `t_permission` VALUES ('2010-01', '2010-01', '库存盘点-新建盘点单', '按钮权限：库存盘点模块[新建盘点单]按钮权限', '库存盘点', 'KCPD_XJPDD', '201');
INSERT INTO `t_permission` VALUES ('2010-02', '2010-02', '库存盘点-编辑盘点单', '按钮权限：库存盘点模块[编辑盘点单]按钮权限', '库存盘点', 'KCPD_BJPDD', '202');
INSERT INTO `t_permission` VALUES ('2010-03', '2010-03', '库存盘点-删除盘点单', '按钮权限：库存盘点模块[删除盘点单]按钮权限', '库存盘点', 'KCPD_SCPDD', '203');
INSERT INTO `t_permission` VALUES ('2010-04', '2010-04', '库存盘点-提交盘点单', '按钮权限：库存盘点模块[提交盘点单]按钮权限', '库存盘点', 'KCPD_TJPDD', '204');
INSERT INTO `t_permission` VALUES ('2010-05', '2010-05', '库存盘点-单据生成PDF', '按钮权限：库存盘点模块[单据生成PDF]按钮权限', '库存盘点', 'KCPD_DJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2010-06', '2010-06', '库存盘点-打印', '按钮权限：库存盘点模块[打印预览]和[直接打印]按钮权限', '库存盘点', 'KCPD_DY', '206');
INSERT INTO `t_permission` VALUES ('2011-01', '2011-01', '首页-销售看板', '功能权限：在首页显示销售看板', '首页看板', 'SY_XSKB', '100');
INSERT INTO `t_permission` VALUES ('2011-02', '2011-02', '首页-库存看板', '功能权限：在首页显示库存看板', '首页看板', 'SY_KCKB', '100');
INSERT INTO `t_permission` VALUES ('2011-03', '2011-03', '首页-采购看板', '功能权限：在首页显示采购看板', '首页看板', 'SY_CGKB', '100');
INSERT INTO `t_permission` VALUES ('2011-04', '2011-04', '首页-资金看板', '功能权限：在首页显示资金看板', '首页看板', 'SY_ZJKB', '100');
INSERT INTO `t_permission` VALUES ('2012', '2012', '报表-销售日报表(按商品汇总)', '模块权限：通过菜单进入销售日报表(按商品汇总)模块的权限', '销售日报表', 'BB_XSRBB_ASPHZ_', '100');
INSERT INTO `t_permission` VALUES ('2013', '2013', '报表-销售日报表(按客户汇总)', '模块权限：通过菜单进入销售日报表(按客户汇总)模块的权限', '销售日报表', 'BB_XSRBB_AKHHZ_', '100');
INSERT INTO `t_permission` VALUES ('2014', '2014', '报表-销售日报表(按仓库汇总)', '模块权限：通过菜单进入销售日报表(按仓库汇总)模块的权限', '销售日报表', 'BB_XSRBB_ACKHZ_', '100');
INSERT INTO `t_permission` VALUES ('2015', '2015', '报表-销售日报表(按业务员汇总)', '模块权限：通过菜单进入销售日报表(按业务员汇总)模块的权限', '销售日报表', 'BB_XSRBB_AYWYHZ_', '100');
INSERT INTO `t_permission` VALUES ('2016', '2016', '报表-销售月报表(按商品汇总)', '模块权限：通过菜单进入销售月报表(按商品汇总)模块的权限', '销售月报表', 'BB_XSYBB_ASPHZ_', '100');
INSERT INTO `t_permission` VALUES ('2017', '2017', '报表-销售月报表(按客户汇总)', '模块权限：通过菜单进入销售月报表(按客户汇总)模块的权限', '销售月报表', 'BB_XSYBB_AKHHZ_', '100');
INSERT INTO `t_permission` VALUES ('2018', '2018', '报表-销售月报表(按仓库汇总)', '模块权限：通过菜单进入销售月报表(按仓库汇总)模块的权限', '销售月报表', 'BB_XSYBB_ACKHZ_', '100');
INSERT INTO `t_permission` VALUES ('2019', '2019', '报表-销售月报表(按业务员汇总)', '模块权限：通过菜单进入销售月报表(按业务员汇总)模块的权限', '销售月报表', 'BB_XSYBB_AYWYHZ_', '100');
INSERT INTO `t_permission` VALUES ('2020', '2020', '报表-安全库存明细表', '模块权限：通过菜单进入安全库存明细表模块的权限', '库存报表', 'BB_AQKCMXB', '100');
INSERT INTO `t_permission` VALUES ('2021', '2021', '报表-应收账款账龄分析表', '模块权限：通过菜单进入应收账款账龄分析表模块的权限', '资金报表', 'BB_YSZKZLFXB', '100');
INSERT INTO `t_permission` VALUES ('2022', '2022', '报表-应付账款账龄分析表', '模块权限：通过菜单进入应付账款账龄分析表模块的权限', '资金报表', 'BB_YFZKZLFXB', '100');
INSERT INTO `t_permission` VALUES ('2023', '2023', '报表-库存超上限明细表', '模块权限：通过菜单进入库存超上限明细表模块的权限', '库存报表', 'BB_KCCSXMXB', '100');
INSERT INTO `t_permission` VALUES ('2024', '2024', '现金收支查询', '模块权限：通过菜单进入现金收支查询模块的权限', '现金管理', 'XJSZCX', '100');
INSERT INTO `t_permission` VALUES ('2025', '2025', '预收款管理', '模块权限：通过菜单进入预收款管理模块的权限', '预收款管理', 'YSKGL', '100');
INSERT INTO `t_permission` VALUES ('2026', '2026', '预付款管理', '模块权限：通过菜单进入预付款管理模块的权限', '预付款管理', 'YFKGL', '100');
INSERT INTO `t_permission` VALUES ('2027', '2027', '采购订单', '模块权限：通过菜单进入采购订单模块的权限', '采购订单', 'CGDD', '100');
INSERT INTO `t_permission` VALUES ('2027-01', '2027-01', '采购订单-审核/取消审核', '按钮权限：采购订单模块[审核]按钮和[取消审核]按钮的权限', '采购订单', 'CGDD _ SH_QXSH', '204');
INSERT INTO `t_permission` VALUES ('2027-02', '2027-02', '采购订单-生成采购入库单', '按钮权限：采购订单模块[生成采购入库单]按钮权限', '采购订单', 'CGDD _ SCCGRKD', '205');
INSERT INTO `t_permission` VALUES ('2027-03', '2027-03', '采购订单-新建采购订单', '按钮权限：采购订单模块[新建采购订单]按钮权限', '采购订单', 'CGDD _ XJCGDD', '201');
INSERT INTO `t_permission` VALUES ('2027-04', '2027-04', '采购订单-编辑采购订单', '按钮权限：采购订单模块[编辑采购订单]按钮权限', '采购订单', 'CGDD _ BJCGDD', '202');
INSERT INTO `t_permission` VALUES ('2027-05', '2027-05', '采购订单-删除采购订单', '按钮权限：采购订单模块[删除采购订单]按钮权限', '采购订单', 'CGDD _ SCCGDD', '203');
INSERT INTO `t_permission` VALUES ('2027-06', '2027-06', '采购订单-关闭订单/取消关闭订单', '按钮权限：采购订单模块[关闭采购订单]和[取消采购订单关闭状态]按钮权限', '采购订单', 'CGDD _ GBDD_QXGBDD', '206');
INSERT INTO `t_permission` VALUES ('2027-07', '2027-07', '采购订单-单据生成PDF', '按钮权限：采购订单模块[单据生成PDF]按钮权限', '采购订单', 'CGDD _ DJSCPDF', '207');
INSERT INTO `t_permission` VALUES ('2027-08', '2027-08', '采购订单-打印', '按钮权限：采购订单模块[打印预览]和[直接打印]按钮权限', '采购订单', 'CGDD_DY', '208');
INSERT INTO `t_permission` VALUES ('2028', '2028', '销售订单', '模块权限：通过菜单进入销售订单模块的权限', '销售订单', 'XSDD', '100');
INSERT INTO `t_permission` VALUES ('2028-01', '2028-01', '销售订单-审核/取消审核', '按钮权限：销售订单模块[审核]按钮和[取消审核]按钮的权限', '销售订单', 'XSDD_SH_QXSH', '204');
INSERT INTO `t_permission` VALUES ('2028-02', '2028-02', '销售订单-生成销售出库单', '按钮权限：销售订单模块[生成销售出库单]按钮的权限', '销售订单', 'XSDD_SCXSCKD', '206');
INSERT INTO `t_permission` VALUES ('2028-03', '2028-03', '销售订单-新建销售订单', '按钮权限：销售订单模块[新建销售订单]按钮的权限', '销售订单', 'XSDD_XJXSDD', '201');
INSERT INTO `t_permission` VALUES ('2028-04', '2028-04', '销售订单-编辑销售订单', '按钮权限：销售订单模块[编辑销售订单]按钮的权限', '销售订单', 'XSDD_BJXSDD', '202');
INSERT INTO `t_permission` VALUES ('2028-05', '2028-05', '销售订单-删除销售订单', '按钮权限：销售订单模块[删除销售订单]按钮的权限', '销售订单', 'XSDD_SCXSDD', '203');
INSERT INTO `t_permission` VALUES ('2028-06', '2028-06', '销售订单-单据生成PDF', '按钮权限：销售订单模块[单据生成PDF]按钮的权限', '销售订单', 'XSDD_DJSCPDF', '207');
INSERT INTO `t_permission` VALUES ('2028-07', '2028-07', '销售订单-打印', '按钮权限：销售订单模块[打印预览]和[直接打印]按钮的权限', '销售订单', 'XSDD_DY', '208');
INSERT INTO `t_permission` VALUES ('2028-08', '2028-08', '销售订单-生成采购订单', '按钮权限：销售订单模块[生成采购订单]按钮的权限', '销售订单', 'XSDD_SCCGDD', '205');
INSERT INTO `t_permission` VALUES ('2028-09', '2028-09', '销售订单-关闭订单/取消关闭订单', '按钮权限：销售订单模块[关闭销售订单]和[取消销售订单关闭状态]按钮的权限', '销售订单', 'XSDD_GBDD', '209');
INSERT INTO `t_permission` VALUES ('2029', '2029', '商品品牌', '模块权限：通过菜单进入商品品牌模块的权限', '商品', 'SPPP', '600');
INSERT INTO `t_permission` VALUES ('2030-01', '2030-01', '商品构成-新增子商品', '按钮权限：商品模块[新增子商品]按钮权限', '商品', 'SPGC_XZZSP', '209');
INSERT INTO `t_permission` VALUES ('2030-02', '2030-02', '商品构成-编辑子商品', '按钮权限：商品模块[编辑子商品]按钮权限', '商品', 'SPGC_BJZSP', '210');
INSERT INTO `t_permission` VALUES ('2030-03', '2030-03', '商品构成-删除子商品', '按钮权限：商品模块[删除子商品]按钮权限', '商品', 'SPGC_SCZSP', '211');
INSERT INTO `t_permission` VALUES ('2031', '2031', '价格体系', '模块权限：通过菜单进入价格体系模块的权限', '商品', 'JGTX', '700');
INSERT INTO `t_permission` VALUES ('2031-01', '2031-01', '商品-设置商品价格体系', '按钮权限：商品模块[设置商品价格体系]按钮权限', '商品', 'JGTX', '701');
INSERT INTO `t_permission` VALUES ('2032', '2032', '销售合同', '模块权限：通过菜单进入销售合同模块的权限', '销售合同', 'XSHT', '100');
INSERT INTO `t_permission` VALUES ('2032-01', '2032-01', '销售合同-新建销售合同', '按钮权限：销售合同模块[新建销售合同]按钮的权限', '销售合同', 'XSHT_XJXSHT', '201');
INSERT INTO `t_permission` VALUES ('2032-02', '2032-02', '销售合同-编辑销售合同', '按钮权限：销售合同模块[编辑销售合同]按钮的权限', '销售合同', 'XSHT_BJXSHT', '202');
INSERT INTO `t_permission` VALUES ('2032-03', '2032-03', '销售合同-删除销售合同', '按钮权限：销售合同模块[删除销售合同]按钮的权限', '销售合同', 'XSHT_SCXSHT', '203');
INSERT INTO `t_permission` VALUES ('2032-04', '2032-04', '销售合同-审核/取消审核', '按钮权限：销售合同模块[审核]按钮和[取消审核]按钮的权限', '销售合同', 'XSHT_SH_QXSH', '204');
INSERT INTO `t_permission` VALUES ('2032-05', '2032-05', '销售合同-生成销售订单', '按钮权限：销售合同模块[生成销售订单]按钮的权限', '销售合同', 'XSHT_SCXSDD', '205');
INSERT INTO `t_permission` VALUES ('2032-06', '2032-06', '销售合同-单据生成PDF', '按钮权限：销售合同模块[单据生成PDF]按钮的权限', '销售合同', 'XSHT_DJSCPDF', '206');
INSERT INTO `t_permission` VALUES ('2032-07', '2032-07', '销售合同-打印', '按钮权限：销售合同模块[打印预览]和[直接打印]按钮的权限', '销售合同', 'XSHT_DY', '207');
INSERT INTO `t_permission` VALUES ('2033', '2033', '存货拆分', '模块权限：通过菜单进入存货拆分模块的权限', '存货拆分', 'CHCF', '100');
INSERT INTO `t_permission` VALUES ('2033-01', '2033-01', '存货拆分-新建拆分单', '按钮权限：存货拆分模块[新建拆分单]按钮的权限', '存货拆分', 'CHCFXJCFD', '201');
INSERT INTO `t_permission` VALUES ('2033-02', '2033-02', '存货拆分-编辑拆分单', '按钮权限：存货拆分模块[编辑拆分单]按钮的权限', '存货拆分', 'CHCFBJCFD', '202');
INSERT INTO `t_permission` VALUES ('2033-03', '2033-03', '存货拆分-删除拆分单', '按钮权限：存货拆分模块[删除拆分单]按钮的权限', '存货拆分', 'CHCFSCCFD', '203');
INSERT INTO `t_permission` VALUES ('2033-04', '2033-04', '存货拆分-提交拆分单', '按钮权限：存货拆分模块[提交拆分单]按钮的权限', '存货拆分', 'CHCFTJCFD', '204');
INSERT INTO `t_permission` VALUES ('2033-05', '2033-05', '存货拆分-单据生成PDF', '按钮权限：存货拆分模块[单据生成PDF]按钮的权限', '存货拆分', 'CHCFDJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2033-06', '2033-06', '存货拆分-打印', '按钮权限：存货拆分模块[打印预览]和[直接打印]按钮的权限', '存货拆分', 'CHCFDY', '206');
INSERT INTO `t_permission` VALUES ('2034', '2034', '工厂', '模块权限：通过菜单进入工厂模块的权限', '工厂', 'GC', '100');
INSERT INTO `t_permission` VALUES ('2034-01', '2034-01', '工厂在业务单据中的使用权限', '数据域权限：工厂在业务单据中的使用权限', '工厂', 'GCCYWDJZDSYQX', '301');
INSERT INTO `t_permission` VALUES ('2034-02', '2034-02', '工厂分类', '数据域权限：工厂模块中工厂分类的数据权限', '工厂', 'GCFL', '300');
INSERT INTO `t_permission` VALUES ('2034-03', '2034-03', '新增工厂分类', '按钮权限：工厂模块[新增工厂分类]按钮权限', '工厂', 'XZGYSFL', '201');
INSERT INTO `t_permission` VALUES ('2034-04', '2034-04', '编辑工厂分类', '按钮权限：工厂模块[编辑工厂分类]按钮权限', '工厂', 'BJGYSFL', '202');
INSERT INTO `t_permission` VALUES ('2034-05', '2034-05', '删除工厂分类', '按钮权限：工厂模块[删除工厂分类]按钮权限', '工厂', 'SCGYSFL', '203');
INSERT INTO `t_permission` VALUES ('2034-06', '2034-06', '新增工厂', '按钮权限：工厂模块[新增工厂]按钮权限', '工厂', 'XZGYS', '204');
INSERT INTO `t_permission` VALUES ('2034-07', '2034-07', '编辑工厂', '按钮权限：工厂模块[编辑工厂]按钮权限', '工厂', 'BJGYS', '205');
INSERT INTO `t_permission` VALUES ('2034-08', '2034-08', '删除工厂', '按钮权限：工厂模块[删除工厂]按钮权限', '工厂', 'SCGYS', '206');
INSERT INTO `t_permission` VALUES ('2035', '2035', '成品委托生产订单', '模块权限：通过菜单进入成品委托生产订单模块的权限', '成品委托生产订单', 'CPWTSCDD', '100');
INSERT INTO `t_permission` VALUES ('2035-01', '2035-01', '成品委托生产订单-新建成品委托生产订单', '按钮权限：成品委托生产订单模块[新建成品委托生产订单]按钮的权限', '成品委托生产订单', 'CPWTSCDDXJCPWTSCDD', '201');
INSERT INTO `t_permission` VALUES ('2035-02', '2035-02', '成品委托生产订单-编辑成品委托生产订单', '按钮权限：成品委托生产订单模块[编辑成品委托生产订单]按钮的权限', '成品委托生产订单', 'CPWTSCDDBJCPWTSCDD', '202');
INSERT INTO `t_permission` VALUES ('2035-03', '2035-03', '成品委托生产订单-删除成品委托生产订单', '按钮权限：成品委托生产订单模块[删除成品委托生产订单]按钮的权限', '成品委托生产订单', 'CPWTSCDDSCCPWTSCDD', '203');
INSERT INTO `t_permission` VALUES ('2035-04', '2035-04', '成品委托生产订单-审核/取消审核', '按钮权限：成品委托生产订单模块[审核]和[取消审核]按钮的权限', '成品委托生产订单', 'CPWTSCDDSHQXSH', '204');
INSERT INTO `t_permission` VALUES ('2035-05', '2035-05', '成品委托生产订单-生成成品委托生产入库单', '按钮权限：成品委托生产订单模块[生成成品委托生产入库单]按钮的权限', '成品委托生产订单', 'CPWTSCDDSCCPWTSCRKD', '205');
INSERT INTO `t_permission` VALUES ('2035-06', '2035-06', '成品委托生产订单-关闭/取消关闭成品委托生产订单', '按钮权限：成品委托生产订单模块[关闭成品委托生产订单]和[取消关闭成品委托生产订单]按钮的权限', '成品委托生产订单', 'CPWTSCDGBJCPWTSCDD', '206');
INSERT INTO `t_permission` VALUES ('2035-07', '2035-07', '成品委托生产订单-单据生成PDF', '按钮权限：成品委托生产订单模块[单据生成PDF]按钮的权限', '成品委托生产订单', 'CPWTSCDDDJSCPDF', '207');
INSERT INTO `t_permission` VALUES ('2035-08', '2035-08', '成品委托生产订单-打印', '按钮权限：成品委托生产订单模块[打印预览]和[直接打印]按钮的权限', '成品委托生产订单', 'CPWTSCDDDY', '208');
INSERT INTO `t_permission` VALUES ('2036', '2036', '成品委托生产入库', '模块权限：通过菜单进入成品委托生产入库模块的权限', '成品委托生产入库', 'CPWTSCRK', '100');
INSERT INTO `t_permission` VALUES ('2036-01', '2036-01', '成品委托生产入库-新建成品委托生产入库单', '按钮权限：成品委托生产入库模块[新建成品委托生产入库单]按钮的权限', '成品委托生产入库', 'CPWTSCRKXJCPWTSCRKD', '201');
INSERT INTO `t_permission` VALUES ('2036-02', '2036-02', '成品委托生产入库-编辑成品委托生产入库单', '按钮权限：成品委托生产入库模块[编辑成品委托生产入库单]按钮的权限', '成品委托生产入库', 'CPWTSCRKBJCPWTSCRKD', '202');
INSERT INTO `t_permission` VALUES ('2036-03', '2036-03', '成品委托生产入库-删除成品委托生产入库单', '按钮权限：成品委托生产入库模块[删除成品委托生产入库单]按钮的权限', '成品委托生产入库', 'CPWTSCRKSCCPWTSCRKD', '203');
INSERT INTO `t_permission` VALUES ('2036-04', '2036-04', '成品委托生产入库-提交入库', '按钮权限：成品委托生产入库模块[提交入库]按钮的权限', '成品委托生产入库', 'CPWTSCRKTJRK', '204');
INSERT INTO `t_permission` VALUES ('2036-05', '2036-05', '成品委托生产入库-单据生成PDF', '按钮权限：成品委托生产入库模块[单据生成PDF]按钮的权限', '成品委托生产入库', 'CPWTSCRKDJSCPDF', '205');
INSERT INTO `t_permission` VALUES ('2036-06', '2036-06', '成品委托生产入库-打印', '按钮权限：成品委托生产入库模块[打印预览]和[直接打印]按钮的权限', '成品委托生产入库', 'CPWTSCRKDY', '206');
INSERT INTO `t_permission` VALUES ('2101', '2101', '会计科目', '模块权限：通过菜单进入会计科目模块的权限', '会计科目', 'KJKM', '100');
INSERT INTO `t_permission` VALUES ('2102', '2102', '银行账户', '模块权限：通过菜单进入银行账户模块的权限', '银行账户', 'YHZH', '100');
INSERT INTO `t_permission` VALUES ('2103', '2103', '会计期间', '模块权限：通过菜单进入会计期间模块的权限', '会计期间', 'KJQJ', '100');
INSERT INTO `t_permission` VALUES ('3001', '3001', '目录', '模块权限：通过菜单进入文件目录的权限', '文件管理', 'WJGL', '100');
INSERT INTO `t_permission` VALUES ('3001-01', '3001-01', '文件管理-新增文件夹', '按钮权限：文件夹目录中[新建文件夹]按钮的权限', '文件管理', 'WJGLXZWJJ', '101');
INSERT INTO `t_permission` VALUES ('3001-02', '3001-02', '文件管理-编辑文件夹', '按钮权限：文件夹目录中[编辑文件夹]按钮的权限', '文件管理', 'WJGLBJWJJ', '102');
INSERT INTO `t_permission` VALUES ('3001-04', '3001-04', '文件管理-删除文件夹', '按钮权限：文件夹目录中[删除文件夹]按钮的权限', '文件管理', 'WJGLSCWJJ', '103');
INSERT INTO `t_permission` VALUES ('3001-05', '3001-05', '文件管理-作废文件夹', '按钮权限：文件夹目录中[作废文件夹]按钮的权限', '文件管理', 'WJGLZFWJJ', '104');
INSERT INTO `t_permission` VALUES ('3001-06', '3001-06', '文件管理-上传文件', '按钮权限：文件目录中[上传文件]按钮的权限', '文件管理', 'WJGLSCWJ', '105');
INSERT INTO `t_permission` VALUES ('3001-07', '3001-07', '文件管理-编辑文件', '按钮权限：文件目录中[编辑文件]按钮的权限', '文件管理', 'WJGLBJWJ', '106');
INSERT INTO `t_permission` VALUES ('3001-08', '3001-08', '文件管理-删除文件', '按钮权限：文件目录中[删除文件]按钮的权限', '文件管理', 'WJGLSCWJ', '107');
INSERT INTO `t_permission` VALUES ('3001-10', '3001-10', '文件管理-作废文件', '按钮权限：文件目录中[作废文件]按钮的权限', '文件管理', 'WJGLZFWJ', '108');
INSERT INTO `t_permission` VALUES ('3001-11', '3001-11', '文件管理-操作记录', '按钮权限：文件目录中[操作记录]按钮的权限', '文件管理', 'WJGLCZJL', '109');

-- ----------------------------
-- Table structure for t_permission_plus
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_plus`;
CREATE TABLE `t_permission_plus` (
  `id` varchar(255) NOT NULL,
  `fid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission_plus
-- ----------------------------

-- ----------------------------
-- Table structure for t_po_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_po_bill`;
CREATE TABLE `t_po_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `deal_date` datetime NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `deal_address` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `confirm_user_id` varchar(255) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_po_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_po_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_po_bill_detail`;
CREATE TABLE `t_po_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `pobill_id` varchar(255) NOT NULL,
  `tax_rate` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `pw_count` decimal(19,8) NOT NULL,
  `left_count` decimal(19,8) NOT NULL,
  `show_order` int(11) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_po_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_po_pw
-- ----------------------------
DROP TABLE IF EXISTS `t_po_pw`;
CREATE TABLE `t_po_pw` (
  `po_id` varchar(255) NOT NULL,
  `pw_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_po_pw
-- ----------------------------

-- ----------------------------
-- Table structure for t_pre_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_pre_payment`;
CREATE TABLE `t_pre_payment` (
  `id` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pre_payment
-- ----------------------------

-- ----------------------------
-- Table structure for t_pre_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_pre_payment_detail`;
CREATE TABLE `t_pre_payment_detail` (
  `id` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `biz_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pre_payment_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_pre_receiving
-- ----------------------------
DROP TABLE IF EXISTS `t_pre_receiving`;
CREATE TABLE `t_pre_receiving` (
  `id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pre_receiving
-- ----------------------------

-- ----------------------------
-- Table structure for t_pre_receiving_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_pre_receiving_detail`;
CREATE TABLE `t_pre_receiving_detail` (
  `id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `in_money` decimal(19,2) DEFAULT NULL,
  `out_money` decimal(19,2) DEFAULT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `biz_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pre_receiving_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_price_system
-- ----------------------------
DROP TABLE IF EXISTS `t_price_system`;
CREATE TABLE `t_price_system` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `factor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_price_system
-- ----------------------------

-- ----------------------------
-- Table structure for t_pr_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_pr_bill`;
CREATE TABLE `t_pr_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `inventory_money` decimal(19,2) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `rejection_money` decimal(19,2) DEFAULT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `pw_bill_id` varchar(255) NOT NULL,
  `receiving_type` int(11) NOT NULL DEFAULT '0',
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `rejection_money_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pr_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_pr_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_pr_bill_detail`;
CREATE TABLE `t_pr_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `inventory_money` decimal(19,2) NOT NULL,
  `inventory_price` decimal(19,2) NOT NULL,
  `rejection_goods_count` decimal(19,8) NOT NULL,
  `rejection_goods_price` decimal(19,2) NOT NULL,
  `rejection_money` decimal(19,2) NOT NULL,
  `show_order` int(11) NOT NULL,
  `prbill_id` varchar(255) NOT NULL,
  `pwbilldetail_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `rejection_money_with_tax` decimal(19,2) DEFAULT NULL,
  `rejection_goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_money_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pr_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_psi_db_version
-- ----------------------------
DROP TABLE IF EXISTS `t_psi_db_version`;
CREATE TABLE `t_psi_db_version` (
  `db_version` varchar(255) NOT NULL,
  `update_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_psi_db_version
-- ----------------------------
INSERT INTO `t_psi_db_version` VALUES ('20191126-01', '2020-03-04 10:27:31');

-- ----------------------------
-- Table structure for t_pw_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_pw_bill`;
CREATE TABLE `t_pw_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `expand_by_bom` int(11) NOT NULL DEFAULT '0',
  `bill_memo` varchar(255) DEFAULT NULL,
  `wspbill_id` varchar(255) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pw_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_pw_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_pw_bill_detail`;
CREATE TABLE `t_pw_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `pwbill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `pobilldetail_id` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pw_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_receivables
-- ----------------------------
DROP TABLE IF EXISTS `t_receivables`;
CREATE TABLE `t_receivables` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `ca_id` varchar(255) NOT NULL,
  `ca_type` varchar(255) NOT NULL,
  `rv_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_receivables
-- ----------------------------

-- ----------------------------
-- Table structure for t_receivables_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_receivables_detail`;
CREATE TABLE `t_receivables_detail` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `balance_money` decimal(19,2) NOT NULL,
  `ca_id` varchar(255) NOT NULL,
  `ca_type` varchar(255) NOT NULL,
  `biz_date` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `rv_money` decimal(19,2) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_receivables_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_receiving
-- ----------------------------
DROP TABLE IF EXISTS `t_receiving`;
CREATE TABLE `t_receiving` (
  `id` varchar(255) NOT NULL,
  `act_money` decimal(19,2) NOT NULL,
  `biz_date` datetime NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `rv_user_id` varchar(255) NOT NULL,
  `bill_id` varchar(255) NOT NULL,
  `ref_number` varchar(255) NOT NULL,
  `ref_type` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_receiving
-- ----------------------------

-- ----------------------------
-- Table structure for t_recent_fid
-- ----------------------------
DROP TABLE IF EXISTS `t_recent_fid`;
CREATE TABLE `t_recent_fid` (
  `fid` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `click_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recent_fid
-- ----------------------------
INSERT INTO `t_recent_fid` VALUES ('-8996', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '5');
INSERT INTO `t_recent_fid` VALUES ('2008', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '3');
INSERT INTO `t_recent_fid` VALUES ('-9999', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '2');
INSERT INTO `t_recent_fid` VALUES ('3001', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '3');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '系统管理', '01010001', '4D74E1E4-A129-11E4-9B6A-782BCBD7746B', '01');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` varchar(255) DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2020', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2023', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2014', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2013', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2012', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2015', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2018', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2017', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2016', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2019', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2022', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2021', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027-01', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027-02', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2001', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2007', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1003', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1004', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2031', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1007', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2000', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2010', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2003', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2009', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8996', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1001', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-02', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-03', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-01', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1002', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2029', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-03', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-02', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-01', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-04', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2024', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2002', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2002-01', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2028', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2006', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8997', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2008', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2005', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2004', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8999', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2026', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2025', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-01', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-02', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-04', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-05', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-06', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-07', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-08', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-10', null);
INSERT INTO `t_role_permission` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-11', null);

-- ----------------------------
-- Table structure for t_role_permission_dataorg
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission_dataorg`;
CREATE TABLE `t_role_permission_dataorg` (
  `role_id` varchar(255) DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission_dataorg
-- ----------------------------
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2020', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2023', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2014', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2013', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2012', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2015', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2018', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2017', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2016', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2019', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2022', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2021', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027-01', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2027-02', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2001', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2007', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1003', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1004', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2031', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1007', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2000', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2010', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2003', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2009', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8996', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1001', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-02', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-03', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2030-01', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '1002', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2029', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-03', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-02', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-01', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2011-04', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2024', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2002', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2002-01', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2028', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2006', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8997', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2008', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2005', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2004', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '-8999', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2026', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '2025', '*');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-01', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-01', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-02', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-02', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-04', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-04', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-05', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-05', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-06', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-06', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-07', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-07', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-08', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-08', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-10', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-10', '0101');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-11', '01');
INSERT INTO `t_role_permission_dataorg` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '3001-11', '0101');

-- ----------------------------
-- Table structure for t_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user` (
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_user
-- ----------------------------
INSERT INTO `t_role_user` VALUES ('A83F617E-A153-11E4-A9B8-782BCBD7746B', '6C2A09CD-A129-11E4-9B6A-782BCBD7746B');

-- ----------------------------
-- Table structure for t_sc_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_sc_bill`;
CREATE TABLE `t_sc_bill` (
  `id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `bill_status` int(11) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `deal_date` datetime NOT NULL,
  `deal_address` varchar(255) DEFAULT NULL,
  `confirm_user_id` varchar(255) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `begin_dt` date NOT NULL,
  `end_dt` date NOT NULL,
  `discount` int(11) NOT NULL,
  `quality_clause` varchar(500) DEFAULT NULL,
  `insurance_clause` varchar(500) DEFAULT NULL,
  `transport_clause` varchar(500) DEFAULT NULL,
  `other_clause` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sc_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_sc_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sc_bill_detail`;
CREATE TABLE `t_sc_bill_detail` (
  `id` varchar(255) NOT NULL,
  `scbill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `tax_rate` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `so_count` decimal(19,8) NOT NULL,
  `left_count` decimal(19,8) NOT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sc_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_sc_so
-- ----------------------------
DROP TABLE IF EXISTS `t_sc_so`;
CREATE TABLE `t_sc_so` (
  `sc_id` varchar(255) NOT NULL,
  `so_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sc_so
-- ----------------------------

-- ----------------------------
-- Table structure for t_so_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_so_bill`;
CREATE TABLE `t_so_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `biz_dt` datetime NOT NULL,
  `deal_date` datetime NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `deal_address` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `receiving_type` int(11) NOT NULL DEFAULT '0',
  `confirm_user_id` varchar(255) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_so_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_so_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_so_bill_detail`;
CREATE TABLE `t_so_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `sobill_id` varchar(255) NOT NULL,
  `tax_rate` decimal(19,2) NOT NULL,
  `tax` decimal(19,2) NOT NULL,
  `money_with_tax` decimal(19,2) NOT NULL,
  `ws_count` decimal(19,8) NOT NULL,
  `left_count` decimal(19,8) NOT NULL,
  `show_order` int(11) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  `scbilldetail_id` varchar(255) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_so_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_so_po
-- ----------------------------
DROP TABLE IF EXISTS `t_so_po`;
CREATE TABLE `t_so_po` (
  `so_id` varchar(255) NOT NULL,
  `po_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_so_po
-- ----------------------------

-- ----------------------------
-- Table structure for t_so_ws
-- ----------------------------
DROP TABLE IF EXISTS `t_so_ws`;
CREATE TABLE `t_so_ws` (
  `so_id` varchar(255) NOT NULL,
  `ws_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_so_ws
-- ----------------------------

-- ----------------------------
-- Table structure for t_sr_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_sr_bill`;
CREATE TABLE `t_sr_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `inventory_money` decimal(19,2) DEFAULT NULL,
  `profit` decimal(19,2) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `rejection_sale_money` decimal(19,2) DEFAULT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `ws_bill_id` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT '0',
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(255) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `rejection_sale_money_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sr_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_sr_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sr_bill_detail`;
CREATE TABLE `t_sr_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `inventory_money` decimal(19,2) NOT NULL,
  `inventory_price` decimal(19,2) NOT NULL,
  `rejection_goods_count` decimal(19,8) NOT NULL,
  `rejection_goods_price` decimal(19,2) NOT NULL,
  `rejection_sale_money` decimal(19,2) NOT NULL,
  `show_order` int(11) NOT NULL,
  `srbill_id` varchar(255) NOT NULL,
  `wsbilldetail_id` varchar(255) NOT NULL,
  `sn_note` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `rejection_sale_money_with_tax` decimal(19,2) DEFAULT NULL,
  `rejection_goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_money_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sr_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_leaf` int(11) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact01` varchar(255) DEFAULT NULL,
  `qq01` varchar(255) DEFAULT NULL,
  `tel01` varchar(255) DEFAULT NULL,
  `mobile01` varchar(255) DEFAULT NULL,
  `contact02` varchar(255) DEFAULT NULL,
  `qq02` varchar(255) DEFAULT NULL,
  `tel02` varchar(255) DEFAULT NULL,
  `mobile02` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_shipping` varchar(255) DEFAULT NULL,
  `address_receipt` varchar(255) DEFAULT NULL,
  `py` varchar(255) DEFAULT NULL,
  `init_receivables` decimal(19,2) DEFAULT NULL,
  `init_receivables_dt` datetime DEFAULT NULL,
  `init_payables` decimal(19,2) DEFAULT NULL,
  `init_payables_dt` datetime DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `record_status` int(11) DEFAULT '1000',
  `goods_range` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier_category
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier_category`;
CREATE TABLE `t_supplier_category` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplier_goods_range
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier_goods_range`;
CREATE TABLE `t_supplier_goods_range` (
  `id` varchar(255) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `g_id` varchar(255) NOT NULL,
  `g_id_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier_goods_range
-- ----------------------------

-- ----------------------------
-- Table structure for t_sysdict_editor_xtype
-- ----------------------------
DROP TABLE IF EXISTS `t_sysdict_editor_xtype`;
CREATE TABLE `t_sysdict_editor_xtype` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_int` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `py` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `show_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysdict_editor_xtype
-- ----------------------------
INSERT INTO `t_sysdict_editor_xtype` VALUES ('5104A62E-9F97-11E9-9BDF-F0BF9790E21F', '1', '1', 'textfield', 'textfield', '字符串编辑器', '1');
INSERT INTO `t_sysdict_editor_xtype` VALUES ('7B795BEF-9F97-11E9-9BDF-F0BF9790E21F', '2', '2', 'numberfield', 'numberfield', '数值编辑器', '2');
INSERT INTO `t_sysdict_editor_xtype` VALUES ('9929B6FA-AD1A-11E9-B2D3-F0BF9790E21F', '4', '4', 'psi_codetable_recordreffield', 'psi_codetable_recordreffield', '码表记录引用字段编辑器', '4');
INSERT INTO `t_sysdict_editor_xtype` VALUES ('FD1F4CF4-9F97-11E9-9BDF-F0BF9790E21F', '3', '3', 'psi_codetable_parentidfield', 'psi_codetable_parentidfield', '上级记录编辑器', '3');

-- ----------------------------
-- Table structure for t_sysdict_record_status
-- ----------------------------
DROP TABLE IF EXISTS `t_sysdict_record_status`;
CREATE TABLE `t_sysdict_record_status` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_int` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `py` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `show_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysdict_record_status
-- ----------------------------
INSERT INTO `t_sysdict_record_status` VALUES ('9B90C56E-696E-11E9-B2BF-782BCBD7746B', '1000', '1000', '启用', 'QY', '记录处于启用状态', '1');
INSERT INTO `t_sysdict_record_status` VALUES ('AC7F3FAB-696E-11E9-B2BF-782BCBD7746B', '0', '0', '停用', 'TY', '记录处于停用状态', '2');

-- ----------------------------
-- Table structure for t_upload_type
-- ----------------------------
DROP TABLE IF EXISTS `t_upload_type`;
CREATE TABLE `t_upload_type` (
  `suffix` varchar(50) NOT NULL,
  `classify` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_upload_type
-- ----------------------------
INSERT INTO `t_upload_type` VALUES ('doc', 'office');
INSERT INTO `t_upload_type` VALUES ('docx', 'office');
INSERT INTO `t_upload_type` VALUES ('xls', 'office');
INSERT INTO `t_upload_type` VALUES ('xlsx', 'office');
INSERT INTO `t_upload_type` VALUES ('ppt', 'office');
INSERT INTO `t_upload_type` VALUES ('pptx', 'office');
INSERT INTO `t_upload_type` VALUES ('pdf', 'office');
INSERT INTO `t_upload_type` VALUES ('txt', 'office');
INSERT INTO `t_upload_type` VALUES ('jpg', 'picture');
INSERT INTO `t_upload_type` VALUES ('gif', 'picture');
INSERT INTO `t_upload_type` VALUES ('png', 'picture');
INSERT INTO `t_upload_type` VALUES ('jpeg', 'picture');
INSERT INTO `t_upload_type` VALUES ('mp4', 'other');
INSERT INTO `t_upload_type` VALUES ('avi', 'other');
INSERT INTO `t_upload_type` VALUES ('mov', 'other');
INSERT INTO `t_upload_type` VALUES ('rmvb', 'other');
INSERT INTO `t_upload_type` VALUES ('flv', 'other');
INSERT INTO `t_upload_type` VALUES ('3gp', 'other');
INSERT INTO `t_upload_type` VALUES ('mpeg', 'other');
INSERT INTO `t_upload_type` VALUES ('wmv', 'other');
INSERT INTO `t_upload_type` VALUES ('asf', 'other');
INSERT INTO `t_upload_type` VALUES ('mkv', 'other');
INSERT INTO `t_upload_type` VALUES ('rm', 'other');
INSERT INTO `t_upload_type` VALUES ('mp3', 'other');
INSERT INTO `t_upload_type` VALUES ('wma', 'other');
INSERT INTO `t_upload_type` VALUES ('m4a', 'other');
INSERT INTO `t_upload_type` VALUES ('flac', 'other');
INSERT INTO `t_upload_type` VALUES ('ape', 'other');
INSERT INTO `t_upload_type` VALUES ('wav', 'other');
INSERT INTO `t_upload_type` VALUES ('aac', 'other');
INSERT INTO `t_upload_type` VALUES ('iso', 'other');
INSERT INTO `t_upload_type` VALUES ('html', 'other');
INSERT INTO `t_upload_type` VALUES ('exe', 'other');
INSERT INTO `t_upload_type` VALUES ('txt', 'other');
INSERT INTO `t_upload_type` VALUES ('apk', 'other');
INSERT INTO `t_upload_type` VALUES ('bat', 'other');
INSERT INTO `t_upload_type` VALUES ('zip', 'other');
INSERT INTO `t_upload_type` VALUES ('rar', 'other');
INSERT INTO `t_upload_type` VALUES ('7z', 'other');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(255) NOT NULL,
  `enabled` int(11) NOT NULL,
  `login_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `org_code` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `id_card_number` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `tel02` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6C2A09CD-A129-11E4-9B6A-782BCBD7746B', '1', 'admin', '系统管理员', '5EBDBE11-A129-11E4-9B6A-782BCBD7746B', '019901', '21232f297a57a5a743894a0e4a801fc3', 'XTGLY', null, null, null, null, null, null, '01010001', null);

-- ----------------------------
-- Table structure for t_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse`;
CREATE TABLE `t_warehouse` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `inited` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `py` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `org_id` varchar(255) DEFAULT NULL,
  `sale_area` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_warehouse
-- ----------------------------

-- ----------------------------
-- Table structure for t_wsp_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_wsp_bill`;
CREATE TABLE `t_wsp_bill` (
  `id` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `from_warehouse_id` varchar(255) NOT NULL,
  `to_warehouse_id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `bill_memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wsp_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_wsp_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_wsp_bill_detail`;
CREATE TABLE `t_wsp_bill_detail` (
  `id` varchar(255) NOT NULL,
  `wspbill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wsp_bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_wsp_bill_detail_bom
-- ----------------------------
DROP TABLE IF EXISTS `t_wsp_bill_detail_bom`;
CREATE TABLE `t_wsp_bill_detail_bom` (
  `id` varchar(255) NOT NULL,
  `wspbilldetail_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `sub_goods_id` varchar(255) NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sub_goods_count` decimal(19,8) NOT NULL,
  `cost_weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wsp_bill_detail_bom
-- ----------------------------

-- ----------------------------
-- Table structure for t_wsp_bill_detail_ex
-- ----------------------------
DROP TABLE IF EXISTS `t_wsp_bill_detail_ex`;
CREATE TABLE `t_wsp_bill_detail_ex` (
  `id` varchar(255) NOT NULL,
  `wspbill_id` varchar(255) NOT NULL,
  `show_order` int(11) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `from_goods_id` varchar(255) NOT NULL,
  `wspbilldetail_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wsp_bill_detail_ex
-- ----------------------------

-- ----------------------------
-- Table structure for t_ws_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_ws_bill`;
CREATE TABLE `t_ws_bill` (
  `id` varchar(255) NOT NULL,
  `bill_status` int(11) NOT NULL,
  `bizdt` datetime NOT NULL,
  `biz_user_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `input_user_id` varchar(255) NOT NULL,
  `inventory_money` decimal(19,2) DEFAULT NULL,
  `profit` decimal(19,2) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `sale_money` decimal(19,2) DEFAULT NULL,
  `warehouse_id` varchar(255) NOT NULL,
  `receiving_type` int(11) NOT NULL DEFAULT '0',
  `data_org` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `deal_address` varchar(255) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ws_bill
-- ----------------------------

-- ----------------------------
-- Table structure for t_ws_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_ws_bill_detail`;
CREATE TABLE `t_ws_bill_detail` (
  `id` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` decimal(19,8) NOT NULL,
  `goods_money` decimal(19,2) NOT NULL,
  `goods_price` decimal(19,2) NOT NULL,
  `inventory_money` decimal(19,2) DEFAULT NULL,
  `inventory_price` decimal(19,2) DEFAULT NULL,
  `show_order` int(11) NOT NULL,
  `wsbill_id` varchar(255) NOT NULL,
  `sn_note` varchar(255) DEFAULT NULL,
  `data_org` varchar(255) DEFAULT NULL,
  `memo` varchar(1000) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `sobilldetail_id` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,2) DEFAULT NULL,
  `tax` decimal(19,2) DEFAULT NULL,
  `money_with_tax` decimal(19,2) DEFAULT NULL,
  `goods_price_with_tax` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ws_bill_detail
-- ----------------------------
