package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.core.domain.model.BaseUser;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.data.annotation.Transient;

import java.util.List;

/**
 * @Author climber
 * @Date 2023/11/8 23:40
 * @Description TODO
 **/
public class SysAuthUser extends BaseUser {
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

    /** 角色对象 */
    private List<SysRole> roles;

    @Transient
    @ApiModelProperty(hidden = true)
    private String sessionKey;

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

    @Override
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

    public String getSessionKey() {
        return sessionKey;
    }

    public void setSessionKey(String sessionKey) {
        this.sessionKey = sessionKey;
    }

    @Override
    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }

    @Override
    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }


    @Override
    public String toString() {
        return "SysAuthUser{" +
                "authId=" + authId +
                ", uuid='" + uuid + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", nickName='" + nickName + '\'' +
                ", avatar='" + avatar + '\'' +
                ", email='" + email + '\'' +
                ", source='" + source + '\'' +
                //", sessionKey='" + sessionKey + '\'' +
                '}';
    }
}
