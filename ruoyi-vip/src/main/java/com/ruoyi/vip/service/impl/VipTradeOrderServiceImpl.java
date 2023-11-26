package com.ruoyi.vip.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.vip.domain.VipParticulars;
import com.ruoyi.vip.domain.VipTradeOrder;
import com.ruoyi.vip.mapper.VipParticularsMapper;
import org.springframework.stereotype.Service;
import com.ruoyi.vip.mapper.VipTradeOrderMapper;
import com.ruoyi.vip.service.IVipTradeOrderService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author climber
 * @date 2023-11-26
 */
@Service
public class VipTradeOrderServiceImpl extends ServiceImpl<VipParticularsMapper, VipParticulars> implements IVipTradeOrderService
{

    private VipTradeOrderMapper vipTradeOrderMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public VipTradeOrder selectVipTradeOrderById(Long id)
    {
        return vipTradeOrderMapper.selectVipTradeOrderById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<VipTradeOrder> selectVipTradeOrderList(VipTradeOrder vipTradeOrder)
    {
        return vipTradeOrderMapper.selectVipTradeOrderList(vipTradeOrder);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertVipTradeOrder(VipTradeOrder vipTradeOrder)
    {
        vipTradeOrder.setCreateTime(DateUtils.getNowDate());
        return vipTradeOrderMapper.insertVipTradeOrder(vipTradeOrder);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipTradeOrder 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateVipTradeOrder(VipTradeOrder vipTradeOrder)
    {
        vipTradeOrder.setUpdateTime(DateUtils.getNowDate());
        return vipTradeOrderMapper.updateVipTradeOrder(vipTradeOrder);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipTradeOrderByIds(Long[] ids)
    {
        return vipTradeOrderMapper.deleteVipTradeOrderByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipTradeOrderById(Long id)
    {
        return vipTradeOrderMapper.deleteVipTradeOrderById(id);
    }

    @Override
    public VipTradeOrder selectVipTradeOrderByTradNumber(String outTradeNo) {
        return this.vipTradeOrderMapper.selectOne(Wrappers.<VipTradeOrder>lambdaQuery()
                .eq(VipTradeOrder::getTraNumber,outTradeNo));
    }

    @Override
    public List<VipTradeOrder> selectAll() {
        return this.vipTradeOrderMapper.selectList(Wrappers.<VipTradeOrder>lambdaQuery()
                .eq(VipTradeOrder::getPayStatusV, "2").eq(VipTradeOrder::getDeleted, 0));
    }
}
