package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceInfoMapper;
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.service.IResidenceInfoService;

/**
 * 房屋基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@Service
public class ResidenceInfoServiceImpl implements IResidenceInfoService 
{
    @Autowired
    private ResidenceInfoMapper residenceInfoMapper;

    /**
     * 查询房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 房屋基本信息
     */
    @Override
    public ResidenceInfo selectResidenceInfoById(Long id)
    {
        return residenceInfoMapper.selectResidenceInfoById(id);
    }

    /**
     * 查询房屋基本信息列表
     * 
     * @param residenceInfo 房屋基本信息
     * @return 房屋基本信息
     */
    @Override
    public List<ResidenceInfo> selectResidenceInfoList(ResidenceInfo residenceInfo)
    {
        return residenceInfoMapper.selectResidenceInfoList(residenceInfo);
    }

    /**
     * 新增房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    @Override
    public int insertResidenceInfo(ResidenceInfo residenceInfo)
    {
        residenceInfo.setCreateTime(DateUtils.getNowDate());
        return residenceInfoMapper.insertResidenceInfo(residenceInfo);
    }

    /**
     * 修改房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    @Override
    public int updateResidenceInfo(ResidenceInfo residenceInfo)
    {
        residenceInfo.setUpdateTime(DateUtils.getNowDate());
        return residenceInfoMapper.updateResidenceInfo(residenceInfo);
    }

    /**
     * 批量删除房屋基本信息
     * 
     * @param ids 需要删除的房屋基本信息主键
     * @return 结果
     */
    @Override
    public int deleteResidenceInfoByIds(Long[] ids)
    {
        return residenceInfoMapper.deleteResidenceInfoByIds(ids);
    }

    /**
     * 删除房屋基本信息信息
     * 
     * @param id 房屋基本信息主键
     * @return 结果
     */
    @Override
    public int deleteResidenceInfoById(Long id)
    {
        return residenceInfoMapper.deleteResidenceInfoById(id);
    }
}
