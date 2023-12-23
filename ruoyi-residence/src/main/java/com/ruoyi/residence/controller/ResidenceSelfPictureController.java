package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceSelfPicture;
import com.ruoyi.residence.service.IResidenceSelfPictureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 自营首页图片Controller
 * 
 * @author climber
 * @date 2023-12-23
 */
@Api("自营首页轮播图")
@RestController
@RequestMapping("/residence/selfPicture")
public class ResidenceSelfPictureController extends BaseController
{
    @Autowired
    private IResidenceSelfPictureService residenceSelfPictureService;

    /**
     * 查询自营首页图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:list')")
    @GetMapping("/list")
    @ApiOperation(value = "查询自营首页图片列表")
    public TableDataInfo list(ResidenceSelfPicture residenceSelfPicture)
    {
        startPage();
        List<ResidenceSelfPicture> list = residenceSelfPictureService.selectResidenceSelfPictureList(residenceSelfPicture);
        return getDataTable(list);
    }

    /**
     * 导出自营首页图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:export')")
    @Log(title = "自营首页图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceSelfPicture residenceSelfPicture)
    {
        List<ResidenceSelfPicture> list = residenceSelfPictureService.selectResidenceSelfPictureList(residenceSelfPicture);
        ExcelUtil<ResidenceSelfPicture> util = new ExcelUtil<ResidenceSelfPicture>(ResidenceSelfPicture.class);
        util.exportExcel(response, list, "自营首页图片数据");
    }

    /**
     * 获取自营首页图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取自营首页图片详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceSelfPictureService.selectResidenceSelfPictureById(id));
    }

    /**
     * 新增自营首页图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:add')")
    @Log(title = "自营首页图片", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增自营首页图片")
    public AjaxResult add(@RequestBody ResidenceSelfPicture residenceSelfPicture)
    {
        return toAjax(residenceSelfPictureService.insertResidenceSelfPicture(residenceSelfPicture));
    }

    /**
     * 修改自营首页图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:edit')")
    @Log(title = "自营首页图片", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改自营首页图片")
    public AjaxResult edit(@RequestBody ResidenceSelfPicture residenceSelfPicture)
    {
        return toAjax(residenceSelfPictureService.updateResidenceSelfPicture(residenceSelfPicture));
    }

    /**
     * 删除自营首页图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:remove')")
    @Log(title = "自营首页图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation(value = "删除自营首页图片")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceSelfPictureService.deleteResidenceSelfPictureByIds(ids));
    }
}
