package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceEntrust;
import com.ruoyi.residence.service.IResidenceEntrustService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 委托管理Controller
 * 
 * @author climber
 * @date 2023-12-25
 */
@Api(value = "委托管理")
@RestController
@RequestMapping("/residence/entrust")
public class ResidenceEntrustController extends BaseController
{
    @Autowired
    private IResidenceEntrustService residenceEntrustService;

    /**
     * 查询委托管理列表
     */
    @ApiOperation(value = "查询委托管理列表")
    @PreAuthorize("@ss.hasPermi('residence:entrust:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceEntrust residenceEntrust)
    {
        startPage();
        List<ResidenceEntrust> list = residenceEntrustService.selectResidenceEntrustList(residenceEntrust);
        return getDataTable(list);
    }

    /**
     * 导出委托管理列表
     */
    @PreAuthorize("@ss.hasPermi('residence:entrust:export')")
    @Log(title = "委托管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceEntrust residenceEntrust)
    {
        List<ResidenceEntrust> list = residenceEntrustService.selectResidenceEntrustList(residenceEntrust);
        ExcelUtil<ResidenceEntrust> util = new ExcelUtil<ResidenceEntrust>(ResidenceEntrust.class);
        util.exportExcel(response, list, "委托管理数据");
    }

    /**
     * 获取委托管理详细信息
     */
    @ApiOperation(value = "获取委托管理详细信息")
    @PreAuthorize("@ss.hasPermi('residence:entrust:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceEntrustService.selectResidenceEntrustById(id));
    }

    /**
     * 新增委托管理
     */
    @ApiOperation(value = "新增委托管理")
    @PreAuthorize("@ss.hasPermi('residence:entrust:add')")
    @Log(title = "委托管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceEntrust residenceEntrust)
    {
        return toAjax(residenceEntrustService.insertResidenceEntrust(residenceEntrust));
    }

    /**
     * 修改委托管理
     */
    @ApiOperation(value = "修改委托管理")
    @PreAuthorize("@ss.hasPermi('residence:entrust:edit')")
    @Log(title = "委托管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceEntrust residenceEntrust)
    {
        return toAjax(residenceEntrustService.updateResidenceEntrust(residenceEntrust));
    }

    /**
     * 删除委托管理
     */
    @ApiOperation(value = "删除委托管理")
    @PreAuthorize("@ss.hasPermi('residence:entrust:remove')")
    @Log(title = "委托管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceEntrustService.deleteResidenceEntrustByIds(ids));
    }
}
