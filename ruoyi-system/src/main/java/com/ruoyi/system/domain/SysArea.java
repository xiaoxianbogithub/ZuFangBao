package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 省市区对象 sys_area
 * 
 * @author climber
 * @date 2023-10-24
 */
public class SysArea extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区划代码 */
    private Long id;

    /** 名称 */
    private String name;

    /** 父级区划代码 */
    private Long pid;

    /** 省/直辖市代码 */
    private Long provinceCode;

    /** 市代码 */
    private Long cityCode;

    /** 区/县代码 */
    private Long areaCode;

    /** 街道/镇代码 */
    private Long streetCode;

    /** 社区/乡村代码 */
    private Long committeeCode;

    /** 城乡分类代码 */
    private Long committeeType;

    /** 排序 */
    private Long sort;

    /** 级别: 1-省/直辖市, 2-市, 3-区/县/地级市, 4-街道/镇, 5-社区/乡村 */
    private Long level;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPid(Long pid) 
    {
        this.pid = pid;
    }

    public Long getPid() 
    {
        return pid;
    }
    public void setProvinceCode(Long provinceCode) 
    {
        this.provinceCode = provinceCode;
    }

    public Long getProvinceCode() 
    {
        return provinceCode;
    }
    public void setCityCode(Long cityCode) 
    {
        this.cityCode = cityCode;
    }

    public Long getCityCode() 
    {
        return cityCode;
    }
    public void setAreaCode(Long areaCode) 
    {
        this.areaCode = areaCode;
    }

    public Long getAreaCode() 
    {
        return areaCode;
    }
    public void setStreetCode(Long streetCode) 
    {
        this.streetCode = streetCode;
    }

    public Long getStreetCode() 
    {
        return streetCode;
    }
    public void setCommitteeCode(Long committeeCode) 
    {
        this.committeeCode = committeeCode;
    }

    public Long getCommitteeCode() 
    {
        return committeeCode;
    }
    public void setCommitteeType(Long committeeType) 
    {
        this.committeeType = committeeType;
    }

    public Long getCommitteeType() 
    {
        return committeeType;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }
    public void setLevel(Long level) 
    {
        this.level = level;
    }

    public Long getLevel() 
    {
        return level;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("pid", getPid())
            .append("provinceCode", getProvinceCode())
            .append("cityCode", getCityCode())
            .append("areaCode", getAreaCode())
            .append("streetCode", getStreetCode())
            .append("committeeCode", getCommitteeCode())
            .append("committeeType", getCommitteeType())
            .append("sort", getSort())
            .append("level", getLevel())
            .toString();
    }
}
