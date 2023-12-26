package com.ruoyi.common.core.domain.model;

import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysRole;
import java.util.Collections;

import java.util.List;

/**
 * @Author climber
 * @Date 2023/11/12 17:20
 * @Description 用户基类
 **/
public class BaseUser extends BaseEntity {

    private static final long serialVersionUID = 3578023119392191530L;

    private String principal;

    private String credentials;

    public boolean isAdmin(){ return false; }

    public List<SysRole> getRoles(){return Collections.emptyList();}

    public Long getUserId(){ return -1L;}

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getCredentials() {
        return credentials;
    }

    public void setCredentials(String credentials) {
        this.credentials = credentials;
    }
}
