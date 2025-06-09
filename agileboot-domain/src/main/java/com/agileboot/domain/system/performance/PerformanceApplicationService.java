package com.agileboot.domain.system.performance;

import com.agileboot.common.core.page.PageDTO;
import com.agileboot.domain.system.performance.command.AddPerformanceCommand;
import com.agileboot.domain.system.performance.command.UpdatePerformanceCommand;
import com.agileboot.domain.system.performance.db.SysPerformanceEntity;
import com.agileboot.domain.system.performance.db.SysPerformanceService;
import com.agileboot.domain.system.performance.dto.PerformanceDTO;
import com.agileboot.domain.system.performance.model.PerformanceModel;
import com.agileboot.domain.system.performance.model.PerformanceModelFactory;
import com.agileboot.domain.system.performance.query.PerformanceQuery;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 绩效应用服务
 *
 * @author agileboot.com
 */
@Service
@RequiredArgsConstructor
public class PerformanceApplicationService {

    private final SysPerformanceService performanceService;
    private final PerformanceModelFactory performanceModelFactory;

    /**
     * 分页查询绩效列表
     *
     * @param query 查询参数
     * @return 分页结果
     */
    public PageDTO<PerformanceDTO> getPerformancePage(PerformanceQuery query) {
        Page<SysPerformanceEntity> page = performanceService.getPerformanceList(query.toPage(), query.toQueryWrapper());
        List<PerformanceDTO> records = page.getRecords().stream().map(PerformanceDTO::new).collect(Collectors.toList());
        return new PageDTO<>(records, page.getTotal());
    }

    /**
     * 获取绩效详情
     *
     * @param performanceId 绩效ID
     * @return 绩效详情
     */
    public PerformanceDTO getPerformanceInfo(Long performanceId) {
        PerformanceModel performanceModel = performanceModelFactory.loadById(performanceId);
        SysPerformanceEntity entity = performanceService.getById(performanceId);
        return new PerformanceDTO(entity);
    }

    /**
     * 新增或更新绩效
     * 如果该员工在特定年份和季度已有绩效记录，则更新该记录
     * 如果没有，则插入新记录
     *
     * @param command 新增命令
     * @return 绩效ID
     */
    @Transactional(rollbackFor = Exception.class)
    public Long addOrUpdatePerformance(AddPerformanceCommand command) {
        // 检查该员工在特定年份和季度是否已有绩效记录
        QueryWrapper<SysPerformanceEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", command.getUserId())
                   .eq("year", command.getYear())
                   .eq("quarter", command.getQuarter())
                   .eq("deleted", 0);  // 确保只查询未删除的记录
        
        SysPerformanceEntity existingPerformance = performanceService.getOne(queryWrapper);
        
        if (existingPerformance != null) {
            // 已存在记录，执行更新操作
            UpdatePerformanceCommand updateCommand = new UpdatePerformanceCommand();
            updateCommand.setPerformanceId(existingPerformance.getPerformanceId());
            updateCommand.setUserId(command.getUserId());
            updateCommand.setDeptId(command.getDeptId());
            updateCommand.setYear(command.getYear());
            updateCommand.setQuarter(command.getQuarter());
            updateCommand.setDeptScore(command.getDeptScore());
            updateCommand.setPersonalScore(command.getPersonalScore());
            updateCommand.setRemark(command.getRemark());
            
            // 调用更新方法
            PerformanceModel model = performanceModelFactory.loadById(existingPerformance.getPerformanceId());
            model.loadUpdateCommand(updateCommand);
            model.checkAndUpdate();
            
            return existingPerformance.getPerformanceId();
        } else {
            // 不存在记录，执行新增操作
            PerformanceModel model = performanceModelFactory.create();
            model.loadAddCommand(command);
            model.checkAndAdd();
            return model.getPerformanceId();
        }
    }

    /**
     * 新增绩效
     *
     * @param command 新增命令
     * @return 绩效ID
     */
    @Transactional(rollbackFor = Exception.class)
    public Long addPerformance(AddPerformanceCommand command) {
        // 调用新的方法，实现新增或更新逻辑
        return addOrUpdatePerformance(command);
    }

    /**
     * 更新绩效
     *
     * @param command 更新命令
     */
    @Transactional(rollbackFor = Exception.class)
    public void updatePerformance(UpdatePerformanceCommand command) {
        PerformanceModel model = performanceModelFactory.loadById(command.getPerformanceId());
        model.loadUpdateCommand(command);
        model.checkAndUpdate();
    }

    /**
     * 删除绩效
     *
     * @param performanceIds 绩效ID列表
     */
    @Transactional(rollbackFor = Exception.class)
    public void deletePerformance(List<Long> performanceIds) {
        performanceService.removeByIds(performanceIds);
    }
}
