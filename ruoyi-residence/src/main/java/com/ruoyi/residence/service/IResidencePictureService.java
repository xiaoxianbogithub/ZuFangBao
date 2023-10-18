package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidencePicture;

/**
 * 房源图片Service接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface IResidencePictureService 
{
    /**
     * 查询房源图片
     * 
     * @param id 房源图片主键
     * @return 房源图片
     */
    public ResidencePicture selectResidencePictureById(Long id);

    /**
     * 查询房源图片列表
     * 
     * @param residencePicture 房源图片
     * @return 房源图片集合
     */
    public List<ResidencePicture> selectResidencePictureList(ResidencePicture residencePicture);

    /**
     * 新增房源图片
     * 
     * @param residencePicture 房源图片
     * @return 结果
     */
    public int insertResidencePicture(ResidencePicture residencePicture);

    /**
     * 修改房源图片
     * 
     * @param residencePicture 房源图片
     * @return 结果
     */
    public int updateResidencePicture(ResidencePicture residencePicture);

    /**
     * 批量删除房源图片
     * 
     * @param ids 需要删除的房源图片主键集合
     * @return 结果
     */
    public int deleteResidencePictureByIds(Long[] ids);

    /**
     * 删除房源图片信息
     * 
     * @param id 房源图片主键
     * @return 结果
     */
    public int deleteResidencePictureById(Long id);
}
