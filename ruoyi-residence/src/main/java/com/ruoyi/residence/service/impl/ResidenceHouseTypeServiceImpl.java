package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceHouseTypeMapper;
import com.ruoyi.residence.domain.ResidenceHouseType;
import com.ruoyi.residence.service.IResidenceHouseTypeService;

/**
 * 房源户型设定Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@Service
public class ResidenceHouseTypeServiceImpl implements IResidenceHouseTypeService 
{
    @Autowired
    private ResidenceHouseTypeMapper residenceHouseTypeMapper;

    /**
     * 查询房源户型设定
     * 
     * @param id 房源户型设定主键
     * @return 房源户型设定
     */
    @Override
    public ResidenceHouseType selectResidenceHouseTypeById(Long id)
    {
        return residenceHouseTypeMapper.selectResidenceHouseTypeById(id);
    }

    /**
     * 查询房源户型设定列表
     * 
     * @param residenceHouseType 房源户型设定
     * @return 房源户型设定
     */
    @Override
    public List<ResidenceHouseType> selectResidenceHouseTypeList(ResidenceHouseType residenceHouseType)
    {
        return residenceHouseTypeMapper.selectResidenceHouseTypeList(residenceHouseType);
    }

    /**
     * 新增房源户型设定
     * 
     * @param residenceHouseType 房源户型设定
     * @return 结果
     */
    @Override
    public int insertResidenceHouseType(ResidenceHouseType residenceHouseType)
    {
        return residenceHouseTypeMapper.insertResidenceHouseType(residenceHouseType);
    }

    /**
     * 修改房源户型设定
     * 
     * @param residenceHouseType 房源户型设定
     * @return 结果
     */
    @Override
    public int updateResidenceHouseType(ResidenceHouseType residenceHouseType)
    {
        return residenceHouseTypeMapper.updateResidenceHouseType(residenceHouseType);
    }

    /**
     * 批量删除房源户型设定
     * 
     * @param ids 需要删除的房源户型设定主键
     * @return 结果
     */
    @Override
    public int deleteResidenceHouseTypeByIds(Long[] ids)
    {
        return residenceHouseTypeMapper.deleteResidenceHouseTypeByIds(ids);
    }

    /**
     * 删除房源户型设定信息
     * 
     * @param id 房源户型设定主键
     * @return 结果
     */
    @Override
    public int deleteResidenceHouseTypeById(Long id)
    {
        return residenceHouseTypeMapper.deleteResidenceHouseTypeById(id);
    }
}
