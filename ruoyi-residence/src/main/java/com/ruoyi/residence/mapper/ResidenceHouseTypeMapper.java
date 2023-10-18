package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceHouseType;

/**
 * 房源户型设定Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceHouseTypeMapper 
{
    /**
     * 查询房源户型设定
     * 
     * @param id 房源户型设定主键
     * @return 房源户型设定
     */
    public ResidenceHouseType selectResidenceHouseTypeById(Long id);

    /**
     * 查询房源户型设定列表
     * 
     * @param residenceHouseType 房源户型设定
     * @return 房源户型设定集合
     */
    public List<ResidenceHouseType> selectResidenceHouseTypeList(ResidenceHouseType residenceHouseType);

    /**
     * 新增房源户型设定
     * 
     * @param residenceHouseType 房源户型设定
     * @return 结果
     */
    public int insertResidenceHouseType(ResidenceHouseType residenceHouseType);

    /**
     * 修改房源户型设定
     * 
     * @param residenceHouseType 房源户型设定
     * @return 结果
     */
    public int updateResidenceHouseType(ResidenceHouseType residenceHouseType);

    /**
     * 删除房源户型设定
     * 
     * @param id 房源户型设定主键
     * @return 结果
     */
    public int deleteResidenceHouseTypeById(Long id);

    /**
     * 批量删除房源户型设定
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceHouseTypeByIds(Long[] ids);
}
