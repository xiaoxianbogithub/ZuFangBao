package com.ruoyi.residence.controller;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.residence.service.IResidenceConfigService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author xl
 * @Date 2023/10/24 23:21
 * @Description 房源配置
 **/

@RestController
@RequestMapping("/residence/config")
public class ResidenceConfigController extends BaseController {

    @Resource
    private IResidenceConfigService residenceConfigService;


    @Anonymous

    //@PreAuthorize("@ss.hasAnyPermi('residence:info:add,residence:info:edit')")
    @GetMapping(value = "/list")
    public AjaxResult getResidenceConfig()
    {
        return success(residenceConfigService.getResidenceConfig());
    }
}
