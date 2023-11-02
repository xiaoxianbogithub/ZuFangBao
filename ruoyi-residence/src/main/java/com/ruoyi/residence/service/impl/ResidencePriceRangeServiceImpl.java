package com.ruoyi.residence.service.impl;

import com.ruoyi.residence.domain.ResidencePriceRange;
import com.ruoyi.residence.mapper.ResidencePriceRangeMapper;
import com.ruoyi.residence.service.IResidencePriceRangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

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
        List<ResidencePriceRange> residencePriceRangeList = residencePriceRangeMapper.selectResidencePriceRangeList(residencePriceRange);

        for(ResidencePriceRange priceRange: residencePriceRangeList) {
            // 最小金额
            BigDecimal minPrice = priceRange.getMinPrice();
            // 最大金额
            BigDecimal maxPrice = priceRange.getMaxPrice();
            // true 金额大于零
            boolean minPriceFlag = 0 > BigDecimal.ZERO.compareTo(minPrice);
            boolean maxPriceFlag = 0 > BigDecimal.ZERO.compareTo(maxPrice);
            // true 最大金额大于最小金额
            boolean minMaxPriceFlag = 0 > minPrice.compareTo(maxPrice);
            // 最大与最小金额都大于零,且最大金额大于最小金额
            if (minPriceFlag && minMaxPriceFlag) {
                priceRange.setName(minPrice.toString().concat("-").concat(maxPrice.toString()));
                continue;
            }
            // 最小金额为零,最大金额大于零
            if(!minPriceFlag && maxPriceFlag){
                priceRange.setName(maxPrice.toString().concat("以下"));
                continue;
            }
            // 最大金额为零,最小金额大于零
            if(minPriceFlag && !maxPriceFlag){
                priceRange.setName(minPrice.toString().concat("以上"));
            }
        }
        return residencePriceRangeList;
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
