package com.ruoyi.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Author climber
 * @Date 2023/11/7 21:43
 * @Description TODO
 **/
@Component
@ConfigurationProperties(prefix = "wx")
public class WxAppConfig {

    /**
     * 小程序appId
     */
    private static String appId;

    /**
     * 小程序appSecret
     */
    private static String secret;

    /**
     * 登录凭证校验请求地址
     */
    private static String jscode2sessionUrl;

    public static String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public static String getSecret() {
        return secret;
    }

    public void setSecret(String appSecret) {
        this.secret = appSecret;
    }

    public static String getJscode2sessionUrl() {
        return jscode2sessionUrl;
    }

    public void setJscode2sessionUrl(String jscode2sessionUrl) {
        this.jscode2sessionUrl = jscode2sessionUrl;
    }
}
