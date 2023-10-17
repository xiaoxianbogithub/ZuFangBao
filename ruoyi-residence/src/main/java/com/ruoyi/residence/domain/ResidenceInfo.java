package com.ruoyi.residence.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 房屋基本信息对象 residence_info
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
public class ResidenceInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 房源分类id */
    @Excel(name = "房源分类id")
    private Long categoryId;

    /** 房源品牌id */
    @Excel(name = "房源品牌id")
    private Long brandId;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 押金设置id */
    @Excel(name = "押金设置id")
    private Long depositId;

    /** 付款设置id */
    @Excel(name = "付款设置id")
    private Long payId;

    /** 押金金额(押一付一:deposite_mount = price * 1) */
    @Excel(name = "押金金额(押一付一:deposite_mount = price * 1)")
    private BigDecimal depositeAmount;

    /** 需付房租金额(押一付一:pay_mount = price * 1) */
    @Excel(name = "需付房租金额(押一付一:pay_mount = price * 1)")
    private BigDecimal payAmount;

    /** 总金额(押一付一:total_mount = price * 2) */
    @Excel(name = "总金额(押一付一:total_mount = price * 2)")
    private BigDecimal totalAmount;

    /** 水费 */
    @Excel(name = "水费")
    private BigDecimal waterBill;

    /** 电费 */
    @Excel(name = "电费")
    private BigDecimal electricityBill;

    /** 户型设定id */
    @Excel(name = "户型设定id")
    private Long houseTypeId;

    /** 面积 */
    @Excel(name = "面积")
    private BigDecimal square;

    /** 楼层 */
    @Excel(name = "楼层")
    private Long floor;

    /** 是否有电梯  (0:无电梯;1:有电梯) */
    @Excel(name = "是否有电梯  (0:无电梯;1:有电梯)")
    private Long elevator;

    /** 装修  (0:简装;1:精装) */
    @Excel(name = "装修  (0:简装;1:精装)")
    private String furnish;

    /** 房源简介 */
    @Excel(name = "房源简介")
    private String introduction;

    /** 房源位置id */
    @Excel(name = "房源位置id")
    private Long addressId;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String addressDetail;

    /** 房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }])  */
    @Excel(name = "房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }]) ")
    private String facilities;

    /** 房源标签JSON */
    @Excel(name = "房源标签JSON")
    private String labels;

    /** 收藏量 */
    @Excel(name = "收藏量")
    private Long favoriteCount;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private Long browseCount;

    /** 状态  (-2草稿;-1下架;1上架) */
    @Excel(name = "状态  (-2草稿;-1下架;1上架)")
    private String status;

    /** 是否删除 (0:未删除;1:已删除) */
    @Excel(name = "是否删除 (0:未删除;1:已删除)")
    private Long deleted;

    /** 权重 (后面评分可能会用到,用于排序) */
    @Excel(name = "权重 (后面评分可能会用到,用于排序)")
    private BigDecimal weights;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCategoryId(Long categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() 
    {
        return categoryId;
    }
    public void setBrandId(Long brandId) 
    {
        this.brandId = brandId;
    }

    public Long getBrandId() 
    {
        return brandId;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setDepositId(Long depositId) 
    {
        this.depositId = depositId;
    }

    public Long getDepositId() 
    {
        return depositId;
    }
    public void setPayId(Long payId) 
    {
        this.payId = payId;
    }

    public Long getPayId() 
    {
        return payId;
    }
    public void setDepositeAmount(BigDecimal depositeAmount) 
    {
        this.depositeAmount = depositeAmount;
    }

    public BigDecimal getDepositeAmount() 
    {
        return depositeAmount;
    }
    public void setPayAmount(BigDecimal payAmount) 
    {
        this.payAmount = payAmount;
    }

    public BigDecimal getPayAmount() 
    {
        return payAmount;
    }
    public void setTotalAmount(BigDecimal totalAmount) 
    {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalAmount() 
    {
        return totalAmount;
    }
    public void setWaterBill(BigDecimal waterBill) 
    {
        this.waterBill = waterBill;
    }

    public BigDecimal getWaterBill() 
    {
        return waterBill;
    }
    public void setElectricityBill(BigDecimal electricityBill) 
    {
        this.electricityBill = electricityBill;
    }

    public BigDecimal getElectricityBill() 
    {
        return electricityBill;
    }
    public void setHouseTypeId(Long houseTypeId) 
    {
        this.houseTypeId = houseTypeId;
    }

    public Long getHouseTypeId() 
    {
        return houseTypeId;
    }
    public void setSquare(BigDecimal square) 
    {
        this.square = square;
    }

    public BigDecimal getSquare() 
    {
        return square;
    }
    public void setFloor(Long floor) 
    {
        this.floor = floor;
    }

    public Long getFloor() 
    {
        return floor;
    }
    public void setElevator(Long elevator) 
    {
        this.elevator = elevator;
    }

    public Long getElevator() 
    {
        return elevator;
    }
    public void setFurnish(String furnish) 
    {
        this.furnish = furnish;
    }

    public String getFurnish() 
    {
        return furnish;
    }
    public void setIntroduction(String introduction) 
    {
        this.introduction = introduction;
    }

    public String getIntroduction() 
    {
        return introduction;
    }
    public void setAddressId(Long addressId) 
    {
        this.addressId = addressId;
    }

    public Long getAddressId() 
    {
        return addressId;
    }
    public void setAddressDetail(String addressDetail) 
    {
        this.addressDetail = addressDetail;
    }

    public String getAddressDetail() 
    {
        return addressDetail;
    }
    public void setFacilities(String facilities) 
    {
        this.facilities = facilities;
    }

    public String getFacilities() 
    {
        return facilities;
    }
    public void setLabels(String labels) 
    {
        this.labels = labels;
    }

    public String getLabels() 
    {
        return labels;
    }
    public void setFavoriteCount(Long favoriteCount) 
    {
        this.favoriteCount = favoriteCount;
    }

    public Long getFavoriteCount() 
    {
        return favoriteCount;
    }
    public void setBrowseCount(Long browseCount) 
    {
        this.browseCount = browseCount;
    }

    public Long getBrowseCount() 
    {
        return browseCount;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDeleted(Long deleted) 
    {
        this.deleted = deleted;
    }

    public Long getDeleted() 
    {
        return deleted;
    }
    public void setWeights(BigDecimal weights) 
    {
        this.weights = weights;
    }

    public BigDecimal getWeights() 
    {
        return weights;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("brandId", getBrandId())
            .append("price", getPrice())
            .append("depositId", getDepositId())
            .append("payId", getPayId())
            .append("depositeAmount", getDepositeAmount())
            .append("payAmount", getPayAmount())
            .append("totalAmount", getTotalAmount())
            .append("waterBill", getWaterBill())
            .append("electricityBill", getElectricityBill())
            .append("houseTypeId", getHouseTypeId())
            .append("square", getSquare())
            .append("floor", getFloor())
            .append("elevator", getElevator())
            .append("furnish", getFurnish())
            .append("introduction", getIntroduction())
            .append("addressId", getAddressId())
            .append("addressDetail", getAddressDetail())
            .append("facilities", getFacilities())
            .append("labels", getLabels())
            .append("favoriteCount", getFavoriteCount())
            .append("browseCount", getBrowseCount())
            .append("status", getStatus())
            .append("deleted", getDeleted())
            .append("weights", getWeights())
            .append("sort", getSort())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
