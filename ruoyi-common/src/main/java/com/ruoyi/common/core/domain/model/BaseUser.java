package com.ruoyi.common.core.domain.model;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * @Author climber
 * @Date 2023/11/12 17:20
 * @Description TODO
 **/
public class BaseUser extends BaseEntity {
    private static final long serialVersionUID = 3578023119392191530L;
    public boolean isAdmin(){ return false; }
}
