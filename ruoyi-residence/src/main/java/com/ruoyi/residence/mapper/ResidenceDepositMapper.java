package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceDeposit;

/**
 * 房源押金设置Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceDepositMapper 
{
    /**
     * 查询房源押金设置
     * 
     * @param id 房源押金设置主键
     * @return 房源押金设置
     */
    public ResidenceDeposit selectResidenceDepositById(Long id);

    /**
     * 查询房源押金设置列表
     * 
     * @param residenceDeposit 房源押金设置
     * @return 房源押金设置集合
     */
    public List<ResidenceDeposit> selectResidenceDepositList(ResidenceDeposit residenceDeposit);

    /**
     * 新增房源押金设置
     * 
     * @param residenceDeposit 房源押金设置
     * @return 结果
     */
    public int insertResidenceDeposit(ResidenceDeposit residenceDeposit);

    /**
     * 修改房源押金设置
     * 
     * @param residenceDeposit 房源押金设置
     * @return 结果
     */
    public int updateResidenceDeposit(ResidenceDeposit residenceDeposit);

    /**
     * 删除房源押金设置
     * 
     * @param id 房源押金设置主键
     * @return 结果
     */
    public int deleteResidenceDepositById(Long id);

    /**
     * 批量删除房源押金设置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceDepositByIds(Long[] ids);
}
