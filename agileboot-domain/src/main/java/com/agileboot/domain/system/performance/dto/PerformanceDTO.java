package com.agileboot.domain.system.performance.dto;

import com.agileboot.domain.common.cache.CacheCenter;
import com.agileboot.domain.system.dept.db.SysDeptEntity;
import com.agileboot.domain.system.performance.db.SysPerformanceEntity;
import com.agileboot.domain.system.user.db.SysUserEntity;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * 绩效数据传输对象
 *
 * @author agileboot.com
 */
@Data
@NoArgsConstructor
@Slf4j
public class PerformanceDTO {

    /**
     * 绩效ID
     */
    private Long performanceId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 评分年份
     */
    private Integer year;

    /**
     * 评分季度 (1-4)
     */
    private Integer quarter;

    /**
     * 部门绩效分数
     */
    private BigDecimal deptScore;

    /**
     * 个人绩效分数
     */
    private BigDecimal personalScore;

    /**
     * 总绩效分数
     */
    private BigDecimal totalScore;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 创建者名称
     */
    private String creatorName;
    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 构造函数，从实体创建DTO
     *
     * @param entity 绩效实体
     */
    public PerformanceDTO(SysPerformanceEntity entity) {
        if (entity != null) {
            this.performanceId = entity.getPerformanceId();
            this.userId = entity.getUserId();
            this.deptId = entity.getDeptId();
            this.year = entity.getYear();
            this.quarter = entity.getQuarter();
            this.deptScore = entity.getDeptScore();
            this.personalScore = entity.getPersonalScore();
            this.totalScore = entity.getTotalScore();
            this.remark = entity.getRemark();
            this.createTime = entity.getCreateTime();
            this.updateTime = entity.getUpdateTime();
            
            // 优先使用SQL查询中JOIN获取的用户名和部门名
            if (StringUtils.isNotBlank(entity.getUserName())) {
                this.userName = entity.getUserName();
            } else if (entity.getUserId() != null) {
                // 如果SQL查询没有获取到，则从缓存获取用户名
                try {
                    SysUserEntity user = CacheCenter.userCache.getObjectById(entity.getUserId());
                    if (user != null) {
                        this.userName = user.getUsername();
                    }
                } catch (Exception e) {
                    log.error("获取用户名称时发生错误: {}", e.getMessage());
                }
            }
            
            // 优先使用SQL查询中JOIN获取的部门名
            if (StringUtils.isNotBlank(entity.getDeptName())) {
                this.deptName = entity.getDeptName();
            } else if (entity.getDeptId() != null) {
                // 如果SQL查询没有获取到，则从缓存获取部门名称
                try {
                    SysDeptEntity dept = CacheCenter.deptCache.getObjectById(entity.getDeptId());
                    if (dept != null) {
                        this.deptName = dept.getDeptName();
                    }
                } catch (Exception e) {
                    log.error("获取部门名称时发生错误: {}", e.getMessage());
                }
            }
            
            // 从缓存获取创建者名称
            if (entity.getCreatorId() != null) {
                try {
                    SysUserEntity creator = CacheCenter.userCache.getObjectById(entity.getCreatorId());
                    if (creator != null) {
                        this.creatorName = creator.getUsername();
                    }
                } catch (Exception e) {
                    log.error("获取创建者名称时发生错误: {}", e.getMessage());
                }
            }
        }
    }
}
