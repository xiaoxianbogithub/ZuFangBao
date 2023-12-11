package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidencePriceRange;
import com.ruoyi.residence.service.IResidencePriceRangeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源价格区间Controller
 * 
 * @author climber
 * @date 2023-11-02
 */
@Api(value = "首页价格区间筛选")
@RestController
@RequestMapping("/residence/priceRange")
public class ResidencePriceRangeController extends BaseController
{
    @Autowired
    private IResidencePriceRangeService residencePriceRangeService;

    /**
     * 查询房源价格区间列表
     */
    @Anonymous
    @GetMapping("/list")
    @ApiOperation(value = "查询房源价格区间列表")
    public TableDataInfo list(ResidencePriceRange residencePriceRange)
    {
        startPage();
        List<ResidencePriceRange> list = residencePriceRangeService.selectResidencePriceRangeList(residencePriceRange);
        return getDataTable(list);
    }

    /**
     * 导出房源价格区间列表
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:export')")
    @Log(title = "房源价格区间", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation(value = "导出房源价格区间列表")
    public void export(HttpServletResponse response, @RequestBody ResidencePriceRange residencePriceRange)
    {
        List<ResidencePriceRange> list = residencePriceRangeService.selectResidencePriceRangeList(residencePriceRange);
        ExcelUtil<ResidencePriceRange> util = new ExcelUtil<ResidencePriceRange>(ResidencePriceRange.class);
        util.exportExcel(response, list, "房源价格区间数据");
    }

    /**
     * 获取房源价格区间详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取房源价格区间详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residencePriceRangeService.selectResidencePriceRangeById(id));
    }

    /**
     * 新增房源价格区间
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:add')")
    @Log(title = "房源价格区间", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增房源价格区间")
    public AjaxResult add(@RequestBody ResidencePriceRange residencePriceRange)
    {
        return toAjax(residencePriceRangeService.insertResidencePriceRange(residencePriceRange));
    }

    /**
     * 修改房源价格区间
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:edit')")
    @Log(title = "房源价格区间", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改房源价格区间")
    public AjaxResult edit(@RequestBody ResidencePriceRange residencePriceRange)
    {
        return toAjax(residencePriceRangeService.updateResidencePriceRange(residencePriceRange));
    }

    /**
     * 删除房源价格区间
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:remove')")
    @Log(title = "房源价格区间", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation(value = "删除房源价格区间")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residencePriceRangeService.deleteResidencePriceRangeByIds(ids));
    }
}
