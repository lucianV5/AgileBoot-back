-- ----------------------------
-- 1. 创建绩效表结构
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_performance` (
  `performance_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '绩效ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `year` int(4) NOT NULL COMMENT '评分年份',
  `quarter` int(1) NOT NULL COMMENT '评分季度 (1-4)',
  `dept_score` decimal(5,2) NOT NULL COMMENT '部门绩效分数',
  `personal_score` decimal(5,2) NOT NULL COMMENT '个人绩效分数',
  `total_score` decimal(5,2) NOT NULL COMMENT '总绩效分数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`performance_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_dept_id` (`dept_id`),
  KEY `idx_year_quarter` (`year`, `quarter`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='人员绩效表';

-- ----------------------------
-- 2. 添加菜单权限
-- ----------------------------
-- 绩效管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_type`, `router_name`, `parent_id`, `path`, `is_button`, `permission`, `meta_info`, `status`, `remark`, `creator_id`, `create_time`, `updater_id`, `update_time`, `deleted`) 
VALUES (1060, '绩效管理', 1, 'SystemPerformance', 1, '/system/performance/index', 0, 'system:performance:list', '{"title":"绩效管理","icon":"ep:chart","showParent":true}', 1, '绩效管理菜单', 0, NOW(), NULL, NULL, 0);

-- 绩效查询按钮
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_type`, `router_name`, `parent_id`, `path`, `is_button`, `permission`, `meta_info`, `status`, `remark`, `creator_id`, `create_time`, `updater_id`, `update_time`, `deleted`) 
VALUES (1061, '绩效查询', 0, '', 1060, '', 1, 'system:performance:query', '{"title":"绩效查询"}', 1, '', 0, NOW(), NULL, NULL, 0);

-- 绩效新增按钮
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_type`, `router_name`, `parent_id`, `path`, `is_button`, `permission`, `meta_info`, `status`, `remark`, `creator_id`, `create_time`, `updater_id`, `update_time`, `deleted`) 
VALUES (1062, '绩效新增', 0, '', 1060, '', 1, 'system:performance:add', '{"title":"绩效新增"}', 1, '', 0, NOW(), NULL, NULL, 0);

-- 绩效修改按钮
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_type`, `router_name`, `parent_id`, `path`, `is_button`, `permission`, `meta_info`, `status`, `remark`, `creator_id`, `create_time`, `updater_id`, `update_time`, `deleted`) 
VALUES (1063, '绩效修改', 0, '', 1060, '', 1, 'system:performance:edit', '{"title":"绩效修改"}', 1, '', 0, NOW(), NULL, NULL, 0);

-- 绩效删除按钮
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_type`, `router_name`, `parent_id`, `path`, `is_button`, `permission`, `meta_info`, `status`, `remark`, `creator_id`, `create_time`, `updater_id`, `update_time`, `deleted`) 
VALUES (1064, '绩效删除', 0, '', 1060, '', 1, 'system:performance:remove', '{"title":"绩效删除"}', 1, '', 0, NOW(), NULL, NULL, 0);

-- ----------------------------
-- 3. 添加示例数据
-- ----------------------------
INSERT INTO `sys_performance` (`user_id`, `dept_id`, `year`, `quarter`, `dept_score`, `personal_score`, `total_score`, `remark`, `creator_id`, `create_time`) VALUES 
(1, 103, 2025, 1, 85.50, 90.00, 86.85, '优秀表现', 1, NOW()),
(2, 104, 2025, 1, 80.00, 75.00, 78.50, '良好表现', 1, NOW()),
(3, 105, 2025, 1, 70.00, 80.00, 73.00, '需要改进', 1, NOW());
