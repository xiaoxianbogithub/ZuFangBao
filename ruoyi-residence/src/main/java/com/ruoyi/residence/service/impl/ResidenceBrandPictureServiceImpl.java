package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceBrandPictureMapper;
import com.ruoyi.residence.domain.ResidenceBrandPicture;
import com.ruoyi.residence.service.IResidenceBrandPictureService;

/**
 * 房源品牌图片Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
 */
@Service
public class ResidenceBrandPictureServiceImpl implements IResidenceBrandPictureService 
{
    @Autowired
    private ResidenceBrandPictureMapper residenceBrandPictureMapper;

    /**
     * 查询房源品牌图片
     * 
     * @param id 房源品牌图片主键
     * @return 房源品牌图片
     */
    @Override
    public ResidenceBrandPicture selectResidenceBrandPictureById(Long id)
    {
        return residenceBrandPictureMapper.selectResidenceBrandPictureById(id);
    }

    /**
     * 查询房源品牌图片列表
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 房源品牌图片
     */
    @Override
    public List<ResidenceBrandPicture> selectResidenceBrandPictureList(ResidenceBrandPicture residenceBrandPicture)
    {
        return residenceBrandPictureMapper.selectResidenceBrandPictureList(residenceBrandPicture);
    }

    /**
     * 新增房源品牌图片
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 结果
     */
    @Override
    public int insertResidenceBrandPicture(ResidenceBrandPicture residenceBrandPicture)
    {
        return residenceBrandPictureMapper.insertResidenceBrandPicture(residenceBrandPicture);
    }

    /**
     * 修改房源品牌图片
     * 
     * @param residenceBrandPicture 房源品牌图片
     * @return 结果
     */
    @Override
    public int updateResidenceBrandPicture(ResidenceBrandPicture residenceBrandPicture)
    {
        return residenceBrandPictureMapper.updateResidenceBrandPicture(residenceBrandPicture);
    }

    /**
     * 批量删除房源品牌图片
     * 
     * @param ids 需要删除的房源品牌图片主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrandPictureByIds(Long[] ids)
    {
        return residenceBrandPictureMapper.deleteResidenceBrandPictureByIds(ids);
    }

    /**
     * 删除房源品牌图片信息
     * 
     * @param id 房源品牌图片主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrandPictureById(Long id)
    {
        return residenceBrandPictureMapper.deleteResidenceBrandPictureById(id);
    }
}
