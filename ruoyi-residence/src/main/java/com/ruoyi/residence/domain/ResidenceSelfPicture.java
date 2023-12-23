package com.ruoyi.residence.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 自营首页图片对象 residence_self_picture
 * 
 * @author climber
 * @date 2023-12-23
 */
@ApiModel(description = "自营首页图片")
public class ResidenceSelfPicture extends BaseEntity
{

    private static final long serialVersionUID = 9071160311615017077L;
    /** ID */
    @ApiModelProperty(value = "id")
    private Long id;

    /** 图片地址 */
    @Excel(name = "图片地址")
    @ApiModelProperty(value = "图片地址")
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
            .append("picUrl", getPicUrl())
            .append("sort", getSort())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
