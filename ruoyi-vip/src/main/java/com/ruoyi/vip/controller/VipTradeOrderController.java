package com.ruoyi.vip.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.vip.domain.VipTradeOrder;
import com.ruoyi.vip.service.IVipTradeOrderService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author climber
 * @date 2023-11-26
 */
@RestController
@RequestMapping("/residence/order")
public class VipTradeOrderController extends BaseController
{
    @Autowired
    private IVipTradeOrderService vipTradeOrderService;

    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(VipTradeOrder vipTradeOrder)
    {
        startPage();
        List<VipTradeOrder> list = vipTradeOrderService.selectVipTradeOrderList(vipTradeOrder);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:order:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VipTradeOrder vipTradeOrder)
    {
        List<VipTradeOrder> list = vipTradeOrderService.selectVipTradeOrderList(vipTradeOrder);
        ExcelUtil<VipTradeOrder> util = new ExcelUtil<VipTradeOrder>(VipTradeOrder.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(vipTradeOrderService.selectVipTradeOrderById(id));
    }

//    /**
//     * 新增【请填写功能名称】
//     */
//    @PreAuthorize("@ss.hasPermi('residence:order:add')")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody VipTradeOrder vipTradeOrder)
//    {
//        return toAjax(vipTradeOrderService.insertVipTradeOrder(vipTradeOrder));
//    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:order:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VipTradeOrder vipTradeOrder)
    {
        return toAjax(vipTradeOrderService.updateVipTradeOrder(vipTradeOrder));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:order:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(vipTradeOrderService.deleteVipTradeOrderByIds(ids));
    }
}
