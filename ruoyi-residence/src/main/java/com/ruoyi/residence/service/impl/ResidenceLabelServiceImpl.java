package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceLabelMapper;
import com.ruoyi.residence.domain.ResidenceLabel;
import com.ruoyi.residence.service.IResidenceLabelService;

/**
 * 房源标签Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@Service
public class ResidenceLabelServiceImpl implements IResidenceLabelService 
{
    @Autowired
    private ResidenceLabelMapper residenceLabelMapper;

    /**
     * 查询房源标签
     * 
     * @param id 房源标签主键
     * @return 房源标签
     */
    @Override
    public ResidenceLabel selectResidenceLabelById(Long id)
    {
        return residenceLabelMapper.selectResidenceLabelById(id);
    }

    /**
     * 查询房源标签列表
     * 
     * @param residenceLabel 房源标签
     * @return 房源标签
     */
    @Override
    public List<ResidenceLabel> selectResidenceLabelList(ResidenceLabel residenceLabel)
    {
        return residenceLabelMapper.selectResidenceLabelList(residenceLabel);
    }

    /**
     * 新增房源标签
     * 
     * @param residenceLabel 房源标签
     * @return 结果
     */
    @Override
    public int insertResidenceLabel(ResidenceLabel residenceLabel)
    {
        return residenceLabelMapper.insertResidenceLabel(residenceLabel);
    }

    /**
     * 修改房源标签
     * 
     * @param residenceLabel 房源标签
     * @return 结果
     */
    @Override
    public int updateResidenceLabel(ResidenceLabel residenceLabel)
    {
        return residenceLabelMapper.updateResidenceLabel(residenceLabel);
    }

    /**
     * 批量删除房源标签
     * 
     * @param ids 需要删除的房源标签主键
     * @return 结果
     */
    @Override
    public int deleteResidenceLabelByIds(Long[] ids)
    {
        return residenceLabelMapper.deleteResidenceLabelByIds(ids);
    }

    /**
     * 删除房源标签信息
     * 
     * @param id 房源标签主键
     * @return 结果
     */
    @Override
    public int deleteResidenceLabelById(Long id)
    {
        return residenceLabelMapper.deleteResidenceLabelById(id);
    }
}
