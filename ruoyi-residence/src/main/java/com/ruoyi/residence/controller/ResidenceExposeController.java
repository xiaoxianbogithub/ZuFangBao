package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceExpose;
import com.ruoyi.residence.service.IResidenceExposeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源举报Controller
 * 
 * @author climber
 * @date 2023-12-25
 */
@Api(value = "房源举报")
@RestController
@RequestMapping("/residence/expose")
public class ResidenceExposeController extends BaseController
{
    @Autowired
    private IResidenceExposeService residenceExposeService;

    /**
     * 查询房源举报列表
     */
    @ApiOperation(value = "查询房源举报列表")
    @PreAuthorize("@ss.hasPermi('residence:expose:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceExpose residenceExpose)
    {
        startPage();
        List<ResidenceExpose> list = residenceExposeService.selectResidenceExposeList(residenceExpose);
        return getDataTable(list);
    }

    /**
     * 导出房源举报列表
     */
    @PreAuthorize("@ss.hasPermi('residence:expose:export')")
    @Log(title = "房源举报", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ResidenceExpose residenceExpose)
    {
        List<ResidenceExpose> list = residenceExposeService.selectResidenceExposeList(residenceExpose);
        ExcelUtil<ResidenceExpose> util = new ExcelUtil<ResidenceExpose>(ResidenceExpose.class);
        util.exportExcel(response, list, "房源举报数据");
    }

    /**
     * 获取房源举报详细信息
     */
    @ApiOperation(value = "获取房源举报详细信息")
    @PreAuthorize("@ss.hasPermi('residence:expose:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceExposeService.selectResidenceExposeById(id));
    }

    /**
     * 新增房源举报
     */
    @ApiOperation(value = "新增房源举报")
    @PreAuthorize("@ss.hasPermi('residence:expose:add')")
    @Log(title = "房源举报", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceExpose residenceExpose)
    {
        return toAjax(residenceExposeService.insertResidenceExpose(residenceExpose));
    }

    /**
     * 修改房源举报
     */
    @ApiOperation(value = "修改房源举报")
    @PreAuthorize("@ss.hasPermi('residence:expose:edit')")
    @Log(title = "房源举报", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceExpose residenceExpose)
    {
        return toAjax(residenceExposeService.updateResidenceExpose(residenceExpose));
    }

    /**
     * 删除房源举报
     */
    @ApiOperation(value = "删除房源举报")
    @PreAuthorize("@ss.hasPermi('residence:expose:remove')")
    @Log(title = "房源举报", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceExposeService.deleteResidenceExposeByIds(ids));
    }
}
