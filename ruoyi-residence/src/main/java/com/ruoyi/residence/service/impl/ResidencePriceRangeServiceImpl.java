package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidencePriceRangeMapper;
import com.ruoyi.residence.domain.ResidencePriceRange;
import com.ruoyi.residence.service.IResidencePriceRangeService;

/**
 * 房源价格区间Service业务层处理
 * 
 * @author climber
 * @date 2023-11-02
 */
@Service
public class ResidencePriceRangeServiceImpl implements IResidencePriceRangeService 
{
    @Autowired
    private ResidencePriceRangeMapper residencePriceRangeMapper;

    /**
     * 查询房源价格区间
     * 
     * @param id 房源价格区间主键
     * @return 房源价格区间
     */
    @Override
    public ResidencePriceRange selectResidencePriceRangeById(Long id)
    {
        return residencePriceRangeMapper.selectResidencePriceRangeById(id);
    }

    /**
     * 查询房源价格区间列表
     * 
     * @param residencePriceRange 房源价格区间
     * @return 房源价格区间
     */
    @Override
    public List<ResidencePriceRange> selectResidencePriceRangeList(ResidencePriceRange residencePriceRange)
    {
        return residencePriceRangeMapper.selectResidencePriceRangeList(residencePriceRange);
    }

    /**
     * 新增房源价格区间
     * 
     * @param residencePriceRange 房源价格区间
     * @return 结果
     */
    @Override
    public int insertResidencePriceRange(ResidencePriceRange residencePriceRange)
    {
        return residencePriceRangeMapper.insertResidencePriceRange(residencePriceRange);
    }

    /**
     * 修改房源价格区间
     * 
     * @param residencePriceRange 房源价格区间
     * @return 结果
     */
    @Override
    public int updateResidencePriceRange(ResidencePriceRange residencePriceRange)
    {
        return residencePriceRangeMapper.updateResidencePriceRange(residencePriceRange);
    }

    /**
     * 批量删除房源价格区间
     * 
     * @param ids 需要删除的房源价格区间主键
     * @return 结果
     */
    @Override
    public int deleteResidencePriceRangeByIds(Long[] ids)
    {
        return residencePriceRangeMapper.deleteResidencePriceRangeByIds(ids);
    }

    /**
     * 删除房源价格区间信息
     * 
     * @param id 房源价格区间主键
     * @return 结果
     */
    @Override
    public int deleteResidencePriceRangeById(Long id)
    {
        return residencePriceRangeMapper.deleteResidencePriceRangeById(id);
    }
}
