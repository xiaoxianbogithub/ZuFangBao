package com.ruoyi.residence.mapper;

import com.ruoyi.residence.domain.ResidencePriceRange;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 房源价格区间Mapper接口
 * 
 * @author climber
 * @date 2023-11-02
 */
@Mapper
public interface ResidencePriceRangeMapper 
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
     * 删除房源价格区间
     * 
     * @param id 房源价格区间主键
     * @return 结果
     */
    public int deleteResidencePriceRangeById(Long id);

    /**
     * 批量删除房源价格区间
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidencePriceRangeByIds(Long[] ids);
}
