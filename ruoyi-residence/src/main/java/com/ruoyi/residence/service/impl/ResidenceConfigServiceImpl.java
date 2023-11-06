package com.ruoyi.residence.service.impl;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.residence.domain.*;
import com.ruoyi.residence.service.*;
import com.ruoyi.system.domain.SysArea;
import com.ruoyi.system.domain.vo.SysAreaVO;
import com.ruoyi.system.service.ISysAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Author climber
 * @Date 2023/10/24 23:23
 * @Description TODO
 **/
@Service("residenceConfigService")
public class ResidenceConfigServiceImpl  implements IResidenceConfigService {

    @Autowired
    private IResidenceDepositService residenceDepositService;

    @Autowired
    private IResidencePayService residencePayService;

    @Autowired
    private IResidenceHouseTypeService residenceHouseTypeService;

    @Autowired
    private IResidenceFacilityService residenceFacilityService;
    @Autowired
    private IResidenceLabelService residenceLabelService;
    @Autowired
    private ISysAreaService sysAreaService;
    @Autowired
    private IResidencePriceRangeService residencePriceRangeService;

    @Override
    public Map<String, List> getResidenceConfig() {
        ConcurrentHashMap<String, List> resultMap = new ConcurrentHashMap<>();
        // 押金
        ResidenceDeposit residenceDeposit = new ResidenceDeposit();
        residenceDeposit.setDeleted(0L);
        residenceDeposit.setDisplay(1L);
        List<ResidenceDeposit> residenceDepositList = residenceDepositService.selectResidenceDepositList(residenceDeposit);
        resultMap.put("deposit",residenceDepositList);
        // 付款
        ResidencePay residencePay = new ResidencePay();
        residencePay.setDeleted(0L);
        residencePay.setDisplay(1L);
        List<ResidencePay> residencePayList = residencePayService.selectResidencePayList(residencePay);
        resultMap.put("pay",residencePayList);
        // 查询房型
        ResidenceHouseType residenceHouseType = new ResidenceHouseType();
        residenceHouseType.setDeleted(0L);
        residenceHouseType.setDisplay(1L);
        List<ResidenceHouseType> residenceHouseTypeList = residenceHouseTypeService.selectResidenceHouseTypeList(residenceHouseType);
        resultMap.put("houseType",residenceHouseTypeList);
        // 房源配置
        ResidenceFacility residenceFacility = new ResidenceFacility();
        residenceFacility.setDeleted(0L);
        residenceFacility.setDisplay(1L);
        List<ResidenceFacility> residenceFacilityList = residenceFacilityService.selectResidenceFacilityList(residenceFacility);
        resultMap.put("facility",residenceFacilityList);
        // 房源标签
        ResidenceLabel residenceLabel = new ResidenceLabel();
        residenceFacility.setDeleted(0L);
        residenceFacility.setDisplay(1L);
        List<ResidenceLabel> residenceLabelList = residenceLabelService.selectResidenceLabelList(residenceLabel);
        resultMap.put("label",residenceLabelList);
        // 地区
        SysArea sysArea = new SysArea();
        sysArea.setPid(Constants.XIAMEN_AREA_CODE);
        List<SysAreaVO> sysAreaVOList = sysAreaService.selectSysAreaListCombo(sysArea);
        resultMap.put("area",sysAreaVOList);
        // 价格区间
        List<ResidencePriceRange> residencePriceRangesList = residencePriceRangeService.selectResidencePriceRangeList(new ResidencePriceRange());
        resultMap.put("priceRange",residencePriceRangesList);
        return resultMap;
    }
}
