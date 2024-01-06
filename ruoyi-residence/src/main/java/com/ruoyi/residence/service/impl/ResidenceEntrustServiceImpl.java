package com.ruoyi.residence.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.residence.domain.ResidenceEntrust;
import com.ruoyi.residence.domain.VO.ResidenceEntrustVO;
import com.ruoyi.residence.mapper.ResidenceEntrustMapper;
import com.ruoyi.residence.service.IResidenceEntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 委托管理Service业务层处理
 * 
 * @author climber
 * @date 2023-12-25
 */
@Service
public class ResidenceEntrustServiceImpl implements IResidenceEntrustService 
{
    @Autowired
    private ResidenceEntrustMapper residenceEntrustMapper;

    /**
     * 查询委托管理
     * 
     * @param id 委托管理主键
     * @return 委托管理
     */
    @Override
    public ResidenceEntrust selectResidenceEntrustById(Long id)
    {
        return residenceEntrustMapper.selectResidenceEntrustById(id);
    }

    /**
     * 查询委托管理列表
     * 
     * @param residenceEntrust 委托管理
     * @return 委托管理
     */
    @Override
    public List<ResidenceEntrustVO> selectResidenceEntrustList(ResidenceEntrust residenceEntrust)
    {
        return residenceEntrustMapper.selectResidenceEntrustList(residenceEntrust);
    }

    /**
     * 新增委托管理
     * 
     * @param residenceEntrust 委托管理
     * @return 结果
     */
    @Override
    public int insertResidenceEntrust(ResidenceEntrust residenceEntrust)
    {
        residenceEntrust.setCreateTime(DateUtils.getNowDate());
        return residenceEntrustMapper.insertResidenceEntrust(residenceEntrust);
    }

    /**
     * 修改委托管理
     * 
     * @param residenceEntrust 委托管理
     * @return 结果
     */
    @Override
    public int updateResidenceEntrust(ResidenceEntrust residenceEntrust)
    {
        residenceEntrust.setUpdateTime(DateUtils.getNowDate());
        return residenceEntrustMapper.updateResidenceEntrust(residenceEntrust);
    }

    /**
     * 批量删除委托管理
     * 
     * @param ids 需要删除的委托管理主键
     * @return 结果
     */
    @Override
    public int deleteResidenceEntrustByIds(Long[] ids)
    {
        return residenceEntrustMapper.deleteResidenceEntrustByIds(ids);
    }

    /**
     * 删除委托管理信息
     * 
     * @param id 委托管理主键
     * @return 结果
     */
    @Override
    public int deleteResidenceEntrustById(Long id)
    {
        return residenceEntrustMapper.deleteResidenceEntrustById(id);
    }
}
