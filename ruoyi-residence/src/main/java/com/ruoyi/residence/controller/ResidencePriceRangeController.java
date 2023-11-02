package com.ruoyi.residence.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.residence.domain.ResidencePriceRange;
import com.ruoyi.residence.service.IResidencePriceRangeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源价格区间Controller
 * 
 * @author climber
 * @date 2023-11-02
 */
@RestController
@RequestMapping("/residence/priceRange")
public class ResidencePriceRangeController extends BaseController
{
    @Autowired
    private IResidencePriceRangeService residencePriceRangeService;

    /**
     * 查询房源价格区间列表
     */
    @PreAuthorize("@ss.hasPermi('residence:priceRange:list')")
    @GetMapping("/list")
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
    public void export(HttpServletResponse response, ResidencePriceRange residencePriceRange)
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
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residencePriceRangeService.deleteResidencePriceRangeByIds(ids));
    }
}
