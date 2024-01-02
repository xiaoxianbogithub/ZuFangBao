package com.ruoyi.residence.domain.VO;

import com.ruoyi.residence.domain.ResidencePicture;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 2/1/2024 14:45
 * @description 用于首页房源信息列表展示
 */
public class ResidenceInfoListVO implements Serializable {

    private static final long serialVersionUID = 918363087345804747L;

    /**
     * 房源Id
     */
    private String residenceId;

    /**
     * 房源名称
     */
    private String name;

    /**
     * 标签
     */
    private String labels;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 朝向
     */
    private String towards;

    /**
     * 坐标
     */
    private String geoCoordinate;

    /**
     * 浏览人数
     */
    private Long browseCount;

    /**
     * 状态
     */
    private String status;


    /**
     * 房源图片
     */
    private List<ResidencePicture> residencePictureList;

    public String getResidenceId() {
        return residenceId;
    }

    public void setResidenceId(String residenceId) {
        this.residenceId = residenceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getTowards() {
        return towards;
    }

    public void setTowards(String towards) {
        this.towards = towards;
    }

    public String getGeoCoordinate() {
        return geoCoordinate;
    }

    public void setGeoCoordinate(String geoCoordinate) {
        this.geoCoordinate = geoCoordinate;
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

    public List<ResidencePicture> getResidencePictureList() {
        return residencePictureList;
    }

    public void setResidencePictureList(List<ResidencePicture> residencePictureList) {
        this.residencePictureList = residencePictureList;
    }

    @Override
    public String toString() {
        return "ResidenceInfoListVO{" +
                "residenceId='" + residenceId + '\'' +
                ", name='" + name + '\'' +
                ", labels='" + labels + '\'' +
                ", price=" + price +
                ", towards='" + towards + '\'' +
                ", geoCoordinate='" + geoCoordinate + '\'' +
                ", browseCount=" + browseCount +
                ", status='" + status + '\'' +
                ", residencePictureList=" + residencePictureList +
                '}';
    }
}
