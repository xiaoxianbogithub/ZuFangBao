package com.ruoyi.common.utils;


public class NumberUtils {

    private static String[] units = {"", "十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千", "万亿"};
    private static char[] numArray = {'零', '一', '二', '三', '四', '五', '六', '七', '八', '九'};

    /**
     * int类型正整数转中文。
     */
    public static String numberToChinese(int num) {

        char[] val = String.valueOf(num).toCharArray();
        int len = val.length;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len; i++) {
            String m = val[i] + "";
            int n = Integer.parseInt(m);
            boolean isZero = n == 0;
            String unit = units[(len - 1) - i];
            if (isZero) {
                boolean falg = false;
                for (int j = i; j < len; j++) {
                    String a = val[j] + "";
                    int b = Integer.parseInt(a);
                    if (b != 0) {
                        falg = true;
                    }
                }
                if (falg) {
                    if ('0' != val[i - 1]) {
                        if (((len - 1) - i) % 4 == 0) {
                            sb.append(unit);
                        }
                        sb.append(numArray[n]);
                    }
                }
                else {
                    if (((len - 1) - i) % 4 == 0) {
                        sb.append(unit);
                        break;
                    }
                }
            }
            else {
                sb.append(numArray[n]);
                sb.append(unit);
            }
        }
        if (sb.lastIndexOf("一十") == 0) { //10-19,“一十”都改成“十”
            return sb.substring(1);
        }
        if ("".equals(sb.toString())){
            return "零";
        }
        return sb.toString();
    }
}
