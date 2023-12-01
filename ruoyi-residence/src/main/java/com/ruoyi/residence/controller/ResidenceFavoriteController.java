package com.ruoyi.residence.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.residence.domain.VO.ResidenceFavoriteVO;
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
import com.ruoyi.residence.domain.ResidenceFavorite;
import com.ruoyi.residence.service.IResidenceFavoriteService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 房源收藏Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@RestController
@RequestMapping("/residence/favorite")
@Api(value = "房源收藏")
public class ResidenceFavoriteController extends BaseController
{
    @Autowired
    private IResidenceFavoriteService residenceFavoriteService;

    /**
     * 查询房源收藏列表
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:list')")
    @GetMapping("/list")
    @ApiOperation("获取房源收藏列表")
    public TableDataInfo list(@RequestBody ResidenceFavorite residenceFavorite)
    {
        startPage();
        List<ResidenceFavoriteVO> list = residenceFavoriteService.selectResidenceFavoriteList(residenceFavorite);
        return getDataTable(list);
    }

    /**
     * 导出房源收藏列表
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:export')")
    @Log(title = "房源收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出房源收藏列表")
    public void export(HttpServletResponse response, @RequestBody ResidenceFavorite residenceFavorite)
    {
        List<ResidenceFavoriteVO> list = residenceFavoriteService.selectResidenceFavoriteList(residenceFavorite);
        ExcelUtil<ResidenceFavoriteVO> util = new ExcelUtil<>(ResidenceFavoriteVO.class);
        util.exportExcel(response, list, "房源收藏数据");
    }

    /**
     * 新增房源收藏
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:add')")
    @Log(title = "房源收藏", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增房源收藏")
    public AjaxResult add(@RequestBody ResidenceFavorite residenceFavorite)
    {
        return toAjax(residenceFavoriteService.insertResidenceFavorite(residenceFavorite));
    }

    /**
     * 删除房源收藏
     */
    @PreAuthorize("@ss.hasPermi('residence:favorite:remove')")
    @Log(title = "房源收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除房源收藏")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceFavoriteService.deleteResidenceFavoriteByIds(ids));
    }
}
