package com.agileboot.domain.system.performance.model;

import com.agileboot.common.exception.ApiException;
import com.agileboot.common.exception.error.ErrorCode;
import com.agileboot.domain.system.performance.command.AddPerformanceCommand;
import com.agileboot.domain.system.performance.command.UpdatePerformanceCommand;
import com.agileboot.domain.system.performance.db.SysPerformanceEntity;
import com.agileboot.domain.system.performance.db.SysPerformanceService;
import com.agileboot.domain.system.user.db.SysUserService;
import java.math.BigDecimal;
import java.math.RoundingMode;
import lombok.Data;
import org.springframework.beans.BeanUtils;

/**
 * 绩效领域模型
 *
 * @author agileboot.com
 */
@Data
public class PerformanceModel {

    private Long performanceId;
    private Long userId;
    private Long deptId;
    private Integer year;
    private Integer quarter;
    private BigDecimal deptScore;
    private BigDecimal personalScore;
    private BigDecimal totalScore;
    private String remark;

    private transient SysPerformanceService performanceService;
    private transient SysUserService userService;

    public PerformanceModel(SysPerformanceEntity entity, SysPerformanceService performanceService, SysUserService userService) {
        if (entity != null) {
            BeanUtils.copyProperties(entity, this);
        }
        this.performanceService = performanceService;
        this.userService = userService;
    }

    /**
     * 从添加命令创建模型
     */
    public void loadAddCommand(AddPerformanceCommand command) {
        BeanUtils.copyProperties(command, this);
    }

    /**
     * 从更新命令创建模型
     */
    public void loadUpdateCommand(UpdatePerformanceCommand command) {
        BeanUtils.copyProperties(command, this);
    }

    /**
     * 创建新的绩效记录
     */
    public void checkAndAdd() {
        // 验证用户是否存在
        if (userService.getById(userId) == null) {
            throw new ApiException(ErrorCode.Business.USER_NON_EXIST, userId);
        }

        // 计算总分
        calculateTotalScore();

        // 保存到数据库
        SysPerformanceEntity entity = new SysPerformanceEntity();
        BeanUtils.copyProperties(this, entity);
        performanceService.save(entity);
        this.performanceId = entity.getPerformanceId();
    }

    /**
     * 更新绩效记录
     */
    public void checkAndUpdate() {
        // 验证绩效记录是否存在
        SysPerformanceEntity existingPerformance = performanceService.getById(performanceId);
        if (existingPerformance == null) {
            throw new ApiException(ErrorCode.Business.OBJECT_NOT_FOUND, performanceId);
        }

        // 验证用户是否存在
        if (userService.getById(userId) == null) {
            throw new ApiException(ErrorCode.Business.USER_NON_EXIST, userId);
        }

        // 计算总分
        calculateTotalScore();

        // 更新到数据库
        SysPerformanceEntity entity = new SysPerformanceEntity();
        BeanUtils.copyProperties(this, entity);
        performanceService.updateById(entity);
    }

    /**
     * 计算总分 (部门分数占70%，个人分数占30%)
     */
    private void calculateTotalScore() {
        if (deptScore != null && personalScore != null) {
            BigDecimal deptWeight = new BigDecimal("0.7");
            BigDecimal personalWeight = new BigDecimal("0.3");
            
            this.totalScore = deptScore.multiply(deptWeight)
                .add(personalScore.multiply(personalWeight))
                .setScale(2, RoundingMode.HALF_UP);
        }
    }
}
