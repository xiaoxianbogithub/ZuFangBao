package com.ruoyi.vip.config;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author yupf
 * @date 2023/07/26 上午9:17
 **/
public class HttpServletUtils {

    /**
     * 获取请求体
     *
     * @param request
     * @return
     * @throws IOException
     */
    public static String getRequestBody(HttpServletRequest request) throws IOException {
        ServletInputStream stream = null;
        BufferedReader reader = null;
        StringBuffer sb = new StringBuffer();
        try {
            stream = request.getInputStream();
            // 获取响应
            reader = new BufferedReader(new InputStreamReader(stream));
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            throw new IOException("读取返回支付接口数据流出现异常！");
        } finally {
            reader.close();
        }
        return sb.toString();
    }

}