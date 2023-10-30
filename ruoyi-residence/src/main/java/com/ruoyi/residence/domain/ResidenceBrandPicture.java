package com.ruoyi.residence.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源品牌图片对象 residence_brand_picture
 * 
 * @author climber
 * @date 2023-10-18
 */
@ApiModel(description = "房源品牌图片")
public class ResidenceBrandPicture extends BaseEntity
{

    private static final long serialVersionUID = 4558018970382792267L;
    /** Id */
    @ApiModelProperty(value = "id")
    private Long id;

    /** 房源品牌Id */
    @Excel(name = "房源品牌Id")
    @ApiModelProperty(value = "绑定的房源品牌Id")
    private Long residenceBrandId;

    /** 图片路径 */
    @Excel(name = "图片路径")
    @ApiModelProperty(value = "图片路径")
    private String picUrl;

    /** 排序 */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序")
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setResidenceBrandId(Long residenceBrandId) 
    {
        this.residenceBrandId = residenceBrandId;
    }

    public Long getResidenceBrandId() 
    {
        return residenceBrandId;
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
            .append("residenceBrandId", getResidenceBrandId())
            .append("picUrl", getPicUrl())
            .append("sort", getSort())
            .toString();
    }
}
