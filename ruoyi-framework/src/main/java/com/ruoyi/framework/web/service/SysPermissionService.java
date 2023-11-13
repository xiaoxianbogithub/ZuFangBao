package com.ruoyi.framework.web.service;

import com.ruoyi.common.core.domain.entity.SysAuthUser;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.BaseUser;
import com.ruoyi.system.service.ISysMenuService;
import com.ruoyi.system.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 用户权限处理
 * 
 * @author ruoyi
 */
@Component
public class SysPermissionService
{
    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysMenuService menuService;

    /**
     * 获取角色数据权限
     * 
     * @param user 用户信息
     * @return 角色权限信息
     */
    public Set<String> getRolePermission(BaseUser user)
    {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin())
        {
            roles.add("admin");
            return roles;
        }
        // 后台用户
        if(user instanceof SysUser){
            SysUser sysUser = (SysUser)user;
            roles.addAll(roleService.selectRolePermissionByUserId(sysUser.getUserId()));
        }
        // 第三方用户
        else if (user instanceof SysAuthUser){
            SysAuthUser sysAuthUser = (SysAuthUser)user;
            roles.addAll(roleService.selectAuthRolePermissionByUuId(sysAuthUser.getUuid()));
        }
        return roles;
    }

    /**
     * 获取菜单数据权限
     * 
     * @param user 用户信息
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermission(BaseUser user)
    {
        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin())
        {
            perms.add("*:*:*");
            return perms;
        }

        List<SysRole> roles = user.getRoles();
        if (!CollectionUtils.isEmpty(roles))
        {
            // 多角色设置permissions属性，以便数据权限匹配权限
            for (SysRole role : roles)
            {
                Set<String> rolePerms = menuService.selectMenuPermsByRoleId(role.getRoleId());
                role.setPermissions(rolePerms);
                perms.addAll(rolePerms);
            }
            return perms;
        }

        // 后台用户
        if(user instanceof SysUser){
            SysUser sysUser = (SysUser)user;
            perms.addAll(menuService.selectMenuPermsByUserId(sysUser.getUserId()));
        }
        // 第三方用户
        else if (user instanceof SysAuthUser){
            SysAuthUser sysAuthUser = (SysAuthUser)user;
            perms.addAll(menuService.selectMenuPermsByUuId(sysAuthUser.getUuid()));
        }
        return perms;
    }
}
