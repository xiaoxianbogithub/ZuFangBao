package com.ruoyi.residence.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源品牌对象 residence_brand
 * 
 * @author climber
 * @date 2023-10-17
 */
public class ResidenceBrand extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 品牌名称 e.g. 自如,链家 */
    @Excel(name = "品牌名称 e.g. 自如,链家")
    private String name;

    /** 品牌首页图片 */
    @Excel(name = "品牌首页图片")
    private String picUrl;

    /** 品牌描述 */
    @Excel(name = "品牌描述")
    private String description;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long sort;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String status;

    /** 0: 隐藏;1:显示 */
    @Excel(name = "0: 隐藏;1:显示")
    private Long display;

    /** 0:未删除;1:已删除 */
    @Excel(name = "0:未删除;1:已删除")
    private Long deleted;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPicUrl(String picUrl) 
    {
        this.picUrl = picUrl;
    }

    public String getPicUrl() 
    {
        return picUrl;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDisplay(Long display) 
    {
        this.display = display;
    }

    public Long getDisplay() 
    {
        return display;
    }
    public void setDeleted(Long deleted) 
    {
        this.deleted = deleted;
    }

    public Long getDeleted() 
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("picUrl", getPicUrl())
            .append("description", getDescription())
            .append("sort", getSort())
            .append("status", getStatus())
            .append("display", getDisplay())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .toString();
    }
}
