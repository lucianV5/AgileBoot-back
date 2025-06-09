package com.agileboot.domain.system.performance;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

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
import com.agileboot.common.core.page.PageDTO;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * 绩效应用服务测试
 *
 * @author agileboot.com
 */
@ExtendWith(MockitoExtension.class)
public class PerformanceApplicationServiceTest {

    @InjectMocks
    private PerformanceApplicationService performanceApplicationService;

    @Mock
    private SysPerformanceService performanceService;
    
    @Mock
    private PerformanceModelFactory performanceModelFactory;

    private SysPerformanceEntity testPerformance;
    private PerformanceModel testModel;

    @BeforeEach
    public void setUp() {
        testPerformance = new SysPerformanceEntity();
        testPerformance.setPerformanceId(1L);
        testPerformance.setUserId(1L);
        testPerformance.setDeptId(101L);
        testPerformance.setYear(2025);
        testPerformance.setQuarter(1);
        testPerformance.setDeptScore(new BigDecimal("85.50"));
        testPerformance.setPersonalScore(new BigDecimal("90.00"));
        testPerformance.setTotalScore(new BigDecimal("87.30"));
        testPerformance.setRemark("测试备注");
        
        testModel = new PerformanceModel(testPerformance, performanceService, null);
    }

    @Test
    public void testGetPerformancePage() {
        // 准备测试数据
        PerformanceQuery query = new PerformanceQuery();
        query.setPageNum(1);
        query.setPageSize(10);
        
        Page<SysPerformanceEntity> page = new Page<>();
        List<SysPerformanceEntity> records = new ArrayList<>();
        records.add(testPerformance);
        page.setRecords(records);
        page.setTotal(1);
        
        // 模拟服务调用
        when(performanceService.getPerformanceList(any(), any(QueryWrapper.class))).thenReturn(page);
        
        // 执行测试
        PageDTO<PerformanceDTO> result = performanceApplicationService.getPerformancePage(query);
        
        // 验证结果
        assertNotNull(result);
        assertEquals(1, result.getTotal());
        assertEquals(1, result.getRows().size());
        assertEquals(testPerformance.getPerformanceId(), result.getRows().get(0).getPerformanceId());
    }

    @Test
    public void testGetPerformanceInfo() {
        // 模拟服务调用
        when(performanceModelFactory.loadById(anyLong())).thenReturn(testModel);
        when(performanceService.getById(anyLong())).thenReturn(testPerformance);
        
        // 执行测试
        PerformanceDTO result = performanceApplicationService.getPerformanceInfo(1L);
        
        // 验证结果
        assertNotNull(result);
        assertEquals(testPerformance.getPerformanceId(), result.getPerformanceId());
    }

    @Test
    public void testAddPerformance() {
        // 准备测试数据
        AddPerformanceCommand command = new AddPerformanceCommand();
        command.setUserId(1L);
        command.setDeptId(101L);
        command.setYear(2025);
        command.setQuarter(1);
        command.setDeptScore(new BigDecimal("85.50"));
        command.setPersonalScore(new BigDecimal("90.00"));
        command.setRemark("测试备注");
        
        // 模拟服务调用
        when(performanceModelFactory.create()).thenReturn(testModel);
        
        // 执行测试
        performanceApplicationService.addPerformance(command);
        
        // 验证结果
        verify(performanceModelFactory, times(1)).create();
    }

    @Test
    public void testUpdatePerformance() {
        // 准备测试数据
        UpdatePerformanceCommand command = new UpdatePerformanceCommand();
        command.setPerformanceId(1L);
        command.setUserId(1L);
        command.setDeptId(101L);
        command.setYear(2025);
        command.setQuarter(1);
        command.setDeptScore(new BigDecimal("85.50"));
        command.setPersonalScore(new BigDecimal("90.00"));
        command.setRemark("测试备注");
        
        // 模拟服务调用
        when(performanceModelFactory.loadById(anyLong())).thenReturn(testModel);
        
        // 执行测试
        performanceApplicationService.updatePerformance(command);
        
        // 验证结果
        verify(performanceModelFactory, times(1)).loadById(anyLong());
    }

    @Test
    public void testDeletePerformance() {
        // 准备测试数据
        List<Long> ids = Arrays.asList(1L, 2L);
        
        // 模拟服务调用
        when(performanceService.removeByIds(ids)).thenReturn(true);
        
        // 执行测试
        performanceApplicationService.deletePerformance(ids);
        
        // 验证结果
        verify(performanceService, times(1)).removeByIds(ids);
    }
}
