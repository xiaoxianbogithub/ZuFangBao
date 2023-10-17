package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceFacilityMapper;
import com.ruoyi.residence.domain.ResidenceFacility;
import com.ruoyi.residence.service.IResidenceFacilityService;

/**
 * 房源配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@Service
public class ResidenceFacilityServiceImpl implements IResidenceFacilityService 
{
    @Autowired
    private ResidenceFacilityMapper residenceFacilityMapper;

    /**
     * 查询房源配置
     * 
     * @param id 房源配置主键
     * @return 房源配置
     */
    @Override
    public ResidenceFacility selectResidenceFacilityById(Long id)
    {
        return residenceFacilityMapper.selectResidenceFacilityById(id);
    }

    /**
     * 查询房源配置列表
     * 
     * @param residenceFacility 房源配置
     * @return 房源配置
     */
    @Override
    public List<ResidenceFacility> selectResidenceFacilityList(ResidenceFacility residenceFacility)
    {
        return residenceFacilityMapper.selectResidenceFacilityList(residenceFacility);
    }

    /**
     * 新增房源配置
     * 
     * @param residenceFacility 房源配置
     * @return 结果
     */
    @Override
    public int insertResidenceFacility(ResidenceFacility residenceFacility)
    {
        return residenceFacilityMapper.insertResidenceFacility(residenceFacility);
    }

    /**
     * 修改房源配置
     * 
     * @param residenceFacility 房源配置
     * @return 结果
     */
    @Override
    public int updateResidenceFacility(ResidenceFacility residenceFacility)
    {
        return residenceFacilityMapper.updateResidenceFacility(residenceFacility);
    }

    /**
     * 批量删除房源配置
     * 
     * @param ids 需要删除的房源配置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceFacilityByIds(Long[] ids)
    {
        return residenceFacilityMapper.deleteResidenceFacilityByIds(ids);
    }

    /**
     * 删除房源配置信息
     * 
     * @param id 房源配置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceFacilityById(Long id)
    {
        return residenceFacilityMapper.deleteResidenceFacilityById(id);
    }
}
