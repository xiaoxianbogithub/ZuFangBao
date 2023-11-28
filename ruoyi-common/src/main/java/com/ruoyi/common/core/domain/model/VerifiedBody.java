package com.ruoyi.common.core.domain.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 23/11/2023 17:52
 * @description
 */
@ApiModel(value ="VerifiedBody", description = "实名认证参数")
public class VerifiedBody implements Serializable {
    private static final long serialVersionUID = -5310653243327054130L;

    @ApiModelProperty(value = "用户Id",required = true)
    private Long userId;

    @ApiModelProperty(value = "人像面身份证图片地址",required = true)
    private String faceImg;

    @ApiModelProperty(value = "国徽面身份证图片地址",required = true)
    private String backImg;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getFaceImg() {
        return faceImg;
    }

    public void setFaceImg(String faceImg) {
        this.faceImg = faceImg;
    }

    public String getBackImg() {
        return backImg;
    }

    public void setBackImg(String backImg) {
        this.backImg = backImg;
    }
}
