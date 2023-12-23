package com.ruoyi.residence.mapper;

import com.ruoyi.residence.domain.ResidenceSelfPicture;

import java.util.List;

/**
 * 自营首页图片Mapper接口
 * 
 * @author climber
 * @date 2023-12-23
 */
public interface ResidenceSelfPictureMapper 
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
     * 删除自营首页图片
     * 
     * @param id 自营首页图片主键
     * @return 结果
     */
    public int deleteResidenceSelfPictureById(Long id);

    /**
     * 批量删除自营首页图片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceSelfPictureByIds(Long[] ids);
}
