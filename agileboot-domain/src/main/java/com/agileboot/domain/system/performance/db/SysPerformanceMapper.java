package com.agileboot.domain.system.performance.db;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 人员绩效表 数据层
 *
 * @author agileboot.com
 */
@Mapper
public interface SysPerformanceMapper extends BaseMapper<SysPerformanceEntity> {
    
    /**
     * 根据条件分页查询绩效列表
     * 
     * @param page 分页对象
     * @param queryWrapper 查询条件
     * @return 绩效列表
     */
    @Select("SELECT p.*, u.username as user_name, d.dept_name "
        + "FROM sys_performance p "
        + "LEFT JOIN sys_user u ON p.user_id = u.user_id "
        + "LEFT JOIN sys_dept d ON p.dept_id = d.dept_id "
        + "${ew.customSqlSegment}")
    Page<SysPerformanceEntity> getPerformanceList(Page<SysPerformanceEntity> page, 
        @Param(Constants.WRAPPER) Wrapper<SysPerformanceEntity> queryWrapper);
}
