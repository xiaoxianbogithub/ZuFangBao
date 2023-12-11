package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysProtocol;
import com.ruoyi.system.service.ISysProtocolService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 声明与协议内容Controller
 * 
 * @author climber
 * @date 2023-12-04
 */
@Api(value = "系统声明与协议")
@RestController
@RequestMapping("/system/protocol")
public class SysProtocolController extends BaseController
{
    @Autowired
    private ISysProtocolService sysProtocolService;

    /**
     * 查询声明与协议内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:list')")
    @GetMapping("/list")
    @ApiOperation("查询声明与协议内容列表")
    public TableDataInfo list(SysProtocol sysProtocol)
    {
        startPage();
        List<SysProtocol> list = sysProtocolService.selectSysProtocolList(sysProtocol);
        return getDataTable(list);
    }

    /**
     * 导出声明与协议内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:export')")
    @Log(title = "声明与协议内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody SysProtocol sysProtocol)
    {
        List<SysProtocol> list = sysProtocolService.selectSysProtocolList(sysProtocol);
        ExcelUtil<SysProtocol> util = new ExcelUtil<>(SysProtocol.class);
        util.exportExcel(response, list, "声明与协议内容数据");
    }

    /**
     * 获取声明与协议内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取声明与协议内容详细信息")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(sysProtocolService.selectSysProtocolById(id));
    }

    /**
     * 新增声明与协议内容
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:add')")
    @Log(title = "声明与协议内容", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增声明与协议内容")
    public AjaxResult add(@RequestBody SysProtocol sysProtocol)
    {
        return toAjax(sysProtocolService.insertSysProtocol(sysProtocol));
    }

    /**
     * 修改声明与协议内容
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:edit')")
    @Log(title = "声明与协议内容", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改声明与协议内容")
    public AjaxResult edit(@RequestBody SysProtocol sysProtocol)
    {
        return toAjax(sysProtocolService.updateSysProtocol(sysProtocol));
    }

    /**
     * 删除声明与协议内容
     */
    @PreAuthorize("@ss.hasPermi('system:protocol:remove')")
    @Log(title = "声明与协议内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除声明与协议内容")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(sysProtocolService.deleteSysProtocolByIds(ids));
    }
}
