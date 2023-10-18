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
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.service.IResidenceInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房屋基本信息Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@RestController
@RequestMapping("/residence/info")
public class ResidenceInfoController extends BaseController
{
    @Autowired
    private IResidenceInfoService residenceInfoService;

    /**
     * 查询房屋基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('residence:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceInfo residenceInfo)
    {
        startPage();
        List<ResidenceInfo> list = residenceInfoService.selectResidenceInfoList(residenceInfo);
        return getDataTable(list);
    }

    /**
     * 导出房屋基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('residence:info:export')")
    @Log(title = "房屋基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceInfo residenceInfo)
    {
        List<ResidenceInfo> list = residenceInfoService.selectResidenceInfoList(residenceInfo);
        ExcelUtil<ResidenceInfo> util = new ExcelUtil<ResidenceInfo>(ResidenceInfo.class);
        util.exportExcel(response, list, "房屋基本信息数据");
    }

    /**
     * 获取房屋基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceInfoService.selectResidenceInfoById(id));
    }

    /**
     * 新增房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:add')")
    @Log(title = "房屋基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.insertResidenceInfo(residenceInfo));
    }

    /**
     * 修改房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:edit')")
    @Log(title = "房屋基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.updateResidenceInfo(residenceInfo));
    }

    /**
     * 删除房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:remove')")
    @Log(title = "房屋基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceInfoService.deleteResidenceInfoByIds(ids));
    }
}
