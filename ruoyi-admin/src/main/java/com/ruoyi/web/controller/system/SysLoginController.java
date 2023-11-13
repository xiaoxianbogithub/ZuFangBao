package com.ruoyi.web.controller.system;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.config.WxAppConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysAuthUser;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.BaseUser;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.domain.WechatLoginRequest;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysMenuService;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@Api("登录模块")
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @ApiOperation("登录")
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @ApiOperation("获取用户信息")
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        BaseUser user = SecurityUtils.getLoginUser().getBaseUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @ApiOperation("获取路由信息")
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }


    @ApiOperation("微信登录")
    @PostMapping("/wxLogin")
    public AjaxResult wxLogin(@RequestBody WechatLoginRequest wechatLoginRequest, HttpServletRequest request)
    {
        //拼接发送请求的URL
        String jscode2sessionUrl = WxAppConfig.getJscode2sessionUrl()+"?appid="+WxAppConfig.getAppId()+"&secret="+WxAppConfig.getSecret()
                +"&js_code="+ wechatLoginRequest.getCode() +"&grant_type=authorization_code";
        //后端向微信后台送发请求 获取openid
        String httpResult = HttpUtils.sendGet(jscode2sessionUrl);
        if(StrUtil.isBlankIfStr(httpResult)){
            return AjaxResult.error(10002, "对不起，授权信息验证不通过，请联系管理员");
        }
        // 转换成Object
        JSONObject jsonObject= JSON.parseObject(httpResult);
        //获取object中openid字段的值;
        String openid = jsonObject.get("openid").toString();
        String sessionKey = jsonObject.get("session_key").toString();
        // 拼接source + openid 组成uuid
        String uuid = UserConstants.WE_CHAT + openid;
        // 根据uuid及来源平台查询第三方登录表信息
        SysAuthUser authUser = userService.selectAuthUserByUuid(uuid,UserConstants.WE_CHAT);
        // 查询初始密码
        String password = configService.selectConfigByKey("sys.user.initPassword");
        // 用户不存在时,新建用户
        if(null == authUser){
            SysUser user = new SysUser();
            String random = getStringRandom(6);
            String userName = "user"+random;
            user.setRoleIds(new Long[]{2L});
            user.setUserName(userName);
            user.setNickName(userName);
            user.setPassword(SecurityUtils.encryptPassword(password));
            userService.insertUser(user);

            authUser = new SysAuthUser();
            authUser.setUuid(uuid);
            authUser.setUserId(user.getUserId());
            authUser.setUserName(userName);
            authUser.setNickName(userName);
            authUser.setSource(UserConstants.WE_CHAT);
            userService.insertAuthUser(authUser);
        }
        authUser.setSessionKey(sessionKey);
        String token = loginService.wxLogin(authUser);
        return AjaxResult.success().put(Constants.TOKEN, token);
    }

    //生成随机用户名，数字和字母组成,
    public static String getStringRandom(int length) {
        StringBuilder val = new StringBuilder();
        Random random = new Random();
        //参数length，表明生成几位随机数
        for (int i = 0; i < length; i++) {
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //输出字母仍是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                //输出是大写字母仍是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val.append((char) (random.nextInt(26) + temp));
            } else {
                val.append(String.valueOf(random.nextInt(10)));
            }
        }
        return val.toString();
    }
}
