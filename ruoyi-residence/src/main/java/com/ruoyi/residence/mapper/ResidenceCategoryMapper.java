package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceCategory;

/**
 * 房源分类Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceCategoryMapper 
{
    /**
     * 查询房源分类
     * 
     * @param id 房源分类主键
     * @return 房源分类
     */
    public ResidenceCategory selectResidenceCategoryById(Long id);

    /**
     * 查询房源分类列表
     * 
     * @param residenceCategory 房源分类
     * @return 房源分类集合
     */
    public List<ResidenceCategory> selectResidenceCategoryList(ResidenceCategory residenceCategory);

    /**
     * 新增房源分类
     * 
     * @param residenceCategory 房源分类
     * @return 结果
     */
    public int insertResidenceCategory(ResidenceCategory residenceCategory);

    /**
     * 修改房源分类
     * 
     * @param residenceCategory 房源分类
     * @return 结果
     */
    public int updateResidenceCategory(ResidenceCategory residenceCategory);

    /**
     * 删除房源分类
     * 
     * @param id 房源分类主键
     * @return 结果
     */
    public int deleteResidenceCategoryById(Long id);

    /**
     * 批量删除房源分类
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceCategoryByIds(Long[] ids);
}
