package com.ruoyi.common.utils.identityVerification;

import cn.hutool.core.map.MapUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.ruoyi.common.config.AuthenticationConfig;
import com.ruoyi.common.enums.HttpMethod;
import com.ruoyi.common.utils.http.HttpClientUtil;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 22/11/2023 10:27
 * @description 【阿里官方】OCR文字识别
 * https://market.aliyun.com/products/57002003/cmapi00035152.html?spm=5176.11251811.root.2.539830350bBPqE#sku=yuncode29152000029
 */

public class AliYunOcrUtil {

    private static final Logger log = LoggerFactory.getLogger(AliYunOcrUtil.class);
    private AliYunOcrUtil() {
        throw new IllegalStateException("Utility class");
    }

    /**
     * 身份证识别
     * @param imgPath       图片url
     * @param side          身份证正反面类型:face/back
     * @param qualityInfo   是否输出身份证质量分信息，默认为否（包括 是否是翻拍、是否是复印件、完整度评分、整体质量分数、篡改分数）
     * @return 返回JSONObject对象
     */
    public static JSONObject idCardOcr(String imgPath,String side, boolean qualityInfo){
        log.info("进入ALiYun OCR");
        //configure配置
        JSONObject configStr = JSONUtil.createObj()
                .set("side", side)
                .set("quality_info", qualityInfo);
        // 拼装请求body的json字符串
        String params = JSONUtil.createObj()
                .set("image",imgPath)
                .set("configure",configStr)
                .toString();
        log.info("OCR 请求参数 - {}", params);
        // 识别身份证人像面,并验证
        Map<String, String> headers = MapUtil.newHashMap();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73f0e3c139105
        headers.put("Authorization", "APPCODE " + AuthenticationConfig.getAppCode());
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/json; charset=UTF-8");

        Map<String, String> queries = new HashMap<>();
        try {
            HttpResponse response = HttpClientUtil.doPost(
                    AuthenticationConfig.getCardNumberHost(),
                    AuthenticationConfig.getCardNumberPath(),
                    HttpMethod.POST.name(),
                    headers,
                    queries,
                    params
            );
            return JSONUtil.parseObj(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            log.error("OCR 请求失败,异常信息: ", e);
        }
        return JSONUtil.createObj();
    }

    /**
     * 判断请求是否成功
     * @param jsonResult 请求结果
     * @return true 成功
     */
    public static boolean isOcrSuccessful(JSONObject jsonResult) {
        return !JSONUtil.isNull(jsonResult) && (boolean)jsonResult.get("success");
    }
}
