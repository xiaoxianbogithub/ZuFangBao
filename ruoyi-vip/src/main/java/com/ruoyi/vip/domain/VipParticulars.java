package com.ruoyi.vip.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 vip_particulars
 * 
 * @author climber
 * @date 2023-11-26
 */
public class VipParticulars extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** vip描述 */
    @Excel(name = "vip描述")
    private String vipName;

    /** VIP时间 */
    @Excel(name = "VIP时间")
    private String vipTime;

    /** vip价格 */
    @Excel(name = "vip价格")
    private String vipMoney;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long deleted;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setVipName(String vipName) 
    {
        this.vipName = vipName;
    }

    public String getVipName() 
    {
        return vipName;
    }
    public void setVipTime(String vipTime) 
    {
        this.vipTime = vipTime;
    }

    public String getVipTime() 
    {
        return vipTime;
    }
    public void setVipMoney(String vipMoney) 
    {
        this.vipMoney = vipMoney;
    }

    public String getVipMoney() 
    {
        return vipMoney;
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
            .append("vipName", getVipName())
            .append("vipTime", getVipTime())
            .append("vipMoney", getVipMoney())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .append("remark", getRemark())
            .toString();
    }
}
