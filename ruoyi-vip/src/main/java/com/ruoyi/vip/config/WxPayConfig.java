package com.ruoyi.vip.config;


import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author yupf
 * @description 微信支付配置类
 * @date 2023/7/26 09:30
 */
@Component
//@ConfigurationProperties(prefix = "wx.pay")
public class WxPayConfig implements Serializable {

    private static final long serialVersionUID = -8857868424883705213L;
    //APPID
    private final String appId="wx4e7581640648099e";
    //mchid
    private  final String merchantId="1660194153";
    //商户API私钥
    private  final String privateKey="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoMAYHxIvVZ73x" +
            "dSgAuh0q5kMepakPKXHQTYWPbW+fQVv/jNWEeqxv8PAxKyXJVdUKIiFqEvsnqIo5" +
            "KWj5+hfwdTI/r1Nli/Kq1JMZIjE3VVWeRn8QRu6BrKdtCKE0GremEHH9uY7o9LRh" +
            "RZziiCJo5dtZN0/WzlMih4ttOoQFrKk7naoT9XgKYgqAQJzKA5kCgN6a0TUs9KuZ" +
            "OI95CilbFXAOW5vZs7z5qBmYRXYo0F0l0LOJRC4oPLHBzgst18k7qbAIEnaruy2a" +
            "F4VEgLFU1F+YZDlcIlJHrsAOpPvK7AaPVJArZcmBjmdVk5yPjEGEM+bfIgj9gMib" +
            "/ZdTwNkZAgMBAAECggEAKR6sqsOECKX3i4xAPoVCUlW/vUN1ZO6WE/6QE/QGoWIi" +
            "cwVkwqIXfLrkjrDk6SeiEXssvjlrzFNpj/Yu40chCTouEeH0utQPfXLBkBiK/eNQ" +
            "LoU/1aPx9iRXPtIoT4vksKY+qHDwnsYNP+b8J2pvN0RTb6mVTIhfTQbksMzosFYT" +
            "vWyQM5D0MHAkSv9ec7pu4uFbQKh4Du2rxsytLTpOham09tvR1EBYTH/njEMFR+jY" +
            "1BxKcDhl6QdHQtDOrGLq98f5RcxvstlQBQgmeo1c/XKJKZTOSxFR4ReUq6OYtQtM" +
            "32iK+tX+D97ZuusMSF07JtshCPx3Y8PCj9CmCf/L/QKBgQDfxPR5Pb9f8jSaVQ+v" +
            "MfBXoTFKJM8A8JLZWW2ooCsp3EWe3j3149vmHv2OTtScv1rO+rKjtDXSIbDhiem/" +
            "TibgyRx88CY60bZ3WyeiMPH+cIcUt7YtmVgPIVBNNtTAAAkDbJM9PVcNoKNmTfrv" +
            "5wPq1fwhrqTlWl+yktYT0RlrcwKBgQDAaZpSd2KYFIeJdUgzD4V3I0i9WJFAPocB" +
            "Ko1HWZcfEQOSnOQScXh6w9kFQL1/lxZqkoC+QuabRZaoOe+NaJKkT2tDdSMv1RTR" +
            "n/6scI/vtBMohnEs6k62dyxld3vOLgpE5uHxXjuVQ6hOaP70yb2ZCCHRzzZvURW0" +
            "iOMqkmTeQwKBgGF/hHHLKLZaZvcTtujD3o+f6UT/8r3bFHDlWTVOzF/J3P/Sn7ai" +
            "mG6U9C9sQ5EkgyGJ9AoF/ClZiqNKnvE+0QvCNMpvLIkWVOV+by9pGhed2g152kPV" +
            "+5tkDYQHLv2VRlgal7DoKCUE6A0sTvj2dCt/HwNh//D6xpWdCu/JfMTnAoGBAJwN" +
            "CbwYVz5AaCxzkjrXO8eENlpamnMgQx4PBMX5QzdO9TbTR6YtoSjv7fL0rrvsLaIB" +
            "b6jfWWhU5/tIAaEOTuA0CSqMthz1FA1vVX1FTXd69I7JesCSx4P042znmuF9NZbs" +
            "KhM3+dr1JGtzfFPLyplynvsqs1tUx+XDn3nHgUdBAoGBANC4jcSyRdQbXETp8PYK" +
            "/EsNvzHSU+gc2oyXZoTXUwvsR0XVweyidJ0uxU2CN74FXSp9leIr7ltVx8Lyl/JN" +
            "4Zc1gLOBextMMd37c1LgOpg817KG0tclvCxWY1BCwIzaLyIvktSvkyitfo8rBOXr" +
            "pDwZh1oWkCpfIUmaNmMsD+1r";
    //商户证书序列号
    private final String merchantSerialNumber="";
    //商户APIv3密钥
    private final String apiV3Key="chixinanjuXM20230504youxiangongS";
    //支付通知地址
    private final String payNotifyUrl="/dsd/sd";

    public String getAppId() {
        return appId;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public String getMerchantSerialNumber() {
        return merchantSerialNumber;
    }

    public String getApiV3Key() {
        return apiV3Key;
    }

    public String getPayNotifyUrl() {
        return payNotifyUrl;
    }
}