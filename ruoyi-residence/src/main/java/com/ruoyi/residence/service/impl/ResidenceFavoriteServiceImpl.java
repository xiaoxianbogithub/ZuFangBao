package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceFavoriteMapper;
import com.ruoyi.residence.domain.ResidenceFavorite;
import com.ruoyi.residence.service.IResidenceFavoriteService;

/**
 * 房源收藏Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidenceFavoriteServiceImpl implements IResidenceFavoriteService 
{
    @Autowired
    private ResidenceFavoriteMapper residenceFavoriteMapper;

    /**
     * 查询房源收藏
     * 
     * @param id 房源收藏主键
     * @return 房源收藏
     */
    @Override
    public ResidenceFavorite selectResidenceFavoriteById(Long id)
    {
        return residenceFavoriteMapper.selectResidenceFavoriteById(id);
    }

    /**
     * 查询房源收藏列表
     * 
     * @param residenceFavorite 房源收藏
     * @return 房源收藏
     */
    @Override
    public List<ResidenceFavorite> selectResidenceFavoriteList(ResidenceFavorite residenceFavorite)
    {
        return residenceFavoriteMapper.selectResidenceFavoriteList(residenceFavorite);
    }

    /**
     * 新增房源收藏
     * 
     * @param residenceFavorite 房源收藏
     * @return 结果
     */
    @Override
    public int insertResidenceFavorite(ResidenceFavorite residenceFavorite)
    {
        residenceFavorite.setCreateTime(DateUtils.getNowDate());
        return residenceFavoriteMapper.insertResidenceFavorite(residenceFavorite);
    }

    /**
     * 修改房源收藏
     * 
     * @param residenceFavorite 房源收藏
     * @return 结果
     */
    @Override
    public int updateResidenceFavorite(ResidenceFavorite residenceFavorite)
    {
        return residenceFavoriteMapper.updateResidenceFavorite(residenceFavorite);
    }

    /**
     * 批量删除房源收藏
     * 
     * @param ids 需要删除的房源收藏主键
     * @return 结果
     */
    @Override
    public int deleteResidenceFavoriteByIds(Long[] ids)
    {
        return residenceFavoriteMapper.deleteResidenceFavoriteByIds(ids);
    }

    /**
     * 删除房源收藏信息
     * 
     * @param id 房源收藏主键
     * @return 结果
     */
    @Override
    public int deleteResidenceFavoriteById(Long id)
    {
        return residenceFavoriteMapper.deleteResidenceFavoriteById(id);
    }
}
