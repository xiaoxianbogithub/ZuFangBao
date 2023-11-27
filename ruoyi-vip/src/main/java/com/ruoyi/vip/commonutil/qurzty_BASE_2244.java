package com.ruoyi.vip.commonutil;


import com.ruoyi.vip.service.IVipTradeOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
@EnableScheduling
public class qurzty {

    private static final Logger log = LoggerFactory.getLogger(qurzty.class);
    @Autowired
    private IVipTradeOrderService vipTradeOrderService;
   //一分钟执行一次
    @Scheduled(cron ="0 0/1 * * * ?")
    public void startTask(){
        Date date=new Date();
        List<VipTradeOrder> vipTradeOrderList=vipTradeOrderService.selectAll();
        List<VipTradeOrder> vList=vipTradeOrderList.stream().filter(s->{
           return date.after(s.getExpireTime());
        }).collect(Collectors.toList());

        if(!vList.isEmpty()){
           vList.stream().forEach(s->{
               s.setPayStatusV("3");
               vipTradeOrderService.updateVipTradeOrder(s);
           });

        }
        log.info("检测未支付订单，设置支付值");

    }




}
