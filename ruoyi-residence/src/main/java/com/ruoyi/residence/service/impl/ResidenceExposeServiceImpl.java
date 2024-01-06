package com.ruoyi.residence.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.residence.domain.ResidenceExpose;
import com.ruoyi.residence.mapper.ResidenceExposeMapper;
import com.ruoyi.residence.service.IResidenceExposeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 房源举报Service业务层处理
 * 
 * @author climber
 * @date 2023-12-25
 */
@Service
public class ResidenceExposeServiceImpl implements IResidenceExposeService 
{
    @Autowired
    private ResidenceExposeMapper residenceExposeMapper;

    /**
     * 查询房源举报
     * 
     * @param id 房源举报主键
     * @return 房源举报
     */
    @Override
    public ResidenceExpose selectResidenceExposeById(Long id)
    {
        return residenceExposeMapper.selectResidenceExposeById(id);
    }

    /**
     * 查询房源举报列表
     * 
     * @param residenceExpose 房源举报
     * @return 房源举报
     */
    @Override
    public List<ResidenceExpose> selectResidenceExposeList(ResidenceExpose residenceExpose)
    {
        return residenceExposeMapper.selectResidenceExposeList(residenceExpose);
    }

    /**
     * 新增房源举报
     * 
     * @param residenceExpose 房源举报
     * @return 结果
     */
    @Override
    public int insertResidenceExpose(ResidenceExpose residenceExpose)
    {
        residenceExpose.setCreateTime(DateUtils.getNowDate());
        return residenceExposeMapper.insertResidenceExpose(residenceExpose);
    }

    /**
     * 修改房源举报
     * 
     * @param residenceExpose 房源举报
     * @return 结果
     */
    @Override
    public int updateResidenceExpose(ResidenceExpose residenceExpose)
    {
        residenceExpose.setUpdateTime(DateUtils.getNowDate());
        return residenceExposeMapper.updateResidenceExpose(residenceExpose);
    }

    /**
     * 批量删除房源举报
     * 
     * @param ids 需要删除的房源举报主键
     * @return 结果
     */
    @Override
    public int deleteResidenceExposeByIds(Long[] ids)
    {
        return residenceExposeMapper.deleteResidenceExposeByIds(ids);
    }

    /**
     * 删除房源举报信息
     * 
     * @param id 房源举报主键
     * @return 结果
     */
    @Override
    public int deleteResidenceExposeById(Long id)
    {
        return residenceExposeMapper.deleteResidenceExposeById(id);
    }
}
