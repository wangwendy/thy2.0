/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : thy

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-05-27 15:13:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `thy_ad`
-- ----------------------------
DROP TABLE IF EXISTS `thy_ad`;
CREATE TABLE `thy_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thy_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_asset`
-- ----------------------------
DROP TABLE IF EXISTS `thy_asset`;
CREATE TABLE `thy_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of thy_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `thy_auth_access`;
CREATE TABLE `thy_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of thy_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `thy_auth_rule`;
CREATE TABLE `thy_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of thy_auth_rule
-- ----------------------------
INSERT INTO `thy_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `thy_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');

-- ----------------------------
-- Table structure for `thy_comments`
-- ----------------------------
DROP TABLE IF EXISTS `thy_comments`;
CREATE TABLE `thy_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of thy_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `thy_common_action_log`;
CREATE TABLE `thy_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of thy_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `thy_guestbook`;
CREATE TABLE `thy_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of thy_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_links`
-- ----------------------------
DROP TABLE IF EXISTS `thy_links`;
CREATE TABLE `thy_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of thy_links
-- ----------------------------
INSERT INTO `thy_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `thy_menu`
-- ----------------------------
DROP TABLE IF EXISTS `thy_menu`;
CREATE TABLE `thy_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of thy_menu
-- ----------------------------
INSERT INTO `thy_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `thy_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `thy_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `thy_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `thy_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `thy_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `thy_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `thy_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `thy_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `thy_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `thy_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `thy_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `thy_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `thy_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `thy_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '0', '备份管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `thy_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `thy_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `thy_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `thy_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `thy_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `thy_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `thy_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `thy_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `thy_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `thy_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `thy_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `thy_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `thy_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `thy_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `thy_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `thy_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `thy_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `thy_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `thy_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `thy_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `thy_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `thy_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `thy_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `thy_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `thy_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `thy_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `thy_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `thy_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `thy_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `thy_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `thy_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `thy_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `thy_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `thy_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `thy_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `thy_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `thy_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `thy_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `thy_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `thy_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `thy_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `thy_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `thy_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `thy_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `thy_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `thy_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `thy_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `thy_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `thy_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `thy_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `thy_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `thy_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `thy_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `thy_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `thy_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `thy_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `thy_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `thy_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');

-- ----------------------------
-- Table structure for `thy_nav`
-- ----------------------------
DROP TABLE IF EXISTS `thy_nav`;
CREATE TABLE `thy_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of thy_nav
-- ----------------------------
INSERT INTO `thy_nav` VALUES ('1', '1', '0', '主页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `thy_nav` VALUES ('2', '1', '0', '关于我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `thy_nav` VALUES ('3', '1', '0', '桃花源家族APP', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');
INSERT INTO `thy_nav` VALUES ('4', '1', '2', '桃花源家族介绍', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=5#values_v01', '', '1', '0', '0-2-4');
INSERT INTO `thy_nav` VALUES ('5', '1', '2', '运营概括', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=5#values_v02', '', '1', '0', '0-2-5');
INSERT INTO `thy_nav` VALUES ('6', '1', '2', '《俱乐部》', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-2-6');
INSERT INTO `thy_nav` VALUES ('7', '1', '2', '《桃花源家族》', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '0', '0-2-7');
INSERT INTO `thy_nav` VALUES ('8', '1', '2', '俱乐部联盟', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=8#linkourhome', '', '1', '0', '0-2-8');
INSERT INTO `thy_nav` VALUES ('9', '1', '2', '桃花源家族服务包', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '0', '0-2-9');
INSERT INTO `thy_nav` VALUES ('10', '1', '2', '合作机构', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}', '', '1', '0', '0-2-10');
INSERT INTO `thy_nav` VALUES ('11', '1', '3', 'App介绍', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=2#app01', '', '1', '0', '0-3-11');
INSERT INTO `thy_nav` VALUES ('12', '1', '3', '俱乐部365', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=2#app02', '', '1', '0', '0-3-12');
INSERT INTO `thy_nav` VALUES ('13', '1', '3', '会员特权', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=2#app03', '', '1', '0', '0-3-13');
INSERT INTO `thy_nav` VALUES ('14', '1', '3', '商城', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=2#app04', '', '1', '0', '0-3-14');
INSERT INTO `thy_nav` VALUES ('15', '1', '3', '个人中心', '', 'http://localhost/thy2.0/index.php?m=list&a=index&id=2#app05', '', '1', '0', '0-3-15');
INSERT INTO `thy_nav` VALUES ('16', '1', '0', '关注我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-16');
INSERT INTO `thy_nav` VALUES ('17', '1', '16', '公众号', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-16-17');
INSERT INTO `thy_nav` VALUES ('18', '1', '16', '微博', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"17\";}}', '', '1', '0', '0-16-18');
INSERT INTO `thy_nav` VALUES ('19', '1', '16', '400电话', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}', '', '1', '0', '0-16-19');

-- ----------------------------
-- Table structure for `thy_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `thy_nav_cat`;
CREATE TABLE `thy_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of thy_nav_cat
-- ----------------------------
INSERT INTO `thy_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `thy_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `thy_oauth_user`;
CREATE TABLE `thy_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of thy_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_options`
-- ----------------------------
DROP TABLE IF EXISTS `thy_options`;
CREATE TABLE `thy_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of thy_options
-- ----------------------------
INSERT INTO `thy_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `thy_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\\u4eacICP\\u590718030831\\u53f7\",\"site_admin_email\":\"info@thyclub.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\",\"site_seo_keywords\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\",\"site_seo_description\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `thy_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');
INSERT INTO `thy_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for `thy_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `thy_plugins`;
CREATE TABLE `thy_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of thy_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_posts`
-- ----------------------------
DROP TABLE IF EXISTS `thy_posts`;
CREATE TABLE `thy_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of thy_posts
-- ----------------------------
INSERT INTO `thy_posts` VALUES ('1', '1', '', '', '2019-05-18 18:11:41', '<pre style=\"background-color: rgb(255, 255, 255); font-family: 宋体; font-size: 9.6pt;\">北京市朝阳区酒仙桥路10号恒通国际商务园B35栋</pre>', '地址', '北京市朝阳区酒仙桥路10号恒通国际商务园B35栋', '1', '1', '2019-05-18 18:25:44', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('2', '1', '', '', '2019-05-18 18:12:47', '<pre style=\"background-color: rgb(255, 255, 255); font-family: 宋体; font-size: 9.6pt;\">info@thyclub.com</pre>', '邮箱 ', 'info@thyclub.com', '1', '1', '2019-05-18 18:26:49', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('3', '1', '', '', '2019-05-18 18:13:15', '<p>400&nbsp;&nbsp;636&nbsp;&nbsp;1228</p>', '客服热线', '400  636  1228', '1', '1', '2019-05-18 18:41:45', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190518\\/5cdfe15ab0d18.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('4', '1', '', '', '2019-05-18 18:16:26', '', '桃花源家族公众号', '', '1', '1', '2019-05-18 18:20:35', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190518\\/5cdfdbbc718eb.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('5', '1', '', '', '2019-05-18 18:21:01', '', '桃花源家族官方微博', '', '1', '1', '2019-05-18 18:29:53', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190518\\/5cdfde9ecddd4.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('6', '1', '', '', '2019-05-20 17:07:47', '', '俱乐部颁365精彩活动', '新西兰北岛7天休闲游', '1', '1', '2019-05-20 17:08:46', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('7', '1', '', '', '2019-05-20 17:08:48', '', '中国最具影响力', '俱乐部颁奖盛典圆满结束', '1', '1', '2019-05-20 17:08:59', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('8', '1', '', '', '2019-05-20 17:09:00', '<p>以美学赞礼生命&nbsp;&nbsp;&nbsp;&nbsp;以生命践行美学</p>', '以美学赞礼生命', '以生命践行美学', '1', '1', '2019-05-20 17:55:19', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('9', '1', '', '', '2019-05-20 17:09:25', '<pre style=\"background-color:#2a2b27;color:#c6b3ba;font-family:&#39;Consolas&#39;;font-size:10.5pt;\">1月6日桃花源家族APP正式上线</pre><p><br/></p>', '桃花源家族APP正式上线', '会员权益', '1', '1', '2019-05-27 14:55:00', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('10', '1', '', '', '2019-05-20 17:09:41', '<pre style=\"background-color:#2a2b27;color:#c6b3ba;font-family:&#39;Consolas&#39;;font-size:10.5pt;\">“《俱乐部》&amp;&nbsp;《桃花源家族》”</pre><p><br/></p>', '“《俱乐部》&amp; 《桃花源家族》”', '“《俱乐部》&amp; 《桃花源家族》”', '1', '1', '2019-05-20 17:11:20', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('11', '1', '桃花源家族·中国首席多元化聚美集群', '', '2019-05-20 17:11:22', '<p>桃花源家族·中国首席多元化聚美集群</p>', '关于我们', '商务合作', '1', '1', '2019-05-20 17:12:26', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('12', '1', '', '', '2019-05-20 17:12:27', '<p>桃花源家族特权卡</p>', '桃花源家族特权卡', '了解更多', '1', '1', '2019-05-20 17:13:31', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('13', '1', '', '', '2019-05-20 17:12:50', '', '俱乐部365精选活动/课程', '活动详情', '1', '1', '2019-05-20 17:13:14', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('14', '1', '', '', '2019-05-20 17:13:44', '<pre style=\"background-color:#2a2b27;color:#c6b3ba;font-family:&#39;宋体&#39;;font-size:10.5pt;\">俱乐部365往期活动</pre><p><br/></p>', '俱乐部365往期活动', '活动详情', '1', '1', '2019-05-20 17:14:00', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('15', '1', '', '', '2019-05-21 14:11:16', '<p>1月6日，桃花源家族退出的APP正式上线，为您带来多项特权服务的同时还有<br/>桃花源家族精彩的会员活动体验和专属课程。<br/>桃花源家族APP主要分为4个板块，俱乐部365、VIP特权、商城和个人中心。<br/>我们是创造精致生活的设计师，为您打造浸入式品质生活。</p>', '桃花源家族APP正式上线', '会员权益', '1', '1', '2019-05-21 14:13:40', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce396a09e625.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('16', '1', '俱      乐      部', '', '2019-05-21 14:14:07', '<p>桃花源家族开放经过整合的优质内容、服务特权和商品特权，与俱乐部已有服务一起<br/>更好的满足客户需求，形成“+”服务。</p>', '桃花源家族服务包', '已有服务', '1', '1', '2019-05-21 14:26:35', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/thy2.0\\/data\\/upload\\/portal\\/20190521\\/5ce3978003533.png\",\"alt\":\"appnva01.png\"},{\"url\":\"http:\\/\\/localhost\\/thy2.0\\/data\\/upload\\/portal\\/20190521\\/5ce397801f01a.png\",\"alt\":\"appnva02.png\"},{\"url\":\"http:\\/\\/localhost\\/thy2.0\\/data\\/upload\\/portal\\/20190521\\/5ce3978034107.png\",\"alt\":\"appnva03.png\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('17', '1', '', '', '2019-05-21 15:18:04', '<p>THY&nbsp;&nbsp;SOCIALITES&nbsp;&nbsp;<em>PRIVILEGED</em>&nbsp;&nbsp;<em>SERVICE</em></p>', '桃花源家族会员权益', '成为会员', '1', '1', '2019-05-21 15:19:09', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('18', '1', '', '', '2019-05-21 15:19:10', '', '桃花源家族APP分为四大板块', '', '1', '1', '2019-05-21 15:20:14', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3a69606dfa.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190521\\/5ce3a6a74e65a.png\",\"alt\":\"appnva01.png\"},{\"url\":\"portal\\/20190521\\/5ce3a6a76d759.png\",\"alt\":\"appnva02.png\"},{\"url\":\"portal\\/20190521\\/5ce3a6a78218d.png\",\"alt\":\"appnva03.png\"},{\"url\":\"portal\\/20190521\\/5ce3a6a7960c2.png\",\"alt\":\"appnva04.png\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('19', '1', '', '', '2019-05-21 15:20:15', '<p>“我们是创造精致生活的设计师，为您打造浸入式品质生活。”</p><p>桃花源家族学院是中国首家“生活方式美学提升学院”。</p><p>以“生活美学”“生命美学”“城市美学”为主线，涵盖所有独创跨界生活方式产品，</p><p>用专业的态度探索市场，帮助国内高净值家庭重构美学定义，</p><p>打开更多元更意趣的生活灵感。</p>', '桃花源家族俱乐部365', '', '1', '1', '2019-05-21 15:40:24', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('20', '1', '', '', '2019-05-21 15:24:21', '<p>在“会员特权”版块中集合了桃花源家族</p><p>所有会员精品专享特权，</p><p>从多种层面为我们的</p><p>会员打造多样便捷的生活方式。</p>', '会员特权', '', '1', '1', '2019-05-21 15:28:08', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3a7b9d949b.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost\\/thy2.0\\/data\\/upload\\/portal\\/20190521\\/5ce3a7fce8501.png\",\"alt\":\"phone03.png\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('21', '1', 'GLOBAL 2100+HOTEL', '', '2019-05-21 15:47:08', '<p>成为会员</p>', '全球 2100+ 高端酒店度假村预定及特殊礼遇', 'PRIVILEGE COURTESY', '1', '1', '2019-05-21 16:00:19', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3ad2ebb994.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('22', '1', '', '', '2019-05-21 16:01:43', '<p>\n							与全球2100多家酒店和度假村合作;<br/> 享受独特的优惠和设施;<br/> 比美国运通百夫长多20%的酒店合作伙伴;<br/> 即时预订、可用性强;<br/> 保证最优惠价格。<br/></p>', '特权项目', '', '1', '1', '2019-05-21 16:02:10', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('23', '1', '', '', '2019-05-21 16:02:11', '<p>\n							双人早餐、客房升级特权;<br/> 定制的欢迎生命：例如来自相应的俱乐部的问候，或作为尊贵会员享受客房升级;<br/> 每次入住获得100美金的午餐/晚餐/水疗或设施的消费抵用券;<br/> 延迟至4点退房、高速无线网特权;<br/> 可获得相应的会员积分。<br/></p>', '酒店会员权益', '会员权益', '1', '1', '2019-05-21 16:12:58', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('24', '1', '', '', '2019-05-21 16:05:06', '', '酒店权益', '', '1', '1', '2019-05-21 16:05:30', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3b1489a77b.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('25', '1', '', '', '2019-05-21 16:06:58', '', '餐厅权益', '', '1', '1', '2019-05-21 16:07:29', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3b1bcf1cf4.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('26', '1', '', '', '2019-05-21 16:07:31', '<p>与全球100+米其林级餐厅品牌合作;<br/> 即时预订、可用性强;<br/> 全球市场持续更新中。</p>', '特权项目', '', '1', '1', '2019-05-21 16:08:13', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('27', '1', '', '', '2019-05-21 16:08:14', '<p>优先预定;<br/> 代表所属俱乐部定制迎宾礼;<br/> 免费饮料或甜点。</p>', '餐厅会员权益', '会员权益', '1', '1', '2019-05-21 16:13:08', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('28', '1', '', '', '2019-05-21 16:20:45', '<p>桃花源家族为会员提供多层次、多维度的生活服务内容。从健康管理特权到绿色饮食体验，从公务包机礼遇到私密旅行定制。多样化的特权服务让我们的会员不管是公务还是生活，都能有多一分的便捷与享受。</p>', '商城权益', '', '1', '1', '2019-05-21 16:29:44', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190521\\/5ce3b50b945ff.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('29', '1', '', '', '2019-05-21 16:24:02', '<p>与全球100+米其林级餐厅品牌合作;<br/> \n								即时预订、可用性强;<br/> \n								全球市场持续更新中。</p>', '个人中心特权项目', '特权项目', '1', '1', '2019-05-21 16:24:43', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('30', '1', '', '', '2019-05-21 16:24:44', '<p>\n								优先预定;<br/> \n								代表所属俱乐部定制迎宾礼;<br/> \n								免费饮料或甜点。</p>', '个人中心会员权益', '会员权益', '1', '1', '2019-05-21 16:25:09', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('31', '1', '桃花源家族学院', 'JUNE', '2019-05-21 17:44:08', '', '6月', '6月活动', '1', '1', '2019-05-21 17:44:47', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('32', '1', '艺术世界里的完美童年', '', '2019-05-21 17:44:49', '', '6月22日·上海·朵云轩美术馆', '——博洛尼亚国际插画展', '1', '1', '2019-05-21 17:45:22', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('33', '1', '一场新媒体艺术的童话旅行', '', '2019-05-21 17:45:23', '', '6月24日·北京·央美术馆', '特邀日本顶尖新媒体艺术团队teamLab打造大型沉浸式互动艺术展【teamLab★未来游乐园】', '1', '1', '2019-05-21 17:50:06', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('34', '1', '', '', '2019-05-21 17:45:48', '', '6月24日·北京·长安俱乐部', '区块链应用与发展', '1', '1', '2019-05-21 17:46:06', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('35', '1', '未来践行家系列', '', '2019-05-21 17:46:08', '', '6月30日·北京·利星行奔驰汽车工厂', '—未来工程师', '1', '1', '2019-05-21 17:46:27', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('36', '1', '暨桃花源家族APP上线启动仪式', '', '2019-05-21 17:56:34', '<p>由《俱乐部》杂志和桃花源家族主办的“跨界赋能 美好共生”中国最具影响力俱乐部颁奖盛典暨桃花源家族APP上线启动仪式华美落幕。《俱乐部》杂志创始人兼出品人 Amy Luan，桃花源家族总裁、《俱乐部》杂志联合出品人魏雄杰，《俱乐部》杂志主编刘岩共同邀请俱乐部界大咖、各界名流亲临现场，见证这一美好时刻。盛典上颁发了俱乐部最具影响力人物及最具影响力俱乐部等8个大奖。当晚，桃花源家族APP也正式上线，它将为高端人群带来更多会员权益以及新的生活方式。</p>', '“跨界赋能        美好共生”', '中国最具影响力俱乐部颁奖盛典', '1', '1', '2019-05-22 09:34:23', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('37', '1', '桃花源家族', '', '2019-05-21 17:57:22', '<p>近日，在充满法式风情的MOISSONNIER展厅里，桃花源家族携手蓝色早晨家居，以及来自法国的Liquides Imaginaires幻想之水，带来一场法式香氛三重奏。在场的嘉宾出其不意和迷人的“法国味儿”来了个邂逅。 \n								Liquides Imaginaires的每一款香水都是一个特别的故事。不同系列的“三部曲（Trilogy）”中，有dry woods干木质调香气的“Fortis堡垒之殇”，文静而决绝；有混合了夏天海滩香气的“Dom rosa粉色之彼”，\n								清甜而迷醉；也有挥散着被河水浸泡的木船之气“Bello rabelo拉贝洛之勇”， 晦涩而沉稳。</p>', '“法式生活艺术”论坛', '揭示最地道的法式生活', '1', '1', '2019-05-22 15:39:23', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4fca319776.jpeg\",\"alt\":\"WechatIMG28.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca332f0d.jpeg\",\"alt\":\"WechatIMG29.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca34e865.jpeg\",\"alt\":\"WechatIMG30.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca364995.jpeg\",\"alt\":\"WechatIMG31.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca37cf74.jpeg\",\"alt\":\"WechatIMG32.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca391edf.jpeg\",\"alt\":\"WechatIMG33.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca3a766c.jpeg\",\"alt\":\"WechatIMG34.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca3bc26c.jpeg\",\"alt\":\"WechatIMG35.jpeg\"},{\"url\":\"portal\\/20190522\\/5ce4fca3d2757.jpeg\",\"alt\":\"WechatIMG36.jpeg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('38', '1', '桃花源家族携手日本茶艺大师大薮晃子分享日式茶道', '', '2019-05-21 17:57:36', '<p>近日，“桃花源家族”联手“设计北京”共同打造“存量时代下的空间演绎”论坛，本次论坛汇聚了著名建筑师、室内设计师、产品设计师、著名艺术家及国内顶尖俱乐部创始人等重量级嘉宾，从不同领域共同探讨相关话题，破解其中困局。</p>', '日本茶道茶艺分享会', '揭示最地道的法式生活', '1', '1', '2019-05-22 14:36:24', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('39', '1', '', '', '2019-05-22 14:42:47', '', '往期活动内容', '', '1', '1', '2019-05-22 14:44:22', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4ef988bf3c.jpg\",\"alt\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\\u643a\\u624b\\u8001\\u7237\\u4f1a\\u3001\\u96cf\\u83ca\\u6c47\\u3001\\u7279\\u65af\\u62c9\\uff0c\\u5171\\u540c\\u4e3e\\u529e\\u201c\\u7ec5\\u58eb\\u7684\\u54c1\\u5473\\u201d\\u8bba\\u575b\\u6d3b\\u52a8\\u3002\"},{\"url\":\"portal\\/20190522\\/5ce4ef98a8cbb.jpg\",\"alt\":\"\\u7ec5\\u58eb\\u7684\\u54c1\\u683c\"},{\"url\":\"portal\\/20190522\\/5ce4efb494b0f.jpg\",\"alt\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\\u00d7\\u5fb7\\u8d1d\\u5c14\\u53e3\\u8154\\u4e4b\\u6211\\u662f\\u5c0f\\u7259\\u533b\\u3002\"},{\"url\":\"portal\\/20190522\\/5ce4efb4abcf7.jpg\",\"alt\":\"\\u6843\\u82b1\\u6e90\\u5bb6\\u65cf\\u643a\\u624b\\u8001\\u7237\\u4f1a\\u3001\\u96cf\\u83ca\\u6c47\\u3001\\u7279\\u65af\\u62c9\\uff0c\\u5171\\u540c\\u4e3e\\u529e\\u201c\\u7ec5\\u58eb\\u7684\\u54c1\\u5473\\u201d\\u8bba\\u575b\\u6d3b\\u52a8\\u3002\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('40', '1', '基于左手大海，右手群山，自然于一掌的物理空间，', '坚守土地中生长的一种人文与自然相平衡的秩序，', '2019-05-22 14:51:09', '<p style=\"margin: 0px;\">基于左手大海，右手群山，自然于一掌的物理空间，</p><p style=\"margin: 0px;\">坚守土地中生长的一种人文与自然相平衡的秩序，</p><p style=\"margin: 0px;\">选择了多元文化领域的主题合作，</p><p style=\"margin: 0px;\">旨在通过文明融合再造，构建起当代人文坐标中的海上盛景。</p>', '桃花源家族之香水湾1号美学小镇        与美好共生。', '选择了多元文化领域的主题合作，', '1', '1', '2019-05-22 15:12:27', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190522\\/5ce4f1b3be5ce.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('41', '1', '', '', '2019-05-22 15:09:19', '', '桃花源家族学院基地—香水湾1号落地主题', '', '1', '1', '2019-05-22 15:09:46', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190522\\/5ce4f5b6b0be8.png\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('42', '1', '', '', '2019-05-22 15:19:31', '', '实景拍摄', '', '1', '1', '2019-05-22 15:20:59', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4f8492a91b.jpg\",\"alt\":\"school_base01.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f8494aaf5.jpg\",\"alt\":\"school_base02.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f8496214c.jpg\",\"alt\":\"school_base03.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f849775e5.jpg\",\"alt\":\"school_base04.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('43', '1', '', '', '2019-05-22 15:21:01', '', '实景拍摄', '', '1', '1', '2019-05-22 15:21:20', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4f86936ccb.jpg\",\"alt\":\"school_base05.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f86957dbd.jpg\",\"alt\":\"school_base06.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f8696edce.jpg\",\"alt\":\"school_base07.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4f8698468b.jpg\",\"alt\":\"school_base08.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('44', '1', '', '', '2019-05-22 15:22:53', '<p>甄选全国最佳设计度假酒店，遗世独立的隐居酒店，文旅地产项目，城市顶级俱乐部作为会员活动及课程基地，既能体验地域性自然风貌、感受灿烂瑰丽的文化也能享受到私密奢华的社交空间（文旅地产、度假酒店、城市俱乐部）。</p>', '桃花源家族学院基地合作酒店', '', '1', '1', '2019-05-22 15:24:23', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4f901bbd42.jpg\",\"alt\":\"\\u9999\\u6c34\\u6e7e\\u4e00\\u53f7\"},{\"url\":\"portal\\/20190522\\/5ce4f901dc315.jpg\",\"alt\":\"\\u5ce8\\u7709\\u5c71\\u84dd\\u5149\\u5b89\\u7eb3\\u5854\\u62c9\\u9152\\u5e97\"},{\"url\":\"portal\\/20190522\\/5ce4f901f247f.jpg\",\"alt\":\"\\u82b1\\u95f4\\u5802\"},{\"url\":\"portal\\/20190522\\/5ce4f90216d02.jpg\",\"alt\":\"\\u963f\\u4e3d\\u62c9\\u9633\\u6eaf\\u5802\\u820d\"},{\"url\":\"portal\\/20190522\\/5ce4f9022e591.jpg\",\"alt\":\"\\u9999\\u6a1f\\u534e\\u82f9\\u6e29\\u6cc9\\u5ea6\\u5047\\u522b\\u5885\"},{\"url\":\"portal\\/20190522\\/5ce4f90247ec6.jpg\",\"alt\":\"\\u5bcc\\u6625\\u5c71\\u5c45\"},{\"url\":\"portal\\/20190522\\/5ce4f9025e529.jpg\",\"alt\":\"\\u9690\\u4e16\\u96c6\\u56e2\"},{\"url\":\"portal\\/20190522\\/5ce4f9027426d.jpg\",\"alt\":\"\\u516d\\u5584\\u9152\\u5e97\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('45', '1', '', '', '2019-05-22 15:41:07', '', '跨界赋能 美好共生图片1', '', '1', '1', '2019-05-22 15:42:56', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4fd7903fe0.jpg\",\"alt\":\"events1_11.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4fd791ccd8.jpg\",\"alt\":\"events1_12.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4fd793265d.jpg\",\"alt\":\"events1_13.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4fd7948e8b.jpg\",\"alt\":\"events1_14.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('46', '1', '', '', '2019-05-22 15:42:58', '', '跨界赋能 美好共生图片2', '', '1', '1', '2019-05-22 15:44:29', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce4fddb5feb1.jpg\",\"alt\":\"events1_21.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4fddb7d473.jpg\",\"alt\":\"events1_22.jpg\"},{\"url\":\"portal\\/20190522\\/5ce4fddb9215c.jpg\",\"alt\":\"events1_23.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('47', '1', '', '', '2019-05-22 16:00:24', '', '日本茶道茶艺分享会图片1', '', '1', '1', '2019-05-22 16:00:48', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce501adc41d9.jpg\",\"alt\":\"speech01.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501addb02a.jpg\",\"alt\":\"speech02.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501adf11e3.jpg\",\"alt\":\"speech03.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501ae170ec.jpg\",\"alt\":\"speech04.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501ae2edff.jpg\",\"alt\":\"speech05.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501ae55d85.jpg\",\"alt\":\"speech06.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501ae6af6e.jpg\",\"alt\":\"speech07.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('48', '1', '', '', '2019-05-22 16:00:49', '', '日本茶道茶艺分享会图片2', '', '1', '1', '2019-05-22 16:01:07', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce501c0d204b.jpg\",\"alt\":\"events3_21.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501c0e9e4e.jpg\",\"alt\":\"events3_22.jpg\"},{\"url\":\"portal\\/20190522\\/5ce501c10af87.jpg\",\"alt\":\"events3_23.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('49', '1', '', '', '2019-05-22 16:30:37', '<p>桃花源家族于2017年在北京正式成立企业总部，依托远东控股集团购房客户资源，全国俱乐部联盟客户资源，自营的公开媒体资源，为中国超过十万高净值人群提供综合个性化服务。对于至美生活的理想，是总在我们心中闪烁的明灯，于是成为一家专注于文旅项目、文化内容运营及高净值人群服务的独立公司。</p><p>远东控股集团专注于超高端旅游地产开发，旗下著名项目包括海南省地标凤凰岛，被媒体评为中国10大豪宅的海南香水湾1号及享誉盛名的海南五指山国家雨林综合型旅游景区。</p><p>以全国俱乐部联盟平台为主线，同时以精准的俱乐部人群为基础，共享内容、共享空间、共享客户，打造“俱乐部联盟”，为个体俱乐部提供更丰富的服务、客户的内容以及客户来源。以多元聚美文化集群展开文旅地产招商及运营，高端楼盘资产管理和运营，《俱乐部》和《桃花源家族》媒体矩阵，艺术博览会运营，高端人群培训，高端活动策划，会员制的服务运营。\n						桃花源对于人类来说，不仅仅是一纸文学作品，而是前人创造的一种生活方式，一种山水布景，一种人生哲学，一处心灵归属。我们便是要造一座精神与物质交融的桃花源，为每个人插上一对能飞往理想国的翅膀。</p>', '桃花源家族介绍', '桃花源，是一束贯穿古今的梦之光，人们一直都在寻找心灵栖息地，而这也正是桃花源家族对于至美生活的理想。', '1', '1', '2019-05-22 16:31:07', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('50', '1', '种', '媒体介质，杂志、', '2019-05-22 16:34:32', '', '3', '电视频道、新媒体矩阵', '1', '1', '2019-05-22 16:35:48', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('51', '1', '家', '', '2019-05-22 16:35:49', '', '156', '平均活动场次350场', '1', '1', '2019-05-22 16:36:02', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('52', '1', '种', '', '2019-05-22 16:36:03', '', '30', '多领域聚合文化课程', '1', '1', '2019-05-22 16:36:21', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('53', '1', '家', '', '2019-05-22 16:36:22', '', '28', '聚美群落基地酒店', '1', '1', '2019-05-22 16:36:34', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('54', '1', '家', '', '2019-05-22 16:36:35', '', '2100', '全球五星级及超五星级酒店特权服务', '1', '1', '2019-05-22 16:36:46', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('55', '1', '家', '', '2019-05-22 16:36:47', '', '120', '中国高端餐厅预定礼遇服务', '1', '1', '2019-05-22 16:37:01', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('56', '1', '场', '', '2019-05-22 16:41:59', '', '350', '平均活动场次350场', '1', '1', '2019-05-22 16:42:25', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('57', '1', '《桃花源家族》', '', '2019-05-22 16:49:02', '', '杂志订阅', '《俱乐部》', '1', '1', '2019-05-22 16:49:44', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce50d268a216.jpg\",\"alt\":\"magazine01.jpg\"},{\"url\":\"portal\\/20190522\\/5ce50d26a1840.jpg\",\"alt\":\"magazine02.jpg\"},{\"url\":\"portal\\/20190522\\/5ce50d26bd021.jpg\",\"alt\":\"magazine03.jpg\"},{\"url\":\"portal\\/20190522\\/5ce50d26d3271.jpg\",\"alt\":\"magazine04.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('58', '1', '', '', '2019-05-22 16:54:09', '<p>《俱乐部》杂志聚焦俱乐部、社群领域与公众生活之间的关系.\n						2017年做了大量的运动竞技类俱乐部、俱乐部创始人、管理者的采访。杂志报道分成两个方向，\n						总结各个俱乐部在管理、运营上的方法，传播每个俱乐部的核心理念与其倡导的运动生活方式。\n						2018年，杂志将深耕B2B2C模式，搭建媒体、行业与用户之间良性关系。</p>', '《俱乐部》', '&quot;始终以报道中国的俱乐部生活为主要方向。&quot;', '1', '1', '2019-05-22 16:55:32', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190522\\/5ce50e729e3af.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('59', '1', '', '', '2019-05-22 16:54:27', '<p>《桃花源家族》杂志创刊于2017年，坚持只呈现——最鲜活的大牌趋势，\n							最生动的精英访谈，最深入的幕后故事，最新颖的人文话题，最独特的别册专刊。\n							《桃花源家族》全方位出击， &nbsp;以优雅的文字，触动内心最柔软的部分； \n							 以优美的图片，勾勒世间最美好的向往； &nbsp;以优质的活动，聚拢圈层最真诚的交流。</p>', '《桃花源家族》', '关注高端人群的生活方式。时尚，更尊崇文化；物质，更蕴含精神；享受，更强调责任。', '1', '1', '2019-05-22 16:55:55', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190522\\/5ce50e8cc0b99.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('60', '1', '', '', '2019-05-22 17:07:39', '', '桃花源家族认证合作机构', '', '1', '1', '2019-05-22 17:09:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20190522\\/5ce51187efa92.jpg\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('61', '1', '', '', '2019-05-22 17:08:28', '<p>以《俱乐部》杂志为媒介，将俱乐部创始人汇聚一堂，搭建高品质资源交流平台，深度联系与合作，共同促进俱乐部行业进一步发展。</p>', '桃花源家族俱乐部联盟', '', '1', '1', '2019-05-22 17:09:13', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20190522\\/5ce511b755214.jpg\",\"alt\":\"home1.jpg\"},{\"url\":\"portal\\/20190522\\/5ce511b76d721.jpg\",\"alt\":\"home2.jpg\"},{\"url\":\"portal\\/20190522\\/5ce511b78a29a.jpg\",\"alt\":\"home3.jpg\"},{\"url\":\"portal\\/20190522\\/5ce511b7a0378.jpg\",\"alt\":\"home4.jpg\"}]}', '0', '0', '0', '0');
INSERT INTO `thy_posts` VALUES ('62', '1', '全球', '', '2019-05-27 15:01:08', '', '米其林及高端餐厅预定', '1300+', '1', '1', '2019-05-27 15:01:35', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `thy_role`
-- ----------------------------
DROP TABLE IF EXISTS `thy_role`;
CREATE TABLE `thy_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of thy_role
-- ----------------------------
INSERT INTO `thy_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `thy_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `thy_role_user`;
CREATE TABLE `thy_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of thy_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_route`
-- ----------------------------
DROP TABLE IF EXISTS `thy_route`;
CREATE TABLE `thy_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of thy_route
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_slide`
-- ----------------------------
DROP TABLE IF EXISTS `thy_slide`;
CREATE TABLE `thy_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of thy_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `thy_slide_cat`;
CREATE TABLE `thy_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of thy_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `thy_terms`
-- ----------------------------
DROP TABLE IF EXISTS `thy_terms`;
CREATE TABLE `thy_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of thy_terms
-- ----------------------------
INSERT INTO `thy_terms` VALUES ('1', '关于我们', '', 'article', '', '0', '0', '0-1', '', '', '', 'values', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('2', '桃花源家族APP', '', 'article', '', '0', '0', '0-2', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('3', '关注我们', '', 'article', '', '0', '0', '0-3', '', '', '', 'about', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('4', '桃花源家族介绍', '', 'article', '', '1', '0', '0-1-4', '', '', '', 'values', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('5', '运营概括', '', 'article', '', '1', '0', '0-1-5', '', '', '', 'values', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('6', '《俱乐部》', '', 'article', '', '1', '0', '0-1-6', '', '', '', 'magazine', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('7', '《桃花源家族》', '', 'article', '', '1', '0', '0-1-7', '', '', '', 'magazine', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('8', '俱乐部联盟', '', 'article', '', '1', '0', '0-1-8', '', '', '', 'cooperation', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('9', '桃花源家族服务包', '', 'article', '', '1', '0', '0-1-9', '', '', '', 'appup', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('10', '合作机构', '', 'article', '', '1', '0', '0-1-10', '', '', '', 'cooperation', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('11', 'App介绍', '', 'article', '', '2', '0', '0-2-11', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('12', '俱乐部365', '', 'article', '', '2', '0', '0-2-12', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('13', '会员特权', '', 'article', '', '2', '0', '0-2-13', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('14', '商城', '', 'article', '', '2', '0', '0-2-14', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('15', '个人中心', '', 'article', '', '2', '0', '0-2-15', '', '', '', 'app', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('16', '公众号', '', 'article', '', '3', '0', '0-3-16', '', '', '', 'about', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('17', '微博', '', 'article', '', '3', '0', '0-3-17', '', '', '', 'about', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('18', '400电话', '', 'article', '', '3', '0', '0-3-18', '', '', '', 'about', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('19', '首页内容', '', 'article', '', '0', '0', '0-19', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('20', '近期活动', '', 'article', '', '0', '0', '0-20', '', '', '', 'recentEvents', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('21', '往期活动', '', 'article', '', '0', '0', '0-21', '', '', '', 'events_series', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('22', '“跨界赋能        美好共生”', '', 'article', '', '21', '0', '0-21-22', '', '', '', 'events1', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('23', '“法式生活艺术”论坛', '', 'article', '', '21', '0', '0-21-23', '', '', '', 'events2', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('24', '日本茶道茶艺分享会', '', 'article', '', '21', '0', '0-21-24', '', '', '', 'events3', 'article', '0', '1');
INSERT INTO `thy_terms` VALUES ('25', '活动基地', '', 'article', '', '0', '0', '0-25', '', '', '', 'school_base', 'article', '0', '1');

-- ----------------------------
-- Table structure for `thy_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `thy_term_relationships`;
CREATE TABLE `thy_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of thy_term_relationships
-- ----------------------------
INSERT INTO `thy_term_relationships` VALUES ('1', '1', '3', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('2', '2', '3', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('3', '3', '18', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('4', '4', '16', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('5', '5', '17', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('6', '6', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('7', '7', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('8', '8', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('9', '9', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('10', '10', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('11', '11', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('12', '12', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('13', '13', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('14', '14', '19', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('15', '15', '9', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('16', '16', '9', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('17', '17', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('18', '18', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('19', '19', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('20', '20', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('21', '21', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('22', '22', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('23', '23', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('24', '24', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('25', '25', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('26', '26', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('27', '27', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('28', '28', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('29', '29', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('30', '30', '2', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('31', '31', '20', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('32', '32', '20', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('33', '33', '20', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('34', '34', '20', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('35', '35', '20', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('36', '36', '22', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('37', '37', '23', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('38', '38', '24', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('39', '39', '21', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('40', '40', '25', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('41', '41', '25', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('42', '42', '25', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('43', '43', '25', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('44', '44', '25', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('45', '45', '22', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('46', '46', '22', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('47', '47', '24', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('48', '48', '24', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('49', '49', '4', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('50', '50', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('51', '51', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('52', '52', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('53', '53', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('54', '54', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('55', '55', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('56', '56', '5', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('57', '57', '6', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('58', '58', '6', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('59', '59', '7', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('62', '60', '10', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('61', '61', '8', '0', '1');
INSERT INTO `thy_term_relationships` VALUES ('63', '62', '2', '0', '1');

-- ----------------------------
-- Table structure for `thy_users`
-- ----------------------------
DROP TABLE IF EXISTS `thy_users`;
CREATE TABLE `thy_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of thy_users
-- ----------------------------
INSERT INTO `thy_users` VALUES ('1', 'admin', '###ae1da85ebe5d0e175e3cfd5c550d6fc6', 'admin', 'yuehuiwang@yeah.net', '', null, '0', '2000-01-01', null, '0.0.0.0', '2019-05-27 14:53:51', '2019-05-17 03:41:59', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `thy_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `thy_user_favorites`;
CREATE TABLE `thy_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of thy_user_favorites
-- ----------------------------
