package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.residence.domain.ResidenceBrandPicture;
import com.ruoyi.residence.mapper.ResidenceBrandMapper;
import com.ruoyi.residence.domain.ResidenceBrand;
import com.ruoyi.residence.service.IResidenceBrandService;

/**
 * 房源品牌Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidenceBrandServiceImpl implements IResidenceBrandService 
{
    @Autowired
    private ResidenceBrandMapper residenceBrandMapper;

    /**
     * 查询房源品牌
     * 
     * @param id 房源品牌主键
     * @return 房源品牌
     */
    @Override
    public ResidenceBrand selectResidenceBrandById(Long id)
    {
        return residenceBrandMapper.selectResidenceBrandById(id);
    }

    /**
     * 查询房源品牌列表
     * 
     * @param residenceBrand 房源品牌
     * @return 房源品牌
     */
    @Override
    public List<ResidenceBrand> selectResidenceBrandList(ResidenceBrand residenceBrand)
    {
        return residenceBrandMapper.selectResidenceBrandList(residenceBrand);
    }

    /**
     * 新增房源品牌
     * 
     * @param residenceBrand 房源品牌
     * @return 结果
     */
    @Transactional
    @Override
    public int insertResidenceBrand(ResidenceBrand residenceBrand)
    {
        residenceBrand.setCreateTime(DateUtils.getNowDate());
        int rows = residenceBrandMapper.insertResidenceBrand(residenceBrand);
        insertResidenceBrandPicture(residenceBrand);
        return rows;
    }

    /**
     * 修改房源品牌
     * 
     * @param residenceBrand 房源品牌
     * @return 结果
     */
    @Transactional
    @Override
    public int updateResidenceBrand(ResidenceBrand residenceBrand)
    {
        residenceBrandMapper.deleteResidenceBrandPictureByResidenceBrandId(residenceBrand.getId());
        insertResidenceBrandPicture(residenceBrand);
        return residenceBrandMapper.updateResidenceBrand(residenceBrand);
    }

    /**
     * 批量删除房源品牌
     * 
     * @param ids 需要删除的房源品牌主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteResidenceBrandByIds(Long[] ids)
    {
        residenceBrandMapper.deleteResidenceBrandPictureByResidenceBrandIds(ids);
        return residenceBrandMapper.deleteResidenceBrandByIds(ids);
    }

    /**
     * 删除房源品牌信息
     * 
     * @param id 房源品牌主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteResidenceBrandById(Long id)
    {
        residenceBrandMapper.deleteResidenceBrandPictureByResidenceBrandId(id);
        return residenceBrandMapper.deleteResidenceBrandById(id);
    }

    /**
     * 新增房源品牌图片信息
     * 
     * @param residenceBrand 房源品牌对象
     */
    public void insertResidenceBrandPicture(ResidenceBrand residenceBrand)
    {
        List<ResidenceBrandPicture> residenceBrandPictureList = residenceBrand.getResidenceBrandPictureList();
        Long id = residenceBrand.getId();
        if (StringUtils.isNotNull(residenceBrandPictureList))
        {
            List<ResidenceBrandPicture> list = new ArrayList<ResidenceBrandPicture>();
            for (ResidenceBrandPicture residenceBrandPicture : residenceBrandPictureList)
            {
                residenceBrandPicture.setResidenceBrandId(id);
                list.add(residenceBrandPicture);
            }
            if (list.size() > 0)
            {
                residenceBrandMapper.batchResidenceBrandPicture(list);
            }
        }
    }
}
