package com.ruoyi.residence.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidencePictureMapper;
import com.ruoyi.residence.domain.ResidencePicture;
import com.ruoyi.residence.service.IResidencePictureService;

/**
 * 房源图片Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidencePictureServiceImpl implements IResidencePictureService 
{
    @Autowired
    private ResidencePictureMapper residencePictureMapper;

    /**
     * 查询房源图片
     * 
     * @param id 房源图片主键
     * @return 房源图片
     */
    @Override
    public ResidencePicture selectResidencePictureById(Long id)
    {
        return residencePictureMapper.selectResidencePictureById(id);
    }

    /**
     * 查询房源图片列表
     * 
     * @param residencePicture 房源图片
     * @return 房源图片
     */
    @Override
    public List<ResidencePicture> selectResidencePictureList(ResidencePicture residencePicture)
    {
        return residencePictureMapper.selectResidencePictureList(residencePicture);
    }

    /**
     * 新增房源图片
     * 
     * @param residencePicture 房源图片
     * @return 结果
     */
    @Override
    public int insertResidencePicture(ResidencePicture residencePicture)
    {
        return residencePictureMapper.insertResidencePicture(residencePicture);
    }

    /**
     * 修改房源图片
     * 
     * @param residencePicture 房源图片
     * @return 结果
     */
    @Override
    public int updateResidencePicture(ResidencePicture residencePicture)
    {
        return residencePictureMapper.updateResidencePicture(residencePicture);
    }

    /**
     * 批量删除房源图片
     * 
     * @param ids 需要删除的房源图片主键
     * @return 结果
     */
    @Override
    public int deleteResidencePictureByIds(Long[] ids)
    {
        return residencePictureMapper.deleteResidencePictureByIds(ids);
    }

    /**
     * 删除房源图片信息
     * 
     * @param id 房源图片主键
     * @return 结果
     */
    @Override
    public int deleteResidencePictureById(Long id)
    {
        return residencePictureMapper.deleteResidencePictureById(id);
    }
}
