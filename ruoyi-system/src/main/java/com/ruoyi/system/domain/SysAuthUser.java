package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * @Author climber
 * @Date 2023/11/8 23:40
 * @Description TODO
 **/
public class SysAuthUser extends BaseEntity {
    private static final long serialVersionUID = -7690463575962633350L;

    /** 授权ID */
    private Long authId;

    /** 第三方平台用户唯一ID */
    private String uuid;

    /** 系统用户ID */
    private Long userId;

    /** 登录账号 */
    private String userName;

    /** 用户昵称 */
    private String nickName;

    /** 头像地址 */
    private String avatar;

    /** 用户邮箱 */
    private String email;

    /** 用户来源 */
    private String source;

    /**
     * 微信open_id
     */
    private String openId;

    /**
     * 微信union_id
     */
    private String unionId;

    public Long getAuthId() {
        return authId;
    }

    public void setAuthId(Long authId) {
        this.authId = authId;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getUnionId() {
        return unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }
}
