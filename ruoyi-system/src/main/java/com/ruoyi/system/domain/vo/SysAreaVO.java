package com.ruoyi.system.domain.vo;

import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serializable;

/**
 * @Author xl
 * @Date 2023/10/24 0:53
 * @Description TODO
 **/
public class SysAreaVO implements Serializable{

    private static final long serialVersionUID = -5237149148691490229L;
    /** 区划代码 */
    private Long id;

    /** 名称 */
    private String name;

    /** 父级区划代码 */
    private Long pid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "SysAreaVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pid=" + pid +
                '}';
    }
}
