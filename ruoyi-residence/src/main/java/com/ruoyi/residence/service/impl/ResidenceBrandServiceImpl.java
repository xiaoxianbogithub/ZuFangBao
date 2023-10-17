package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.residence.mapper.ResidenceBrandMapper;
import com.ruoyi.residence.domain.ResidenceBrand;
import com.ruoyi.residence.service.IResidenceBrandService;

/**
 * 房源品牌Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-17
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
    @Override
    public int insertResidenceBrand(ResidenceBrand residenceBrand)
    {
        residenceBrand.setCreateTime(DateUtils.getNowDate());
        return residenceBrandMapper.insertResidenceBrand(residenceBrand);
    }

    /**
     * 修改房源品牌
     * 
     * @param residenceBrand 房源品牌
     * @return 结果
     */
    @Override
    public int updateResidenceBrand(ResidenceBrand residenceBrand)
    {
        return residenceBrandMapper.updateResidenceBrand(residenceBrand);
    }

    /**
     * 批量删除房源品牌
     * 
     * @param ids 需要删除的房源品牌主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrandByIds(Long[] ids)
    {
        return residenceBrandMapper.deleteResidenceBrandByIds(ids);
    }

    /**
     * 删除房源品牌信息
     * 
     * @param id 房源品牌主键
     * @return 结果
     */
    @Override
    public int deleteResidenceBrandById(Long id)
    {
        return residenceBrandMapper.deleteResidenceBrandById(id);
    }
}
