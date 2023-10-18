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
import com.ruoyi.residence.domain.ResidenceCategory;
import com.ruoyi.residence.service.IResidenceCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源分类Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@RestController
@RequestMapping("/residence/category")
public class ResidenceCategoryController extends BaseController
{
    @Autowired
    private IResidenceCategoryService residenceCategoryService;

    /**
     * 查询房源分类列表
     */
    @PreAuthorize("@ss.hasPermi('residence:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceCategory residenceCategory)
    {
        startPage();
        List<ResidenceCategory> list = residenceCategoryService.selectResidenceCategoryList(residenceCategory);
        return getDataTable(list);
    }

    /**
     * 导出房源分类列表
     */
    @PreAuthorize("@ss.hasPermi('residence:category:export')")
    @Log(title = "房源分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceCategory residenceCategory)
    {
        List<ResidenceCategory> list = residenceCategoryService.selectResidenceCategoryList(residenceCategory);
        ExcelUtil<ResidenceCategory> util = new ExcelUtil<ResidenceCategory>(ResidenceCategory.class);
        util.exportExcel(response, list, "房源分类数据");
    }

    /**
     * 获取房源分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:category:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceCategoryService.selectResidenceCategoryById(id));
    }

    /**
     * 新增房源分类
     */
    @PreAuthorize("@ss.hasPermi('residence:category:add')")
    @Log(title = "房源分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceCategory residenceCategory)
    {
        return toAjax(residenceCategoryService.insertResidenceCategory(residenceCategory));
    }

    /**
     * 修改房源分类
     */
    @PreAuthorize("@ss.hasPermi('residence:category:edit')")
    @Log(title = "房源分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceCategory residenceCategory)
    {
        return toAjax(residenceCategoryService.updateResidenceCategory(residenceCategory));
    }

    /**
     * 删除房源分类
     */
    @PreAuthorize("@ss.hasPermi('residence:category:remove')")
    @Log(title = "房源分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceCategoryService.deleteResidenceCategoryByIds(ids));
    }
}
