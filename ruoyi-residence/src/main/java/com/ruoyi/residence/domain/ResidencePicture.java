package com.ruoyi.residence.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 房源图片对象 residence_picture
 * 
 * @author climber
 * @date 2023-10-18
 */
@ApiModel(description = "房源图片")
public class ResidencePicture extends BaseEntity {
    private static final long serialVersionUID = 3299645928933616579L;
    /** Id */
    private Long id;

    /** 房源Id */
    @Excel(name = "房源Id")
    @ApiModelProperty(value = "绑定的房源Id",required = true)
    private String residenceId;

    /** 图片路径 */
    @ApiModelProperty(value = "图片路径地址",required = true)
    private String picUrl;

    /** 排序 */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序",required = true)
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setResidenceId(String residenceId)
    {
        this.residenceId = residenceId;
    }

    public String getResidenceId()
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
