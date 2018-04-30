/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : basic_crm

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-04-30 16:25:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crm_action_log
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
-- Table structure for crm_announcement
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
-- Table structure for crm_business
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
-- Table structure for crm_business_data
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
-- Table structure for crm_business_status
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
-- Table structure for crm_business_status_flow
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
-- Table structure for crm_comment
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
-- Table structure for crm_config
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
-- Table structure for crm_contacts
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
-- Table structure for crm_contract
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
-- Table structure for crm_control
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
-- Table structure for crm_control_module
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
-- Table structure for crm_customer
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
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='本表存放客户的相关信息';

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES ('0', '1', '1', '0', 'admin', 'qq@qq.com', 'regin', '123', 'www', '13133092345', '020-2222222', '20232', '4', '1', 'ad', '036123', 'qie', null, '', '', '2018-04-22', '2018-04-03', null, null, null, null);
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
-- Table structure for crm_customer_attribute
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
-- Table structure for crm_customer_attribute_group
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
-- Table structure for crm_customer_attribute_relation
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
-- Table structure for crm_customer_cares
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
-- Table structure for crm_customer_data
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
-- Table structure for crm_customer_record
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
-- Table structure for crm_email_template
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
-- Table structure for crm_event
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
-- Table structure for crm_fields
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
-- Table structure for crm_file
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
-- Table structure for crm_finance
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
-- Table structure for crm_knowledge
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
-- Table structure for crm_knowledge_category
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
-- Table structure for crm_leads
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
-- Table structure for crm_leads_data
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
-- Table structure for crm_leads_record
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
-- Table structure for crm_log
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
-- Table structure for crm_log_category
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
-- Table structure for crm_message
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
-- Table structure for crm_navigation
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
-- Table structure for crm_payables
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
-- Table structure for crm_paymentorder
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
-- Table structure for crm_permission
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
-- Table structure for crm_position
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
-- Table structure for crm_product
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
-- Table structure for crm_product_attribute
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
-- Table structure for crm_product_attribute_group
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
-- Table structure for crm_product_attribute_relation
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
-- Table structure for crm_product_category
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
-- Table structure for crm_product_data
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
-- Table structure for crm_receivables
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
-- Table structure for crm_receivingorder
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
-- Table structure for crm_role
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
-- Table structure for crm_role_department
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
-- Table structure for crm_r_business_contract
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
-- Table structure for crm_r_business_customer
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
-- Table structure for crm_r_business_event
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
-- Table structure for crm_r_business_file
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
-- Table structure for crm_r_business_log
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
-- Table structure for crm_r_business_product
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
-- Table structure for crm_r_business_status
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
-- Table structure for crm_r_business_task
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
-- Table structure for crm_r_contacts_customer
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
-- Table structure for crm_r_contacts_event
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
-- Table structure for crm_r_contacts_file
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
-- Table structure for crm_r_contacts_log
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
-- Table structure for crm_r_contacts_task
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
-- Table structure for crm_r_contract_file
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
-- Table structure for crm_r_contract_product
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
-- Table structure for crm_r_customer_event
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
-- Table structure for crm_r_customer_file
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
-- Table structure for crm_r_customer_log
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
-- Table structure for crm_r_customer_task
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
-- Table structure for crm_r_event_file
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
-- Table structure for crm_r_event_leads
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
-- Table structure for crm_r_event_log
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
-- Table structure for crm_r_event_product
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
-- Table structure for crm_r_file_finance
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
-- Table structure for crm_r_file_leads
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
-- Table structure for crm_r_file_log
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
-- Table structure for crm_r_file_product
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
-- Table structure for crm_r_file_task
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
-- Table structure for crm_r_file_user
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
-- Table structure for crm_r_finance_log
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
-- Table structure for crm_r_leads_log
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
-- Table structure for crm_r_leads_task
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
-- Table structure for crm_r_log_product
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
-- Table structure for crm_r_log_task
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
-- Table structure for crm_r_log_user
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
-- Table structure for crm_r_product_task
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
-- Table structure for crm_sms_template
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
-- Table structure for crm_task
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
-- Table structure for crm_user
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
-- Table structure for crm_user_attribute
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
-- Table structure for crm_user_attribute_group
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
-- Table structure for crm_user_attribute_relation
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
-- Table structure for crm_user_category
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
-- Table structure for crm_user_smtp
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
-- Table structure for quartz_config
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
INSERT INTO `quartz_config` VALUES ('1', 'test', 'test1', '*/15 * * * * ?', '1', 'msg test123', 'com.inyu.quartz.ScheduleTask1');
INSERT INTO `quartz_config` VALUES ('2', 'test', 'test2', '*/30 * * * * ?', '1', 'msg test', 'com.inyu.quartz.ScheduleTask2');
