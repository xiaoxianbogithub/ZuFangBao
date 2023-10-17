package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceFacility;

/**
 * 房源配置Mapper接口
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
public interface ResidenceFacilityMapper 
{
    /**
     * 查询房源配置
     * 
     * @param id 房源配置主键
     * @return 房源配置
     */
    public ResidenceFacility selectResidenceFacilityById(Long id);

    /**
     * 查询房源配置列表
     * 
     * @param residenceFacility 房源配置
     * @return 房源配置集合
     */
    public List<ResidenceFacility> selectResidenceFacilityList(ResidenceFacility residenceFacility);

    /**
     * 新增房源配置
     * 
     * @param residenceFacility 房源配置
     * @return 结果
     */
    public int insertResidenceFacility(ResidenceFacility residenceFacility);

    /**
     * 修改房源配置
     * 
     * @param residenceFacility 房源配置
     * @return 结果
     */
    public int updateResidenceFacility(ResidenceFacility residenceFacility);

    /**
     * 删除房源配置
     * 
     * @param id 房源配置主键
     * @return 结果
     */
    public int deleteResidenceFacilityById(Long id);

    /**
     * 批量删除房源配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceFacilityByIds(Long[] ids);
}
