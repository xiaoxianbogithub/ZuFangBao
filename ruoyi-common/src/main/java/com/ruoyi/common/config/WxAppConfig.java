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

    private String appId;
    private String secret;

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String appSecret) {
        this.secret = appSecret;
    }
}
