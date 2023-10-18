package com.ruoyi.residence.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源押金设置对象 residence_deposit
 * 
 * @author climber
 * @date 2023-10-18
 */
public class ResidenceDeposit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 值 */
    @Excel(name = "值")
    private Long value;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 是否可见 */
    @Excel(name = "是否可见")
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
    public void setValue(Long value) 
    {
        this.value = value;
    }

    public Long getValue() 
    {
        return value;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
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
            .append("value", getValue())
            .append("name", getName())
            .append("sort", getSort())
            .append("display", getDisplay())
            .append("deleted", getDeleted())
            .toString();
    }
}
