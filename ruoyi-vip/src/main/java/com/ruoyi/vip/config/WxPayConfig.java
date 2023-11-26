package com.ruoyi.vip.config;



import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author yupf
 * @description 微信支付配置类
 * @date 2023/7/26 09:30
 */
@Data
@Component
@ConfigurationProperties(prefix = "wx.pay")
public class WxPayConfig {

    //APPID
    private String appId;
    //mchid
    private String merchantId;
    //商户API私钥
    private String privateKey;
    //商户证书序列号
    private String merchantSerialNumber;
    //商户APIv3密钥
    private String apiV3Key;
    //支付通知地址
    private String payNotifyUrl;
}