-- ----------------------------
-- 更新绩效管理菜单，使其成为系统管理下的二级菜单
-- ----------------------------

-- 1. 先删除现有的绩效管理菜单及其子菜单
DELETE FROM `sys_menu` WHERE `menu_id` IN (1060, 1061, 1062, 1063, 1064);

-- 2. 重新添加绩效管理菜单作为系统管理的子菜单
-- 绩效管理菜单 (系统管理的ID为1)
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

-- 3. 更新角色-菜单关联表，确保管理员角色有权限访问绩效管理菜单
-- 假设管理员角色ID为1
INSERT IGNORE INTO `sys_role_menu` (`role_id`, `menu_id`, `creator_id`, `create_time`) 
VALUES 
(1, 1060, 0, NOW()),
(1, 1061, 0, NOW()),
(1, 1062, 0, NOW()),
(1, 1063, 0, NOW()),
(1, 1064, 0, NOW());
