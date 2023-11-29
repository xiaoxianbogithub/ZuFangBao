package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceBroker;

/**
 * 房源经纪人Mapper接口
 * 
 * @author climber
 * @date 2023-11-29
 */
public interface ResidenceBrokerMapper 
{
    /**
     * 查询房源经纪人
     * 
     * @param id 房源经纪人主键
     * @return 房源经纪人
     */
    public ResidenceBroker selectResidenceBrokerById(Long id);

    /**
     * 查询房源经纪人列表
     * 
     * @param residenceBroker 房源经纪人
     * @return 房源经纪人集合
     */
    public List<ResidenceBroker> selectResidenceBrokerList(ResidenceBroker residenceBroker);

    /**
     * 新增房源经纪人
     * 
     * @param residenceBroker 房源经纪人
     * @return 结果
     */
    public int insertResidenceBroker(ResidenceBroker residenceBroker);

    /**
     * 修改房源经纪人
     * 
     * @param residenceBroker 房源经纪人
     * @return 结果
     */
    public int updateResidenceBroker(ResidenceBroker residenceBroker);

    /**
     * 删除房源经纪人
     * 
     * @param id 房源经纪人主键
     * @return 结果
     */
    public int deleteResidenceBrokerById(Long id);

    /**
     * 批量删除房源经纪人
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceBrokerByIds(Long[] ids);
}
