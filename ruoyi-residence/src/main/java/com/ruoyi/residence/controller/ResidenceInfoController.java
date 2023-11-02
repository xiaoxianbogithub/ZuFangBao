package com.ruoyi.residence.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;
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
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.service.IResidenceInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

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
    @Anonymous
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
    public void export(HttpServletResponse response, ResidenceInfo residenceInfo)
    {
        List<ResidenceInfoVO> list = residenceInfoService.selectResidenceInfoList(residenceInfo);
        ExcelUtil<ResidenceInfoVO> util = new ExcelUtil<ResidenceInfoVO>(ResidenceInfoVO.class);
        util.exportExcel(response, list, "房屋基本信息数据");
    }

    /**
     * 获取房屋基本信息详细信息
     */
    //@PreAuthorize("@ss.hasPermi('residence:info:query')")
    @Anonymous
    @GetMapping(value = "/{id}")
    @ApiOperation("获取房屋基本信息详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(residenceInfoService.selectResidenceInfoById(id));
    }

    /**
     * 新增房屋基本信息
     */
    //@PreAuthorize("@ss.hasPermi('residence:info:add')")
    @Anonymous
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
    public AjaxResult edit(@RequestBody ResidenceInfo residenceInfo,List<MultipartFile> residencePictureList)
    {
        return toAjax(residenceInfoService.updateResidenceInfo(residenceInfo));
    }

    /**
     * 删除房屋基本信息
     */
    @PreAuthorize("@ss.hasPermi('residence:info:remove')")
    @Log(title = "房屋基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除房屋基本信息")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(residenceInfoService.deleteResidenceInfoByIds(ids));
    }
}
