package com.ruoyi.residence.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源举报对象 residence_expose
 * 
 * @author climber
 * @date 2023-12-25
 */
@ApiModel(value = "房源举报对象")
public class ResidenceExpose extends BaseEntity
{

    private static final long serialVersionUID = 8911859657207062228L;
    /** Id */
    @ApiModelProperty(notes = "Id")
    private Long id;

    /** 房源Id */
    @ApiModelProperty(notes = "房源Id")
    @Excel(name = "房源Id")
    private String residenceId;

    /** 举报原因Id */
    @ApiModelProperty(notes = "举报原因(1:房源价格虚假;2:房源位置虚假;3:房源图片虚假;4:经纪人服务差;5:其他)")
    @Excel(name = "举报原因(1:房源价格虚假;2:房源位置虚假;3:房源图片虚假;4:经纪人服务差;5:其他)")
    private String exposeReason;

    /** 凭证图片1 */
    @ApiModelProperty(notes = "凭证图片1")
    @Excel(name = "凭证图片1")
    private String picUrl1;

    /** 凭证图片2 */
    @ApiModelProperty(notes = "凭证图片2")
    @Excel(name = "凭证图片2")
    private String picUrl2;

    /** 凭证图片3 */
    @ApiModelProperty(notes = "凭证图片3")
    @Excel(name = "凭证图片3")
    private String picUrl3;

    /** 委托状态(0:已删除;1:已提交;2:处理中;3同意;4:反对) */
    @ApiModelProperty(notes = "委托状态(0:已删除;1:已提交;2:处理中;3同意;4:反对)")
    @Excel(name = "委托状态(0:已删除;1:已提交;2:处理中;3同意;4:反对)")
    private String exposeStatus;

    /** 处理批注 */
    @ApiModelProperty(notes = "处理批注")
    @Excel(name = "处理批注")
    private String processReason;

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

    public void setExposeReason(String exposeReason)
    {
        this.exposeReason = exposeReason;
    }

    public String getExposeReason()
    {
        return exposeReason;
    }

    public void setPicUrl1(String picUrl1) 
    {
        this.picUrl1 = picUrl1;
    }

    public String getPicUrl1() 
    {
        return picUrl1;
    }

    public void setPicUrl2(String picUrl2) 
    {
        this.picUrl2 = picUrl2;
    }

    public String getPicUrl2() 
    {
        return picUrl2;
    }

    public void setPicUrl3(String picUrl3) 
    {
        this.picUrl3 = picUrl3;
    }

    public String getPicUrl3() 
    {
        return picUrl3;
    }

    public void setExposeStatus(String exposeStatus) 
    {
        this.exposeStatus = exposeStatus;
    }

    public String getExposeStatus() 
    {
        return exposeStatus;
    }

    public void setProcessReason(String processReason)
    {
        this.processReason = processReason;
    }

    public String getProcessReason()
    {
        return processReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("residenceId", getResidenceId())
            .append("exposeReason", getExposeReason())
            .append("remark", getRemark())
            .append("picUrl1", getPicUrl1())
            .append("picUrl2", getPicUrl2())
            .append("picUrl3", getPicUrl3())
            .append("exposeStatus", getExposeStatus())
            .append("processReason", getProcessReason())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
