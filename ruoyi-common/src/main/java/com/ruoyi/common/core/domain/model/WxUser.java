package com.ruoyi.common.core.domain.model;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * @Author :VeeoTech.xiao
 * @Date : 11/11/2023 17:41
 */
public class WxUser extends BaseEntity {
    private static final long serialVersionUID = -2435693816124361454L;

    public WxUser(String openId, String sessionKey) {
        this.openId = openId;
        this.sessionKey = sessionKey;
    }

    private String openId;

    private String sessionKey;

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getSessionKey() {
        return sessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    @Override
    public String toString() {
        return "WxUser{" +
                "openId='" + openId + '\'' +
                ", sessionKey='" + sessionKey + '\'' +
                '}';
    }
}
