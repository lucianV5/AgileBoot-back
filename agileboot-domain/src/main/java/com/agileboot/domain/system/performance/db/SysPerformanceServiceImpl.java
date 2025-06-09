package com.agileboot.domain.system.performance.db;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 人员绩效表 服务实现类
 *
 * @author agileboot.com
 */
@Service
public class SysPerformanceServiceImpl extends ServiceImpl<SysPerformanceMapper, SysPerformanceEntity> implements SysPerformanceService {

    @Override
    public Page<SysPerformanceEntity> getPerformanceList(Page<SysPerformanceEntity> page, Wrapper<SysPerformanceEntity> queryWrapper) {
        return this.baseMapper.getPerformanceList(page, queryWrapper);
    }
}
