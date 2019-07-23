/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : back-ms

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 04/07/2019 15:05:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hat_area
-- ----------------------------
DROP TABLE IF EXISTS `hat_area`;
CREATE TABLE `hat_area`  (
  `id` int(11) NOT NULL,
  `areaID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `father` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hat_area
-- ----------------------------
INSERT INTO `hat_area` VALUES (1, '110101', '东城区', '110100');
INSERT INTO `hat_area` VALUES (2, '110102', '西城区', '110100');
INSERT INTO `hat_area` VALUES (3, '110103', '崇文区', '110100');
INSERT INTO `hat_area` VALUES (4, '110104', '宣武区', '110100');
INSERT INTO `hat_area` VALUES (5, '110105', '朝阳区', '110100');
INSERT INTO `hat_area` VALUES (6, '110106', '丰台区', '110100');
INSERT INTO `hat_area` VALUES (7, '110107', '石景山区', '110100');
INSERT INTO `hat_area` VALUES (8, '110108', '海淀区', '110100');
INSERT INTO `hat_area` VALUES (9, '110109', '门头沟区', '110100');
INSERT INTO `hat_area` VALUES (10, '110111', '房山区', '110100');
INSERT INTO `hat_area` VALUES (11, '110112', '通州区', '110100');
INSERT INTO `hat_area` VALUES (12, '110113', '顺义区', '110100');
INSERT INTO `hat_area` VALUES (13, '110114', '昌平区', '110100');
INSERT INTO `hat_area` VALUES (14, '110115', '大兴区', '110100');
INSERT INTO `hat_area` VALUES (15, '110116', '怀柔区', '110100');
INSERT INTO `hat_area` VALUES (16, '110117', '平谷区', '110100');
INSERT INTO `hat_area` VALUES (17, '110228', '密云县', '110200');
INSERT INTO `hat_area` VALUES (18, '110229', '延庆县', '110200');
INSERT INTO `hat_area` VALUES (19, '120101', '和平区', '120100');
INSERT INTO `hat_area` VALUES (20, '120102', '河东区', '120100');
INSERT INTO `hat_area` VALUES (21, '120103', '河西区', '120100');
INSERT INTO `hat_area` VALUES (22, '120104', '南开区', '120100');
INSERT INTO `hat_area` VALUES (23, '120105', '河北区', '120100');
INSERT INTO `hat_area` VALUES (24, '120106', '红桥区', '120100');
INSERT INTO `hat_area` VALUES (25, '120107', '塘沽区', '120100');
INSERT INTO `hat_area` VALUES (26, '120108', '汉沽区', '120100');
INSERT INTO `hat_area` VALUES (27, '120109', '大港区', '120100');
INSERT INTO `hat_area` VALUES (28, '120110', '东丽区', '120100');
INSERT INTO `hat_area` VALUES (29, '120111', '西青区', '120100');
INSERT INTO `hat_area` VALUES (30, '120112', '津南区', '120100');
INSERT INTO `hat_area` VALUES (31, '120113', '北辰区', '120100');
INSERT INTO `hat_area` VALUES (32, '120114', '武清区', '120100');
INSERT INTO `hat_area` VALUES (33, '120115', '宝坻区', '120100');
INSERT INTO `hat_area` VALUES (34, '120221', '宁河县', '120200');
INSERT INTO `hat_area` VALUES (35, '120223', '静海县', '120200');
INSERT INTO `hat_area` VALUES (36, '120225', '蓟　县', '120200');
INSERT INTO `hat_area` VALUES (37, '130101', '市辖区', '130100');
INSERT INTO `hat_area` VALUES (38, '130102', '长安区', '130100');
INSERT INTO `hat_area` VALUES (39, '130103', '桥东区', '130100');
INSERT INTO `hat_area` VALUES (40, '130104', '桥西区', '130100');
INSERT INTO `hat_area` VALUES (41, '130105', '新华区', '130100');
INSERT INTO `hat_area` VALUES (42, '130107', '井陉矿区', '130100');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '请求类型.方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作提交的数据',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'sessionId',
  `response` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '返回内容',
  `use_time` bigint(11) NULL DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地区',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '市',
  `isp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '异常信息',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6096 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (6012, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.eports.ms.controller.system.TableController.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/table/list\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:43:11', 1, '2019-07-01 14:43:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (6013, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/site/show\"', 8, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:44:59', 1, '2019-07-01 14:44:59', NULL, b'0');
INSERT INTO `sys_log` VALUES (6014, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.eports.ms.controller.system.TableController.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/table/list\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:45:23', 1, '2019-07-01 14:45:23', NULL, b'0');
INSERT INTO `sys_log` VALUES (6015, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/site/show\"', 7, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:13', 1, '2019-07-01 14:47:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (6016, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/site/show\"', 7, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:13', 1, '2019-07-01 14:47:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (6017, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/table/list\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:17', 1, '2019-07-01 14:47:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6018, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/site/show\"', 9, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:17', 1, '2019-07-01 14:47:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6019, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.eports.ms.controller.system.UserConteroller.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/user/list\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:35', 1, '2019-07-01 14:47:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (6020, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.eports.ms.controller.system.RoleController.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/role/list\"', 5, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:35', 1, '2019-07-01 14:47:35', NULL, b'0');
INSERT INTO `sys_log` VALUES (6021, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:36', 1, '2019-07-01 14:47:36', NULL, b'0');
INSERT INTO `sys_log` VALUES (6022, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.eports.ms.controller.system.RoleController.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/role/list\"', 4, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:47:50', 1, '2019-07-01 14:47:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6023, 'Ajax请求', '删除菜单', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/delete', 'POST', 'com.eports.ms.controller.system.MenuController.delete', '[52]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"success\":true,\"message\":\"成功\"}', 80, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:10', 1, '2019-07-01 14:48:10', NULL, b'0');
INSERT INTO `sys_log` VALUES (6024, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:11', 1, '2019-07-01 14:48:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (6025, 'Ajax请求', '删除菜单', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/delete', 'POST', 'com.eports.ms.controller.system.MenuController.delete', '[530]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"success\":true,\"message\":\"成功\"}', 75, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:15', 1, '2019-07-01 14:48:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (6026, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:16', 1, '2019-07-01 14:48:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (6027, 'Ajax请求', '删除菜单', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/delete', 'POST', 'com.eports.ms.controller.system.MenuController.delete', '[51]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"success\":true,\"message\":\"成功\"}', 62, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:20', 1, '2019-07-01 14:48:20', NULL, b'0');
INSERT INTO `sys_log` VALUES (6028, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:21', 1, '2019-07-01 14:48:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (6029, 'Ajax请求', '删除菜单', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/delete', 'POST', 'com.eports.ms.controller.system.MenuController.delete', '[700]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"success\":true,\"message\":\"成功\"}', 51, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:26', 1, '2019-07-01 14:48:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (6030, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 3, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:28', 1, '2019-07-01 14:48:28', NULL, b'0');
INSERT INTO `sys_log` VALUES (6031, 'Ajax请求', '删除菜单', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/delete', 'POST', 'com.eports.ms.controller.system.MenuController.delete', '[800]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"success\":true,\"message\":\"成功\"}', 66, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:31', 1, '2019-07-01 14:48:31', NULL, b'0');
INSERT INTO `sys_log` VALUES (6032, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:48:32', 1, '2019-07-01 14:48:32', NULL, b'0');
INSERT INTO `sys_log` VALUES (6033, 'Ajax请求', '文件上传', '127.0.0.1', '我是管理员', 'http://localhost:8080/file/upload/', 'POST', 'com.eports.ms.controller.system.FileController.uploadFile', '[\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@108263f1\",\"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest@cb3dee\"]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '{\"data\":{\"name\":\"timg (2).jpg\",\"url\":\"http://192.168.30.103:8888/group1/M00/00/31/wKgeZ10ZrOyAFxB-AAIQKr4ZctY123.jpg\"},\"success\":true,\"message\":\"成功\"}', 740, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:49:17', 1, '2019-07-01 14:49:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6034, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.eports.ms.controller.system.RoleController.list', '[]', '897d9407-403f-4f5a-9430-a4c6c962f5d3', '\"admin/system/role/list\"', 2, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-01 14:52:19', 1, '2019-07-01 14:52:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (6035, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.eports.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@ef006c7\"]', '13c8f171-72ac-49fd-91ea-54496d166916', '{\"success\":false,\"message\":\"验证码错误\"}', 11, 'Windows-Firefox-67.0', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 09:42:54', NULL, '2019-07-02 09:42:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (6036, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.eports.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@36aeb1b9\"]', '13c8f171-72ac-49fd-91ea-54496d166916', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 946, 'Windows-Firefox-67.0', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:43:04', 1, '2019-07-02 09:43:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6037, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.eports.ms.controller.system.UserConteroller.list', '[]', '13c8f171-72ac-49fd-91ea-54496d166916', '\"admin/system/user/list\"', 3, 'Windows-Firefox-67.0', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:43:38', 1, '2019-07-02 09:43:38', NULL, b'0');
INSERT INTO `sys_log` VALUES (6038, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.eports.ms.controller.system.RoleController.list', '[]', '13c8f171-72ac-49fd-91ea-54496d166916', '\"admin/system/role/list\"', 5, 'Windows-Firefox-67.0', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:43:39', 1, '2019-07-02 09:43:39', NULL, b'0');
INSERT INTO `sys_log` VALUES (6039, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '13c8f171-72ac-49fd-91ea-54496d166916', '\"admin/system/menu/test\"', 5, 'Windows-Firefox-67.0', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:43:40', 1, '2019-07-02 09:43:40', NULL, b'0');
INSERT INTO `sys_log` VALUES (6040, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.eports.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@2a362529\"]', 'f9761b16-d118-4782-b5c6-6390c53946fb', '{\"success\":false,\"message\":\"验证码错误\"}', 12, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:48:14', 1, '2019-07-02 09:48:14', NULL, b'0');
INSERT INTO `sys_log` VALUES (6041, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.eports.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@5a41dba5\"]', 'f9761b16-d118-4782-b5c6-6390c53946fb', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 714, 'Windows-Chrome-55.0.2883.87', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 09:48:21', 1, '2019-07-02 09:48:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (6042, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.eports.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@7162b5e0\"]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 649, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:07:49', 1, '2019-07-02 21:07:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (6043, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.eports.ms.controller.system.UserConteroller.list', '[]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '\"admin/system/user/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:15', 1, '2019-07-02 21:08:15', NULL, b'0');
INSERT INTO `sys_log` VALUES (6044, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.eports.ms.controller.system.RoleController.list', '[]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '\"admin/system/role/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:16', 1, '2019-07-02 21:08:16', NULL, b'0');
INSERT INTO `sys_log` VALUES (6045, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.eports.ms.controller.system.MenuController.list', '[{}]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '\"admin/system/menu/test\"', 4, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:17', 1, '2019-07-02 21:08:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6046, '普通请求', '跳转网站展示页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/site/show', 'GET', 'com.eports.ms.controller.system.SiteController.show', '[{}]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '\"admin/system/site/show\"', 26, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:18', 1, '2019-07-02 21:08:18', NULL, b'0');
INSERT INTO `sys_log` VALUES (6047, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.eports.ms.controller.system.TableController.list', '[]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '\"admin/system/table/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:19', 1, '2019-07-02 21:08:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (6048, 'Ajax请求', '删除角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/delete', 'POST', 'com.eports.ms.controller.system.RoleController.delete', '[5]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '{\"success\":true,\"message\":\"成功\"}', 57, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:29', 1, '2019-07-02 21:08:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (6049, 'Ajax请求', '删除角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/delete', 'POST', 'com.eports.ms.controller.system.RoleController.delete', '[8]', '077be621-f9b8-428d-90dc-6ae6be5bce77', '{\"success\":true,\"message\":\"成功\"}', 44, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:08:37', 1, '2019-07-02 21:08:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (6050, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@23f71a4e\"]', '68074bd0-cbc2-4613-8215-806554035422', '{\"success\":false,\"message\":\"验证码错误\"}', 10, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:13:47', NULL, '2019-07-02 21:13:47', NULL, b'0');
INSERT INTO `sys_log` VALUES (6051, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@741c48d5\"]', '68074bd0-cbc2-4613-8215-806554035422', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:13:54', NULL, '2019-07-02 21:13:54', NULL, b'0');
INSERT INTO `sys_log` VALUES (6052, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@231e4582\"]', '68074bd0-cbc2-4613-8215-806554035422', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 589, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:14:04', 1, '2019-07-02 21:14:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6053, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/user/list\"', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:14:04', 1, '2019-07-02 21:14:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6054, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/role/list\"', 5, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:14:04', 1, '2019-07-02 21:14:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6055, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:14:04', 1, '2019-07-02 21:14:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6056, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.back.ms.controller.system.TableController.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/table/list\"', 5, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:14:04', 1, '2019-07-02 21:14:04', NULL, b'0');
INSERT INTO `sys_log` VALUES (6057, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/user/list\"', 5, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:17:17', 1, '2019-07-02 21:17:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6058, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/role/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:17:30', 1, '2019-07-02 21:17:30', NULL, b'0');
INSERT INTO `sys_log` VALUES (6059, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/menu/test\"', 5, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:17:37', 1, '2019-07-02 21:17:37', NULL, b'0');
INSERT INTO `sys_log` VALUES (6060, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.back.ms.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":1,\"menuSet\":[{\"delFlag\":false,\"id\":400,\"sort\":30},{\"delFlag\":false,\"id\":225,\"sort\":30},{\"delFlag\":false,\"id\":241,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":254,\"sort\":30},{\"delFlag\":false,\"id\":435,\"sort\":30},{\"delFlag\":false,\"id\":251,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":600,\"sort\":30},{\"delFlag\":false,\"id\":223,\"sort\":30},{\"delFlag\":false,\"id\":421,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":250,\"sort\":30},{\"delFlag\":false,\"id\":620,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":266,\"sort\":30},{\"delFlag\":false,\"id\":100,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":261,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":442,\"sort\":30},{\"delFlag\":false,\"id\":440,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":270,\"sort\":30},{\"delFlag\":false,\"id\":322,\"sort\":30},{\"delFlag\":false,\"id\":412,\"sort\":30},{\"delFlag\":false,\"id\":904,\"sort\":30},{\"delFlag\":false,\"id\":640,\"sort\":30},{\"delFlag\":false,\"id\":433,\"sort\":30},{\"delFlag\":false,\"id\":413,\"sort\":30},{\"delFlag\":false,\"id\":234,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":212,\"sort\":30},{\"delFlag\":false,\"id\":243,\"sort\":30},{\"delFlag\":false,\"id\":434,\"sort\":30},{\"delFlag\":false,\"id\":900,\"sort\":30},{\"delFlag\":false,\"id\":905,\"sort\":30},{\"delFlag\":false,\"id\":200,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":443,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":416,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":321,\"sort\":30},{\"delFlag\":false,\"id\":211,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":431,\"sort\":30},{\"delFlag\":false,\"id\":252,\"sort\":30},{\"delFlag\":false,\"id\":263,\"sort\":30},{\"delFlag\":false,\"id\":541,\"sort\":30},{\"delFlag\":false,\"id\":120,\"sort\":30},{\"delFlag\":false,\"id\":610,\"sort\":30},{\"delFlag\":false,\"id\":320,\"sort\":30},{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":311,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":230,\"sort\":30},{\"delFlag\":false,\"id\":233,\"sort\":30},{\"delFlag\":false,\"id\":264,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":130,\"sort\":30},{\"delFlag\":false,\"id\":323,\"sort\":30},{\"delFlag\":false,\"id\":414,\"sort\":30},{\"delFlag\":false,\"id\":436,\"sort\":30},{\"delFlag\":false,\"id\":103,\"sort\":30},{\"delFlag\":false,\"id\":420,\"sort\":30},{\"delFlag\":false,\"id\":110,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":630,\"sort\":30},{\"delFlag\":false,\"id\":210,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":231,\"sort\":30},{\"delFlag\":false,\"id\":310,\"sort\":30},{\"delFlag\":false,\"id\":411,\"sort\":30},{\"delFlag\":false,\"id\":239,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":441,\"sort\":30},{\"delFlag\":false,\"id\":237,\"sort\":30},{\"delFlag\":false,\"id\":224,\"sort\":30},{\"delFlag\":false,\"id\":236,\"sort\":30},{\"delFlag\":false,\"id\":222,\"sort\":30},{\"delFlag\":false,\"id\":432,\"sort\":30},{\"delFlag\":false,\"id\":253,\"sort\":30},{\"delFlag\":false,\"id\":430,\"sort\":30},{\"delFlag\":false,\"id\":265,\"sort\":30},{\"delFlag\":false,\"id\":238,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":221,\"sort\":30},{\"delFlag\":false,\"id\":444,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":540,\"sort\":30},{\"delFlag\":false,\"id\":220,\"sort\":30},{\"delFlag\":false,\"id\":542,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":232,\"sort\":30},{\"delFlag\":false,\"id\":260,\"sort\":30},{\"delFlag\":false,\"id\":543,\"sort\":30},{\"delFlag\":false,\"id\":240,\"sort\":30},{\"delFlag\":false,\"id\":213,\"sort\":30},{\"delFlag\":false,\"id\":242,\"sort\":30},{\"delFlag\":false,\"id\":102,\"sort\":30},{\"delFlag\":false,\"id\":262,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":101,\"sort\":30},{\"delFlag\":false,\"id\":415,\"sort\":30},{\"delFlag\":false,\"id\":410,\"sort\":30},{\"delFlag\":false,\"id\":300,\"sort\":30}],\"name\":\"老司机123123\",\"remarks\":\"\"}]', '68074bd0-cbc2-4613-8215-806554035422', '{\"success\":true,\"message\":\"成功\"}', 95, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:18:43', 1, '2019-07-02 21:18:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6061, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:18:45', 1, '2019-07-02 21:18:45', NULL, b'0');
INSERT INTO `sys_log` VALUES (6062, 'Ajax请求', '保存编辑角色数据', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/edit', 'POST', 'com.back.ms.controller.system.RoleController.edit', '[{\"delFlag\":false,\"id\":1,\"menuSet\":[{\"delFlag\":false,\"id\":36,\"sort\":30},{\"delFlag\":false,\"id\":35,\"sort\":30},{\"delFlag\":false,\"id\":416,\"sort\":30},{\"delFlag\":false,\"id\":412,\"sort\":30},{\"delFlag\":false,\"id\":443,\"sort\":30},{\"delFlag\":false,\"id\":1,\"sort\":30},{\"delFlag\":false,\"id\":62,\"sort\":30},{\"delFlag\":false,\"id\":242,\"sort\":30},{\"delFlag\":false,\"id\":263,\"sort\":30},{\"delFlag\":false,\"id\":444,\"sort\":30},{\"delFlag\":false,\"id\":540,\"sort\":30},{\"delFlag\":false,\"id\":541,\"sort\":30},{\"delFlag\":false,\"id\":431,\"sort\":30},{\"delFlag\":false,\"id\":9,\"sort\":30},{\"delFlag\":false,\"id\":240,\"sort\":30},{\"delFlag\":false,\"id\":542,\"sort\":30},{\"delFlag\":false,\"id\":60,\"sort\":30},{\"delFlag\":false,\"id\":19,\"sort\":30},{\"delFlag\":false,\"id\":414,\"sort\":30},{\"delFlag\":false,\"id\":260,\"sort\":30},{\"delFlag\":false,\"id\":29,\"sort\":30},{\"delFlag\":false,\"id\":266,\"sort\":30},{\"delFlag\":false,\"id\":8,\"sort\":30},{\"delFlag\":false,\"id\":220,\"sort\":30},{\"delFlag\":false,\"id\":433,\"sort\":30},{\"delFlag\":false,\"id\":25,\"sort\":30},{\"delFlag\":false,\"id\":210,\"sort\":30},{\"delFlag\":false,\"id\":110,\"sort\":30},{\"delFlag\":false,\"id\":436,\"sort\":30},{\"delFlag\":false,\"id\":30,\"sort\":30},{\"delFlag\":false,\"id\":17,\"sort\":30},{\"delFlag\":false,\"id\":33,\"sort\":30},{\"delFlag\":false,\"id\":37,\"sort\":30},{\"delFlag\":false,\"id\":300,\"sort\":30},{\"delFlag\":false,\"id\":239,\"sort\":30},{\"delFlag\":false,\"id\":55,\"sort\":30},{\"delFlag\":false,\"id\":5,\"sort\":30},{\"delFlag\":false,\"id\":243,\"sort\":30},{\"delFlag\":false,\"id\":223,\"sort\":30},{\"delFlag\":false,\"id\":253,\"sort\":30},{\"delFlag\":false,\"id\":236,\"sort\":30},{\"delFlag\":false,\"id\":310,\"sort\":30},{\"delFlag\":false,\"id\":3,\"sort\":30},{\"delFlag\":false,\"id\":31,\"sort\":30},{\"delFlag\":false,\"id\":421,\"sort\":30},{\"delFlag\":false,\"id\":311,\"sort\":30},{\"delFlag\":false,\"id\":232,\"sort\":30},{\"delFlag\":false,\"id\":251,\"sort\":30},{\"delFlag\":false,\"id\":265,\"sort\":30},{\"delFlag\":false,\"id\":237,\"sort\":30},{\"delFlag\":false,\"id\":400,\"sort\":30},{\"delFlag\":false,\"id\":434,\"sort\":30},{\"delFlag\":false,\"id\":231,\"sort\":30},{\"delFlag\":false,\"id\":420,\"sort\":30},{\"delFlag\":false,\"id\":24,\"sort\":30},{\"delFlag\":false,\"id\":264,\"sort\":30},{\"delFlag\":false,\"id\":440,\"sort\":30},{\"delFlag\":false,\"id\":102,\"sort\":30},{\"delFlag\":false,\"id\":640,\"sort\":30},{\"delFlag\":false,\"id\":254,\"sort\":30},{\"delFlag\":false,\"id\":600,\"sort\":30},{\"delFlag\":false,\"id\":61,\"sort\":30},{\"delFlag\":false,\"id\":905,\"sort\":30},{\"delFlag\":false,\"id\":103,\"sort\":30},{\"delFlag\":false,\"id\":224,\"sort\":30},{\"delFlag\":false,\"id\":34,\"sort\":30},{\"delFlag\":false,\"id\":21,\"sort\":30},{\"delFlag\":false,\"id\":18,\"sort\":30},{\"delFlag\":false,\"id\":620,\"sort\":30},{\"delFlag\":false,\"id\":130,\"sort\":30},{\"delFlag\":false,\"id\":430,\"sort\":30},{\"delFlag\":false,\"id\":28,\"sort\":30},{\"delFlag\":false,\"id\":441,\"sort\":30},{\"delFlag\":false,\"id\":101,\"sort\":30},{\"delFlag\":false,\"id\":435,\"sort\":30},{\"delFlag\":false,\"id\":27,\"sort\":30},{\"delFlag\":false,\"id\":22,\"sort\":30},{\"delFlag\":false,\"id\":904,\"sort\":30},{\"delFlag\":false,\"id\":900,\"sort\":30},{\"delFlag\":false,\"id\":261,\"sort\":30},{\"delFlag\":false,\"id\":213,\"sort\":30},{\"delFlag\":false,\"id\":212,\"sort\":30},{\"delFlag\":false,\"id\":415,\"sort\":30},{\"delFlag\":false,\"id\":230,\"sort\":30},{\"delFlag\":false,\"id\":6,\"sort\":30},{\"delFlag\":false,\"id\":23,\"sort\":30},{\"delFlag\":false,\"id\":322,\"sort\":30},{\"delFlag\":false,\"id\":610,\"sort\":30},{\"delFlag\":false,\"id\":53,\"sort\":30},{\"delFlag\":false,\"id\":234,\"sort\":30},{\"delFlag\":false,\"id\":221,\"sort\":30},{\"delFlag\":false,\"id\":320,\"sort\":30},{\"delFlag\":false,\"id\":630,\"sort\":30},{\"delFlag\":false,\"id\":100,\"sort\":30},{\"delFlag\":false,\"id\":54,\"sort\":30},{\"delFlag\":false,\"id\":26,\"sort\":30},{\"delFlag\":false,\"id\":321,\"sort\":30},{\"delFlag\":false,\"id\":7,\"sort\":30},{\"delFlag\":false,\"id\":238,\"sort\":30},{\"delFlag\":false,\"id\":233,\"sort\":30},{\"delFlag\":false,\"id\":20,\"sort\":30},{\"delFlag\":false,\"id\":4,\"sort\":30},{\"delFlag\":false,\"id\":211,\"sort\":30},{\"delFlag\":false,\"id\":411,\"sort\":30},{\"delFlag\":false,\"id\":200,\"sort\":30},{\"delFlag\":false,\"id\":252,\"sort\":30},{\"delFlag\":false,\"id\":270,\"sort\":30},{\"delFlag\":false,\"id\":250,\"sort\":30},{\"delFlag\":false,\"id\":241,\"sort\":30},{\"delFlag\":false,\"id\":543,\"sort\":30},{\"delFlag\":false,\"id\":120,\"sort\":30},{\"delFlag\":false,\"id\":225,\"sort\":30},{\"delFlag\":false,\"id\":2,\"sort\":30},{\"delFlag\":false,\"id\":442,\"sort\":30},{\"delFlag\":false,\"id\":222,\"sort\":30},{\"delFlag\":false,\"id\":410,\"sort\":30},{\"delFlag\":false,\"id\":32,\"sort\":30},{\"delFlag\":false,\"id\":262,\"sort\":30},{\"delFlag\":false,\"id\":413,\"sort\":30},{\"delFlag\":false,\"id\":323,\"sort\":30},{\"delFlag\":false,\"id\":432,\"sort\":30}],\"name\":\"老司机123123\",\"remarks\":\"\"}]', '68074bd0-cbc2-4613-8215-806554035422', '{\"success\":true,\"message\":\"成功\"}', 61, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:19:05', 1, '2019-07-02 21:19:05', NULL, b'0');
INSERT INTO `sys_log` VALUES (6063, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:19:06', 1, '2019-07-02 21:19:06', NULL, b'0');
INSERT INTO `sys_log` VALUES (6064, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.back.ms.controller.LoginController.logOut', '[]', '68074bd0-cbc2-4613-8215-806554035422', '\"redirect:/login\"', 19, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:19:09', NULL, '2019-07-02 21:19:09', NULL, b'0');
INSERT INTO `sys_log` VALUES (6065, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@28c5cc8d\"]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '{\"success\":false,\"message\":\"验证码错误\"}', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:19:11', NULL, '2019-07-02 21:19:11', NULL, b'0');
INSERT INTO `sys_log` VALUES (6066, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@177ad204\"]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 71, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:19:19', 1, '2019-07-02 21:19:19', NULL, b'0');
INSERT INTO `sys_log` VALUES (6067, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.back.ms.controller.system.RescourceController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/rescource/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:29', 1, '2019-07-02 21:20:29', NULL, b'0');
INSERT INTO `sys_log` VALUES (6068, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.back.ms.controller.system.TableController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/table/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:42', 1, '2019-07-02 21:20:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (6069, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:48', 1, '2019-07-02 21:20:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (6070, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:48', 1, '2019-07-02 21:20:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (6071, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/user/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:49', 1, '2019-07-02 21:20:49', NULL, b'0');
INSERT INTO `sys_log` VALUES (6072, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.back.ms.controller.system.DictController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/dict/list\"', 3, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:20:52', 1, '2019-07-02 21:20:52', NULL, b'0');
INSERT INTO `sys_log` VALUES (6073, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.back.ms.controller.system.RescourceController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/rescource/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:42', 1, '2019-07-02 21:21:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (6074, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.back.ms.controller.system.TableController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/table/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:42', 1, '2019-07-02 21:21:42', NULL, b'0');
INSERT INTO `sys_log` VALUES (6075, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:43', 1, '2019-07-02 21:21:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6076, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.back.ms.controller.system.DictController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/dict/list\"', 0, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:43', 1, '2019-07-02 21:21:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6077, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:43', 1, '2019-07-02 21:21:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6078, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"admin/system/user/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:43', 1, '2019-07-02 21:21:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6079, '普通请求', '退出系统', '127.0.0.1', '我是管理员', 'http://localhost:8080/systemLogout', 'GET', 'com.back.ms.controller.LoginController.logOut', '[]', '8f4bd1fc-94b2-47c6-840a-391c447c3d76', '\"redirect:/login\"', 8, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:21:48', NULL, '2019-07-02 21:21:48', NULL, b'0');
INSERT INTO `sys_log` VALUES (6080, 'Ajax请求', '用户登录', '127.0.0.1', NULL, 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@68a4dd50\"]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '{\"success\":false,\"message\":\"验证码错误\"}', 0, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 21:21:50', NULL, '2019-07-02 21:21:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6081, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@5962d4aa\"]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 42, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:21:58', 1, '2019-07-02 21:21:58', NULL, b'0');
INSERT INTO `sys_log` VALUES (6082, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/user/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:12', 1, '2019-07-02 21:22:12', NULL, b'0');
INSERT INTO `sys_log` VALUES (6083, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:13', 1, '2019-07-02 21:22:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (6084, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:13', 1, '2019-07-02 21:22:13', NULL, b'0');
INSERT INTO `sys_log` VALUES (6085, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.back.ms.controller.system.RescourceController.list', '[]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/rescource/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:17', 1, '2019-07-02 21:22:17', NULL, b'0');
INSERT INTO `sys_log` VALUES (6086, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.back.ms.controller.system.TableController.list', '[]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/table/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:21', 1, '2019-07-02 21:22:21', NULL, b'0');
INSERT INTO `sys_log` VALUES (6087, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.back.ms.controller.system.DictController.list', '[]', '9e1a2546-8edf-43bc-950e-a8ecd9f8e8d0', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 21:22:26', 1, '2019-07-02 21:22:26', NULL, b'0');
INSERT INTO `sys_log` VALUES (6088, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@18063f79\"]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '{\"success\":false,\"message\":\"验证码错误\"}', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:43', 1, '2019-07-02 22:50:43', NULL, b'0');
INSERT INTO `sys_log` VALUES (6089, 'Ajax请求', '用户登录', '127.0.0.1', '我是管理员', 'http://localhost:8080/login/main', 'POST', 'com.back.ms.controller.LoginController.loginMain', '[\"org.apache.shiro.web.servlet.ShiroHttpServletRequest@12270e41\"]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '{\"data\":{\"url\":\"index\"},\"success\":true,\"message\":\"登录成功\"}', 18, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6090, '普通请求', '跳转系统用户列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/user/list', 'GET', 'com.back.ms.controller.system.UserConteroller.list', '[]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/user/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6091, '普通请求', '跳转角色列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/role/list', 'GET', 'com.back.ms.controller.system.RoleController.list', '[]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/role/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6092, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/menu/test\"', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6093, '普通请求', '跳转资源展示列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/rescource/list', 'GET', 'com.back.ms.controller.system.RescourceController.list', '[]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/rescource/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6094, '普通请求', '跳转数据表列表页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/table/list', 'GET', 'com.back.ms.controller.system.TableController.list', '[]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/table/list\"', 2, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6095, '普通请求', '跳转系统字典页面', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/dict/list', 'GET', 'com.back.ms.controller.system.DictController.list', '[]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/dict/list\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 22:50:50', 1, '2019-07-02 22:50:50', NULL, b'0');
INSERT INTO `sys_log` VALUES (6096, '普通请求', '跳转菜单列表', '127.0.0.1', '我是管理员', 'http://localhost:8080/admin/system/menu/list', 'GET', 'com.back.ms.controller.system.MenuController.list', '[{}]', 'bc329eac-4417-4d5c-9eb7-b5f021f3bba2', '\"admin/system/menu/test\"', 1, 'Windows-Chrome-75.0.3770.100', NULL, NULL, NULL, NULL, NULL, '1', '2019-07-02 23:50:51', 1, '2019-07-02 23:50:51', NULL, b'0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 907 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', NULL, 1, '1,', 10000, '', NULL, '', NULL, 1, '', 1, '2018-01-16 11:29:46', 1, '2018-01-20 03:09:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (2, '系统用户管理', 1, 2, '1,2,', 9, '/admin/system/user/list', NULL, '', '#47e69c', 1, 'sys:user:list', 1, '2018-01-16 11:31:18', 1, '2018-01-20 05:59:20', NULL, 0);
INSERT INTO `sys_menu` VALUES (3, '系统角色管理', 1, 2, '1,3,', 10, '/admin/system/role/list', NULL, '', '#c23ab9', 1, 'sys:role:list', 1, '2018-01-16 11:32:33', 1, '2018-01-20 05:58:58', NULL, 0);
INSERT INTO `sys_menu` VALUES (4, '系统权限管理', 1, 2, '1,4,', 20, '/admin/system/menu/list', NULL, '', '#d4573b', 1, 'sys:menu:list', 1, '2018-01-16 11:33:19', 1, '2018-02-08 09:49:28', NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '系统资源管理', 1, 2, '1,5,', 30, '/admin/system/rescource/list', NULL, '', '#f5e42a', 1, 'sys:rescource:list', 1, '2018-01-16 11:34:48', 1, '2018-01-20 05:56:35', NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '系统日志管理', 1, 2, '1,6,', 40, '/admin/system/log/list', NULL, '', '#b56c18', 1, 'sys:log:list', 1, '2018-01-16 11:35:31', 1, '2018-01-20 05:12:17', NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '网站基本信息', 1, 2, '1,7,', 50, '/admin/system/site/show', NULL, '', '#95deb9', 1, 'sys:site:list', 1, '2018-01-16 11:36:50', 1, '2018-01-20 05:55:44', NULL, 0);
INSERT INTO `sys_menu` VALUES (8, '数据库管理', 1, 2, '1,8,', 60, '/admin/system/table/list', NULL, '', '#369e16', 1, 'sys:table:list', 1, '2018-01-16 11:38:29', 1, '2018-01-20 03:14:23', NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '系统字典管理', 1, 2, '1,9,', 70, '/admin/system/dict/list', NULL, '', '#1bbcc2', 1, 'sys:dict:list', 1, '2018-01-16 14:51:52', 1, '2018-01-20 03:12:27', NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '新增字典', 9, 3, '1,9,17,', 0, '', NULL, NULL, NULL, 0, 'sys:dict:add', 1, '2018-02-08 09:39:09', 1, '2018-02-08 09:39:19', NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '编辑字典', 9, 3, '1,9,18,', 10, '', NULL, NULL, NULL, 0, 'sys:dict:edit', 1, '2018-02-08 09:40:37', 1, '2018-02-08 09:40:46', NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '编辑字典类型', 9, 3, '1,9,19,', 20, '', NULL, NULL, NULL, 0, 'sys:dict:editType', 1, '2018-02-08 09:42:46', 1, '2018-02-08 09:54:07', NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '新增系统权限', 4, 3, '1,4,20,', 0, '', NULL, NULL, NULL, 0, 'sys:menu:add', 1, '2018-02-08 09:49:15', 1, '2018-02-08 09:49:38', NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '编辑系统权限', 4, 3, '1,4,21,', 10, '', NULL, NULL, NULL, 0, 'sys:menu:edit', 1, '2018-02-08 09:50:16', 1, '2018-02-08 09:50:25', NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '删除系统权限', 4, 3, '1,4,22,', 20, '', NULL, NULL, NULL, 0, 'sys:menu:delete', 1, '2018-02-08 09:51:53', 1, '2018-02-08 09:53:42', NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '删除系统资源', 5, 3, '1,5,23,', 0, '', NULL, NULL, NULL, 0, 'sys:rescource:delete', 1, '2018-02-08 09:56:44', 1, '2018-02-08 09:56:53', NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '新增系统角色', 3, 3, '1,3,24,', 0, '', NULL, NULL, NULL, 0, 'sys:role:add', 1, '2018-02-08 09:58:11', 1, '2018-02-08 09:58:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (25, '编辑菜单权限', 3, 3, '1,3,25,', 10, '', NULL, NULL, NULL, 0, 'sys:role:edit', 1, '2018-02-08 09:59:01', 1, '2018-02-08 09:59:01', NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '删除角色', 3, 3, '1,3,26,', 20, '', NULL, NULL, NULL, 0, 'sys:role:delete', 1, '2018-02-08 09:59:56', 1, '2018-02-08 09:59:56', NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '编辑系统信息', 7, 3, '1,7,27,', 0, '', NULL, NULL, NULL, 0, 'sys:site:edit', 1, '2018-02-08 10:01:40', 1, '2018-02-08 10:01:40', NULL, 0);
INSERT INTO `sys_menu` VALUES (28, '数据库新增', 8, 3, '1,8,28,', 0, '', NULL, NULL, NULL, 0, 'sys:table:add', 1, '2018-02-08 10:02:51', 1, '2018-02-08 10:02:51', NULL, 0);
INSERT INTO `sys_menu` VALUES (29, '编辑数据库', 8, 3, '1,8,29,', 10, '', NULL, NULL, NULL, 0, 'sys:table:edit', 1, '2018-02-08 10:03:58', 1, '2018-02-08 10:03:58', NULL, 0);
INSERT INTO `sys_menu` VALUES (30, '新增数据库字段', 8, 3, '1,8,30,', 20, '', NULL, NULL, NULL, 0, 'sys:table:addField', 1, '2018-02-08 10:05:11', 1, '2018-02-08 10:05:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (31, '编辑数据库字段', 8, 3, '1,8,31,', 30, '', NULL, NULL, NULL, 0, 'sys:table:editField', 1, '2018-02-08 10:05:47', 1, '2018-02-08 10:05:47', NULL, 0);
INSERT INTO `sys_menu` VALUES (32, '删除数据库字段', 8, 3, '1,8,32,', 40, '', NULL, NULL, NULL, 0, 'sys:table:deleteField', 1, '2018-02-08 10:07:29', 1, '2018-02-08 10:15:39', NULL, 0);
INSERT INTO `sys_menu` VALUES (33, '删除数据库', 8, 3, '1,8,33,', 50, '', NULL, NULL, NULL, 0, 'sys:table:deleteTable', 1, '2018-02-08 10:08:16', 1, '2018-02-08 10:08:16', NULL, 0);
INSERT INTO `sys_menu` VALUES (34, '下载源码', 8, 3, '1,8,34,', 60, '', NULL, NULL, NULL, 0, 'sys:table:download', 1, '2018-02-08 10:09:28', 1, '2018-02-08 10:09:28', NULL, 0);
INSERT INTO `sys_menu` VALUES (35, '新增系统用户', 2, 3, '1,2,35,', 0, '', NULL, NULL, NULL, 0, 'sys:user:add', 1, '2018-02-08 10:10:32', 1, '2018-02-08 10:10:32', NULL, 0);
INSERT INTO `sys_menu` VALUES (36, '编辑系统用户', 2, 3, '1,2,36,', 10, '', NULL, NULL, NULL, 0, 'sys:user:edit', 1, '2018-02-08 10:11:49', 1, '2018-02-08 10:11:49', NULL, 0);
INSERT INTO `sys_menu` VALUES (37, '删除系统用户', 2, 3, '1,2,37,', 20, '', NULL, NULL, NULL, 0, 'sys:user:delete', 1, '2018-02-08 10:12:43', 1, '2018-02-08 10:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES (51, '立即执行运行任务', 15, 3, '14,15,51,', 50, '', NULL, NULL, NULL, 0, 'quartz:task:run', 1, '2018-02-08 10:36:55', 1, '2019-07-01 14:48:20', NULL, 1);
INSERT INTO `sys_menu` VALUES (52, '删除定时任务日志', 16, 3, '14,16,52,', 0, '', NULL, NULL, NULL, 0, 'quartz:log:delete', 1, '2018-02-08 10:39:04', 1, '2019-07-01 14:48:10', NULL, 1);
INSERT INTO `sys_menu` VALUES (53, '修改密码', 2, 3, '1,2,53,', 30, '', NULL, '', NULL, 0, 'sys:user:changePassword', 1, '2018-03-15 10:14:06', 1, '2018-03-15 10:14:06', NULL, 0);
INSERT INTO `sys_menu` VALUES (54, '删除字典', 9, 3, '1,9,54,', 30, '', NULL, NULL, NULL, 0, 'sys:dict:delete', 1, '2018-03-15 10:16:55', 1, '2018-03-15 10:16:55', NULL, 0);
INSERT INTO `sys_menu` VALUES (55, '系统日志删除', 6, 3, '1,6,55,', 0, '', NULL, NULL, NULL, 0, 'system:logs:delete', 1, '2018-06-16 04:30:32', 1, '2018-06-16 04:30:32', NULL, 0);
INSERT INTO `sys_menu` VALUES (60, 'Druid数据监控', 1, 2, '1,60,', 25, '/admin/druid/list', NULL, '', '#7e8755', 1, 'sys:druid:list', 1, '2018-06-16 05:06:17', 1, '2018-06-16 05:06:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (61, '七牛云存储信息', 7, 3, '1,7,61,', 10, '', NULL, NULL, NULL, 0, 'sys:site:editQiniu', 1, '2018-07-12 18:46:39', 1, '2018-07-12 18:46:39', NULL, 0);
INSERT INTO `sys_menu` VALUES (62, '阿里云信息存储', 7, 3, '1,7,62,', 20, '', NULL, NULL, NULL, 0, 'sys:site:editOss', 1, '2018-07-12 18:47:05', 1, '2018-07-12 18:47:05', NULL, 0);
INSERT INTO `sys_menu` VALUES (100, '图文与专题', NULL, 1, '100,', 10, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (101, '新闻滚动图', 100, 2, '100,101,', 40, 'http://adms.e-ports-ms.com:8080/newsSet/newsBannerList', NULL, '', '', 1, '', 1, '2019-06-05 17:24:15', 1, '2019-06-17 13:49:05', NULL, 0);
INSERT INTO `sys_menu` VALUES (102, '新闻类别', 100, 2, '100,102,', 50, 'http://adms.e-ports-ms.com:8080/newsSet/list', NULL, '', '', 1, '', 1, '2019-06-05 17:24:57', 1, '2019-06-05 17:24:57', NULL, 0);
INSERT INTO `sys_menu` VALUES (103, '首页滚动页', 100, 2, '100,103,', 60, 'http://adms.e-ports-ms.com:8080/homeBanner/list', NULL, '', '', 1, '', 1, '2019-06-05 17:26:04', 1, '2019-06-11 13:50:37', NULL, 0);
INSERT INTO `sys_menu` VALUES (110, '文章管理', 100, 2, '100,110,', 10, 'http://adms.e-ports-ms.com:8080/news/list', NULL, '', '#47e69c', 1, '', 1, '2019-05-01 11:11:11', 1, '2019-06-05 15:02:55', NULL, 0);
INSERT INTO `sys_menu` VALUES (120, '图库管理', 100, 2, '100,120,', 20, 'http://adms.e-ports-ms.com:8080/imageGroup/list', NULL, '', '#c23ab9', 1, '', 1, '2019-05-01 11:11:11', 1, '2019-06-05 15:04:47', NULL, 0);
INSERT INTO `sys_menu` VALUES (130, '专题管理', 100, 2, '100,130,', 30, 'http://adms.e-ports-ms.com:8080/subject/list', NULL, '', '#d4573b', 1, 'todo', 1, '2019-05-01 11:11:11', 1, '2019-06-05 15:05:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (200, '基础数据管理', NULL, 1, '200,', 20, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (210, '船舶管理', 200, 2, '200,210,', 10, 'http://adms.e-ports-ms.com:8080/ship/list', NULL, '', '#f5e42a', 1, 'adms:ship:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (211, '添加船舶', 210, 3, '200,210,211,', 10, '', NULL, '', '#f5e42a', 0, 'adms:ship:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (212, '编辑船舶', 210, 3, '200,210,212,', 20, '', NULL, '', '#f5e42a', 0, 'adms:ship:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (213, '删除船舶', 210, 3, '200,210,213,', 30, '', NULL, '', '#f5e42a', 0, 'adms:ship:del', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (220, '港口管理', 200, 2, '200,220,', 20, 'http://adms.e-ports-ms.com:8080/port/list', NULL, '', '#b56c18', 1, 'adms:port:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (221, '查看港口', 220, 3, '200,220,221,', 10, '', NULL, '', '', 0, 'adms:port:detail', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (222, '添加港口', 220, 3, '200,220,222,', 20, '', NULL, '', '', 0, 'adms:port:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (223, '删除港口', 220, 3, '200,220,223,', 30, '', NULL, '', '', 0, 'adms:port:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (224, '编辑港口', 220, 3, '200,220,224,', 40, '', NULL, '', '', 0, 'adms:port:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (225, '添加港区', 220, 3, '200,220,225,', 50, '', NULL, '', '', 0, 'adms:terminal:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (230, '编辑泊位', 220, 3, '200,220,230,', 100, '', NULL, '', '', 0, 'adms:berth:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (231, '添加锚地', 220, 3, '200,220,231,', 110, '', NULL, '', '', 0, 'adms:anchorage:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (232, '删除锚地', 220, 3, '200,220,232,', 120, '', NULL, '', '', 0, 'adms:anchorage:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (233, '编辑锚地', 220, 3, '200,220,233,', 130, '', NULL, '', '', 0, 'adms:anchorage:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (234, '船东事务', 220, 3, '200,220,234,', 140, '', NULL, '', '', 0, 'adms:husbandrymatter:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (236, '删除港区', 220, 3, '200,220,236,', 60, '', NULL, '', '', 0, 'adms:terminal:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (237, '编辑港区', 220, 3, '200,220,237,', 70, '', NULL, '', '', 0, 'adms:terminal:edit', 1, '2019-05-01 11:11:11', 1, '2019-04-11 16:41:50', NULL, 0);
INSERT INTO `sys_menu` VALUES (238, '添加泊位', 220, 3, '200,220,238,', 80, '', NULL, '', '', 0, 'adms:berth:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (239, '删除泊位', 220, 3, '200,220,239,', 90, '', NULL, '', '', 0, 'adms:berth:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (240, '公司管理', 200, 2, '200,240,', 40, 'http://adms.e-ports-ms.com:8080/account/list', NULL, '', '#f5e42a', 1, 'adms:account:list', 1, '2019-05-01 11:11:11', 1, '2019-04-10 10:25:02', NULL, 0);
INSERT INTO `sys_menu` VALUES (241, '编辑公司', 240, 3, '200,240,241,', 10, '', NULL, '', '', 0, 'adms:account:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (242, '审核公司', 240, 3, '200,240,242,', 20, '', NULL, '', '', 0, 'adms:account:audit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (243, '推荐公司', 240, 3, '200,240,243,', 30, '', NULL, '', '', 0, 'adms:account:rec', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (250, '船厂管理', 200, 2, '200,250,', 50, 'http://adms.e-ports-ms.com:8080/shipyard/list', NULL, '', '#b56c18', 1, 'adms:shipyard:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (251, '查看船厂', 250, 3, '200,250,251,', 10, '', NULL, '', '', 0, 'adms:shipyard:detail', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (252, '新增船厂', 250, 3, '200,250,252,', 20, '', NULL, '', '', 0, 'adms:shipyard:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (253, '编辑船厂', 250, 3, '200,250,253,', 30, '', NULL, '', '', 0, 'adms:shipyard:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (254, '上传船厂', 250, 3, '200,250,254,', 40, '', NULL, '', '', 0, 'adms:shipyard:upload', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (255, '删除船厂', 250, 3, '200,250,255,', 40, '', NULL, '', '', 0, 'adms:shipyard:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (260, '航运规则', 200, 2, '260,', 60, 'http://adms.e-ports-ms.com:8080/regulation/list', NULL, '', '#f5e42a', 1, 'adms:regulation:list', 1, '2019-05-01 11:11:11', 1, '2019-04-10 11:50:07', NULL, 0);
INSERT INTO `sys_menu` VALUES (261, '添加规则', 260, 3, '200,260,261,', 0, '', NULL, NULL, NULL, 0, 'adms:regulation:add', 1, '2019-04-10 11:53:52', 1, '2019-04-10 11:53:52', NULL, 0);
INSERT INTO `sys_menu` VALUES (262, '编辑规则', 260, 3, '200,260,262,', 10, '', NULL, NULL, NULL, 0, 'adms:regulation:edit', 1, '2019-04-10 11:54:26', 1, '2019-04-10 11:54:26', NULL, 0);
INSERT INTO `sys_menu` VALUES (263, '删除规则', 260, 3, '200,260,263,', 20, '', NULL, NULL, NULL, 0, 'adms:regulation:delete', 1, '2019-04-10 11:56:04', 1, '2019-04-10 11:56:04', NULL, 0);
INSERT INTO `sys_menu` VALUES (264, '查看规则', 260, 3, '200,260,264,', 30, '', NULL, NULL, NULL, 0, 'adms:regulation:detail', 1, '2019-04-11 16:17:52', 1, '2019-04-11 16:17:52', NULL, 0);
INSERT INTO `sys_menu` VALUES (265, '发布规则', 260, 3, '200,260,265,', 40, '', NULL, NULL, NULL, 0, 'adms:regulation:publish', 1, '2019-04-16 09:53:38', 1, '2019-04-16 09:53:38', NULL, 0);
INSERT INTO `sys_menu` VALUES (266, '推荐规则', 260, 3, '200,260,266,', 50, '', NULL, NULL, NULL, 0, 'adms:regulation:recommend', 1, '2019-04-16 09:54:05', 1, '2019-04-16 09:54:05', NULL, 0);
INSERT INTO `sys_menu` VALUES (270, '船员管理', 200, 2, '270,', 70, 'todo', NULL, '', '#b56c18', 1, 'todo', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (300, '交易数据管理', NULL, 1, '300,', 30, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (310, '询价单管理', 300, 2, '300,310,', 10, 'http://adms.e-ports-ms.com:8080/orderInquiry/list', NULL, '', '#f5e42a', 1, 'adms:orderInquiry:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (311, '询价单导出', 310, 3, '300,310,311,', 10, '', NULL, '', '', 0, 'adms:orderInquiry:export', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (320, '订单管理', 300, 2, '300,320,', 20, 'http://adms.e-ports-ms.com:8080/order/list', NULL, '', '#f5e42a', 1, 'adms:order:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (321, '更换港口', 320, 3, '300,320,321,', 10, '', NULL, '', '', 0, 'adms:order:updatePort', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (322, '导出订单', 320, 3, '300,320,322,', 20, '', NULL, '', '', 0, 'adms:order:export', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (323, '转移订单', 320, 3, '300,320,323,', 30, '', NULL, '', '', 0, 'adms:order:transOrder', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (400, '航运工具管理', NULL, 1, '400,', 40, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (410, '计算器工具', 400, 2, '400,410,', 10, 'http://adms.e-ports-ms.com:8080/toolkit/list', NULL, '', '#f5e42a', 1, 'adms:toolkit:list', 1, '2019-05-01 11:11:11', 1, '2019-04-10 13:30:38', NULL, 0);
INSERT INTO `sys_menu` VALUES (411, '添加条目', 410, 3, '400,410,411,', 0, '', NULL, '', NULL, 0, 'adms:toolkitItem:add', 1, '2019-04-12 10:30:42', 1, '2019-04-12 10:33:13', NULL, 0);
INSERT INTO `sys_menu` VALUES (412, '添加自定义指标', 410, 3, '400,410,412,', 10, '', NULL, '', NULL, 0, 'adms:toolkitQuota:add', 1, '2019-04-12 10:32:28', 1, '2019-04-12 10:32:50', NULL, 0);
INSERT INTO `sys_menu` VALUES (413, '删除条目', 410, 3, '400,410,413,', 20, '', NULL, '', NULL, 0, 'adms:toolkitItem:del', 1, '2019-04-12 10:34:30', 1, '2019-04-12 10:34:30', NULL, 0);
INSERT INTO `sys_menu` VALUES (414, '修改条目', 410, 3, '400,410,414,', 30, '', NULL, '', NULL, 0, 'adms:toolkitItem:update', 1, '2019-04-12 10:35:14', 1, '2019-04-12 10:35:14', NULL, 0);
INSERT INTO `sys_menu` VALUES (415, '修改自定义指标', 410, 3, '400,410,415,', 40, '', NULL, '', NULL, 0, 'adms:toolkitQuota:update', 1, '2019-04-12 10:36:43', 1, '2019-04-12 10:36:43', NULL, 0);
INSERT INTO `sys_menu` VALUES (416, '删除自定义指标', 410, 3, '400,410,416,', 50, '', NULL, NULL, NULL, 0, 'adms:toolkitQuota:del', 1, '2019-04-12 10:37:29', 1, '2019-04-12 10:37:29', NULL, 0);
INSERT INTO `sys_menu` VALUES (420, '港口船期表', 400, 2, '400,420,', 20, 'http://adms.e-ports-ms.com:8080/lineUp/list', NULL, '', '#b56c18', 1, 'adms:lineUp:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (421, '上传船期', 420, 3, '400,420,421,', 10, '', NULL, '', '', 0, 'adms:lineUp:upload', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (430, '邀请函管理', 400, 2, '400,430,', 30, 'http://adms.e-ports-ms.com:8080/letter/list', NULL, '', '#b56c18', 1, 'adms:letter:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (431, '查看邀请函', 430, 3, '400,430,431,', 10, '', NULL, '', '', 0, 'adms:letter:detail', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (432, '编辑邀请函', 430, 3, '400,430,432,', 20, '', NULL, '', '', 0, 'adms:letter:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (433, '删除邀请函', 430, 3, '400,430,433,', 30, '', NULL, '', '', 0, 'adms:letter:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (434, '邀请函预览', 430, 3, '400,430,434,', 40, '', NULL, '', '', 0, 'adms:letter:view', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (435, '下载邀请函', 430, 3, '400,430,435,', 50, '', NULL, '', '', 0, 'adms:letter:export', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (436, '邀请函人员', 430, 3, '400,430,436,', 60, '', NULL, '', '', 0, 'adms:letterPeople:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (440, '邀请函模板', 400, 2, '400,440,', 40, 'http://adms.e-ports-ms.com:8080/letterModule/list', NULL, '', '#b56c18', 0, 'adms:letterModule:list', 1, '2019-05-01 11:11:11', 1, '2019-04-10 17:01:00', NULL, 0);
INSERT INTO `sys_menu` VALUES (441, '添加模板', 440, 3, '400,440,441,', 10, '', NULL, '', '', 0, 'adms:letterModule:add', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (442, '编辑模板', 440, 3, '400,440,442,', 20, '', NULL, '', '', 0, 'adms:letterModule:edit', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (443, '删除模板', 440, 3, '400,440,443,', 30, '', NULL, '', '', 0, 'adms:letterModule:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (444, '选择模板', 440, 3, '400,440,444,', 40, '', NULL, '', '', 0, 'adms:letterModule:choose', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (530, '电话客服', 500, 2, '500,530,', 30, 'http://adms.e-ports-ms.com:8080/helpTelService/list', NULL, '', '#f5e42a', 1, 'adms:helpTelService:list', 1, '2019-05-01 11:11:11', 1, '2019-07-01 14:48:15', NULL, 1);
INSERT INTO `sys_menu` VALUES (540, '意见建议', 500, 2, '500,540,', 40, 'http://adms.e-ports-ms.com:8080/helpSuggestion/list', NULL, '', '#f5e42a', 1, 'adms:helpSuggestion:list', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (541, '意见建议详情', 540, 3, '500,540,541,', 10, '', NULL, '', '', 0, 'adms:helpSuggestion:detail', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (542, '意见建议编辑', 540, 3, '500,540,542,', 20, '', NULL, '', '', 0, 'adms:helpSuggestion:process', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (543, '意见建议删除', 540, 3, '500,540,543,', 30, '', NULL, '', '', 0, 'adms:helpSuggestion:delete', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (600, '统计分析', NULL, 1, '500,', 60, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (610, '通用报表', 600, 2, '600,610,', 10, '/admin/report/chart', NULL, '', '#f5e42a', 1, 'admin:report:chart', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (620, '船舶统计', 600, 2, '600,620,', 20, 'http://adms.e-ports-ms.com:8080/report/shipStat', NULL, '', '#f5e42a', 1, 'adms:report:shipStat', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (630, '港口统计', 600, 2, '600,630,', 30, 'http://adms.e-ports-ms.com:8080/report/portStat', NULL, '', '#f5e42a', 1, 'adms:report:portStat', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (640, '用户注册统计', 600, 2, '600,640', 40, 'http://adms.e-ports-ms.com:8080/report/userStat', NULL, '', '', 1, 'adms:report:userStat', 1, '2019-06-11 13:49:32', 1, '2019-06-11 16:11:18', NULL, 0);
INSERT INTO `sys_menu` VALUES (700, '营销管理', NULL, 1, '600,', 70, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-07-01 14:48:26', NULL, 1);
INSERT INTO `sys_menu` VALUES (800, '财务管理', NULL, 1, '700,', 80, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-07-01 14:48:31', NULL, 1);
INSERT INTO `sys_menu` VALUES (900, '设置', NULL, 1, '800,', 90, '', NULL, '', NULL, 1, '', 1, '2019-05-01 11:11:11', 1, '2019-05-01 11:11:11', NULL, 0);
INSERT INTO `sys_menu` VALUES (904, '计算器统计数据', 600, 2, '500,904,', 40, 'http://adms.e-ports-ms.com:8080/toolkit/statistics/list', NULL, '', '', 1, '', 1, '2019-06-10 14:14:43', 1, '2019-06-10 14:16:10', NULL, 0);
INSERT INTO `sys_menu` VALUES (905, '合作伙伴', 100, 2, '100,905,', 70, 'http://adms.e-ports-ms.com:8080/partner/list', NULL, '', '', 1, '', 1, '2019-06-13 17:15:19', 1, '2019-06-13 17:15:19', NULL, 0);

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES (2, '77861034-25ef-4856-87ec-24da18398ecf.jpg', 'qiniu', 'https://static.mysiteforme.com/77861034-25ef-4856-87ec-24da18398ecf.jpg', 'FvRpJ_-DlF-eFJ4l28xVGVUsHRCX', '105kb', '.jpg', NULL, '2018-02-08 13:57:44', 1, '2018-02-08 13:57:44', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (3, '04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'qiniu', 'https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'FrJ5IUYX0zMw5HpDW4fUfNvMv4Q3', '329kb', '.jpg', NULL, '2018-02-08 13:59:06', 1, '2018-02-08 13:59:06', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (4, '3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'qiniu', 'https://static.mysiteforme.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'FpgHWPFgcyMX1lqNEDk8Pdnl3lsu', '228kb', '.jpg', NULL, '2018-03-13 12:54:36', 1, '2018-03-13 12:54:36', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (5, '2768865c-09c0-42cc-9fe3-c032c13e136d.jpg', 'local', '/static/upload/2768865c-09c0-42cc-9fe3-c032c13e136d.jpg', 'Fis47oE_4Ffq3N5jLHX34CigpNVu', '235kb', 'image/jpeg', NULL, '2019-04-12 11:56:14', 1, '2019-04-12 11:56:14', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (6, '79866461-7bb4-4e9b-a84f-4d5f59de8780.png', 'local', 'http://192.168.30.103:8888/group1/M00/00/22/wKgeZ1zc2sSAWCFCAALd5PnYniU064.png', 'Fr6TxaDftXWUvXNsFE8J0Nl0y8Or', '183kb', 'image/png', NULL, '2019-05-16 11:36:35', 1, '2019-05-16 11:36:35', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (7, '54a77f0d-364e-49d6-bf5f-d360a82b64d9.png', 'local', 'http://192.168.30.103:8888/group1/M00/00/22/wKgeZ1zc27WAMS7nAAAwMwsD2eA554.png', 'FqdMvkOrgj7EIy1VVnC9Mbvf_Top', '12kb', 'image/png', NULL, '2019-05-16 11:40:36', 1, '2019-05-16 11:40:36', 1, NULL, 0);
INSERT INTO `sys_rescource` VALUES (8, 'c0b6cb6f-854c-4e66-a80a-7c60c248a486.jpg', 'local', 'http://192.168.30.103:8888/group1/M00/00/31/wKgeZ10ZrOyAFxB-AAIQKr4ZctY123.jpg', 'Fqd3r5HRgC8gqU6uD_RG43enNHYT', '132kb', 'image/jpeg', NULL, '2019-07-01 14:49:17', 1, '2019-07-01 14:49:17', 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '老司机123123', '2017-11-02 14:19:07', 1, '2019-07-02 21:19:05', 1, '', 0);
INSERT INTO `sys_role` VALUES (2, '系统管理员', '2017-11-29 19:36:37', 1, '2019-03-12 17:24:56', 1, '', 0);
INSERT INTO `sys_role` VALUES (3, '小白鸡', '2019-01-29 14:59:38', 1, '2019-03-12 15:55:15', 1, '2', 1);
INSERT INTO `sys_role` VALUES (4, '测试组', '2019-03-13 10:18:27', 1, '2019-01-29 14:59:38', 1, '', 0);
INSERT INTO `sys_role` VALUES (5, '运营', '2019-03-14 17:57:17', 1, '2019-07-02 21:08:29', 1, '', 1);
INSERT INTO `sys_role` VALUES (8, 'test', '2019-03-27 11:58:13', 1, '2019-07-02 21:08:37', 1, '', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 120);
INSERT INTO `sys_role_menu` VALUES (1, 130);
INSERT INTO `sys_role_menu` VALUES (1, 200);
INSERT INTO `sys_role_menu` VALUES (1, 210);
INSERT INTO `sys_role_menu` VALUES (1, 211);
INSERT INTO `sys_role_menu` VALUES (1, 212);
INSERT INTO `sys_role_menu` VALUES (1, 213);
INSERT INTO `sys_role_menu` VALUES (1, 220);
INSERT INTO `sys_role_menu` VALUES (1, 221);
INSERT INTO `sys_role_menu` VALUES (1, 222);
INSERT INTO `sys_role_menu` VALUES (1, 223);
INSERT INTO `sys_role_menu` VALUES (1, 224);
INSERT INTO `sys_role_menu` VALUES (1, 225);
INSERT INTO `sys_role_menu` VALUES (1, 230);
INSERT INTO `sys_role_menu` VALUES (1, 231);
INSERT INTO `sys_role_menu` VALUES (1, 232);
INSERT INTO `sys_role_menu` VALUES (1, 233);
INSERT INTO `sys_role_menu` VALUES (1, 234);
INSERT INTO `sys_role_menu` VALUES (1, 236);
INSERT INTO `sys_role_menu` VALUES (1, 237);
INSERT INTO `sys_role_menu` VALUES (1, 238);
INSERT INTO `sys_role_menu` VALUES (1, 239);
INSERT INTO `sys_role_menu` VALUES (1, 240);
INSERT INTO `sys_role_menu` VALUES (1, 241);
INSERT INTO `sys_role_menu` VALUES (1, 242);
INSERT INTO `sys_role_menu` VALUES (1, 243);
INSERT INTO `sys_role_menu` VALUES (1, 250);
INSERT INTO `sys_role_menu` VALUES (1, 251);
INSERT INTO `sys_role_menu` VALUES (1, 252);
INSERT INTO `sys_role_menu` VALUES (1, 253);
INSERT INTO `sys_role_menu` VALUES (1, 254);
INSERT INTO `sys_role_menu` VALUES (1, 260);
INSERT INTO `sys_role_menu` VALUES (1, 261);
INSERT INTO `sys_role_menu` VALUES (1, 262);
INSERT INTO `sys_role_menu` VALUES (1, 263);
INSERT INTO `sys_role_menu` VALUES (1, 264);
INSERT INTO `sys_role_menu` VALUES (1, 265);
INSERT INTO `sys_role_menu` VALUES (1, 266);
INSERT INTO `sys_role_menu` VALUES (1, 270);
INSERT INTO `sys_role_menu` VALUES (1, 300);
INSERT INTO `sys_role_menu` VALUES (1, 310);
INSERT INTO `sys_role_menu` VALUES (1, 311);
INSERT INTO `sys_role_menu` VALUES (1, 320);
INSERT INTO `sys_role_menu` VALUES (1, 321);
INSERT INTO `sys_role_menu` VALUES (1, 322);
INSERT INTO `sys_role_menu` VALUES (1, 323);
INSERT INTO `sys_role_menu` VALUES (1, 400);
INSERT INTO `sys_role_menu` VALUES (1, 410);
INSERT INTO `sys_role_menu` VALUES (1, 411);
INSERT INTO `sys_role_menu` VALUES (1, 412);
INSERT INTO `sys_role_menu` VALUES (1, 413);
INSERT INTO `sys_role_menu` VALUES (1, 414);
INSERT INTO `sys_role_menu` VALUES (1, 415);
INSERT INTO `sys_role_menu` VALUES (1, 416);
INSERT INTO `sys_role_menu` VALUES (1, 420);
INSERT INTO `sys_role_menu` VALUES (1, 421);
INSERT INTO `sys_role_menu` VALUES (1, 430);
INSERT INTO `sys_role_menu` VALUES (1, 431);
INSERT INTO `sys_role_menu` VALUES (1, 432);
INSERT INTO `sys_role_menu` VALUES (1, 433);
INSERT INTO `sys_role_menu` VALUES (1, 434);
INSERT INTO `sys_role_menu` VALUES (1, 435);
INSERT INTO `sys_role_menu` VALUES (1, 436);
INSERT INTO `sys_role_menu` VALUES (1, 440);
INSERT INTO `sys_role_menu` VALUES (1, 441);
INSERT INTO `sys_role_menu` VALUES (1, 442);
INSERT INTO `sys_role_menu` VALUES (1, 443);
INSERT INTO `sys_role_menu` VALUES (1, 444);
INSERT INTO `sys_role_menu` VALUES (1, 540);
INSERT INTO `sys_role_menu` VALUES (1, 541);
INSERT INTO `sys_role_menu` VALUES (1, 542);
INSERT INTO `sys_role_menu` VALUES (1, 543);
INSERT INTO `sys_role_menu` VALUES (1, 600);
INSERT INTO `sys_role_menu` VALUES (1, 610);
INSERT INTO `sys_role_menu` VALUES (1, 620);
INSERT INTO `sys_role_menu` VALUES (1, 630);
INSERT INTO `sys_role_menu` VALUES (1, 640);
INSERT INTO `sys_role_menu` VALUES (1, 900);
INSERT INTO `sys_role_menu` VALUES (1, 904);
INSERT INTO `sys_role_menu` VALUES (1, 905);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (4, 3);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 6);
INSERT INTO `sys_role_menu` VALUES (4, 7);
INSERT INTO `sys_role_menu` VALUES (4, 8);
INSERT INTO `sys_role_menu` VALUES (4, 9);
INSERT INTO `sys_role_menu` VALUES (4, 10);
INSERT INTO `sys_role_menu` VALUES (4, 11);
INSERT INTO `sys_role_menu` VALUES (4, 12);
INSERT INTO `sys_role_menu` VALUES (4, 13);
INSERT INTO `sys_role_menu` VALUES (4, 14);
INSERT INTO `sys_role_menu` VALUES (4, 15);
INSERT INTO `sys_role_menu` VALUES (4, 16);
INSERT INTO `sys_role_menu` VALUES (4, 17);
INSERT INTO `sys_role_menu` VALUES (4, 18);
INSERT INTO `sys_role_menu` VALUES (4, 19);
INSERT INTO `sys_role_menu` VALUES (4, 20);
INSERT INTO `sys_role_menu` VALUES (4, 21);
INSERT INTO `sys_role_menu` VALUES (4, 22);
INSERT INTO `sys_role_menu` VALUES (4, 23);
INSERT INTO `sys_role_menu` VALUES (4, 24);
INSERT INTO `sys_role_menu` VALUES (4, 25);
INSERT INTO `sys_role_menu` VALUES (4, 26);
INSERT INTO `sys_role_menu` VALUES (4, 27);
INSERT INTO `sys_role_menu` VALUES (4, 28);
INSERT INTO `sys_role_menu` VALUES (4, 29);
INSERT INTO `sys_role_menu` VALUES (4, 30);
INSERT INTO `sys_role_menu` VALUES (4, 32);
INSERT INTO `sys_role_menu` VALUES (4, 33);
INSERT INTO `sys_role_menu` VALUES (4, 34);
INSERT INTO `sys_role_menu` VALUES (4, 35);
INSERT INTO `sys_role_menu` VALUES (4, 36);
INSERT INTO `sys_role_menu` VALUES (4, 37);
INSERT INTO `sys_role_menu` VALUES (4, 38);
INSERT INTO `sys_role_menu` VALUES (4, 39);
INSERT INTO `sys_role_menu` VALUES (4, 40);
INSERT INTO `sys_role_menu` VALUES (4, 41);
INSERT INTO `sys_role_menu` VALUES (4, 42);
INSERT INTO `sys_role_menu` VALUES (4, 43);
INSERT INTO `sys_role_menu` VALUES (4, 44);
INSERT INTO `sys_role_menu` VALUES (4, 45);
INSERT INTO `sys_role_menu` VALUES (4, 53);
INSERT INTO `sys_role_menu` VALUES (4, 65);
INSERT INTO `sys_role_menu` VALUES (4, 66);
INSERT INTO `sys_role_menu` VALUES (4, 67);
INSERT INTO `sys_role_menu` VALUES (4, 68);
INSERT INTO `sys_role_menu` VALUES (4, 69);
INSERT INTO `sys_role_menu` VALUES (4, 71);
INSERT INTO `sys_role_menu` VALUES (4, 72);
INSERT INTO `sys_role_menu` VALUES (4, 73);
INSERT INTO `sys_role_menu` VALUES (4, 74);
INSERT INTO `sys_role_menu` VALUES (4, 75);
INSERT INTO `sys_role_menu` VALUES (4, 76);
INSERT INTO `sys_role_menu` VALUES (4, 77);
INSERT INTO `sys_role_menu` VALUES (4, 78);
INSERT INTO `sys_role_menu` VALUES (4, 79);
INSERT INTO `sys_role_menu` VALUES (4, 80);
INSERT INTO `sys_role_menu` VALUES (4, 81);
INSERT INTO `sys_role_menu` VALUES (4, 82);
INSERT INTO `sys_role_menu` VALUES (4, 83);
INSERT INTO `sys_role_menu` VALUES (4, 84);
INSERT INTO `sys_role_menu` VALUES (4, 89);
INSERT INTO `sys_role_menu` VALUES (4, 90);
INSERT INTO `sys_role_menu` VALUES (4, 91);
INSERT INTO `sys_role_menu` VALUES (4, 92);
INSERT INTO `sys_role_menu` VALUES (4, 93);
INSERT INTO `sys_role_menu` VALUES (4, 94);
INSERT INTO `sys_role_menu` VALUES (4, 95);
INSERT INTO `sys_role_menu` VALUES (4, 96);
INSERT INTO `sys_role_menu` VALUES (4, 97);
INSERT INTO `sys_role_menu` VALUES (4, 98);
INSERT INTO `sys_role_menu` VALUES (4, 99);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 104);
INSERT INTO `sys_role_menu` VALUES (4, 105);
INSERT INTO `sys_role_menu` VALUES (4, 106);
INSERT INTO `sys_role_menu` VALUES (4, 107);
INSERT INTO `sys_role_menu` VALUES (4, 108);
INSERT INTO `sys_role_menu` VALUES (4, 109);
INSERT INTO `sys_role_menu` VALUES (4, 110);
INSERT INTO `sys_role_menu` VALUES (4, 111);
INSERT INTO `sys_role_menu` VALUES (4, 112);
INSERT INTO `sys_role_menu` VALUES (4, 113);
INSERT INTO `sys_role_menu` VALUES (4, 114);
INSERT INTO `sys_role_menu` VALUES (4, 115);
INSERT INTO `sys_role_menu` VALUES (4, 116);
INSERT INTO `sys_role_menu` VALUES (4, 117);
INSERT INTO `sys_role_menu` VALUES (4, 118);
INSERT INTO `sys_role_menu` VALUES (4, 119);
INSERT INTO `sys_role_menu` VALUES (4, 120);
INSERT INTO `sys_role_menu` VALUES (4, 121);
INSERT INTO `sys_role_menu` VALUES (4, 122);
INSERT INTO `sys_role_menu` VALUES (4, 123);
INSERT INTO `sys_role_menu` VALUES (4, 124);
INSERT INTO `sys_role_menu` VALUES (4, 125);
INSERT INTO `sys_role_menu` VALUES (4, 126);
INSERT INTO `sys_role_menu` VALUES (4, 127);
INSERT INTO `sys_role_menu` VALUES (4, 128);
INSERT INTO `sys_role_menu` VALUES (4, 130);
INSERT INTO `sys_role_menu` VALUES (4, 132);
INSERT INTO `sys_role_menu` VALUES (4, 133);
INSERT INTO `sys_role_menu` VALUES (4, 134);
INSERT INTO `sys_role_menu` VALUES (4, 135);
INSERT INTO `sys_role_menu` VALUES (4, 136);
INSERT INTO `sys_role_menu` VALUES (4, 137);
INSERT INTO `sys_role_menu` VALUES (4, 138);
INSERT INTO `sys_role_menu` VALUES (4, 139);
INSERT INTO `sys_role_menu` VALUES (6, 135);
INSERT INTO `sys_role_menu` VALUES (6, 136);
INSERT INTO `sys_role_menu` VALUES (6, 137);
INSERT INTO `sys_role_menu` VALUES (6, 138);
INSERT INTO `sys_role_menu` VALUES (6, 139);
INSERT INTO `sys_role_menu` VALUES (7, 135);
INSERT INTO `sys_role_menu` VALUES (7, 136);
INSERT INTO `sys_role_menu` VALUES (7, 137);
INSERT INTO `sys_role_menu` VALUES (7, 138);
INSERT INTO `sys_role_menu` VALUES (7, 139);

-- ----------------------------
-- Table structure for sys_site
-- ----------------------------
DROP TABLE IF EXISTS `sys_site`;
CREATE TABLE `sys_site`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统网址',
  `open_message` bit(1) NULL DEFAULT NULL COMMENT '是否开放评论',
  `is_no_name` bit(1) NULL DEFAULT NULL COMMENT '是否匿名评论',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_upload_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `git` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `database` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `max_upload` int(11) NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `powerby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `del_flag` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_site
-- ----------------------------
INSERT INTO `sys_site` VALUES (1, '管理后台', 'https://www.e-ports.com', b'1', b'0', '1.0', 'e-ports', 'http://192.168.30.103:8888/group1/M00/00/22/wKgeZ1zc27WAMS7nAAAwMwsD2eA554.png', 'local', '', '1115784675', '', '', '', '', '上海', '', 'windows', 'mysql', 2, '', '', '', '', 1, '2017-12-30 22:46:15', 1, '2019-05-16 11:40:42', '<p><br></p>', b'0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` bigint(20) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(20) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'test', '我是管理员', 'http://192.168.30.103:8888/group1/M00/00/22/wKgeZ1zc2sSAWCFCAALd5PnYniU064.png', '810339f5426fe2dcaf92c5cac718acc6471a034b', '3fb62b5aeede1bbf', '', '', 0, '2017-11-27 22:19:39', 1, '2019-05-16 11:39:52', 1, '', 0);
INSERT INTO `sys_user` VALUES (2, 'test1', 'test1', NULL, '14771550035209a093b8312dfab46c2aeb535e3e', '1e80ffd98ed29355', '', '', 0, '2019-03-13 09:33:48', 1, '2019-04-29 15:26:50', 1, NULL, 0);
INSERT INTO `sys_user` VALUES (4, 'caimin', '', NULL, 'b11023dec6889ca683a76146bd831d43ba71fb82', '80612d155c287175', '', '', 0, '2019-03-13 10:24:54', 1, '2019-04-29 15:26:57', 1, NULL, 0);
INSERT INTO `sys_user` VALUES (5, 'jadin', 'jadin', NULL, '5a6648c743f96ebc160a905847b6bb6182886ca3', 'e73ef5e8c8786e38', '', '', 0, '2019-03-14 17:54:50', 1, '2019-03-14 18:10:44', 1, NULL, 0);
INSERT INTO `sys_user` VALUES (6, 'nathnn', '111', NULL, '6401ee94ff1f0461106ba0e6f0d01045be389330', '82d7c65600e0e0a0', '13578994322', '111@11.com', 0, '2019-05-08 10:27:27', 1, '2019-05-08 10:27:27', 1, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 1);
INSERT INTO `sys_user_role` VALUES (3, 4);
INSERT INTO `sys_user_role` VALUES (4, 4);
INSERT INTO `sys_user_role` VALUES (6, 1);

-- ----------------------------
-- Table structure for upload_info
-- ----------------------------
DROP TABLE IF EXISTS `upload_info`;
CREATE TABLE `upload_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `local_window_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地window系统上传路径,input,YES,false,true,false',
  `local_linux_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地LINUX系统上传路径,input,YES,false,true,false',
  `qiniu_base_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛前缀路径,input,YES,false,true,false',
  `qiniu_bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛bucket的目录名称,input,YES,false,true,false',
  `qiniu_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛文件存储目录,input,YES,false,true,false',
  `qiniu_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛qiniuAccess值,input,YES,false,true,false',
  `qiniu_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛qiniuKey的值,input,YES,false,true,false',
  `qiniu_test_access` bit(1) NULL DEFAULT NULL COMMENT '七牛上传测试,switch,YES,true,true,false',
  `oss_base_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云前缀路径,input,YES,false,true,false',
  `oss_bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云bucket的目录名称,input,YES,false,true,false',
  `oss_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云文件上传目录,input,YES,false,true,false',
  `oss_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云ACCESS_KEY_ID值,input,YES,false,true,false',
  `oss_key_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云ACCESS_KEY_SECRET,input,YES,false,true,false',
  `oss_endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云ENDPOINT值,input,YES,false,true,false',
  `oss_test_access` bit(1) NULL DEFAULT NULL COMMENT '阿里云上传测试,switch,YES,true,true,false',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传配置,1,switch-qiniuTestAccess-YES-true-qiniu_test_access,switch-ossTestAccess-YES-true-oss_test_access' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_info
-- ----------------------------
INSERT INTO `upload_info` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-12 18:48:23', 1, '2018-07-12 18:48:25', 1, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
