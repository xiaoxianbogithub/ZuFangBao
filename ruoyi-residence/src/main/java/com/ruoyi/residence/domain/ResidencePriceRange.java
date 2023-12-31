package com.ruoyi.residence.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Transient;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 房源价格区间对象 residence_price_range
 *
 * @author climber
 * @date 2023-11-02
 */
@ApiModel(description = "房源价格区间实体")
public class ResidencePriceRange extends BaseEntity {

    private static final long serialVersionUID = -4360605868796400563L;
    /**
     * $column.columnComment
     */
    private Long id;

    /**
     * 最小值
     */
    @Excel(name = "最小值")
    @ApiModelProperty(value = "最小金额", required = true)
    private BigDecimal minPrice;

    /**
     * 最大值
     */
    @Excel(name = "最大值")
    @ApiModelProperty(value = "最大金额", required = true)
    private BigDecimal maxPrice;

    /**
     * 排序
     */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序", required = true)
    private Long sort;

    @Transient
    @ApiModelProperty(hidden = true)
    private String name;


    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setMinPrice(BigDecimal minPrice) {
        this.minPrice = minPrice;
    }

    public BigDecimal getMinPrice() {
        return minPrice;
    }

    public void setMaxPrice(BigDecimal maxPrice) {
        this.maxPrice = maxPrice;
    }

    public BigDecimal getMaxPrice() {
        return maxPrice;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public Long getSort() {
        return sort;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("minPrice", getMinPrice())
                .append("maxPrice", getMaxPrice())
                .append("sort", getSort())
                .toString();
    }
}
