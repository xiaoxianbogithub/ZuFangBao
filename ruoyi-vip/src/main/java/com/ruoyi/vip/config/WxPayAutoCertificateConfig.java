package com.ruoyi.vip.config;
import com.wechat.pay.java.core.RSAAutoCertificateConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

        /**
         * @author yupf
         * @description 微信支付证书自动更新配置
         * @date 2023/7/26 14:37
         */

@Configuration
public class WxPayAutoCertificateConfig {

    @Resource
    private WxPayConfig wxPayConfig;

    /**
     * 初始化商户配置
     * @return
     */
//    @Bean
    public RSAAutoCertificateConfig rsaAutoCertificateConfig() {
        RSAAutoCertificateConfig config = new RSAAutoCertificateConfig.Builder()
                .merchantId(wxPayConfig.getMerchantId())
                .privateKey(wxPayConfig.getPrivateKey())
                .merchantSerialNumber(wxPayConfig.getMerchantSerialNumber())
                .apiV3Key(wxPayConfig.getApiV3Key())
                .build();
        return config;
    }
}