package com.agileboot.domain.system.performance.db;

import com.agileboot.common.core.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Getter;
import lombok.Setter;

/**
 * 人员绩效表
 *
 * @author agileboot.com
 */
@Getter
@Setter
@TableName("sys_performance")
@ApiModel(value = "SysPerformanceEntity对象", description = "人员绩效表")
public class SysPerformanceEntity extends BaseEntity<SysPerformanceEntity> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("绩效ID")
    @TableId(value = "performance_id", type = IdType.AUTO)
    private Long performanceId;

    @ApiModelProperty("用户ID")
    @TableField("user_id")
    private Long userId;

    @ApiModelProperty("部门ID")
    @TableField("dept_id")
    private Long deptId;

    @ApiModelProperty("评分年份")
    @TableField("year")
    private Integer year;

    @ApiModelProperty("评分季度 (1-4)")
    @TableField("quarter")
    private Integer quarter;

    @ApiModelProperty("部门绩效分数")
    @TableField("dept_score")
    private BigDecimal deptScore;

    @ApiModelProperty("个人绩效分数")
    @TableField("personal_score")
    private BigDecimal personalScore;

    @ApiModelProperty("总绩效分数")
    @TableField("total_score")
    private BigDecimal totalScore;

    @ApiModelProperty("备注")
    @TableField("remark")
    private String remark;

    @ApiModelProperty("删除标志（0代表存在 1代表删除）")
    @TableField("del_flag")
    private String delFlag;

    @ApiModelProperty("逻辑删除")
    @TableField("deleted")
    @TableLogic
    private Boolean deleted;
    
    /**
     * 用户名称（非数据库字段）
     */
    @TableField(exist = false)
    private String userName;
    
    /**
     * 部门名称（非数据库字段）
     */
    @TableField(exist = false)
    private String deptName;

    @Override
    public Serializable pkVal() {
        return this.performanceId;
    }
}
