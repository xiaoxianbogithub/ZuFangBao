package com.ruoyi.residence.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源价格区间对象 residence_price_range
 * 
 * @author climber
 * @date 2023-11-02
 */
public class ResidencePriceRange extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 最小值 */
    @Excel(name = "最小值")
    private BigDecimal minPrice;

    /** 最大值 */
    @Excel(name = "最大值")
    private BigDecimal maxPrice;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMinPrice(BigDecimal minPrice) 
    {
        this.minPrice = minPrice;
    }

    public BigDecimal getMinPrice() 
    {
        return minPrice;
    }
    public void setMaxPrice(BigDecimal maxPrice) 
    {
        this.maxPrice = maxPrice;
    }

    public BigDecimal getMaxPrice() 
    {
        return maxPrice;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("minPrice", getMinPrice())
            .append("maxPrice", getMaxPrice())
            .append("sort", getSort())
            .toString();
    }
}
