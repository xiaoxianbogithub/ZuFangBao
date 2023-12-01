package com.ruoyi.residence.domain.VO;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.residence.domain.ResidenceFavorite;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 30/11/2023 18:06
 * @description
 */
public class ResidenceFavoriteVO extends ResidenceFavorite {
    private static final long serialVersionUID = 729568877065406335L;

    /**
     * 房源名称
     */
    @Excel(name = "房源名称")
    private String residenceName;

    public String getResidenceName() {
        return residenceName;
    }

    public void setResidenceName(String residenceName) {
        this.residenceName = residenceName;
    }

    @Override
    public String toString() {
        return "ResidenceFavoriteVO{" +
                "residenceName='" + residenceName + '\'' +
                '}';
    }
}
