package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceLabel;
import com.ruoyi.residence.service.IResidenceLabelService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源标签Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源标签")
@RestController
@RequestMapping("/residence/label")
public class ResidenceLabelController extends BaseController
{
    @Autowired
    private IResidenceLabelService residenceLabelService;

    /**
     * 查询房源标签列表
     */
    @PreAuthorize("@ss.hasPermi('residence:label:list')")
    @GetMapping("/list")
    @ApiOperation("查询房源标签列表")
    public TableDataInfo list(ResidenceLabel residenceLabel)
    {
        startPage();
        List<ResidenceLabel> list = residenceLabelService.selectResidenceLabelList(residenceLabel);
        return getDataTable(list);
    }

    /**
     * 导出房源标签列表
     */
    @PreAuthorize("@ss.hasPermi('residence:label:export')")
    @Log(title = "房源标签", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody ResidenceLabel residenceLabel)
    {
        List<ResidenceLabel> list = residenceLabelService.selectResidenceLabelList(residenceLabel);
        ExcelUtil<ResidenceLabel> util = new ExcelUtil<ResidenceLabel>(ResidenceLabel.class);
        util.exportExcel(response, list, "房源标签数据");
    }

    /**
     * 获取房源标签详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:label:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceLabelService.selectResidenceLabelById(id));
    }

    /**
     * 新增房源标签
     */
    @PreAuthorize("@ss.hasPermi('residence:label:add')")
    @Log(title = "房源标签", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceLabel residenceLabel)
    {
        return toAjax(residenceLabelService.insertResidenceLabel(residenceLabel));
    }

    /**
     * 修改房源标签
     */
    @PreAuthorize("@ss.hasPermi('residence:label:edit')")
    @Log(title = "房源标签", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceLabel residenceLabel)
    {
        return toAjax(residenceLabelService.updateResidenceLabel(residenceLabel));
    }

    /**
     * 删除房源标签
     */
    @PreAuthorize("@ss.hasPermi('residence:label:remove')")
    @Log(title = "房源标签", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceLabelService.deleteResidenceLabelByIds(ids));
    }
}
