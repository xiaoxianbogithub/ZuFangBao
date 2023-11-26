package com.ruoyi.vip.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.vip.domain.VipUser;
import org.springframework.stereotype.Service;
import com.ruoyi.vip.mapper.VipUserMapper;
import com.ruoyi.vip.service.IVipUserService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author climber
 * @date 2023-11-22
 */
@Service
public class VipUserServiceImpl extends ServiceImpl<VipUserMapper, VipUser>  implements IVipUserService
{

    private VipUserMapper vipUserMapper;



    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public VipUser selectVipUserById(Long id)
    {
        return vipUserMapper.selectVipUserById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipUser 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<VipUser> selectVipUserList(VipUser vipUser)
    {
        return vipUserMapper.selectVipUserList(vipUser);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipUser 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertVipUser(VipUser vipUser)
    {
        vipUser.setCreateTime(DateUtils.getNowDate());
        return vipUserMapper.insertVipUser(vipUser);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipUser 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateVipUser(VipUser vipUser)
    {
        vipUser.setUpdateTime(DateUtils.getNowDate());
        return vipUserMapper.updateVipUser(vipUser);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipUserByIds(Long[] ids)
    {
        return vipUserMapper.deleteVipUserByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipUserById(Long id)
    {
        return vipUserMapper.deleteVipUserById(id);
    }

    @Override
    public VipUser selectByUserId(Long userID) {
        return vipUserMapper.selectOne(Wrappers.<VipUser>lambdaQuery()
                .eq(VipUser::getUserId,userID));
    }
}
