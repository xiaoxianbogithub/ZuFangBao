package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceHouseType;
import com.ruoyi.residence.service.IResidenceHouseTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源户型设定Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源户型设置")
@RestController
@RequestMapping("/residence/type")
public class ResidenceHouseTypeController extends BaseController
{
    @Autowired
    private IResidenceHouseTypeService residenceHouseTypeService;

    /**
     * 查询房源户型设定列表
     */
    @PreAuthorize("@ss.hasPermi('residence:type:list')")
    @GetMapping("/list")
    @ApiOperation("查询房源户型设定列表")
    public TableDataInfo list(ResidenceHouseType residenceHouseType)
    {
        startPage();
        List<ResidenceHouseType> list = residenceHouseTypeService.selectResidenceHouseTypeList(residenceHouseType);
        return getDataTable(list);
    }

    /**
     * 导出房源户型设定列表
     */
    @PreAuthorize("@ss.hasPermi('residence:type:export')")
    @Log(title = "房源户型设定", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody ResidenceHouseType residenceHouseType)
    {
        List<ResidenceHouseType> list = residenceHouseTypeService.selectResidenceHouseTypeList(residenceHouseType);
        ExcelUtil<ResidenceHouseType> util = new ExcelUtil<ResidenceHouseType>(ResidenceHouseType.class);
        util.exportExcel(response, list, "房源户型设定数据");
    }

    /**
     * 获取房源户型设定详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceHouseTypeService.selectResidenceHouseTypeById(id));
    }

    /**
     * 新增房源户型设定
     */
    @PreAuthorize("@ss.hasPermi('residence:type:add')")
    @Log(title = "房源户型设定", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceHouseType residenceHouseType)
    {
        return toAjax(residenceHouseTypeService.insertResidenceHouseType(residenceHouseType));
    }

    /**
     * 修改房源户型设定
     */
    @PreAuthorize("@ss.hasPermi('residence:type:edit')")
    @Log(title = "房源户型设定", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceHouseType residenceHouseType)
    {
        return toAjax(residenceHouseTypeService.updateResidenceHouseType(residenceHouseType));
    }

    /**
     * 删除房源户型设定
     */
    @PreAuthorize("@ss.hasPermi('residence:type:remove')")
    @Log(title = "房源户型设定", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceHouseTypeService.deleteResidenceHouseTypeByIds(ids));
    }
}
