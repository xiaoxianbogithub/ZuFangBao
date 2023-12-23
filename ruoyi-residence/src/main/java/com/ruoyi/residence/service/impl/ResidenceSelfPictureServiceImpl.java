package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceSelfPictureMapper;
import com.ruoyi.residence.domain.ResidenceSelfPicture;
import com.ruoyi.residence.service.IResidenceSelfPictureService;

/**
 * 自营首页图片Service业务层处理
 * 
 * @author climber
 * @date 2023-12-23
 */
@Service
public class ResidenceSelfPictureServiceImpl implements IResidenceSelfPictureService 
{
    @Autowired
    private ResidenceSelfPictureMapper residenceSelfPictureMapper;

    /**
     * 查询自营首页图片
     * 
     * @param id 自营首页图片主键
     * @return 自营首页图片
     */
    @Override
    public ResidenceSelfPicture selectResidenceSelfPictureById(Long id)
    {
        return residenceSelfPictureMapper.selectResidenceSelfPictureById(id);
    }

    /**
     * 查询自营首页图片列表
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 自营首页图片
     */
    @Override
    public List<ResidenceSelfPicture> selectResidenceSelfPictureList(ResidenceSelfPicture residenceSelfPicture)
    {
        return residenceSelfPictureMapper.selectResidenceSelfPictureList(residenceSelfPicture);
    }

    /**
     * 新增自营首页图片
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 结果
     */
    @Override
    public int insertResidenceSelfPicture(ResidenceSelfPicture residenceSelfPicture)
    {
        residenceSelfPicture.setCreateTime(DateUtils.getNowDate());
        return residenceSelfPictureMapper.insertResidenceSelfPicture(residenceSelfPicture);
    }

    /**
     * 修改自营首页图片
     * 
     * @param residenceSelfPicture 自营首页图片
     * @return 结果
     */
    @Override
    public int updateResidenceSelfPicture(ResidenceSelfPicture residenceSelfPicture)
    {
        residenceSelfPicture.setUpdateTime(DateUtils.getNowDate());
        return residenceSelfPictureMapper.updateResidenceSelfPicture(residenceSelfPicture);
    }

    /**
     * 批量删除自营首页图片
     * 
     * @param ids 需要删除的自营首页图片主键
     * @return 结果
     */
    @Override
    public int deleteResidenceSelfPictureByIds(Long[] ids)
    {
        return residenceSelfPictureMapper.deleteResidenceSelfPictureByIds(ids);
    }

    /**
     * 删除自营首页图片信息
     * 
     * @param id 自营首页图片主键
     * @return 结果
     */
    @Override
    public int deleteResidenceSelfPictureById(Long id)
    {
        return residenceSelfPictureMapper.deleteResidenceSelfPictureById(id);
    }
}
