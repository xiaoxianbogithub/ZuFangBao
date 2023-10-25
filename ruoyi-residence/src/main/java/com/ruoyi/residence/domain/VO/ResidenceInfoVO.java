package com.ruoyi.residence.domain.VO;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.residence.domain.ResidencePicture;

import java.math.BigDecimal;
import java.util.List;

public class ResidenceInfoVO extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 房源分类id */
    @Excel(name = "房源分类id")
    private Long categoryId;

    @Excel(name = "房源分类")
    private String categoryName;

    /** 房源品牌id */
    @Excel(name = "房源品牌")
    private String brandName;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    @Excel(name = "押金设置id")
    private Long depositId;

    @Excel(name = "付款设置id")
    private Long payId;

    /** 付款设置id */
    @Excel(name = "压几付几")
    private String depositPay;

    /** 押金金额(押一付一:deposite_mount = price * 1) */
    private BigDecimal depositeAmount;

    /** 需付房租金额(押一付一:pay_mount = price * 1) */
    private BigDecimal payAmount;

    /** 总金额(押一付一:total_mount = price * 2) */
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

    @Excel(name = "户型名")
    private String houseTypeName;

    /** 面积 */
    @Excel(name = "面积")
    private BigDecimal square;

    /** 楼层 */
    @Excel(name = "楼层")
    private Long floor;

    /** 是否有电梯 */
    @Excel(name = "是否有电梯")
    private Long elevator;

    /** 装修 */
    @Excel(name = "装修")
    private String furnish;

    /** 房源简介 */
    @Excel(name = "房源简介")
    private String introduction;

    /** 房源位置id */
    @Excel(name = "房源位置id")
    private Long addressId;

    @Excel(name = "房号")
    private String roomNo;

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

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 是否删除 */
    private Long deleted;

    /** 权重 */
    private BigDecimal weights;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 房源图片信息 */
    private List<ResidencePicture> residencePictureList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getDepositId() {
        return depositId;
    }

    public void setDepositId(Long depositId) {
        this.depositId = depositId;
    }

    public Long getPayId() {
        return payId;
    }

    public void setPayId(Long payId) {
        this.payId = payId;
    }

    public String getDepositPay() {
        return depositPay;
    }

    public void setDepositPay(String depositPay) {
        this.depositPay = depositPay;
    }

    public BigDecimal getDepositeAmount() {
        return depositeAmount;
    }

    public void setDepositeAmount(BigDecimal depositeAmount) {
        this.depositeAmount = depositeAmount;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getWaterBill() {
        return waterBill;
    }

    public void setWaterBill(BigDecimal waterBill) {
        this.waterBill = waterBill;
    }

    public BigDecimal getElectricityBill() {
        return electricityBill;
    }

    public void setElectricityBill(BigDecimal electricityBill) {
        this.electricityBill = electricityBill;
    }

    public Long getHouseTypeId() {
        return houseTypeId;
    }

    public void setHouseTypeId(Long houseTypeId) {
        this.houseTypeId = houseTypeId;
    }

    public String getHouseTypeName() {
        return houseTypeName;
    }

    public void setHouseTypeName(String houseTypeName) {
        this.houseTypeName = houseTypeName;
    }

    public BigDecimal getSquare() {
        return square;
    }

    public void setSquare(BigDecimal square) {
        this.square = square;
    }

    public Long getFloor() {
        return floor;
    }

    public void setFloor(Long floor) {
        this.floor = floor;
    }

    public Long getElevator() {
        return elevator;
    }

    public void setElevator(Long elevator) {
        this.elevator = elevator;
    }

    public String getFurnish() {
        return furnish;
    }

    public void setFurnish(String furnish) {
        this.furnish = furnish;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public Long getFavoriteCount() {
        return favoriteCount;
    }

    public void setFavoriteCount(Long favoriteCount) {
        this.favoriteCount = favoriteCount;
    }

    public Long getBrowseCount() {
        return browseCount;
    }

    public void setBrowseCount(Long browseCount) {
        this.browseCount = browseCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getDeleted() {
        return deleted;
    }

    public void setDeleted(Long deleted) {
        this.deleted = deleted;
    }

    public BigDecimal getWeights() {
        return weights;
    }

    public void setWeights(BigDecimal weights) {
        this.weights = weights;
    }

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public List<ResidencePicture> getResidencePictureList() {
        return residencePictureList;
    }

    public void setResidencePictureList(List<ResidencePicture> residencePictureList) {
        this.residencePictureList = residencePictureList;
    }

    @Override
    public String toString() {
        return "ResidenceInfoVO{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", brandName='" + brandName + '\'' +
                ", price=" + price +
                ", depositId=" + depositId +
                ", payId=" + payId +
                ", depositPay='" + depositPay + '\'' +
                ", depositeAmount=" + depositeAmount +
                ", payAmount=" + payAmount +
                ", totalAmount=" + totalAmount +
                ", waterBill=" + waterBill +
                ", electricityBill=" + electricityBill +
                ", houseTypeId=" + houseTypeId +
                ", houseTypeName='" + houseTypeName + '\'' +
                ", square=" + square +
                ", floor=" + floor +
                ", elevator=" + elevator +
                ", furnish='" + furnish + '\'' +
                ", introduction='" + introduction + '\'' +
                ", addressId=" + addressId +
                ", roomNo='" + roomNo + '\'' +
                ", addressDetail='" + addressDetail + '\'' +
                ", facilities='" + facilities + '\'' +
                ", labels='" + labels + '\'' +
                ", favoriteCount=" + favoriteCount +
                ", browseCount=" + browseCount +
                ", status='" + status + '\'' +
                ", deleted=" + deleted +
                ", weights=" + weights +
                ", sort=" + sort +
                ", residencePictureList=" + residencePictureList +
                '}';
    }
}
