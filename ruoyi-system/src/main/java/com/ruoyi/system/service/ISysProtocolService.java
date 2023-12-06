package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysProtocol;

import java.util.List;

/**
 * 声明与协议内容Service接口
 * 
 * @author climber
 * @date 2023-12-04
 */
public interface ISysProtocolService 
{
    /**
     * 查询声明与协议内容
     * 
     * @param id 声明与协议内容主键
     * @return 声明与协议内容
     */
    SysProtocol selectSysProtocolById(String id);

    /**
     * 查询声明与协议内容列表
     * 
     * @param sysProtocol 声明与协议内容
     * @return 声明与协议内容集合
     */
    List<SysProtocol> selectSysProtocolList(SysProtocol sysProtocol);

    /**
     * 新增声明与协议内容
     * 
     * @param sysProtocol 声明与协议内容
     * @return 结果
     */
    int insertSysProtocol(SysProtocol sysProtocol);

    /**
     * 修改声明与协议内容
     * 
     * @param sysProtocol 声明与协议内容
     * @return 结果
     */
    int updateSysProtocol(SysProtocol sysProtocol);

    /**
     * 批量删除声明与协议内容
     * 
     * @param ids 需要删除的声明与协议内容主键集合
     * @return 结果
     */
    int deleteSysProtocolByIds(String[] ids);

    /**
     * 删除声明与协议内容信息
     * 
     * @param id 声明与协议内容主键
     * @return 结果
     */
    int deleteSysProtocolById(String id);
}
