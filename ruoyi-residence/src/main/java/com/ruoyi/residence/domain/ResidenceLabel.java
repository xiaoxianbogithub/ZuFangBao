package com.ruoyi.residence.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源标签对象 residence_label
 * 
 * @author climber
 * @date 2023-10-18
 */
@ApiModel("房源标签")
public class ResidenceLabel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 名称 */
    @Excel(name = "名称")
    @ApiModelProperty(value = "名称",required = true)
    private String name;

    /** 是否为系统内置 */
    @Excel(name = "是否为系统内置")
    @ApiModelProperty(value = "是否为系统内置",required = true)
    private Long systemType;

    /** 排序 */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序",required = true)
    private Long sort;

    /** 是否可见 */
    @Excel(name = "是否可见")
    @ApiModelProperty(value = "是否可见",required = true)
    private Long display;

    /** 是否删除 */
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
    public void setSystemType(Long systemType) 
    {
        this.systemType = systemType;
    }

    public Long getSystemType() 
    {
        return systemType;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
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
            .append("systemType", getSystemType())
            .append("sort", getSort())
            .append("display", getDisplay())
            .append("deleted", getDeleted())
            .toString();
    }
}
