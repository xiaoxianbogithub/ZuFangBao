package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceHomePageCarousel;

/**
 * 首页轮播图设置Service接口
 * 
 * @author climber
 * @date 2023-11-03
 */
public interface IResidenceHomePageCarouselService 
{
    /**
     * 查询首页轮播图设置
     * 
     * @param id 首页轮播图设置主键
     * @return 首页轮播图设置
     */
    public ResidenceHomePageCarousel selectResidenceHomePageCarouselById(Long id);

    /**
     * 查询首页轮播图设置列表
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 首页轮播图设置集合
     */
    public List<ResidenceHomePageCarousel> selectResidenceHomePageCarouselList(ResidenceHomePageCarousel residenceHomePageCarousel);

    /**
     * 新增首页轮播图设置
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 结果
     */
    public int insertResidenceHomePageCarousel(ResidenceHomePageCarousel residenceHomePageCarousel);

    /**
     * 修改首页轮播图设置
     * 
     * @param residenceHomePageCarousel 首页轮播图设置
     * @return 结果
     */
    public int updateResidenceHomePageCarousel(ResidenceHomePageCarousel residenceHomePageCarousel);

    /**
     * 批量删除首页轮播图设置
     * 
     * @param ids 需要删除的首页轮播图设置主键集合
     * @return 结果
     */
    public int deleteResidenceHomePageCarouselByIds(Long[] ids);

    /**
     * 删除首页轮播图设置信息
     * 
     * @param id 首页轮播图设置主键
     * @return 结果
     */
    public int deleteResidenceHomePageCarouselById(Long id);
}
