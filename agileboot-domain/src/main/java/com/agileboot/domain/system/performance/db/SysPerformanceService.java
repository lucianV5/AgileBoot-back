package com.agileboot.domain.system.performance.db;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * 人员绩效表 服务类
 *
 * @author agileboot.com
 */
public interface SysPerformanceService extends IService<SysPerformanceEntity> {

    /**
     * 获取绩效列表
     *
     * @param page         页码对象
     * @param queryWrapper 查询对象
     * @return 分页处理后的绩效列表
     */
    Page<SysPerformanceEntity> getPerformanceList(Page<SysPerformanceEntity> page,
        @Param(Constants.WRAPPER) Wrapper<SysPerformanceEntity> queryWrapper);
}
