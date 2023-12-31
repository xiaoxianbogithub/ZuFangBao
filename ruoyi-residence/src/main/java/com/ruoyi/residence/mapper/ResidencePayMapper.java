package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidencePay;

/**
 * 房源付款设置Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidencePayMapper 
{
    /**
     * 查询房源付款设置
     * 
     * @param id 房源付款设置主键
     * @return 房源付款设置
     */
    public ResidencePay selectResidencePayById(Long id);

    /**
     * 查询房源付款设置列表
     * 
     * @param residencePay 房源付款设置
     * @return 房源付款设置集合
     */
    public List<ResidencePay> selectResidencePayList(ResidencePay residencePay);

    /**
     * 新增房源付款设置
     * 
     * @param residencePay 房源付款设置
     * @return 结果
     */
    public int insertResidencePay(ResidencePay residencePay);

    /**
     * 修改房源付款设置
     * 
     * @param residencePay 房源付款设置
     * @return 结果
     */
    public int updateResidencePay(ResidencePay residencePay);

    /**
     * 删除房源付款设置
     * 
     * @param id 房源付款设置主键
     * @return 结果
     */
    public int deleteResidencePayById(Long id);

    /**
     * 批量删除房源付款设置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidencePayByIds(Long[] ids);
}
