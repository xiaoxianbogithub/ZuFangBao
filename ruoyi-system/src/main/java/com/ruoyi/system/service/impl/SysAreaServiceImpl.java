package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.system.domain.vo.SysAreaVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAreaMapper;
import com.ruoyi.system.domain.SysArea;
import com.ruoyi.system.service.ISysAreaService;

/**
 * 省市区Service业务层处理
 * 
 * @author climber
 * @date 2023-10-24
 */
@Service
public class SysAreaServiceImpl implements ISysAreaService 
{
    @Autowired
    private SysAreaMapper sysAreaMapper;

    /**
     * 查询省市区
     * 
     * @param id 省市区主键
     * @return 省市区
     */
    @Override
    public SysArea selectSysAreaById(Long id)
    {
        return sysAreaMapper.selectSysAreaById(id);
    }

    /**
     * 查询省市区列表
     * 
     * @param sysArea 省市区
     * @return 省市区
     */
    @Override
    public List<SysArea> selectSysAreaList(SysArea sysArea)
    {
        return sysAreaMapper.selectSysAreaList(sysArea);
    }

    /**
     * 新增省市区
     * 
     * @param sysArea 省市区
     * @return 结果
     */
    @Override
    public int insertSysArea(SysArea sysArea)
    {
        return sysAreaMapper.insertSysArea(sysArea);
    }

    /**
     * 修改省市区
     * 
     * @param sysArea 省市区
     * @return 结果
     */
    @Override
    public int updateSysArea(SysArea sysArea)
    {
        return sysAreaMapper.updateSysArea(sysArea);
    }

    /**
     * 批量删除省市区
     * 
     * @param ids 需要删除的省市区主键
     * @return 结果
     */
    @Override
    public int deleteSysAreaByIds(Long[] ids)
    {
        return sysAreaMapper.deleteSysAreaByIds(ids);
    }

    /**
     * 删除省市区信息
     * 
     * @param id 省市区主键
     * @return 结果
     */
    @Override
    public int deleteSysAreaById(Long id)
    {
        return sysAreaMapper.deleteSysAreaById(id);
    }

    @Override
    public List<SysAreaVO> selectSysAreaListCombo(SysArea area) {
        return sysAreaMapper.selectSysAreaListCombo(area);
    }
}
