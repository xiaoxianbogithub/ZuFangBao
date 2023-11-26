package com.ruoyi.vip.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 vip_trade_order
 * 
 * @author climber
 * @date 2023-11-26
 */
public class VipTradeOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String traNumber;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 微信支付成功编号  */
    @Excel(name = "微信支付成功编号 ")
    private String payNumberV;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private String payMoneyV;

    /** 订单状态（待支付，已支付，支付时间过期） */
    @Excel(name = "订单状态", readConverterExp = "待=支付，已支付，支付时间过期")
    private String payStatusV;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expireTime;

    /** vip_id */
    @Excel(name = "vip_id")
    private Long vipId;

    /** vip购买服务名称 */
    @Excel(name = "vip购买服务名称")
    private String vipName;

    /** 是否删除 */
    @Excel(name = "是否删除")
    private Integer deleted;

    /** 租户编号 */
    @Excel(name = "租户编号")
    private Long tenantId;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private String openId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTraNumber(String traNumber) 
    {
        this.traNumber = traNumber;
    }

    public String getTraNumber() 
    {
        return traNumber;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setPayNumberV(String payNumberV) 
    {
        this.payNumberV = payNumberV;
    }

    public String getPayNumberV() 
    {
        return payNumberV;
    }
    public void setPayMoneyV(String payMoneyV) 
    {
        this.payMoneyV = payMoneyV;
    }

    public String getPayMoneyV() 
    {
        return payMoneyV;
    }
    public void setPayStatusV(String payStatusV) 
    {
        this.payStatusV = payStatusV;
    }

    public String getPayStatusV() 
    {
        return payStatusV;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setExpireTime(Date expireTime) 
    {
        this.expireTime = expireTime;
    }

    public Date getExpireTime() 
    {
        return expireTime;
    }
    public void setVipId(Long vipId) 
    {
        this.vipId = vipId;
    }

    public Long getVipId() 
    {
        return vipId;
    }
    public void setVipName(String vipName) 
    {
        this.vipName = vipName;
    }

    public String getVipName() 
    {
        return vipName;
    }
    public void setDeleted(Integer deleted) 
    {
        this.deleted = deleted;
    }

    public Integer getDeleted() 
    {
        return deleted;
    }
    public void setTenantId(Long tenantId) 
    {
        this.tenantId = tenantId;
    }

    public Long getTenantId() 
    {
        return tenantId;
    }
    public void setOpenId(String openId) 
    {
        this.openId = openId;
    }

    public String getOpenId() 
    {
        return openId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("traNumber", getTraNumber())
            .append("userId", getUserId())
            .append("payTime", getPayTime())
            .append("payNumberV", getPayNumberV())
            .append("payMoneyV", getPayMoneyV())
            .append("payStatusV", getPayStatusV())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("endTime", getEndTime())
            .append("expireTime", getExpireTime())
            .append("vipId", getVipId())
            .append("vipName", getVipName())
            .append("deleted", getDeleted())
            .append("tenantId", getTenantId())
            .append("openId", getOpenId())
            .toString();
    }
}
