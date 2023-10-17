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
import com.ruoyi.residence.domain.ResidenceFavorite;
import com.ruoyi.residence.service.IResidenceFavoriteService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源收藏Controller
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@RestController
@RequestMapping("/residence/favorite")
public class ResidenceFavoriteController extends BaseController
{
    @Autowired
    private IResidenceFavoriteService residenceFavoriteService;

    /**
     * 查询房源收藏列表
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceFavorite residenceFavorite)
    {
        startPage();
        List<ResidenceFavorite> list = residenceFavoriteService.selectResidenceFavoriteList(residenceFavorite);
        return getDataTable(list);
    }

    /**
     * 导出房源收藏列表
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:export')")
    @Log(title = "房源收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceFavorite residenceFavorite)
    {
        List<ResidenceFavorite> list = residenceFavoriteService.selectResidenceFavoriteList(residenceFavorite);
        ExcelUtil<ResidenceFavorite> util = new ExcelUtil<ResidenceFavorite>(ResidenceFavorite.class);
        util.exportExcel(response, list, "房源收藏数据");
    }

    /**
     * 获取房源收藏详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceFavoriteService.selectResidenceFavoriteById(id));
    }

    /**
     * 新增房源收藏
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:add')")
    @Log(title = "房源收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceFavorite residenceFavorite)
    {
        return toAjax(residenceFavoriteService.insertResidenceFavorite(residenceFavorite));
    }

    /**
     * 修改房源收藏
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:edit')")
    @Log(title = "房源收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceFavorite residenceFavorite)
    {
        return toAjax(residenceFavoriteService.updateResidenceFavorite(residenceFavorite));
    }

    /**
     * 删除房源收藏
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:remove')")
    @Log(title = "房源收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceFavoriteService.deleteResidenceFavoriteByIds(ids));
    }
}
