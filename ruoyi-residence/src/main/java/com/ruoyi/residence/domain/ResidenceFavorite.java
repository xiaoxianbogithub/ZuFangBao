package com.ruoyi.residence.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.residence.domain.VO.ResidenceInfoListVO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 房源收藏对象 residence_favorite
 * 
 * @author climber
 * @date 2023-10-18
 */
@ApiModel(description = "房源收藏")
public class ResidenceFavorite extends BaseEntity
{
    private static final long serialVersionUID = -3499623116477986856L;
    /** Id */
    @Excel(name = "Id")
    @ApiModelProperty(value = "Id")
    private Long id;

    /** 用户Id */
    @Excel(name = "用户Id")
    @ApiModelProperty(value = "用户Id")
    private Long userId;

    /** 房源Id */
    @Excel(name = "房源Id")
    @ApiModelProperty(value = "房源Id")
    private String residenceId;

    /** 排序 */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序")
    private Long sort;

    @ApiModelProperty(hidden = true)
    private ResidenceInfoListVO residenceInfo;

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
    public void setResidenceId(String residenceId)
    {
        this.residenceId = residenceId;
    }

    public String getResidenceId()
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

    public ResidenceInfoListVO getResidenceInfo() {
        return residenceInfo;
    }

    public void setResidenceInfo(ResidenceInfoListVO residenceInfo) {
        this.residenceInfo = residenceInfo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("residenceId", getResidenceId())
            .append("sort", getSort())
            .append("createTime", getCreateTime())
            .append("residenceInfo", residenceInfo)
            .toString();
    }
}
