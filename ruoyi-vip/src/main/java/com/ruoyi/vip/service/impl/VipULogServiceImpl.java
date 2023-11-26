package com.ruoyi.vip.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.vip.domain.VipULog;
import org.springframework.stereotype.Service;
import com.ruoyi.vip.mapper.VipULogMapper;
import com.ruoyi.vip.service.IVipULogService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author climber
 * @date 2023-11-22
 */
@Service
public class VipULogServiceImpl extends ServiceImpl<VipULogMapper, VipULog> implements IVipULogService
{

    private VipULogMapper vipULogMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public VipULog selectVipULogById(Long id)
    {
        return vipULogMapper.selectVipULogById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipULog 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<VipULog> selectVipULogList(VipULog vipULog)
    {
        return vipULogMapper.selectVipULogList(vipULog);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipULog 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertVipULog(VipULog vipULog)
    {
        vipULog.setCreateTime(DateUtils.getNowDate());
        return vipULogMapper.insertVipULog(vipULog);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipULog 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateVipULog(VipULog vipULog)
    {
        return vipULogMapper.updateVipULog(vipULog);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipULogByIds(Long[] ids)
    {
        return vipULogMapper.deleteVipULogByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipULogById(Long id)
    {
        return vipULogMapper.deleteVipULogById(id);
    }
}
