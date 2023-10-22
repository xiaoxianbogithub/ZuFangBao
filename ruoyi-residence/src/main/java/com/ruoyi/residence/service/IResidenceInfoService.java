package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;

/**
 * 房屋基本信息Service接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface IResidenceInfoService 
{
    /**
     * 查询房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 房屋基本信息
     */
    public ResidenceInfo selectResidenceInfoById(Long id);

    /**
     * 查询房屋基本信息列表
     * 
     * @param residenceInfo 房屋基本信息
     * @return 房屋基本信息集合
     */
    public List<ResidenceInfoVO> selectResidenceInfoList(ResidenceInfo residenceInfo);

    /**
     * 新增房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    public int insertResidenceInfo(ResidenceInfo residenceInfo);

    /**
     * 修改房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    public int updateResidenceInfo(ResidenceInfo residenceInfo);

    /**
     * 批量删除房屋基本信息
     * 
     * @param ids 需要删除的房屋基本信息主键集合
     * @return 结果
     */
    public int deleteResidenceInfoByIds(Long[] ids);

    /**
     * 删除房屋基本信息信息
     * 
     * @param id 房屋基本信息主键
     * @return 结果
     */
    public int deleteResidenceInfoById(Long id);
}
