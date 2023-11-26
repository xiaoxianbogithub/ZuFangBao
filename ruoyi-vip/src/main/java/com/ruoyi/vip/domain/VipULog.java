package com.ruoyi.vip.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 vip_u_log
 * 
 * @author climber
 * @date 2023-11-26
 */
public class VipULog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 修改人id */
    @Excel(name = "修改人id")
    private Long userIdG;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserIdG(Long userIdG) 
    {
        this.userIdG = userIdG;
    }

    public Long getUserIdG() 
    {
        return userIdG;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userIdG", getUserIdG())
            .append("userId", getUserId())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .toString();
    }
}
