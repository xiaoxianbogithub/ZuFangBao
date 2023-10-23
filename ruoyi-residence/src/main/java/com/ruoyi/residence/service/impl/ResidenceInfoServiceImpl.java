package com.ruoyi.residence.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.residence.domain.ResidencePicture;
import com.ruoyi.residence.mapper.ResidenceInfoMapper;
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.service.IResidenceInfoService;

/**
 * 房屋基本信息Service业务层处理
 * 
 * @author climber
 * @date 2023-10-18
 */
@Service
public class ResidenceInfoServiceImpl implements IResidenceInfoService 
{
    @Autowired
    private ResidenceInfoMapper residenceInfoMapper;

    /**
     * 查询房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 房屋基本信息
     */
    @Override
    public ResidenceInfo selectResidenceInfoById(Long id)
    {
        return residenceInfoMapper.selectResidenceInfoById(id);
    }

    /**
     * 查询房屋基本信息列表
     * 
     * @param residenceInfo 房屋基本信息
     * @return 房屋基本信息
     */
    @Override
    public List<ResidenceInfoVO> selectResidenceInfoList(ResidenceInfo residenceInfo)
    {
        List<ResidenceInfo> residenceInfos = residenceInfoMapper.selectResidenceInfoList(residenceInfo);
        List<ResidenceInfoVO> resultList = residenceInfos.stream().map(
            info -> {
                ResidenceInfoVO residenceInfoVO = new ResidenceInfoVO();
                BeanUtils.copyProperties(info,residenceInfoVO);
                return residenceInfoVO;
            }
        ).collect(Collectors.toList());
        return resultList;
    }

    /**
     * 新增房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    @Transactional
    @Override
    public int insertResidenceInfo(ResidenceInfo residenceInfo)
    {
        residenceInfo.setCreateTime(DateUtils.getNowDate());
        int rows = residenceInfoMapper.insertResidenceInfo(residenceInfo);
        insertResidencePicture(residenceInfo);
        return rows;
    }

    /**
     * 修改房屋基本信息
     * 
     * @param residenceInfo 房屋基本信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updateResidenceInfo(ResidenceInfo residenceInfo)
    {
        residenceInfo.setUpdateTime(DateUtils.getNowDate());
        residenceInfoMapper.deleteResidencePictureByResidenceId(residenceInfo.getId());
        insertResidencePicture(residenceInfo);
        return residenceInfoMapper.updateResidenceInfo(residenceInfo);
    }

    /**
     * 批量删除房屋基本信息
     * 
     * @param ids 需要删除的房屋基本信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteResidenceInfoByIds(Long[] ids)
    {
        residenceInfoMapper.deleteResidencePictureByResidenceIds(ids);
        return residenceInfoMapper.deleteResidenceInfoByIds(ids);
    }

    /**
     * 删除房屋基本信息信息
     * 
     * @param id 房屋基本信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteResidenceInfoById(Long id)
    {
        residenceInfoMapper.deleteResidencePictureByResidenceId(id);
        return residenceInfoMapper.deleteResidenceInfoById(id);
    }

    /**
     * 新增房源图片信息
     * 
     * @param residenceInfo 房屋基本信息对象
     */
    public void insertResidencePicture(ResidenceInfo residenceInfo)
    {
        List<ResidencePicture> residencePictureList = residenceInfo.getResidencePictureList();
        Long id = residenceInfo.getId();
        if (StringUtils.isNotNull(residencePictureList))
        {
            List<ResidencePicture> list = new ArrayList<ResidencePicture>();
            for (ResidencePicture residencePicture : residencePictureList)
            {
                residencePicture.setResidenceId(id);
                list.add(residencePicture);
            }
            if (list.size() > 0)
            {
                residenceInfoMapper.batchResidencePicture(list);
            }
        }
    }
}
