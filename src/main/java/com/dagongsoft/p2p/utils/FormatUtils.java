package com.dagongsoft.p2p.utils;

import java.text.DecimalFormat;

/**
 * 格式转换工具类
 *
 * @author DAGONG
 */
public class FormatUtils {

    private static DecimalFormat df1 = new DecimalFormat("#,###");
    private static DecimalFormat df2 = new DecimalFormat("#,###.##");

    /**
     * 将数字转换成#,###格式的字符串
     *
     * @param amount
     * @return
     */
    public static String amountFormat(double amount) {
        return df1.format(amount);
    }

    /**
     * 将数字转换成#,###.00格式的字符串
     *
     * @param amount
     * @return
     */
    public static String amountDecimalFormat(double amount) {
        return df2.format(amount);
    }
}
