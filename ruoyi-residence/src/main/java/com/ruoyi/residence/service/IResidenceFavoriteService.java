package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceFavorite;

/**
 * 房源收藏Service接口
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
public interface IResidenceFavoriteService 
{
    /**
     * 查询房源收藏
     * 
     * @param id 房源收藏主键
     * @return 房源收藏
     */
    public ResidenceFavorite selectResidenceFavoriteById(Long id);

    /**
     * 查询房源收藏列表
     * 
     * @param residenceFavorite 房源收藏
     * @return 房源收藏集合
     */
    public List<ResidenceFavorite> selectResidenceFavoriteList(ResidenceFavorite residenceFavorite);

    /**
     * 新增房源收藏
     * 
     * @param residenceFavorite 房源收藏
     * @return 结果
     */
    public int insertResidenceFavorite(ResidenceFavorite residenceFavorite);

    /**
     * 修改房源收藏
     * 
     * @param residenceFavorite 房源收藏
     * @return 结果
     */
    public int updateResidenceFavorite(ResidenceFavorite residenceFavorite);

    /**
     * 批量删除房源收藏
     * 
     * @param ids 需要删除的房源收藏主键集合
     * @return 结果
     */
    public int deleteResidenceFavoriteByIds(Long[] ids);

    /**
     * 删除房源收藏信息
     * 
     * @param id 房源收藏主键
     * @return 结果
     */
    public int deleteResidenceFavoriteById(Long id);
}
