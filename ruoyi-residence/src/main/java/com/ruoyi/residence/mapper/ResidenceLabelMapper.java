package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceLabel;

/**
 * 房源标签Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceLabelMapper 
{
    /**
     * 查询房源标签
     * 
     * @param id 房源标签主键
     * @return 房源标签
     */
    public ResidenceLabel selectResidenceLabelById(Long id);

    /**
     * 查询房源标签列表
     * 
     * @param residenceLabel 房源标签
     * @return 房源标签集合
     */
    public List<ResidenceLabel> selectResidenceLabelList(ResidenceLabel residenceLabel);

    /**
     * 新增房源标签
     * 
     * @param residenceLabel 房源标签
     * @return 结果
     */
    public int insertResidenceLabel(ResidenceLabel residenceLabel);

    /**
     * 修改房源标签
     * 
     * @param residenceLabel 房源标签
     * @return 结果
     */
    public int updateResidenceLabel(ResidenceLabel residenceLabel);

    /**
     * 删除房源标签
     * 
     * @param id 房源标签主键
     * @return 结果
     */
    public int deleteResidenceLabelById(Long id);

    /**
     * 批量删除房源标签
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceLabelByIds(Long[] ids);
}
