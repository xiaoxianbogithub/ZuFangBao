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

    public boolean isAdmin(){ return false; }

    public List<SysRole> getRoles(){return Collections.emptyList();}

    public Long getUserId(){ return -1L;}
}
