package com.ruoyi.residence.domain.VO;

import com.ruoyi.residence.domain.ResidenceEntrust;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 6/1/2024 17:28
 * @description
 */
public class ResidenceEntrustVO extends ResidenceEntrust {

    private static final long serialVersionUID = -1486088498354512586L;

    /**
     * 区域名
     */
    private String areaName;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }


}
