package com.ruoyi.residence.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.util.List;

/**
 * 房屋基本信息对象 residence_info
 *
 * @author climber
 * @date 2023-10-18
 */
@ApiModel(description = "房源基本信息")
public class ResidenceInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private String id;

    /**
     * 房源名称
     */
    @Excel(name = "房源名称")
    @ApiModelProperty(value = "房源名称", required = true)
    private String name;

    /**
     * 房源分类id
     */
    @Excel(name = "房源分类id")
    @ApiModelProperty(value = "房源分类Id", required = true)
    private Long categoryId;

    /**
     * 房源品牌id
     */
    @Excel(name = "房源品牌id")
    @ApiModelProperty(value = "房源品牌id", required = true)
    private Long brandId;

    /**
     * 价格
     */
    @Excel(name = "价格")
    @ApiModelProperty(value = "价格", required = true)
    private BigDecimal price;

    /**
     * 押金设置id
     */
    @Excel(name = "押金设置id")
    @ApiModelProperty(value = "押金设置id", required = true)
    private Long depositId;

    /**
     * 付款设置id
     */
    @Excel(name = "付款设置id")
    @ApiModelProperty(value = "付款设置id", required = true)
    private Long payId;

    /**
     * 押金金额(押一付一:deposite_mount = price * 1)
     */
    @ApiModelProperty(hidden = true)
    private BigDecimal depositeAmount;

    /**
     * 需付房租金额(押一付一:pay_mount = price * 1)
     */
    @ApiModelProperty(hidden = true)
    private BigDecimal payAmount;

    /**
     * 总金额(押一付一:total_mount = price * 2)
     */
    @ApiModelProperty(hidden = true)
    private BigDecimal totalAmount;

    /**
     * 水费
     */
    @Excel(name = "水费")
    @ApiModelProperty(value = "水费", required = true)
    private BigDecimal waterBill;

    /**
     * 电费
     */
    @Excel(name = "电费")
    @ApiModelProperty(value = "电费", required = true)
    private BigDecimal electricityBill;

    /**
     * 户型设定id
     */
    @Excel(name = "卧室数量")
    @ApiModelProperty(value = "卧室数量", required = true)
    private Integer numOfBedrooms;

    @Excel(name = "客厅数量")
    @ApiModelProperty(value = "客厅数量", required = true)
    private Integer numOfLivingrooms;

    /**
     * 面积
     */
    @Excel(name = "面积")
    @ApiModelProperty(value = "面积", required = true)
    private BigDecimal square;

    /**
     * 楼层
     */
    @Excel(name = "楼层")
    @ApiModelProperty(value = "楼层", required = true)
    private Long floor;

    /**
     * 朝向
     */
    @Excel(name = "朝向")
    @ApiModelProperty(value = "朝向", required = true)
    private String towards;

    /**
     * 是否有电梯
     */
    @Excel(name = "是否有电梯")
    @ApiModelProperty(value = "是否有电梯(0:无电梯;1:有电梯)", required = true)
    private Byte elevator;

    /**
     * 装修
     */
    @Excel(name = "装修")
    @ApiModelProperty(value = "装修(0:简装;1:精装)", required = true)
    private String furnish;

    @Excel(name = "首页图片")
    @ApiModelProperty(value = "首页图片")
    private String homePageImage;

    /**
     * 房源简介
     */
    @Excel(name = "房源简介")
    @ApiModelProperty(value = "房源简介")
    private String introduction;

    /**
     * 房源位置id
     */
    @Excel(name = "房源位置id")
    @ApiModelProperty(value = "房源位置id", required = true)
    private Long addressId;

    @Excel(name = "房号")
    @ApiModelProperty(value = "房号", required = true)
    private String roomNo;

    /**
     * 详细地址
     */
    @Excel(name = "详细地址")
    @ApiModelProperty(value = "详细地址")
    private String addressDetail;

    @Excel(name = "经度")
    @ApiModelProperty(value = "经度")
    private String longitude;

    @Excel(name = "纬度")
    @ApiModelProperty(value = "纬度")
    private String latitude;

    /**
     * 房源配置JSON(属性数组，JSON 格式, e.g.[{propertId: , valueId: }, {propertId: , valueId: }])
     */
    @Excel(name = "房源配置")
    @ApiModelProperty(value = "房源配置(配置Id)")
    private String facilities;

    /**
     * 房源标签JSON
     */
    @Excel(name = "房源标签")
    @ApiModelProperty(value = "房源标签(标签Id)")
    private String labels;

    /**
     * 收藏量
     */
    @Excel(name = "收藏量")
    @ApiModelProperty(hidden = true)
    private Long favoriteCount;

    /**
     * 浏览量
     */
    @Excel(name = "浏览量")
    @ApiModelProperty(hidden = true)
    private Long browseCount;

    /**
     * 状态
     */
    @Excel(name = "状态")
    @ApiModelProperty(value = "状态(0草稿;1待审核;2上架;3下架)", required = true)
    private String status;

    /**
     * 是否删除
     */
    @ApiModelProperty(hidden = true)
    private Byte deleted;

    /**
     * 权重
     */
    @ApiModelProperty(hidden = true)
    private BigDecimal weights;

    /**
     * 排序
     */
    @Excel(name = "排序")
    @ApiModelProperty(value = "排序", required = true)
    private Long sort;

    /**
     * 房源图片信息
     */
    @ApiModelProperty(hidden = true)
    private List<ResidencePicture> residencePictureList;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setDepositId(Long depositId) {
        this.depositId = depositId;
    }

    public Long getDepositId() {
        return depositId;
    }

    public void setPayId(Long payId) {
        this.payId = payId;
    }

    public Long getPayId() {
        return payId;
    }

    public void setDepositeAmount(BigDecimal depositeAmount) {
        this.depositeAmount = depositeAmount;
    }

    public BigDecimal getDepositeAmount() {
        return depositeAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setWaterBill(BigDecimal waterBill) { this.waterBill = waterBill; }

    public BigDecimal getWaterBill() {
        return waterBill;
    }

    public void setElectricityBill(BigDecimal electricityBill) {
        this.electricityBill = electricityBill;
    }

    public BigDecimal getElectricityBill() {
        return electricityBill;
    }

    public void setNumOfBedrooms(Integer numOfBedrooms) {
        this.numOfBedrooms = numOfBedrooms;
    }

    public Integer getNumOfBedrooms() {
        return numOfBedrooms;
    }

    public Integer getNumOfLivingrooms() {
        return numOfLivingrooms;
    }

    public void setNumOfLivingrooms(Integer numOfLivingrooms) {
        this.numOfLivingrooms = numOfLivingrooms;
    }

    public void setSquare(BigDecimal square) {
        this.square = square;
    }

    public BigDecimal getSquare() {
        return square;
    }

    public void setFloor(Long floor) {
        this.floor = floor;
    }

    public Long getFloor() {
        return floor;
    }

    public void setElevator(Byte elevator) {
        this.elevator = elevator;
    }

    public Byte getElevator() {
        return elevator;
    }

    public void setFurnish(String furnish) {
        this.furnish = furnish;
    }

    public String getFurnish() {
        return furnish;
    }

    public String getHomePageImage() {
        return homePageImage;
    }

    public void setHomePageImage(String homePageImage) {
        this.homePageImage = homePageImage;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public String getAddressDetail() { return addressDetail; }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public String getLabels() {
        return labels;
    }

    public void setFavoriteCount(Long favoriteCount) {
        this.favoriteCount = favoriteCount;
    }

    public Long getFavoriteCount() {
        return favoriteCount;
    }

    public void setBrowseCount(Long browseCount) {
        this.browseCount = browseCount;
    }

    public Long getBrowseCount() {
        return browseCount;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setDeleted(Byte deleted) {
        this.deleted = deleted;
    }

    public Byte getDeleted() {
        return deleted;
    }

    public void setWeights(BigDecimal weights) {
        this.weights = weights;
    }

    public BigDecimal getWeights() {
        return weights;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    public Long getSort() {
        return sort;
    }

    public String getTowards() {
        return towards;
    }

    public void setTowards(String towards) {
        this.towards = towards;
    }

    public List<ResidencePicture> getResidencePictureList() {
        return residencePictureList;
    }

    public void setResidencePictureList(List<ResidencePicture> residencePictureList) {
        this.residencePictureList = residencePictureList;
    }


    @Override
    public String toString() {
        return "ResidenceInfo{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", categoryId=" + categoryId +
                ", brandId=" + brandId +
                ", price=" + price +
                ", depositId=" + depositId +
                ", payId=" + payId +
                ", depositeAmount=" + depositeAmount +
                ", payAmount=" + payAmount +
                ", totalAmount=" + totalAmount +
                ", waterBill=" + waterBill +
                ", electricityBill=" + electricityBill +
                ", numOfBedrooms=" + numOfBedrooms +
                ", numOfLivingrooms=" + numOfLivingrooms +
                ", square=" + square +
                ", floor=" + floor +
                ", towards='" + towards + '\'' +
                ", elevator=" + elevator +
                ", furnish='" + furnish + '\'' +
                ", homePageImage='" + homePageImage + '\'' +
                ", introduction='" + introduction + '\'' +
                ", addressId=" + addressId +
                ", roomNo='" + roomNo + '\'' +
                ", addressDetail='" + addressDetail + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
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
