package com.ruoyi.common.domain;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * @Author climber
 * @Date 2023/11/7 21:39
 * @Description TODO
 **/
public class WechatLoginRequest implements Serializable {
    private static final long serialVersionUID = 7560038210342801817L;
    //临时登入凭证
    @ApiModelProperty(value = "微信code", required = true)
    private String code;

    //签名
    @ApiModelProperty(value = "签名")
    private String signature;

    //用户敏感信息，需要解密，（包含unionID）
    @ApiModelProperty(value = "用户敏感字段")
    private String encryptedData;

    //解密算法的向量
    @ApiModelProperty(value = "解密向量")
    private String iv;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getEncryptedData() {
        return encryptedData;
    }

    public void setEncryptedData(String encryptedData) {
        this.encryptedData = encryptedData;
    }

    public String getIv() {
        return iv;
    }

    public void setIv(String iv) {
        this.iv = iv;
    }
}
