package com.ruoyi.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 21/11/2023 10:54
 * @apiNote
 */
@Component
@ConfigurationProperties(prefix = "authentication")
public class AuthenticationConfig {

    private static String appKey;
    private static String appSecret;
    private static String appCode;

    /**
     *【阿里官方】身份证OCR文字识别
     */
    private static String cardNumberHost;

    /**
     * 【阿里官方】身份证OCR文字识别Path
     */
    private static String cardNumberPath;

    /**
     * 【公安直连】实名认证-实名认证接口-身份证实名认证接口-身份证认证-二要素实名认证-实名认证api-身份证实名认证【实名认证】
     */
    private static String checkOneHost;

    private static String checkOnePath;

    public static String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public static String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public static String getAppCode() {
        return appCode;
    }

    public void setAppCode(String appCode) {
        this.appCode = appCode;
    }

    public static String getCardNumberHost() {
        return cardNumberHost;
    }

    public void setCardNumberHost(String cardNumberHost) {
        this.cardNumberHost = cardNumberHost;
    }

    public static String getCardNumberPath() {
        return cardNumberPath;
    }

    public void setCardNumberPath(String cardNumberPath) {
        AuthenticationConfig.cardNumberPath = cardNumberPath;
    }

    public static String getCheckOneHost() {
        return checkOneHost;
    }

    public void setCheckOneHost(String checkOneHost) {
        this.checkOneHost = checkOneHost;
    }

    public static String getCheckOnePath() {
        return checkOnePath;
    }

    public void setCheckOnePath(String checkOnePath) {
        AuthenticationConfig.checkOnePath = checkOnePath;
    }
}
