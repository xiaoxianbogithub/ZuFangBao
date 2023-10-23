package com.ruoyi.residence.service.impl;

import java.util.List;

import com.ruoyi.common.utils.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceDepositMapper;
import com.ruoyi.residence.domain.ResidenceDeposit;
import com.ruoyi.residence.service.IResidenceDepositService;

/**
 * 房源押金设置Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidenceDepositServiceImpl implements IResidenceDepositService 
{
    @Autowired
    private ResidenceDepositMapper residenceDepositMapper;

    /**
     * 查询房源押金设置
     * 
     * @param id 房源押金设置主键
     * @return 房源押金设置
     */
    @Override
    public ResidenceDeposit selectResidenceDepositById(Long id)
    {
        return residenceDepositMapper.selectResidenceDepositById(id);
    }

    /**
     * 查询房源押金设置列表
     * 
     * @param residenceDeposit 房源押金设置
     * @return 房源押金设置
     */
    @Override
    public List<ResidenceDeposit> selectResidenceDepositList(ResidenceDeposit residenceDeposit)
    {
        return residenceDepositMapper.selectResidenceDepositList(residenceDeposit);
    }

    /**
     * 新增房源押金设置
     * 
     * @param residenceDeposit 房源押金设置
     * @return 结果
     */
    @Override
    public int insertResidenceDeposit(ResidenceDeposit residenceDeposit)
    {
        String name = NumberUtils.numberToChinese(residenceDeposit.getValue().intValue());
        residenceDeposit.setName("押"+name);
        return residenceDepositMapper.insertResidenceDeposit(residenceDeposit);
    }

    /**
     * 修改房源押金设置
     * 
     * @param residenceDeposit 房源押金设置
     * @return 结果
     */
    @Override
    public int updateResidenceDeposit(ResidenceDeposit residenceDeposit)
    {
        String name = NumberUtils.numberToChinese(residenceDeposit.getValue().intValue());
        residenceDeposit.setName("押"+name);
        return residenceDepositMapper.updateResidenceDeposit(residenceDeposit);
    }

    /**
     * 批量删除房源押金设置
     * 
     * @param ids 需要删除的房源押金设置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceDepositByIds(Long[] ids)
    {
        return residenceDepositMapper.deleteResidenceDepositByIds(ids);
    }

    /**
     * 删除房源押金设置信息
     * 
     * @param id 房源押金设置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceDepositById(Long id)
    {
        return residenceDepositMapper.deleteResidenceDepositById(id);
    }
}
