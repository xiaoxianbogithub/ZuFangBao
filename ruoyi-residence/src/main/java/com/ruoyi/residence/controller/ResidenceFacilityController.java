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
import com.ruoyi.residence.domain.ResidenceFacility;
import com.ruoyi.residence.service.IResidenceFacilityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源配置Controller
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@RestController
@RequestMapping("/residence/facility")
public class ResidenceFacilityController extends BaseController
{
    @Autowired
    private IResidenceFacilityService residenceFacilityService;

    /**
     * 查询房源配置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceFacility residenceFacility)
    {
        startPage();
        List<ResidenceFacility> list = residenceFacilityService.selectResidenceFacilityList(residenceFacility);
        return getDataTable(list);
    }

    /**
     * 导出房源配置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:export')")
    @Log(title = "房源配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceFacility residenceFacility)
    {
        List<ResidenceFacility> list = residenceFacilityService.selectResidenceFacilityList(residenceFacility);
        ExcelUtil<ResidenceFacility> util = new ExcelUtil<ResidenceFacility>(ResidenceFacility.class);
        util.exportExcel(response, list, "房源配置数据");
    }

    /**
     * 获取房源配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceFacilityService.selectResidenceFacilityById(id));
    }

    /**
     * 新增房源配置
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:add')")
    @Log(title = "房源配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceFacility residenceFacility)
    {
        return toAjax(residenceFacilityService.insertResidenceFacility(residenceFacility));
    }

    /**
     * 修改房源配置
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:edit')")
    @Log(title = "房源配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceFacility residenceFacility)
    {
        return toAjax(residenceFacilityService.updateResidenceFacility(residenceFacility));
    }

    /**
     * 删除房源配置
     */
    @PreAuthorize("@ss.hasPermi('residence:facility:remove')")
    @Log(title = "房源配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceFacilityService.deleteResidenceFacilityByIds(ids));
    }
}
