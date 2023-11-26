package com.ruoyi.vip.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 vip_user
 * 
 * @author climber
 * @date 2023-11-26
 */
public class VipUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 用户名字 */
    @Excel(name = "用户名字")
    private String userName;

    /** 是否vip */
    @Excel(name = "是否vip")
    private String isVip;

    /** vip开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "vip开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date vipCreatTime;

    /** vip结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "vip结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date vipEndTime;

    /** 删除 */
    @Excel(name = "删除")
    private Integer deleted;

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
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setIsVip(String isVip) 
    {
        this.isVip = isVip;
    }

    public String getIsVip() 
    {
        return isVip;
    }
    public void setVipCreatTime(Date vipCreatTime) 
    {
        this.vipCreatTime = vipCreatTime;
    }

    public Date getVipCreatTime() 
    {
        return vipCreatTime;
    }
    public void setVipEndTime(Date vipEndTime) 
    {
        this.vipEndTime = vipEndTime;
    }

    public Date getVipEndTime() 
    {
        return vipEndTime;
    }
    public void setDeleted(Integer deleted)
    {
        this.deleted = deleted;
    }

    public Integer getDeleted()
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("isVip", getIsVip())
            .append("vipCreatTime", getVipCreatTime())
            .append("vipEndTime", getVipEndTime())
            .append("remark", getRemark())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
