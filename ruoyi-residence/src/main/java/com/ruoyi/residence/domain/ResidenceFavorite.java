package com.ruoyi.residence.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源收藏对象 residence_favorite
 * 
 * @author climber
 * @date 2023-10-17
 */
public class ResidenceFavorite extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 用户Id */
    @Excel(name = "用户Id")
    private Long userId;

    /** 房源Id */
    @Excel(name = "房源Id")
    private Long residenceId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setResidenceId(Long residenceId) 
    {
        this.residenceId = residenceId;
    }

    public Long getResidenceId() 
    {
        return residenceId;
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
            .append("userId", getUserId())
            .append("residenceId", getResidenceId())
            .append("sort", getSort())
            .append("createTime", getCreateTime())
            .toString();
    }
}
