package com.ruoyi.vip.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.vip.domain.VipULog;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author climber
 * @date 2023-11-22
 */
public interface VipULogMapper extends BaseMapper<VipULog>
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public VipULog selectVipULogById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param vipULog 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<VipULog> selectVipULogList(VipULog vipULog);

    /**
     * 新增【请填写功能名称】
     * 
     * @param vipULog 【请填写功能名称】
     * @return 结果
     */
    public int insertVipULog(VipULog vipULog);

    /**
     * 修改【请填写功能名称】
     * 
     * @param vipULog 【请填写功能名称】
     * @return 结果
     */
    public int updateVipULog(VipULog vipULog);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteVipULogById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVipULogByIds(Long[] ids);
}
