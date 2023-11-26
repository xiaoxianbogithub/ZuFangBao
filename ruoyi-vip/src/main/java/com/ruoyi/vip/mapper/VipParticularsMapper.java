package com.ruoyi.vip.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.vip.domain.VipParticulars;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author climber
 * @date 2023-11-22
 */
public interface VipParticularsMapper extends BaseMapper<VipParticulars>
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
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipParticularsById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVipParticularsByIds(Long[] ids);
}
