package com.dagongsoft.p2p.utils;

import java.util.Date;

public class CalculateRepayWarnUtils {


    /**
     * 将Map中的数据转换为Double类型
     *
     * @return
     */
    public static Double convertFromMap(Object obj) {
        if (obj == null) {
            throw new NullPointerException(CalculateRepayWarnUtils.class
                    + "#convertFromMap" + "异常");
        }
        if (obj.getClass() == Double.class) {
            // System.out.println(obj.getClass());
            return (Double) obj;
        } else if (obj.getClass() == Date.class) {
            // System.out.println((obj.getClass()));
            return -1.0d;
        } else if (obj.getClass() == String.class) {
            // System.out.println(obj.getClass());
            return Double.parseDouble((String) obj);
        } else {
            return null;
        }
    }
}
