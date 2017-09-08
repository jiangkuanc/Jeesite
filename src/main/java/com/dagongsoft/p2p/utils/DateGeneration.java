package com.dagongsoft.p2p.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 前台输入日期转换工具类
 *
 * @author DAGONG
 */
public class DateGeneration {
    private String YYYY;
    private String MM;
    private String DD;


    public String getYYYY() {
        return YYYY;
    }


    public void setYYYY(String yYYY) {
        YYYY = yYYY;
    }


    public String getMM() {
        return MM;
    }


    public void setMM(String mM) {
        MM = mM;
    }


    public String getDD() {
        return DD;
    }


    public void setDD(String dD) {
        DD = dD;
    }


    /**
     * 将页面日期转换为Date类型
     *
     * @param dateGeneration
     * @return
     */
    public static Date createDate(DateGeneration dateGeneration) {
        Date date = null;
        try {
            String dateStr = dateGeneration.getYYYY() + "-" + dateGeneration.getMM() + "-" + dateGeneration.getDD();
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date = sdf.parse(dateStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }
}
