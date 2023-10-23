package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysArea;
import com.ruoyi.system.domain.vo.SysAreaVO;

/**
 * 省市区Mapper接口
 * 
 * @author climber
 * @date 2023-10-24
 */
public interface SysAreaMapper 
{
    /**
     * 查询省市区
     * 
     * @param id 省市区主键
     * @return 省市区
     */
    public SysArea selectSysAreaById(Long id);

    /**
     * 查询省市区列表
     * 
     * @param sysArea 省市区
     * @return 省市区集合
     */
    public List<SysArea> selectSysAreaList(SysArea sysArea);

    /**
     * 新增省市区
     * 
     * @param sysArea 省市区
     * @return 结果
     */
    public int insertSysArea(SysArea sysArea);

    /**
     * 修改省市区
     * 
     * @param sysArea 省市区
     * @return 结果
     */
    public int updateSysArea(SysArea sysArea);

    /**
     * 删除省市区
     * 
     * @param id 省市区主键
     * @return 结果
     */
    public int deleteSysAreaById(Long id);

    /**
     * 批量删除省市区
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysAreaByIds(Long[] ids);

    /**
     * 查询区域下拉框
     * @param area
     * @return
     */
    public List<SysAreaVO> selectSysAreaListCombo(SysArea area);
}
