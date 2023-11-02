package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidencePriceRange;

/**
 * 房源价格区间Service接口
 * 
 * @author climber
 * @date 2023-11-02
 */
public interface IResidencePriceRangeService 
{
    /**
     * 查询房源价格区间
     * 
     * @param id 房源价格区间主键
     * @return 房源价格区间
     */
    public ResidencePriceRange selectResidencePriceRangeById(Long id);

    /**
     * 查询房源价格区间列表
     * 
     * @param residencePriceRange 房源价格区间
     * @return 房源价格区间集合
     */
    public List<ResidencePriceRange> selectResidencePriceRangeList(ResidencePriceRange residencePriceRange);

    /**
     * 新增房源价格区间
     * 
     * @param residencePriceRange 房源价格区间
     * @return 结果
     */
    public int insertResidencePriceRange(ResidencePriceRange residencePriceRange);

    /**
     * 修改房源价格区间
     * 
     * @param residencePriceRange 房源价格区间
     * @return 结果
     */
    public int updateResidencePriceRange(ResidencePriceRange residencePriceRange);

    /**
     * 批量删除房源价格区间
     * 
     * @param ids 需要删除的房源价格区间主键集合
     * @return 结果
     */
    public int deleteResidencePriceRangeByIds(Long[] ids);

    /**
     * 删除房源价格区间信息
     * 
     * @param id 房源价格区间主键
     * @return 结果
     */
    public int deleteResidencePriceRangeById(Long id);
}
