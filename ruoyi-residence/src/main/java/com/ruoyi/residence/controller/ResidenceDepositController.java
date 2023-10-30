package com.ruoyi.residence.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.residence.domain.ResidenceDeposit;
import com.ruoyi.residence.service.IResidenceDepositService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源押金设置Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源押金设置")
@RestController
@RequestMapping("/residence/deposit")
public class ResidenceDepositController extends BaseController
{
    @Autowired
    private IResidenceDepositService residenceDepositService;

    /**
     * 查询房源押金设置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:list')")
    @GetMapping("/list")
    @ApiOperation("查询房源押金设置列表")
    public TableDataInfo list(ResidenceDeposit residenceDeposit)
    {
        startPage();
        List<ResidenceDeposit> list = residenceDepositService.selectResidenceDepositList(residenceDeposit);
        return getDataTable(list);
    }

    /**
     * 导出房源押金设置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:export')")
    @Log(title = "房源押金设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceDeposit residenceDeposit)
    {
        List<ResidenceDeposit> list = residenceDepositService.selectResidenceDepositList(residenceDeposit);
        ExcelUtil<ResidenceDeposit> util = new ExcelUtil<ResidenceDeposit>(ResidenceDeposit.class);
        util.exportExcel(response, list, "房源押金设置数据");
    }

    /**
     * 获取房源押金设置详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceDepositService.selectResidenceDepositById(id));
    }

    /**
     * 新增房源押金设置
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:add')")
    @Log(title = "房源押金设置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceDeposit residenceDeposit)
    {
        return toAjax(residenceDepositService.insertResidenceDeposit(residenceDeposit));
    }

    /**
     * 修改房源押金设置
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:edit')")
    @Log(title = "房源押金设置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceDeposit residenceDeposit)
    {
        return toAjax(residenceDepositService.updateResidenceDeposit(residenceDeposit));
    }

    /**
     * 删除房源押金设置
     */
    @PreAuthorize("@ss.hasPermi('residence:deposit:remove')")
    @Log(title = "房源押金设置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceDepositService.deleteResidenceDepositByIds(ids));
    }
}
