package com.ruoyi.vip.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.vip.domain.VipParticulars;
import org.springframework.stereotype.Service;
import com.ruoyi.vip.mapper.VipParticularsMapper;
import com.ruoyi.vip.service.IVipParticularsService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author climber
 * @date 2023-11-22
 */
@Service
public class VipParticularsServiceImpl extends ServiceImpl<VipParticularsMapper, VipParticulars>  implements IVipParticularsService
{




    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public VipParticulars selectVipParticularsById(Long id)
    {
        return this.baseMapper.selectVipParticularsById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<VipParticulars> selectVipParticularsList(VipParticulars vipParticulars)
    {
        return this.baseMapper.selectVipParticularsList(vipParticulars);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertVipParticulars(VipParticulars vipParticulars)
    {
        vipParticulars.setCreateTime(DateUtils.getNowDate());
        return this.baseMapper.insertVipParticulars(vipParticulars);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipParticulars 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateVipParticulars(VipParticulars vipParticulars)
    {
        vipParticulars.setUpdateTime(DateUtils.getNowDate());
        return this.baseMapper.updateVipParticulars(vipParticulars);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipParticularsByIds(Long[] ids)
    {
        return this.baseMapper.deleteVipParticularsByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteVipParticularsById(Long id)
    {
        return this.baseMapper.deleteVipParticularsById(id);
    }


}
