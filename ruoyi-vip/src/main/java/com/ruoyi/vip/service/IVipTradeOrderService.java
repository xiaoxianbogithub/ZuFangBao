package com.ruoyi.vip.service;

import com.ruoyi.vip.domain.VipTradeOrder;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author climber
 * @date 2023-11-26
 */
public interface IVipTradeOrderService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public VipTradeOrder selectVipTradeOrderById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<VipTradeOrder> selectVipTradeOrderList(VipTradeOrder vipTradeOrder);

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 结果
     */
    public int insertVipTradeOrder(VipTradeOrder vipTradeOrder);

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 结果
     */
    public int updateVipTradeOrder(VipTradeOrder vipTradeOrder);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteVipTradeOrderByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipTradeOrderById(Long id);

    VipTradeOrder selectVipTradeOrderByTradNumber(String outTradeNo);

    List<VipTradeOrder> selectAll();
}
