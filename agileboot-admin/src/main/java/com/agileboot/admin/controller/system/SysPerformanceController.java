package com.agileboot.admin.controller.system;

import com.agileboot.admin.customize.aop.accessLog.AccessLog;
import com.agileboot.common.core.base.BaseController;
import com.agileboot.common.core.dto.ResponseDTO;
import com.agileboot.common.core.page.PageDTO;
import com.agileboot.domain.system.performance.PerformanceApplicationService;
import com.agileboot.domain.system.performance.command.AddPerformanceCommand;
import com.agileboot.domain.system.performance.command.UpdatePerformanceCommand;
import com.agileboot.domain.system.performance.dto.PerformanceDTO;
import com.agileboot.domain.system.performance.query.PerformanceQuery;
import com.agileboot.infrastructure.user.AuthenticationUtils;

import com.agileboot.infrastructure.user.web.SystemLoginUser;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 绩效管理控制器
 *
 * @author agileboot.com
 */
@Tag(name = "绩效管理API", description = "绩效管理相关接口")
@RestController
@RequestMapping("/system/performance")
@Validated
@RequiredArgsConstructor
public class SysPerformanceController extends BaseController {

    private final PerformanceApplicationService performanceApplicationService;

    /**
     * 获取绩效列表
     */
    @Operation(summary = "绩效列表", description = "分页查询绩效列表")
    @PreAuthorize("@permission.has('system:performance:list')")
    @GetMapping("/list")
    public ResponseDTO<PageDTO<PerformanceDTO>> list(PerformanceQuery query) {
        PageDTO<PerformanceDTO> page = performanceApplicationService.getPerformancePage(query);
        return ResponseDTO.ok(page);
    }

    /**
     * 获取绩效详细信息
     */
    @Operation(summary = "绩效详情", description = "根据绩效ID获取绩效详情")
    @PreAuthorize("@permission.has('system:performance:query')")
    @GetMapping(value = "/{performanceId}")
    public ResponseDTO<PerformanceDTO> getInfo(@PathVariable Long performanceId) {
        PerformanceDTO performance = performanceApplicationService.getPerformanceInfo(performanceId);
        return ResponseDTO.ok(performance);
    }

    /**
     * 新增绩效
     */
    @Operation(summary = "新增绩效", description = "新增绩效记录")
    @PreAuthorize("@permission.has('system:performance:add')")
    @AccessLog(title = "新增绩效")
    @PostMapping
    public ResponseDTO<Void> add(@Validated @RequestBody AddPerformanceCommand command) {
        performanceApplicationService.addPerformance(command);
        return ResponseDTO.ok();
    }

    /**
     * 修改绩效
     */
    @Operation(summary = "修改绩效", description = "修改绩效记录")
    @PreAuthorize("@permission.has('system:performance:edit')")
    @AccessLog(title = "修改绩效")
    @PutMapping
    public ResponseDTO<Void> edit(@Validated @RequestBody UpdatePerformanceCommand command) {
        performanceApplicationService.updatePerformance(command);
        return ResponseDTO.ok();
    }

    /**
     * 删除绩效
     */
    @Operation(summary = "删除绩效", description = "删除绩效记录")
    @PreAuthorize("@permission.has('system:performance:remove')")
    @AccessLog(title = "删除绩效")
    @DeleteMapping("/{performanceIds}")
    public ResponseDTO<Void> remove(@PathVariable List<Long> performanceIds) {
        performanceApplicationService.deletePerformance(performanceIds);
        return ResponseDTO.ok();
    }

    /**
     * 获取当前用户的绩效
     */
    @Operation(summary = "我的绩效", description = "获取当前登录用户的绩效记录")
    @GetMapping("/my")
    public ResponseDTO<PageDTO<PerformanceDTO>> myPerformance(PerformanceQuery query) {
        SystemLoginUser loginUser = AuthenticationUtils.getSystemLoginUser();
        query.setUserId(loginUser.getUserId());
        PageDTO<PerformanceDTO> page = performanceApplicationService.getPerformancePage(query);
        return ResponseDTO.ok(page);
    }
}
