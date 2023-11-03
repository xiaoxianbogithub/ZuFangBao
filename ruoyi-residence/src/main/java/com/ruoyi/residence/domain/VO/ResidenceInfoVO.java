package com.ruoyi.residence.domain.VO;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.residence.domain.ResidenceInfo;

public class ResidenceInfoVO extends ResidenceInfo {

    private static final long serialVersionUID = 1L;

    @Excel(name = "房源分类")
    private String categoryName;

    /** 房源品牌id */
    @Excel(name = "房源品牌")
    private String brandName;

    private String depositName;

    private String payName;

    /** 付款设置id */
    @Excel(name = "压几付几")
    private String depositPay;

    @Excel(name = "户型名")
    private String houseTypeName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDepositPay() {
        return depositPay;
    }

    public void setDepositPay(String depositPay) {
        this.depositPay = depositPay;
    }

    public String getHouseTypeName() {
        return houseTypeName;
    }

    public void setHouseTypeName(String houseTypeName) {
        this.houseTypeName = houseTypeName;
    }

    public String getDepositName() {
        return depositName;
    }

    public void setDepositName(String depositName) {
        this.depositName = depositName;
    }

    public String getPayName() {
        return payName;
    }

    public void setPayName(String payName) {
        this.payName = payName;
    }

    @Override
    public String toString() {
        return StrUtil.sub(super.toString(),0,-1) +
                ", categoryName='" + categoryName + '\'' +
                ", brandName='" + brandName + '\'' +
                ", depositName='" + depositName + '\'' +
                ", payName='" + payName + '\'' +
                ", depositPay='" + depositPay + '\'' +
                ", houseTypeName='" + houseTypeName + '\'' +
                '}';
    }
}
