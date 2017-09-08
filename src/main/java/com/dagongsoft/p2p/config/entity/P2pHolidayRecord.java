package com.dagongsoft.p2p.config.entity;

import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 假期管理Entity
 *
 * @author Quincy
 * @version 2017-02-08
 */
public class P2pHolidayRecord extends DataEntity<P2pHolidayRecord> {

    private static final long serialVersionUID = 1L;
    private Date holiday;        // holiday
    private String getYear;
    private String month;
    private String getDay;
    private String operationPerson;
    private Date operateTime;

    public String getOperationPerson() {
        return operationPerson;
    }

    public void setOperationPerson(String operationPerson) {
        this.operationPerson = operationPerson;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getGetDay() {
        return getDay;
    }

    public void setGetDay(String getDay) {
        this.getDay = getDay;
    }


    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getGetYear() {
        if (this.getYear == null) {
            Calendar now = Calendar.getInstance();
            this.getYear = String.valueOf(now.get(Calendar.YEAR));
        }
        return getYear;
    }

    public void setGetYear(String getYear) {
        this.getYear = getYear;
    }

    public P2pHolidayRecord() {
        super();
    }

    public P2pHolidayRecord(String id) {
        super(id);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getHoliday() {
        return holiday;
    }

    public void setHoliday(Date holiday) {
        this.holiday = holiday;
    }

}