package com.ruoyi.residence.service.impl;

import java.util.List;

import com.ruoyi.common.utils.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidencePayMapper;
import com.ruoyi.residence.domain.ResidencePay;
import com.ruoyi.residence.service.IResidencePayService;

/**
 * 房源付款设置Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidencePayServiceImpl implements IResidencePayService 
{
    @Autowired
    private ResidencePayMapper residencePayMapper;

    /**
     * 查询房源付款设置
     * 
     * @param id 房源付款设置主键
     * @return 房源付款设置
     */
    @Override
    public ResidencePay selectResidencePayById(Long id)
    {
        return residencePayMapper.selectResidencePayById(id);
    }

    /**
     * 查询房源付款设置列表
     * 
     * @param residencePay 房源付款设置
     * @return 房源付款设置
     */
    @Override
    public List<ResidencePay> selectResidencePayList(ResidencePay residencePay)
    {
        return residencePayMapper.selectResidencePayList(residencePay);
    }

    /**
     * 新增房源付款设置
     * 
     * @param residencePay 房源付款设置
     * @return 结果
     */
    @Override
    public int insertResidencePay(ResidencePay residencePay)
    {
        String name = NumberUtils.numberToChinese(residencePay.getValue().intValue());
        residencePay.setName(name);
        return residencePayMapper.insertResidencePay(residencePay);
    }

    /**
     * 修改房源付款设置
     * 
     * @param residencePay 房源付款设置
     * @return 结果
     */
    @Override
    public int updateResidencePay(ResidencePay residencePay)
    {
        String name = NumberUtils.numberToChinese(residencePay.getValue().intValue());
        residencePay.setName(name);
        return residencePayMapper.updateResidencePay(residencePay);
    }

    /**
     * 批量删除房源付款设置
     * 
     * @param ids 需要删除的房源付款设置主键
     * @return 结果
     */
    @Override
    public int deleteResidencePayByIds(Long[] ids)
    {
        return residencePayMapper.deleteResidencePayByIds(ids);
    }

    /**
     * 删除房源付款设置信息
     * 
     * @param id 房源付款设置主键
     * @return 结果
     */
    @Override
    public int deleteResidencePayById(Long id)
    {
        return residencePayMapper.deleteResidencePayById(id);
    }
}
