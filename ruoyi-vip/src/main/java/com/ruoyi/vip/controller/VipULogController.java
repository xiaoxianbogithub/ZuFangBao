package com.ruoyi.vip.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.vip.domain.VipULog;
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
import com.ruoyi.vip.service.IVipULogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author climber
 * @date 2023-11-22
 */
@RestController
@RequestMapping("/vip/log")
public class VipULogController extends BaseController
{
    @Autowired
    private IVipULogService vipULogService;

    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(VipULog vipULog)
    {
        startPage();
        List<VipULog> list = vipULogService.selectVipULogList(vipULog);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:log:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VipULog vipULog)
    {
        List<VipULog> list = vipULogService.selectVipULogList(vipULog);
        ExcelUtil<VipULog> util = new ExcelUtil<VipULog>(VipULog.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:log:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(vipULogService.selectVipULogById(id));
    }

//    /**
//     * 新增【请填写功能名称】
//     */
//    @PreAuthorize("@ss.hasPermi('residence:log:add')")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody VipULog vipULog)
//    {
//        return toAjax(vipULogService.insertVipULog(vipULog));
//    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:log:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VipULog vipULog)
    {
        return toAjax(vipULogService.updateVipULog(vipULog));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:log:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(vipULogService.deleteVipULogByIds(ids));
    }
}
