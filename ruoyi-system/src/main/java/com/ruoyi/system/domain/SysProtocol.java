package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 声明与协议内容对象 sys_protocol
 * 
 * @author climber
 * @date 2023-12-04
 */
@ApiModel(description = "声明与协议内容对象")
public class SysProtocol implements Serializable
{

    private static final long serialVersionUID = 1625737986656854696L;
    /** Id */
    @ApiModelProperty(value = "Id")
    private String id;

    /** 中文名 */
    @ApiModelProperty(value = "中文名")
    @Excel(name = "中文名")
    private String cnName;

    /** 英文名 */
    @ApiModelProperty(value = "英文名")
    @Excel(name = "英文名")
    private String enName;

    /** 内容 */
    @ApiModelProperty(value = "内容")
    @Excel(name = "内容")
    private String content;

    @ApiModelProperty(value = "修改人Id")
    @Excel(name = "修改人Id")
    private String updateBy;

    @ApiModelProperty(value = "修改时间")
    @Excel(name = "修改时间")
    private Date updateTime;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setCnName(String cnName) 
    {
        this.cnName = cnName;
    }

    public String getCnName() 
    {
        return cnName;
    }
    public void setEnName(String enName) 
    {
        this.enName = enName;
    }

    public String getEnName() 
    {
        return enName;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("cnName", getCnName())
            .append("enName", getEnName())
            .append("content", getContent())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
