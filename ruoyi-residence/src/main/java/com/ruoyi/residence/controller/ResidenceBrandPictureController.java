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
import com.ruoyi.residence.domain.ResidenceBrandPicture;
import com.ruoyi.residence.service.IResidenceBrandPictureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源品牌图片Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@RestController
@RequestMapping("/residence/brandPicture")
public class ResidenceBrandPictureController extends BaseController
{
    @Autowired
    private IResidenceBrandPictureService residenceBrandPictureService;

    /**
     * 查询房源品牌图片列表
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:list')")
    @GetMapping("/list")
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
    public void export(HttpServletResponse response, ResidenceBrandPicture residenceBrandPicture)
    {
        List<ResidenceBrandPicture> list = residenceBrandPictureService.selectResidenceBrandPictureList(residenceBrandPicture);
        ExcelUtil<ResidenceBrandPicture> util = new ExcelUtil<ResidenceBrandPicture>(ResidenceBrandPicture.class);
        util.exportExcel(response, list, "房源品牌图片数据");
    }

    /**
     * 获取房源品牌图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:brandPicture:query')")
    @GetMapping(value = "/{id}")
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
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceBrandPictureService.deleteResidenceBrandPictureByIds(ids));
    }
}
