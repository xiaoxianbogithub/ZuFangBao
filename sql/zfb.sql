/*
 Navicat Premium Data Transfer

 Source Server         : zufangbao
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : 211.149.182.210:3306
 Source Schema         : zfb

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 19/10/2023 22:46:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (63, 'residence_brand', '房源品牌', '', '', 'ResidenceBrand', 'crud', 'com.ruoyi.residence', 'residence', 'brand', '房源品牌', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:38', '', '2023-10-19 21:53:08', NULL);
INSERT INTO `gen_table` VALUES (64, 'residence_brand_picture', '房源品牌图片', NULL, NULL, 'ResidenceBrandPicture', 'crud', 'com.ruoyi.residence', 'residence', 'brandPicture', '房源品牌图片', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:39', '', '2023-10-19 12:08:10', NULL);
INSERT INTO `gen_table` VALUES (65, 'residence_category', '房源分类', NULL, NULL, 'ResidenceCategory', 'crud', 'com.ruoyi.residence', 'residence', 'category', '房源分类', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:39:40', NULL);
INSERT INTO `gen_table` VALUES (66, 'residence_deposit', '房源押金设置', NULL, NULL, 'ResidenceDeposit', 'crud', 'com.ruoyi.residence', 'residence', 'deposit', '房源押金设置', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13', NULL);
INSERT INTO `gen_table` VALUES (67, 'residence_facility', '房源配置', NULL, NULL, 'ResidenceFacility', 'crud', 'com.ruoyi.residence', 'residence', 'facility', '房源配置', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:15:45', NULL);
INSERT INTO `gen_table` VALUES (68, 'residence_favorite', '房源收藏表', NULL, NULL, 'ResidenceFavorite', 'crud', 'com.ruoyi.residence', 'residence', 'favorite', '房源收藏', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:19:16', NULL);
INSERT INTO `gen_table` VALUES (69, 'residence_house_type', '房源户型设定', NULL, NULL, 'ResidenceHouseType', 'crud', 'com.ruoyi.residence', 'residence', 'type', '房源户型设定', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06', NULL);
INSERT INTO `gen_table` VALUES (70, 'residence_info', '房屋基本信息', '', '', 'ResidenceInfo', 'crud', 'com.ruoyi.residence', 'residence', 'info', '房屋基本信息', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14', NULL);
INSERT INTO `gen_table` VALUES (71, 'residence_label', '房源标签', NULL, NULL, 'ResidenceLabel', 'crud', 'com.ruoyi.residence', 'residence', 'label', '房源标签', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:44', '', '2023-10-19 22:17:08', NULL);
INSERT INTO `gen_table` VALUES (72, 'residence_pay', '房源付款设置', NULL, NULL, 'ResidencePay', 'crud', 'com.ruoyi.residence', 'residence', 'pay', '房源付款设置', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54', NULL);
INSERT INTO `gen_table` VALUES (73, 'residence_picture', '房源图片', NULL, NULL, 'ResidencePicture', 'crud', 'com.ruoyi.residence', 'residence', 'picture', '房源图片', 'climber', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-10-17 22:40:46', '', '2023-10-18 10:39:51', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (513, 63, 'id', 'Id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:38', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (514, 63, 'name', '品牌名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:40:38', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (515, 63, 'pic_url', '品牌首页图片', 'varchar(255)', 'String', 'picUrl', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-10-17 22:40:38', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (516, 63, 'description', '品牌描述', 'text', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'textarea', '', 4, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (517, 63, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (518, 63, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'brand_status', 6, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (519, 63, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 7, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (520, 63, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 8, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (521, 63, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', '0', '1', '1', 'BETWEEN', 'datetime', '', 9, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 21:53:08');
INSERT INTO `gen_table_column` VALUES (522, 64, 'id', 'Id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 12:08:10');
INSERT INTO `gen_table_column` VALUES (523, 64, 'residence_brand_id', '房源品牌Id', 'bigint', 'Long', 'residenceBrandId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 12:08:10');
INSERT INTO `gen_table_column` VALUES (524, 64, 'pic_url', '图片路径', 'varchar(255)', 'String', 'picUrl', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 12:08:10');
INSERT INTO `gen_table_column` VALUES (525, 64, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:39', '', '2023-10-19 12:08:10');
INSERT INTO `gen_table_column` VALUES (526, 65, 'id', 'Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 21:39:40');
INSERT INTO `gen_table_column` VALUES (527, 65, 'name', '名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 21:39:40');
INSERT INTO `gen_table_column` VALUES (528, 65, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 3, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 21:39:40');
INSERT INTO `gen_table_column` VALUES (529, 65, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 21:39:40');
INSERT INTO `gen_table_column` VALUES (530, 65, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 21:39:40');
INSERT INTO `gen_table_column` VALUES (531, 66, 'id', 'ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (532, 66, 'value', '值', 'int', 'Long', 'value', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (533, 66, 'name', '名称', 'varchar(25)', 'String', 'name', '0', '0', NULL, '0', '0', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (534, 66, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (535, 66, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 5, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (536, 66, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 6, 'admin', '2023-10-17 22:40:40', '', '2023-10-19 22:08:13');
INSERT INTO `gen_table_column` VALUES (537, 67, 'id', 'Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (538, 67, 'name', '名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (539, 67, 'icon_url', '配置图标', 'varchar(255)', 'String', 'iconUrl', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (540, 67, 'system_type', '是否为系统内置', 'tinyint', 'Long', 'systemType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (541, 67, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (542, 67, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 6, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (543, 67, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 7, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:15:45');
INSERT INTO `gen_table_column` VALUES (544, 68, 'id', 'Id', 'bigint', 'Long', 'id', '1', '1', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:19:16');
INSERT INTO `gen_table_column` VALUES (545, 68, 'user_id', '用户Id', 'bigint', 'Long', 'userId', '0', '0', '1', '0', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:19:16');
INSERT INTO `gen_table_column` VALUES (546, 68, 'residence_id', '房源Id', 'bigint', 'Long', 'residenceId', '0', '0', '1', '0', '0', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:19:16');
INSERT INTO `gen_table_column` VALUES (547, 68, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:41', '', '2023-10-19 22:19:16');
INSERT INTO `gen_table_column` VALUES (548, 68, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:19:16');
INSERT INTO `gen_table_column` VALUES (549, 69, 'id', 'Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06');
INSERT INTO `gen_table_column` VALUES (550, 69, 'name', '名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06');
INSERT INTO `gen_table_column` VALUES (551, 69, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06');
INSERT INTO `gen_table_column` VALUES (552, 69, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 4, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06');
INSERT INTO `gen_table_column` VALUES (553, 69, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 5, 'admin', '2023-10-17 22:40:42', '', '2023-10-19 22:12:06');
INSERT INTO `gen_table_column` VALUES (554, 70, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14');
INSERT INTO `gen_table_column` VALUES (555, 70, 'category_id', '房源分类id', 'int', 'Long', 'categoryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14');
INSERT INTO `gen_table_column` VALUES (556, 70, 'brand_id', '房源品牌id', 'bigint', 'Long', 'brandId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14');
INSERT INTO `gen_table_column` VALUES (557, 70, 'price', '价格', 'decimal(12,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14');
INSERT INTO `gen_table_column` VALUES (558, 70, 'deposit_id', '押金设置id', 'int', 'Long', 'depositId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'select', '', 5, 'admin', '2023-10-17 22:40:42', '', '2023-10-18 22:09:14');
INSERT INTO `gen_table_column` VALUES (559, 70, 'pay_id', '付款设置id', 'int', 'Long', 'payId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'select', '', 6, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (560, 70, 'deposite_amount', '押金金额(押一付一:deposite_mount = price * 1)', 'decimal(12,2)', 'BigDecimal', 'depositeAmount', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (561, 70, 'pay_amount', '需付房租金额(押一付一:pay_mount = price * 1)', 'decimal(12,2)', 'BigDecimal', 'payAmount', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 8, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (562, 70, 'total_amount', '总金额(押一付一:total_mount = price * 2)', 'decimal(12,2)', 'BigDecimal', 'totalAmount', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (563, 70, 'water_bill', '水费', 'decimal(12,2)', 'BigDecimal', 'waterBill', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (564, 70, 'electricity_bill', '电费', 'decimal(12,2)', 'BigDecimal', 'electricityBill', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (565, 70, 'house_type_id', '户型设定id', 'int', 'Long', 'houseTypeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 12, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (566, 70, 'square', '面积', 'decimal(8,2)', 'BigDecimal', 'square', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (567, 70, 'floor', '楼层', 'int', 'Long', 'floor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (568, 70, 'elevator', '是否有电梯', 'tinyint', 'Long', 'elevator', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (569, 70, 'furnish', '装修', 'char(1)', 'String', 'furnish', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 16, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (570, 70, 'introduction', '房源简介', 'text', 'String', 'introduction', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 17, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (571, 70, 'address_id', '房源位置id', 'bigint', 'Long', 'addressId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2023-10-17 22:40:43', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (572, 70, 'address_detail', '详细地址', 'text', 'String', 'addressDetail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 19, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (573, 70, 'facilities', '房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }]) ', 'json', 'String', 'facilities', '0', '0', NULL, '1', '1', '1', '0', 'EQ', NULL, '', 20, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:15');
INSERT INTO `gen_table_column` VALUES (574, 70, 'labels', '房源标签JSON', 'json', 'String', 'labels', '0', '0', NULL, '1', '1', '1', '0', 'EQ', NULL, '', 21, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (575, 70, 'favorite_count', '收藏量', 'bigint', 'Long', 'favoriteCount', '0', '0', NULL, '1', '1', '1', '0', 'LTE', 'input', '', 22, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (576, 70, 'browse_count', '浏览量', 'bigint', 'Long', 'browseCount', '0', '0', NULL, '1', '1', '1', '0', 'LTE', 'input', '', 23, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (577, 70, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 24, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (578, 70, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 25, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (579, 70, 'weights', '权重', 'decimal(8,2)', 'BigDecimal', 'weights', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'input', '', 26, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (580, 70, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 27, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (581, 70, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (582, 70, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 29, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (583, 70, 'update_by', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 30, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (584, 70, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 31, 'admin', '2023-10-17 22:40:44', '', '2023-10-18 22:09:16');
INSERT INTO `gen_table_column` VALUES (585, 71, 'id', 'ID', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (586, 71, 'name', '名称', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (587, 71, 'system_type', '是否为系统内置', 'tinyint', 'Long', 'systemType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (588, 71, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (589, 71, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 5, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (590, 71, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 6, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:17:08');
INSERT INTO `gen_table_column` VALUES (591, 72, 'id', 'Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (592, 72, 'value', '值', 'int', 'Long', 'value', '0', '0', NULL, '1', '1', '0', '0', 'EQ', 'input', '', 2, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (593, 72, 'name', '名称', 'varchar(25)', 'String', 'name', '0', '0', NULL, '0', '0', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (594, 72, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (595, 72, 'display', '是否可见', 'tinyint', 'Long', 'display', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', 5, 'admin', '2023-10-17 22:40:45', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (596, 72, 'deleted', '是否删除', 'tinyint', 'Long', 'deleted', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'radio', '', 6, 'admin', '2023-10-17 22:40:46', '', '2023-10-19 22:07:54');
INSERT INTO `gen_table_column` VALUES (597, 73, 'id', 'Id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-17 22:40:46', '', '2023-10-18 10:39:51');
INSERT INTO `gen_table_column` VALUES (598, 73, 'residence_id', '房源Id', 'bigint', 'Long', 'residenceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2023-10-17 22:40:46', '', '2023-10-18 10:39:51');
INSERT INTO `gen_table_column` VALUES (599, 73, 'pic_url', '图片路径', 'varchar(255)', 'String', 'picUrl', '0', '0', NULL, '1', '1', '0', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2023-10-17 22:40:46', '', '2023-10-18 10:39:51');
INSERT INTO `gen_table_column` VALUES (600, 73, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-17 22:40:46', '', '2023-10-18 10:39:51');

-- ----------------------------
-- Table structure for residence_brand
-- ----------------------------
DROP TABLE IF EXISTS `residence_brand`;
CREATE TABLE `residence_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '品牌名称 e.g. 自如,链家',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '品牌首页图片',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '品牌描述',
  `sort` int NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0',
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源品牌' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_brand
-- ----------------------------
INSERT INTO `residence_brand` VALUES (3, '卓越', '/profile/upload/2023/10/19/img_20231019001246A001.png', '1', 1, '1', 0, 0, '2023-10-19 00:12:50');
INSERT INTO `residence_brand` VALUES (4, '卓越2', '/profile/upload/2023/10/19/img_20231019001332A002.png,/profile/upload/2023/10/19/show_20231019001338A003.png', '2', 2, '0', 1, 0, '2023-10-19 00:13:42');
INSERT INTO `residence_brand` VALUES (5, '3', '/profile/upload/2023/10/19/img_20231019001451A006.png', '3', 3, '0', 1, 0, '2023-10-19 00:14:54');
INSERT INTO `residence_brand` VALUES (6, '4', '/profile/upload/2023/10/19/img_20231019214126A009.png', '4', 4, '0', 1, 0, '2023-10-19 21:41:34');

-- ----------------------------
-- Table structure for residence_brand_picture
-- ----------------------------
DROP TABLE IF EXISTS `residence_brand_picture`;
CREATE TABLE `residence_brand_picture`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `residence_brand_id` bigint NOT NULL COMMENT '房源品牌Id',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图片路径',
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源品牌图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_brand_picture
-- ----------------------------

-- ----------------------------
-- Table structure for residence_category
-- ----------------------------
DROP TABLE IF EXISTS `residence_category`;
CREATE TABLE `residence_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '自营门店/品牌公寓/商铺办公',
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_category
-- ----------------------------
INSERT INTO `residence_category` VALUES (1, '1', 0, 0, 1);
INSERT INTO `residence_category` VALUES (2, '2', 0, 0, 2);
INSERT INTO `residence_category` VALUES (3, '3', 0, 0, 3);
INSERT INTO `residence_category` VALUES (4, '4', 1, 0, 4);
INSERT INTO `residence_category` VALUES (5, '5', 1, 0, 5);

-- ----------------------------
-- Table structure for residence_deposit
-- ----------------------------
DROP TABLE IF EXISTS `residence_deposit`;
CREATE TABLE `residence_deposit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NULL DEFAULT 1,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL,
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源押金设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_deposit
-- ----------------------------
INSERT INTO `residence_deposit` VALUES (2, 123, '1', 1, 1, 0);
INSERT INTO `residence_deposit` VALUES (3, 1, NULL, 2, 1, 0);

-- ----------------------------
-- Table structure for residence_facility
-- ----------------------------
DROP TABLE IF EXISTS `residence_facility`;
CREATE TABLE `residence_facility`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'icon',
  `system_type` tinyint NULL DEFAULT 1 COMMENT '是否为系统内置  (0:否;1:是)',
  `sort` int NULL DEFAULT NULL,
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_facility
-- ----------------------------
INSERT INTO `residence_facility` VALUES (1, '洗衣机', '/profile/upload/2023/10/19/i1_a_20231019223222A011.png', 1, 1, 1, 0);
INSERT INTO `residence_facility` VALUES (2, '空调', '/profile/upload/2023/10/19/i2_a_20231019223236A012.png', 1, 2, 1, 0);
INSERT INTO `residence_facility` VALUES (3, '衣柜', '/profile/upload/2023/10/19/i3_a_20231019223250A013.png', 1, 3, 1, 0);
INSERT INTO `residence_facility` VALUES (4, '电视', '/profile/upload/2023/10/19/i4_a_20231019223305A014.png', 1, 4, 1, 0);
INSERT INTO `residence_facility` VALUES (5, '热水器', '/profile/upload/2023/10/19/i6_a_20231019223326A015.png', 1, 5, 1, 0);
INSERT INTO `residence_facility` VALUES (6, '床', '/profile/upload/2023/10/19/i7_a_20231019223340A016.png', 1, 6, 1, 0);
INSERT INTO `residence_facility` VALUES (7, 'WiFi', '/profile/upload/2023/10/19/i8_a_20231019223355A017.png', 1, 7, 1, 0);
INSERT INTO `residence_facility` VALUES (8, '天然气', '/profile/upload/2023/10/19/i9_a_20231019223417A018.png', 1, 8, 1, 0);
INSERT INTO `residence_facility` VALUES (9, '冰箱', '/profile/upload/2023/10/19/i5_a_20231019223448A019.png', 1, 9, 1, 0);
INSERT INTO `residence_facility` VALUES (10, '阳台', '/profile/upload/2023/10/19/i10_a_20231019223503A020.png', 1, 10, 1, 0);

-- ----------------------------
-- Table structure for residence_favorite
-- ----------------------------
DROP TABLE IF EXISTS `residence_favorite`;
CREATE TABLE `residence_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `residence_id` bigint NOT NULL COMMENT '房源Id',
  `sort` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for residence_house_type
-- ----------------------------
DROP TABLE IF EXISTS `residence_house_type`;
CREATE TABLE `residence_house_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL,
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源户型设定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_house_type
-- ----------------------------
INSERT INTO `residence_house_type` VALUES (1, '一室一厅', 1, 1, 0);
INSERT INTO `residence_house_type` VALUES (2, '两室一厅', 2, 1, 0);

-- ----------------------------
-- Table structure for residence_info
-- ----------------------------
DROP TABLE IF EXISTS `residence_info`;
CREATE TABLE `residence_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` int NULL DEFAULT NULL COMMENT '房源分类id',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '房源品牌id',
  `price` decimal(12, 2) NULL DEFAULT NULL COMMENT '价格',
  `deposit_id` int NULL DEFAULT NULL COMMENT '押金设置id',
  `pay_id` int NULL DEFAULT NULL COMMENT '付款设置id',
  `deposite_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '押金金额(押一付一:deposite_mount = price * 1)',
  `pay_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '需付房租金额(押一付一:pay_mount = price * 1)',
  `total_amount` decimal(12, 2) NULL DEFAULT NULL COMMENT '总金额(押一付一:total_mount = price * 2)',
  `water_bill` decimal(12, 2) NULL DEFAULT NULL COMMENT '水费',
  `electricity_bill` decimal(12, 2) NULL DEFAULT NULL COMMENT '电费',
  `house_type_id` int NULL DEFAULT NULL COMMENT '户型设定id',
  `square` decimal(8, 2) NULL DEFAULT NULL COMMENT '面积',
  `floor` int NULL DEFAULT NULL COMMENT '楼层',
  `elevator` tinyint NULL DEFAULT NULL COMMENT '是否有电梯  (0:无电梯;1:有电梯)',
  `furnish` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '装修  (0:简装;1:精装)',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '房源简介',
  `address_id` bigint NULL DEFAULT NULL COMMENT '房源位置id',
  `address_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '详细地址',
  `facilities` json NULL COMMENT '房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }]) ',
  `labels` json NULL COMMENT '房源标签JSON',
  `favorite_count` bigint NULL DEFAULT NULL COMMENT '收藏量',
  `browse_count` bigint NULL DEFAULT NULL COMMENT '浏览量',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状态  (-2草稿;-1下架;1上架)',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '是否删除 (0:未删除;1:已删除)',
  `weights` decimal(8, 2) NULL DEFAULT NULL COMMENT '权重 (后面评分可能会用到,用于排序)',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_residence_info_sd`(`status` DESC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房屋基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_info
-- ----------------------------

-- ----------------------------
-- Table structure for residence_label
-- ----------------------------
DROP TABLE IF EXISTS `residence_label`;
CREATE TABLE `residence_label`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `system_type` tinyint NULL DEFAULT 1 COMMENT '是否为系统内置  (0:否;1:是)',
  `sort` int NULL DEFAULT NULL,
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_label
-- ----------------------------
INSERT INTO `residence_label` VALUES (1, '电梯房', 1, 1, 1, 0);
INSERT INTO `residence_label` VALUES (2, '已实名', 1, 2, 1, 0);
INSERT INTO `residence_label` VALUES (3, '必看好房', 1, 3, 1, 0);
INSERT INTO `residence_label` VALUES (4, '交通便利', 1, 4, 1, 0);
INSERT INTO `residence_label` VALUES (5, '生活便捷', 1, 5, 1, 0);

-- ----------------------------
-- Table structure for residence_pay
-- ----------------------------
DROP TABLE IF EXISTS `residence_pay`;
CREATE TABLE `residence_pay`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NULL DEFAULT 1,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `sort` int NULL DEFAULT NULL,
  `display` tinyint NULL DEFAULT 1 COMMENT '0: 隐藏;1:显示',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '0:未删除;1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源付款设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_pay
-- ----------------------------
INSERT INTO `residence_pay` VALUES (1, 1, NULL, 1, 1, 0);

-- ----------------------------
-- Table structure for residence_picture
-- ----------------------------
DROP TABLE IF EXISTS `residence_picture`;
CREATE TABLE `residence_picture`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `residence_id` bigint NOT NULL COMMENT '房源Id',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图片路径',
  `sort` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房源图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residence_picture
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-09-21 23:39:24', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', '1', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-09-21 23:39:24', 'admin', '2023-10-19 21:38:44', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', '0', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', 'admin', '2023-10-19 21:38:50', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '上架', '1', 'brand_status', NULL, 'success', 'N', '0', 'admin', '2023-10-19 21:49:29', '', NULL, '上架');
INSERT INTO `sys_dict_data` VALUES (101, 2, '下架', '0', 'brand_status', NULL, 'warning', 'N', '0', 'admin', '2023-10-19 21:49:48', '', NULL, '下架');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-09-21 23:39:24', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '品牌状态', 'brand_status', '0', 'admin', '2023-10-19 21:48:03', '', NULL, '品牌上架下架');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-09-21 23:39:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-09-21 23:39:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-09-21 23:39:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '密码输入错误1次', '2023-10-07 14:55:25');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2023-10-07 14:55:25');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-10-07 14:57:18');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-10-07 14:58:15');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-10-07 15:03:29');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2023-10-07 15:03:38');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '113.87.22.102', 'XX XX', 'Unknown', 'Unknown', '0', '登录成功', '2023-10-12 01:22:08');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 00:38:55');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 00:39:35');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 00:39:39');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 01:26:29');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 01:38:17');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '116.25.227.64', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-10-17 01:48:41');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 01:53:00');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 01:53:23');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '183.253.18.182', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-10-17 07:14:43');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '117.30.80.42', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-10-17 10:12:45');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:28:57');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 15:32:31');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:32:34');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 15:32:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:34:43');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:35:11');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '116.25.225.168', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:35:46');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '116.25.225.168', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 15:40:50');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '116.25.225.168', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:40:52');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 15:42:01');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 16:26:42');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 17:30:54');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 17:45:36');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '223.104.68.87', 'XX XX', 'Apple WebKit', 'Mac OS X (iPhone)', '0', '登录成功', '2023-10-17 18:05:26');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 18:18:07');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 20:50:07');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 22:11:13');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 23:29:29');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 23:41:34');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 23:41:41');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 23:42:47');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 10:30:12');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 11:07:16');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 12:14:56');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 12:15:09');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 13:38:18');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 16:07:53');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 16:59:15');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '117.30.80.42', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-10-18 17:16:56');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:24:49');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 17:37:04');
INSERT INTO `sys_logininfor` VALUES (148, 'common', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-18 17:37:12');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:37:22');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 17:39:10');
INSERT INTO `sys_logininfor` VALUES (151, 'test', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-18 17:39:18');
INSERT INTO `sys_logininfor` VALUES (152, 'dev', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-18 17:39:24');
INSERT INTO `sys_logininfor` VALUES (153, 'dev', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-18 17:39:32');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:39:40');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 17:41:20');
INSERT INTO `sys_logininfor` VALUES (156, 'ry', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:41:24');
INSERT INTO `sys_logininfor` VALUES (157, 'ry', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 17:41:40');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:41:44');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 17:42:54');
INSERT INTO `sys_logininfor` VALUES (160, 'dev', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:43:01');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 17:56:15');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 18:11:42');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 18:11:45');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '116.30.242.61', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 18:12:44');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '113.118.196.254', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 22:04:22');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 22:05:22');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 22:36:07');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 23:53:39');
INSERT INTO `sys_logininfor` VALUES (169, 'dev', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 00:07:33');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 01:05:37');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '117.30.80.42', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-10-19 08:25:14');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '117.30.80.42', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-10-19 11:00:46');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 11:44:16');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '185.217.5.60', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 15:16:25');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 21:19:16');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '192.168.2.102', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-19 21:31:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-09-21 23:39:23', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-09-21 23:39:23', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-09-21 23:39:23', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-09-21 23:39:23', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-09-21 23:39:23', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-09-21 23:39:23', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-09-21 23:39:23', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-09-21 23:39:23', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-09-21 23:39:23', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-09-21 23:39:23', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-09-21 23:39:23', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-09-21 23:39:23', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-09-21 23:39:23', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-09-21 23:39:23', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-09-21 23:39:23', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-09-21 23:39:23', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-09-21 23:39:23', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-09-21 23:39:23', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-09-21 23:39:23', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-09-21 23:39:23', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-09-21 23:39:23', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-09-21 23:39:23', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-09-21 23:39:23', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-09-21 23:39:23', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '房源管理', 0, 4, 'residence', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-10-18 17:12:15', 'admin', '2023-10-18 17:13:59', '');
INSERT INTO `sys_menu` VALUES (2057, '房源品牌', 2000, 4, 'brand', 'residence/brand/index', NULL, 1, 0, 'C', '0', '0', 'residence:brand:list', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '房源品牌菜单');
INSERT INTO `sys_menu` VALUES (2058, '房源品牌查询', 2057, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brand:query', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '房源品牌新增', 2057, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brand:add', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '房源品牌修改', 2057, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brand:edit', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '房源品牌删除', 2057, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brand:remove', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '房源品牌导出', 2057, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brand:export', '#', 'admin', '2023-10-18 17:21:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '房源品牌图片', 2000, 5, 'brandPicture', 'residence/brandPicture/index', NULL, 1, 0, 'C', '0', '0', 'residence:brandPicture:list', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '房源品牌图片菜单');
INSERT INTO `sys_menu` VALUES (2064, '房源品牌图片查询', 2063, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brandPicture:query', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '房源品牌图片新增', 2063, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brandPicture:add', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '房源品牌图片修改', 2063, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brandPicture:edit', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '房源品牌图片删除', 2063, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brandPicture:remove', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '房源品牌图片导出', 2063, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:brandPicture:export', '#', 'admin', '2023-10-18 17:21:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '房源分类', 2000, 3, 'category', 'residence/category/index', NULL, 1, 0, 'C', '0', '0', 'residence:category:list', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '房源分类菜单');
INSERT INTO `sys_menu` VALUES (2070, '房源分类查询', 2069, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:category:query', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '房源分类新增', 2069, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:category:add', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '房源分类修改', 2069, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:category:edit', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '房源分类删除', 2069, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:category:remove', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '房源分类导出', 2069, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:category:export', '#', 'admin', '2023-10-18 17:21:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '房源押金设置', 2000, 6, 'deposit', 'residence/deposit/index', NULL, 1, 0, 'C', '0', '0', 'residence:deposit:list', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '房源押金设置菜单');
INSERT INTO `sys_menu` VALUES (2076, '房源押金设置查询', 2075, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:deposit:query', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '房源押金设置新增', 2075, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:deposit:add', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '房源押金设置修改', 2075, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:deposit:edit', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '房源押金设置删除', 2075, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:deposit:remove', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '房源押金设置导出', 2075, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:deposit:export', '#', 'admin', '2023-10-18 17:21:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '房源配置', 2000, 9, 'facility', 'residence/facility/index', NULL, 1, 0, 'C', '0', '0', 'residence:facility:list', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '房源配置菜单');
INSERT INTO `sys_menu` VALUES (2082, '房源配置查询', 2081, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:facility:query', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '房源配置新增', 2081, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:facility:add', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '房源配置修改', 2081, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:facility:edit', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '房源配置删除', 2081, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:facility:remove', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '房源配置导出', 2081, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:facility:export', '#', 'admin', '2023-10-18 17:22:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '房源收藏', 2000, 11, 'favorite', 'residence/favorite/index', NULL, 1, 0, 'C', '0', '0', 'residence:favorite:list', '#', 'admin', '2023-10-18 17:22:30', '', NULL, '房源收藏菜单');
INSERT INTO `sys_menu` VALUES (2088, '房源收藏查询', 2087, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:favorite:query', '#', 'admin', '2023-10-18 17:22:30', 'admin', '2023-10-19 22:30:06', '');
INSERT INTO `sys_menu` VALUES (2089, '房源收藏新增', 2087, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:favorite:add', '#', 'admin', '2023-10-18 17:22:30', 'admin', '2023-10-19 22:30:10', '');
INSERT INTO `sys_menu` VALUES (2090, '房源收藏修改', 2087, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:favorite:edit', '#', 'admin', '2023-10-18 17:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '房源收藏删除', 2087, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:favorite:remove', '#', 'admin', '2023-10-18 17:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '房源收藏导出', 2087, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:favorite:export', '#', 'admin', '2023-10-18 17:22:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '房源信息', 2000, 1, 'info', 'residence/info/index', NULL, 1, 0, 'C', '0', '0', 'residence:info:list', '#', 'admin', '2023-10-18 17:22:36', 'admin', '2023-10-18 22:16:56', '房屋基本信息菜单');
INSERT INTO `sys_menu` VALUES (2094, '房屋基本信息查询', 2093, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:info:query', '#', 'admin', '2023-10-18 17:22:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '房屋基本信息新增', 2093, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:info:add', '#', 'admin', '2023-10-18 17:22:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '房屋基本信息修改', 2093, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:info:edit', '#', 'admin', '2023-10-18 17:22:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '房屋基本信息删除', 2093, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:info:remove', '#', 'admin', '2023-10-18 17:22:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '房屋基本信息导出', 2093, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:info:export', '#', 'admin', '2023-10-18 17:22:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '房源标签', 2000, 10, 'label', 'residence/label/index', NULL, 1, 0, 'C', '0', '0', 'residence:label:list', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '房源标签菜单');
INSERT INTO `sys_menu` VALUES (2100, '房源标签查询', 2099, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:label:query', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '房源标签新增', 2099, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:label:add', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '房源标签修改', 2099, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:label:edit', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '房源标签删除', 2099, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:label:remove', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '房源标签导出', 2099, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:label:export', '#', 'admin', '2023-10-18 17:22:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '房源付款设置', 2000, 7, 'pay', 'residence/pay/index', NULL, 1, 0, 'C', '0', '0', 'residence:pay:list', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '房源付款设置菜单');
INSERT INTO `sys_menu` VALUES (2106, '房源付款设置查询', 2105, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:pay:query', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '房源付款设置新增', 2105, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:pay:add', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '房源付款设置修改', 2105, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:pay:edit', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '房源付款设置删除', 2105, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:pay:remove', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '房源付款设置导出', 2105, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:pay:export', '#', 'admin', '2023-10-18 17:22:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '房源图片', 2000, 2, 'picture', 'residence/picture/index', NULL, 1, 0, 'C', '0', '0', 'residence:picture:list', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '房源图片菜单');
INSERT INTO `sys_menu` VALUES (2112, '房源图片查询', 2111, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:picture:query', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '房源图片新增', 2111, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:picture:add', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '房源图片修改', 2111, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:picture:edit', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '房源图片删除', 2111, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:picture:remove', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '房源图片导出', 2111, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:picture:export', '#', 'admin', '2023-10-18 17:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '房源户型设定', 2000, 8, 'type', 'residence/type/index', NULL, 1, 0, 'C', '0', '0', 'residence:type:list', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '房源户型设定菜单');
INSERT INTO `sys_menu` VALUES (2118, '房源户型设定查询', 2117, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:type:query', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '房源户型设定新增', 2117, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:type:add', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '房源户型设定修改', 2117, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:type:edit', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '房源户型设定删除', 2117, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:type:remove', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '房源户型设定导出', 2117, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'residence:type:export', '#', 'admin', '2023-10-18 17:23:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-09-21 23:39:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-09-21 23:39:24', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:44:40', 208);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_info\"}', NULL, 0, NULL, '2023-10-17 15:46:48', 126);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '185.217.5.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:47:39', 19);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_brand,residence_deposit,residence_pay,residence_house_type,residence_facility,residence_label,residence_picture,residence_brand_picture,residence_favorite,residence_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:48:10', 286);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_brand\"}', NULL, 0, NULL, '2023-10-17 15:49:49', 42);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '185.217.5.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:51:23', 21);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_brand_picture\"}', NULL, 0, NULL, '2023-10-17 15:51:29', 60);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '185.217.5.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:51:46', 17);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-17 15:52:09', 47);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_deposit,residence_facility,residence_favorite,residence_house_type,residence_label,residence_pay,residence_picture\"}', NULL, 0, NULL, '2023-10-17 15:52:44', 182);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5,6,7,8,9,10,11,4', '185.217.5.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:53:02', 22);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_category,residence_favorite,residence_brand_picture,residence_picture,residence_label,residence_facility,residence_house_type,residence_pay,residence_deposit,residence_brand\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:53:22', 197);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 15:53:35', 124);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_brand,residence_brand_picture,residence_category,residence_deposit,residence_facility,residence_favorite,residence_house_type,residence_label,residence_pay,residence_picture,residence_info\"}', NULL, 0, NULL, '2023-10-17 15:54:00', 294);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房源管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"residence\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 17:59:45', 38);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/brand/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"brand\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:02:10', 18);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/brand/index\",\"createTime\":\"2023-10-17 18:02:10\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"brand\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:20:32', 27);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/category/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"category\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:23:03', 21);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/deposit/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"deposit\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"deposit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:24:21', 18);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/facility/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"facility\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"facility\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:25:26', 17);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/favorite/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"favorite\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"favorite\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:26:10', 21);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/info/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"info\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:26:46', 20);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/label/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"label\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"label\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:27:35', 18);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/pay/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"pay\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2000,\"path\":\"pay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:28:11', 15);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/picture/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"picture\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":2000,\"path\":\"picture\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:28:53', 18);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/type/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"type\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:29:30', 17);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/brand/index\",\"createTime\":\"2023-10-17 18:02:10\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"品牌\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:37:44', 18);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/brand/index\",\"createTime\":\"2023-10-17 18:02:10\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"品牌\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"brand\",\"perms\":\"residence:brand:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:38:53', 16);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/category/index\",\"createTime\":\"2023-10-17 18:23:03\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"类型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"perms\":\"residence:category:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:39:10', 14);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/deposit/index\",\"createTime\":\"2023-10-17 18:24:21\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"押金\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"deposit\",\"perms\":\"residence:deposit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:39:56', 24);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/facility/index\",\"createTime\":\"2023-10-17 18:25:26\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"设备\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"facility\",\"perms\":\"residence:facility:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:40:44', 16);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/favorite/index\",\"createTime\":\"2023-10-17 18:26:09\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"收藏\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"favorite\",\"perms\":\"residence:favorite:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:41:36', 17);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/info/index\",\"createTime\":\"2023-10-17 18:26:46\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"消息\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"residence:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:42:13', 15);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/label/index\",\"createTime\":\"2023-10-17 18:27:35\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"标签\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"label\",\"perms\":\"residence:label:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:42:46', 21);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/pay/index\",\"createTime\":\"2023-10-17 18:28:11\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"付款\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2000,\"path\":\"pay\",\"perms\":\"residence:pay:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:43:21', 16);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/picture/index\",\"createTime\":\"2023-10-17 18:28:53\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"照片\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":2000,\"path\":\"picture\",\"perms\":\"residence:picture:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:43:48', 16);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/type/index\",\"createTime\":\"2023-10-17 18:29:30\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"种类\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":2000,\"path\":\"type\",\"perms\":\"residence:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 18:44:23', 15);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:24', 249);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:28', 232);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:31', 239);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:45', 239);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:49', 233);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:53', 232);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:28:57', 232);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:29:00', 236);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:29:03', 233);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category,residence_favorite,residence_label,residence_facility,residence_house_type,residence_pay,residence_deposit,residence_brand,residence_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:30:57', 6504);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category,residence_favorite,residence_label,residence_facility,residence_house_type,residence_pay,residence_deposit,residence_brand,residence_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:31:01', 6822);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/13,21,23,24,25,26,27,28,29,30', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:31:38', 253);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/31,32,33,34,35,36,37,38,39,40', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:31:43', 247);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"residence_info,residence_brand,residence_deposit,residence_pay,residence_house_type,residence_facility,residence_label,residence_picture,residence_brand_picture,residence_favorite,residence_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:32:18', 7574);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"residence_info,residence_brand,residence_deposit,residence_pay,residence_house_type,residence_facility,residence_label,residence_picture,residence_brand_picture,residence_favorite,residence_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:32:20', 7076);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"Brandpicture\",\"className\":\"ResidenceBrandPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":346,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:32:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":42,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceBrandId\",\"columnComment\":\"房源品牌Id\",\"columnId\":347,\"columnName\":\"residence_brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:32:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceBrandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":42,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":348,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:32:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":42,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":349,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:32:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:34:20', 576);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:39:35', 307);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/61,62', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:39:40', 249);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category,residence_favorite,residence_brand_picture,residence_picture,residence_label,residence_facility,residence_house_type,residence_pay,residence_deposit,residence_brand,residence_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:40:46', 7963);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brandPicture\",\"className\":\"ResidenceBrandPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":522,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceBrandId\",\"columnComment\":\"房源品牌Id\",\"columnId\":523,\"columnName\":\"residence_brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceBrandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":524,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":525,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:42:20', 522);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"quer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:46:57', 888);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:46:56\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:46:56\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:46:57\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:47:50', 810);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brandPicture\",\"className\":\"ResidenceBrandPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":522,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:42:20\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceBrandId\",\"columnComment\":\"房源品牌Id\",\"columnId\":523,\"columnName\":\"residence_brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceBrandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:42:20\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":524,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:42:20\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":525,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 22:48:16', 473);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand\"}', NULL, 0, NULL, '2023-10-17 23:32:42', 317);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:47:50\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:47:50\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:47:50\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 23:33:56', 905);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand\"}', NULL, 0, NULL, '2023-10-17 23:35:13', 264);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:33:56\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:33:56\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:33:56\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-17 23:59:49', 929);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"deleted\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:01:27', 585);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"deposit\",\"className\":\"ResidenceDeposit\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":531,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":532,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":533,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":534,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:03:16', 638);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"deposit\",\"className\":\"ResidenceDeposit\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":531,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:16\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":532,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":533,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:16\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":534,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"s', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:03:57', 573);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"facility\",\"className\":\"ResidenceFacility\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":537,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":538,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IconUrl\",\"columnComment\":\"icon\",\"columnId\":539,\"columnName\":\"icon_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"iconUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SystemType\",\"columnComment\":\"是否为系统内置\",\"columnId\":540,\"columnName\":\"system_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"systemType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:05:47', 706);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"favorite\",\"className\":\"ResidenceFavorite\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":544,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户Id\",\"columnId\":545,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceId\",\"columnComment\":\"房源Id\",\"columnId\":546,\"columnName\":\"residence_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"residenceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":547,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:07:34', 553);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"ResidenceHouseType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":549,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":550,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":551,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":552,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"requ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:08:44', 516);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"label\",\"className\":\"ResidenceLabel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":585,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":586,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SystemType\",\"columnComment\":\"是否为系统内置\",\"columnId\":587,\"columnName\":\"system_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"systemType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":588,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:10:36', 597);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"pay\",\"className\":\"ResidencePay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":591,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":592,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":593,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":594,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:12:18', 597);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"picture\",\"className\":\"ResidencePicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":597,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceId\",\"columnComment\":\"房源Id\",\"columnId\":598,\"columnName\":\"residence_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":599,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":600,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 00:13:32', 479);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '185.217.5.60', 'XX XX', '{\"businessName\":\"picture\",\"className\":\"ResidencePicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":597,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:13:31\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceId\",\"columnComment\":\"房源Id\",\"columnId\":598,\"columnName\":\"residence_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:13:31\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":599,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":73,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:13:31\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":600,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 10:39:51', 44);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '185.217.5.60', 'XX XX', '{\"businessName\":\"info\",\"className\":\"ResidenceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":554,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"房源分类id\",\"columnId\":555,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BrandId\",\"columnComment\":\"房源品牌id\",\"columnId\":556,\"columnName\":\"brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"价格\",\"columnId\":557,\"columnName\":\"price\",\"columnType\":\"decimal(12,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"price\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"que', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:03:54', 89);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '185.217.5.60', 'XX XX', '{\"tables\":\"residence_brand,residence_brand_picture,residence_category,residence_deposit,residence_facility,residence_favorite,residence_house_type,residence_info,residence_label,residence_pay,residence_picture\"}', NULL, 0, NULL, '2023-10-18 17:04:08', 292);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '185.217.5.60', 'XX XX', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房源管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"redi\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:12:16', 27);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '185.217.5.60', 'XX XX', '{\"children\":[],\"createTime\":\"2023-10-18 17:12:15\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"房源管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"residence\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:13:59', 18);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '185.217.5.60', 'XX XX', '{\"businessName\":\"label\",\"className\":\"ResidenceLabel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":585,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:10:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":586,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:10:35\",\"usableColumn\":false},{\"capJavaField\":\"SystemType\",\"columnComment\":\"是否为系统内置\",\"columnId\":587,\"columnName\":\"system_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"systemType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:10:35\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":588,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQue', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:20:35', 32);
INSERT INTO `sys_oper_log` VALUES (179, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '185.217.5.60', 'XX XX', '{\"admin\":true,\"createTime\":\"2023-09-21 23:39:23\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122],\"params\":{},\"remark\":\"超级管理员\",\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员角色', '2023-10-18 17:28:05', 2);
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '185.217.5.60', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-09-21 23:39:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:29:25', 47);
INSERT INTO `sys_oper_log` VALUES (181, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '185.217.5.60', 'XX XX', '{\"admin\":false,\"createTime\":\"2023-09-21 23:39:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:29:26', 52);
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '185.217.5.60', 'XX XX', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"dev\",\"params\":{},\"postIds\":[1],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:38:32', 100);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '185.217.5.60', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:40:07', 23);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '185.217.5.60', 'XX XX', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"测试\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":101,\"userName\":\"dev\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 17:42:45', 103);
INSERT INTO `sys_oper_log` VALUES (185, '房源户型设定', 1, 'com.ruoyi.residence.controller.ResidenceHouseTypeController.add()', 'POST', 1, 'dev', NULL, '/residence/type', '185.217.5.60', 'XX XX', '{\"id\":1,\"name\":\"一室一厅\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:11:50', 34);
INSERT INTO `sys_oper_log` VALUES (186, '房源户型设定', 1, 'com.ruoyi.residence.controller.ResidenceHouseTypeController.add()', 'POST', 1, 'dev', NULL, '/residence/type', '185.217.5.60', 'XX XX', '{\"id\":2,\"name\":\"一室一厅\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:11:50', 16);
INSERT INTO `sys_oper_log` VALUES (187, '房源户型设定', 2, 'com.ruoyi.residence.controller.ResidenceHouseTypeController.edit()', 'PUT', 1, 'dev', NULL, '/residence/type', '185.217.5.60', 'XX XX', '{\"deleted\":0,\"display\":1,\"id\":2,\"name\":\"两室一厅\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:12:07', 21);
INSERT INTO `sys_oper_log` VALUES (188, '房源押金设置', 1, 'com.ruoyi.residence.controller.ResidenceDepositController.add()', 'POST', 1, 'admin', NULL, '/residence/deposit', '127.0.0.1', '内网IP', '{\"id\":1,\"name\":\"押金\",\"params\":{},\"sort\":1,\"value\":1200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:18:06', 29);
INSERT INTO `sys_oper_log` VALUES (189, '房源押金设置', 3, 'com.ruoyi.residence.controller.ResidenceDepositController.remove()', 'DELETE', 1, 'admin', NULL, '/residence/deposit/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:18:18', 18);
INSERT INTO `sys_oper_log` VALUES (190, '房源户型设定', 2, 'com.ruoyi.residence.controller.ResidenceHouseTypeController.edit()', 'PUT', 1, 'dev', NULL, '/residence/type', '185.217.5.60', 'XX XX', '{\"deleted\":0,\"display\":1,\"id\":1,\"name\":\"一室一厅\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:20:34', 33);
INSERT INTO `sys_oper_log` VALUES (191, '房源付款设置', 1, 'com.ruoyi.residence.controller.ResidencePayController.add()', 'POST', 1, 'dev', NULL, '/residence/pay', '185.217.5.60', 'XX XX', '{\"id\":1,\"params\":{},\"sort\":1,\"value\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:21:31', 18);
INSERT INTO `sys_oper_log` VALUES (192, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-18 18:25:26\",\"description\":\"1\",\"id\":1,\"params\":{},\"residenceBrandPictureList\":[{\"params\":{},\"picUrl\":\"\",\"residenceBrandId\":1}],\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:25:26', 51);
INSERT INTO `sys_oper_log` VALUES (193, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-18 18:28:12\",\"description\":\"2\",\"id\":2,\"name\":\"卓越\",\"params\":{},\"residenceBrandPictureList\":[],\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 18:28:12', 15);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:59:48\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:59:48\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 23:59:48\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:08:13', 825);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"info\",\"className\":\"ResidenceInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":554,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:03:54\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"房源分类id\",\"columnId\":555,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:03:54\",\"usableColumn\":false},{\"capJavaField\":\"BrandId\",\"columnComment\":\"房源品牌id\",\"columnId\":556,\"columnName\":\"brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"brandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":70,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:03:54\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"价格\",\"columnId\":557,\"columnName\":\"price\",\"columnType\":\"decimal(12,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:09:16', 2249);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand,residence_info\"}', NULL, 0, NULL, '2023-10-18 22:09:28', 672);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/info/index\",\"createTime\":\"2023-10-18 17:22:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"房源信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"info\",\"perms\":\"residence:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:16:57', 147);
INSERT INTO `sys_oper_log` VALUES (198, '房源收藏', 5, 'com.ruoyi.residence.controller.ResidenceFavoriteController.export()', 'POST', 1, 'admin', NULL, '/residence/favorite/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-18 22:37:17', 1052);
INSERT INTO `sys_oper_log` VALUES (199, '房源品牌', 5, 'com.ruoyi.residence.controller.ResidenceBrandController.export()', 'POST', 1, 'admin', NULL, '/residence/brand/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-18 22:37:35', 82);
INSERT INTO `sys_oper_log` VALUES (200, '房源品牌', 3, 'com.ruoyi.residence.controller.ResidenceBrandController.remove()', 'DELETE', 1, 'admin', NULL, '/residence/brand/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:48:23', 17);
INSERT INTO `sys_oper_log` VALUES (201, '房源品牌', 3, 'com.ruoyi.residence.controller.ResidenceBrandController.remove()', 'DELETE', 1, 'admin', NULL, '/residence/brand/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:48:25', 21);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"residence/uploadimg/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"图片上传\",\"menuType\":\"C\",\"orderNum\":12,\"params\":{},\"parentId\":2000,\"path\":\"uploadimg\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-18 22:57:29', 45);
INSERT INTO `sys_oper_log` VALUES (203, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-19 00:12:50\",\"description\":\"1\",\"id\":3,\"name\":\"卓越\",\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001246A001.png\",\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:12:50', 257);
INSERT INTO `sys_oper_log` VALUES (204, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-19 00:13:42\",\"description\":\"2\",\"id\":4,\"name\":\"卓越2\",\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001332A002.png,/profile/upload/2023/10/19/show_20231019001338A003.png\",\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:13:42', 18);
INSERT INTO `sys_oper_log` VALUES (205, '房源图片', 1, 'com.ruoyi.residence.controller.ResidencePictureController.add()', 'POST', 1, 'admin', NULL, '/residence/picture', '127.0.0.1', '内网IP', '{\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/show_20231019001408A004.png\",\"sort\":1}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/projects/zufangbao/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-residence-3.8.6.jar!/mapper/residence/ResidencePictureMapper.xml]\n### The error may involve com.ruoyi.residence.mapper.ResidencePictureMapper.insertResidencePicture-Inline\n### The error occurred while setting parameters\n### SQL: insert into residence_picture          ( pic_url,             sort )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n; Field \'residence_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value', '2023-10-19 00:14:11', 105);
INSERT INTO `sys_oper_log` VALUES (206, '房源图片', 1, 'com.ruoyi.residence.controller.ResidencePictureController.add()', 'POST', 1, 'admin', NULL, '/residence/picture', '127.0.0.1', '内网IP', '{\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/show_20231019001408A004.png\",\"sort\":1}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/projects/zufangbao/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-residence-3.8.6.jar!/mapper/residence/ResidencePictureMapper.xml]\n### The error may involve com.ruoyi.residence.mapper.ResidencePictureMapper.insertResidencePicture-Inline\n### The error occurred while setting parameters\n### SQL: insert into residence_picture          ( pic_url,             sort )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n; Field \'residence_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value', '2023-10-19 00:14:13', 8);
INSERT INTO `sys_oper_log` VALUES (207, '房源图片', 1, 'com.ruoyi.residence.controller.ResidencePictureController.add()', 'POST', 1, 'admin', NULL, '/residence/picture', '127.0.0.1', '内网IP', '{\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001423A005.png\",\"sort\":1}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/projects/zufangbao/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-residence-3.8.6.jar!/mapper/residence/ResidencePictureMapper.xml]\n### The error may involve com.ruoyi.residence.mapper.ResidencePictureMapper.insertResidencePicture-Inline\n### The error occurred while setting parameters\n### SQL: insert into residence_picture          ( pic_url,             sort )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n; Field \'residence_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value', '2023-10-19 00:14:26', 7);
INSERT INTO `sys_oper_log` VALUES (208, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-19 00:14:54\",\"description\":\"3\",\"id\":5,\"name\":\"3\",\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001451A006.png\",\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:14:54', 19);
INSERT INTO `sys_oper_log` VALUES (209, '房源图片', 1, 'com.ruoyi.residence.controller.ResidencePictureController.add()', 'POST', 1, 'admin', NULL, '/residence/picture', '127.0.0.1', '内网IP', '{\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001509A007.png\",\"sort\":1}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/projects/zufangbao/ruoyi-admin.jar!/BOOT-INF/lib/ruoyi-residence-3.8.6.jar!/mapper/residence/ResidencePictureMapper.xml]\n### The error may involve com.ruoyi.residence.mapper.ResidencePictureMapper.insertResidencePicture-Inline\n### The error occurred while setting parameters\n### SQL: insert into residence_picture          ( pic_url,             sort )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value\n; Field \'residence_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'residence_id\' doesn\'t have a default value', '2023-10-19 00:15:10', 7);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brandPicture\",\"className\":\"ResidenceBrandPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":522,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:48:16\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceBrandId\",\"columnComment\":\"房源品牌Id\",\"columnId\":523,\"columnName\":\"residence_brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceBrandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:48:16\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":524,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-17 22:48:16\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":525,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:34:54', 72);
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand_picture\"}', NULL, 0, NULL, '2023-10-19 00:35:10', 42);
INSERT INTO `sys_oper_log` VALUES (212, '房源分类', 1, 'com.ruoyi.residence.controller.ResidenceCategoryController.add()', 'POST', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":1,\"name\":\"1\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:35:48', 28);
INSERT INTO `sys_oper_log` VALUES (213, '房源押金设置', 1, 'com.ruoyi.residence.controller.ResidenceDepositController.add()', 'POST', 1, 'admin', NULL, '/residence/deposit', '127.0.0.1', '内网IP', '{\"id\":2,\"name\":\"1\",\"params\":{},\"sort\":1,\"value\":123}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 00:36:38', 20);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:01:26\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:01:26\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:01:26\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:46:49', 37);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 11:46:58', 48);
INSERT INTO `sys_oper_log` VALUES (216, '房源分类', 1, 'com.ruoyi.residence.controller.ResidenceCategoryController.add()', 'POST', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"id\":2,\"name\":\"2\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:50:43', 14);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:46:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:46:49\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:46:49\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:52:16', 36);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:52:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:52:16\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"radio\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:52:16\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:53:23', 31);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:23\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:23\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:23\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:53:58', 30);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:58\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:58\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:53:58\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:58:49', 26);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:58:49\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:58:49\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:58:49\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 11:59:28', 40);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:59:28\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:59:28\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 11:59:28\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:01:40', 70);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:01:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:01:40\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:01:40\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:02:04', 32);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:02:23', 37);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 12:03:54', 30);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2123', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:05:58', 30);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:23\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:23\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:02:23\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:07:06', 25);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 12:07:13', 33);
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brandPicture\",\"className\":\"ResidenceBrandPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":522,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 00:34:54\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceBrandId\",\"columnComment\":\"房源品牌Id\",\"columnId\":523,\"columnName\":\"residence_brand_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceBrandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 00:34:54\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"图片路径\",\"columnId\":524,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":64,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 00:34:54\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":525,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:08:10', 38);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand_picture\"}', NULL, 0, NULL, '2023-10-19 12:08:15', 34);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:07:06\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:07:06\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:07:06\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isLis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:11:09', 27);
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 12:11:28', 32);
INSERT INTO `sys_oper_log` VALUES (233, '房源分类', 1, 'com.ruoyi.residence.controller.ResidenceCategoryController.add()', 'POST', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"display\":0,\"id\":3,\"name\":\"3\",\"params\":{},\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:13:32', 14);
INSERT INTO `sys_oper_log` VALUES (234, '房源分类', 2, 'com.ruoyi.residence.controller.ResidenceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"deleted\":0,\"display\":0,\"id\":2,\"name\":\"2\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 12:13:45', 13);
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:11:09\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:11:09\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"sys_yes_no\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 12:11:09\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:25:40', 25);
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 21:25:58', 36);
INSERT INTO `sys_oper_log` VALUES (237, '房源分类', 1, 'com.ruoyi.residence.controller.ResidenceCategoryController.add()', 'POST', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"id\":4,\"name\":\"4\",\"params\":{},\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:28:27', 16);
INSERT INTO `sys_oper_log` VALUES (238, '房源分类', 1, 'com.ruoyi.residence.controller.ResidenceCategoryController.add()', 'POST', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"id\":5,\"name\":\"5\",\"params\":{},\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:28:33', 13);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:25:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:25:40\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"sys_yes_no\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:25:40\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:29:09', 31);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 21:29:32', 42);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.2.102', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 21:31:22', 52);
INSERT INTO `sys_oper_log` VALUES (242, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-21 23:39:24\",\"cssClass\":\"\",\"default\":true,\"dictCode\":12,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"sys_yes_no\",\"dictValue\":\"1\",\"isDefault\":\"Y\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"系统默认是\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:38:44', 20);
INSERT INTO `sys_oper_log` VALUES (243, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-09-21 23:39:24\",\"cssClass\":\"\",\"default\":false,\"dictCode\":13,\"dictLabel\":\"否\",\"dictSort\":2,\"dictType\":\"sys_yes_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"remark\":\"系统默认否\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:38:50', 21);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ResidenceCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":526,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:29:09\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":527,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:29:09\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":528,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"sys_yes_no\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"display\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":65,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:29:09\",\"usableColumn\":false},{\"capJavaField\":\"Deleted\",\"columnComment\":\"是否删除\",\"columnId\":529,\"columnName\":\"deleted\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:39:40', 38);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_category\"}', NULL, 0, NULL, '2023-10-19 21:39:44', 33);
INSERT INTO `sys_oper_log` VALUES (246, '房源分类', 2, 'com.ruoyi.residence.controller.ResidenceCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/residence/category', '127.0.0.1', '内网IP', '{\"deleted\":0,\"display\":0,\"id\":1,\"name\":\"1\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:40:55', 16);
INSERT INTO `sys_oper_log` VALUES (247, '房源品牌', 1, 'com.ruoyi.residence.controller.ResidenceBrandController.add()', 'POST', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-19 21:41:33\",\"description\":\"4\",\"id\":6,\"name\":\"4\",\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019214126A009.png\",\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:41:34', 18);
INSERT INTO `sys_oper_log` VALUES (248, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"品牌状态\",\"dictType\":\"brand_status\",\"params\":{},\"remark\":\"品牌上架下架\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:48:03', 35);
INSERT INTO `sys_oper_log` VALUES (249, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"上架\",\"dictSort\":1,\"dictType\":\"brand_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"remark\":\"上架\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:49:29', 22);
INSERT INTO `sys_oper_log` VALUES (250, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"下架\",\"dictSort\":2,\"dictType\":\"brand_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"remark\":\"下架\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:49:48', 34);
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 22:08:12\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 22:08:12\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 22:08:13\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:50:14', 42);
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_brand\"}', NULL, 0, NULL, '2023-10-19 21:50:18', 35);
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '192.168.2.102', '内网IP', '{\"businessName\":\"brand\",\"className\":\"ResidenceBrand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":513,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:50:14\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"品牌名称\",\"columnId\":514,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:50:14\",\"usableColumn\":false},{\"capJavaField\":\"PicUrl\",\"columnComment\":\"品牌首页图片\",\"columnId\":515,\"columnName\":\"pic_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"picUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":63,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:50:14\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"品牌描述\",\"columnId\":516,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isLi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:53:08', 42);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '192.168.2.102', '内网IP', '{\"tables\":\"residence_brand\"}', NULL, 0, NULL, '2023-10-19 21:53:10', 45);
INSERT INTO `sys_oper_log` VALUES (255, '房源品牌', 2, 'com.ruoyi.residence.controller.ResidenceBrandController.edit()', 'PUT', 1, 'admin', NULL, '/residence/brand', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-10-19 00:12:50\",\"deleted\":0,\"description\":\"1\",\"display\":0,\"id\":3,\"name\":\"卓越\",\"params\":{},\"picUrl\":\"/profile/upload/2023/10/19/img_20231019001246A001.png\",\"residenceBrandPictureList\":[],\"sort\":1,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:55:42', 23);
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"deposit\",\"className\":\"ResidenceDeposit\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":531,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:57\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":532,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:57\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":533,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:03:57\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":534,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"s', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 21:58:42', 30);
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_deposit\"}', NULL, 0, NULL, '2023-10-19 21:58:50', 55);
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"deposit\",\"className\":\"ResidenceDeposit\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":531,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:58:42\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":532,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:58:42\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":533,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 21:58:42\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":534,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"s', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:00:51', 35);
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_deposit\"}', NULL, 0, NULL, '2023-10-19 22:00:55', 45);
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"pay\",\"className\":\"ResidencePay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":591,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:12:18\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":592,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:12:18\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":593,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":72,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:12:18\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":594,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:07:54', 32);
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_pay\"}', NULL, 0, NULL, '2023-10-19 22:07:59', 23);
INSERT INTO `sys_oper_log` VALUES (262, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"deposit\",\"className\":\"ResidenceDeposit\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":531,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 22:00:51\",\"usableColumn\":false},{\"capJavaField\":\"Value\",\"columnComment\":\"值\",\"columnId\":532,\"columnName\":\"value\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"value\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 22:00:51\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":533,\"columnName\":\"name\",\"columnType\":\"varchar(25)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":66,\"updateBy\":\"\",\"updateTime\":\"2023-10-19 22:00:51\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":534,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:08:13', 25);
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_deposit\"}', NULL, 0, NULL, '2023-10-19 22:08:18', 56);
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"ResidenceHouseType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":549,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:08:44\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":550,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:08:44\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":551,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"sort\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":69,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:08:44\",\"usableColumn\":false},{\"capJavaField\":\"Display\",\"columnComment\":\"是否可见\",\"columnId\":552,\"columnName\":\"display\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:42\",\"dictType\":\"sys_yes_no\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:12:06', 27);
INSERT INTO `sys_oper_log` VALUES (265, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_house_type\"}', NULL, 0, NULL, '2023-10-19 22:12:12', 29);
INSERT INTO `sys_oper_log` VALUES (266, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"iconUrl\":\"/profile/upload/2023/10/19/img_20231019221350A010.png\",\"id\":1,\"name\":\"1\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:13:52', 22);
INSERT INTO `sys_oper_log` VALUES (267, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"facility\",\"className\":\"ResidenceFacility\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":537,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:05:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":538,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:05:47\",\"usableColumn\":false},{\"capJavaField\":\"IconUrl\",\"columnComment\":\"配置图标\",\"columnId\":539,\"columnName\":\"icon_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"iconUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":67,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:05:47\",\"usableColumn\":false},{\"capJavaField\":\"SystemType\",\"columnComment\":\"是否为系统内置\",\"columnId\":540,\"columnName\":\"system_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:15:45', 29);
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_facility\"}', NULL, 0, NULL, '2023-10-19 22:15:50', 36);
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"label\",\"className\":\"ResidenceLabel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":585,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:20:35\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":586,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:20:35\",\"usableColumn\":false},{\"capJavaField\":\"SystemType\",\"columnComment\":\"是否为系统内置\",\"columnId\":587,\"columnName\":\"system_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"systemType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":71,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 17:20:35\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":588,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:17:08', 29);
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_label\"}', NULL, 0, NULL, '2023-10-19 22:17:14', 35);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"favorite\",\"className\":\"ResidenceFavorite\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":544,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:07:33\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户Id\",\"columnId\":545,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:07:33\",\"usableColumn\":false},{\"capJavaField\":\"ResidenceId\",\"columnComment\":\"房源Id\",\"columnId\":546,\"columnName\":\"residence_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"residenceId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":68,\"updateBy\":\"\",\"updateTime\":\"2023-10-18 00:07:33\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":547,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-10-17 22:40:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:19:16', 35);
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"residence_favorite\"}', NULL, 0, NULL, '2023-10-19 22:19:25', 31);
INSERT INTO `sys_oper_log` VALUES (273, '房源标签', 1, 'com.ruoyi.residence.controller.ResidenceLabelController.add()', 'POST', 1, 'admin', NULL, '/residence/label', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":1,\"name\":\"电梯房\",\"params\":{},\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:27:15', 22);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-10-18 17:22:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2088,\"menuName\":\"房源收藏查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2087,\"path\":\"#\",\"perms\":\"residence:favorite:query\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:29:09', 22);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-10-18 17:22:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2089,\"menuName\":\"房源收藏新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2087,\"path\":\"#\",\"perms\":\"residence:favorite:add\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:29:15', 19);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-10-18 17:22:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2088,\"menuName\":\"房源收藏查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2087,\"path\":\"#\",\"perms\":\"residence:favorite:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:30:06', 17);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-10-18 17:22:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2089,\"menuName\":\"房源收藏新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2087,\"path\":\"#\",\"perms\":\"residence:favorite:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:30:10', 16);
INSERT INTO `sys_oper_log` VALUES (278, '房源配置', 2, 'com.ruoyi.residence.controller.ResidenceFacilityController.edit()', 'PUT', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"deleted\":0,\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i1_a_20231019223222A011.png\",\"id\":1,\"name\":\"洗衣机\",\"params\":{},\"sort\":1,\"systemType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:32:25', 12);
INSERT INTO `sys_oper_log` VALUES (279, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i2_a_20231019223236A012.png\",\"id\":2,\"name\":\"空调\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:32:40', 12);
INSERT INTO `sys_oper_log` VALUES (280, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i3_a_20231019223250A013.png\",\"id\":3,\"name\":\"衣柜\",\"params\":{},\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:32:53', 12);
INSERT INTO `sys_oper_log` VALUES (281, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i4_a_20231019223305A014.png\",\"id\":4,\"name\":\"电视\",\"params\":{},\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:33:09', 15);
INSERT INTO `sys_oper_log` VALUES (282, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"iconUrl\":\"/profile/upload/2023/10/19/i6_a_20231019223326A015.png\",\"id\":5,\"name\":\"热水器\",\"params\":{},\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:33:29', 13);
INSERT INTO `sys_oper_log` VALUES (283, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i7_a_20231019223340A016.png\",\"id\":6,\"name\":\"床\",\"params\":{},\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:33:43', 14);
INSERT INTO `sys_oper_log` VALUES (284, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"iconUrl\":\"/profile/upload/2023/10/19/i8_a_20231019223355A017.png\",\"id\":7,\"name\":\"WiFi\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:33:58', 12);
INSERT INTO `sys_oper_log` VALUES (285, '房源配置', 2, 'com.ruoyi.residence.controller.ResidenceFacilityController.edit()', 'PUT', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"deleted\":0,\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i8_a_20231019223355A017.png\",\"id\":7,\"name\":\"WiFi\",\"params\":{},\"sort\":7,\"systemType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:34:03', 11);
INSERT INTO `sys_oper_log` VALUES (286, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i9_a_20231019223417A018.png\",\"id\":8,\"name\":\"天然气\",\"params\":{},\"sort\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:34:21', 13);
INSERT INTO `sys_oper_log` VALUES (287, '房源配置', 2, 'com.ruoyi.residence.controller.ResidenceFacilityController.edit()', 'PUT', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"deleted\":0,\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i9_a_20231019223417A018.png\",\"id\":8,\"name\":\"天然气\",\"params\":{},\"sort\":8,\"systemType\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:34:32', 11);
INSERT INTO `sys_oper_log` VALUES (288, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i5_a_20231019223448A019.png\",\"id\":9,\"name\":\"冰箱\",\"params\":{},\"sort\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:34:51', 14);
INSERT INTO `sys_oper_log` VALUES (289, '房源配置', 1, 'com.ruoyi.residence.controller.ResidenceFacilityController.add()', 'POST', 1, 'admin', NULL, '/residence/facility', '127.0.0.1', '内网IP', '{\"display\":1,\"iconUrl\":\"/profile/upload/2023/10/19/i10_a_20231019223503A020.png\",\"id\":10,\"name\":\"阳台\",\"params\":{},\"sort\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:35:06', 15);
INSERT INTO `sys_oper_log` VALUES (290, '房源标签', 1, 'com.ruoyi.residence.controller.ResidenceLabelController.add()', 'POST', 1, 'admin', NULL, '/residence/label', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":2,\"name\":\"已实名\",\"params\":{},\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:35:50', 13);
INSERT INTO `sys_oper_log` VALUES (291, '房源标签', 1, 'com.ruoyi.residence.controller.ResidenceLabelController.add()', 'POST', 1, 'admin', NULL, '/residence/label', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":3,\"name\":\"必看好房\",\"params\":{},\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:36:00', 12);
INSERT INTO `sys_oper_log` VALUES (292, '房源标签', 1, 'com.ruoyi.residence.controller.ResidenceLabelController.add()', 'POST', 1, 'admin', NULL, '/residence/label', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":4,\"name\":\"交通便利\",\"params\":{},\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:36:09', 12);
INSERT INTO `sys_oper_log` VALUES (293, '房源标签', 1, 'com.ruoyi.residence.controller.ResidenceLabelController.add()', 'POST', 1, 'admin', NULL, '/residence/label', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":5,\"name\":\"生活便捷\",\"params\":{},\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:36:21', 13);
INSERT INTO `sys_oper_log` VALUES (294, '房源押金设置', 1, 'com.ruoyi.residence.controller.ResidenceDepositController.add()', 'POST', 1, 'admin', NULL, '/residence/deposit', '127.0.0.1', '内网IP', '{\"display\":1,\"id\":3,\"params\":{},\"sort\":2,\"value\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 22:37:25', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-09-21 23:39:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-09-21 23:39:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-09-21 23:39:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-09-21 23:39:23', 'admin', '2023-10-18 17:29:26', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2057);
INSERT INTO `sys_role_menu` VALUES (2, 2058);
INSERT INTO `sys_role_menu` VALUES (2, 2059);
INSERT INTO `sys_role_menu` VALUES (2, 2060);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2064);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2066);
INSERT INTO `sys_role_menu` VALUES (2, 2067);
INSERT INTO `sys_role_menu` VALUES (2, 2068);
INSERT INTO `sys_role_menu` VALUES (2, 2069);
INSERT INTO `sys_role_menu` VALUES (2, 2070);
INSERT INTO `sys_role_menu` VALUES (2, 2071);
INSERT INTO `sys_role_menu` VALUES (2, 2072);
INSERT INTO `sys_role_menu` VALUES (2, 2073);
INSERT INTO `sys_role_menu` VALUES (2, 2074);
INSERT INTO `sys_role_menu` VALUES (2, 2075);
INSERT INTO `sys_role_menu` VALUES (2, 2076);
INSERT INTO `sys_role_menu` VALUES (2, 2077);
INSERT INTO `sys_role_menu` VALUES (2, 2078);
INSERT INTO `sys_role_menu` VALUES (2, 2079);
INSERT INTO `sys_role_menu` VALUES (2, 2080);
INSERT INTO `sys_role_menu` VALUES (2, 2081);
INSERT INTO `sys_role_menu` VALUES (2, 2082);
INSERT INTO `sys_role_menu` VALUES (2, 2083);
INSERT INTO `sys_role_menu` VALUES (2, 2084);
INSERT INTO `sys_role_menu` VALUES (2, 2085);
INSERT INTO `sys_role_menu` VALUES (2, 2086);
INSERT INTO `sys_role_menu` VALUES (2, 2087);
INSERT INTO `sys_role_menu` VALUES (2, 2088);
INSERT INTO `sys_role_menu` VALUES (2, 2089);
INSERT INTO `sys_role_menu` VALUES (2, 2090);
INSERT INTO `sys_role_menu` VALUES (2, 2091);
INSERT INTO `sys_role_menu` VALUES (2, 2092);
INSERT INTO `sys_role_menu` VALUES (2, 2093);
INSERT INTO `sys_role_menu` VALUES (2, 2094);
INSERT INTO `sys_role_menu` VALUES (2, 2095);
INSERT INTO `sys_role_menu` VALUES (2, 2096);
INSERT INTO `sys_role_menu` VALUES (2, 2097);
INSERT INTO `sys_role_menu` VALUES (2, 2098);
INSERT INTO `sys_role_menu` VALUES (2, 2099);
INSERT INTO `sys_role_menu` VALUES (2, 2100);
INSERT INTO `sys_role_menu` VALUES (2, 2101);
INSERT INTO `sys_role_menu` VALUES (2, 2102);
INSERT INTO `sys_role_menu` VALUES (2, 2103);
INSERT INTO `sys_role_menu` VALUES (2, 2104);
INSERT INTO `sys_role_menu` VALUES (2, 2105);
INSERT INTO `sys_role_menu` VALUES (2, 2106);
INSERT INTO `sys_role_menu` VALUES (2, 2107);
INSERT INTO `sys_role_menu` VALUES (2, 2108);
INSERT INTO `sys_role_menu` VALUES (2, 2109);
INSERT INTO `sys_role_menu` VALUES (2, 2110);
INSERT INTO `sys_role_menu` VALUES (2, 2111);
INSERT INTO `sys_role_menu` VALUES (2, 2112);
INSERT INTO `sys_role_menu` VALUES (2, 2113);
INSERT INTO `sys_role_menu` VALUES (2, 2114);
INSERT INTO `sys_role_menu` VALUES (2, 2115);
INSERT INTO `sys_role_menu` VALUES (2, 2116);
INSERT INTO `sys_role_menu` VALUES (2, 2117);
INSERT INTO `sys_role_menu` VALUES (2, 2118);
INSERT INTO `sys_role_menu` VALUES (2, 2119);
INSERT INTO `sys_role_menu` VALUES (2, 2120);
INSERT INTO `sys_role_menu` VALUES (2, 2121);
INSERT INTO `sys_role_menu` VALUES (2, 2122);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.2.102', '2023-10-19 21:31:09', 'admin', '2023-09-21 23:39:23', '', '2023-10-19 21:31:08', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '116.30.242.61', '2023-10-18 17:41:25', 'admin', '2023-09-21 23:39:23', '', '2023-10-18 17:41:24', '测试员');
INSERT INTO `sys_user` VALUES (101, NULL, 'dev', '测试', '00', '', '', '0', '', '$2a$10$FeqV6B4DOZ4w1zffyrM93uHbF8cYWPQBjZinBq2d5ZE5GSidb1ucm', '0', '0', '185.217.5.60', '2023-10-19 00:07:34', 'admin', '2023-10-18 17:42:45', '', '2023-10-19 00:07:33', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);

SET FOREIGN_KEY_CHECKS = 1;
