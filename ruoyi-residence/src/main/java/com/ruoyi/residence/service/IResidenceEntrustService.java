package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceEntrust;

/**
 * 委托管理Service接口
 * 
 * @author climber
 * @date 2023-12-25
 */
public interface IResidenceEntrustService 
{
    /**
     * 查询委托管理
     * 
     * @param id 委托管理主键
     * @return 委托管理
     */
    public ResidenceEntrust selectResidenceEntrustById(Long id);

    /**
     * 查询委托管理列表
     * 
     * @param residenceEntrust 委托管理
     * @return 委托管理集合
     */
    public List<ResidenceEntrust> selectResidenceEntrustList(ResidenceEntrust residenceEntrust);

    /**
     * 新增委托管理
     * 
     * @param residenceEntrust 委托管理
     * @return 结果
     */
    public int insertResidenceEntrust(ResidenceEntrust residenceEntrust);

    /**
     * 修改委托管理
     * 
     * @param residenceEntrust 委托管理
     * @return 结果
     */
    public int updateResidenceEntrust(ResidenceEntrust residenceEntrust);

    /**
     * 批量删除委托管理
     * 
     * @param ids 需要删除的委托管理主键集合
     * @return 结果
     */
    public int deleteResidenceEntrustByIds(Long[] ids);

    /**
     * 删除委托管理信息
     * 
     * @param id 委托管理主键
     * @return 结果
     */
    public int deleteResidenceEntrustById(Long id);
}