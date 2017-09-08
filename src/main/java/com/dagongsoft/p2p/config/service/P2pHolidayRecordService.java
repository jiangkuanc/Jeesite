package com.dagongsoft.p2p.config.service;

import java.util.List;


import com.dagongsoft.p2p.config.entity.P2pHolidayRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 假期管理Service
 *
 * @author Quincy
 * @version 2017-02-08
 */
public interface P2pHolidayRecordService {

    public P2pHolidayRecord get(String id);

    public List<P2pHolidayRecord> findList(P2pHolidayRecord p2pHolidayRecord);

    public Page<P2pHolidayRecord> findPage(Page<P2pHolidayRecord> page, P2pHolidayRecord p2pHolidayRecord);

    public void save(P2pHolidayRecord p2pHolidayRecord);

    public void delete(P2pHolidayRecord p2pHolidayRecord);

    /**
     * 定时器：融资项目在待确认评级结果阶段大于5个工作日
     * 没有进行选择，则自动选择无异议
     */
    public void autoSelectReportResult1();


    /**
     * 定时器： 评级项目在待确认评级结果阶段大于5个工作日
     * 没有进行选择，则自动选择无异议
     */
    public void autoSelectReportResult2();

    /**
     * 查询指定年每个月的节假日
     *
     * @author Chace
     */
    public List<P2pHolidayRecord> getHoildays(P2pHolidayRecord p2pHolidayRecord);

}