package com.ruoyi.residence.mapper;

import com.ruoyi.residence.domain.ResidenceFavorite;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 房源收藏Mapper接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface ResidenceFavoriteMapper 
{
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
     * 删除房源收藏
     * 
     * @param id 房源收藏主键
     * @return 结果
     */
    public int deleteResidenceFavoriteById(Long id);

    /**
     * 批量删除房源收藏
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteResidenceFavoriteByIds(Long[] ids);

    int deleteResidenceFavoriteByResidenceIdAndUserId(@Param("residenceId") String residenceId, @Param("userId") String userId);
}
