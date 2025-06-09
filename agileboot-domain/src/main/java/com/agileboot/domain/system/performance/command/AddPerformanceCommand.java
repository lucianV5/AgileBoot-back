package com.agileboot.domain.system.performance.command;

import java.math.BigDecimal;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import lombok.Data;

/**
 * 新增绩效命令
 *
 * @author agileboot.com
 */
@Data
public class AddPerformanceCommand {

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空")
    private Long userId;

    /**
     * 部门ID
     */
    @NotNull(message = "部门ID不能为空")
    private Long deptId;

    /**
     * 评分年份
     */
    @NotNull(message = "评分年份不能为空")
    @Min(value = 2000, message = "年份不能小于2000")
    @Max(value = 2100, message = "年份不能大于2100")
    private Integer year;

    /**
     * 评分季度 (1-4)
     */
    @NotNull(message = "评分季度不能为空")
    @Min(value = 1, message = "季度不能小于1")
    @Max(value = 4, message = "季度不能大于4")
    private Integer quarter;

    /**
     * 部门绩效分数
     */
    @NotNull(message = "部门绩效分数不能为空")
    @Min(value = 0, message = "部门绩效分数不能小于0")
    @Max(value = 100, message = "部门绩效分数不能大于100")
    private BigDecimal deptScore;

    /**
     * 个人绩效分数
     */
    @NotNull(message = "个人绩效分数不能为空")
    @Min(value = 0, message = "个人绩效分数不能小于0")
    @Max(value = 100, message = "个人绩效分数不能大于100")
    private BigDecimal personalScore;

    /**
     * 备注
     */
    private String remark;
}
