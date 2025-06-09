-- ----------------------------
-- 更新sys_performance表中的部门信息，确保与sys_dept表中的部门一致
-- ----------------------------

-- 首先删除现有的测试数据
DELETE FROM `sys_performance` WHERE `performance_id` IN (1, 2, 3);

-- 插入新的测试数据，使用sys_dept表中存在的部门ID
INSERT INTO `sys_performance` (`user_id`, `dept_id`, `year`, `quarter`, `dept_score`, `personal_score`, `total_score`, `remark`, `creator_id`, `create_time`) VALUES 
(1, 4, 2025, 1, 85.50, 90.00, 86.85, '研发部门-优秀表现', 1, NOW()),
(2, 6, 2025, 1, 80.00, 75.00, 78.50, '测试部门-良好表现', 1, NOW()),
(3, 7, 2025, 1, 70.00, 80.00, 73.00, '财务部门-需要改进', 1, NOW()),
(1, 4, 2025, 2, 88.00, 92.00, 89.20, '研发部门-持续优秀', 1, NOW()),
(2, 6, 2025, 2, 82.00, 78.00, 80.80, '测试部门-有所提升', 1, NOW()),
(3, 7, 2025, 2, 75.00, 82.00, 77.10, '财务部门-明显进步', 1, NOW());

-- 如果需要更新现有数据而不是删除重建，可以使用以下SQL
/*
UPDATE `sys_performance` SET 
  `dept_id` = 4,
  `remark` = CONCAT('研发部门-', `remark`)
WHERE `performance_id` = 1;

UPDATE `sys_performance` SET 
  `dept_id` = 6,
  `remark` = CONCAT('测试部门-', `remark`)
WHERE `performance_id` = 2;

UPDATE `sys_performance` SET 
  `dept_id` = 7,
  `remark` = CONCAT('财务部门-', `remark`)
WHERE `performance_id` = 3;
*/
