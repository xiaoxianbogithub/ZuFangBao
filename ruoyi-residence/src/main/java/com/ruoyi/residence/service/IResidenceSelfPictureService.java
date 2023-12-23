package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceSelfPicture;

/**
 * 自营首页图片Service接口
 * 
 * @author climber
 * @date 2023-12-23
 */
public interface IResidenceSelfPictureService 
{
    /**
     * 查询自营首页图片
     * 
     * @param id 自营首页图片主键
     * @return 自营首页图片
     */
    public ResidenceSelfPicture selectResidenceSelfPictureById(Long id);

    /**
     * 查询自营首页图片列表
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 自营首页图片集合
     */
    public List<ResidenceSelfPicture> selectResidenceSelfPictureList(ResidenceSelfPicture residenceSelfPicture);

    /**
     * 新增自营首页图片
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 结果
     */
    public int insertResidenceSelfPicture(ResidenceSelfPicture residenceSelfPicture);

    /**
     * 修改自营首页图片
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 结果
     */
    public int updateResidenceSelfPicture(ResidenceSelfPicture residenceSelfPicture);

    /**
     * 批量删除自营首页图片
     * 
     * @param ids 需要删除的自营首页图片主键集合
     * @return 结果
     */
    public int deleteResidenceSelfPictureByIds(Long[] ids);

    /**
     * 删除自营首页图片信息
     * 
     * @param id 自营首页图片主键
     * @return 结果
     */
    public int deleteResidenceSelfPictureById(Long id);
}
