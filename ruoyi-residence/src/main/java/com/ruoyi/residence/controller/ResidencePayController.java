package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidencePay;
import com.ruoyi.residence.service.IResidencePayService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源付款设置Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源支付设置")
@RestController
@RequestMapping("/residence/pay")
public class ResidencePayController extends BaseController
{
    @Autowired
    private IResidencePayService residencePayService;

    /**
     * 查询房源付款设置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:list')")
    @GetMapping("/list")
    @ApiOperation("查询房源付款设置列表")
    public TableDataInfo list(ResidencePay residencePay)
    {
        startPage();
        List<ResidencePay> list = residencePayService.selectResidencePayList(residencePay);
        return getDataTable(list);
    }

    /**
     * 导出房源付款设置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:export')")
    @Log(title = "房源付款设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody ResidencePay residencePay)
    {
        List<ResidencePay> list = residencePayService.selectResidencePayList(residencePay);
        ExcelUtil<ResidencePay> util = new ExcelUtil<ResidencePay>(ResidencePay.class);
        util.exportExcel(response, list, "房源付款设置数据");
    }

    /**
     * 获取房源付款设置详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residencePayService.selectResidencePayById(id));
    }

    /**
     * 新增房源付款设置
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:add')")
    @Log(title = "房源付款设置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidencePay residencePay)
    {
        return toAjax(residencePayService.insertResidencePay(residencePay));
    }

    /**
     * 修改房源付款设置
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:edit')")
    @Log(title = "房源付款设置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidencePay residencePay)
    {
        return toAjax(residencePayService.updateResidencePay(residencePay));
    }

    /**
     * 删除房源付款设置
     */
    @PreAuthorize("@ss.hasPermi('residence:pay:remove')")
    @Log(title = "房源付款设置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residencePayService.deleteResidencePayByIds(ids));
    }
}
