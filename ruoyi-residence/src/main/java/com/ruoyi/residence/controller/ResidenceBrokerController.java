package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceBroker;
import com.ruoyi.residence.service.IResidenceBrokerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房源经纪人Controller
 * 
 * @author climber
 * @date 2023-11-29
 */
@RestController
@RequestMapping("/residence/broker")
public class ResidenceBrokerController extends BaseController
{
    @Autowired
    private IResidenceBrokerService residenceBrokerService;

    /**
     * 查询房源经纪人列表
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:list')")
    @GetMapping("/list")
    public TableDataInfo list(ResidenceBroker residenceBroker)
    {
        startPage();
        List<ResidenceBroker> list = residenceBrokerService.selectResidenceBrokerList(residenceBroker);
        return getDataTable(list);
    }

    /**
     * 导出房源经纪人列表
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:export')")
    @Log(title = "房源经纪人", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response,@RequestBody ResidenceBroker residenceBroker)
    {
        List<ResidenceBroker> list = residenceBrokerService.selectResidenceBrokerList(residenceBroker);
        ExcelUtil<ResidenceBroker> util = new ExcelUtil<ResidenceBroker>(ResidenceBroker.class);
        util.exportExcel(response, list, "房源经纪人数据");
    }

    /**
     * 获取房源经纪人详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceBrokerService.selectResidenceBrokerById(id));
    }

    /**
     * 新增房源经纪人
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:add')")
    @Log(title = "房源经纪人", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ResidenceBroker residenceBroker)
    {
        return toAjax(residenceBrokerService.insertResidenceBroker(residenceBroker));
    }

    /**
     * 修改房源经纪人
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:edit')")
    @Log(title = "房源经纪人", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ResidenceBroker residenceBroker)
    {
        return toAjax(residenceBrokerService.updateResidenceBroker(residenceBroker));
    }

    /**
     * 删除房源经纪人
     */
    @PreAuthorize("@ss.hasPermi('residence:broker:remove')")
    @Log(title = "房源经纪人", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceBrokerService.deleteResidenceBrokerByIds(ids));
    }
}
