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
 * @data 22/11/2023 10:22
 * @description 【公安直连】实名认证-实名认证接口-身份证实名认证接口-身份证认证-二要素实名认证-实名认证api-身份证实名认证【实名认证】
 * https://market.aliyun.com/products/57002003/cmapi00035152.html?spm=5176.11251811.root.2.539830350bBPqE#sku=yuncode29152000029
 */
public class VerifiedUtil {

    private static final Logger log = LoggerFactory.getLogger(VerifiedUtil.class);

    private VerifiedUtil() {
        throw new IllegalStateException("Utility class");
    }

    public static JSONObject verified(String name, String idcard){
        log.info("公安实名认证");
        Map<String, String> headers = MapUtil.newHashMap();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + AuthenticationConfig.getAppCode());
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

        Map<String, String> queries = new HashMap<>();
        Map<String, String> params = new HashMap<>();
        params.put("name", name);
        params.put("idcard", idcard);
        log.info("公安实名认证参数 - {}", params);
        try {
            HttpResponse response = HttpClientUtil.doPost(
                    // 获取Api地址
                    AuthenticationConfig.getCheckOneHost(),
                    // 获取Api路径
                    AuthenticationConfig.getCheckOnePath(),
                    // 请求方法(貌似没用上)
                    HttpMethod.POST.name(),
                    // 请求头
                    headers,
                    // 查询参数,拼接在Url后
                    queries,
                    // Api需要的参数
                    params
            );
            return JSONUtil.parseObj(EntityUtils.toString(response.getEntity()));
            //获取response的body
        } catch (Exception e) {
            log.error("公安实名认证错误信息: ", e);
        }
        return JSONUtil.createObj();
    }
}
