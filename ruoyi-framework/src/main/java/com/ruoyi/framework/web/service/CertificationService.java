package com.ruoyi.framework.web.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.VerifiedBody;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.stereotype.Component;

/**
 * ZuFangBao
 *
 * @author climber
 * @data 25/11/2023 13:57
 * @description
 */
@Component
public class CertificationService {

    /**
     * 实名认证
     * @param verifiedBody 参数
     */
    public void certification(VerifiedBody verifiedBody) {
        SysUser sysUser = new SysUser(verifiedBody.getUserId());
        sysUser.setCertification("1");
        // 修改实名状态为"审核中"
        SpringUtils.getBean(ISysUserService.class).updateUserCertification(sysUser);
        // 将实名接口请求提交到线程池异步处理
        AsyncManager.me().execute(AsyncFactory.certification(verifiedBody));
    }
}
