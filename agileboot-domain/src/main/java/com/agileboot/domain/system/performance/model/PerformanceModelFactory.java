package com.agileboot.domain.system.performance.model;

import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.domain.system.performance.db.SysPerformanceEntity;
import com.agileboot.domain.system.performance.db.SysPerformanceService;
import com.agileboot.domain.system.user.db.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 绩效模型工厂类
 *
 * @author agileboot.com
 */
@Component
@RequiredArgsConstructor
public class PerformanceModelFactory {

    private final SysPerformanceService performanceService;
    private final SysUserService userService;

    /**
     * 创建绩效模型
     *
     * @return 绩效模型
     */
    public PerformanceModel create() {
        return new PerformanceModel(null, performanceService, userService);
    }

    /**
     * 根据绩效ID创建绩效模型
     *
     * @param performanceId 绩效ID
     * @return 绩效模型
     */
    public PerformanceModel loadById(Long performanceId) {
        SysPerformanceEntity entity = performanceService.getById(performanceId);
        if (entity == null) {
            throw new ApiException(ErrorCode.Business.OBJECT_NOT_FOUND, performanceId);
        }
        return new PerformanceModel(entity, performanceService, userService);
    }
}
