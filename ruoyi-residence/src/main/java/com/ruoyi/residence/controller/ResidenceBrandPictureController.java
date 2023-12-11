package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceBrandPicture;
import com.ruoyi.residence.service.IResidenceBrandPictureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源品牌图片Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源品牌图片")
@RestController
@RequestMapping("/residence/brandPicture")
public class ResidenceBrandPictureController extends BaseController
{
    @Autowired
    private IResidenceBrandPictureService residenceBrandPictureService;

    /**
     * 查询房源品牌图片列表
     */
    @Anonymous
    @GetMapping("/list")
    @ApiOperation("查询房源品牌图片列表")
    public TableDataInfo list(ResidenceBrandPicture residenceBrandPicture)
    {
        startPage();
        List<ResidenceBrandPicture> list = residenceBrandPictureService.selectResidenceBrandPictureList(residenceBrandPicture);
        return getDataTable(list);
    }

    /**
     * 导出房源品牌图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:export')")
    @Log(title = "房源品牌图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, @RequestBody ResidenceBrandPicture residenceBrandPicture)
    {
        List<ResidenceBrandPicture> list = residenceBrandPictureService.selectResidenceBrandPictureList(residenceBrandPicture);
        ExcelUtil<ResidenceBrandPicture> util = new ExcelUtil<ResidenceBrandPicture>(ResidenceBrandPicture.class);
        util.exportExcel(response, list, "房源品牌图片数据");
    }

    /**
     * 获取房源品牌图片详细信息
     */
    @Anonymous
    @GetMapping(value = "/{id}")
    @ApiOperation("获取房源品牌图片详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceBrandPictureService.selectResidenceBrandPictureById(id));
    }

    /**
     * 新增房源品牌图片
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:add')")
    @Log(title = "房源品牌图片", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增房源品牌图片")
    public AjaxResult add(@RequestBody ResidenceBrandPicture residenceBrandPicture)
    {
        return toAjax(residenceBrandPictureService.insertResidenceBrandPicture(residenceBrandPicture));
    }

    /**
     * 修改房源品牌图片
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:edit')")
    @Log(title = "房源品牌图片", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改房源品牌图片")
    public AjaxResult edit(@RequestBody ResidenceBrandPicture residenceBrandPicture)
    {
        return toAjax(residenceBrandPictureService.updateResidenceBrandPicture(residenceBrandPicture));
    }

    /**
     * 删除房源品牌图片
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:remove')")
    @Log(title = "房源品牌图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除房源品牌图片")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceBrandPictureService.deleteResidenceBrandPictureByIds(ids));
    }
}
