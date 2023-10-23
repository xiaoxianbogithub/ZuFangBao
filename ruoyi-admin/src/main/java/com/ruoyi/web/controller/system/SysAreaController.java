package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.system.domain.vo.SysAreaVO;
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
import com.ruoyi.system.domain.SysArea;
import com.ruoyi.system.service.ISysAreaService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 省市区Controller
 * 
 * @author climber
 * @date 2023-10-24
 */
@RestController
@RequestMapping("/system/area")
public class SysAreaController extends BaseController
{
    @Autowired
    private ISysAreaService sysAreaService;

    /**
     * 查询省市区列表
     */
    //@PreAuthorize("@ss.hasPermi('system:area:list')")
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(SysArea sysArea)
    {
        startPage();
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        return getDataTable(list);
    }

    @Anonymous
    @GetMapping("/listCombo")
    public AjaxResult listCombo(SysArea sysArea)
    {
        return success(sysAreaService.selectSysAreaListCombo(sysArea));
    }

    /**
     * 导出省市区列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:export')")
    @Log(title = "省市区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysArea sysArea)
    {
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        ExcelUtil<SysArea> util = new ExcelUtil<SysArea>(SysArea.class);
        util.exportExcel(response, list, "省市区数据");
    }

    /**
     * 获取省市区详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:area:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysAreaService.selectSysAreaById(id));
    }

    /**
     * 新增省市区
     */
    @PreAuthorize("@ss.hasPermi('system:area:add')")
    @Log(title = "省市区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.insertSysArea(sysArea));
    }

    /**
     * 修改省市区
     */
    @PreAuthorize("@ss.hasPermi('system:area:edit')")
    @Log(title = "省市区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.updateSysArea(sysArea));
    }

    /**
     * 删除省市区
     */
    @PreAuthorize("@ss.hasPermi('system:area:remove')")
    @Log(title = "省市区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysAreaService.deleteSysAreaByIds(ids));
    }
}
