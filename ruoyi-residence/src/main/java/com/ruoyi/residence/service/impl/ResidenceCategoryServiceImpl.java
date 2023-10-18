package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceCategoryMapper;
import com.ruoyi.residence.domain.ResidenceCategory;
import com.ruoyi.residence.service.IResidenceCategoryService;

/**
 * 房源分类Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidenceCategoryServiceImpl implements IResidenceCategoryService 
{
    @Autowired
    private ResidenceCategoryMapper residenceCategoryMapper;

    /**
     * 查询房源分类
     * 
     * @param id 房源分类主键
     * @return 房源分类
     */
    @Override
    public ResidenceCategory selectResidenceCategoryById(Long id)
    {
        return residenceCategoryMapper.selectResidenceCategoryById(id);
    }

    /**
     * 查询房源分类列表
     * 
     * @param residenceCategory 房源分类
     * @return 房源分类
     */
    @Override
    public List<ResidenceCategory> selectResidenceCategoryList(ResidenceCategory residenceCategory)
    {
        return residenceCategoryMapper.selectResidenceCategoryList(residenceCategory);
    }

    /**
     * 新增房源分类
     * 
     * @param residenceCategory 房源分类
     * @return 结果
     */
    @Override
    public int insertResidenceCategory(ResidenceCategory residenceCategory)
    {
        return residenceCategoryMapper.insertResidenceCategory(residenceCategory);
    }

    /**
     * 修改房源分类
     * 
     * @param residenceCategory 房源分类
     * @return 结果
     */
    @Override
    public int updateResidenceCategory(ResidenceCategory residenceCategory)
    {
        return residenceCategoryMapper.updateResidenceCategory(residenceCategory);
    }

    /**
     * 批量删除房源分类
     * 
     * @param ids 需要删除的房源分类主键
     * @return 结果
     */
    @Override
    public int deleteResidenceCategoryByIds(Long[] ids)
    {
        return residenceCategoryMapper.deleteResidenceCategoryByIds(ids);
    }

    /**
     * 删除房源分类信息
     * 
     * @param id 房源分类主键
     * @return 结果
     */
    @Override
    public int deleteResidenceCategoryById(Long id)
    {
        return residenceCategoryMapper.deleteResidenceCategoryById(id);
    }
}
