package com.ruoyi.residence.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.model.BaseUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.quartz.task.ResidenceIdPrefixTask;
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
        // 处理额外查询条件
        if(StringUtils.isNotEmpty(params)){
            // 首页根据价格区间查询
            long priceRangeId = Convert.toLong(params.get("priceRangeId"), 0L);
            if(0 < priceRangeId){
                // 根据传入的价格区间id查询对应的最小价格与最大价格的值
                ResidencePriceRange residencePriceRange = residencePriceRangeService.selectResidencePriceRangeById(priceRangeId);
                params.put("minPrice",residencePriceRange.getMinPrice());
                params.put("maxPrice",residencePriceRange.getMaxPrice());
            }
        }
        // 获取房源信息list
        List<ResidenceInfoVO> residenceInfos = residenceInfoMapper.selectResidenceInfoList(residenceInfo);
        return residenceInfos.stream().map(
            info -> {
                ResidenceInfoVO residenceInfoVO = new ResidenceInfoVO();
                BeanUtils.copyProperties(info,residenceInfoVO);
                residenceInfoVO.setDepositPay(ObjectUtil.defaultIfBlank(info.getDepositName(),"").concat(ObjectUtil.defaultIfBlank(info.getPayName(),"")));
                // 拼接户型名称
                residenceInfoVO.setHouseType(info.getNumOfBedrooms()+ "室" + info.getNumOfLivingrooms() + "厅");
                return residenceInfoVO;
            }
        ).collect(Collectors.toList());
    }

    /**
     * 生成唯一Id
     * @return 唯一ID 202312070901001
     */
    private String generateUniqueId(String roleName){

        DateTime dateNow = DateUtil.date();
        // 格式化日期部分
        String dateStr = DateUtil.format(dateNow, DatePattern.PURE_DATE_PATTERN);
        // Id前缀
        String prefix = "";
        // 根据权限名获取对应的房源Id前缀
        switch (roleName){
            // 管理员, 自营经纪人
            case Constants.ADMIN:
            case Constants.SELF:
                prefix = Constants.RESIDENCE_PREFIX_ZY;break;
            // 品牌经纪人
            case Constants.BRAND:
                prefix = Constants.RESIDENCE_PREFIX_PP;break;
            // 自由经纪人
            case Constants.FREE :
                prefix = Constants.RESIDENCE_PREFIX_FY;break;
            default: break;
        }
        // 房源Id前缀
        String residenceIdPrefix = CharSequenceUtil.format(CacheConstants.RESIDENCE_ID_KEY_TEMPLATE, prefix, dateStr);
        // 判断key是否存在
        Boolean hasKey = redisCache.hasKey(CacheConstants.RESIDENCE_ID_KEY + residenceIdPrefix);
        // 不存在则重新设置 redis key
        if(Boolean.FALSE.equals(hasKey)){
            SpringUtils.getBean(ResidenceIdPrefixTask.class).setRedisCacheId();
        }
        // 读取redis中的自增数并 + 1
        Long counter = redisCache.incrementCounter(CacheConstants.RESIDENCE_ID_KEY + residenceIdPrefix,1);

        return residenceIdPrefix + String.format("%04d",counter);

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
        // 获取权限列表
        List<SysRole> roleList = baseUser.getRoles();
        // 获取经纪人权限列表
        List<SysRole> brokerRoleList = CollUtil.filter(
                roleList,
                // 判断是否存在非租客的权限
                sysRole -> !sysRole.getRoleKey().equals(Constants.COMMON));
        if(brokerRoleList.isEmpty()){
            return -1;
        }
        // 获取权限名
        String userRole = brokerRoleList.get(0).getRoleKey();
        residenceInfo.setId(generateUniqueId(userRole));
        residenceInfo.setCreateBy(baseUser.getUserId().toString());
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
        if (StringUtils.isNotNull(residencePictureList))
        {
            // 房源Id
            String id = residenceInfo.getId();
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
