package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.SysProtocol;
import com.ruoyi.system.mapper.SysProtocolMapper;
import com.ruoyi.system.service.ISysProtocolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 声明与协议内容Service业务层处理
 * 
 * @author climber
 * @date 2023-12-04
 */
@Service
public class SysProtocolServiceImpl implements ISysProtocolService 
{
    @Autowired
    private SysProtocolMapper sysProtocolMapper;

    /**
     * 查询声明与协议内容
     * 
     * @param id 声明与协议内容主键
     * @return 声明与协议内容
     */
    @Override
    public SysProtocol selectSysProtocolById(String id)
    {
        return sysProtocolMapper.selectSysProtocolById(id);
    }

    /**
     * 查询声明与协议内容列表
     * 
     * @param sysProtocol 声明与协议内容
     * @return 声明与协议内容
     */
    @Override
    public List<SysProtocol> selectSysProtocolList(SysProtocol sysProtocol)
    {
        return sysProtocolMapper.selectSysProtocolList(sysProtocol);
    }

    /**
     * 新增声明与协议内容
     * 
     * @param sysProtocol 声明与协议内容
     * @return 结果
     */
    @Override
    public int insertSysProtocol(SysProtocol sysProtocol)
    {
        return sysProtocolMapper.insertSysProtocol(sysProtocol);
    }

    /**
     * 修改声明与协议内容
     * 
     * @param sysProtocol 声明与协议内容
     * @return 结果
     */
    @Override
    public int updateSysProtocol(SysProtocol sysProtocol)
    {
        Long userId = SecurityUtils.getLoginUser().getBaseUser().getUserId();
        sysProtocol.setUpdateBy(userId.toString());
        sysProtocol.setUpdateTime(DateUtils.getNowDate());
        return sysProtocolMapper.updateSysProtocol(sysProtocol);
    }

    /**
     * 批量删除声明与协议内容
     * 
     * @param ids 需要删除的声明与协议内容主键
     * @return 结果
     */
    @Override
    public int deleteSysProtocolByIds(String[] ids)
    {
        return sysProtocolMapper.deleteSysProtocolByIds(ids);
    }

    /**
     * 删除声明与协议内容信息
     * 
     * @param id 声明与协议内容主键
     * @return 结果
     */
    @Override
    public int deleteSysProtocolById(String id)
    {
        return sysProtocolMapper.deleteSysProtocolById(id);
    }
}
