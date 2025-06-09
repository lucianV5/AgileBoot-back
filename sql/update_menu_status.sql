-- 更新菜单管理菜单的状态为启用
UPDATE `sys_menu` SET `status` = 1 WHERE `menu_id` = 7;

-- 确保菜单管理的子菜单也是启用状态
UPDATE `sys_menu` SET `status` = 1 WHERE `parent_id` = 7;
