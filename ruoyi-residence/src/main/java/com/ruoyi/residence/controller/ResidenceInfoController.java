package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;
import com.ruoyi.residence.service.IResidenceInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房屋基本信息Controller
 * 
 * @author climber
 * @date 2023-10-18
 */
@Api("获取房源基本信息")
@RestController
@RequestMapping("/residence/info")
public class ResidenceInfoController extends BaseController
{
    @Autowired
    private IResidenceInfoService residenceInfoService;

    /**
     * 查询房屋基本信息列表
     */
    @GetMapping("/list")
    @ApiOperation("查询房屋基本信息列表")
    public TableDataInfo list(ResidenceInfo residenceInfo)
    {
        startPage();
        List<ResidenceInfoVO> list = residenceInfoService.selectResidenceInfoList(residenceInfo);
        return getDataTable(list);
    }

    /**
     * 导出房屋基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('residence:info:export')")
    @Log(title = "房屋基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response,@RequestBody ResidenceInfo residenceInfo)
    {
        List<ResidenceInfoVO> list = residenceInfoService.selectResidenceInfoList(residenceInfo);
        ExcelUtil<ResidenceInfoVO> util = new ExcelUtil<>(ResidenceInfoVO.class);
        util.exportExcel(response, list, "房屋基本信息数据");
    }

    /**
     * 获取房屋基本信息详细信息
     */
    @GetMapping(value = "/{id}")
    @ApiOperation("获取房屋基本信息详细信息")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(residenceInfoService.selectResidenceInfoById(id));
    }

    /**
     * 新增房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:add')")
    @Log(title = "房屋基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增房屋基本信息")
    public AjaxResult add(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.insertResidenceInfo(residenceInfo));
    }

    /**
     * 修改房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:edit')")
    @Log(title = "房屋基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改房屋基本信息")
    public AjaxResult edit(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.updateResidenceInfo(residenceInfo));
    }

    @PreAuthorize("@ss.hasPermi('residence:info:verify')")
    @Log(title = "房屋基本信息", businessType = BusinessType.UPDATE)
    @PostMapping("/verifyInfo")
    @ApiOperation("房源审核")
    public AjaxResult verifyInfo(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.verifyInfo(residenceInfo));
    }

    /**
     * 删除房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:remove')")
    @Log(title = "房屋基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除房屋基本信息")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(residenceInfoService.deleteResidenceInfoByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('residence:info:edit')")
    @Log(title = "房屋基本信息", businessType = BusinessType.UPDATE)
    @PostMapping("/updateStatus")
    @ApiOperation("修改房源状态")
    public AjaxResult updateStatus(@RequestBody ResidenceInfo residenceInfo)
    {
        return toAjax(residenceInfoService.updateStatus(residenceInfo));
    }
}
