package com.ruoyi.residence.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源品牌对象 residence_brand
 * 
 * @author climber
 * @date 2023-10-18
 */
public class ResidenceBrand extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Id */
    private Long id;

    /** 品牌名称 */
    @Excel(name = "品牌名称")
    private String name;

    /** 品牌首页图片 */
    @Excel(name = "品牌首页图片")
    private String picUrl;

    /** 品牌描述 */
    @Excel(name = "品牌描述")
    private String description;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 是否可见 */
    @Excel(name = "是否可见")
    private Long display;

    /** 是否删除 */
    private Long deleted;

    /** 房源品牌图片信息 */
    private List<ResidenceBrandPicture> residenceBrandPictureList;

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

    public List<ResidenceBrandPicture> getResidenceBrandPictureList()
    {
        return residenceBrandPictureList;
    }

    public void setResidenceBrandPictureList(List<ResidenceBrandPicture> residenceBrandPictureList)
    {
        this.residenceBrandPictureList = residenceBrandPictureList;
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
            .append("residenceBrandPictureList", getResidenceBrandPictureList())
            .toString();
    }
}
