package com.ruoyi.vip.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.vip.domain.VipULog;
import com.ruoyi.vip.domain.VipUser;
import com.ruoyi.vip.service.IVipULogService;
import org.springframework.beans.BeanUtils;
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
import com.ruoyi.vip.service.IVipUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author climber
 * @date 2023-11-22
 */
@RestController
@RequestMapping("/vip/user")
public class VipUserController extends BaseController
{
    @Autowired
    private IVipUserService vipUserService;
    @Autowired
    private IVipULogService vipULogService;
    /**
     * 查询【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(VipUser vipUser)
    {
        startPage();
        List<VipUser> list = vipUserService.selectVipUserList(vipUser);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @PreAuthorize("@ss.hasPermi('residence:user:export')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VipUser vipUser)
    {
        List<VipUser> list = vipUserService.selectVipUserList(vipUser);
        ExcelUtil<VipUser> util = new ExcelUtil<VipUser>(VipUser.class);
        util.exportExcel(response, list, "【请填写功能名称】数据");
    }

    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('residence:user:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(vipUserService.selectVipUserById(id));
    }

//    /**
//     * 新增【请填写功能名称】
//     */
//    @PreAuthorize("@ss.hasPermi('residence:user:add')")
//    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
//    @PostMapping
//    public AjaxResult add(@RequestBody VipUser vipUser)
//    {
//        VipULog vipULog=new VipULog();
//        BeanUtils.copyProperties(vipUser,vipULog);
//        vipULog.setId(null);
//        vipULogService.insertVipULog(vipULog);
//        return toAjax(vipUserService.insertVipUser(vipUser));
//    }

    /**
     * 修改【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:user:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VipUser vipUser)
    {
        VipULog vipULog=new VipULog();
        BeanUtils.copyProperties(vipUser,vipULog);
        vipULog.setId(null);
        vipULogService.insertVipULog(vipULog);
        return toAjax(vipUserService.updateVipUser(vipUser));
    }

    /**
     * 删除【请填写功能名称】
     */
    @PreAuthorize("@ss.hasPermi('residence:user:remove')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(vipUserService.deleteVipUserByIds(ids));
    }







}
