package com.ruoyi.vip.service;

import com.ruoyi.vip.domain.VipParticulars;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author climber
 * @date 2023-11-22
 */
public interface IVipParticularsService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public VipParticulars selectVipParticularsById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<VipParticulars> selectVipParticularsList(VipParticulars vipParticulars);

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 结果
     */
    public int insertVipParticulars(VipParticulars vipParticulars);

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 结果
     */
    public int updateVipParticulars(VipParticulars vipParticulars);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteVipParticularsByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipParticularsById(Long id);

}
