package com.ruoyi.residence.mapper;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceBrandPicture;

/**
 * 房源品牌图片Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceBrandPictureMapper 
{
    /**
     * 查询房源品牌图片
     * 
     * @param id 房源品牌图片主键
     * @return 房源品牌图片
     */
    public ResidenceBrandPicture selectResidenceBrandPictureById(Long id);

    /**
     * 查询房源品牌图片列表
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 房源品牌图片集合
     */
    public List<ResidenceBrandPicture> selectResidenceBrandPictureList(ResidenceBrandPicture residenceBrandPicture);

    /**
     * 新增房源品牌图片
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 结果
     */
    public int insertResidenceBrandPicture(ResidenceBrandPicture residenceBrandPicture);

    /**
     * 修改房源品牌图片
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 结果
     */
    public int updateResidenceBrandPicture(ResidenceBrandPicture residenceBrandPicture);

    /**
     * 删除房源品牌图片
     * 
     * @param id 房源品牌图片主键
     * @return 结果
     */
    public int deleteResidenceBrandPictureById(Long id);

    /**
     * 批量删除房源品牌图片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceBrandPictureByIds(Long[] ids);
}
