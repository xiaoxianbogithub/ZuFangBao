package com.ruoyi.residence.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源图片对象 residence_picture
 * 
 * @author climber
 * @date 2023-10-17
 */
public class ResidencePicture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 房源Id */
    @Excel(name = "房源Id")
    private Long residenceId;

    /** 图片路径 */
    @Excel(name = "图片路径")
    private String picUrl;

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
    public void setResidenceId(Long residenceId) 
    {
        this.residenceId = residenceId;
    }

    public Long getResidenceId() 
    {
        return residenceId;
    }
    public void setPicUrl(String picUrl) 
    {
        this.picUrl = picUrl;
    }

    public String getPicUrl() 
    {
        return picUrl;
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
            .append("residenceId", getResidenceId())
            .append("picUrl", getPicUrl())
            .append("sort", getSort())
            .toString();
    }
}
