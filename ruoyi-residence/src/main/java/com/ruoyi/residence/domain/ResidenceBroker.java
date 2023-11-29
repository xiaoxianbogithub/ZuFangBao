package com.ruoyi.residence.domain;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房源经纪人对象 residence_broker
 * 
 * @author climber
 * @date 2023-11-29
 */
public class ResidenceBroker implements Serializable
{

    private static final long serialVersionUID = -6438090972144437254L;
    /** ID */
    private Long id;

    /** 用户Id */
    private Long userId;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String idNumber;

    /** 真实姓名 */
    @Excel(name = "真实姓名")
    private String realName;

    /** 身份证开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "身份证开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date idCardStartDate;

    /** 身份证到期日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "身份证到期日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date idCardEndDate;

    /** 经纪人头像 */
    @Excel(name = "经纪人头像")
    private String avatar;

    /** 经纪人姓名 */
    @Excel(name = "经纪人姓名")
    private String name;

    /** 经纪人电话 */
    @Excel(name = "经纪人电话")
    private String phone;
    
    @Excel(name = "修改时间")
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Date getIdCardStartDate() {
        return idCardStartDate;
    }

    public void setIdCardStartDate(Date idCardStartDate) {
        this.idCardStartDate = idCardStartDate;
    }

    public Date getIdCardEndDate() {
        return idCardEndDate;
    }

    public void setIdCardEndDate(Date idCardEndDate) {
        this.idCardEndDate = idCardEndDate;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "ResidenceBroker{" +
                "id=" + id +
                ", userId=" + userId +
                ", idNumber='" + idNumber + '\'' +
                ", realName='" + realName + '\'' +
                ", idCardStartDate=" + idCardStartDate +
                ", idCardEndDate=" + idCardEndDate +
                ", avatar='" + avatar + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", updateTime=" + updateTime +
                '}';
    }
}
