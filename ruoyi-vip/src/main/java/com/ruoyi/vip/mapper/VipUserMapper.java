package com.ruoyi.vip.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.vip.domain.VipUser;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author climber
 * @date 2023-11-22
 */
public interface VipUserMapper extends BaseMapper<VipUser>
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public VipUser selectVipUserById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipUser 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<VipUser> selectVipUserList(VipUser vipUser);

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipUser 【请填写功能名称】
     * @return 结果
     */
    public int insertVipUser(VipUser vipUser);

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipUser 【请填写功能名称】
     * @return 结果
     */
    public int updateVipUser(VipUser vipUser);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipUserById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVipUserByIds(Long[] ids);
}
