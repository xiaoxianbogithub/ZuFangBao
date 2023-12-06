package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceHomePageCarousel;
import com.ruoyi.residence.service.IResidenceHomePageCarouselService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 首页轮播图设置Controller
 * 
 * @author climber
 * @date 2023-11-03
 */
@Api(value = "首页轮播图设置")
@RestController
@RequestMapping("/residence/homePageCarousel")
public class ResidenceHomePageCarouselController extends BaseController
{
    @Autowired
    private IResidenceHomePageCarouselService residenceHomePageCarouselService;

    /**
     * 查询首页轮播图设置列表
     */
    @Anonymous
    @GetMapping("/list")
    @ApiOperation(value = "查询首页轮播图设置列表")
    public TableDataInfo list(@RequestBody ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        startPage();
        List<ResidenceHomePageCarousel> list = residenceHomePageCarouselService.selectResidenceHomePageCarouselList(residenceHomePageCarousel);
        return getDataTable(list);
    }

    /**
     * 导出首页轮播图设置列表
     */
    @PreAuthorize("@ss.hasPermi('residence:homePageCarousel:export')")
    @Log(title = "首页轮播图设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation(value = "导出首页轮播图设置列表")
    public void export(HttpServletResponse response, @RequestBody ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        List<ResidenceHomePageCarousel> list = residenceHomePageCarouselService.selectResidenceHomePageCarouselList(residenceHomePageCarousel);
        ExcelUtil<ResidenceHomePageCarousel> util = new ExcelUtil<ResidenceHomePageCarousel>(ResidenceHomePageCarousel.class);
        util.exportExcel(response, list, "首页轮播图设置数据");
    }

    /**
     * 获取首页轮播图设置详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:homePageCarousel:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取首页轮播图设置详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceHomePageCarouselService.selectResidenceHomePageCarouselById(id));
    }

    /**
     * 新增首页轮播图设置
     */
    @PreAuthorize("@ss.hasPermi('residence:homePageCarousel:add')")
    @Log(title = "首页轮播图设置", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增首页轮播图设置")
    public AjaxResult add(@RequestBody ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        return toAjax(residenceHomePageCarouselService.insertResidenceHomePageCarousel(residenceHomePageCarousel));
    }

    /**
     * 修改首页轮播图设置
     */
    @PreAuthorize("@ss.hasPermi('residence:homePageCarousel:edit')")
    @Log(title = "首页轮播图设置", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改首页轮播图设置")
    public AjaxResult edit(@RequestBody ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        return toAjax(residenceHomePageCarouselService.updateResidenceHomePageCarousel(residenceHomePageCarousel));
    }

    /**
     * 删除首页轮播图设置
     */
    @PreAuthorize("@ss.hasPermi('residence:homePageCarousel:remove')")
    @Log(title = "首页轮播图设置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation(value = "删除首页轮播图设置")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceHomePageCarouselService.deleteResidenceHomePageCarouselByIds(ids));
    }
}
