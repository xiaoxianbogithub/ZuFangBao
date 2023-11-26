package com.ruoyi.vip.controller;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.vip.config.HttpServletUtils;
import com.ruoyi.vip.config.WxPayAutoCertificateConfig;


import com.ruoyi.vip.config.WxPayConfig;
import com.ruoyi.vip.domain.VipParticulars;
import com.ruoyi.vip.domain.VipTradeOrder;
import com.ruoyi.vip.domain.VipUser;
import com.ruoyi.vip.service.IVipParticularsService;
import com.ruoyi.vip.service.IVipTradeOrderService;
import com.ruoyi.vip.service.IVipUserService;
import com.wechat.pay.java.core.exception.HttpException;
import com.wechat.pay.java.core.exception.MalformedMessageException;
import com.wechat.pay.java.core.exception.ServiceException;
import com.wechat.pay.java.core.notification.NotificationParser;
import com.wechat.pay.java.core.notification.RequestParam;
import com.wechat.pay.java.service.payments.jsapi.JsapiServiceExtension;

import com.wechat.pay.java.service.payments.jsapi.model.*;
import com.wechat.pay.java.service.payments.model.Transaction;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/vip/log")
public class vipPayController {
    private static final Logger log = LoggerFactory.getLogger(vipPayController.class);
    @Autowired
    WxPayAutoCertificateConfig wxPayAutoCertificateConfig;
    @Autowired
    WxPayConfig wxPayConfig;
    @Autowired
    private IVipParticularsService vipParticularsService;
    @Autowired
    private IVipTradeOrderService vipTradeOrderService;
    @Autowired
    private IVipUserService vipUserService;
    @Autowired
    private ISysUserService userService;


    @ApiOperation(value = "预支付订单", notes = "预支付订单")
    @PostMapping("/create")
    public R<PrepayWithRequestPaymentResponse> createOrder(@RequestBody VipParticulars req,@org.springframework.web.bind.annotation.RequestParam(value = "openId", required = true) String openId) {
        //创建初始化订单(编号)
        String bh= String.valueOf(Math.random()*10);
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddhhmmss");
        StringBuilder stringBuilder=new StringBuilder();

        String nows=ft.format(dNow);
        VipTradeOrder vipTradeOrder=new VipTradeOrder();
        stringBuilder.append(nows).append(bh).append(req.getId());
        vipTradeOrder.setTraNumber(stringBuilder.toString());
        vipTradeOrder.setDeleted(0);
        vipTradeOrder.setPayStatusV("2");
        VipParticulars vp=vipParticularsService.selectVipParticularsById(req.getId());
        vipTradeOrder.setPayMoneyV(vp.getVipMoney());
        vipTradeOrder.setVipName(vp.getVipName());
        vipTradeOrder.setCreateTime(dNow);
        Date dsafter=new Date();
        dsafter.setTime(dNow.getTime()+ TimeUnit.MINUTES.toMillis(10));
        vipTradeOrder.setExpireTime(dsafter);
        vipTradeOrder.setVipId(req.getId());
        //保存
        vipTradeOrderService.insertVipTradeOrder(vipTradeOrder);

        //请求微信支付相关配置
        JsapiServiceExtension service =
                new JsapiServiceExtension.Builder()
                        .config(wxPayAutoCertificateConfig.rsaAutoCertificateConfig())
                        .signType("RSA") // 不填默认为RSA
                        .build();
      PrepayWithRequestPaymentResponse response = new PrepayWithRequestPaymentResponse();
        try {
            PrepayRequest request = new PrepayRequest();
            request.setAppid(wxPayConfig.getAppId());
            request.setMchid(wxPayConfig.getMerchantId());
            request.setDescription(vp.getVipName());
            request.setOutTradeNo(stringBuilder.toString());
            request.setNotifyUrl(wxPayConfig.getPayNotifyUrl());
            Amount amount = new Amount();
            amount.setTotal(new BigDecimal(vp.getVipMoney()).intValue());
            request.setAmount(amount);
            Payer payer = new Payer();
           payer.setOpenid(openId);
            request.setPayer(payer);
            log.info("请求预支付下单，请求参数：{}", JSONObject.toJSONString(request));
            // 调用预下单接口
            response = service.prepayWithRequestPayment(request);
            log.info("订单【{}】发起预支付成功，返回信息：{}", stringBuilder.toString(), response);
        } catch (HttpException e) { // 发送HTTP请求失败
            log.error("微信下单发送HTTP请求失败，错误信息：{}", e.getHttpRequest());
            return R.fail("下单失败");
        } catch (ServiceException e) { // 服务返回状态小于200或大于等于300，例如500
            log.error("微信下单服务状态错误，错误信息：{}", e.getErrorMessage());
            return R.fail("下单失败");
        } catch (MalformedMessageException e) { // 服务返回成功，返回体类型不合法，或者解析返回体失败
            log.error("服务返回成功，返回体类型不合法，或者解析返回体失败，错误信息：{}", e.getMessage());
            return R.fail("下单失败");
        }

        //更新订单状态
        return R.ok(response);
    }





    @ApiOperation(value = "根据支付订单号查询订单", notes = "根据支付订单号查询订单")
    @PostMapping("/queryOrder")
    public R queryOrder(@Validated @RequestBody VipTradeOrder req) {
        QueryOrderByIdRequest queryRequest = new QueryOrderByIdRequest();
        queryRequest.setMchid(wxPayConfig.getMerchantId());
        if(req.getPayNumberV()==null){
            return R.fail("暂未支付");
        }
        queryRequest.setTransactionId(req.getPayNumberV());
        try {
            JsapiServiceExtension service =
                    new JsapiServiceExtension.Builder()
                            .config(wxPayAutoCertificateConfig.rsaAutoCertificateConfig())
                            .signType("RSA") // 不填默认为RSA
                            .build();
            Transaction result = service.queryOrderById(queryRequest);
            if (Transaction.TradeStateEnum.SUCCESS != result.getTradeState()) {
                log.info("内部订单号【{}】,微信支付订单号【{}】支付未成功", result.getOutTradeNo(), result.getTransactionId());
            }
        } catch (ServiceException e) {
            log.error("订单查询失败，返回码：{},返回信息：{}", e.getErrorCode(), e.getErrorMessage());
            return R.fail();
        }
        return R.ok();
    }


    @ApiOperation(value = "预支付-回调")
    @PostMapping("/payNotify")
    public synchronized String payNotify(HttpServletRequest request) throws IOException {
        log.info("------收到支付通知------");
        // 请求头Wechatpay-Signature
        String signature = request.getHeader("Wechatpay-Signature");
        // 请求头Wechatpay-nonce
        String nonce = request.getHeader("Wechatpay-Nonce");
        // 请求头Wechatpay-Timestamp
        String timestamp = request.getHeader("Wechatpay-Timestamp");
        // 微信支付证书序列号
        String serial = request.getHeader("Wechatpay-Serial");
        // 签名方式
        String signType = request.getHeader("Wechatpay-Signature-Type");

        // 构造 RequestParam
        RequestParam requestParam = new RequestParam.Builder()
                .serialNumber(serial)
                .nonce(nonce)
                .signature(signature)
                .timestamp(timestamp)
                .signType(signType)
                .body(HttpServletUtils.getRequestBody(request))
                .build();

        // 初始化 NotificationParser
        NotificationParser parser = new NotificationParser(wxPayAutoCertificateConfig.rsaAutoCertificateConfig());
        // 以支付通知回调为例，验签、解密并转换成 Transaction
        log.info("验签参数：{}", requestParam);
        Transaction transaction = parser.parse(requestParam, Transaction.class);
        log.info("验签成功！-支付回调结果：{}", transaction.toString());


        Map<String, String> returnMap = new HashMap<>(2);
        returnMap.put("code", "FAIL");
        returnMap.put("message", "失败");
        if (Transaction.TradeStateEnum.SUCCESS != transaction.getTradeState()) {
            log.info("内部订单号【{}】,微信支付订单号【{}】支付未成功", transaction.getOutTradeNo(), transaction.getTransactionId());
            return JSONObject.toJSONString(returnMap);
        }

        //修改订单前，建议主动请求微信查询订单是否支付成功，防止恶意post

        //修改订单信息
        VipTradeOrder vp=vipTradeOrderService.selectVipTradeOrderByTradNumber(transaction.getOutTradeNo());
        vp.setPayStatusV("1");
        vp.setPayNumberV(transaction.getTransactionId());
        vp.setPayMoneyV(transaction.getAmount().getTotal().toString()+":"+transaction.getTradeState());
        vp.setEndTime(new Date());
        vipTradeOrderService.updateVipTradeOrder(vp);
        SysUser userx =userService.selectUserById(vp.getUserId());
        VipParticulars vps=vipParticularsService.selectVipParticularsById(vp.getVipId());
        VipUser user =vipUserService.selectVipUserById(vp.getUserId());
        if(user==null){
            VipUser userOne=new VipUser();
            userOne.setDeleted(0);
            userOne.setIsVip("1");
            userOne.setUserId(vp.getUserId());
            userOne.setUserName(userx.getUserName());
            Date date=new Date();
            userOne.setVipCreatTime(date);
            if(vps.getVipTime().equals("月")){
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusMonths(1);
                Date addMouth = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                userOne.setVipEndTime(addMouth);
            } else if (vps.getVipTime().equals("季")) {
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusMonths(3);
                Date addG = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                userOne.setVipEndTime(addG);
            }else if (vps.getVipTime().equals("年")) {
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusYears(1);
                Date addYear = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                userOne.setVipEndTime(addYear);
            }
            vipUserService.insertVipUser(userOne);
        }else{
            VipUser vipUser=vipUserService.selectByUserId(vp.getUserId());
            Date date=new Date();
            if(vps.getVipTime().equals("月")){
                if(date.after(vipUser.getVipEndTime())){
                    date=date;
                }else{
                    date=vipUser.getVipEndTime();
                }
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusMonths(1);
                Date addMouth = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                vipUser.setVipEndTime(addMouth);
            } else if (vps.getVipTime().equals("季")) {
                if(date.after(vipUser.getVipEndTime())){
                    date=date;
                }else{
                    date=vipUser.getVipEndTime();
                }
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusMonths(3);
                Date addG = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                vipUser.setVipEndTime(addG);
            }else if (vps.getVipTime().equals("年")) {
                if(date.after(vipUser.getVipEndTime())){
                    date=date;
                }else{
                    date=vipUser.getVipEndTime();
                }
                LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                LocalDate addMouthTime = localDate.plusYears(1);
                Date addYear = Date.from(addMouthTime.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
                vipUser.setVipEndTime(addYear);
            }
            vipUserService.updateVipUser(vipUser);
        }

        returnMap.put("code", "SUCCESS");
        returnMap.put("message", "成功");
        return JSONObject.toJSONString(returnMap);
    }


}
