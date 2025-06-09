-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: agileboot-pure
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(128) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_key` varchar(128) NOT NULL DEFAULT '' COMMENT '配置键名',
  `config_options` varchar(1024) NOT NULL DEFAULT '' COMMENT '可选的选项',
  `config_value` varchar(256) NOT NULL DEFAULT '' COMMENT '配置值',
  `is_allow_change` tinyint(1) NOT NULL COMMENT '是否允许修改',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_key_uniq_idx` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','[\"skin-blue\",\"skin-green\",\"skin-purple\",\"skin-red\",\"skin-yellow\"]','skin-blue',1,NULL,NULL,'2022-08-28 22:12:19','2022-05-21 08:30:55','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow',0),(2,'用户管理-账号初始密码','sys.user.initPassword','','123456',1,NULL,1,'2023-07-20 14:42:08','2022-05-21 08:30:55','初始化密码 123456',0),(3,'主框架页-侧边栏主题','sys.index.sideTheme','[\"theme-dark\",\"theme-light\"]','theme-dark',1,NULL,NULL,'2022-08-28 22:12:15','2022-08-20 08:30:55','深色主题theme-dark，浅色主题theme-light',0),(4,'账号自助-验证码开关','sys.account.captchaOnOff','[\"true\",\"false\"]','false',0,NULL,1,'2023-07-20 14:39:36','2022-05-21 08:30:55','是否开启验证码功能（true开启，false关闭）',0),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','[\"true\",\"false\"]','true',0,NULL,1,'2022-10-05 22:18:57','2022-05-21 08:30:55','是否开启注册用户功能（true开启，false关闭）',0);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
  `ancestors` text NOT NULL COMMENT '祖级列表',
  `dept_name` varchar(64) NOT NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `leader_id` bigint DEFAULT NULL,
  `leader_name` varchar(64) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '部门状态（0停用 1启用）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'0','北银理财',0,NULL,'阿尔法','','',1,NULL,'2022-05-21 08:30:54',1,'2025-06-07 20:45:23',0),(2,1,'0,1','深圳总公司',1,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(3,1,'0,1','长沙分公司',2,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(4,2,'0,1,2','研发部门',1,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(5,2,'0,1,2','市场部门',2,NULL,'valarchie','15888888888','valarchie@163.com',0,NULL,'2022-05-21 08:30:54',1,'2023-07-20 22:46:41',1),(6,2,'0,1,2','测试部门',3,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(7,2,'0,1,2','财务部门',4,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(8,2,'0,1,2','运维部门',5,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(9,3,'0,1,3','市场部!',1,NULL,'valarchie!!','15888188888','valarc1hie@163.com',0,NULL,'2022-05-21 08:30:54',1,'2023-07-20 22:33:31',1),(10,3,'0,1,3','财务部门',2,NULL,'valarchie','15888888888','valarchie@163.com',0,NULL,'2022-05-21 08:30:54',NULL,NULL,1),(11,1,'0,1','金融科技部',0,NULL,'赵昕','','',1,1,'2025-06-07 20:48:26',NULL,NULL,0),(12,1,'0,1','多资产配置部',2,NULL,'','','',1,1,'2025-06-07 20:55:51',1,'2025-06-07 20:56:34',0),(13,1,'0,1','首席投资官',0,NULL,'','','',1,1,'2025-06-07 20:57:09',NULL,NULL,0),(14,1,'0,1','高管',0,NULL,'','','',1,1,'2025-06-07 20:57:21',NULL,NULL,0),(15,1,'0,1','研究部',0,NULL,'','','',1,1,'2025-06-07 20:57:37',NULL,NULL,0),(16,1,'0,1','固定收益部',0,NULL,'','','',1,1,'2025-06-07 20:57:58',NULL,NULL,0),(17,1,'0,1','项目投资部',0,NULL,'','','',1,1,'2025-06-07 20:58:07',NULL,NULL,0),(18,1,'0,1','集中交易室',0,NULL,'','','',1,1,'2025-06-07 20:58:33',1,'2025-06-07 20:58:52',0),(19,1,'0,1','产品管理部',0,NULL,'','','',1,1,'2025-06-07 20:59:14',NULL,NULL,0),(20,1,'0,1','市场营销部',0,NULL,'','','',1,1,'2025-06-07 20:59:39',NULL,NULL,0),(21,1,'0,1','风险管理部',0,NULL,'','','',1,1,'2025-06-07 20:59:52',NULL,NULL,0),(22,1,'0,1','信用评审部',0,NULL,'','','',1,1,'2025-06-07 21:00:09',NULL,NULL,0),(23,1,'0,1','法律合规部',0,NULL,'','','',1,1,'2025-06-07 21:00:27',1,'2025-06-07 21:00:50',0),(24,1,'0,1','资金财务部',0,NULL,'','','',1,1,'2025-06-07 21:01:16',NULL,NULL,0),(25,1,'0,1','综合管理部（党委办公室）',0,NULL,'','','',1,1,'2025-06-07 21:01:48',NULL,NULL,0),(26,1,'0,1','党群工作部（人力资源部）',0,NULL,'','','',1,1,'2025-06-07 21:02:16',NULL,NULL,0),(27,1,'0,1','审计部',0,NULL,'','','',1,1,'2025-06-07 21:02:54',NULL,NULL,0),(28,1,'0,1','科技专家',0,NULL,'','','',1,1,'2025-06-07 21:03:17',NULL,NULL,0),(29,1,'0,1','风险专家',0,NULL,'','','',1,1,'2025-06-07 21:03:35',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_info`
--

DROP TABLE IF EXISTS `sys_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_info` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `ip_address` varchar(128) NOT NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `operation_system` varchar(50) NOT NULL DEFAULT '' COMMENT '操作系统',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '登录状态（1成功 0失败）',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_info`
--

LOCK TABLES `sys_login_info` WRITE;
/*!40000 ALTER TABLE `sys_login_info` DISABLE KEYS */;
INSERT INTO `sys_login_info` VALUES (415,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',1,'登录成功','2023-06-29 22:49:37',0),(416,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',1,'登录成功','2023-07-02 22:12:30',0),(417,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',0,'验证码过期','2023-07-02 22:16:06',0),(418,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-06 22:59:29',0),(419,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-06 23:22:10',0),(420,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 10:12:12',0),(421,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 10:44:50',0),(422,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 12:32:38',0),(423,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 13:26:43',0),(424,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:00:00',0),(425,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:00:04',0),(426,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:01:06',0),(427,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:04:18',0),(428,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:08:31',0),(429,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 14:12:26',0),(430,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:07:31',0),(431,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:09:23',0),(432,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:17:46',0),(433,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:28:22',0),(434,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:37:31',0),(435,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:44:29',0),(436,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 15:47:13',0),(437,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 17:40:55',0),(438,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 17:43:32',0),(439,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 20:39:38',0),(440,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:06:45',0),(441,'changbo','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:08:17',0),(442,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:09:36',0),(443,'changbo','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:10:54',0),(444,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:11:45',0),(445,'changbo','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:14:06',0),(446,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:14:25',0),(447,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-07 21:44:06',0),(448,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 13','Mac OS X',1,'登录成功','2025-06-08 14:11:30',0);
/*!40000 ALTER TABLE `sys_login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_type` smallint NOT NULL DEFAULT '0' COMMENT '菜单的类型(1为普通菜单2为目录3为内嵌iFrame4为外链跳转)',
  `router_name` varchar(255) NOT NULL DEFAULT '' COMMENT '路由名称（需保持和前端对应的vue文件中的name保持一致defineOptions方法中设置的name）',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父菜单ID',
  `path` varchar(255) DEFAULT NULL COMMENT '组件路径（对应前端项目view文件夹中的路径）',
  `is_button` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否按钮',
  `permission` varchar(128) DEFAULT NULL COMMENT '权限标识',
  `meta_info` varchar(1024) NOT NULL DEFAULT '{}' COMMENT '路由元信息（前端根据这个信息进行逻辑处理）',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '菜单状态（1启用 0停用）',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1065 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',2,'',0,'/system',0,'','{\"title\":\"系统管理\",\"icon\":\"ep:management\",\"showParent\":true,\"rank\":1}',1,'系统管理目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:08:50',0),(2,'系统监控',2,'',0,'/monitor',0,'','{\"title\":\"系统监控\",\"icon\":\"ep:monitor\",\"showParent\":true,\"rank\":3}',1,'系统监控目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:09:15',0),(3,'系统工具',2,'',0,'/tool',0,'','{\"title\":\"系统工具\",\"icon\":\"ep:tools\",\"showParent\":true,\"rank\":2}',1,'系统工具目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:09:03',0),(4,'AgileBoot官网',3,'AgileBootguanwangIframeRouter',0,'/AgileBootguanwangIframeLink',0,'','{\"title\":\"AgileBoot官网\",\"icon\":\"ep:link\",\"showParent\":true,\"frameSrc\":\"https://element-plus.org/zh-CN/\",\"rank\":8}',0,'Agileboot官网地址',0,'2022-05-21 08:30:54',1,'2025-06-07 14:47:05',0),(5,'用户管理',1,'SystemUser',1,'/system/user/index',0,'system:user:list','{\"title\":\"用户管理\",\"icon\":\"ep:user-filled\",\"showParent\":true}',1,'用户管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:16:13',0),(6,'角色管理',1,'SystemRole',1,'/system/role/index',0,'system:role:list','{\"title\":\"角色管理\",\"icon\":\"ep:user\",\"showParent\":true}',1,'角色管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:16:23',0),(7,'菜单管理',1,'MenuManagement',1,'/system/menu/index',0,'system:menu:list','{\"title\":\"菜单管理\",\"icon\":\"ep:menu\",\"showParent\":true}',1,'菜单管理菜单',0,'2022-05-21 08:30:54',1,'2025-06-07 17:42:01',0),(8,'部门管理',1,'Department',1,'/system/dept/index',0,'system:dept:list','{\"title\":\"部门管理\",\"icon\":\"fa-solid:code-branch\",\"showParent\":true}',1,'部门管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:35',0),(9,'岗位管理',1,'Post',1,'/system/post/index',0,'system:post:list','{\"title\":\"岗位管理\",\"icon\":\"ep:postcard\",\"showParent\":true}',1,'岗位管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:11',0),(10,'参数设置',1,'Config',1,'/system/config/index',0,'system:config:list','{\"title\":\"参数设置\",\"icon\":\"ep:setting\",\"showParent\":true}',1,'参数设置菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:03',0),(11,'通知公告',1,'SystemNotice',1,'/system/notice/index',0,'system:notice:list','{\"title\":\"通知公告\",\"icon\":\"ep:notification\",\"showParent\":true}',1,'通知公告菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:56',0),(12,'日志管理',1,'LogManagement',1,'/system/logd',0,'','{\"title\":\"日志管理\",\"icon\":\"ep:document\",\"showParent\":true}',1,'日志管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:47',0),(13,'在线用户',1,'OnlineUser',2,'/system/monitor/onlineUser/index',0,'monitor:online:list','{\"title\":\"在线用户\",\"icon\":\"fa-solid:users\",\"showParent\":true}',1,'在线用户菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:13',0),(14,'数据监控',1,'DataMonitor',2,'/system/monitor/druid/index',0,'monitor:druid:list','{\"title\":\"数据监控\",\"icon\":\"fa:database\",\"showParent\":true,\"frameSrc\":\"/druid/login.html\",\"isFrameSrcInternal\":true}',1,'数据监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:25',0),(15,'服务监控',1,'ServerInfo',2,'/system/monitor/server/index',0,'monitor:server:list','{\"title\":\"服务监控\",\"icon\":\"fa:server\",\"showParent\":true}',1,'服务监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:34',0),(16,'缓存监控',1,'CacheInfo',2,'/system/monitor/cache/index',0,'monitor:cache:list','{\"title\":\"缓存监控\",\"icon\":\"ep:reading\",\"showParent\":true}',1,'缓存监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:12:59',0),(17,'系统接口',1,'SystemAPI',3,'/tool/swagger/index',0,'tool:swagger:list','{\"title\":\"系统接口\",\"icon\":\"ep:document-remove\",\"showParent\":true,\"frameSrc\":\"/swagger-ui/index.html\",\"isFrameSrcInternal\":true}',1,'系统接口菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:01',0),(18,'操作日志',1,'OperationLog',12,'/system/log/operationLog/index',0,'monitor:operlog:list','{\"title\":\"操作日志\"}',1,'操作日志菜单',0,'2022-05-21 08:30:54',NULL,NULL,0),(19,'登录日志',1,'LoginLog',12,'/system/log/loginLog/index',0,'monitor:logininfor:list','{\"title\":\"登录日志\"}',1,'登录日志菜单',0,'2022-05-21 08:30:54',NULL,NULL,0),(20,'用户查询',0,' ',5,'',1,'system:user:query','{\"title\":\"用户查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(21,'用户新增',0,' ',5,'',1,'system:user:add','{\"title\":\"用户新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(22,'用户修改',0,' ',5,'',1,'system:user:edit','{\"title\":\"用户修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(23,'用户删除',0,' ',5,'',1,'system:user:remove','{\"title\":\"用户删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(24,'用户导出',0,' ',5,'',1,'system:user:export','{\"title\":\"用户导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(25,'用户导入',0,' ',5,'',1,'system:user:import','{\"title\":\"用户导入\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(26,'重置密码',0,' ',5,'',1,'system:user:resetPwd','{\"title\":\"重置密码\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(27,'角色查询',0,' ',6,'',1,'system:role:query','{\"title\":\"角色查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(28,'角色新增',0,' ',6,'',1,'system:role:add','{\"title\":\"角色新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(29,'角色修改',0,' ',6,'',1,'system:role:edit','{\"title\":\"角色修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(30,'角色删除',0,' ',6,'',1,'system:role:remove','{\"title\":\"角色删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(31,'角色导出',0,' ',6,'',1,'system:role:export','{\"title\":\"角色导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(32,'菜单查询',0,' ',7,'',1,'system:menu:query','{\"title\":\"菜单查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(33,'菜单新增',0,' ',7,'',1,'system:menu:add','{\"title\":\"菜单新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(34,'菜单修改',0,' ',7,'',1,'system:menu:edit','{\"title\":\"菜单修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(35,'菜单删除',0,' ',7,'',1,'system:menu:remove','{\"title\":\"菜单删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(36,'部门查询',0,' ',8,'',1,'system:dept:query','{\"title\":\"部门查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(37,'部门新增',0,' ',8,'',1,'system:dept:add','{\"title\":\"部门新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(38,'部门修改',0,' ',8,'',1,'system:dept:edit','{\"title\":\"部门修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(39,'部门删除',0,' ',8,'',1,'system:dept:remove','{\"title\":\"部门删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(40,'岗位查询',0,' ',9,'',1,'system:post:query','{\"title\":\"岗位查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(41,'岗位新增',0,' ',9,'',1,'system:post:add','{\"title\":\"岗位新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(42,'岗位修改',0,' ',9,'',1,'system:post:edit','{\"title\":\"岗位修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(43,'岗位删除',0,' ',9,'',1,'system:post:remove','{\"title\":\"岗位删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(44,'岗位导出',0,' ',9,'',1,'system:post:export','{\"title\":\"岗位导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(45,'参数查询',0,' ',10,'',1,'system:config:query','{\"title\":\"参数查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(46,'参数新增',0,' ',10,'',1,'system:config:add','{\"title\":\"参数新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(47,'参数修改',0,' ',10,'',1,'system:config:edit','{\"title\":\"参数修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(48,'参数删除',0,' ',10,'',1,'system:config:remove','{\"title\":\"参数删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(49,'参数导出',0,' ',10,'',1,'system:config:export','{\"title\":\"参数导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(50,'公告查询',0,' ',11,'',1,'system:notice:query','{\"title\":\"公告查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(51,'公告新增',0,' ',11,'',1,'system:notice:add','{\"title\":\"公告新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(52,'公告修改',0,' ',11,'',1,'system:notice:edit','{\"title\":\"公告修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(53,'公告删除',0,' ',11,'',1,'system:notice:remove','{\"title\":\"公告删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(54,'操作查询',0,' ',18,'',1,'monitor:operlog:query','{\"title\":\"操作查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(55,'操作删除',0,' ',18,'',1,'monitor:operlog:remove','{\"title\":\"操作删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(56,'日志导出',0,' ',18,'',1,'monitor:operlog:export','{\"title\":\"日志导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(57,'登录查询',0,' ',19,'',1,'monitor:logininfor:query','{\"title\":\"登录查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(58,'登录删除',0,' ',19,'',1,'monitor:logininfor:remove','{\"title\":\"登录删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(59,'日志导出',0,' ',19,'',1,'monitor:logininfor:export','{\"title\":\"日志导出\",\"rank\":22}',1,'',0,'2022-05-21 08:30:54',1,'2023-07-22 17:02:28',0),(60,'在线查询',0,' ',13,'',1,'monitor:online:query','{\"title\":\"在线查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(61,'批量强退',0,' ',13,'',1,'monitor:online:batchLogout','{\"title\":\"批量强退\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(62,'单条强退',0,' ',13,'',1,'monitor:online:forceLogout','{\"title\":\"单条强退\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(63,'AgileBoot Github地址',4,'https://github.com/valarchie/AgileBoot-Back-End',0,'/external',0,'','{\"title\":\"AgileBoot Github地址\",\"icon\":\"fa-solid:external-link-alt\",\"showParent\":true,\"rank\":9}',0,'Agileboot github地址',0,'2022-05-21 08:30:54',1,'2025-06-07 14:47:16',0),(64,'首页',2,'',0,'/global',0,'121212','{\"title\":\"首页\",\"showParent\":true,\"rank\":3}',1,'',1,'2023-07-24 22:36:03',1,'2023-07-24 22:38:37',1),(65,'个人中心',1,'PersonalCenter',2053,'/system/user/profile',0,'434sdf','{\"title\":\"个人中心\",\"showParent\":true,\"rank\":3}',1,'',1,'2023-07-24 22:36:55',NULL,NULL,1),(66,'绩效管理',1,'SystemPerformance',1,'/system/performance/index',0,'system:performance:list','{\"title\":\"绩效管理\",\"icon\":\"ep:chart\",\"showLink\":true,\"showParent\":true}',1,'绩效管理菜单',0,'2025-06-06 22:53:54',1,'2025-06-07 14:46:23',0),(67,'绩效查询',0,'',66,'',1,'system:performance:query','{\"title\":\"绩效查询\"}',1,'',0,'2025-06-06 22:53:54',NULL,NULL,0),(68,'绩效新增',0,'',66,'',1,'system:performance:add','{\"title\":\"绩效新增\"}',1,'',0,'2025-06-06 22:53:54',NULL,NULL,0),(69,'绩效修改',0,'',66,'',1,'system:performance:edit','{\"title\":\"绩效修改\"}',1,'',0,'2025-06-06 22:53:54',NULL,NULL,0),(70,'绩效删除',0,'',66,'',1,'system:performance:remove','{\"title\":\"绩效删除\"}',1,'',0,'2025-06-06 22:53:54',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(64) NOT NULL COMMENT '公告标题',
  `notice_type` smallint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` text COMMENT '公告内容',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '公告状态（1正常 0关闭）',
  `creator_id` bigint NOT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 AgileBoot新版本发布啦',2,'新版本内容~~~~~~~~~~',1,1,'2022-05-21 08:30:55',1,'2022-08-29 20:12:37','管理员',0),(2,'维护通知：2018-07-01 AgileBoot系统凌晨维护',1,'维护内容',1,1,'2022-05-21 08:30:55',NULL,NULL,'管理员',0);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_log`
--

DROP TABLE IF EXISTS `sys_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_log` (
  `operation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `business_type` smallint NOT NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `request_method` smallint NOT NULL DEFAULT '0' COMMENT '请求方式',
  `request_module` varchar(64) NOT NULL DEFAULT '' COMMENT '请求模块',
  `request_url` varchar(256) NOT NULL DEFAULT '' COMMENT '请求URL',
  `called_method` varchar(128) NOT NULL DEFAULT '' COMMENT '调用方法',
  `operator_type` smallint NOT NULL DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `user_id` bigint DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) DEFAULT '' COMMENT '操作人员',
  `operator_ip` varchar(128) DEFAULT '' COMMENT '操作人员ip',
  `operator_location` varchar(256) DEFAULT '' COMMENT '操作地点',
  `dept_id` bigint DEFAULT '0' COMMENT '部门ID',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门名称',
  `operation_param` varchar(2048) DEFAULT '' COMMENT '请求参数',
  `operation_result` varchar(2048) DEFAULT '' COMMENT '返回参数',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '操作状态（1正常 0异常）',
  `error_stack` varchar(2048) DEFAULT '' COMMENT '错误消息',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_log`
--

LOCK TABLES `sys_operation_log` WRITE;
/*!40000 ALTER TABLE `sys_operation_log` DISABLE KEYS */;
INSERT INTO `sys_operation_log` VALUES (561,1,2,'菜单管理','/system/menus','com.agileboot.admin.controller.system.SysMenuController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"menuName\":\"\",\"permission\":\"\",\"parentId\":2035,\"path\":\"\",\"isButton\":false,\"routerName\":\"\",\"meta\":{\"showParent\":true,\"rank\":0},\"status\":1},','',1,'','2023-07-22 17:06:57',0),(562,2,3,'菜单管理','/system/menus/1060','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{menuId=1060}','',1,'','2025-06-07 10:50:48',0),(563,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 14:27:28',0),(564,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 14:27:45',0),(565,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 14:28:56',0),(566,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 14:29:53',0),(567,2,3,'菜单管理','/system/menus/1060','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=1060}','',1,'','2025-06-07 14:46:23',0),(568,2,3,'菜单管理','/system/menus/4','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=4}','',1,'','2025-06-07 14:47:05',0),(569,2,3,'菜单管理','/system/menus/63','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=63}','',1,'','2025-06-07 14:47:16',0),(570,2,3,'菜单管理','/system/menus/7','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=7}','',1,'','2025-06-07 17:42:01',0),(571,8,4,'参数管理','/system/configs/cache','com.agileboot.admin.controller.system.SysConfigController.refreshCache()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 17:47:58',0),(572,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 18:01:23',0),(573,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 18:02:23',0),(574,3,4,'部门管理','/system/dept/10','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=10}','',1,'','2025-06-07 20:40:25',0),(575,3,4,'部门管理','/system/dept/9','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=9}','',1,'','2025-06-07 20:40:27',0),(576,3,4,'部门管理','/system/dept/3','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=3}','',1,'','2025-06-07 20:40:29',0),(577,3,4,'部门管理','/system/dept/8','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=8}','',1,'','2025-06-07 20:40:32',0),(578,3,4,'部门管理','/system/dept/7','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=7}','',1,'','2025-06-07 20:40:35',0),(579,3,4,'部门管理','/system/dept/6','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=6}','',1,'','2025-06-07 20:40:38',0),(580,3,4,'部门管理','/system/dept/5','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=5}','',0,'该部门存在关联的用户不允许删除','2025-06-07 20:40:40',0),(581,3,4,'用户管理','/system/users/3','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=3}','',1,'','2025-06-07 20:41:59',0),(582,3,4,'用户管理','/system/users/2','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=2}','',1,'','2025-06-07 20:42:02',0),(583,3,4,'部门管理','/system/dept/5','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=5}','',1,'','2025-06-07 20:42:11',0),(584,3,4,'部门管理','/system/dept/4','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=4}','',0,'该部门存在关联的用户不允许删除','2025-06-07 20:43:07',0),(585,3,4,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=1}','',0,'当前用户不允许被删除','2025-06-07 20:43:16',0),(586,2,3,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 20:43:37',0),(587,3,4,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=1}','',0,'当前用户不允许被删除','2025-06-07 20:43:44',0),(588,2,3,'部门管理','/system/dept/1','com.agileboot.admin.controller.system.SysDeptController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=1}','',1,'','2025-06-07 20:45:23',0),(589,3,4,'部门管理','/system/dept/4','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=4}','',0,'该部门存在关联的用户不允许删除','2025-06-07 20:45:39',0),(590,2,3,'用户管理','/system/users/1/status','com.agileboot.admin.controller.system.SysUserController.changeStatus()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 20:46:43',0),(591,3,4,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=1}','',0,'当前用户不允许被删除','2025-06-07 20:46:49',0),(592,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"金融科技部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"赵昕\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:48:26',0),(593,2,3,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 20:49:05',0),(594,3,4,'部门管理','/system/dept/4','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=4}','',1,'','2025-06-07 20:49:14',0),(595,3,4,'部门管理','/system/dept/2','com.agileboot.admin.controller.system.SysDeptController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=2}','',1,'','2025-06-07 20:49:18',0),(596,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"多资产配置部\",\"orderNum\":2,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:55:51',0),(597,2,3,'部门管理','/system/dept/12','com.agileboot.admin.controller.system.SysDeptController.edit()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{deptId=12}','',1,'','2025-06-07 20:56:34',0),(598,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"首席投资官\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:57:09',0),(599,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"高管\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:57:21',0),(600,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"研究部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:57:37',0),(601,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"固定收益部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:57:58',0),(602,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"项目投资部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:58:07',0),(603,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"集中收益部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:58:33',0),(604,2,3,'部门管理','/system/dept/18','com.agileboot.admin.controller.system.SysDeptController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{deptId=18}','',1,'','2025-06-07 20:58:52',0),(605,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"产品管理部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:59:14',0),(606,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"市场营销部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:59:39',0),(607,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"风险管理部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 20:59:52',0),(608,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"信用评审部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:00:09',0),(609,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"法律评审部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:00:27',0),(610,2,3,'部门管理','/system/dept/23','com.agileboot.admin.controller.system.SysDeptController.edit()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{deptId=23}','',1,'','2025-06-07 21:00:50',0),(611,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"deptName\":\"资金财务部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:01:16',0),(612,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"综合管理部（党委办公室）\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:01:48',0),(613,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"党群工作部（人力资源部）\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:02:16',0),(614,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"审计部\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:02:54',0),(615,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"deptName\":\"科技专家\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:03:17',0),(616,1,2,'部门管理','/system/dept','com.agileboot.admin.controller.system.SysDeptController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"deptName\":\"风险专家\",\"orderNum\":0,\"parentId\":1,\"leaderName\":\"\",\"phone\":\"\",\"email\":\"\",\"status\":1},','',1,'','2025-06-07 21:03:35',0),(617,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"roleId\":2,\"sex\":2,\"deptId\":11,\"remark\":\"金融科技部经理\",\"postId\":2,\"password\":\"123456\",\"phoneNumber\":\"\",\"nickname\":\"\",\"email\":\"\",\"username\":\"赵昕\",\"status\":1},','',1,'','2025-06-07 21:05:25',0),(618,2,3,'用户管理','/system/users/1/status','com.agileboot.admin.controller.system.SysUserController.changeStatus()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 21:05:45',0),(619,2,3,'用户管理','/system/users/4','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=4}','',1,'','2025-06-07 21:06:13',0),(620,2,3,'用户管理','/system/users/4','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=4}','',1,'','2025-06-07 21:07:12',0),(621,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"roleId\":2,\"deptId\":11,\"remark\":\"\",\"postId\":3,\"password\":\"admin123\",\"phoneNumber\":\"\",\"nickname\":\"畅博\",\"email\":\"\",\"username\":\"changbo\",\"status\":1},','',1,'','2025-06-07 21:08:04',0),(622,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'changbo','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:09:26',0),(623,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:10:45',0),(624,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:12:05',0),(625,0,4,'删除绩效','/system/performance/103,104,105,106,107,108','com.agileboot.admin.controller.system.SysPerformanceController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{performanceIds=103,104,105,106,107,108}','',1,'','2025-06-07 21:14:40',0),(626,0,2,'新增绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"year\":2025,\"personalScore\":100,\"deptId\":11,\"remark\":\"\",\"userId\":5,\"deptScore\":90,\"quarter\":2},','',1,'','2025-06-07 21:17:21',0),(627,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:18:00',0),(628,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:18:42',0),(629,3,4,'用户管理','/system/users/4','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{userIds=4}','',1,'','2025-06-07 21:27:42',0),(630,3,4,'用户管理','/system/users/5','com.agileboot.admin.controller.system.SysUserController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userIds=5}','',1,'','2025-06-07 21:27:47',0),(631,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"roleId\":2,\"sex\":2,\"deptId\":11,\"remark\":\"\",\"postId\":2,\"password\":\"\",\"phoneNumber\":\"\",\"nickname\":\"赵昕\",\"email\":\"\",\"username\":\"00010\"},','',1,'','2025-06-07 21:28:27',0),(632,2,3,'用户管理','/system/users/1/password','com.agileboot.admin.controller.system.SysUserController.resetPassword()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 21:29:30',0),(633,2,3,'用户管理','/system/users/6/password','com.agileboot.admin.controller.system.SysUserController.resetPassword()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=6}','',1,'','2025-06-07 21:29:41',0),(634,2,3,'岗位管理','/system/post','com.agileboot.admin.controller.system.SysPostController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:30:00',0),(635,2,3,'用户管理','/system/users/6/status','com.agileboot.admin.controller.system.SysUserController.changeStatus()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=6}','',1,'','2025-06-07 21:30:16',0),(636,2,3,'用户管理','/system/users/1','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=1}','',1,'','2025-06-07 21:30:23',0),(637,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"roleId\":2,\"sex\":1,\"deptId\":11,\"remark\":\"\",\"postId\":4,\"password\":\"admin123\",\"phoneNumber\":\"\",\"nickname\":\"\",\"email\":\"\",\"username\":\"00066\",\"status\":1},','',1,'','2025-06-07 21:30:54',0),(638,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"roleId\":2,\"sex\":1,\"deptId\":11,\"remark\":\"\",\"postId\":2,\"password\":\"admin123\",\"phoneNumber\":\"\",\"nickname\":\"林彦博\",\"email\":\"\",\"username\":\"00018\",\"status\":1},','',1,'','2025-06-07 21:31:49',0),(639,1,2,'用户管理','/system/users','com.agileboot.admin.controller.system.SysUserController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"roleId\":2,\"sex\":1,\"deptId\":14,\"remark\":\"\",\"postId\":4,\"password\":\"admin123\",\"phoneNumber\":\"\",\"nickname\":\"\",\"email\":\"\",\"username\":\"00004\",\"status\":1},','',1,'','2025-06-07 21:32:50',0),(640,2,3,'用户管理','/system/users/9','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=9}','',1,'','2025-06-07 21:33:00',0),(641,0,2,'新增绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"year\":2025,\"personalScore\":100,\"deptId\":14,\"remark\":\"\",\"userId\":9,\"deptScore\":90,\"quarter\":2},','',1,'','2025-06-07 21:34:05',0),(642,0,3,'修改绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2025-06-07 21:34:19',0),(643,2,3,'用户管理','/system/users/7','com.agileboot.admin.controller.system.SysUserController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{userId=7}','',1,'','2025-06-07 21:38:28',0),(644,0,2,'新增绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"year\":2025,\"personalScore\":90,\"deptId\":11,\"remark\":\"\",\"userId\":8,\"deptScore\":80,\"quarter\":2},','',1,'','2025-06-07 21:41:05',0),(645,0,2,'新增绩效','/system/performance','com.agileboot.admin.controller.system.SysPerformanceController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"year\":2025,\"personalScore\":100,\"deptId\":11,\"remark\":\"\",\"userId\":6,\"deptScore\":100,\"quarter\":2},','',1,'','2025-06-07 21:45:01',0),(646,0,4,'删除绩效','/system/performance/112','com.agileboot.admin.controller.system.SysPerformanceController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{performanceIds=112}','',1,'','2025-06-07 21:55:15',0);
/*!40000 ALTER TABLE `sys_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_performance`
--

DROP TABLE IF EXISTS `sys_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_performance` (
  `performance_id` bigint NOT NULL AUTO_INCREMENT COMMENT '绩效ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `year` int NOT NULL COMMENT '评分年份',
  `quarter` int NOT NULL COMMENT '评分季度 (1-4)',
  `dept_score` decimal(5,2) NOT NULL COMMENT '部门绩效分数',
  `personal_score` decimal(5,2) NOT NULL COMMENT '个人绩效分数',
  `total_score` decimal(5,2) NOT NULL COMMENT '总绩效分数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`performance_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_dept_id` (`dept_id`),
  KEY `idx_year_quarter` (`year`,`quarter`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='人员绩效表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_performance`
--

LOCK TABLES `sys_performance` WRITE;
/*!40000 ALTER TABLE `sys_performance` DISABLE KEYS */;
INSERT INTO `sys_performance` VALUES (103,1,4,2025,1,50.00,90.00,66.00,'研发部门-优秀表现','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(104,2,6,2025,1,80.00,75.00,78.50,'测试部门-良好表现','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(105,3,7,2025,1,70.00,80.00,73.00,'财务部门-需要改进','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(106,1,4,2025,2,88.00,92.00,89.20,'研发部门-持续优秀','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(107,2,6,2025,2,82.00,78.00,80.80,'测试部门-有所提升','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(108,3,7,2025,2,75.00,82.00,77.10,'财务部门-明显进步','0',1,'2025-06-07 13:42:31',1,'2025-06-07 21:14:40',1),(109,6,11,2025,2,90.00,100.00,94.00,'','0',1,'2025-06-07 21:17:21',1,'2025-06-07 21:34:19',0),(110,9,14,2025,2,90.00,100.00,94.00,'','0',1,'2025-06-07 21:34:05',NULL,NULL,0),(111,8,11,2025,2,80.00,90.00,84.00,'','0',1,'2025-06-07 21:41:05',NULL,NULL,0),(112,6,11,2025,2,100.00,100.00,100.00,'','0',1,'2025-06-07 21:45:01',1,'2025-06-07 21:55:15',1);
/*!40000 ALTER TABLE `sys_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(64) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` smallint NOT NULL COMMENT '状态（1正常 0停用）',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(2,'se','项目经理',2,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(3,'hr','人力资源',3,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(4,'user','普通员工',5,1,'',NULL,'2022-05-21 08:30:54',1,'2025-06-07 21:30:00',0);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_key` varchar(128) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` smallint DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3: 本部门数据权限 4: 本部门及以下数据权限 5: 本人权限）',
  `dept_id_set` varchar(1024) DEFAULT '' COMMENT '角色所拥有的部门数据权限',
  `status` smallint NOT NULL COMMENT '角色状态（1正常 0停用）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,1,'',1,NULL,'2022-05-21 08:30:54',1,'2025-06-07 21:09:26','超级管理员',0),(2,'普通角色','common',3,2,'',1,NULL,'2022-05-21 08:30:54',1,'2025-06-07 21:12:05','普通角色',0),(3,'闲置角色','unused',4,2,'',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'未使用的角色',0);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1),(1,2),(1,3),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,66),(2,2),(2,3),(2,11),(2,13),(2,17),(3,1),(111,1);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `post_id` bigint DEFAULT NULL COMMENT '职位id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `username` varchar(64) NOT NULL COMMENT '用户账号',
  `nickname` varchar(32) NOT NULL COMMENT '用户昵称',
  `user_type` smallint DEFAULT '0' COMMENT '用户类型（00系统用户）',
  `email` varchar(128) DEFAULT '' COMMENT '用户邮箱',
  `phone_number` varchar(18) DEFAULT '' COMMENT '手机号码',
  `sex` smallint DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(512) DEFAULT '' COMMENT '头像地址',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '帐号状态（1正常 2停用 3冻结）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '超级管理员标志（1是，0否）',
  `creator_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,3,1,11,'admin','admin',0,'agileboot@163.com','15888888883',1,'/profile/avatar/20230725164110_blob_6b7a989b1cdd4dd396665d2cfd2addc5.png','$2a$10$HSiH9Q8zunqRVFtPXqRH0eXUusTxw1kI0OYK4UHWUbNAEyS8qYezm',1,'0:0:0:0:0:0:0:1','2025-06-08 14:11:35',1,NULL,'2022-05-21 08:30:54',1,'2025-06-08 14:11:35','管理员',0),(2,2,2,5,'ag1','valarchie2',0,'agileboot1@qq.com','15666666666',1,'/profile/avatar/20230725114818_avatar_b5bf400732bb43369b4df58802049b22.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',1,'127.0.0.1','2022-05-21 08:30:54',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'测试员1',1),(3,2,0,5,'ag2','valarchie3',0,'agileboot2@qq.com','15666666667',1,'/profile/avatar/20230725114818_avatar_b5bf400732bb43369b4df58802049b22.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',1,'127.0.0.1','2022-05-21 08:30:54',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'测试员2',1),(4,2,2,11,'zhaoxin','赵昕',0,'','',2,'','$2a$10$jCApEX6xqju/RnfCgFeEde31QlrHReu4GEcmEihfqErlpfmE0.Mdq',1,'',NULL,0,1,'2025-06-07 21:05:25',1,'2025-06-07 21:07:12','金融科技部经理',1),(5,3,2,11,'changbo','畅博',0,'','',0,'','$2a$10$SV8MZEMXEp73at8Iwp.G/e5KoPmA/Q8.ehnn9wqpapXciuojXI7NG',1,'0:0:0:0:0:0:0:1','2025-06-07 21:14:06',0,1,'2025-06-07 21:08:04',5,'2025-06-07 21:14:06','',1),(6,2,2,11,'00010','赵昕',0,'','',2,'','$2a$10$13swamxmNiGjN2z.1vNiEOEcCRNXU.fCi.0s2UXydd0eUkAqiWIjS',1,'',NULL,0,1,'2025-06-07 21:28:27',1,'2025-06-07 21:30:16','',0),(7,4,2,11,'00066','畅博',0,'','',1,'','$2a$10$TFmRgPE1Zgo0.jKQn5vEH.UgjubVXSfBCknJRz6C/TzBQ2DtEii9S',1,'',NULL,0,1,'2025-06-07 21:30:54',1,'2025-06-07 21:38:28','',0),(8,2,2,11,'00018','林彦博',0,'','',1,'','$2a$10$dE7P6fk8uGp6lHPuvS5S4e0Z.2uHbilfg3xcOCb4Bx17AAyN25wx.',1,'',NULL,0,1,'2025-06-07 21:31:49',NULL,NULL,'',0),(9,4,2,14,'00004','张伟',0,'','',1,'','$2a$10$qCcLVZ5RdMy0snz9ZxGIue8OKV4eFSSnqmqPVEk54vP/.cQcSafWy',1,'',NULL,0,1,'2025-06-07 21:32:50',1,'2025-06-07 21:33:00','',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 22:34:48
