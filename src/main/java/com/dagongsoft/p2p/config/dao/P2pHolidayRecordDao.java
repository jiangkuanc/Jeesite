package com.dagongsoft.p2p.config.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.config.entity.P2pHolidayRecord;

/**
 * 假期管理DAO接口
 *
 * @author Quincy
 * @version 2017-02-08
 */
@MyBatisDao
public interface P2pHolidayRecordDao extends CrudDao<P2pHolidayRecord> {

    //根据年份查询节假日
    public List<P2pHolidayRecord> findHoildayByYear(@Param("thisYear") Integer thisYear, @Param("nextYear") Integer nextYear);

    /**
     * 查询指定年每个月的节假日
     *
     * @author Chace
     */
    public List<P2pHolidayRecord> getHoildays(P2pHolidayRecord p2pHolidayRecord);
}