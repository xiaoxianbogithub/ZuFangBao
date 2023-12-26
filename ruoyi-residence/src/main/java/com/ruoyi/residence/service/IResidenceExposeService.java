package com.ruoyi.residence.service;

import com.ruoyi.residence.domain.ResidenceExpose;

import java.util.List;

/**
 * 房源举报Service接口
 * 
 * @author climber
 * @date 2023-12-25
 */
public interface IResidenceExposeService 
{
    /**
     * 查询房源举报
     * 
     * @param id 房源举报主键
     * @return 房源举报
     */
    public ResidenceExpose selectResidenceExposeById(Long id);

    /**
     * 查询房源举报列表
     * 
     * @param residenceExpose 房源举报
     * @return 房源举报集合
     */
    public List<ResidenceExpose> selectResidenceExposeList(ResidenceExpose residenceExpose);

    /**
     * 新增房源举报
     * 
     * @param residenceExpose 房源举报
     * @return 结果
     */
    public int insertResidenceExpose(ResidenceExpose residenceExpose);

    /**
     * 修改房源举报
     * 
     * @param residenceExpose 房源举报
     * @return 结果
     */
    public int updateResidenceExpose(ResidenceExpose residenceExpose);

    /**
     * 批量删除房源举报
     * 
     * @param ids 需要删除的房源举报主键集合
     * @return 结果
     */
    public int deleteResidenceExposeByIds(Long[] ids);

    /**
     * 删除房源举报信息
     * 
     * @param id 房源举报主键
     * @return 结果
     */
    public int deleteResidenceExposeById(Long id);
}
