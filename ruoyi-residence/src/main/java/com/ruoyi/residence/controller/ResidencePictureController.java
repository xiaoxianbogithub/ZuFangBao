package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidencePicture;
import com.ruoyi.residence.service.IResidencePictureService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源图片Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("房源图片")
@RestController
@RequestMapping("/residence/picture")
public class ResidencePictureController extends BaseController
{
    @Autowired
    private IResidencePictureService residencePictureService;

    /**
     * 查询房源图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:list')")
    @GetMapping("/list")
    @ApiOperation("查询房源图片列表")
    public TableDataInfo list(@RequestBody ResidencePicture residencePicture)
    {
        startPage();
        List<ResidencePicture> list = residencePictureService.selectResidencePictureList(residencePicture);
        return getDataTable(list);
    }

    /**
     * 导出房源图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:export')")
    @Log(title = "房源图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response,@RequestBody ResidencePicture residencePicture)
    {
        List<ResidencePicture> list = residencePictureService.selectResidencePictureList(residencePicture);
        ExcelUtil<ResidencePicture> util = new ExcelUtil<ResidencePicture>(ResidencePicture.class);
        util.exportExcel(response, list, "房源图片数据");
    }

    /**
     * 获取房源图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取房源图片详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residencePictureService.selectResidencePictureById(id));
    }

    /**
     * 新增房源图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:add')")
    @Log(title = "房源图片", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增房源图片")
    public AjaxResult add(@RequestBody ResidencePicture residencePicture)
    {
        return toAjax(residencePictureService.insertResidencePicture(residencePicture));
    }

    /**
     * 修改房源图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:edit')")
    @Log(title = "房源图片", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改房源图片")
    public AjaxResult edit(@RequestBody ResidencePicture residencePicture)
    {
        return toAjax(residencePictureService.updateResidencePicture(residencePicture));
    }

    /**
     * 删除房源图片
     */
    @PreAuthorize("@ss.hasPermi('residence:picture:remove')")
    @Log(title = "房源图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除房源图片")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residencePictureService.deleteResidencePictureByIds(ids));
    }
}
