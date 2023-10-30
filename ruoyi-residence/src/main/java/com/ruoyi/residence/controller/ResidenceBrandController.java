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
import com.ruoyi.residence.domain.ResidenceBrand;
import com.ruoyi.residence.service.IResidenceBrandService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源品牌Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@RestController
@RequestMapping("/residence/brand")
@Api("房源产品")
public class ResidenceBrandController extends BaseController
{
    @Autowired
    private IResidenceBrandService residenceBrandService;

    /**
     * 查询房源品牌列表
     */
    @ApiOperation("获取房源品牌列表")
    @PreAuthorize("@ss.hasPermi('residence:brand:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceBrand residenceBrand)
    {
        startPage();
        List<ResidenceBrand> list = residenceBrandService.selectResidenceBrandList(residenceBrand);
        return getDataTable(list);
    }

    /**
     * 导出房源品牌列表
     */
    @PreAuthorize("@ss.hasPermi('residence:brand:export')")
    @Log(title = "房源品牌", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceBrand residenceBrand)
    {
        List<ResidenceBrand> list = residenceBrandService.selectResidenceBrandList(residenceBrand);
        ExcelUtil<ResidenceBrand> util = new ExcelUtil<ResidenceBrand>(ResidenceBrand.class);
        util.exportExcel(response, list, "房源品牌数据");
    }

    /**
     * 获取房源品牌详细信息
     */
    @ApiOperation("查询房源品牌详细信息")
    @PreAuthorize("@ss.hasPermi('residence:brand:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceBrandService.selectResidenceBrandById(id));
    }

    /**
     * 新增房源品牌
     */
    @PreAuthorize("@ss.hasPermi('residence:brand:add')")
    @Log(title = "房源品牌", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceBrand residenceBrand)
    {
        return toAjax(residenceBrandService.insertResidenceBrand(residenceBrand));
    }

    /**
     * 修改房源品牌
     */
    @PreAuthorize("@ss.hasPermi('residence:brand:edit')")
    @Log(title = "房源品牌", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceBrand residenceBrand)
    {
        return toAjax(residenceBrandService.updateResidenceBrand(residenceBrand));
    }

    /**
     * 删除房源品牌
     */
    @PreAuthorize("@ss.hasPermi('residence:brand:remove')")
    @Log(title = "房源品牌", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceBrandService.deleteResidenceBrandByIds(ids));
    }
}
