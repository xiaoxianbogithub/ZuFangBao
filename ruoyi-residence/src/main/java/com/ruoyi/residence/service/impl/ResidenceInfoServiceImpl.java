package com.ruoyi.residence.service.impl;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.model.BaseUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.residence.domain.ResidenceInfo;
import com.ruoyi.residence.domain.ResidencePicture;
import com.ruoyi.residence.domain.ResidencePriceRange;
import com.ruoyi.residence.domain.VO.ResidenceInfoVO;
import com.ruoyi.residence.mapper.ResidenceInfoMapper;
import com.ruoyi.residence.service.IResidenceInfoService;
import com.ruoyi.residence.service.IResidencePriceRangeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

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

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IResidencePriceRangeService residencePriceRangeService;

    private static final AtomicInteger counter = new AtomicInteger(0);

    /**
     * 查询房屋基本信息
     * 
     * @param id 房屋基本信息主键
     * @return 房屋基本信息
     */
    @Override
    public ResidenceInfoVO selectResidenceInfoById(String id)
    {
        ResidenceInfoVO residenceInfoVO = residenceInfoMapper.selectResidenceInfoById(id);
        residenceInfoVO.setDepositPay(residenceInfoVO.getDepositName().concat(residenceInfoVO
                .getPayName()));
        return residenceInfoVO;
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
        Map<String, Object> params = residenceInfo.getParams();
        if(StringUtils.isNotEmpty(params)){
            long priceRangeId = Long.parseLong(params.get("priceRangeId").toString());
            if(0 < priceRangeId){
                ResidencePriceRange residencePriceRange = residencePriceRangeService.selectResidencePriceRangeById(priceRangeId);
                params.put("minPrice",residencePriceRange.getMinPrice());
                params.put("maxPrice",residencePriceRange.getMaxPrice());
            }
        }
        List<ResidenceInfoVO> residenceInfos = residenceInfoMapper.selectResidenceInfoList(residenceInfo);
        return residenceInfos.stream().map(
            info -> {
                ResidenceInfoVO residenceInfoVO = new ResidenceInfoVO();
                BeanUtils.copyProperties(info,residenceInfoVO);
                residenceInfoVO.setDepositPay(ObjectUtil.defaultIfBlank(info.getDepositName(),"").concat(ObjectUtil.defaultIfBlank(info.getPayName(),"")));
                return residenceInfoVO;
            }
        ).collect(Collectors.toList());
    }

    /**
     * 生成唯一Id
     * @return 唯一ID 202312070901001
     */
    private String generateUniqueId(String prefix){
        DateTime dateNow = DateUtil.date();
        StringBuilder uniqueId = new StringBuilder(prefix).append("-");
        // 格式化日期部分
        String dateFormat = DateUtil.format(dateNow, DatePattern.PURE_DATE_PATTERN);
        uniqueId.append(dateFormat).append(Constants.HYPHEN_SHORT_HORIZONTAL);
        // 格式化时间部分
        String timeFormat = DateUtil.format(dateNow, DatePattern.PURE_TIME_PATTERN);
        uniqueId.append(timeFormat).append(Constants.HYPHEN_SHORT_HORIZONTAL);
        uniqueId.append(timeFormat).append("-");
        String maxId = residenceInfoMapper.selectCurrentMaxIdById(uniqueId.toString());
        if(StringUtils.isBlank(maxId)){
            counter.set(0);
        }
        // 获取并递增计数器
        int count = counter.getAndIncrement();
        // 格式化计数器部分
        uniqueId.append(String.format("%04d",count % 1000));
        return uniqueId.toString();

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
        BaseUser baseUser = SecurityUtils.getLoginUser().getBaseUser();
        Long userId = baseUser.getUserId();
        List<SysRole> roleList = baseUser.getRoles();

        residenceInfo.setId(generateUniqueId("");
        residenceInfo.setCreateBy(userId.toString());
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
        Long userId = SecurityUtils.getLoginUser().getBaseUser().getUserId();
        residenceInfo.setUpdateBy(userId.toString());
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
    public int deleteResidenceInfoByIds(String[] ids)
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
    public int deleteResidenceInfoById(String id)
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
        String id = residenceInfo.getId();
        if (StringUtils.isNotNull(residencePictureList))
        {
            List<ResidencePicture> list = new ArrayList<>();
            for (ResidencePicture residencePicture : residencePictureList)
            {
                residencePicture.setResidenceId(id);
                list.add(residencePicture);
            }
            if (!list.isEmpty())
            {
                residenceInfoMapper.batchResidencePicture(list);
            }
        }
    }

    @Override
    public int verifyInfo(ResidenceInfo residenceInfo) {
        Long userId = SecurityUtils.getLoginUser().getBaseUser().getUserId();
        residenceInfo.setUpdateBy(userId.toString());
        residenceInfo.setUpdateTime(DateUtils.getNowDate());
        return residenceInfoMapper.verifyInfoById(residenceInfo);
    }

    @Override
    public int updateStatus(ResidenceInfo residenceInfo) {
        Long userId = SecurityUtils.getLoginUser().getBaseUser().getUserId();
        residenceInfo.setUpdateTime(DateUtils.getNowDate());
        residenceInfo.setUpdateBy(userId.toString());
        return residenceInfoMapper.updateResidenceInfo(residenceInfo);
    }
}
