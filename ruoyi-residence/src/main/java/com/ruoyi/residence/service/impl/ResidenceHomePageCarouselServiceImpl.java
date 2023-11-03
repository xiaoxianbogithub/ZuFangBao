package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceHomePageCarouselMapper;
import com.ruoyi.residence.domain.ResidenceHomePageCarousel;
import com.ruoyi.residence.service.IResidenceHomePageCarouselService;

/**
 * 首页轮播图设置Service业务层处理
 * 
 * @author climber
 * @date 2023-11-03
 */
@Service
public class ResidenceHomePageCarouselServiceImpl implements IResidenceHomePageCarouselService 
{
    @Autowired
    private ResidenceHomePageCarouselMapper residenceHomePageCarouselMapper;

    /**
     * 查询首页轮播图设置
     * 
     * @param id 首页轮播图设置主键
     * @return 首页轮播图设置
     */
    @Override
    public ResidenceHomePageCarousel selectResidenceHomePageCarouselById(Long id)
    {
        return residenceHomePageCarouselMapper.selectResidenceHomePageCarouselById(id);
    }

    /**
     * 查询首页轮播图设置列表
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 首页轮播图设置
     */
    @Override
    public List<ResidenceHomePageCarousel> selectResidenceHomePageCarouselList(ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        return residenceHomePageCarouselMapper.selectResidenceHomePageCarouselList(residenceHomePageCarousel);
    }

    /**
     * 新增首页轮播图设置
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 结果
     */
    @Override
    public int insertResidenceHomePageCarousel(ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        residenceHomePageCarousel.setCreateTime(DateUtils.getNowDate());
        return residenceHomePageCarouselMapper.insertResidenceHomePageCarousel(residenceHomePageCarousel);
    }

    /**
     * 修改首页轮播图设置
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 结果
     */
    @Override
    public int updateResidenceHomePageCarousel(ResidenceHomePageCarousel residenceHomePageCarousel)
    {
        residenceHomePageCarousel.setUpdateTime(DateUtils.getNowDate());
        return residenceHomePageCarouselMapper.updateResidenceHomePageCarousel(residenceHomePageCarousel);
    }

    /**
     * 批量删除首页轮播图设置
     * 
     * @param ids 需要删除的首页轮播图设置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceHomePageCarouselByIds(Long[] ids)
    {
        return residenceHomePageCarouselMapper.deleteResidenceHomePageCarouselByIds(ids);
    }

    /**
     * 删除首页轮播图设置信息
     * 
     * @param id 首页轮播图设置主键
     * @return 结果
     */
    @Override
    public int deleteResidenceHomePageCarouselById(Long id)
    {
        return residenceHomePageCarouselMapper.deleteResidenceHomePageCarouselById(id);
    }
}
