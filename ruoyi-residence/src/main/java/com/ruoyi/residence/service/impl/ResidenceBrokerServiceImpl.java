package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceBrokerMapper;
import com.ruoyi.residence.domain.ResidenceBroker;
import com.ruoyi.residence.service.IResidenceBrokerService;

/**
 * 房源经纪人Service业务层处理
 * 
 * @author climber
 * @date 2023-11-29
 */
@Service
public class ResidenceBrokerServiceImpl implements IResidenceBrokerService 
{
    @Autowired
    private ResidenceBrokerMapper residenceBrokerMapper;

    /**
     * 查询房源经纪人
     * 
     * @param id 房源经纪人主键
     * @return 房源经纪人
     */
    @Override
    public ResidenceBroker selectResidenceBrokerById(Long id)
    {
        return residenceBrokerMapper.selectResidenceBrokerById(id);
    }

    /**
     * 查询房源经纪人列表
     * 
     * @param residenceBroker 房源经纪人
     * @return 房源经纪人
     */
    @Override
    public List<ResidenceBroker> selectResidenceBrokerList(ResidenceBroker residenceBroker)
    {
        return residenceBrokerMapper.selectResidenceBrokerList(residenceBroker);
    }

    /**
     * 新增房源经纪人
     * 
     * @param residenceBroker 房源经纪人
     * @return 结果
     */
    @Override
    public int insertResidenceBroker(ResidenceBroker residenceBroker)
    {
        return residenceBrokerMapper.insertResidenceBroker(residenceBroker);
    }

    /**
     * 修改房源经纪人
     * 
     * @param residenceBroker 房源经纪人
     * @return 结果
     */
    @Override
    public int updateResidenceBroker(ResidenceBroker residenceBroker)
    {
        residenceBroker.setUpdateTime(DateUtils.getNowDate());
        return residenceBrokerMapper.updateResidenceBroker(residenceBroker);
    }

    /**
     * 批量删除房源经纪人
     * 
     * @param ids 需要删除的房源经纪人主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrokerByIds(Long[] ids)
    {
        return residenceBrokerMapper.deleteResidenceBrokerByIds(ids);
    }

    /**
     * 删除房源经纪人信息
     * 
     * @param id 房源经纪人主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrokerById(Long id)
    {
        return residenceBrokerMapper.deleteResidenceBrokerById(id);
    }
}
