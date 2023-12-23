package com.ruoyi.quartz.task;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.CharSequenceUtil;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.redis.RedisCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * ZuFangBao
 * 设置redis中的
 *
 * @author climber
 * @data 19/12/2023 18:05
 * @description
 */
@Component("residenceIdTask")
public class ResidenceIdPrefixTask {

    private static final Logger log = LoggerFactory.getLogger(ResidenceIdPrefixTask.class);
    @Resource
    private RedisCache redisCache;

    public void setRedisCacheId() {
        log.info( "{}生成经纪人房源Id前缀", DateUtil.date());
        // 设置前先删除数据
        redisCache.deleteObject(
                // 获取以CacheConstants.RESIDENCE_ID_KEY开头的所有键
                redisCache.keys(CacheConstants.RESIDENCE_ID_KEY + "*")
        );
        DateTime dateNow = DateUtil.date();
        String dateStr = DateUtil.format(dateNow, DatePattern.PURE_DATE_PATTERN);
        // 设置自营经纪人房源Id redis key, 值为 0, 有效期为 24h
        redisCache.setIfAbsentCacheObject(CacheConstants.RESIDENCE_ID_KEY + CharSequenceUtil.format(CacheConstants.RESIDENCE_ID_KEY_TEMPLATE, Constants.RESIDENCE_PREFIX_ZY, dateStr), 0, 24, TimeUnit.HOURS);
        // 设置品牌经纪人房源Id redis key, 值为 0, 有效期为 24h
        redisCache.setIfAbsentCacheObject(CacheConstants.RESIDENCE_ID_KEY + CharSequenceUtil.format(CacheConstants.RESIDENCE_ID_KEY_TEMPLATE, Constants.RESIDENCE_PREFIX_PP, dateStr), 0, 24, TimeUnit.HOURS);
        // 设置自由经纪人房源Id redis key, 值为 0, 有效期为 24h
        redisCache.setIfAbsentCacheObject(CacheConstants.RESIDENCE_ID_KEY + CharSequenceUtil.format(CacheConstants.RESIDENCE_ID_KEY_TEMPLATE, Constants.RESIDENCE_PREFIX_FY, dateStr), 0, 24, TimeUnit.HOURS);
        // log 记录
        String logTime = DateUtil.format(dateNow, DatePattern.NORM_DATETIME_PATTERN);
        log.info( "{}生成经纪人房源Id前缀: {}", logTime, redisCache.keys(CacheConstants.RESIDENCE_ID_KEY + "*"));
    }
}
