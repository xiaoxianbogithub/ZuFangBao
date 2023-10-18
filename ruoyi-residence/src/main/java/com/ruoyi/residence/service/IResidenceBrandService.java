package com.ruoyi.residence.service;

import java.util.List;
import com.ruoyi.residence.domain.ResidenceBrand;

/**
 * 房源品牌Service接口
 * 
 * @author climber
 * @date 2023-10-18
 */
public interface IResidenceBrandService 
{
    /**
     * 查询房源品牌
     * 
     * @param id 房源品牌主键
     * @return 房源品牌
     */
    public ResidenceBrand selectResidenceBrandById(Long id);

    /**
     * 查询房源品牌列表
     * 
     * @param residenceBrand 房源品牌
     * @return 房源品牌集合
     */
    public List<ResidenceBrand> selectResidenceBrandList(ResidenceBrand residenceBrand);

    /**
     * 新增房源品牌
     * 
     * @param residenceBrand 房源品牌
     * @return 结果
     */
    public int insertResidenceBrand(ResidenceBrand residenceBrand);

    /**
     * 修改房源品牌
     * 
     * @param residenceBrand 房源品牌
     * @return 结果
     */
    public int updateResidenceBrand(ResidenceBrand residenceBrand);

    /**
     * 批量删除房源品牌
     * 
     * @param ids 需要删除的房源品牌主键集合
     * @return 结果
     */
    public int deleteResidenceBrandByIds(Long[] ids);

    /**
     * 删除房源品牌信息
     * 
     * @param id 房源品牌主键
     * @return 结果
     */
    public int deleteResidenceBrandById(Long id);
}
