package com.ruoyi.residence.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 委托管理对象 residence_entrust
 * 
 * @author climber
 * @date 2023-12-25
 */
@ApiModel(value = "委托管理对象")
public class ResidenceEntrust extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Id */
    @ApiModelProperty(notes = "Id")
    private Long id;

    /** 委托类型(1:我要租房;2:我要出租) */
    @Excel(name = "委托类型(1:我要租房;2:我要出租)")
    @ApiModelProperty(notes = "委托类型(1:我要租房;2:我要出租)")
    private String entrustType;

    /** 区域 */
    @Excel(name = "区域")
    @ApiModelProperty(notes = "区域Id")
    private Long addressId;

    /** 价格 */
    @Excel(name = "价格")
    @ApiModelProperty(notes = "价格")
    private BigDecimal amount;

    /** 住房类型(1:住宅;2:办公商铺) */
    @Excel(name = "住房类型(1:住宅;2:办公商铺)")
    @ApiModelProperty(notes = "住房类型(1:住宅;2:办公商铺)")
    private String residenceType;

    /** 联系方式 */
    @Excel(name = "联系方式")
    @ApiModelProperty(notes = "联系方式")
    private String phonenumber;

    /** 指定经纪人Id */
    @Excel(name = "指定经纪人Id")
    @ApiModelProperty(notes = "指定经纪人Id")
    private String designateId;

    /** 委托状态(0:已删除;1:已发布;2:处理中;3批准;4:否决) */
    @Excel(name = "委托状态(0:已删除;1:已发布;2:处理中;3批准;4:否决)")
    @ApiModelProperty(notes = "委托状态(0:已删除;1:已发布;2:处理中;3批准;4:否决")
    private String entrustStatus;

    /** 处理批注 */
    @Excel(name = "处理批注")
    @ApiModelProperty(notes = "处理批注")
    private String processReason;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setEntrustType(String entrustType) 
    {
        this.entrustType = entrustType;
    }

    public String getEntrustType() 
    {
        return entrustType;
    }

    public void setAddressId(Long addressId) 
    {
        this.addressId = addressId;
    }

    public Long getAddressId() 
    {
        return addressId;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public void setResidenceType(String residenceType) 
    {
        this.residenceType = residenceType;
    }

    public String getResidenceType() 
    {
        return residenceType;
    }

    public void setPhonenumber(String phonenumber) 
    {
        this.phonenumber = phonenumber;
    }

    public String getPhonenumber() 
    {
        return phonenumber;
    }

    public void setDesignateId(String designateId) 
    {
        this.designateId = designateId;
    }

    public String getDesignateId() 
    {
        return designateId;
    }

    public void setEntrustStatus(String entrustStatus) 
    {
        this.entrustStatus = entrustStatus;
    }

    public String getEntrustStatus() 
    {
        return entrustStatus;
    }

    public void setProcessReason(String entrustReason)
    {
        this.processReason = entrustReason;
    }

    public String getProcessReason()
    {
        return processReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("entrustType", getEntrustType())
            .append("addressId", getAddressId())
            .append("amount", getAmount())
            .append("residenceType", getResidenceType())
            .append("remark", getRemark())
            .append("phonenumber", getPhonenumber())
            .append("designateId", getDesignateId())
            .append("entrustStatus", getEntrustStatus())
            .append("processReason", getProcessReason())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
