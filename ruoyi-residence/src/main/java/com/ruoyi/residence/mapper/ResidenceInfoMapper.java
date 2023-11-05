package com.ruoyi.residence.mapper;

import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.domain.ResidencePicture;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 房屋基本信息Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceInfoMapper 
{
    /**
     * 查询房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 房屋基本信息
     */
    public ResidenceInfoVO selectResidenceInfoById(Long id);

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
     * 删除房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 结果
     */
    public int deleteResidenceInfoById(Long id);

    /**
     * 批量删除房屋基本信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceInfoByIds(Long[] ids);

    /**
     * 批量删除房源图片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidencePictureByResidenceIds(Long[] ids);
    
    /**
     * 批量新增房源图片
     * 
     * @param residencePictureList 房源图片列表
     * @return 结果
     */
    public int batchResidencePicture(List<ResidencePicture> residencePictureList);
    

    /**
     * 通过房屋基本信息主键删除房源图片信息
     * 
     * @param id 房屋基本信息ID
     * @return 结果
     */
    public int deleteResidencePictureByResidenceId(Long id);

    /**
     * 修改房源信息状态
     * @param residenceInfo 房屋基本信息对象
     * @return 结果
     */
    public int verifyInfoById(ResidenceInfo residenceInfo);

    /**
     * 批量修改房源信息状态
     * @param ids 房源进本信息Id集合
     * @param status 状态
     * @param updateBy 修改人Id
     * @param updateTime 修改时间
     * @return 结果
     */
    public int verifyInfoByIds(@Param("ids") List<Long> ids, @Param("status") Integer status, @Param("updateBy") Long updateBy, @Param("updateTime") Date updateTime);
}
