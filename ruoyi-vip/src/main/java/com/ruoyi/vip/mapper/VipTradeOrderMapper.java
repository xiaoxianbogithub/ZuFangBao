package com.ruoyi.vip.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.vip.domain.VipTradeOrder;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author climber
 * @date 2023-11-26
 */
public interface VipTradeOrderMapper extends BaseMapper<VipTradeOrder>
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
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipTradeOrderById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVipTradeOrderByIds(Long[] ids);
}
