package com.agileboot.domain.system.performance.query;

import com.agileboot.common.core.page.AbstractPageQuery;
import com.agileboot.common.utils.time.DatePickUtil;
import com.agileboot.domain.system.performance.db.SysPerformanceEntity;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 绩效查询对象
 *
 * @author agileboot.com
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class PerformanceQuery extends AbstractPageQuery<SysPerformanceEntity> {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 评分年份
     */
    private Integer year;

    /**
     * 评分季度 (1-4)
     */
    private Integer quarter;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 开始时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date beginTime;
    
    /**
     * 结束时间
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date endTime;

    @Override
    public QueryWrapper<SysPerformanceEntity> addQueryCondition() {
        QueryWrapper<SysPerformanceEntity> queryWrapper = new QueryWrapper<SysPerformanceEntity>()
            .eq(userId != null, "p.user_id", userId)
            .eq(deptId != null, "p.dept_id", deptId)
            .eq(year != null, "p.year", year)
            .eq(quarter != null, "p.quarter", quarter)
            .like(userName != null, "u.username", userName)
            .ge(beginTime != null, "p.create_time", DatePickUtil.getBeginOfTheDay(beginTime))
            .le(endTime != null, "p.create_time", DatePickUtil.getEndOfTheDay(endTime))
            .eq("p.deleted", 0);
        
        return queryWrapper;
    }
}
