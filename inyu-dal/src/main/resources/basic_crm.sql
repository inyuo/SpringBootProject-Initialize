/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : basic_crm

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-26 10:14:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `crm_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_action_log`;
CREATE TABLE `crm_action_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  `param_name` varchar(100) DEFAULT NULL,
  `action_id` int(10) NOT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of crm_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `crm_announcement`;
CREATE TABLE `crm_announcement` (
  `announcement_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `order_id` int(10) NOT NULL COMMENT '排序',
  `role_id` int(10) NOT NULL COMMENT '发表人岗位',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) NOT NULL COMMENT '发表时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `color` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL COMMENT '通知部门id',
  `status` int(1) NOT NULL COMMENT '是否发布1发布2停用',
  `isshow` int(1) NOT NULL DEFAULT '0' COMMENT '是否公开1是0否',
  PRIMARY KEY (`announcement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放知识文章信息';

-- ----------------------------
-- Records of crm_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_business`
-- ----------------------------
DROP TABLE IF EXISTS `crm_business`;
CREATE TABLE `crm_business` (
  `business_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商机id',
  `name` varchar(255) NOT NULL DEFAULT '',
  `origin` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(200) NOT NULL,
  `estimate_price` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `owner_role_id` int(10) NOT NULL COMMENT '所有者岗位',
  `gain_rate` int(3) NOT NULL COMMENT '赢单率(百分比)',
  `due_date` int(10) NOT NULL COMMENT '预计成交日期',
  `create_time` int(10) NOT NULL COMMENT '商机创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `update_role_id` int(10) NOT NULL,
  `status_id` int(10) NOT NULL COMMENT '商机状态id',
  `nextstep` varchar(100) NOT NULL COMMENT '下一步',
  `nextstep_time` int(10) NOT NULL,
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL,
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  `contacts_id` int(10) NOT NULL COMMENT '商机联系人',
  `contract_address` varchar(500) NOT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放商机相关信息';

-- ----------------------------
-- Records of crm_business
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_business_data`
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_data`;
CREATE TABLE `crm_business_data` (
  `business_id` int(10) NOT NULL COMMENT '主键',
  `description` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机数据表';

-- ----------------------------
-- Records of crm_business_data
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_business_status`
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_status`;
CREATE TABLE `crm_business_status` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商机状态',
  `name` varchar(20) DEFAULT NULL COMMENT '商机状态名',
  `order_id` int(10) DEFAULT NULL COMMENT '顺序号',
  `is_end` int(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '商机状态描述',
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='本表存放商机状态信息';

-- ----------------------------
-- Records of crm_business_status
-- ----------------------------
INSERT INTO `crm_business_status` VALUES ('1', '深度沟通', '3', '0', '已经约见，并且报价');
INSERT INTO `crm_business_status` VALUES ('2', '初步沟通', '2', '0', '已进行初步沟通网站建设事宜，可能约见');
INSERT INTO `crm_business_status` VALUES ('3', '意向客户', '1', '0', '通过沟通近期有做网站的需求');
INSERT INTO `crm_business_status` VALUES ('5', '签订合同', '5', '0', '签订合同');
INSERT INTO `crm_business_status` VALUES ('6', '设计制作', '6', '0', '制作中');
INSERT INTO `crm_business_status` VALUES ('7', '制作完成', '7', '0', '制作完成待收款');
INSERT INTO `crm_business_status` VALUES ('99', '项目失败', '99', '1', '项目失败');
INSERT INTO `crm_business_status` VALUES ('100', '项目成功', '100', '1', '项目成功');

-- ----------------------------
-- Table structure for `crm_business_status_flow`
-- ----------------------------
DROP TABLE IF EXISTS `crm_business_status_flow`;
CREATE TABLE `crm_business_status_flow` (
  `flow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '状态流id',
  `name` varchar(50) NOT NULL COMMENT '状态流名字',
  `data` text NOT NULL COMMENT '状态流数据',
  `in_use` int(1) NOT NULL COMMENT '是否在用',
  `description` varchar(200) NOT NULL COMMENT '状态流描述',
  PRIMARY KEY (`flow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_business_status_flow
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_comment`
-- ----------------------------
DROP TABLE IF EXISTS `crm_comment`;
CREATE TABLE `crm_comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `creator_role_id` int(10) NOT NULL COMMENT '评论人',
  `to_role_id` int(10) NOT NULL COMMENT '被评论人',
  `module` varchar(50) NOT NULL COMMENT '模块',
  `module_id` int(10) NOT NULL COMMENT '模块id',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of crm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_config`
-- ----------------------------
DROP TABLE IF EXISTS `crm_config`;
CREATE TABLE `crm_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_config
-- ----------------------------
INSERT INTO `crm_config` VALUES ('1', 'defaultinfo', 'a:8:{s:4:\"name\";s:9:\"悟空CRM\";s:11:\"description\";s:39:\"开源免费的客户关系管理系统\";s:5:\"state\";s:9:\"河南省\";s:4:\"city\";s:9:\"郑州市\";s:15:\"allow_file_type\";s:40:\"pdf,doc,jpg,png,gif,txt,doc,xls,zip,docx\";s:19:\"contract_alert_time\";i:30;s:10:\"task_model\";s:1:\"2\";s:4:\"logo\";N;}', '');
INSERT INTO `crm_config` VALUES ('2', 'customer_outdays', '30', '客户设置放入客户吃天数');
INSERT INTO `crm_config` VALUES ('3', 'customer_limit_condition', 'day', '客户池领取条件限制 day：今日 week： 本周 month：本月');
INSERT INTO `crm_config` VALUES ('4', 'customer_limit_counts', '10', '客户池领取次数限制');
INSERT INTO `crm_config` VALUES ('5', 'leads_outdays', '30', '线索超出天数放入客户池');
INSERT INTO `crm_config` VALUES ('6', 'spliderCount', '195', '爬虫记录');

-- ----------------------------
-- Table structure for `crm_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `crm_contacts`;
CREATE TABLE `crm_contacts` (
  `contacts_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '联系人id',
  `owner_role_id` int(10) NOT NULL COMMENT '所有人岗位',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位id',
  `name` varchar(50) NOT NULL COMMENT '联系人姓名',
  `post` varchar(20) NOT NULL COMMENT '客户联系人岗位',
  `department` varchar(20) NOT NULL COMMENT '客户联系人部门',
  `sex` int(1) NOT NULL COMMENT '联系人性别',
  `saltname` varchar(20) NOT NULL COMMENT '称呼',
  `telephone` varchar(20) NOT NULL COMMENT '联系人电话',
  `email` varchar(50) NOT NULL COMMENT '联系人邮箱',
  `qq` varchar(20) NOT NULL COMMENT 'qq',
  `address` varchar(50) NOT NULL COMMENT '联系地址',
  `zip_code` varchar(20) NOT NULL COMMENT '邮编',
  `description` varchar(100) NOT NULL COMMENT '联系人信息备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '信息更新时间',
  `is_deleted` int(1) NOT NULL COMMENT '是否被删除',
  `delete_role_id` int(10) NOT NULL,
  `delete_time` int(10) NOT NULL,
  PRIMARY KEY (`contacts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户联系人对应关系信息';

-- ----------------------------
-- Records of crm_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_contract`
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract`;
CREATE TABLE `crm_contract` (
  `contract_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(50) NOT NULL COMMENT '编号',
  `business_id` int(10) NOT NULL COMMENT '商机',
  `price` float(10,2) NOT NULL COMMENT '总价',
  `due_time` int(10) NOT NULL COMMENT '签约日期',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者',
  `content` text NOT NULL COMMENT '合同内容',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `start_date` int(10) NOT NULL COMMENT '生效时间',
  `end_date` int(10) NOT NULL COMMENT '到期时间',
  `status` varchar(20) NOT NULL COMMENT '合同状态',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Records of crm_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_control`
-- ----------------------------
DROP TABLE IF EXISTS `crm_control`;
CREATE TABLE `crm_control` (
  `control_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '操作id',
  `module_id` int(10) NOT NULL COMMENT '模块id',
  `name` varchar(20) NOT NULL COMMENT '操作名',
  `m` varchar(20) NOT NULL COMMENT '对应Action',
  `a` varchar(20) NOT NULL COMMENT '行为',
  `parameter` varchar(50) NOT NULL COMMENT '参数',
  `description` varchar(200) NOT NULL COMMENT '操作描述',
  PRIMARY KEY (`control_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='本表存放操作信息';

-- ----------------------------
-- Records of crm_control
-- ----------------------------
INSERT INTO `crm_control` VALUES ('1', '1', 'crm面板操作', 'index', 'index', '', 'CRM系统面板');
INSERT INTO `crm_control` VALUES ('2', '7', '修改个人信息', 'User', 'edit', '', '是的法士大夫地方');
INSERT INTO `crm_control` VALUES ('4', '7', '添加用户', 'User', 'add', '', '');
INSERT INTO `crm_control` VALUES ('78', '7', '删除员工', 'User', 'delete', '', '');
INSERT INTO `crm_control` VALUES ('6', '7', '添加部门', 'User', 'department_add', '', '');
INSERT INTO `crm_control` VALUES ('7', '7', '修改部门', 'User', 'department_edit', '', '');
INSERT INTO `crm_control` VALUES ('8', '7', '删除部门', 'User', 'department_delete', '', '');
INSERT INTO `crm_control` VALUES ('9', '7', '添加岗位', 'User', 'role_add', '', '');
INSERT INTO `crm_control` VALUES ('10', '7', '修改岗位', 'User', 'role_edit', '', '');
INSERT INTO `crm_control` VALUES ('11', '7', '删除岗位', 'User', 'role_delete', '', '');
INSERT INTO `crm_control` VALUES ('12', '2', '添加商机', 'Business', 'add', '', '');
INSERT INTO `crm_control` VALUES ('34', '2', '完整商机信息', 'Business', 'view', '', '');
INSERT INTO `crm_control` VALUES ('13', '2', '修改商机', 'Business', 'edit', '', '');
INSERT INTO `crm_control` VALUES ('14', '2', '删除商机', 'Business', 'delete', '', '');
INSERT INTO `crm_control` VALUES ('15', '2', '添加商机日志', 'Business', 'addLogging', '', '');
INSERT INTO `crm_control` VALUES ('16', '2', '修改商机日志', 'Business', 'eidtLogging', '', '');
INSERT INTO `crm_control` VALUES ('17', '2', '删除商机日志', 'Business', 'deleteLogging', '', '');
INSERT INTO `crm_control` VALUES ('18', '1', '用户登录', 'User', 'login', '', '');
INSERT INTO `crm_control` VALUES ('19', '1', '用户注册', 'User', 'register', '', '');
INSERT INTO `crm_control` VALUES ('20', '1', '退出', 'User', 'logout', '', '');
INSERT INTO `crm_control` VALUES ('21', '7', '查看部门信息', 'User', 'department', '', '');
INSERT INTO `crm_control` VALUES ('22', '1', '找回密码', 'User', 'lostPW', '', '');
INSERT INTO `crm_control` VALUES ('23', '1', '重置密码', 'User', 'lostpw_reset', '', '');
INSERT INTO `crm_control` VALUES ('24', '7', '查看员工信息', 'User', 'index', '', '');
INSERT INTO `crm_control` VALUES ('25', '7', '查看岗位信息', 'User', 'role', '', '');
INSERT INTO `crm_control` VALUES ('26', '7', '岗位分配', 'User', 'user_role_relation', '', '');
INSERT INTO `crm_control` VALUES ('27', '7', '员工资料修改', 'User', 'editUsers', '', '');
INSERT INTO `crm_control` VALUES ('28', '1', '查看我的日志', 'User', 'mylog', '', '');
INSERT INTO `crm_control` VALUES ('60', '6', '岗位授权', 'Permission', 'authorize', '', '');
INSERT INTO `crm_control` VALUES ('30', '7', '个人日志详情', 'User', 'mylog_view', '', '');
INSERT INTO `crm_control` VALUES ('31', '7', '删除个人日志', 'User', 'mylog_delete', '', '');
INSERT INTO `crm_control` VALUES ('32', '2', '查看商机信息', 'Business', 'index', '', '');
INSERT INTO `crm_control` VALUES ('33', '2', '查看商机日志', 'Business', 'logging', '', '');
INSERT INTO `crm_control` VALUES ('35', '3', '产品列表', 'product', 'index', '', '');
INSERT INTO `crm_control` VALUES ('36', '3', '添加产品', 'Product', 'add', '', '');
INSERT INTO `crm_control` VALUES ('37', '3', '修改产品信息', 'product', 'edit', '', '');
INSERT INTO `crm_control` VALUES ('38', '3', '删除产品', 'Product', 'delete', '', '');
INSERT INTO `crm_control` VALUES ('39', '3', '查看产品分类信息', 'Product', 'category', '', '');
INSERT INTO `crm_control` VALUES ('40', '3', '添加产品分类', 'Product', 'category_add', '', '');
INSERT INTO `crm_control` VALUES ('41', '3', '删除产品分类', 'Product', 'deleteCategory', '', '');
INSERT INTO `crm_control` VALUES ('42', '3', '修改产品分类', 'Product', 'editcategory', '', '');
INSERT INTO `crm_control` VALUES ('43', '3', '产品销量统计', 'Product', 'count', '', '');
INSERT INTO `crm_control` VALUES ('44', '5', '查看客户信息', 'Customer', 'customerView', '', '');
INSERT INTO `crm_control` VALUES ('45', '5', '添加客户', 'Customer', 'add', '', '');
INSERT INTO `crm_control` VALUES ('46', '5', '修改客户信息', 'Customer', 'edit', '', '');
INSERT INTO `crm_control` VALUES ('47', '5', '删除客户', 'Customer', 'delete', '', '');
INSERT INTO `crm_control` VALUES ('48', '5', '添加客户联系人', 'Contacts', 'add', '', '');
INSERT INTO `crm_control` VALUES ('49', '5', '查看客户联系人', 'Contacts', 'view', '', '');
INSERT INTO `crm_control` VALUES ('50', '5', '删除客户联系人', 'Contacts', 'delete', '', '');
INSERT INTO `crm_control` VALUES ('51', '5', '修改客户联系人', 'Contacts', 'edit', '', '');
INSERT INTO `crm_control` VALUES ('52', '6', '查看操作模块', 'Permission', 'module', '', '');
INSERT INTO `crm_control` VALUES ('53', '6', '修改操作模块', 'Permission', 'module_edit', '', '');
INSERT INTO `crm_control` VALUES ('54', '6', '添加操作模块信息', 'Permission', 'module_add', '', '');
INSERT INTO `crm_control` VALUES ('55', '6', '删除操作模块', 'Permission', 'module_delete', '', '');
INSERT INTO `crm_control` VALUES ('56', '6', '查看操作信息', 'Permission', 'index', '', '');
INSERT INTO `crm_control` VALUES ('57', '6', '修改操作', 'Permission', 'control_edit', '', '');
INSERT INTO `crm_control` VALUES ('58', '6', '删除模块', 'Permission', 'control_delete', '', '');
INSERT INTO `crm_control` VALUES ('59', '6', '添加操作', 'Permission', 'control_add', '', '');
INSERT INTO `crm_control` VALUES ('61', '9', 'smtp设置', 'Config', 'smtpConfig', '', '');
INSERT INTO `crm_control` VALUES ('62', '9', '删除状态', 'Config', 'deleteStatus', '', '');
INSERT INTO `crm_control` VALUES ('63', '9', '修改状态', 'Config', 'editStatus', '', '');
INSERT INTO `crm_control` VALUES ('64', '9', '添加状态', 'Config', 'addStatus', '', '');
INSERT INTO `crm_control` VALUES ('65', '9', '查看状态', 'Config', 'statusList', '', '');
INSERT INTO `crm_control` VALUES ('66', '9', '查看状态流', 'Config', 'flowList', '', '');
INSERT INTO `crm_control` VALUES ('67', '9', '添加状态流', 'Config', 'addStatusflow', '', '');
INSERT INTO `crm_control` VALUES ('68', '9', '删除状态流', 'Config', 'deleteStatusFlow', '', '');
INSERT INTO `crm_control` VALUES ('69', '9', '修改状态流信息', 'Config', 'editStatusFlow', '', '');

-- ----------------------------
-- Table structure for `crm_control_module`
-- ----------------------------
DROP TABLE IF EXISTS `crm_control_module`;
CREATE TABLE `crm_control_module` (
  `module_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '操作模块id',
  `name` varchar(20) NOT NULL COMMENT '操作模块名',
  `description` varchar(50) NOT NULL COMMENT '操作模块描述',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='存放操作模块信息';

-- ----------------------------
-- Records of crm_control_module
-- ----------------------------
INSERT INTO `crm_control_module` VALUES ('2', '商机模块', '关于一切商机操作的模块');
INSERT INTO `crm_control_module` VALUES ('3', '产品模块', '关于产品操作的模块');
INSERT INTO `crm_control_module` VALUES ('5', '客户模块', '客户的管理');
INSERT INTO `crm_control_module` VALUES ('6', '权限模块', '用户的权限管理');
INSERT INTO `crm_control_module` VALUES ('7', '员工管理模块', '是的范德萨发的说法');
INSERT INTO `crm_control_module` VALUES ('9', '系统设置', '');

-- ----------------------------
-- Table structure for `crm_customer`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `owner_role_id` int(10) DEFAULT NULL COMMENT '所有者岗位',
  `creator_role_id` int(10) DEFAULT NULL COMMENT '创建者id',
  `contacts_id` int(10) DEFAULT '0' COMMENT '首要联系人',
  `name` varchar(333) NOT NULL DEFAULT '' COMMENT '联系人',
  `email` varchar(255) DEFAULT NULL,
  `origin` varchar(150) DEFAULT '' COMMENT '来源',
  `licenc_no` varchar(255) DEFAULT NULL COMMENT '客户营业执照编码',
  `website` varchar(255) DEFAULT '' COMMENT '网站',
  `telephone` varchar(26) NOT NULL COMMENT '电话',
  `landline_telephone` varchar(50) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL COMMENT '传真',
  `satisfy` int(1) DEFAULT NULL COMMENT '客户满意度',
  `level` int(1) DEFAULT NULL COMMENT '客户等级',
  `address` varchar(100) DEFAULT NULL COMMENT '客户联系地址',
  `zip_code` varchar(20) DEFAULT NULL COMMENT '邮编',
  `industry` varchar(150) NOT NULL DEFAULT '' COMMENT '企业',
  `annual_revenue` varchar(20) DEFAULT NULL COMMENT '年营业额',
  `ownership` varchar(150) DEFAULT '',
  `rating` varchar(150) DEFAULT '',
  `create_time` date DEFAULT NULL COMMENT '建立时间',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(1) DEFAULT NULL COMMENT '是否删除',
  `is_locked` int(1) DEFAULT NULL COMMENT '是否锁定 0 -no / 1- yes',
  `delete_role_id` int(10) DEFAULT NULL COMMENT '删除人',
  `delete_time` date DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='本表存放客户的相关信息';

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES ('125', '1', '1', '0', 'admin', 'qq@qq.com', 'regin', '123', 'www', '13133092345', '020-2222222', '20232', '4', '1', 'ad', '036123', 'qie', null, '', '', '2018-04-22', '2018-04-03', null, null, null, null);
INSERT INTO `crm_customer` VALUES ('3', '0', '1', '0', '佳速', '2980556884@qq.com', 'splider', '91440113661804364T', '', '13922448318', '020-84896160', '020-84896160', '0', '0', '中国 广东 广州市番禺区 广州市番禺区迎宾路东沙村东沙工业区(新力集团)', '511400', '广州市佳速精密机械有限公司', '7860 (万元)', 'default', '等级', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('4', '0', '1', '0', '陈常兴', null, 'splider', '4401082001554', null, '未提供', '(020)88291726', null, '0', '0', '广州 广州保税区东江大道284号308房', '510730', '广州市致仁电子有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('5', '0', '1', '0', '樊永星', null, 'splider', '440110600031277', null, '13828448100', '(020)', '（020）39080791', '0', '0', '广东省广州市南沙区万顷沙镇新安村10冲永兴西路50号', '511462', '广州市南沙区汇安丰果菜加工厂', '100 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('6', '0', '1', '0', '陈培侨', null, 'splider', null, null, '未提供', '82978928-101', null, '0', '0', '广东省广州市广州开发区永和经济区新庄二路３８号', '511356', '广州光明乳品有限公司工会委员会、广州达能酸乳酪有限公司工会委员会', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('7', '0', '1', '0', '吴祝和(护)', null, 'splider', '440108400004021', null, '未提供', '020-22209888', null, '0', '0', '广州 广州经济技术开发区永和经济区新元路3号', '511356', '广州立旺食品有限公司', '600万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('8', '0', '1', '0', '郭国平', null, 'splider', '企独粤穗总字第101080号', null, '未提供', '(020)83191101', null, '0', '0', '广州 广州经济技术开发区锦秀路明华三街五号D1-3光业行大厦五层', '510730', '康力士（广州）营养食品有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('9', '0', '1', '0', '陈阳先', null, 'splider', '440108000001320', null, '13570057234', '13570057234', '86-020-82582493', '0', '0', '广州 广州经济技术开发区青年路367号夹层01室', '510000', '广州市诘富电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('10', '0', '1', '0', '王惠珍', null, 'splider', null, null, '未提供', '82068680-331', null, '0', '0', '广东省广州市广州开发区蓝玉四街九号科技园内五号厂房三层', '510730', '博能（广州）电子有限公司工会委员会', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('11', '0', '1', '0', '未提供', null, 'splider', null, null, '未提供', '86-020-32223111', '86-020-32223390', '0', '0', '中国 广东 广州市 广州经济技术开发区,永和经济开发区井泉三路79号', '511356', '广州泰昇密封技术有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('12', '0', '1', '0', '张武凌', null, 'splider', '企独粤穗分字第108022号', null, '未提供', '(020)82218828', null, '0', '0', '广州 广州经济技术开发区滨河路一号之一', '510730', '广州卓德嘉薄膜有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('13', '0', '1', '0', '唐燕强', null, 'splider', '4401022007047', null, '未提供', '(020)87218375', null, '0', '0', '广州 水荫路水荫阁二层 -', '510110', '广州市普和电器有限公司', '101万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('14', '0', '1', '0', '赵力', null, 'splider', '4401042006612', null, '未提供', '(020)83215671', null, '0', '0', '广州 水荫路５２－５号 -', '510320', '广州市启诚电器有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('15', '0', '1', '0', '张军海', null, 'splider', '4400002002447', null, '未提供', '(020)87305558', null, '0', '0', '广州 先烈中路92号南楼129、131房', '510070', '广东安利达电器有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('16', '0', '1', '0', '梁辉', null, 'splider', null, null, '未提供', '(020)87386433', null, '0', '0', '广东省广州市东山区广州大道中１２１号２２０７房', '510600', '广州市维能电器有限公司', '301 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('17', '0', '1', '0', '麦健文', null, 'splider', '440104000181415', null, '未提供', '86-20-88166355', null, '0', '0', '中国 广东 广州市越秀区 东华南176号', '510000', '广州市佰胜照明电器有限公司', '150万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('18', '0', '1', '0', '郭海燕', null, 'splider', '4401021102443', null, '未提供', '(020)835118631', null, '0', '0', '广州 环市东路４１７－９二楼２０２房', '510220', '广州通铁信号设备有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('19', '0', '1', '0', '姚瑞明', null, 'splider', '4401021400936', null, '未提供', '(020)87770363', null, '0', '0', '广州 环市东路371-375号N2704房', '510390', '广州市芳村区高仕服装厂东山区经贸部', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('20', '0', '1', '0', '吴国材 E442616', null, 'splider', null, null, '未提供', '(020)87608265', null, '0', '0', '广州 农林下路１２号 -', '510080', '广东三商华宇时装有限公司农林下路商场', '10 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('21', '0', '1', '0', '倪良敏', null, 'splider', '4401021102406', null, '未提供', '(020)38810603', null, '0', '0', '广州 东风东路840 号艺苑大厦1208房', '510610', '广州市佳良电器有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('22', '0', '1', '0', '何锡涛', null, 'splider', '4401021200293', null, '未提供', '(020)83303831', null, '0', '0', '广州 广州市东山区珠光路54号首层', '510110', '广州市征途机械有限公司珠光分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('23', '0', '1', '0', '唐结彩', null, 'splider', null, null, '未提供', '83884816-1008', null, '0', '0', '广东省广州市东山区大沙头四马路９号信和海印电器市场１０１号铺', '510100', '广东奥古斯汀电器有限公司信和专卖店', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('24', '0', '1', '0', '屈公安', null, 'splider', '4400001005652', null, '未提供', '87373392-203', null, '0', '0', '广州 寺右新马路１１１号五羊东成广场１５楼１５２６房', '510600', '广东大家庭家用电器有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('25', '0', '1', '0', '赵一铮', null, 'splider', '4401022001047', null, '未提供', '83338999-813', null, '0', '0', '广州 广州市东山区环市东路368号花园大厦813房', '510075', '广州市红珏服装有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('26', '0', '1', '0', '郑泳梓', null, 'splider', null, null, '未提供', '87601233-221', null, '0', '0', '广州 环市东路３７１－３７５号北塔３１０１、３１０２房', '510095', '汕头市龙湖区嘉韵时装有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('27', '0', '1', '0', '翁武强', null, 'splider', null, null, '未提供', '83633369-338', null, '0', '0', '广州 建设六马路２９号８楼Ｄ室', '510060', '广州市东尼服装有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('28', '0', '1', '0', '王青山', null, 'splider', null, null, '未提供', '(020)83311888', null, '0', '0', '广州 环市东路339号广东国际大酒店1818B室', '510098', '广东美斯奴服装有限公司', '300 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('29', '0', '1', '0', '罗光民', null, 'splider', '4400002005051', null, '未提供', '(020)83301622', null, '0', '0', '广州 先烈南路华泰宾馆迎宾楼３０１房', '510075', '广东亨盛食品有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('30', '0', '1', '0', '梁小钊', null, 'splider', '4400001004443', null, '未提供', '83326338-3018', null, '0', '0', '广州 德政南路５２号十七楼 -', '510110', '广东轻出鞋帽有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('31', '0', '1', '0', '黄昌梁', null, 'splider', null, null, '未提供', '(020)83836032', null, '0', '0', '广州 建设三马路７３号８０７室', '510060', '广东汇昌服装有限公司第一分公司', '10 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('32', '0', '1', '0', '潘民兴', null, 'splider', '4401022001082', null, '未提供', '(020)83315299', null, '0', '0', '广州 中山四路地铁口JY-7第B2档', '510055', '广州金大洋服装有限公司分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('33', '0', '1', '0', '王剑雄', null, 'splider', null, null, '未提供', '(020)86352723', null, '0', '0', '广东省广州市东山区寺右新马路１１１－１１５号１１１３、１１１５、１１１', '510600', '广州中海油石化有限公司', '308 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('34', '0', '1', '0', '焉培智(护)', null, 'splider', '440101400031657', '', '未提供', '(020)87698570', null, '0', '0', '广东省广州市东山区东风东路８３６号东峻广场二座２２０５、２２０６室', '510080', '上海锦江麒麟饮料食品有限公司广州分公司', '', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('35', '0', '1', '0', '娄培君', null, 'splider', '440104000298644', null, '未提供', '(020)83848001', null, '0', '0', '广东省广州市东山区达道路１２号金达大厦７楼７１０房', '510080', '广州市卜卜星食品有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('36', '0', '1', '0', '林山(护)', null, 'splider', null, null, '未提供', '(020)87615390', null, '0', '0', '广东省广州市东山区环市东路４７５号东都大世界第三层Ｂ区３１２－３１５号', '510075', '广州顶益国际食品有限公司东山办事处', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('37', '0', '1', '0', '姚瑞勤', null, 'splider', null, null, '未提供', '(020)61282520', null, '0', '0', '广州 中山一路５７号１３楼０２室', '510080', '上海太太乐调味食品有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('38', '0', '1', '0', '路党光', null, 'splider', '4400002004355', null, '未提供', '87773722-4209', null, '0', '0', '广州 三育路４４号东山宾馆４号楼２０９房', '510080', '广东国威石油化工发展有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('39', '0', '1', '0', '郑永谦', null, 'splider', '4401021102446', null, '未提供', '(020)83871357', null, '0', '0', '广州 豪贤路１０１号四楼 -', '510055', '广州市德理电子皮具有限公司', '30万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('40', '0', '1', '0', '王尉', null, 'splider', '4401022003299', null, '未提供', '(020)83887012', null, '0', '0', '广州 黄华路２４号３９栋４０２房', '510060', '广州市通亮电气照明有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('41', '0', '1', '0', '麦兆镗', null, 'splider', null, null, '未提供', '(020)87699439', null, '0', '0', '广州 先烈中路云鹤北８号云山大酒店餐厅楼首层', '510075', '广州市紫苑艺术时装公司嘉怡制服中心', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('42', '0', '1', '0', '谭镇坤', null, 'splider', '440104000123867', null, '未提供', '(020)87781738', null, '0', '0', '广州 环市东路３７１－３７５号第三层３０３Ａ', '510090', '广州古奥服饰有限公司专卖店', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('43', '0', '1', '0', '蔡洪生', null, 'splider', null, null, '未提供', '(020)87341336', null, '0', '0', '广州 东风东路东景街２号２７Ｄ房', '510175', '苏州芭芭拉服饰有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('44', '0', '1', '0', '谢映芬', null, 'splider', '企作粤办字第00468号', null, '未提供', '(020)83595769', null, '0', '0', '广州 登峰街横枝岗１８号之一 -', '510059', '梅县康尼服装有限公司广州办事处', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('45', '0', '1', '0', '李广振', null, 'splider', '4401022001256', null, '未提供', '(020)87661888', null, '0', '0', '广州 沿江中路２９８号Ａ幢２２Ｃ房', '510080', '广州芸雅服装有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('46', '0', '1', '0', '黎淑英', null, 'splider', '440104000108257', null, '13922798787', '未提供', null, '0', '0', '广州 广州市越秀区福今路七号大院16号楼1301房', '510080', '广州市尚裕服饰有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('47', '0', '1', '0', '洪朝辉', null, 'splider', null, null, '未提供', '(020)85538680', null, '0', '0', '广州 广州市越秀区中山三路33号中华广埸第三层3321、3322号铺', '510080', '广州高仕蓝星服饰有限公司第一分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('48', '0', '1', '0', '李础家', null, 'splider', '4400002004180', null, '13802505153', '未提供', null, '0', '0', '广州 建设六马路33号宜安广场2012、2013室', '510075', '广东亿派服装有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('49', '0', '1', '0', '蒋红燕', null, 'splider', '914401067577994088', null, '未提供', '(020)83854749', null, '0', '0', '广东省广州市东山区东风东路５５５号１７０１－１７０２房', '510620', '广州市优仕实业发展有限公司', '1500万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('50', '0', '1', '0', '刘琳', null, 'splider', '4401022000944', null, '未提供', '(020)37612166', null, '0', '0', '广州 水荫路５６号１栋１０４房', '510075', '云浮市宝利图制衣有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('51', '0', '1', '0', '陈春燕', null, 'splider', '4400002001733', null, '未提供', '(020)85593838', null, '0', '0', '广州 竹丝岗二马路５号 -', '510080', '广东春园服装有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('52', '0', '1', '0', '黄广华', null, 'splider', '4401021102089', null, '未提供', '(020)83332475', null, '0', '0', '广州 八旗二马路４２号５１２房', '510110', '广州市于之服装有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('53', '0', '1', '0', '何建国E', null, 'splider', '企独粤穗分字第003240号', null, '未提供', '(020)83795552', null, '0', '0', '广州 广州市东山区沿江东路439号', '510100', '广州白云山运动服装有限公司茵宝体育用品部', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('54', '0', '1', '0', '叶宇文', null, 'splider', '4400001008675', null, '未提供', '(020)87779148', null, '0', '0', '广州 环市东路世界贸易中心大厦２５楼Ｆ４室', '510095', '广东宝丽华服装有限公司广州经销部', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('55', '0', '1', '0', '李汉清', null, 'splider', null, null, '未提供', '(020)83325886', null, '0', '0', '广东省广州市东山区八旗二马路３６号三楼３０２室之一', '510110', '广州市颢达电器有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('56', '0', '1', '0', '余力平', null, 'splider', '4401022001538', null, '未提供', '(020)83307764', null, '0', '0', '广州 广州市东山区越秀北路87－89号四楼', '510310', '广州瑞马电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('57', '0', '1', '0', '蔡晓红', null, 'splider', '440104000019683', null, '13825033600', '86-020-83884554', '86-020-83884554', '0', '0', '中国 广东 广州市 大沙头二马路12号816室', '510100', '广州市升川电子科技有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('58', '0', '1', '0', '李成吉', null, 'splider', '4401262016763', null, '13802505989', '(020)86 20 83501049', '86 20 83502248', '0', '0', '广州 广州市番禺区大石街河村迎宾路段179号自编B506', '510500', '广州市慧升电子科技有限公司', '101万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('59', '0', '1', '0', '黄晓海', null, 'splider', '4401092001386', null, '未提供', '(020)37599482', null, '0', '0', '广州 东风东路８０８号华宫大厦７１６房', '510620', '广州市嘉亿电子科技有限公司东山分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('60', '0', '1', '0', '黄伟纯', null, 'splider', null, null, '未提供', '(020)85595768', null, '0', '0', '广州 中山一路４９号二楼 -', '510600', '广州市易正电子科技有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('61', '0', '1', '0', '罗炳坤', null, 'splider', '4401022001142', null, '未提供', '(020)85592910', null, '0', '0', '广州 广州市东山区德政北路401、403号三楼', '510110', '广州市华视电子科技有限公司', '60万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('62', '0', '1', '0', '关显昌', null, 'splider', '4401022001601', null, '未提供', '86-020-33338303', '86--', '0', '0', '中国 广东 广州市 广州市荔湾区', '510000', '广州市贝托电子有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('63', '0', '1', '0', '吴晓珍', null, 'splider', '4401021200475', null, '未提供', '(020)83485175', null, '0', '0', '广州 广州市东山区环市东路421号自编8、9号铺', '510060', '广州市三信联电子有限公司农夫美食居', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('64', '0', '1', '0', '胡毅', null, 'splider', '4401042010751', null, '未提供', '(020)33158026', null, '0', '0', '广州 广州市越秀区寺右一马路8号', '510080', '广州市芯海电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('65', '0', '1', '0', '刘毅', null, 'splider', '440104000226463', null, '未提供', '86-020-13719158745', '86-020-87956348', '0', '0', '中国 广东 广州市 先烈中路92号大院号楼室', '510000', '广州市鹏升电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('66', '0', '1', '0', '区国辉', null, 'splider', '914401067371679645', null, '未提供', '(020)87617335', null, '0', '0', '广州 环市东路４８８号西座２０楼Ｅ座', '510075', '广州市用佳电子有限公司', '1610万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('67', '0', '1', '0', '何永标', null, 'splider', '91440113737161781B', '', '13425970200', '4000-199-168', '020-34047277', '0', '0', '广州 广东佛山市南海区 -', '528200', '广州科琳电子科技有限公司', '', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('68', '0', '1', '0', '陈柏圣', null, 'splider', '91440106755556170F', null, '13922745108', '86-02085532423', null, '0', '0', '中国 广东 广州市 天河软件园广海园区海晖楼８０４室', '５１０６６５', '广州市通盾电子科技有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('69', '0', '1', '0', '黄后勇', null, 'splider', null, null, '未提供', '83300204', null, '0', '0', '广州 先烈中路１００号大院２３栋２１７房', '510360', '广州市泰润电子科技有限公司', '101 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('70', '0', '1', '0', '朱红霞', null, 'splider', '440126000073068', null, '未提供', '(020)83781169', null, '0', '0', '广州 东湖路１６８号首层１４３号商铺', '510100', '广州市日禾电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('71', '0', '1', '0', '马红', null, 'splider', '440104000072930', null, '13802941690', '86-2083791390', '86-20-83795409', '0', '0', '广州 广州市越秀区大沙头四马路14号海印电器总汇二层P3A铺', '510100', '广州市汇速电子有限公司', '50万元 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('72', '0', '1', '0', '郭文', null, 'splider', '440104000063186', null, '未提供', '(020)89820866', null, '0', '0', '广州 东兴南路７９号９０３房之二', '510075', '广州奕伟电子科技有限公司', '150万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('73', '0', '1', '0', '韩文生', null, 'splider', null, null, '未提供', '(020)37300826', null, '0', '0', '广东省广州市东山区广州大道新达城广场１８１０室', '510060', '广州市友维电子科技有限公司', '100 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('74', '0', '1', '0', '吴卫平', null, 'splider', '4401022001336', null, '未提供', '86-020-88485059', '86--', '0', '0', '中国 广东 广州市 广州番禺南村华南碧桂园漾翠苑81座508室', '510000', '广州迪卫普电子有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('75', '0', '1', '0', '江勇', null, 'splider', '440104000071558', null, '未提供', '020-86000630', null, '0', '0', '广州 广州市越秀区建设大马路22号中环广场B栋2311房（仅限办公用途）', '510051', '广州市飞川计算机科技有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('76', '0', '1', '0', '周朝炜', null, 'splider', '4401022005513', null, '未提供', '(020)87591605', null, '0', '0', '广州 广州市东山区大沙头路21号海印广场第二层B089号', '510230', '广州市明珠电脑有限公司海印分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('77', '0', '1', '0', '卢东荪', null, 'splider', null, null, '未提供', '(020)88533661', null, '0', '0', '广东省广州市东山区福今路４号４０７室', '510080', '广州易为电子科技有限公司', '10 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('78', '0', '1', '0', '钟昌健', null, 'splider', '4401022001406', null, '未提供', '(020)84411016', null, '0', '0', '广州 广州市署前路关园4号二幢自编1号', '510360', '广州市维视佳电子科技有限公司东山分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('79', '0', '1', '0', '马名伟', null, 'splider', null, null, '未提供', '(020)83792375', null, '0', '0', '广州 大沙头海印电器市场Ｂ１－Ｂ４商铺', '510100', '广东大家乐电子有限公司松下电器商品专卖店', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('80', '0', '1', '0', '陈建', null, 'splider', '914401047397196384', null, '未提供', '(020)37655363', null, '0', '0', '广州 天河路１６号１３０４室 -', '510075', '广州市银智宝电子科技有限公司', '102万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('81', '0', '1', '0', 'xu', null, 'splider', '4400002091167', '', '13751894699', '86-02061281788-8213', '86-020-61281788', '0', '0', '广州 广州市越秀区中山一路51号六楼601-604室', '510000', '广东来同电子科技有限公司', '', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('82', '0', '1', '0', '钟羿铭', null, 'splider', '440104000246602', '', '未提供', '(020)87691870', null, '0', '0', '广东省广州市东山区先烈中路１００号大院省科技图书馆后座９－１号五楼', '510070', '广州市鹰讯电子科技有限公司', '', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('83', '0', '1', '0', '赵钢军', null, 'splider', null, null, '未提供', '(020)37616718', null, '0', '0', '广东省广州市东山区陵园西路１３号首层南侧', '510070', '广东朝日电子科技有限公司陵园西营业部', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('84', '0', '1', '0', '石文广', null, 'splider', null, null, '未提供', '(020)87379025', null, '0', '0', '广州 水荫路５６号８栋６０５室', '510070', '广州誉诚计算机科技有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('85', '0', '1', '0', '刘成文', null, 'splider', '4401011109033', null, '未提供', '86-020-87387577', '86-020-87381905', '0', '0', '广州 广州市越秀区广州大道中路183号704房', '510600', '广州云泽电子科技有限公司', '500万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('86', '0', '1', '0', '杨建伟', null, 'splider', '4401012039352', null, '13556153358', '86-020-88142627', '86-020-87518885', '0', '0', '中国 广东 广州市 广州天河区石牌西路113号（天晟明苑）南塔', '510630', '广州市泰杨电子科技有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('87', '0', '1', '0', '陈宏兵', null, 'splider', '9144010173489615XB', null, '13728015716', '未提供', '86--', '0', '0', '广州 广州市越秀区寺右二横路15号12栋金霞大厦1118室', '510050', '广州敏杰电子科技有限公司', '50.000万元人民 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('88', '0', '1', '0', '张智明', null, 'splider', null, null, '未提供', '(020)83849725', null, '0', '0', '广东省广州市东山区东华西路仁秀里２２号１０５房', '510100', '广州市粤皇食品有限公司东山东华西分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('89', '0', '1', '0', '邹小苓', null, 'splider', null, null, '未提供', '(020)83339401', null, '0', '0', '广州 中山四路１４８号６楼 -', '510030', '广州市友谊副食品有限公司工会委员会', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('90', '0', '1', '0', '黄仲诚C291974（3）', null, 'splider', '440101400099710', null, '未提供', '(020)36860100', null, '0', '0', '广州 广州市越秀区建设六马路33号103房104房', '510060', '广东三元麦当劳食品有限公司宜安广场分店', '800 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('91', '0', '1', '0', '李晋安', null, 'splider', '4401021102193', null, '未提供', '(020)83633863', null, '0', '0', '广州 建设六马路33号706 房', '510060', '广州市良济健康食品有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('92', '0', '1', '0', '崔莹', null, 'splider', '440000000048682', null, '13808865218', '86-02083859105', '86--', '0', '0', '广州 广州市越秀区东湖西路２号金湖大厦601', '510000', '广东珠江桥食品有限公司', '500万元 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('93', '0', '1', '0', '王琳', null, 'splider', null, null, '未提供', '(020)87654419', null, '0', '0', '广州 中山一路５０号中国渔政大楼四楼', '510080', '广东金海鹰食品有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('94', '0', '1', '0', '岑庭标', null, 'splider', '4400002002358', null, '未提供', '(020)82312327', null, '0', '0', '广州 东风东路５５５号２９０５、２９０６室', '510600', '广东广南食品有限公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('95', '0', '1', '0', '符国成P889603（1）', null, 'splider', '440000400013076', null, '未提供', '020-83635008', null, '0', '0', '广东省广州市荔湾区康王中路486号和业广场2302自编A号', '510030', '广东麦海食品有限公司', '200万美元 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('96', '0', '1', '0', '詹浩强', null, 'splider', '4401022003133', null, '未提供', '(020)83168593', null, '0', '0', '广州 东风东路７４５号之一７０３房', '510250', '广州然晨食品有限公司', '100万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('97', '0', '1', '0', '尹逸', null, 'splider', '4401022009368', null, '未提供', '(020)61400814', null, '0', '0', '广州 广州市东山区环市东路417号东方广场西塔B座813房', '510095', '广州市怡静园食品有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('98', '0', '1', '0', '陈家舜', null, 'splider', null, null, '未提供', '(020)37652330', null, '0', '0', '广州 龟岗路东山大街３６号之二、之三', '510080', '梦工场美食（广州）有限公司', '40 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('99', '0', '1', '0', '刘清P', null, 'splider', null, null, '未提供', '(020)83838838', null, '0', '0', '广州 东风东路５５５号２１０７室', '510405', '香港杜朗工程塑料有限公司广州代表处', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('100', '0', '1', '0', '唐志强', null, 'splider', '4401022005491', null, '未提供', '(020)37663499', null, '0', '0', '广州 广州市东山区先烈中路102号华盛大厦南塔804房', '510095', '广州市阿固食品有限公司', '150 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('101', '0', '1', '0', '冯少伟', null, 'splider', null, null, '未提供', '(020)3758989', null, '0', '0', '广州 环市东路４０３号１０５Ａ室', '510095', '广州市友域食品有限公司', '30 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('102', '0', '1', '0', '张明', null, 'splider', '企外粤穗驻字第003740号', null, '未提供', '(020)87781628', null, '0', '0', '广州 广州市环市东路371-375号世界贸易中心南塔2509室', '510095', '香港亚太乳品有限公司广州代表处', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('103', '0', '1', '0', '周卫城D116482（2）', null, 'splider', '440101400001188', null, '未提供', '020-83635008', null, '0', '0', '广州 广州市越秀区东川路93号省人民医院综合楼首层及二层', '510055', '广东麦海食品有限公司东川路分店', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('104', '0', '1', '0', '叶桂良E775176(5)', null, 'splider', '企独粤分字第00113号', null, '未提供', '(020)87609322', null, '0', '0', '广州 广州市环市东路498号广发花园柏丽商业中心14楼F座', '510600', '海南冠亿冷饮食品有限公司广东分公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('105', '0', '1', '0', '许颖黎', null, 'splider', '914401017577868265', null, '13794368183', '未提供', null, '0', '0', '广州 广州市越秀区广卫路2号之一自编1316房', '510100', '广州先柏电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('106', '0', '1', '0', '黄平', null, 'splider', '4401022007664', null, '未提供', '(020)87240829', null, '0', '0', '广州 E单元 -', '510600', '广州市鸿成电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('107', '0', '1', '0', '朱闰源', null, 'splider', null, null, '未提供', '(020)87370614', null, '0', '0', '广州 五羊新城寺右三街四巷３０号Ｈ九', '510600', '广东远达电子有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('108', '0', '1', '0', '曾世雄', null, 'splider', '440104000027711', null, '13501534568', '86-020-85171413', '86-020-85172900', '0', '0', '中国 广东 广州市 永福路42号', '510000', '广州琦星电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('109', '0', '1', '0', '陈吉馨', null, 'splider', '440106000117155', '', '未提供', '(020)87696822', null, '0', '0', '广州 先烈中路１００号大院１４号楼首层西头', '510070', '广州市安比电子有限公司', '', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('110', '0', '1', '0', '岩里青', null, 'splider', '440000000026934', null, '未提供', '(020)87668043', null, '0', '0', '广州 广州市天河区柯木塱打石坳街13号3号楼3101房', '510070', '广东天通电子技术有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('111', '0', '1', '0', '何涛', null, 'splider', null, null, '未提供', '(020)83880825', null, '0', '0', '广州 合群二马路３号大楼３０３、３０４房', '510100', '广州市京源电子有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('112', '0', '1', '0', '郭维健', null, 'splider', '440101400084474', null, '13714532423', '86-0755-26622359', '86-0755-26622359', '0', '0', '中国 广东 广州市 深圳市西丽镇粮食集团办公大楼３１０室', '510000', '北京艾莱发喜食品有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('113', '0', '1', '0', '藤川伸生(护)TF', null, 'splider', '440101400064748', null, '未提供', '020-82580441', null, '0', '0', '广州 广州市越秀区文德南路39号', '510280', '广州益力多乳品有限公司东山家庭配送中心', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('114', '0', '1', '0', '余湛霖', null, 'splider', '4401022004375', null, '未提供', '(020)83849982', null, '0', '0', '广东省广州市东山区寺右新马路南二街１８号３０１室', '510080', '广州市东霖讯电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('115', '0', '1', '0', '何', null, 'splider', null, null, '未提供', '(020)87363318', null, '0', '0', '广州 寺右新马路１０８号１８Ｃ', '510600', '广州怡昌电子有限公司', '200 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('116', '0', '1', '0', '叶桂贤', null, 'splider', '440101000071110', null, '13316235993', '未提供', null, '0', '0', '广州 广州市越秀区庙前西街48号517房', '510080', '广州市捷胜电子科技有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('117', '0', '1', '0', '吴依娜', null, 'splider', '4401021200327', null, '未提供', '(020)83799625', null, '0', '0', '广州 广州市东山区大沙头四马路13号海印电器总汇B166、167档', '510100', '广州市谷一音响电子有限公司东山实发音响经营部', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('118', '0', '1', '0', '黄宇辉', null, 'splider', null, null, '未提供', '(020)88189439', null, '0', '0', '广东省广州市东山区环市东路３６０号珠江大厦西座１００７房', '510095', '广州市优集电子科技有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('119', '0', '1', '0', '周龙旗', null, 'splider', '4401021200555', null, '未提供', '(020)87269502', null, '0', '0', '广州 广州市东山区东华东路638号七楼701房', '510080', '广州白云蓝天电子科技有限公司东山第三分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('120', '0', '1', '0', '吴远辉', null, 'splider', null, null, '未提供', '(020)85592893', null, '0', '0', '广州 环市中路２０７号永怡大厦９０２Ｂ室', '510050', '广州捷能电子科技有限公司', '101 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('121', '0', '1', '0', '刘永前', null, 'splider', null, null, '未提供', '(020)87622296', null, '0', '0', '广州 永福路３号１５０７房 -', '510070', '广州市正音电子有限公司', '50 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('122', '0', '1', '0', '唐运芝', null, 'splider', '440104000039983', null, '未提供', '(020)83307949', null, '0', '0', '广州 东风东路８０８号华宫大厦６０１、６０３房', '510650', '广州市康松电子有限公司', '50万 (万元)', 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('123', '0', '1', '0', '黄澄波', null, 'splider', '4401022000777', null, '未提供', '(020)87313203', null, '0', '0', '广州 广州市东山区德政北路538号达信大厦807、812室', '510055', '广东权智电子科技有限公司广州分公司', null, 'default', '0', null, null, '0', '0', '0', null);
INSERT INTO `crm_customer` VALUES ('124', '0', '1', '0', '徐智莉', null, 'splider', '企外粤穗驻字第004158号', null, '未提供', '(020)83295060', null, '0', '0', '广州 广州市东山区八旗二马路48号广东航运大厦1506室', '510111', '香港金徽电子有限公司广州代表处', null, 'default', '0', null, null, '0', '0', '0', null);

-- ----------------------------
-- Table structure for `crm_customer_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_attribute`;
CREATE TABLE `crm_customer_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分组信息主键id',
  `group_id` int(10) NOT NULL COMMENT '客户属性组id',
  `name` int(10) NOT NULL COMMENT '属性组名称',
  `description` varchar(100) NOT NULL COMMENT '属性描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户属性信息';

-- ----------------------------
-- Records of crm_customer_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_attribute_group`;
CREATE TABLE `crm_customer_attribute_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户属性组id',
  `name` varchar(20) NOT NULL COMMENT '属性组名称',
  `description` varchar(100) DEFAULT NULL COMMENT '属性组描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户属性组信息';

-- ----------------------------
-- Records of crm_customer_attribute_group
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer_attribute_relation`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_attribute_relation`;
CREATE TABLE `crm_customer_attribute_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户属性关系id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `attribute_id` int(10) NOT NULL COMMENT '客户对应属性id',
  `description` varchar(100) DEFAULT NULL COMMENT '客户属性关系备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放客户和属性的关系';

-- ----------------------------
-- Records of crm_customer_attribute_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer_cares`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_cares`;
CREATE TABLE `crm_customer_cares` (
  `care_id` int(10) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `care_time` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `owner_role_id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  `creator_role_id` int(10) NOT NULL,
  PRIMARY KEY (`care_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户关怀信息表';

-- ----------------------------
-- Records of crm_customer_cares
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer_data`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_data`;
CREATE TABLE `crm_customer_data` (
  `customer_id` int(10) unsigned NOT NULL COMMENT '客户id',
  `no_of_employees` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户附表信息';

-- ----------------------------
-- Records of crm_customer_data
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_customer_record`
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_record`;
CREATE TABLE `crm_customer_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL COMMENT '客户',
  `user_id` int(10) NOT NULL COMMENT '用户',
  `start_time` int(10) NOT NULL COMMENT '时间',
  `type` int(10) NOT NULL COMMENT '1：领取 2：分配',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii COMMENT='客户记录表';

-- ----------------------------
-- Records of crm_customer_record
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_email_template`
-- ----------------------------
DROP TABLE IF EXISTS `crm_email_template`;
CREATE TABLE `crm_email_template` (
  `template_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `title` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL COMMENT '内容',
  `order_id` int(4) NOT NULL COMMENT '顺序id',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信模板';

-- ----------------------------
-- Records of crm_email_template
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_event`
-- ----------------------------
DROP TABLE IF EXISTS `crm_event`;
CREATE TABLE `crm_event` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `owner_role_id` int(10) NOT NULL COMMENT '所有人岗位',
  `subject` varchar(50) NOT NULL COMMENT '主题',
  `start_date` int(10) NOT NULL COMMENT '开始时间',
  `end_date` int(10) NOT NULL COMMENT '结束时间',
  `venue` varchar(100) NOT NULL COMMENT '活动地点',
  `contacts_id` int(10) NOT NULL COMMENT '联系人id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '修改时间',
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `leads_id` int(10) NOT NULL COMMENT '线索id',
  `recurring` int(1) NOT NULL COMMENT '重复1 不重复0',
  `description` text NOT NULL COMMENT '描述',
  `isclose` int(1) NOT NULL COMMENT '是否关闭1开启0关闭',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动信息表';

-- ----------------------------
-- Records of crm_event
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_fields`
-- ----------------------------
DROP TABLE IF EXISTS `crm_fields`;
CREATE TABLE `crm_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model` varchar(20) NOT NULL COMMENT '对应模块小写，如business',
  `is_main` int(1) NOT NULL COMMENT '是否是主表字段1是0否',
  `field` varchar(50) NOT NULL COMMENT '数据库字段名',
  `name` varchar(100) NOT NULL COMMENT '显示标识',
  `form_type` varchar(20) NOT NULL COMMENT '数据类型 text 单行文本 textarea 多行文本 editor 编辑器 box 选项 datetime 日期 number 数字 user员工email邮箱phone手机号mobile电话phone',
  `default_value` varchar(100) NOT NULL COMMENT '默认值',
  `color` varchar(20) NOT NULL COMMENT '颜色',
  `max_length` int(4) NOT NULL COMMENT '字段长度',
  `is_unique` int(1) NOT NULL COMMENT '是否唯一1是0否',
  `is_null` int(1) NOT NULL COMMENT '是否允许为空',
  `is_validate` int(1) NOT NULL COMMENT '是否验证',
  `in_index` int(1) NOT NULL COMMENT '是否列表页显示1是0否',
  `in_add` int(1) NOT NULL DEFAULT '1' COMMENT '是否添加时显示1是0否',
  `input_tips` varchar(500) NOT NULL COMMENT '输入提示',
  `setting` text NOT NULL COMMENT '设置',
  `order_id` int(5) NOT NULL COMMENT '同一模块内的顺序id',
  `operating` int(1) NOT NULL COMMENT '0改删、1改、2无、3删',
  PRIMARY KEY (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='字段表';

-- ----------------------------
-- Records of crm_fields
-- ----------------------------
INSERT INTO `crm_fields` VALUES ('1', '', '1', 'owner_role_id', '负责人', 'user', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('2', '', '1', 'creator_role_id', '创建人', 'user', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('3', '', '1', 'delete_role_id', '删除人', 'user', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('4', '', '1', 'is_deleted', '是否删除', 'deleted', '', '', '1', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('5', '', '1', 'create_time', '创建时间', 'datetime', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('6', '', '1', 'update_time', '更新时间', 'datetime', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('7', '', '1', 'delete_time', '删除时间', 'datetime', '', '', '10', '0', '0', '0', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('8', 'customer', '1', 'name', '客户名称', 'text', '', '5521FF', '333', '1', '1', '1', '1', '1', '', '', '0', '1');
INSERT INTO `crm_fields` VALUES ('9', 'customer', '1', 'origin', '客户信息来源', 'box', '', '333333', '150', '0', '0', '0', '0', '1', '', 'array(\'type\'=>\'select\',\'data\'=>array(1=>\'电话营销\',2=>\'网络营销\'))', '6', '1');
INSERT INTO `crm_fields` VALUES ('10', 'customer', '1', 'address', '客户联系地址', 'address', '', '', '500', '0', '0', '0', '1', '1', '', '', '18', '0');
INSERT INTO `crm_fields` VALUES ('11', 'customer', '1', 'zip_code', '邮编', 'text', '', '', '150', '0', '0', '0', '0', '1', '', '', '12', '0');
INSERT INTO `crm_fields` VALUES ('12', 'customer', '1', 'industry', '客户行业', 'box', '', '050505', '150', '0', '0', '0', '1', '1', '', 'array(\'type\'=>\'radio\',\'data\'=>array(1=>\'教育/培训\',2=>\'电子商务\',3=>\'对外贸易\'))', '5', '1');
INSERT INTO `crm_fields` VALUES ('13', 'customer', '1', 'annual_revenue', '年营业额', 'box', '', '', '150', '0', '0', '0', '0', '1', '', 'array(\'type\'=>\'select\',\'data\'=>array(1=>\'1-10万\',2=>\'10-20万\',3=>\'20-50万\'))', '14', '1');
INSERT INTO `crm_fields` VALUES ('14', 'customer', '1', 'ownership', '公司性质', 'box', '', '000000', '150', '0', '0', '0', '0', '1', '', 'array(\'type\'=>\'radio\',\'data\'=>array(1=>\'合资\',2=>\'国企\',3=>\'民营\'))', '7', '0');
INSERT INTO `crm_fields` VALUES ('15', 'customer', '1', 'rating', '评分', 'box', '', 'A3A3A3', '150', '0', '0', '1', '1', '1', '', 'array(\'type\'=>\'radio\',\'data\'=>array(1=>\'一星\',2=>\'二星\',3=>\'三星\'))', '15', '0');
INSERT INTO `crm_fields` VALUES ('16', 'business', '1', 'origin', '商机来源', 'box', '', '1BA69C', '0', '0', '0', '1', '1', '1', '', 'array(\'type\'=>\'select\',\'data\'=>array(1=>\'电话营销\',2=>\'网络营销\'))', '11', '1');
INSERT INTO `crm_fields` VALUES ('17', 'business', '1', 'type', '商机类型', 'box', '', '', '0', '0', '0', '0', '0', '1', '', 'array(\'type\'=>\'select\', \'data\'=>array(1=>\'新业务\',2=>\'现有业务\'))', '9', '0');
INSERT INTO `crm_fields` VALUES ('18', 'business', '1', 'gain_rate', '赢单率', 'number', '', '', '0', '0', '0', '0', '0', '1', '%', '', '12', '0');
INSERT INTO `crm_fields` VALUES ('19', 'business', '1', 'estimate_price', '预计价格', 'floatnumber', '', '333333', '0', '0', '1', '1', '0', '1', '单位：元', '', '13', '0');
INSERT INTO `crm_fields` VALUES ('20', 'product', '1', 'category_id', '产品类别', 'p_box', '', '', '0', '0', '0', '0', '0', '1', '', '', '2', '2');
INSERT INTO `crm_fields` VALUES ('21', 'business', '1', 'status_id', '状态', 'b_box', '', '', '0', '0', '0', '0', '0', '1', '', '', '10', '2');
INSERT INTO `crm_fields` VALUES ('22', 'product', '1', 'name', ' 产品名称', 'text', '', '021012', '200', '1', '1', '0', '1', '1', '', '', '0', '1');
INSERT INTO `crm_fields` VALUES ('23', 'product', '1', 'cost_price', '成本价', 'floatnumber', '', '1F1F1F', '10', '0', '0', '0', '0', '1', '', '', '8', '0');
INSERT INTO `crm_fields` VALUES ('24', 'product', '1', 'suggested_price', '建议售价', 'floatnumber', '', '', '0', '0', '0', '0', '0', '1', '', '', '9', '0');
INSERT INTO `crm_fields` VALUES ('25', 'product', '1', 'development_team', '开发团队', 'text', '', '333333', '0', '0', '1', '1', '0', '1', '', '', '6', '0');
INSERT INTO `crm_fields` VALUES ('26', 'product', '1', 'development_time', '研发时间', 'datetime', '', '333333', '0', '0', '1', '0', '0', '1', '', '', '3', '0');
INSERT INTO `crm_fields` VALUES ('27', 'product', '1', 'link', '详情链接', 'text', 'http://', '6E6E6E', '200', '0', '0', '0', '1', '1', '', '', '5', '0');
INSERT INTO `crm_fields` VALUES ('28', 'business', '1', 'name', '商机名', 'text', '', '090D08', '0', '1', '1', '1', '1', '1', '', '', '2', '1');
INSERT INTO `crm_fields` VALUES ('29', 'business', '1', 'nextstep', '下次联系内容', 'text', '', '', '0', '0', '0', '0', '1', '1', '', '', '15', '2');
INSERT INTO `crm_fields` VALUES ('30', 'business', '1', 'nextstep_time', '下次联系时间', 'datetime', '', '', '0', '0', '0', '1', '1', '1', '', '', '14', '2');
INSERT INTO `crm_fields` VALUES ('31', 'business', '1', 'customer_id', '客户', 'customer', '', '', '0', '0', '0', '1', '1', '1', '', '', '0', '2');
INSERT INTO `crm_fields` VALUES ('32', 'business', '1', 'contacts_id', '联系人', 'contacts', '', '', '0', '0', '0', '0', '0', '1', '', '', '3', '2');
INSERT INTO `crm_fields` VALUES ('33', 'business', '1', 'contract_address', '合同签订地址', 'address', '', '333333', '0', '0', '0', '1', '0', '1', '', '', '4', '0');
INSERT INTO `crm_fields` VALUES ('34', 'leads', '1', 'nextstep_time', '下次联系时间', 'datetime', '', '', '0', '0', '0', '0', '1', '1', '', '', '8', '2');
INSERT INTO `crm_fields` VALUES ('35', 'leads', '1', 'nextstep', '下次联系内容', 'text', '', '', '0', '0', '0', '0', '1', '1', '', '', '9', '2');
INSERT INTO `crm_fields` VALUES ('36', 'leads', '1', 'contacts_name', '联系人姓名', 'text', '', '333333', '0', '0', '1', '1', '1', '1', '', '', '1', '1');
INSERT INTO `crm_fields` VALUES ('37', 'leads', '1', 'saltname', '尊称', 'box', '', '333333', '0', '0', '0', '0', '1', '1', '', 'array(\'type\'=>\'select\',\'data\'=>array(1=>\'女士\',2=>\'先生\'))', '4', '1');
INSERT INTO `crm_fields` VALUES ('38', 'leads', '1', 'mobile', '手机', 'mobile', '', '333333', '0', '0', '0', '1', '1', '1', '', '', '5', '1');
INSERT INTO `crm_fields` VALUES ('39', 'leads', '1', 'email', '邮箱', 'email', '', '', '0', '0', '0', '1', '0', '1', '', '', '6', '1');
INSERT INTO `crm_fields` VALUES ('40', 'leads', '1', 'position', '职位', 'text', '', '', '0', '0', '0', '0', '0', '1', '', '', '2', '1');
INSERT INTO `crm_fields` VALUES ('41', 'leads', '1', 'address', '地址', 'address', '', '333333', '0', '0', '0', '0', '0', '1', '', '', '7', '0');
INSERT INTO `crm_fields` VALUES ('42', 'customer', '0', 'no_of_employees', '员工数', 'box', '', '0A0A0A', '150', '0', '0', '0', '0', '1', '', 'array(\'type\'=>\'select\',\'data\'=>array(1=>\'5--20人\',2=>\'20-50人\',3=>\'50人以上\'))', '13', '1');
INSERT INTO `crm_fields` VALUES ('43', 'customer', '0', 'description', '备注', 'textarea', '', '', '0', '0', '0', '0', '0', '1', '', '', '19', '1');
INSERT INTO `crm_fields` VALUES ('44', 'leads', '0', 'description', '备注', 'textarea', '', '', '0', '0', '0', '0', '0', '1', '', '', '19', '1');
INSERT INTO `crm_fields` VALUES ('45', 'product', '0', 'description', '备注', 'textarea', '', '', '0', '0', '0', '0', '0', '1', '', '', '19', '1');
INSERT INTO `crm_fields` VALUES ('46', 'business', '0', 'description', '备注', 'textarea', '', '', '0', '0', '0', '0', '0', '1', '', '', '19', '1');
INSERT INTO `crm_fields` VALUES ('47', 'leads', '1', 'name', '公司名', 'text', '', '05330E', '0', '0', '1', '0', '1', '1', '', '', '0', '1');

-- ----------------------------
-- Table structure for `crm_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_file`;
CREATE TABLE `crm_file` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '附件主键',
  `name` varchar(50) NOT NULL COMMENT '附件名',
  `role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `size` int(10) NOT NULL COMMENT '文件大小字节',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `file_path` varchar(200) NOT NULL COMMENT '文件路径',
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of crm_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_finance`
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance`;
CREATE TABLE `crm_finance` (
  `finance_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '财务id',
  `name` varchar(50) NOT NULL COMMENT '财务活动名',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `check_role_id` int(10) NOT NULL COMMENT '审核人id',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `check_time` int(10) NOT NULL COMMENT '审核时间',
  `check_result` int(1) NOT NULL COMMENT '0未审核，1审核通过，-1审核未通过，2等到处理',
  `money` float(10,2) NOT NULL COMMENT '实际金额',
  `plan_money` float(10,2) NOT NULL COMMENT '应收（付）金额',
  `income_or_expenses` int(1) NOT NULL COMMENT '收入1还是支出-1',
  `description` varchar(100) NOT NULL COMMENT '财务活动描述',
  PRIMARY KEY (`finance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of crm_finance
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `crm_knowledge`;
CREATE TABLE `crm_knowledge` (
  `knowledge_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` int(10) NOT NULL COMMENT '文章类别',
  `role_id` int(10) NOT NULL COMMENT '发表人岗位',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) NOT NULL COMMENT '发表时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `hits` int(10) NOT NULL COMMENT '点击次数',
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`knowledge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存放知识文章信息';

-- ----------------------------
-- Records of crm_knowledge
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_knowledge_category`
-- ----------------------------
DROP TABLE IF EXISTS `crm_knowledge_category`;
CREATE TABLE `crm_knowledge_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类别id',
  `parent_id` int(11) NOT NULL COMMENT '父类别id',
  `name` varchar(30) NOT NULL COMMENT '类别名称',
  `description` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='知识文章分类信息表';

-- ----------------------------
-- Records of crm_knowledge_category
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_leads`
-- ----------------------------
DROP TABLE IF EXISTS `crm_leads`;
CREATE TABLE `crm_leads` (
  `leads_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '线索主键',
  `owner_role_id` int(10) NOT NULL COMMENT '拥有者岗位',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `name` varchar(255) NOT NULL,
  `position` varchar(20) NOT NULL COMMENT '职位',
  `contacts_name` varchar(255) NOT NULL,
  `saltname` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人的岗位id',
  `delete_time` int(10) NOT NULL,
  `is_transformed` int(1) NOT NULL COMMENT '是否转换',
  `transform_role_id` int(10) NOT NULL COMMENT '转换者',
  `contacts_id` int(10) NOT NULL COMMENT '转换成联系人',
  `customer_id` int(10) NOT NULL COMMENT '转换成的客户',
  `business_id` int(10) NOT NULL COMMENT '转换成的商机',
  `nextstep` varchar(50) NOT NULL COMMENT '下一次联系',
  `nextstep_time` int(10) NOT NULL COMMENT '联系时间',
  `have_time` int(10) NOT NULL COMMENT '最后一次领取时间',
  `address` varchar(500) NOT NULL,
  PRIMARY KEY (`leads_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='线索表';

-- ----------------------------
-- Records of crm_leads
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_leads_data`
-- ----------------------------
DROP TABLE IF EXISTS `crm_leads_data`;
CREATE TABLE `crm_leads_data` (
  `leads_id` int(10) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`leads_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_leads_data
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_leads_record`
-- ----------------------------
DROP TABLE IF EXISTS `crm_leads_record`;
CREATE TABLE `crm_leads_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leads_id` int(10) NOT NULL,
  `owner_role_id` int(10) NOT NULL,
  `start_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_leads_record
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_log`;
CREATE TABLE `crm_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `role_id` int(11) NOT NULL COMMENT '创建者岗位',
  `category_id` int(10) NOT NULL,
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '更新时间',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `content` text NOT NULL COMMENT '内容',
  `comment_id` int(10) NOT NULL COMMENT '评论id',
  `about_roles` varchar(200) NOT NULL COMMENT '新增相关人',
  `about_roles_name` varchar(500) NOT NULL COMMENT '新增相关人姓名',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of crm_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_log_category`
-- ----------------------------
DROP TABLE IF EXISTS `crm_log_category`;
CREATE TABLE `crm_log_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) NOT NULL COMMENT '分类名',
  `order_id` int(10) NOT NULL COMMENT '顺序id',
  `description` varchar(500) NOT NULL COMMENT '描述',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='日志类型表';

-- ----------------------------
-- Records of crm_log_category
-- ----------------------------
INSERT INTO `crm_log_category` VALUES ('2', '月报', '3', '每月工作总结');
INSERT INTO `crm_log_category` VALUES ('3', '周报', '2', '每周工作总结');
INSERT INTO `crm_log_category` VALUES ('4', '日报', '1', '每日工作总结');

-- ----------------------------
-- Table structure for `crm_message`
-- ----------------------------
DROP TABLE IF EXISTS `crm_message`;
CREATE TABLE `crm_message` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_role_id` int(11) unsigned NOT NULL,
  `from_role_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `read_time` int(11) unsigned NOT NULL,
  `send_time` int(11) unsigned NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `to_role_id` (`to_role_id`,`from_role_id`,`read_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_message
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `crm_navigation`;
CREATE TABLE `crm_navigation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `url` varchar(200) NOT NULL,
  `postion` varchar(10) NOT NULL COMMENT '位置',
  `listorder` int(11) NOT NULL COMMENT '排序',
  `module` varchar(20) NOT NULL COMMENT '模块',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='导航菜单';

-- ----------------------------
-- Records of crm_navigation
-- ----------------------------
INSERT INTO `crm_navigation` VALUES ('1', '线索', 'http://demo.5kcrm.com/index.php?m=leads', 'top', '0', 'Leads');
INSERT INTO `crm_navigation` VALUES ('2', '客户', 'http://demo.5kcrm.com/index.php?m=customer', 'top', '1', 'Customer');
INSERT INTO `crm_navigation` VALUES ('3', '商机', 'http://demo.5kcrm.com/index.php?m=business', 'top', '2', 'Business');
INSERT INTO `crm_navigation` VALUES ('4', '产品', 'http://demo.5kcrm.com/index.php?m=product', 'top', '3', 'Product');
INSERT INTO `crm_navigation` VALUES ('5', '任务', 'http://demo.5kcrm.com/index.php?m=task', 'top', '4', 'Task');
INSERT INTO `crm_navigation` VALUES ('6', '日程', 'http://demo.5kcrm.com/index.php?m=event', 'top', '5', 'Event');
INSERT INTO `crm_navigation` VALUES ('7', '合同', 'http://demo.5kcrm.com/index.php?m=contract', 'top', '6', 'Contract');
INSERT INTO `crm_navigation` VALUES ('8', '财务', 'http://demo.5kcrm.com/index.php?m=finance', 'top', '7', 'Finance');
INSERT INTO `crm_navigation` VALUES ('9', '日志', 'http://demo.5kcrm.com/index.php?m=log', 'more', '0', '');
INSERT INTO `crm_navigation` VALUES ('10', '知识', 'http://demo.5kcrm.com/index.php?m=knowledge', 'more', '1', 'Knowledge');
INSERT INTO `crm_navigation` VALUES ('11', '营销', 'http://demo.5kcrm.com/index.php?m=setting&a=sendsms', 'more', '2', '');
INSERT INTO `crm_navigation` VALUES ('12', '站内信', 'http://demo.5kcrm.com/index.php?m=message', 'more', '3', '');
INSERT INTO `crm_navigation` VALUES ('13', '我的面板', 'http://demo.5kcrm.com/', 'user', '0', '');
INSERT INTO `crm_navigation` VALUES ('14', '个人资料', 'http://demo.5kcrm.com/index.php?m=user&a=edit', 'user', '1', '');
INSERT INTO `crm_navigation` VALUES ('15', '组织架构', 'http://demo.5kcrm.com/index.php?m=user', 'user', '2', '');
INSERT INTO `crm_navigation` VALUES ('16', '权限分配', 'http://demo.5kcrm.com/index.php?m=user&a=role', 'user', '3', 'Role');
INSERT INTO `crm_navigation` VALUES ('17', '公告管理', 'http://demo.5kcrm.com/index.php?m=announcement', 'user', '4', 'announcement');
INSERT INTO `crm_navigation` VALUES ('18', '操作日志', 'http://demo.5kcrm.com/index.php?m=action_log', 'user', '5', '');
INSERT INTO `crm_navigation` VALUES ('19', '系统设置', 'http://demo.5kcrm.com/index.php?m=setting', 'user', '6', 'Setting');

-- ----------------------------
-- Table structure for `crm_payables`
-- ----------------------------
DROP TABLE IF EXISTS `crm_payables`;
CREATE TABLE `crm_payables` (
  `payables_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应付款id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `contract_id` int(10) DEFAULT NULL COMMENT '合同id',
  `name` varchar(500) NOT NULL COMMENT '应付款名',
  `price` float(10,2) NOT NULL COMMENT '应付金额',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` int(2) NOT NULL COMMENT '状态0未收1部分收2已收',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`payables_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应付款表';

-- ----------------------------
-- Records of crm_payables
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_paymentorder`
-- ----------------------------
DROP TABLE IF EXISTS `crm_paymentorder`;
CREATE TABLE `crm_paymentorder` (
  `paymentorder_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '付款单id',
  `name` varchar(500) NOT NULL COMMENT '付款单主题',
  `money` float(10,2) NOT NULL COMMENT '付款金额',
  `payables_id` int(10) NOT NULL COMMENT '应付款id',
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(10) NOT NULL COMMENT '审核时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`paymentorder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='付款单';

-- ----------------------------
-- Records of crm_paymentorder
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_permission`
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission`;
CREATE TABLE `crm_permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `role_id` int(10) NOT NULL COMMENT '岗位id',
  `position_id` int(10) NOT NULL COMMENT '岗位组id',
  `url` varchar(50) NOT NULL COMMENT '对应模块操作',
  `description` varchar(200) NOT NULL COMMENT '权限备注',
  PRIMARY KEY (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放权限信息';

-- ----------------------------
-- Records of crm_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_position`
-- ----------------------------
DROP TABLE IF EXISTS `crm_position`;
CREATE TABLE `crm_position` (
  `position_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `parent_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department_id` int(10) NOT NULL,
  `description` varchar(200) NOT NULL COMMENT '描述',
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='岗位表控制权限';

-- ----------------------------
-- Records of crm_position
-- ----------------------------
INSERT INTO `crm_position` VALUES ('1', '0', 'CEO', '1', '');

-- ----------------------------
-- Table structure for `crm_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product`;
CREATE TABLE `crm_product` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `category_id` int(11) NOT NULL COMMENT '产品类别的id',
  `name` varchar(200) NOT NULL DEFAULT '',
  `creator_role_id` int(10) NOT NULL COMMENT '产品信息添加者',
  `cost_price` float(10,2) NOT NULL DEFAULT '0.00',
  `suggested_price` float(10,2) NOT NULL COMMENT '建议售价',
  `development_team` varchar(255) NOT NULL DEFAULT '',
  `development_time` int(10) NOT NULL,
  `link` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_attribute`;
CREATE TABLE `crm_product_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品属性id',
  `group_id` int(10) NOT NULL COMMENT '产品id',
  `name` varchar(20) NOT NULL COMMENT '属性名',
  `description` varchar(50) DEFAULT NULL COMMENT '产品属性备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性信息';

-- ----------------------------
-- Records of crm_product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_product_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_attribute_group`;
CREATE TABLE `crm_product_attribute_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品属性组id',
  `name` varchar(20) NOT NULL COMMENT '产品属性组名称',
  `description` varchar(100) DEFAULT NULL COMMENT '产品属性组备注',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性组相关信息';

-- ----------------------------
-- Records of crm_product_attribute_group
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_product_attribute_relation`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_attribute_relation`;
CREATE TABLE `crm_product_attribute_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品属性关系id',
  `product_id` int(10) NOT NULL COMMENT '产品id',
  `attribute_id` int(10) NOT NULL COMMENT '产品属性id',
  `description` varchar(100) DEFAULT NULL COMMENT '产品属性关系描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放产品属性关系的相关信息';

-- ----------------------------
-- Records of crm_product_attribute_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_category`;
CREATE TABLE `crm_product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品类别id',
  `parent_id` int(11) NOT NULL COMMENT '父类别id',
  `name` varchar(30) NOT NULL COMMENT '类别名称',
  `description` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_product_category
-- ----------------------------
INSERT INTO `crm_product_category` VALUES ('1', '0', '默认', '');

-- ----------------------------
-- Table structure for `crm_product_data`
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_data`;
CREATE TABLE `crm_product_data` (
  `product_id` int(10) NOT NULL COMMENT '主键',
  `description` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品信息附表';

-- ----------------------------
-- Records of crm_product_data
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_receivables`
-- ----------------------------
DROP TABLE IF EXISTS `crm_receivables`;
CREATE TABLE `crm_receivables` (
  `receivables_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应收款id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `contract_id` int(10) DEFAULT NULL COMMENT '合同id',
  `name` varchar(500) NOT NULL COMMENT '应收款名',
  `price` float(10,2) NOT NULL COMMENT '应收金额',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '收款时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` int(2) NOT NULL COMMENT '状态0未收1部分收2已收',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`receivables_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应收款表';

-- ----------------------------
-- Records of crm_receivables
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_receivingorder`
-- ----------------------------
DROP TABLE IF EXISTS `crm_receivingorder`;
CREATE TABLE `crm_receivingorder` (
  `receivingorder_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收款单id',
  `name` varchar(500) NOT NULL COMMENT '收款单主题',
  `money` float(10,2) NOT NULL COMMENT '收款金额',
  `receivables_id` int(10) NOT NULL COMMENT '应收款id',
  `description` text NOT NULL COMMENT '描述',
  `pay_time` int(10) NOT NULL COMMENT '付款时间',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者id',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(10) NOT NULL COMMENT '审核时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT ' 是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`receivingorder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收款单';

-- ----------------------------
-- Records of crm_receivingorder
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_role`
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '岗位id',
  `position_id` int(10) NOT NULL COMMENT '岗位组名',
  `user_id` int(10) NOT NULL COMMENT '员工id',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='本表存放用户岗位信息';

-- ----------------------------
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `crm_role_department`
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_department`;
CREATE TABLE `crm_role_department` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(10) NOT NULL COMMENT '父类部门id',
  `name` varchar(50) NOT NULL COMMENT '部门名',
  `description` varchar(200) NOT NULL COMMENT '部门描述',
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='本表存放部门信息';

-- ----------------------------
-- Records of crm_role_department
-- ----------------------------
INSERT INTO `crm_role_department` VALUES ('1', '0', '办公室', '公司文档管理、财务管理');

-- ----------------------------
-- Table structure for `crm_r_business_contract`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_contract`;
CREATE TABLE `crm_r_business_contract` (
  `id` int(10) NOT NULL,
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `contract_id` int(10) NOT NULL COMMENT '合同id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机合同关系表';

-- ----------------------------
-- Records of crm_r_business_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_customer`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_customer`;
CREATE TABLE `crm_r_business_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_business_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_event`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_event`;
CREATE TABLE `crm_r_business_event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_business_event
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_file`;
CREATE TABLE `crm_r_business_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_business_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_log`;
CREATE TABLE `crm_r_business_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机和日志id对应关系表';

-- ----------------------------
-- Records of crm_r_business_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_product`;
CREATE TABLE `crm_r_business_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `sales_price` float(10,2) NOT NULL COMMENT '成交价',
  `estimate_price` float(10,2) NOT NULL COMMENT '报价',
  `amount` int(10) NOT NULL COMMENT '产品交易数量',
  `description` varchar(200) NOT NULL COMMENT '产品交易备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_business_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_status`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_status`;
CREATE TABLE `crm_r_business_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '关系主键',
  `business_id` int(10) NOT NULL COMMENT '商机id',
  `gain_rate` int(3) NOT NULL,
  `status_id` int(10) NOT NULL COMMENT '状态id',
  `description` text NOT NULL COMMENT '阶段描述',
  `due_date` int(10) NOT NULL COMMENT '预计成交日期',
  `owner_role_id` int(10) NOT NULL COMMENT '负责人id',
  `update_time` int(10) NOT NULL COMMENT '推进时间',
  `update_role_id` int(10) NOT NULL COMMENT '推进人',
  `total_price` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商机状态阶段表';

-- ----------------------------
-- Records of crm_r_business_status
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_business_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_business_task`;
CREATE TABLE `crm_r_business_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_business_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contacts_customer`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contacts_customer`;
CREATE TABLE `crm_r_contacts_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contacts_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_contacts_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contacts_event`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contacts_event`;
CREATE TABLE `crm_r_contacts_event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contacts_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_contacts_event
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contacts_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contacts_file`;
CREATE TABLE `crm_r_contacts_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contacts_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_contacts_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contacts_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contacts_log`;
CREATE TABLE `crm_r_contacts_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contacts_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_contacts_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contacts_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contacts_task`;
CREATE TABLE `crm_r_contacts_task` (
  `id` int(10) NOT NULL,
  `contacts_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='联系人任务关系表';

-- ----------------------------
-- Records of crm_r_contacts_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contract_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contract_file`;
CREATE TABLE `crm_r_contract_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) NOT NULL COMMENT '合同id',
  `file_id` int(10) NOT NULL COMMENT '文件id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合同文件关系表';

-- ----------------------------
-- Records of crm_r_contract_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_contract_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_contract_product`;
CREATE TABLE `crm_r_contract_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contract_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `sales_price` float(10,2) NOT NULL,
  `estimate_price` float(10,2) NOT NULL,
  `amount` int(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_contract_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_customer_event`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_customer_event`;
CREATE TABLE `crm_r_customer_event` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `event_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_customer_event
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_customer_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_customer_file`;
CREATE TABLE `crm_r_customer_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_customer_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_customer_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_customer_log`;
CREATE TABLE `crm_r_customer_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_customer_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_customer_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_customer_task`;
CREATE TABLE `crm_r_customer_task` (
  `id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户任务关系表';

-- ----------------------------
-- Records of crm_r_customer_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_event_file`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_event_file`;
CREATE TABLE `crm_r_event_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_event_file
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_event_leads`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_event_leads`;
CREATE TABLE `crm_r_event_leads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_event_leads
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_event_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_event_log`;
CREATE TABLE `crm_r_event_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) DEFAULT NULL,
  `log_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动和日志id对应表';

-- ----------------------------
-- Records of crm_r_event_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_event_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_event_product`;
CREATE TABLE `crm_r_event_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_event_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_finance`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_finance`;
CREATE TABLE `crm_r_file_finance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_id` int(10) NOT NULL,
  `finance_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_file_finance
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_leads`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_leads`;
CREATE TABLE `crm_r_file_leads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_id` int(10) NOT NULL,
  `leads_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件和日志对应关系';

-- ----------------------------
-- Records of crm_r_file_leads
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_log`;
CREATE TABLE `crm_r_file_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件和日志对应关系表';

-- ----------------------------
-- Records of crm_r_file_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_product`;
CREATE TABLE `crm_r_file_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_file_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_task`;
CREATE TABLE `crm_r_file_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_file_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_file_user`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_file_user`;
CREATE TABLE `crm_r_file_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `file_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='员工对应文件资料表';

-- ----------------------------
-- Records of crm_r_file_user
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_finance_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_finance_log`;
CREATE TABLE `crm_r_finance_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `finance_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_finance_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_leads_log`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_leads_log`;
CREATE TABLE `crm_r_leads_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leads_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_leads_log
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_leads_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_leads_task`;
CREATE TABLE `crm_r_leads_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leads_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_leads_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_log_product`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_log_product`;
CREATE TABLE `crm_r_log_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `log_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_log_product
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_log_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_log_task`;
CREATE TABLE `crm_r_log_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `task_id` int(10) NOT NULL,
  `log_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务和日志id对应表';

-- ----------------------------
-- Records of crm_r_log_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_log_user`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_log_user`;
CREATE TABLE `crm_r_log_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `log_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='员工备注信息表';

-- ----------------------------
-- Records of crm_r_log_user
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_r_product_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_r_product_task`;
CREATE TABLE `crm_r_product_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `task_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_r_product_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_sms_template`
-- ----------------------------
DROP TABLE IF EXISTS `crm_sms_template`;
CREATE TABLE `crm_sms_template` (
  `template_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject` varchar(200) NOT NULL COMMENT '主题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `order_id` int(4) NOT NULL COMMENT '顺序id',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信模板';

-- ----------------------------
-- Records of crm_sms_template
-- ----------------------------
INSERT INTO `crm_sms_template` VALUES ('1', '默认模板', '有一个特别的日子，鲜花都为你展现；有一个特殊的日期，阳光都为你温暖；有一个美好的时刻，百灵都为你欢颜；有一个难忘的今天，亲朋都为你祝愿；那就是今天是你的生日，祝你幸福安康顺意连年！', '1');

-- ----------------------------
-- Table structure for `crm_task`
-- ----------------------------
DROP TABLE IF EXISTS `crm_task`;
CREATE TABLE `crm_task` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `owner_role_id` varchar(200) NOT NULL COMMENT '任务所有者岗位',
  `about_roles` varchar(200) NOT NULL COMMENT '任务相关人',
  `subject` varchar(100) NOT NULL COMMENT '任务主题',
  `due_date` int(10) NOT NULL COMMENT '任务结束时间',
  `status` varchar(20) NOT NULL COMMENT '任务状态',
  `priority` varchar(10) NOT NULL COMMENT '优先级',
  `send_email` varchar(50) NOT NULL COMMENT '是否发送通知邮件  1发送0不发送',
  `description` text NOT NULL COMMENT '描述',
  `creator_role_id` int(10) NOT NULL COMMENT '创建者岗位',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `update_date` int(10) NOT NULL COMMENT '修改时间',
  `isclose` int(1) NOT NULL COMMENT '是否关闭',
  `is_deleted` int(1) NOT NULL COMMENT '是否删除',
  `delete_role_id` int(10) NOT NULL COMMENT '删除人',
  `delete_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务信息表';

-- ----------------------------
-- Records of crm_task
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_user`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user`;
CREATE TABLE `crm_user` (
  `user_id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `role_id` int(10) DEFAULT NULL COMMENT '当前使用岗位',
  `category_id` int(11) DEFAULT NULL COMMENT '用户类别',
  `status` int(1) DEFAULT '0' COMMENT '状态：0-未验证，1-已验证',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `nickname` varchar(1000) DEFAULT NULL COMMENT '用户自定义导航菜单',
  `salt` varchar(4) DEFAULT NULL COMMENT '安全符',
  `sex` int(1) DEFAULT NULL COMMENT '用户性别1男2女',
  `email` varchar(30) DEFAULT NULL COMMENT '用户邮箱',
  `telephone` varchar(20) DEFAULT NULL COMMENT '用户的电话',
  `address` varchar(100) DEFAULT NULL COMMENT '用户的联系地址',
  `birthday` date DEFAULT NULL COMMENT '\r\n',
  `dashboard` text COMMENT '个人面板',
  `reg_ip` varchar(15) DEFAULT NULL COMMENT '注册时的ip',
  `reg_time` timestamp NULL DEFAULT NULL COMMENT '用户的注册时间',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '用户最后一次登录的时间',
  `lostpw_time` timestamp NULL DEFAULT NULL COMMENT '用户申请找回密码的时间',
  `weixinid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户的相关基本信息';

-- ----------------------------
-- Records of crm_user
-- ----------------------------
INSERT INTO `crm_user` VALUES ('1', '1', '1', '0', 'admin', '1', 'jingo', '1', '1', 'q669239799@163.com', '13137092355', '浙江杭州', '2018-03-14', '', '212.9.9.1', '2018-03-14 00:00:00', '2018-03-22 00:00:00', '2018-03-15 00:00:00', '1233');
INSERT INTO `crm_user` VALUES ('3', '0', '0', '0', 'guest', '123', '132', null, '1', 'qqqq@Qq.com', '13133333333', '123', '2018-04-02', null, null, null, null, null, null);
INSERT INTO `crm_user` VALUES ('4', '0', '0', '0', 'guest12', '123321', 'qwe', null, '1', 'qqq@qq.com', '13211111107', '', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `crm_user_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_attribute`;
CREATE TABLE `crm_user_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `group_id` int(10) NOT NULL COMMENT '用户的属性组id',
  `name` varchar(50) NOT NULL COMMENT '属性名',
  `description` varchar(100) DEFAULT NULL COMMENT '属性注释',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户的分类属性';

-- ----------------------------
-- Records of crm_user_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_user_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_attribute_group`;
CREATE TABLE `crm_user_attribute_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '属性组id',
  `name` varchar(20) NOT NULL COMMENT '属性组名',
  `description` varchar(100) DEFAULT NULL COMMENT '属性组描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表用来存放用户属性组信息';

-- ----------------------------
-- Records of crm_user_attribute_group
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_user_attribute_relation`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_attribute_relation`;
CREATE TABLE `crm_user_attribute_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `attribute_id` int(10) NOT NULL COMMENT '关系id',
  `description` varchar(100) DEFAULT NULL COMMENT '用户属性关系注释',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本表存放用户和属性对应关系';

-- ----------------------------
-- Records of crm_user_attribute_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `crm_user_category`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_category`;
CREATE TABLE `crm_user_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(20) NOT NULL COMMENT '类别的名字',
  `description` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='本表存放用户类别信息';

-- ----------------------------
-- Records of crm_user_category
-- ----------------------------
INSERT INTO `crm_user_category` VALUES ('1', '管理员', '');
INSERT INTO `crm_user_category` VALUES ('2', '员工', '');

-- ----------------------------
-- Table structure for `crm_user_smtp`
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_smtp`;
CREATE TABLE `crm_user_smtp` (
  `smtp_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '发件箱名称',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `settinginfo` text NOT NULL COMMENT 'smtp设置',
  PRIMARY KEY (`smtp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='smtp设置表';

-- ----------------------------
-- Records of crm_user_smtp
-- ----------------------------

-- ----------------------------
-- Table structure for `quartz_config`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_config`;
CREATE TABLE `quartz_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(1024) DEFAULT NULL,
  `name` varchar(512) DEFAULT NULL,
  `cron` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `msg` varchar(1024) DEFAULT NULL,
  `quartz_class` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quartz_config
-- ----------------------------
INSERT INTO `quartz_config` VALUES ('1', 'test', 'test1', '*/15 * * * * ?', '1', '爬取黄页客户信息', 'com.inyu.quartz.ScheduleTask1');
INSERT INTO `quartz_config` VALUES ('2', 'test', 'test2', '*/30 * * * * ?', '1', '爬取代理ip信息', 'com.inyu.quartz.ScheduleTask2');

-- ----------------------------
-- Table structure for `quartz_proxy`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_proxy`;
CREATE TABLE `quartz_proxy` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `ip` varchar(1024) NOT NULL,
  `port` varchar(20) NOT NULL COMMENT '端口',
  `status` int(1) DEFAULT '1' COMMENT '状态：0-yes  1-nol',
  `location` varchar(1024) DEFAULT NULL COMMENT '位置',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `spread` float(12,3) DEFAULT NULL COMMENT '响应速度',
  `last_validate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2232 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quartz_proxy
-- ----------------------------
INSERT INTO `quartz_proxy` VALUES ('1', '117.90.252.92', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2', '121.232.144.235', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('3', '115.211.43.4', '9000', '1', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('4', '121.232.145.202', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('5', '180.118.247.44', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('6', '171.37.156.210', '8123', '1', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('7', '115.223.201.228', '9000', '1', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('8', '115.223.200.241', '9000', '1', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('9', '115.223.216.170', '9000', '1', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('10', '117.90.252.92', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('11', '121.232.144.235', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('12', '117.90.252.92', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('13', '121.232.144.235', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('14', '117.90.3.242', '9000', '1', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('15', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('16', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('17', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('18', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('19', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('20', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('21', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('22', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('23', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('24', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('25', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('26', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('27', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('28', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('29', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('30', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('31', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('32', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('33', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('34', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('35', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('36', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('37', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('38', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('39', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('40', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('41', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('42', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('43', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('44', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('45', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('46', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('47', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('48', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('49', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('50', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('51', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('52', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('53', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('54', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('55', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('56', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('57', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('58', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('59', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('60', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('61', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('62', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('63', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('64', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('65', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('66', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('67', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('68', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('69', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('70', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('71', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('72', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('73', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('74', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('75', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('76', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('77', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('78', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('79', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('80', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('81', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('82', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('83', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('84', '115.218.220.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('85', '183.147.223.111', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('86', '122.243.12.160', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('87', '122.243.12.160', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('88', '180.104.62.142', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('89', '115.218.219.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('90', '60.182.16.75', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('91', '115.223.238.186', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('92', '115.218.127.62', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('93', '118.122.187.184', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('94', '115.223.250.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('95', '115.223.221.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('96', '115.223.204.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('97', '115.223.249.14', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('98', '115.218.123.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('99', '115.218.126.138', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('100', '122.242.133.59', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('101', '121.232.147.180', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('102', '115.223.230.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('103', '115.210.26.130', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('104', '115.218.124.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('105', '101.71.227.30', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('106', '101.71.232.137', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('107', '115.218.121.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('108', '115.223.214.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('109', '115.218.120.10', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('110', '115.46.65.158', '8123', '0', '广西壮族自治区北海市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('111', '115.223.200.59', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('112', '182.129.240.168', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('113', '117.87.178.53', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('114', '180.104.62.86', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('115', '115.223.199.85', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('116', '115.218.125.51', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('117', '115.218.123.38', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('118', '59.38.241.13', '3128', '0', '中国 广东 惠州 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('119', '115.223.234.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('120', '171.215.226.251', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('121', '115.223.245.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('122', '114.227.120.30', '9000', '0', '中国 江苏 常州 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('123', '115.218.124.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('124', '115.223.230.16', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('125', '115.223.211.3', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('126', '115.223.202.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('127', '115.223.244.158', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('128', '115.216.37.5', '9000', '0', '浙江省宁波市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('129', '180.118.92.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('130', '115.218.124.13', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('131', '118.117.138.121', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('132', '101.68.48.236', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('133', '121.232.146.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('134', '115.223.201.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('135', '115.218.121.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('136', '115.218.127.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('137', '125.122.149.180', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('138', '114.234.81.100', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('139', '115.218.125.128', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('140', '183.147.223.93', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('141', '115.218.124.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('142', '121.232.144.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('143', '115.218.127.137', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('144', '171.92.52.131', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('145', '218.88.236.3', '9000', '0', '四川省广安市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('146', '115.218.127.160', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('147', '183.154.243.100', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('148', '115.218.122.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('149', '101.71.239.86', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('150', '60.214.154.2', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('151', '121.232.144.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('152', '121.232.146.113', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('153', '115.223.204.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('154', '180.104.63.111', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('155', '101.68.49.76', '9000', '0', '中国 浙江省 杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('156', '115.218.217.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('157', '115.218.123.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('158', '115.218.123.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('159', '118.178.227.171', '80', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('160', '115.218.125.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('161', '58.87.87.142', '80', '0', '中国 天津市 天津市 腾讯网络', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('162', '115.218.219.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('163', '115.218.223.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('164', '115.223.235.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('165', '115.210.28.102', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('166', '183.158.204.84', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('167', '115.223.232.103', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('168', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('169', '115.223.201.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('170', '222.73.68.144', '8090', '0', '中国 上海市 上海市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('171', '115.196.50.111', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('172', '125.122.148.199', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('173', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('174', '101.71.236.114', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('175', '182.107.12.73', '9000', '0', '中国 江西省 抚州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('176', '223.223.187.195', '80', '0', '中国 北京市 北京市', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('177', '115.223.251.87', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('178', '115.218.220.4', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('179', '115.218.122.118', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('180', '115.223.232.202', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('181', '121.232.147.48', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('182', '183.147.31.53', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('183', '114.234.80.51', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('184', '171.92.53.54', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('185', '115.223.202.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('186', '115.223.196.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('187', '180.118.128.146', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('188', '114.235.22.133', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('189', '115.218.120.111', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('190', '115.223.230.130', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('191', '115.223.219.149', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('192', '121.232.148.222', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('193', '125.122.151.239', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('194', '124.42.7.103', '80', '0', '中国 北京市 北京市 光环新网', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('195', '180.118.86.115', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('196', '180.104.63.191', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('197', '115.223.253.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('198', '114.235.22.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('199', '115.223.207.198', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('200', '121.232.144.150', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('201', '121.10.1.179', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('202', '60.184.207.44', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('203', '115.223.246.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('204', '115.223.235.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('205', '121.232.145.1', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('206', '115.218.120.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('207', '115.223.207.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('208', '61.145.194.26', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('209', '182.87.143.30', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('210', '118.117.136.151', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('211', '115.218.123.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('212', '115.218.126.83', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('213', '114.234.82.114', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('214', '115.223.194.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('215', '115.223.244.205', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('216', '182.105.10.247', '9000', '0', '江西省南昌市 CDMA全省共用出口 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('217', '49.70.209.30', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('218', '115.223.244.188', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('219', '183.154.243.13', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('220', '115.223.195.234', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('221', '121.232.145.67', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('222', '115.218.124.182', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('223', '115.218.120.88', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('224', '218.65.68.144', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('225', '115.223.193.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('226', '121.232.147.64', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('227', '125.122.148.5', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('228', '180.118.134.107', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('229', '182.88.191.254', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('230', '115.218.122.3', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('231', '115.223.242.174', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('232', '121.232.144.251', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('233', '115.218.221.233', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('234', '180.118.86.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('235', '180.118.86.12', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('236', '180.118.73.226', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('237', '115.223.227.32', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('238', '180.118.73.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('239', '115.218.126.18', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('240', '115.223.246.6', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('241', '121.232.147.90', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('242', '115.223.230.145', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('243', '121.232.146.200', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('244', '115.223.194.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('245', '123.55.190.227', '808', '0', '中国 河南省 三门峡市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('246', '115.223.222.207', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('247', '115.223.227.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('248', '180.118.135.143', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('249', '121.232.147.229', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('250', '115.218.121.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('251', '180.118.33.231', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('252', '115.196.53.247', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('253', '115.223.224.173', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('254', '115.218.223.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('255', '122.241.218.2', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('256', '121.232.144.96', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('257', '182.87.142.186', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('258', '115.218.220.234', '9000', '0', '中国 浙江省 温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('259', '115.223.204.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('260', '115.218.124.188', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('261', '121.232.148.164', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('262', '115.218.121.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('263', '115.218.122.238', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('264', '112.95.24.252', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('265', '115.195.188.64', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('266', '125.122.149.73', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('267', '116.209.35.94', '9000', '0', '湖北省仙桃市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('268', '222.33.192.238', '8118', '0', '中国 辽宁省 阜新市 铁通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('269', '49.70.209.43', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('270', '115.223.213.210', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('271', '117.90.252.211', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('272', '115.223.222.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('273', '114.234.80.12', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('274', '115.218.121.138', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('275', '115.223.193.83', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('276', '115.218.120.115', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('277', '115.223.237.99', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('278', '163.125.223.91', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('279', '115.218.121.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('280', '115.223.232.196', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('281', '117.57.21.86', '808', '0', '中国 安徽省 铜陵市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('282', '115.223.251.92', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('283', '115.216.36.142', '9000', '0', '浙江省宁波市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('284', '115.218.223.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('285', '115.223.238.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('286', '115.223.201.149', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('287', '115.223.192.15', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('288', '115.223.193.126', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('289', '163.125.223.221', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('290', '110.73.51.119', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('291', '115.223.235.68', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('292', '183.147.16.109', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('293', '121.232.199.113', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('294', '115.223.225.98', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('295', '183.147.210.208', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('296', '115.218.127.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('297', '115.223.240.110', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('298', '115.210.28.18', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('299', '115.210.251.191', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('300', '121.232.144.187', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('301', '115.223.213.38', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('302', '115.223.202.194', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('303', '115.218.120.102', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('304', '121.10.1.180', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('305', '121.232.144.229', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('306', '114.234.83.134', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('307', '115.218.123.12', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('308', '122.243.11.138', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('309', '180.118.247.84', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('310', '180.118.86.240', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('311', '120.25.253.234', '8118', '0', '中国 广东省 深圳市 阿里云', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('312', '114.234.82.138', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('313', '182.141.47.48', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('314', '122.243.13.224', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('315', '115.223.216.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('316', '121.232.148.151', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('317', '115.223.206.250', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('318', '180.104.63.243', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('319', '115.218.125.68', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('320', '115.218.125.37', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('321', '115.218.124.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('322', '115.218.223.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('323', '115.223.215.251', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('324', '121.232.147.148', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('325', '115.223.249.140', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('326', '115.223.247.244', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('327', '115.223.240.33', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('328', '115.223.237.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('329', '117.90.137.66', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('330', '115.223.192.40', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('331', '183.147.30.185', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('332', '115.218.122.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('333', '114.235.23.154', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('334', '101.68.48.18', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('335', '115.223.205.206', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('336', '183.154.223.211', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('337', '115.223.198.116', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('338', '182.105.14.29', '9000', '0', '中国 江西省 萍乡市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('339', '115.218.121.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('340', '115.223.233.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('341', '115.223.203.175', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('342', '122.243.14.49', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('343', '115.223.203.107', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('344', '115.223.244.86', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('345', '115.223.248.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('346', '115.210.30.2', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('347', '115.223.246.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('348', '180.118.33.128', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('349', '121.232.145.157', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('350', '118.178.227.171', '80', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('351', '115.218.123.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('352', '115.218.120.197', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('353', '114.234.83.175', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('354', '115.223.212.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('355', '115.218.121.126', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('356', '119.5.1.25', '22', '0', '中国 四川省 南充市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('357', '58.217.14.128', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('358', '115.218.223.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('359', '114.234.82.73', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('360', '110.172.220.197', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('361', '121.232.145.25', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('362', '117.90.6.54', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('363', '115.223.215.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('364', '115.223.223.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('365', '117.90.3.97', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('366', '115.223.217.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('367', '115.223.206.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('368', '121.232.194.198', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('369', '101.68.48.29', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('370', '115.223.213.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('371', '171.37.163.74', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('372', '115.218.127.17', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('373', '115.223.214.182', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('374', '117.90.252.105', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('375', '115.211.44.198', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('376', '182.141.41.184', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('377', '121.232.199.4', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('378', '115.223.197.246', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('379', '101.68.8.59', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('380', '112.95.27.117', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('381', '114.234.80.166', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('382', '115.223.221.253', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('383', '115.223.198.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('384', '115.218.127.246', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('385', '114.234.81.15', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('386', '122.243.15.99', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('387', '49.70.209.158', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('388', '117.78.50.121', '8118', '0', '中国 北京市 北京市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('389', '125.117.112.120', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('390', '115.218.216.14', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('391', '115.223.214.55', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('392', '117.87.176.13', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('393', '112.95.26.178', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('394', '115.223.206.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('395', '180.104.63.247', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('396', '115.223.232.124', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('397', '60.214.155.243', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('398', '115.218.123.75', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('399', '180.118.247.136', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('400', '163.125.221.204', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('401', '115.223.232.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('402', '101.68.141.216', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('403', '115.223.205.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('404', '119.129.98.194', '9999', '0', '中国 广东省 广州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('405', '115.223.245.201', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('406', '115.218.120.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('407', '163.125.221.168', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('408', '121.232.147.119', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('409', '115.223.254.155', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('410', '115.46.66.209', '8123', '0', '广西壮族自治区北海市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('411', '101.71.226.68', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('412', '121.232.145.155', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('413', '180.118.128.120', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('414', '58.53.88.103', '9000', '0', '湖北省仙桃市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('415', '121.232.147.67', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('416', '115.223.202.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('417', '125.122.151.10', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('418', '163.125.220.166', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('419', '182.129.242.213', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('420', '115.223.202.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('421', '121.232.199.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('422', '180.118.32.159', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('423', '58.56.149.198', '53281', '0', '中国 山东省 青岛市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('424', '121.232.145.168', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('425', '115.218.123.61', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('426', '121.40.34.84', '8118', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('427', '115.223.238.202', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('428', '121.232.147.73', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('429', '182.141.42.227', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('430', '115.223.223.212', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('431', '115.223.195.132', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('432', '60.176.101.48', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('433', '180.104.62.117', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('434', '115.46.77.174', '8123', '0', '中国 广西壮族自治区 北海市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('435', '183.158.200.61', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('436', '182.141.45.135', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('437', '115.218.127.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('438', '180.118.86.86', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('439', '117.87.176.153', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('440', '121.232.199.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('441', '115.218.216.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('442', '115.218.126.117', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('443', '115.218.223.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('444', '115.223.232.235', '9000', '0', '中国 浙江省 温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('445', '115.223.241.112', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('446', '115.223.204.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('447', '121.232.145.11', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('448', '180.118.247.212', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('449', '27.220.124.253', '9000', '0', '山东省菏泽市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('450', '115.218.218.90', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('451', '115.223.222.181', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('452', '163.125.251.46', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('453', '163.125.251.183', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('454', '115.223.231.116', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('455', '121.232.148.214', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('456', '115.223.243.167', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('457', '117.87.178.216', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('458', '115.223.241.222', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('459', '183.147.208.189', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('460', '115.210.30.196', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('461', '115.213.224.19', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('462', '163.125.222.230', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('463', '163.125.221.17', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('464', '121.232.194.109', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('465', '115.223.228.232', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('466', '125.117.132.80', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('467', '115.210.250.54', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('468', '49.70.209.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('469', '117.90.252.137', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('470', '115.223.199.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('471', '115.223.210.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('472', '121.232.199.159', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('473', '180.121.129.132', '3128', '0', '中国 江苏省 南通市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('474', '121.232.146.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('475', '180.104.62.234', '9000', '0', '中国 江苏省 徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('476', '115.218.120.194', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('477', '180.118.32.17', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('478', '121.232.147.199', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('479', '183.158.206.176', '9000', '0', '浙江省杭州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('480', '115.223.251.198', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('481', '114.234.83.67', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('482', '115.223.219.240', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('483', '125.117.134.223', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('484', '121.232.147.189', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('485', '121.10.1.180', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('486', '115.223.253.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('487', '122.243.15.239', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('488', '115.223.192.98', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('489', '182.87.187.74', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('490', '180.118.128.248', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('491', '115.223.241.198', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('492', '121.232.147.197', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('493', '115.218.120.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('494', '115.223.208.245', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('495', '115.223.230.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('496', '115.218.122.130', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('497', '115.216.36.98', '9000', '0', '浙江省宁波市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('498', '115.223.229.99', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('499', '115.223.249.112', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('500', '118.255.252.11', '3128', '0', '中国 湖南省 郴州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('501', '117.87.176.121', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('502', '115.223.235.222', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('503', '171.92.53.59', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('504', '115.223.205.188', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('505', '115.223.217.124', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('506', '115.218.220.244', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('507', '101.71.234.143', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('508', '49.81.125.56', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('509', '115.218.122.232', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('510', '115.218.120.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('511', '115.223.233.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('512', '180.118.128.10', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('513', '220.184.35.234', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('514', '115.223.216.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('515', '180.118.73.207', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('516', '125.67.75.154', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('517', '115.223.199.96', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('518', '115.46.64.159', '9999', '0', '中国 广西壮族自治区 北海市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('519', '101.68.140.234', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('520', '121.232.145.55', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('521', '115.223.239.110', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('522', '115.223.237.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('523', '121.232.146.59', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('524', '114.234.80.122', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('525', '115.223.224.240', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('526', '125.69.28.236', '8118', '0', '中国 四川省 成都市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('527', '115.223.234.63', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('528', '115.223.228.88', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('529', '115.218.120.85', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('530', '180.104.62.202', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('531', '115.223.251.13', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('532', '180.119.65.123', '3128', '0', '中国 江苏省 扬州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('533', '180.118.247.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('534', '180.104.62.155', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('535', '115.196.49.30', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('536', '115.218.127.227', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('537', '182.105.15.104', '9000', '0', '江西省萍乡市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('538', '115.218.124.62', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('539', '115.223.219.230', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('540', '115.223.220.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('541', '115.223.211.186', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('542', '115.218.121.148', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('543', '117.90.137.208', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('544', '115.223.198.130', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('545', '115.223.236.176', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('546', '114.234.83.110', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('547', '115.223.250.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('548', '115.218.124.239', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('549', '117.87.176.140', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('550', '60.184.201.172', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('551', '115.223.216.62', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('552', '180.118.33.123', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('553', '124.90.109.6', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('554', '115.218.121.20', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('555', '115.223.204.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('556', '115.218.124.252', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('557', '180.118.86.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('558', '115.218.120.21', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('559', '180.104.62.84', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('560', '115.223.234.20', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('561', '182.105.10.4', '9000', '0', '江西省南昌市 CDMA全省共用出口 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('562', '114.230.41.178', '3128', '0', '中国 江苏省 扬州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('563', '121.232.145.3', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('564', '115.223.235.223', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('565', '183.158.225.169', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('566', '115.218.121.117', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('567', '180.118.73.90', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('568', '115.223.208.192', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('569', '115.223.222.192', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('570', '115.218.222.206', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('571', '117.90.3.126', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('572', '115.223.244.179', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('573', '115.223.250.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('574', '117.90.4.48', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('575', '115.218.223.107', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('576', '114.234.81.18', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('577', '115.218.120.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('578', '115.223.200.195', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('579', '114.234.80.116', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('580', '117.90.7.37', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('581', '180.118.33.254', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('582', '221.229.18.162', '3128', '0', '中国 江苏省 扬州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('583', '115.223.248.30', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('584', '115.223.247.6', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('585', '114.235.22.244', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('586', '115.218.120.192', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('587', '115.223.246.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('588', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('589', '117.90.252.207', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('590', '115.223.215.182', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('591', '115.218.123.37', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('592', '115.223.213.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('593', '115.223.241.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('594', '180.118.73.175', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('595', '117.87.177.16', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('596', '115.193.98.77', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('597', '121.232.144.88', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('598', '117.90.1.162', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('599', '115.193.98.250', '9000', '0', '浙江省杭州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('600', '121.232.146.177', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('601', '115.218.127.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('602', '115.218.221.150', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('603', '180.118.32.75', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('604', '121.232.147.150', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('605', '115.223.251.25', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('606', '125.112.145.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('607', '115.218.216.123', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('608', '115.223.241.168', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('609', '101.68.140.58', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('610', '115.213.233.150', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('611', '115.218.223.128', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('612', '119.5.1.8', '22', '0', '中国 四川省 南充市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('613', '115.196.52.168', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('614', '120.25.253.234', '8118', '0', '中国 广东省 深圳市 阿里云', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('615', '115.218.217.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('616', '121.232.147.114', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('617', '115.223.253.96', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('618', '121.225.24.205', '3128', '0', '中国 江苏省 南京市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('619', '125.67.72.193', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('620', '115.223.249.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('621', '182.92.156.85', '8118', '0', '中国 北京市 北京市 阿里云', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('622', '115.218.220.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('623', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('624', '115.218.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('625', '180.118.128.32', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('626', '117.87.177.110', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('627', '117.90.252.224', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('628', '118.117.136.188', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('629', '124.160.250.49', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('630', '115.218.221.200', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('631', '101.71.233.211', '9000', '0', '中国 浙江 杭州 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('632', '115.218.123.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('633', '115.223.221.164', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('634', '117.90.7.39', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('635', '121.232.147.156', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('636', '115.223.193.145', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('637', '117.90.0.115', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('638', '219.216.106.172', '808', '0', '中国 辽宁省 沈阳市 教育网', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('639', '115.223.198.53', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('640', '115.218.123.172', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('641', '115.223.236.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('642', '115.223.228.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('643', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('644', '115.218.121.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('645', '101.71.225.172', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('646', '115.223.199.134', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('647', '163.125.251.203', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('648', '117.90.1.193', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('649', '125.119.218.94', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('650', '115.223.216.153', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('651', '121.232.199.101', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('652', '115.223.253.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('653', '115.223.215.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('654', '111.74.56.248', '9000', '0', '江西省赣州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('655', '117.87.178.134', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('656', '115.210.25.250', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('657', '117.90.6.140', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('658', '180.118.33.3', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('659', '121.232.148.109', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('660', '115.223.237.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('661', '59.32.37.244', '3128', '0', '中国 广东省 河源市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('662', '180.118.32.179', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('663', '115.218.124.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('664', '115.218.127.35', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('665', '111.74.56.249', '9000', '0', '江西省赣州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('666', '115.223.216.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('667', '115.223.227.252', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('668', '117.90.6.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('669', '115.223.254.204', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('670', '58.217.14.139', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('671', '115.223.221.118', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('672', '114.235.23.157', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('673', '115.223.204.134', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('674', '117.90.4.198', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('675', '39.81.56.106', '9000', '0', '中国 山东省 菏泽市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('676', '115.218.124.207', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('677', '115.223.224.172', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('678', '180.118.33.180', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('679', '115.223.225.110', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('680', '115.223.221.20', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('681', '121.232.148.191', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('682', '115.223.242.128', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('683', '117.87.177.5', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('684', '101.68.140.48', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('685', '115.223.213.94', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('686', '60.214.155.243', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('687', '121.232.146.162', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('688', '115.223.247.244', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('689', '115.218.124.67', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('690', '121.232.148.217', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('691', '115.223.238.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('692', '114.235.22.249', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('693', '182.141.45.10', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('694', '114.234.80.144', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('695', '123.131.6.197', '9000', '0', '山东省潍坊市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('696', '115.223.215.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('697', '121.232.146.95', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('698', '115.218.216.136', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('699', '117.90.252.16', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('700', '117.90.5.239', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('701', '115.218.126.116', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('702', '115.223.198.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('703', '115.223.250.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('704', '115.223.249.190', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('705', '115.223.248.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('706', '117.87.176.233', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('707', '114.234.83.123', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('708', '122.237.250.60', '9000', '0', '中国 浙江省 绍兴市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('709', '115.223.211.222', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('710', '115.223.216.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('711', '117.90.4.106', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('712', '121.231.226.177', '6666', '0', '中国 江苏省 常州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('713', '115.218.121.97', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('714', '115.218.217.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('715', '117.90.137.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('716', '115.223.238.230', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('717', '115.223.254.232', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('718', '115.218.125.6', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('719', '115.223.232.4', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('720', '115.223.251.67', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('721', '182.141.46.213', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('722', '115.223.223.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('723', '121.232.144.58', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('724', '115.218.120.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('725', '101.68.49.4', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('726', '117.90.7.171', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('727', '182.141.47.82', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('728', '180.104.62.254', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('729', '121.232.146.98', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('730', '115.218.127.18', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('731', '114.234.81.63', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('732', '115.223.239.110', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('733', '115.223.243.136', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('734', '117.90.2.58', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('735', '115.218.127.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('736', '180.118.134.219', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('737', '115.218.124.134', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('738', '114.234.83.233', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('739', '115.218.218.137', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('740', '123.163.21.137', '808', '0', '中国 河南省 洛阳市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('741', '115.218.120.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('742', '180.118.86.127', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('743', '115.223.247.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('744', '182.141.40.26', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('745', '115.223.249.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('746', '180.104.62.196', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('747', '115.223.196.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('748', '117.90.1.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('749', '115.223.193.50', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('750', '115.218.127.171', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('751', '115.218.126.204', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('752', '115.223.218.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('753', '115.223.216.32', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('754', '115.223.206.24', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('755', '115.218.122.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('756', '121.232.147.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('757', '115.218.120.16', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('758', '122.243.8.183', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('759', '115.223.240.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('760', '115.218.125.225', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('761', '121.232.194.251', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('762', '121.232.147.52', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('763', '115.223.218.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('764', '117.87.178.213', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('765', '115.218.120.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('766', '115.223.252.76', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('767', '117.90.7.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('768', '121.232.148.82', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('769', '115.223.226.154', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('770', '121.232.146.142', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('771', '101.68.9.236', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('772', '115.223.222.176', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('773', '115.218.126.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('774', '180.118.92.174', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('775', '114.234.82.12', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('776', '117.90.1.211', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('777', '115.223.196.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('778', '114.235.23.54', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('779', '121.232.144.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('780', '182.106.193.47', '9000', '0', '江西省南昌市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('781', '115.223.203.193', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('782', '115.223.254.168', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('783', '115.218.126.214', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('784', '115.218.125.157', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('785', '121.232.147.74', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('786', '115.223.200.89', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('787', '121.232.145.183', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('788', '116.210.20.128', '9000', '0', '湖北省仙桃市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('789', '115.218.126.200', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('790', '115.218.216.207', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('791', '115.218.125.49', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('792', '121.232.148.85', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('793', '115.223.235.157', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('794', '117.90.6.11', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('795', '115.223.241.99', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('796', '117.90.4.155', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('797', '121.232.147.136', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('798', '121.232.146.4', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('799', '115.218.122.31', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('800', '121.232.144.69', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('801', '117.90.2.206', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('802', '115.196.51.28', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('803', '115.223.249.245', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('804', '115.223.201.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('805', '121.232.145.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('806', '121.232.147.88', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('807', '115.212.161.62', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('808', '115.196.55.4', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('809', '115.223.200.85', '9000', '0', '中国 浙江省 温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('810', '183.158.204.56', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('811', '163.125.235.127', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('812', '115.193.103.30', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('813', '115.196.51.103', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('814', '117.90.1.90', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('815', '49.81.125.169', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('816', '115.223.223.25', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('817', '114.234.81.33', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('818', '60.189.155.118', '9000', '0', '中国 浙江省 台州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('819', '121.232.144.20', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('820', '115.223.192.12', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('821', '114.234.82.148', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('822', '118.117.136.55', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('823', '115.218.217.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('824', '180.104.62.16', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('825', '115.218.223.173', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('826', '125.67.72.97', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('827', '115.223.254.92', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('828', '115.223.253.26', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('829', '115.218.123.255', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('830', '49.71.81.20', '3128', '0', '中国 江苏省 扬州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('831', '115.218.125.173', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('832', '171.92.53.21', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('833', '117.90.6.206', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('834', '119.5.1.36', '22', '0', '中国 四川省 南充市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('835', '117.87.178.156', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('836', '49.81.125.167', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('837', '101.71.226.135', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('838', '117.90.6.110', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('839', '122.242.81.166', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('840', '115.223.215.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('841', '117.90.1.7', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('842', '115.223.252.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('843', '114.234.83.45', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('844', '115.223.206.162', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('845', '180.118.134.116', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('846', '115.223.235.245', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('847', '115.223.219.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('848', '115.218.122.176', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('849', '117.90.6.35', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('850', '121.232.146.205', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('851', '60.214.155.243', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('852', '125.122.151.236', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('853', '117.90.1.229', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('854', '117.90.5.43', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('855', '180.118.128.237', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('856', '115.223.241.157', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('857', '101.68.49.208', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('858', '115.223.231.148', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('859', '125.107.235.82', '9000', '0', '中国 浙江省 绍兴市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('860', '115.193.98.246', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('861', '117.90.2.102', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('862', '115.223.226.86', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('863', '117.90.4.161', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('864', '117.90.3.110', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('865', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('866', '180.104.62.188', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('867', '125.122.148.32', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('868', '180.104.62.13', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('869', '115.218.122.132', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('870', '115.223.234.20', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('871', '121.232.146.54', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('872', '117.87.178.250', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('873', '115.223.239.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('874', '115.218.125.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('875', '115.223.221.84', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('876', '121.232.194.201', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('877', '115.218.223.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('878', '115.218.223.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('879', '115.223.248.245', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('880', '220.184.33.129', '9000', '0', '中国 浙江 杭州 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('881', '115.223.213.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('882', '115.223.197.57', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('883', '180.118.73.103', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('884', '117.90.137.67', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('885', '125.122.148.116', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('886', '117.90.6.221', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('887', '117.90.4.155', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('888', '115.218.126.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('889', '115.223.206.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('890', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('891', '171.215.192.206', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('892', '115.223.212.163', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('893', '115.223.204.92', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('894', '115.223.253.209', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('895', '115.218.124.72', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('896', '117.90.6.244', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('897', '114.235.23.30', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('898', '117.90.2.79', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('899', '121.232.144.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('900', '115.223.220.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('901', '117.87.179.4', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('902', '180.118.247.203', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('903', '115.223.208.33', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('904', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('905', '220.184.33.142', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('906', '121.232.148.82', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('907', '221.229.18.49', '3128', '0', '中国 江苏省 扬州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('908', '115.218.216.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('909', '115.223.231.6', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('910', '117.90.3.136', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('911', '121.232.147.149', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('912', '121.232.147.241', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('913', '115.218.127.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('914', '119.5.1.57', '22', '0', '中国 四川省 南充市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('915', '115.218.120.157', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('916', '117.90.252.77', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('917', '115.218.126.140', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('918', '115.218.127.197', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('919', '115.223.199.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('920', '115.210.29.116', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('921', '115.223.254.237', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('922', '115.223.254.126', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('923', '121.232.147.146', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('924', '115.218.123.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('925', '117.90.137.254', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('926', '115.218.217.183', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('927', '121.232.144.70', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('928', '101.71.232.140', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('929', '115.223.226.50', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('930', '115.223.227.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('931', '115.223.247.181', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('932', '121.232.146.165', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('933', '125.122.150.206', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('934', '115.218.208.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('935', '121.232.148.45', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('936', '115.223.211.24', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('937', '222.214.248.248', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('938', '180.104.62.123', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('939', '115.223.213.32', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('940', '115.223.255.209', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('941', '121.232.194.188', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('942', '115.218.223.32', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('943', '114.234.82.190', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.700', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('944', '121.232.146.169', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('945', '115.223.249.231', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('946', '115.223.212.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('947', '180.118.135.197', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('948', '115.218.125.248', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('949', '115.218.222.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('950', '115.223.204.199', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('951', '117.90.1.19', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('952', '115.223.237.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('953', '115.223.249.15', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('954', '115.218.120.238', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('955', '115.223.200.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('956', '115.223.216.186', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-14 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('957', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('958', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('959', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('960', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('961', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('962', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('963', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('964', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('965', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('966', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('967', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('968', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('969', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('970', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('971', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('972', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('973', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('974', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('975', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('976', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('977', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('978', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('979', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('980', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('981', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('982', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('983', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('984', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('985', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('986', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('987', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('988', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('989', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('990', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('991', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('992', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('993', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('994', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('995', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('996', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('997', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('998', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('999', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1000', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1001', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-15 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1002', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1003', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1004', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1005', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1006', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1007', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1008', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1009', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1010', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1011', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1012', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1013', '101.68.8.181', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1014', '121.232.148.220', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1015', '115.218.219.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1016', '115.223.203.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1017', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1018', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1019', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1020', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1021', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1022', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1023', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1024', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1025', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1026', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1027', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1028', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1029', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1030', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1031', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1032', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1033', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1034', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1035', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1036', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1037', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1038', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1039', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1040', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1041', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1042', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1043', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1044', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1045', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1046', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1047', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1048', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1049', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1050', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1051', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1052', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1053', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1054', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1055', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1056', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1057', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1058', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1059', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1060', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1061', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1062', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1063', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1064', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1065', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1066', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1067', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1068', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1069', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1070', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1071', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1072', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1073', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1074', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1075', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1076', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1077', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1078', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1079', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1080', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1081', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1082', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1083', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1084', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1085', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1086', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1087', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1088', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1089', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1090', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1091', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1092', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1093', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1094', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1095', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1096', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1097', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1098', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1099', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1100', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1101', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1102', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1103', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1104', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1105', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1106', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1107', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1108', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1109', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1110', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1111', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1112', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1113', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1114', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1115', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1116', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1117', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1118', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1119', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1120', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1121', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1122', '115.218.220.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1123', '183.147.223.111', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1124', '122.243.12.160', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1125', '180.104.62.142', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1126', '115.218.219.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1127', '60.182.16.75', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1128', '115.223.238.186', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1129', '115.218.127.62', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1130', '118.122.187.184', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1131', '115.223.250.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1132', '115.223.221.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1133', '115.223.204.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1134', '115.223.249.14', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1135', '115.218.123.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1136', '115.218.126.138', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1137', '122.242.133.59', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1138', '121.232.147.180', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1139', '115.223.230.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1140', '115.210.26.130', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1141', '115.218.124.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1142', '101.71.227.30', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1143', '101.71.232.137', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1144', '115.218.121.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1145', '115.223.214.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1146', '115.218.120.10', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1147', '115.46.65.158', '8123', '0', '广西壮族自治区北海市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1148', '115.223.200.59', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1149', '182.129.240.168', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1150', '117.87.178.53', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1151', '180.104.62.86', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1152', '115.223.199.85', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1153', '115.218.125.51', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1154', '115.218.123.38', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1155', '59.38.241.13', '3128', '0', '中国 广东 惠州 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1156', '115.223.234.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1157', '171.215.226.251', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1158', '115.223.245.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1159', '114.227.120.30', '9000', '0', '中国 江苏 常州 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1160', '115.218.124.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1161', '115.223.230.16', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1162', '115.223.211.3', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1163', '115.223.202.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1164', '115.223.244.158', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1165', '115.216.37.5', '9000', '0', '浙江省宁波市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1166', '180.118.92.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1167', '115.218.124.13', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1168', '118.117.138.121', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1169', '101.68.48.236', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1170', '121.232.146.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1171', '115.223.201.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1172', '115.218.121.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1173', '115.218.127.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1174', '125.122.149.180', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1175', '114.234.81.100', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1176', '115.218.125.128', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1177', '183.147.223.93', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1178', '115.218.124.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1179', '121.232.144.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1180', '115.218.127.137', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1181', '171.92.52.131', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1182', '218.88.236.3', '9000', '0', '四川省广安市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1183', '115.218.127.160', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1184', '183.154.243.100', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1185', '115.218.122.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1186', '101.71.239.86', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1187', '60.214.154.2', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1188', '121.232.144.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1189', '121.232.146.113', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1190', '115.223.204.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1191', '180.104.63.111', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1192', '101.68.49.76', '9000', '0', '中国 浙江省 杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1193', '115.218.217.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1194', '115.218.123.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1195', '115.218.123.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1196', '118.178.227.171', '80', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1197', '115.218.125.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1198', '58.87.87.142', '80', '0', '中国 天津市 天津市 腾讯网络', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1199', '115.218.219.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1200', '115.218.223.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1201', '115.223.235.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1202', '115.210.28.102', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1203', '183.158.204.84', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1204', '115.223.232.103', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1205', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1206', '115.223.201.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1207', '222.73.68.144', '8090', '0', '中国 上海市 上海市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1208', '115.196.50.111', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1209', '125.122.148.199', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1210', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1211', '101.71.236.114', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1212', '182.107.12.73', '9000', '0', '中国 江西省 抚州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1213', '223.223.187.195', '80', '0', '中国 北京市 北京市', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1214', '115.223.251.87', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1215', '115.218.220.4', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1216', '115.218.122.118', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1217', '115.223.232.202', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1218', '121.232.147.48', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1219', '183.147.31.53', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1220', '114.234.80.51', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1221', '171.92.53.54', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1222', '115.223.202.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1223', '115.223.196.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1224', '180.118.128.146', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1225', '114.235.22.133', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1226', '115.218.120.111', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1227', '115.223.230.130', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1228', '115.223.219.149', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1229', '121.232.148.222', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1230', '125.122.151.239', '9000', '0', '浙江省杭州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1231', '124.42.7.103', '80', '0', '中国 北京市 北京市 光环新网', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1232', '180.118.86.115', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1233', '180.104.63.191', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1234', '115.223.253.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1235', '114.235.22.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1236', '115.223.207.198', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1237', '121.232.144.150', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1238', '121.10.1.179', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1239', '60.184.207.44', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1240', '115.223.246.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1241', '115.223.235.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1242', '121.232.145.1', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1243', '115.218.120.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1244', '115.223.207.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1245', '61.145.194.26', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1246', '182.87.143.30', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1247', '118.117.136.151', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1248', '115.218.123.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1249', '115.218.126.83', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1250', '114.234.82.114', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1251', '115.223.194.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1252', '115.223.244.205', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1253', '182.105.10.247', '9000', '0', '江西省南昌市 CDMA全省共用出口 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1254', '49.70.209.30', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1255', '115.223.244.188', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1256', '183.154.243.13', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1257', '115.223.195.234', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1258', '121.232.145.67', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1259', '115.218.124.182', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1260', '115.218.120.88', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1261', '218.65.68.144', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1262', '115.223.193.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1263', '121.232.147.64', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1264', '125.122.148.5', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1265', '180.118.134.107', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1266', '182.88.191.254', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1267', '115.218.122.3', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1268', '115.223.242.174', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1269', '121.232.144.251', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1270', '115.218.221.233', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1271', '180.118.86.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1272', '180.118.86.12', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1273', '180.118.73.226', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1274', '115.223.227.32', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1275', '180.118.73.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1276', '115.218.126.18', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1277', '115.223.246.6', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1278', '121.232.147.90', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1279', '115.223.230.145', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1280', '121.232.146.200', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1281', '115.223.194.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1282', '123.55.190.227', '808', '0', '中国 河南省 三门峡市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1283', '115.223.222.207', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1284', '115.223.227.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1285', '180.118.135.143', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1286', '121.232.147.229', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1287', '115.218.121.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1288', '180.118.33.231', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1289', '115.196.53.247', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1290', '115.223.224.173', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1291', '115.218.223.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1292', '122.241.218.2', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1293', '121.232.144.96', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1294', '182.87.142.186', '9000', '0', '江西省萍乡市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1295', '115.218.220.234', '9000', '0', '中国 浙江省 温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1296', '115.223.204.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1297', '115.218.124.188', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1298', '121.232.148.164', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1299', '115.218.121.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1300', '115.218.122.238', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1301', '112.95.24.252', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1302', '115.195.188.64', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1303', '125.122.149.73', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1304', '116.209.35.94', '9000', '0', '湖北省仙桃市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1305', '222.33.192.238', '8118', '0', '中国 辽宁省 阜新市 铁通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1306', '49.70.209.43', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1307', '115.223.213.210', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1308', '117.90.252.211', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1309', '115.223.222.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1310', '114.234.80.12', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1311', '115.218.121.138', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1312', '115.223.193.83', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1313', '115.218.120.115', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1314', '115.223.237.99', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1315', '163.125.223.91', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1316', '115.218.121.242', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1317', '115.223.232.196', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1318', '117.57.21.86', '808', '0', '中国 安徽省 铜陵市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1319', '115.223.251.92', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1320', '115.216.36.142', '9000', '0', '浙江省宁波市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1321', '115.218.223.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1322', '115.223.238.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1323', '115.223.201.149', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1324', '115.223.192.15', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1325', '115.223.193.126', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1326', '163.125.223.221', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1327', '110.73.51.119', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1328', '115.223.235.68', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1329', '183.147.16.109', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1330', '121.232.199.113', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1331', '115.223.225.98', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1332', '183.147.210.208', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1333', '115.218.127.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1334', '115.223.240.110', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1335', '115.210.28.18', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1336', '115.210.251.191', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1337', '121.232.144.187', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1338', '115.223.213.38', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1339', '115.223.202.194', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1340', '115.218.120.102', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1341', '121.10.1.180', '8080', '0', '中国 广东省 东莞市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1342', '121.232.144.229', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1343', '114.234.83.134', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1344', '115.218.123.12', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1345', '122.243.11.138', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1346', '180.118.247.84', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1347', '180.118.86.240', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1348', '120.25.253.234', '8118', '0', '中国 广东省 深圳市 阿里云', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1349', '114.234.82.138', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1350', '182.141.47.48', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1351', '122.243.13.224', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1352', '115.223.216.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1353', '121.232.148.151', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1354', '115.223.206.250', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1355', '180.104.63.243', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1356', '115.218.125.68', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1357', '115.218.125.37', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1358', '115.218.124.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1359', '115.218.223.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1360', '115.223.215.251', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1361', '121.232.147.148', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1362', '115.223.249.140', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1363', '115.223.247.244', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1364', '115.223.240.33', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1365', '115.223.237.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1366', '117.90.137.66', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1367', '115.223.192.40', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1368', '183.147.30.185', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1369', '115.218.122.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1370', '114.235.23.154', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1371', '101.68.48.18', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1372', '115.223.205.206', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1373', '183.154.223.211', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1374', '115.223.198.116', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1375', '182.105.14.29', '9000', '0', '中国 江西省 萍乡市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1376', '115.218.121.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1377', '115.223.233.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1378', '115.223.203.175', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1379', '122.243.14.49', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1380', '115.223.203.107', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1381', '115.223.244.86', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1382', '115.223.248.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1383', '115.210.30.2', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1384', '115.223.246.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1385', '180.118.33.128', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1386', '121.232.145.157', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1387', '118.178.227.171', '80', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1388', '115.218.123.101', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1389', '115.218.120.197', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1390', '114.234.83.175', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1391', '115.223.212.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1392', '115.218.121.126', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1393', '119.5.1.25', '22', '0', '中国 四川省 南充市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1394', '58.217.14.128', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1395', '115.218.223.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1396', '114.234.82.73', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1397', '110.172.220.197', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1398', '121.232.145.25', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1399', '117.90.6.54', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1400', '115.223.215.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1401', '115.223.223.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1402', '117.90.3.97', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1403', '115.223.217.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1404', '115.223.206.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1405', '121.232.194.198', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1406', '101.68.48.29', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1407', '115.223.213.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1408', '171.37.163.74', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1409', '115.218.127.17', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1410', '115.223.214.182', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1411', '117.90.252.105', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1412', '115.211.44.198', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1413', '182.141.41.184', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1414', '121.232.199.4', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1415', '115.223.197.246', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1416', '101.68.8.59', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1417', '112.95.27.117', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1418', '114.234.80.166', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1419', '115.223.221.253', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1420', '115.223.198.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1421', '115.218.127.246', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1422', '114.234.81.15', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1423', '122.243.15.99', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1424', '49.70.209.158', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1425', '117.78.50.121', '8118', '0', '中国 北京市 北京市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1426', '125.117.112.120', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1427', '115.218.216.14', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1428', '115.223.214.55', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1429', '117.87.176.13', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1430', '112.95.26.178', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1431', '115.223.206.235', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1432', '180.104.63.247', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1433', '115.223.232.124', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1434', '60.214.155.243', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1435', '115.218.123.75', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1436', '180.118.247.136', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1437', '163.125.221.204', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1438', '115.223.232.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1439', '101.68.141.216', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1440', '115.223.205.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1441', '119.129.98.194', '9999', '0', '中国 广东省 广州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1442', '115.223.245.201', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1443', '115.218.120.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1444', '163.125.221.168', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1445', '121.232.147.119', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1446', '115.223.254.155', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1447', '115.46.66.209', '8123', '0', '广西壮族自治区北海市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1448', '101.71.226.68', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1449', '121.232.145.155', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1450', '180.118.128.120', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1451', '58.53.88.103', '9000', '0', '湖北省仙桃市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1452', '121.232.147.67', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1453', '115.223.202.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1454', '125.122.151.10', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1455', '163.125.220.166', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1456', '182.129.242.213', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1457', '115.223.202.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1458', '121.232.199.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1459', '180.118.32.159', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1460', '58.56.149.198', '53281', '0', '中国 山东省 青岛市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1461', '121.232.145.168', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1462', '115.218.123.61', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1463', '121.40.34.84', '8118', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1464', '115.223.238.202', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1465', '121.232.147.73', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1466', '182.141.42.227', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1467', '115.223.223.212', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1468', '115.223.195.132', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1469', '60.176.101.48', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1470', '180.104.62.117', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1471', '115.46.77.174', '8123', '0', '中国 广西壮族自治区 北海市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1472', '183.158.200.61', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1473', '182.141.45.135', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1474', '115.218.127.36', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1475', '180.118.86.86', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1476', '117.87.176.153', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1477', '121.232.199.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1478', '115.218.216.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1479', '115.218.126.117', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1480', '115.218.223.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1481', '115.223.232.235', '9000', '0', '中国 浙江省 温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1482', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1483', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1484', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1485', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1486', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1487', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1488', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1489', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1490', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1491', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1492', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1493', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1494', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1495', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1496', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1497', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1498', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1499', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1500', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1501', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1502', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1503', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1504', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1505', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1506', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1507', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1508', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1509', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1510', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1511', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1512', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1513', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1514', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1515', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1516', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1517', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1518', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1519', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1520', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1521', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1522', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1523', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1524', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1525', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1526', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1527', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1528', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1529', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1530', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1531', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1532', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1533', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1534', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1535', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1536', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1537', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1538', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1539', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1540', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1541', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1542', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1543', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1544', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1545', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1546', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1547', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1548', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1549', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1550', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1551', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1552', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1553', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1554', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1555', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1556', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1557', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1558', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1559', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1560', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1561', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1562', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1563', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1564', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1565', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1566', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1567', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1568', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1569', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1570', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1571', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1572', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1573', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1574', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1575', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1576', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1577', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1578', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1579', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1580', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1581', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1582', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1583', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1584', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1585', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1586', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1587', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1588', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1589', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1590', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1591', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1592', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1593', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1594', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1595', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1596', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1597', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1598', '101.68.8.181', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1599', '121.232.148.220', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1600', '115.218.219.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1601', '115.223.203.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1602', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1603', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1604', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1605', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1606', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1607', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1608', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1609', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1610', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1611', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1612', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1613', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1614', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1615', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1616', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1617', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1618', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1619', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1620', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1621', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1622', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1623', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1624', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1625', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1626', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1627', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1628', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1629', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1630', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1631', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1632', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1633', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1634', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1635', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1636', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1637', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1638', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1639', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1640', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1641', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1642', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1643', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1644', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1645', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1646', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1647', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1648', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1649', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1650', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1651', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1652', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1653', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1654', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1655', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1656', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1657', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1658', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1659', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1660', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1661', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1662', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1663', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1664', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1665', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1666', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1667', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1668', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1669', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1670', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1671', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1672', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1673', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1674', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1675', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1676', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1677', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1678', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1679', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1680', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1681', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1682', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1683', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1684', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1685', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1686', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1687', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1688', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1689', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1690', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1691', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1692', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1693', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1694', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1695', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1696', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1697', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1698', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1699', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1700', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1701', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1702', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1703', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1704', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1705', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1706', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1707', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1708', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1709', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1710', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1711', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1712', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1713', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1714', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1715', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1716', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1717', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1718', '101.68.8.181', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1719', '121.232.148.220', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1720', '115.218.219.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1721', '115.223.203.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1722', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1723', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1724', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1725', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1726', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1727', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1728', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1729', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1730', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1731', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1732', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1733', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1734', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1735', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1736', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1737', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1738', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1739', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1740', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1741', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1742', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1743', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1744', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1745', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1746', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1747', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1748', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1749', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1750', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1751', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1752', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1753', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1754', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1755', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1756', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1757', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1758', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1759', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1760', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1761', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1762', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1763', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1764', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1765', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1766', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1767', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1768', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1769', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1770', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1771', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1772', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1773', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1774', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1775', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1776', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1777', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1778', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1779', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1780', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1781', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1782', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1783', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1784', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1785', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1786', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1787', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1788', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1789', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1790', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1791', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1792', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1793', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1794', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1795', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1796', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1797', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1798', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1799', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1800', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1801', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1802', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1803', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1804', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1805', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1806', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1807', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1808', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1809', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1810', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1811', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1812', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1813', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1814', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1815', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1816', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1817', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1818', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1819', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1820', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1821', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1822', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1823', '101.68.8.181', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1824', '121.232.148.220', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1825', '115.218.219.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1826', '115.223.203.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1827', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1828', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1829', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1830', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1831', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1832', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1833', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1834', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1835', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1836', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1837', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1838', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1839', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1840', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1841', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1842', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1843', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1844', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1845', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1846', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1847', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1848', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1849', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1850', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1851', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1852', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1853', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1854', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1855', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1856', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1857', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1858', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1859', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1860', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1861', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1862', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1863', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1864', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1865', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1866', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1867', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1868', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1869', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1870', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1871', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1872', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1873', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1874', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1875', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1876', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1877', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1878', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1879', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1880', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1881', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1882', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1883', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1884', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1885', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1886', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1887', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1888', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1889', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1890', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1891', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1892', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1893', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1894', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1895', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1896', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1897', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1898', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1899', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1900', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1901', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1902', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1903', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1904', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1905', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1906', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1907', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1908', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1909', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1910', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1911', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1912', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1913', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1914', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1915', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1916', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1917', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1918', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1919', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1920', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1921', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1922', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1923', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1924', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1925', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1926', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1927', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1928', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1929', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1930', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1931', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1932', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1933', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1934', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1935', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1936', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1937', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1938', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1939', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1940', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1941', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1942', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1943', '101.68.8.181', '9000', '0', '浙江省杭州市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1944', '121.232.148.220', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1945', '115.218.219.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1946', '115.223.203.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1947', '221.4.133.67', '53281', '0', '中国 广东省 东莞市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1948', '121.232.145.144', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1949', '115.223.236.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1950', '163.125.249.87', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1951', '115.223.223.45', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1952', '121.232.194.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1953', '60.255.186.169', '8888', '0', '中国 四川省 成都市 四川广电', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1954', '121.232.146.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1955', '121.232.148.24', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1956', '117.90.7.172', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1957', '115.218.122.191', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1958', '121.232.144.34', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1959', '117.90.7.9', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1960', '117.90.137.89', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1961', '115.223.247.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1962', '117.87.178.27', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1963', '101.68.10.22', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1964', '171.37.162.65', '8123', '0', '中国 广西壮族自治区 南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1965', '117.87.178.25', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1966', '110.172.220.194', '8080', '0', '中国 北京市 北京市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1967', '115.218.126.156', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1968', '163.125.249.30', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1969', '125.117.135.169', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1970', '101.68.11.99', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1971', '115.213.230.70', '9000', '0', '浙江省丽水市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1972', '117.90.4.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1973', '115.211.35.82', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1974', '115.218.126.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1975', '163.125.249.96', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1976', '49.81.125.49', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1977', '180.118.33.5', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1978', '101.71.237.87', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1979', '115.223.253.11', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1980', '117.90.252.92', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1981', '121.232.144.235', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1982', '117.90.3.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1983', '124.160.250.27', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1984', '115.210.30.129', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1985', '121.232.146.253', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1986', '115.218.120.247', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1987', '117.90.4.223', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1988', '115.223.243.22', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1989', '220.184.36.176', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1990', '183.147.220.81', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1991', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1992', '115.223.241.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1993', '115.213.252.97', '9000', '0', '浙江省丽水市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1994', '121.232.147.104', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1995', '115.223.248.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1996', '115.218.127.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1997', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1998', '115.223.205.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('1999', '115.223.248.78', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2000', '27.220.127.134', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2001', '121.232.144.210', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2002', '115.223.236.254', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2003', '115.223.204.165', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2004', '111.155.116.239', '8123', '0', '中国 陕西省 铁通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2005', '115.218.127.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2006', '180.118.33.145', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2007', '115.218.123.66', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2008', '115.218.127.106', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2009', '115.223.205.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2010', '115.211.43.4', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2011', '121.232.145.202', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2012', '180.118.247.44', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2013', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2014', '115.223.254.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2015', '180.118.73.40', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2016', '115.218.124.109', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2017', '115.223.222.2', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2018', '115.213.251.253', '9000', '0', '浙江省丽水市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2019', '115.223.223.19', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2020', '115.223.250.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2021', '183.147.222.119', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2022', '183.154.212.165', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2023', '27.206.180.242', '9000', '0', '山东省菏泽市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2024', '115.218.124.113', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2025', '171.37.156.210', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2026', '115.223.201.228', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2027', '115.223.200.241', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2028', '115.223.216.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2029', '115.223.229.139', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2030', '121.232.147.91', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2031', '115.210.29.225', '9000', '0', '中国 浙江省 金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2032', '115.196.52.49', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2033', '163.125.222.105', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2034', '115.223.218.65', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2035', '115.223.237.159', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2036', '180.104.62.245', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2037', '115.223.217.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2038', '115.218.220.142', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2039', '115.218.120.74', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2040', '115.218.127.211', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2041', '115.223.250.108', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2042', '171.92.52.45', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.700', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2043', '183.147.222.213', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2044', '125.117.129.179', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2045', '182.129.241.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2046', '121.232.148.42', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2047', '180.104.63.60', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2048', '115.218.208.119', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2049', '115.218.126.177', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2050', '121.232.145.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2051', '115.223.247.104', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2052', '115.218.220.8', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2053', '183.147.223.111', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2054', '122.243.12.160', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2055', '180.104.62.142', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2056', '115.218.219.224', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2057', '60.182.16.75', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.300', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2058', '115.223.238.186', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2059', '115.218.127.62', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2060', '118.122.187.184', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2061', '115.223.250.79', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2062', '115.223.221.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2063', '115.223.204.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2064', '115.223.249.14', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2065', '115.218.123.64', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2066', '115.218.126.138', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2067', '122.242.133.59', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2068', '121.232.147.180', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2069', '115.223.230.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2070', '115.210.26.130', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2071', '115.218.124.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2072', '101.71.227.30', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2073', '101.71.232.137', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2074', '115.218.121.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2075', '115.223.214.218', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2076', '115.218.120.10', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2077', '115.46.65.158', '8123', '0', '广西壮族自治区北海市 联通', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2078', '115.223.200.59', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2079', '182.129.240.168', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2080', '117.87.178.53', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2081', '180.104.62.86', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2082', '115.223.199.85', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2083', '115.218.125.51', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2084', '115.218.123.38', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2085', '59.38.241.13', '3128', '0', '中国 广东 惠州 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2086', '115.223.234.105', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2087', '171.215.226.251', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2088', '115.223.245.56', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2089', '114.227.120.30', '9000', '0', '中国 江苏 常州 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2090', '115.218.124.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2091', '115.223.230.16', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2092', '115.223.211.3', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2093', '115.223.202.7', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2094', '115.223.244.158', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2095', '115.216.37.5', '9000', '0', '浙江省宁波市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2096', '180.118.92.76', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2097', '115.218.124.13', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2098', '118.117.138.121', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2099', '101.68.48.236', '9000', '0', '浙江省杭州市 联通', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2100', '121.232.146.61', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2101', '115.223.201.178', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2102', '115.218.121.23', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2103', '115.218.127.184', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2104', '125.122.149.180', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2105', '114.234.81.100', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2106', '115.218.125.128', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2107', '183.147.223.93', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2108', '115.218.124.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2109', '121.232.144.242', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2110', '115.218.127.137', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2111', '171.92.52.131', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2112', '218.88.236.3', '9000', '0', '四川省广安市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2113', '115.218.127.160', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2114', '183.154.243.100', '9000', '0', '浙江省金华市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2115', '115.218.122.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2116', '101.71.239.86', '9000', '0', '浙江省杭州市 联通', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2117', '60.214.154.2', '53281', '0', '中国 山东省 枣庄市 联通', 'HTTP', '0.800', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2118', '121.232.144.111', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2119', '121.232.146.113', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2120', '115.223.204.39', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2121', '180.104.63.111', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2122', '101.68.49.76', '9000', '0', '中国 浙江省 杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2123', '115.218.217.127', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2124', '115.218.123.9', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2125', '115.218.123.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2126', '118.178.227.171', '80', '0', '中国 浙江省 杭州市 阿里云', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2127', '115.218.125.249', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2128', '58.87.87.142', '80', '0', '中国 天津市 天津市 腾讯网络', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2129', '115.218.219.28', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2130', '115.218.223.221', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2131', '115.223.235.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.400', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2132', '115.210.28.102', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2133', '183.158.204.84', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2134', '115.223.232.103', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2135', '115.218.121.166', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2136', '115.223.201.161', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2137', '222.73.68.144', '8090', '0', '中国 上海市 上海市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2138', '115.196.50.111', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2139', '125.122.148.199', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2140', '115.223.216.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.900', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2141', '101.71.236.114', '9000', '0', '浙江省杭州市 联通', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2142', '182.107.12.73', '9000', '0', '中国 江西省 抚州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2143', '223.223.187.195', '80', '0', '中国 北京市 北京市', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2144', '115.223.251.87', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2145', '115.218.220.4', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2146', '115.218.122.118', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2147', '115.223.232.202', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2148', '121.232.147.48', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2149', '183.147.31.53', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2150', '114.234.80.51', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2151', '171.92.53.54', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2152', '115.223.202.135', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2153', '115.223.196.215', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2154', '180.118.128.146', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2155', '114.235.22.133', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2156', '115.218.120.111', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-16 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2157', '117.90.1.48', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2158', '115.223.201.231', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2159', '115.223.193.163', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2160', '182.129.241.80', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '0.800', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2161', '163.125.221.75', '8118', '0', '中国 广东省 深圳市 联通', 'HTTP', '0.300', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2162', '122.242.132.162', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2163', '222.132.56.80', '9000', '0', '山东省潍坊市 联通', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2164', '117.90.137.51', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2165', '180.118.86.169', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.400', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2166', '163.125.251.5', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2167', '115.223.215.30', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2168', '183.154.214.116', '9000', '0', '浙江省金华市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2169', '58.87.87.142', '80', '0', '中国 天津市 天津市 腾讯网络', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2170', '117.78.50.121', '8118', '0', '中国 北京市 北京市 联通', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2171', '115.218.221.48', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2172', '180.118.128.153', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2173', '183.154.214.51', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2174', '125.117.133.214', '9000', '0', '浙江省金华市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2175', '115.218.208.216', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2176', '115.223.246.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2177', '115.218.124.46', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2178', '182.88.187.248', '8123', '0', '广西壮族自治区南宁市 联通', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2179', '180.118.94.12', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2180', '115.218.126.115', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2181', '115.218.123.169', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.500', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2182', '180.104.62.46', '9000', '0', '江苏省徐州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2183', '115.218.123.89', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2184', '115.218.216.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2185', '117.90.7.248', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2186', '114.234.80.166', '9000', '0', '江苏省徐州市 电信', 'HTTP', '0.600', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2187', '180.118.86.99', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2188', '163.125.251.9', '8118', '0', '中国 广东 深圳 联通', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2189', '60.186.42.189', '9000', '0', '中国 浙江省 杭州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2190', '115.223.233.43', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2191', '117.90.0.128', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2192', '115.223.254.151', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2193', '115.218.125.238', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2194', '106.4.135.252', '9000', '0', '中国 江西省 抚州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2195', '183.158.203.190', '9000', '0', '浙江省杭州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2196', '115.211.40.164', '9000', '0', '浙江省金华市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2197', '115.223.238.121', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2198', '118.117.136.123', '9000', '0', '四川省遂宁市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2199', '180.118.247.239', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2200', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2201', '115.223.236.245', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2202', '115.223.200.60', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2203', '115.223.218.170', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2204', '36.7.111.92', '8118', '0', '中国 安徽省 合肥市 电信', 'HTTP', '0.700', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2205', '115.223.244.20', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2206', '115.223.253.40', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2207', '115.223.205.52', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2208', '115.223.216.143', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2209', '117.90.4.84', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '0.900', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2210', '115.218.223.238', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2211', '117.90.252.55', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2212', '115.193.101.168', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2213', '115.218.126.212', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2214', '115.223.229.114', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2215', '115.218.219.243', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2216', '125.119.217.255', '9000', '0', '浙江省杭州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2217', '222.208.83.175', '9000', '0', '中国 四川省 遂宁市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2218', '117.90.3.66', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2219', '115.218.218.29', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.700', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2220', '115.218.121.5', '9000', '0', '浙江省温州市 电信', 'HTTP', '0.600', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2221', '115.218.121.80', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2222', '121.232.199.21', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2223', '117.87.177.163', '9000', '0', '江苏省徐州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2224', '117.90.137.147', '9000', '0', '中国 江苏省 镇江市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2225', '111.3.108.44', '8118', '0', '中国 浙江省 台州市 移动', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2226', '115.223.213.147', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2227', '115.223.253.1', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2228', '114.234.80.255', '9000', '0', '江苏省徐州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2229', '115.223.250.144', '9000', '0', '浙江省温州市 电信', 'HTTP', '3.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2230', '115.218.221.81', '9000', '0', '浙江省温州市 电信', 'HTTP', '1.000', '2018-05-19 00:00:00');
INSERT INTO `quartz_proxy` VALUES ('2231', '115.218.125.69', '9000', '0', '浙江省温州市 电信', 'HTTP', '2.000', '2018-05-19 00:00:00');
