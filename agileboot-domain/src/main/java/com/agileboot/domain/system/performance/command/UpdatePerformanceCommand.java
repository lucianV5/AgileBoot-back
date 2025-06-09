package com.agileboot.domain.system.performance.command;

import javax.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 更新绩效命令
 *
 * @author agileboot.com
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UpdatePerformanceCommand extends AddPerformanceCommand {

    /**
     * 绩效ID
     */
    @NotNull(message = "绩效ID不能为空")
    private Long performanceId;
}
