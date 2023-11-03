package com.ruoyi.common.enums;

/**
 * @Author :VeeoTech.xiao
 * @Date : 3/11/2023 16:15
 */
public enum UniversalEnum {

    /// 格式化数字,取整数部分
    INTEGER_FORMAT("###"),

    // 连接符-短横杠
    HYPHEN_SHORT_HORIZONTAL("-");

    private final String value;

    UniversalEnum(String val) {
        this.value = val;
    }

    public String getValue() {
        return value;
    }
}
